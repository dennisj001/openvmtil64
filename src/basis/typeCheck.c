
#include "../include/cfrtil64.h"

Boolean
TSI_TypeCheck_NonTypeVariableSigCode ( TSI * tsi, Word * word, byte sigCode )
{
    uint64 attribute = Tsi_ConvertTypeSigCodeToAttribute ( sigCode ) ;
    if ( ! ( word->CAttribute & attribute ) )
    {
        if ( ( word->CAttribute & ( PARAMETER_VARIABLE | NAMESPACE_VARIABLE | LOCAL_VARIABLE | REGISTER_VARIABLE | T_LISP_SYMBOL ) ) //| OBJECT_FIELD ) )
            || ( ! ( word->CAttribute & ( T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT | T_VOID ) ) )
            || ( sigCode == 'A' ) || ( sigCode == '_' ) || ( sigCode == 'U' )
            || ( word->CAttribute & (T_ANY|T_UNDEFINED) )
            || ( ( sigCode == 'I' ) && ( word->CAttribute & ( OBJECT | T_BOOLEAN ) ) ) ) // same type "kind"
        {
            // infering that ...
            word->CAttribute |= attribute ;
            if ( tsi->WordBeingCompiled && ( word->CAttribute & PARAMETER_VARIABLE ) )
                tsi->WordBeingCompiled->W_TypeSignature [word->Index - 1] = sigCode ;
            //return false ; // it will fall thru to return false
        }
        else return true ;
    }
    return false ;
}

Boolean
TSI_TypeCheck_TypeVariableSigCode ( TSI * tsi, Word * word0, Word * word1 )
{
    // word1 correlates with the type variable so it can anything
    // word0 is closer to top of stack than word1; word1 is lower in the stack than word 0
    // eg. if word0 is TOS word1 would be NOS
    // word1 was parsed and pushed before word0
    // in the case of equal ('=' : word1 = word0 , word1 word0 = , word0 word1 store) word1 can be a type variable and word0 can be any fixed type
    //CfrTil_TypeStatus_Print ( word, tsi->actualTypeRecorded ) ;
    uint64 word0_CAttribute = ( word0->CAttribute & ( T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT ) ) ;
    if ( word0_CAttribute )
    {
        // we infer that ...
        word1->CAttribute |= word0_CAttribute ;
        if ( tsi->WordBeingCompiled && ( word1->CAttribute & PARAMETER_VARIABLE ) )
            tsi->WordBeingCompiled->W_TypeSignature [word1->Index - 1] = Tsi_Convert_Word_TypeAttributeToTypeCode ( word0 ) ;
    }
    return false ;
}

Boolean
TSI_TypeCheckAndInfer ( TSI * tsi )
{
    int64 depth = 0, i ;
    Word * word ;
    for ( tsi->OpWord_ReturnsACodedValue_Flag = false, i = 0 ;
        ( ( tsi->OpWordTypeSignature[i] ) && ( tsi->OpWordTypeSignature[i] != '.' ) && ( tsi->OpWordTypeSignature[i] != '_' ) ) ; i ++ )
    {
        if ( tsi->OpWordTypeSignature [i + 1] == '.' )
        {
            tsi->OpWordReturnSignatureLetterCode = tsi->OpWordTypeSignature [i + 2] ;
            if ( ( tsi->OpWordReturnSignatureLetterCode != 'V' ) && ( tsi->OpWordReturnSignatureLetterCode != '_' ) ) tsi->OpWord_ReturnsACodedValue_Flag = true ;
        }
    }
    tsi->OpWordTypeSignatureLength = i ;
    tsi->WordBeingCompiled = Compiling ? _CfrTil_->CurrentWordBeingCompiled : 0 ;
    if ( tsi->WordBeingCompiled && ( ! tsi->WordBeingCompiled->W_TypeSignature [0] ) )
        strcpy ( tsi->WordBeingCompiled->W_TypeSignature, "_______" ) ;
    depth = ( tsi->OpWordTypeSignatureLength < tsi->TypeStackDepth ) ? tsi->OpWordTypeSignatureLength : tsi->TypeStackDepth ;
    for ( i = 0 ; ( i < depth ) ; i ++ )
    {
        word = ( Word * ) tsi->TypeWordStack->StackPointer [ - ( depth - ( i + 1 ) ) ] ; // we are starting lower in the stack and working up
        TSI_UpdateActualTypeStackRecordingBuffer ( tsi, word, i ) ;
        if ( ! tsi->TypeErrorStatus ) // in any case UpdateBuffers
        {
            switch ( tsi->OpWordTypeSignature [i] )
            {
                case 'X':
                {
                    // word1 correlates with the type variable so it can anything
                    // word0 is closer to top of stack than word1; word1 is lower in the stack than word 0
                    // word1 was parsed and pushed before word0
                    // in the case of equal ('=' : word1 = word0 , word1 word0 = , word0 word1 store) word1 can be a type variable and word0 can be any fixed type
                    i ++ ;
                    Word * word1 = word, *word0 = ( Word * ) tsi->TypeWordStack->StackPointer [ - ( depth - ( i + 1 ) ) ] ;
                    if ( ! word0 ) word0 = ( Word * ) tsi->TypeWordStack->StackPointer [ - ( depth - ( i - 1 ) ) ] ;
                    TSI_UpdateActualTypeStackRecordingBuffer ( tsi, word0, i ) ;
                    //CfrTil_TypeStatus_Print ( tsi ) ;
                    if ( TSI_TypeCheck_TypeVariableSigCode ( tsi, word0, word1 ) ) tsi->TypeErrorStatus = true ;
                    break ;
                }
                case 'A': case 'N': case 'I': case 'S': case 'B': case 'O': case 'V': case '_':
                {
                    //CfrTil_TypeStatus_Print ( tsi ) ;
                    if ( TSI_TypeCheck_NonTypeVariableSigCode ( tsi, word, tsi->OpWordTypeSignature [i] ) ) tsi->TypeErrorStatus = true ;
                    break ;
                }
                default: break ;
            }
        }
    }
    if ( ( ! tsi->TypeErrorStatus ) && ( ! GetState ( _Compiler_, ( DOING_BEFORE_AN_INFIX_WORD | DOING_BEFORE_A_PREFIX_WORD ) ) ) )
        _Stack_DropN ( tsi->TypeWordStack, depth ) ;
    if ( tsi->OpWord_ReturnsACodedValue_Flag ) //&& (!(opWord->CAttribute & KEYWORD)))
    {
        Word * opWordCopy = _CopyDuplicateWord ( tsi->OpWord, 0 ) ;
        opWordCopy->CAttribute |= Tsi_ConvertTypeSigCodeToAttribute ( tsi->OpWordReturnSignatureLetterCode ) ;
        CfrTil_TypeStackPush ( opWordCopy ) ;
        //Word_Recycle ( pword ) ; // recycle the list at reset instead
    }
    //if ( tsi->TypeErrorStatus ) return tsi->ActualTypeStackRecordingBuffer ;
    //else return false ;
    return tsi->TypeErrorStatus ;
}

TSI *
TSI_Init ( TSI *tsi, Word* opWord, int64 depth )
{
    tsi->TypeWordStack = _CfrTil_->TypeWordStack ;
    tsi->OpWord = opWord ;
    tsi->OpWordTypeSignature = opWord->W_TypeSignature ;
    tsi->TypeStackDepth = depth ;
    tsi->TypeErrorStatus = false ;
}

TSI *
TSI_New ( Word* opWord, int64 depth, uint64 allocType )
{
    TypeStatusInfo *tsi = ( TypeStatusInfo * ) Mem_Allocate ( sizeof (TypeStatusInfo ), allocType ) ;
    tsi = TSI_Init ( tsi, opWord, depth ) ;
    return tsi ;
}

void
CfrTil_Typecheck ( Word * opWord )
{
    int64 depth = 0 ;
    if ( GetState ( _CfrTil_, TYPECHECK_ON ) && ( depth = Stack_Depth ( _CfrTil_->TypeWordStack ) ) && ( opWord->W_TypeSignature[0] ) )
    {
        TSI * tsi = TSI_New ( opWord, depth, COMPILER_TEMP ) ;
        TSI_TypeCheckAndInfer ( tsi ) ;
        if ( tsi->TypeErrorStatus ) TSI_ShowTypeErrorStatus ( tsi ) ;
    }
}

void
TSI_TypeStatus_Print ( TSI *tsi )
{
    byte buffer [128] ;
    buffer [0] = 0 ;
    _Printf ( ( byte* ) "\nopWord %s.%s :: type expected :: %s :: recorded : %s : at %s",
        tsi->OpWord->S_ContainingNamespace ? tsi->OpWord->S_ContainingNamespace->Name : ( byte* ) "<literal>",
        tsi->OpWord->Name, Word_ExpandTypeLetterSignature ( tsi->OpWord, 1 ), tsi->ActualTypeStackRecordingBuffer, Context_Location ( ) ) ;
}

void
TSI_ShowTypeErrorStatus ( TSI *tsi )
{
    CfrTil_ShowInfo ( tsi->OpWord, "apparent type mismatch", 0 ) ;
    TSI_TypeStatus_Print ( tsi ) ;
    if (( _Q_->Verbosity > 1 ) || GetState ( _CfrTil_, DBG_TYPESTACK_ON )) 
    {
        CfrTil_TypeStackPrint ( ) ;
        Pause ( ) ;
        Warning ( "Apparent TypeMismatch : ", Context_Location ( ), 0 ) ;
    }
    //CfrTil_TypeStackReset ( ) ;
}

void
TSI_UpdateActualTypeStackRecordingBuffer ( TSI * tsi, Word * word, Boolean separatorFlag )
{
    if ( word )
    {
        tsi->ExpandedTypeCodeBuffer [0] = 0 ; // init
        byte wtlc = Tsi_ConvertTypeAttributeToTypeLetterCode ( word->CAttribute ) ;
        byte *etlc = Tsi_ExpandTypeLetterCode ( wtlc, tsi->ExpandedTypeCodeBuffer ) ;
        if ( separatorFlag ) strcat ( tsi->ActualTypeStackRecordingBuffer, ". " ) ;
        strcat ( tsi->ActualTypeStackRecordingBuffer, etlc ) ;
    }
}

byte *
Tsi_ExpandTypeLetterCode ( byte typeCode, byte * buffer )
{
    switch ( typeCode )
    {
        case 'I':
        {
            strcpy ( buffer, "Integer " ) ;
            break ;
        }
        case 'X':
        {
            strcpy ( buffer, "TypeVariable " ) ; // or a type unknown or unset as of now
            break ;
        }
        case 'S':
        {
            strcpy ( buffer, "String " ) ;
            break ;
        }
        case 'N':
        {
            strcpy ( buffer, "BigNum " ) ;
            break ;
        }
        case 'B':
        {
            strcpy ( buffer, "Boolean " ) ;
            break ;
        }
        case 'O':
        {
            strcpy ( buffer, "Object " ) ;
            break ;
        }
        case 'A':
        {
            strcpy ( buffer, "Any " ) ; // Any fixed, non variable type
            break ;
        }
        case '_':
        {
            strcpy ( buffer, "Undefined " ) ; // == Any or TypeVariable
            break ;
        }
        case 'V':
        {
            strcpy ( buffer, "Void " ) ;
            break ;
        }
        case '.':
        {
            strcpy ( buffer, "-> " ) ;
            //tsi->dot = true ;
            break ;
        }
        default: break ;
    }
    return buffer ;
}

int64
Word_TypeSignatureLength ( Word * word )
{
    byte * ts = word->W_TypeSignature ;
    int64 slts = Strlen ( ts ), length = 0, i, a ;
    if ( slts == 7 )
    {
        for ( a = 7, i = 6 ; ( ts[i] && ( ts[i] == '_' ) ) ; i --, a -- ) ;
        length = 7 - a ;
    }
    else length = slts ;
    return length ;
}

byte *
Word_TypeSignature ( Word * word, byte * buffer )
{
    if ( word->CAttribute & T_INT ) strcat ( buffer, "Integer " ) ;
    else if ( word->CAttribute & T_STRING ) strcat ( buffer, "String " ) ;
    else if ( word->CAttribute & T_BIG_NUM ) strcat ( buffer, "BigNum " ) ;
    else if ( word->CAttribute & T_BOOLEAN ) strcat ( buffer, "Boolean " ) ;
    else if ( word->CAttribute & OBJECT ) strcat ( buffer, "Object " ) ;
    else if ( word->CAttribute & T_ANY ) strcat ( buffer, "Any " ) ;
    return buffer ;
}

byte *
Word_ExpandTypeLetterSignature ( Word * word, Boolean showReturnValue )
{
    byte tsLetterCode, *ts = word->W_TypeSignature, abuffer [64] ;
    byte *buffer = Buffer_Data_Cleared ( _CfrTil_->StrCatBuffer ) ;
    int64 i, tsl = Word_TypeSignatureLength ( word ) ;
    //Boolean showFollowingDot = true ;
    buffer [0] = 0 ; // init
    for ( i = 0 ; i < tsl ; i ++ )
    {
        tsLetterCode = ts [i] ;
        Tsi_ExpandTypeLetterCode ( tsLetterCode, abuffer ) ;
        if ( ( tsLetterCode != '_' ) && abuffer[0] )
        {
            if ( String_Equal ( abuffer, "-> " ) )
            {
                if ( showReturnValue ) strcat ( buffer, abuffer ) ;
                //showFollowingDot = false ;
                continue ;
            }
            strcat ( buffer, abuffer ) ;
            if ( ((i + 1) == tsl ) || ( ( ts [i + 1] == '.' ) || ( ts [i + 1] == '_' ) ) ) continue ;
            else strcat ( buffer, ". " ) ; // == cartesian product symbol
        }
        else break ;
    }
    return buffer ;
}

uint64
Tsi_ConvertTypeSigCodeToAttribute ( byte signatureCode )
{
    switch ( signatureCode )
    {
        case 'I': return T_INT ;
        case 'A': return T_ANY ;
        case 'O': return OBJECT ;
        case 'B': return T_BOOLEAN ;
        case 'V': return T_VOID ;
        case 'N': return T_BIG_NUM ;
        case 'S': return T_STRING ;
        case 'X': return T_TYPE_VARIABLE ;
        case '_': return T_UNDEFINED ;
    }
}

byte
Tsi_ConvertTypeAttributeToTypeLetterCode ( uint64 attribute )
{
    if ( attribute & T_INT ) return 'I' ;
    else if ( attribute & T_STRING ) return 'S' ;
    else if ( attribute & T_BIG_NUM ) return 'N' ;
    else if ( attribute & T_BOOLEAN ) return 'B' ;
    else if ( attribute & OBJECT ) return 'O' ;
    else if ( attribute & T_VOID ) return 'V' ;
    else if ( attribute & T_UNDEFINED ) return '_' ;
    else if ( attribute & T_ANY ) return 'A' ;
    else return '_' ;
}

byte
Tsi_Convert_Word_TypeAttributeToTypeCode ( Word * word )
{
    byte code = Tsi_ConvertTypeAttributeToTypeLetterCode ( word->CAttribute ) ;
    if ( code ) return code ;
    else if ( word->CAttribute2 & T_TYPE_VARIABLE ) return 'X' ;
    else if ( word->CAttribute2 & T_ANY_FIXED_TYPE ) return 'A' ;
    else return '_' ;
}

void
CfrTil_TypeStackPush ( Word * word )
{
    if ( GetState ( _CfrTil_, TYPECHECK_ON ) ) Stack_Push ( _CfrTil_->TypeWordStack, ( int64 ) word ) ;
}

void
CfrTil_TypeStack_SetTop ( Word * word )
{
    if ( GetState ( _CfrTil_, TYPECHECK_ON ) ) Stack_SetTop ( _CfrTil_->TypeWordStack, ( int64 ) word ) ;
}

void
_CfrTil_TypeStackReset ( )
{
#if 0 // while not this ??
    Stack * stack = _CfrTil_->TypeWordStack ;
    int64 i, i0 = Stack_Depth ( stack ) ;
    while ( i = Stack_Depth ( stack ) )
    {
        Word * tword = ( Word * ) Stack_Pop ( stack ) ;
        _CheckRecycleWord ( tword ) ;
    }
#endif    
    Stack_Init ( _CfrTil_->TypeWordStack ) ;
}

void
CfrTil_TypeStackPrint ( )
{
    Stack_Print ( _CfrTil_->TypeWordStack, "TypeWordStack", 1 ) ;
}

void
CfrTil_TypeStackReset ( )
{
    if ( GetState ( _CfrTil_, TYPECHECK_ON ) ) _CfrTil_TypeStackReset ( ) ;
}

Word *
CfrTil_TypeStack_Pop ( )
{
    if ( GetState ( _CfrTil_, TYPECHECK_ON ) && Stack_Depth ( _CfrTil_->TypeWordStack ) )
    {
        Word * tword = ( Word * ) Stack_Pop ( _CfrTil_->TypeWordStack ) ;
        return tword ;
    }

}

Word *
CfrTil_TypeStack_Drop ( )
{
    if ( GetState ( _CfrTil_, TYPECHECK_ON ) && Stack_Depth ( _CfrTil_->TypeWordStack ) )
    {
        _Stack_Drop ( _CfrTil_->TypeWordStack ) ;    
    }
}

void
CfrTil_TypeStack_Dup ( )
{
    if ( GetState ( _CfrTil_, TYPECHECK_ON ) )
    {
        if ( Stack_Depth ( _CfrTil_->TypeWordStack ) ) Stack_Dup ( _CfrTil_->TypeWordStack ) ;
        else CfrTil_TypeStackPush ( CfrTil_WordList ( 0 ) ) ;
    }
}

void
CfrTil_TypeCheckOn ( )
{
    SetState ( _CfrTil_, TYPECHECK_ON, true ) ;
}

void
CfrTil_TypeCheckOff ( )
{
    CfrTil_TypeStackReset ( ) ;
    SetState ( _CfrTil_, TYPECHECK_ON, false ) ;
}

#if 0

byte *
TSI_Expand_WordTypeLetterSignature ( TSI *tsi, Word * word, Boolean flag )
{
    byte typeSignatureLetterCode, *ts = word->W_TypeSignature, abuffer [64] ; // expanded type signature letter code
    int64 i, tsl = Word_TypeSignatureLength ( ts ) ;
    tsi->PrintBuffer [0] = 0 ; // init
    //for ( tsi->OpWord_ReturnsACodedValue_Flag = false, i = 0 ; typeSignatureLetterCode = ts [i] ; i ++ )
    for ( tsi->OpWord_ReturnsACodedValue_Flag = false, i = 0 ; i < tsl ; i ++ )
    {
        typeSignatureLetterCode = ts [i] ;
        Tsi_ExpandTypeLetterCode ( typeSignatureLetterCode, abuffer ) ;
        if ( abuffer[0] )
        {
            if ( String_Equal ( abuffer, "-> " ) ) tsi->OpWord_ReturnsACodedValue_Flag = true ;
            if ( tsi->OpWord_ReturnsACodedValue_Flag && flag ) break ;
            strcat ( tsi->PrintBuffer, abuffer ) ;
            //if ( ( ! tsi->OpWord_ReturnsACodedValue_Flag ) && ( ts [i + 1] != '.' ) ) strcat ( tsi->PrintBuffer, ". " ) ; // cartesian product symbol
            if ( ( ! tsi->OpWord_ReturnsACodedValue_Flag ) && ( i < ( tsl - 1 ) ) ) strcat ( tsi->PrintBuffer, ". " ) ; // cartesian product symbol
        }
        else break ;
    }
    return tsi->PrintBuffer ;
}
#endif



