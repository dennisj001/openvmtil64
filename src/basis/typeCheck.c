
#include "../include/cfrtil64.h"

// the logic here is still in an alpha prototype stage

Boolean
TSI_TypeCheck_NonTypeVariableSigCode ( TSI * tsi, Word * stackWord, int64 ti )
{
    byte sigCode = tsi->OpWordTypeSignature [ti] ;
    if ( stackWord && stackWord->Name )
    {
        uint64 attribute = Tsi_ConvertTypeSigCodeToAttribute ( sigCode ) ;
        if ( ! ( stackWord->CAttribute & attribute ) )
        {
            if ( ( stackWord->CAttribute & ( PARAMETER_VARIABLE | NAMESPACE_VARIABLE | LOCAL_VARIABLE | REGISTER_VARIABLE | T_LISP_SYMBOL | DOBJECT ) )
                || ( ! ( stackWord->CAttribute & ( T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT | T_VOID ) ) )
                || ( sigCode == 'A' ) || ( sigCode == '_' ) || ( sigCode == 'U' )
                || ( stackWord->CAttribute2 & ( T_ANY | T_UNDEFINED ) )
                || ( ( sigCode == 'I' ) && ( stackWord->CAttribute & ( OBJECT | OBJECT_FIELD | T_BOOLEAN ) ) ) ) // same type "kind"
            {
                // this is only initial alpha prototype logic, ie. needs to be refined/changed !!??!!
                // infering that ...
                stackWord->CAttribute |= attribute ;
                if ( ! ( ( sigCode == 'I' ) && ( stackWord->CAttribute & ( OBJECT | OBJECT_FIELD | T_BOOLEAN ) ) ) ) // same type "kind" for now ; should be more precise ??
                {
                    if ( ( tsi->WordBeingCompiled && ( stackWord->CAttribute & PARAMETER_VARIABLE ) ) ) //&& ( ! (tsi->WordBeingCompiled->W_TypeSignatureString [stackWord->Index - 1])))
                        tsi->WordBeingCompiled->W_TypeSignatureString [stackWord->Index - 1] = sigCode ;
                    //tsi->WordBeingCompiled->W_TypeSignatureString [ti] = sigCode ;
                }
#if 0                
                if ( tsi->WordBeingCompiled && ( stackWord->CAttribute & ( OBJECT | OBJECT_FIELD ) ) ) //( sigCode == 'O' ) 
                {
                    tsi->WordBeingCompiled->W_TypeObjectsNamespaces [ti] = stackWord->TypeNamespace ; // ??
                    //tsi->WordBeingCompiled->W_TypeSignatureString [ti] = sigCode ;
                }
#endif                
                //return false ; // it will fall thru to return false
            }
                //else if ( ( word->CAttribute & OBJECT_FIELD ) ) {} // pass for now - return false = no type error
            else return tsi->TypeErrorStatus = true ; ; // type error
        }
    }
    return tsi->TypeErrorStatus = false ;
}

Boolean
TSI_TypeCheck_TypeVariableSigCode ( TSI * tsi, Word * stackWord0, Word * stackWord1 )
{
    // word1 correlates with the type variable so it can anything
    // word0 is closer to top of stack than word1; word1 is lower in the stack than word 0
    // eg. if word0 is TOS word1 would be NOS
    // word1 was parsed and pushed before word0
    // in the case of equal ('=' : word1 = word0 , word1 word0 = , word0 word1 store) word1 can be a type variable and word0 can be any fixed type
    //CfrTil_TypeStatus_Print ( word, tsi->actualTypeRecorded ) ;
    uint64 stackWord0_CAttribute ;
    if ( stackWord1 && stackWord0 && stackWord1->Name && stackWord0->Name )
    {
        stackWord0_CAttribute = ( stackWord0->CAttribute & ( T_BYTE | T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT | T_ANY | T_UNDEFINED | T_VOID ) ) ;
        if ( stackWord0_CAttribute )
        {
            if ( ( stackWord1->CAttribute2 & (T_ANY|T_TYPE_VARIABLE|T_UNDEFINED) ) 
                || ( ! ( stackWord1->CAttribute & ( T_BYTE | T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT | T_VOID ) ) ) )
            {
                // we infer that ...
                stackWord1->CAttribute |= stackWord0_CAttribute ;
                if ( stackWord1->Name && tsi->WordBeingCompiled && ( stackWord1->CAttribute & PARAMETER_VARIABLE ) )
                {
                    tsi->WordBeingCompiled->W_TypeSignatureString [stackWord1->Index - 1] = Tsi_Convert_Word_TypeAttributeToTypeLetterCode ( stackWord0 ) ;
                    if ( stackWord0->CAttribute & OBJECT )
                        tsi->WordBeingCompiled->W_TypeObjectsNamespaces [stackWord1->Index - 1] = stackWord0->TypeNamespace ; // ??
                }
            }
            else if ( ( ! ( stackWord1->CAttribute & stackWord0_CAttribute ) ) && ( ! ( stackWord0->CAttribute & ( T_ANY | T_UNDEFINED ) ) ) ) 
                tsi->TypeErrorStatus = true ;
        }
    }
    return tsi->TypeErrorStatus = false ; ;
}

Boolean
TSI_TypeCheckAndInfer ( TSI * tsi )
{
    int64 tsl, si, ti ;
    Word * stackWord, *stackWord0, *stackWord1 ;
    for ( tsi->OpWord_ReturnsACodedValue_Flag = false, si = 0 ; si < 7 ; si ++ )
    {
        if ( tsi->OpWordTypeSignature [si] == '.' )
        {
            tsi->OpWordReturnSignatureLetterCode = tsi->OpWordTypeSignature [si + 1] ;
            if ( ( tsi->OpWordReturnSignatureLetterCode != 'V' ) && ( tsi->OpWordReturnSignatureLetterCode != '_' ) ) tsi->OpWord_ReturnsACodedValue_Flag = true ;
            break ;
        }
    }
    tsi->OpWordFunctionTypeSignatureLength = Word_TypeSignatureLength ( tsi->OpWord, 1 ) ;
    if ( tsi->WordBeingCompiled && ( ! tsi->WordBeingCompiled->W_TypeSignatureString [0] ) ) strncpy ( (char*) tsi->WordBeingCompiled->W_TypeSignatureString, "_______", 8 ) ;
    tsl = ( tsi->OpWordFunctionTypeSignatureLength <= tsi->TypeStackDepth ) ? tsi->OpWordFunctionTypeSignatureLength : tsi->TypeStackDepth ;
    if ( Is_DebugOn ) CfrTil_TypeStackPrint ( ) ;
    for ( si = 0, ti = tsl - 1 ; si < tsl ; si ++, ti -- ) // si stack index : 0 : top of stack ; ti type string index :  - 1 : zero indexed byte arrays
        // the type signature is a string that correlates with the typeStack in a rpn way where letters earlier in the string correlate with lower in the typeStack
        // so si = 0, stack index, correlates with the top of the type stack; ti = tsl - 1, type index, correlates with last character in the typeSignature code string
        // i've chosen to start with the top of the stack and its correlate in the type string
    {
        stackWord = ( Word * ) tsi->TypeWordStack->StackPointer [ - si ] ; // lower in stack (greater index) corresponds to earlier sigCode (lesser index)
        TSI_UpdateActualTypeStackRecordingBuffer ( tsi, stackWord, si ) ;
        if ( ! tsi->TypeErrorStatus )
        {
            if ( ( tsi->OpWordTypeSignature [ti] == 'X' ) && ( tsi->OpWord->CAttribute & ( CATEGORY_OP_EQUAL | CATEGORY_OP_STORE ) ) ) // 'X' is code for a type variable
            {
                // word1 correlates with the type variable so it can anything
                // word0 is closer to top of stack than word1; word1 is lower in the stack than word 0
                // word1 was parsed and pushed before word0
                // in the case of equal ('=' : word1 = word0 , word1 word0 = , word0 word1 store) word1 will be a type variable and word0 can be any fixed type
                if ( tsi->OpWord->CAttribute & CATEGORY_OP_EQUAL )
                {
                    stackWord0 = ( Word * ) tsi->TypeWordStack->StackPointer [ 0 ], stackWord1 = ( Word * ) tsi->TypeWordStack->StackPointer [ - 1 ] ; // this idea seems right ??
                }
                else stackWord1 = ( Word * ) tsi->TypeWordStack->StackPointer [ 0 ], stackWord0 = ( Word * ) tsi->TypeWordStack->StackPointer [ - 1 ] ; // this idea seems right ??
                TSI_TypeCheck_TypeVariableSigCode ( tsi, stackWord0, stackWord1 ) ;
            }
            else //  case 'A': case 'N': case 'I': case 'S': case 'B': case 'O': case 'V': case '_':
                //if ( TSI_TypeCheck_NonTypeVariableSigCode ( tsi, stackWord, tsi->OpWordTypeSignature [ti] ) ) tsi->TypeErrorStatus = true ;
                TSI_TypeCheck_NonTypeVariableSigCode ( tsi, stackWord, ti ) ;
        }
    }
    if ( Is_DebugOn ) TSI_TypeStatus_Print ( tsi ) ;
    if ( ( ! tsi->TypeErrorStatus ) && ( ! GetState ( _Compiler_, ( DOING_BEFORE_AN_INFIX_WORD | DOING_BEFORE_A_PREFIX_WORD ) ) ) )
    {
        _Stack_DropN ( tsi->TypeWordStack, tsl ) ;
        if ( tsi->OpWord_ReturnsACodedValue_Flag ) //&& (!(opWord->CAttribute & KEYWORD)))
        {
            Word * opWordCopy = _CopyDuplicateWord ( tsi->OpWord, 0 ) ;
            opWordCopy->CAttribute |= Tsi_ConvertTypeSigCodeToAttribute ( tsi->OpWordReturnSignatureLetterCode ) ;
            CfrTil_TypeStackPush ( opWordCopy ) ;
            //Word_Recycle ( pword ) ; // recycle the list at reset instead
        }
    }
    //if ( tsi->OpWord->CAttribute & ( CATEGORY_OP_EQUAL | CATEGORY_OP_STORE ) ) _CfrTil_TypeStackReset ( ) ;
    return tsi->TypeErrorStatus ;
}

TSI *
TSI_Init ( TSI *tsi, Word* opWord )
{
    tsi->TypeWordStack = _CfrTil_->TypeWordStack ;
    tsi->OpWord = opWord ;
    tsi->OpWordTypeSignature = opWord->W_TypeSignatureString ;
    tsi->TypeStackDepth = Stack_Depth ( tsi->TypeWordStack ) ; //depth ;
    tsi->TypeErrorStatus = false ;
    tsi->WordBeingCompiled = Compiling ? _CfrTil_->CurrentWordBeingCompiled : 0 ;
    return tsi ;
}

TSI *
TSI_New ( Word* opWord, uint64 allocType )
{
    TypeStatusInfo *tsi = ( TypeStatusInfo * ) Mem_Allocate ( sizeof (TypeStatusInfo ), allocType ) ;
    tsi = TSI_Init ( tsi, opWord ) ;
    return tsi ;
}

void
CfrTil_Typecheck ( Word * opWord )
{
    if ( GetState ( _CfrTil_, TYPECHECK_ON ) && ( opWord->W_TypeSignatureString[0] ) ) //&& ( depth = Stack_Depth ( _CfrTil_->TypeWordStack ) ) ) // 0 depth with a 
    {
        if ( ! GetState ( _Compiler_, ( DOING_BEFORE_AN_INFIX_WORD | DOING_BEFORE_A_PREFIX_WORD ) ) )
        {
            TSI * tsi = TSI_New ( opWord, COMPILER_TEMP ) ;
            TSI_TypeCheckAndInfer ( tsi ) ;
            if ( tsi->TypeErrorStatus ) TSI_ShowTypeErrorStatus ( tsi ) ;
        }
        //else if ( ( opWord->W_TypeSignatureString[0] == '.' ) && ( opWord->W_TypeSignatureString[0] != 'V' ) ) CfrTil_TypeStackPush ( Context_CurrentWord ( ) ) ;
        if ( Word_DoesTypeSignatureShowAReturnValue ( opWord ) ) CfrTil_TypeStackPush ( opWord ) ; //Context_CurrentWord ( ) ) ;
    }
}

void
TSI_TypeStatus_Print ( TSI *tsi )
{
    _Printf ( ( byte* ) "\n%s :: %s.%s :: type expected : %s :: type recorded : %s : %s", tsi->TypeErrorStatus ? "apparent type mismatch" : "type match",
        tsi->OpWord->S_ContainingNamespace ? tsi->OpWord->S_ContainingNamespace->Name : ( byte* ) "<literal>",
        tsi->OpWord->Name, Word_ExpandTypeLetterSignature ( tsi->OpWord, 1 ), tsi->ActualTypeStackRecordingBuffer, Context_Location ( ) ) ;
}

void
TSI_ShowTypeErrorStatus ( TSI *tsi )
{
    CfrTil_ShowInfo ( tsi->OpWord, ( byte* ) "apparent type mismatch", 0 ) ;
    TSI_TypeStatus_Print ( tsi ) ;
    if ( GetState ( _CfrTil_, DBG_TYPECHECK_ON ) )
    {
        CfrTil_TypeStackPrint ( ) ;
        //if ( _Q_->Verbosity > 1 ) 
        Pause ( ) ;
        Warning ( "Apparent TypeMismatch : ", Context_Location ( ), 0 ) ;
    }
    //CfrTil_TypeStackReset ( ) ;
}

void
TSI_UpdateActualTypeStackRecordingBuffer ( TSI * tsi, Word * word, Boolean prefixWithSeparatorFlag )
{
    byte *atsrb ;
    if ( word )
    {
        // we want to insert in at the beginning because of how they were pushed 
        byte _buffer [128], *buffer ;
        atsrb = tsi->ActualTypeStackRecordingBuffer ;
        _buffer[0] = 0 ;
        buffer = _buffer ;
        tsi->ExpandedTypeCodeBuffer [0] = 0 ; // init
        byte wtlc = Tsi_Convert_Word_TypeAttributeToTypeLetterCode ( word ) ;
        byte *etlc = Tsi_ExpandTypeLetterCode ( wtlc, tsi->ExpandedTypeCodeBuffer ) ;
        Strncat ( buffer, etlc, 127 ) ;
        if ( prefixWithSeparatorFlag ) strcat ( (char*) buffer, ". " ) ;
        //strncat ( buffer, tsi->ActualTypeStackRecordingBuffer, 128 ) ;
        //strncpy ( tsi->ActualTypeStackRecordingBuffer, buffer, 128 ) ;
        Strncat ( buffer, atsrb, 127 ) ;
        Strncpy ( atsrb, buffer, 127 ) ;
    }
}

byte *
Tsi_ExpandTypeLetterCode ( byte typeCode, byte * buffer )
{
    switch ( typeCode )
    {
        case 'I':
        {
            strcpy ( (char*) buffer, "Integer " ) ;
            break ;
        }
        case 'X':
        {
            strcpy ( (char*) buffer, "TypeVariable " ) ; // or a type unknown or unset as of now
            break ;
        }
        case 'S':
        {
            strcpy ( (char*) buffer, "String " ) ;
            break ;
        }
        case 'N':
        {
            strcpy ( (char*) buffer, "BigNum " ) ;
            break ;
        }
        case 'B':
        {
            strcpy ( (char*) buffer, "Boolean " ) ;
            break ;
        }
        case 'O':
        {
            strcpy ( (char*) buffer, "Object " ) ;
            break ;
        }
        case 'A':
        {
            strcpy ( (char*) buffer, "Any " ) ; // Any fixed, non variable type
            break ;
        }
        case '_':
        {
            strcpy ( (char*) buffer, "Undefined " ) ; // == Any or TypeVariable
            break ;
        }
        case 'V':
        {
            strcpy ( (char*) buffer, "Void " ) ;
            break ;
        }
        case '.':
        {
            strcpy ( (char*) buffer, "-> " ) ;
            //tsi->dot = true ;
            break ;
        }
        default: break ;
    }
    return buffer ;
}

void
Word_TypeChecking_SetInfoForAnObject ( Word * word )
{
    Word * cwbc = _CfrTil_->CurrentWordBeingCompiled ;
    cwbc->W_TypeSignatureString [word->Index - 1] = 'O' ;
    cwbc->W_TypeObjectsNamespaces [word->Index - 1] = word->TypeNamespace ;
}

byte
Word_DoesTypeSignatureShowAReturnValue ( Word * word )
{
    byte * ts = word->W_TypeSignatureString ;
    int64 i, slts = Strlen ( ts ) ;
    for ( i = 0 ; ( i > slts ) ; i ++ ) // -1 : 0 indexing byte array 
    {
        if ( ( ts[i] == '.' ) && ( ts[i+1] )  ) return ts[i+1] ; 
    }
    return false ;
}

int64
Word_TypeSignatureLength ( Word * word, Boolean numberOfParametersOnly )
{
    byte * ts = word->W_TypeSignatureString ;
    int64 slts = Strlen ( ts ), length, i, l0 ;
    for ( i = slts - 1 ; ( i > 0 ) ; i -- ) // -1 : 0 indexing byte array 
    {
        if ( ( ts[i] != '_' ) ) break ; //&& ( ts[i - 1] != '_' ) ) break ;
    }
    length = i + 1 ; // + 1 : back to string length
    if ( numberOfParametersOnly )
    {
        for ( l0 = length ; i >= 0 ; i -- )
        {
            if ( ts[i] == '.' )
            {
                l0 = ( i < 0 ) ? 0 : i ;
                break ;
            }
        }
        length = l0 ;
    }
    return length ;
}

byte *
Word_TypeSignature ( Word * word, byte * buffer )
{
    if ( word->CAttribute & T_INT ) Strncat ( buffer, "Integer ", 9 ) ;
    else if ( word->CAttribute & T_STRING ) Strncat ( buffer, "String ", 8 ) ;
    else if ( word->CAttribute & T_BIG_NUM ) Strncat ( buffer, "BigNum ", 8 ) ;
    else if ( word->CAttribute & T_BOOLEAN ) Strncat ( buffer, "Boolean ", 9 ) ;
    else if ( word->CAttribute2 & T_ANY ) Strncat ( buffer, "Any ", 5 ) ;
    else if ( word->CAttribute & OBJECT ) Strncat ( buffer, "Object ", 8 ) ;
    else Strncat ( buffer, "Undefined ", 11 ) ;
    return buffer ;
}

byte *
Word_ExpandTypeLetterSignature ( Word * word, Boolean parametersOnly )
{
    byte tsLetterCode, *ts = word->W_TypeSignatureString, abuffer [64] ;
    byte *buffer = Buffer_Data_Cleared ( _CfrTil_->StrCatBuffer ) ;
    int64 i, tsl = Word_TypeSignatureLength ( word, parametersOnly ) ;
    buffer [0] = 0 ; // init
    for ( i = 0 ; i < tsl ; i ++ )
    {
        tsLetterCode = ts [i] ;
        Tsi_ExpandTypeLetterCode ( tsLetterCode, abuffer ) ;
        if ( ( tsLetterCode != '_' ) && abuffer[0] )
        {
            if ( String_Equal ( abuffer, "-> " ) )
            {
                if ( ! parametersOnly ) strcat ( (char*) buffer, (char*) abuffer ) ;
                continue ;
            }
            strcat ( (char*) buffer, (char*) abuffer ) ;
            if ( ( ( i + 1 ) == tsl ) || ( ( ts [i + 1] == '.' ) || ( ts [i + 1] == '_' ) ) ) continue ;
            else strcat ( (char*) buffer, ". " ) ; // == cartesian product symbol
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
        case 'O': return OBJECT ;
        case 'B': return T_BOOLEAN ;
        case 'N': return T_BIG_NUM ;
        case 'S': return T_STRING ;
        case 'V': return T_VOID ;
        case 'A': return T_ANY ;
        case 'X': return T_TYPE_VARIABLE ;
        default : return T_UNDEFINED ;
    }
}

byte
Tsi_Convert_Word_TypeAttributeToTypeLetterCode ( Word * word )
{
    if ( word->CAttribute2 & T_ANY ) return 'A' ;
    else if ( word->CAttribute2 & T_TYPE_VARIABLE ) return 'X' ;
    else if ( word->CAttribute & T_BIG_NUM ) return 'N' ;
    else if ( word->CAttribute & T_STRING ) return 'S' ;
    else if ( word->CAttribute & T_INT ) return 'I' ;
    else if ( word->CAttribute & T_BOOLEAN ) return 'B' ;
    else if ( word->CAttribute & OBJECT ) return 'O' ;
    else if ( word->CAttribute & T_VOID ) return 'V' ;
        //else if ( word->CAttribute & T_UNDEFINED ) return '_' ;
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
    Stack_Print ( _CfrTil_->TypeWordStack, (byte*) "TypeWordStack", 1 ) ;
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
    return 0 ;
}

void
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

void
CfrTil_DbgTypecheckOff ( )
{
    SetState ( _CfrTil_, DBG_TYPECHECK_ON, false ) ;
}

void
CfrTil_DbgTypecheckOn ( )
{
    SetState ( _CfrTil_, DBG_TYPECHECK_ON, true ) ;
}

