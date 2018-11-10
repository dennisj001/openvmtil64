
#include "../include/cfrtil64.h"

typedef struct typeStatusInfo 
{
    int64 State ;
    Boolean TypeErrorStatus, dot ;
    Word * OpWord, *CompilingWord, *Word0, *Word1 ;
    int64 TypeStackDepth ;
    byte signatureCode, ExpandedTypeCodeBuffer [32], *actualTypeRecordedopWordTypeSignature ;
    byte buffer [128] ; //buffer [0] = 0 ;
    
    Boolean typeError ; //= false, dot = false ;
    int64 i, tsl, depth ; //= 0, 
    Word * pword, * word, *wordBeingCompiled ;
    byte expandedTypeCodeBuffer [32], *actualTypeRecorded, opWordTypeSignature ; 
} TypeStatusInfo, TSI ;

Boolean
CfrTil_TypeCheck_DoASignatureCode ( Word * word, Word * compilingWord, uint64 attribute, byte signatureCode )
{
    if ( ! ( word->CAttribute & attribute ) )
    {
        if ( ( word->CAttribute & ( PARAMETER_VARIABLE | NAMESPACE_VARIABLE | LOCAL_VARIABLE | REGISTER_VARIABLE | T_LISP_SYMBOL | OBJECT_FIELD ) )
            || ( ! ( word->CAttribute & ( T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT ) ) ) )
        {
            // infering that ...
            word->CAttribute |= attribute ;
            if ( compilingWord && ( word->CAttribute & PARAMETER_VARIABLE ) )
                compilingWord->W_TypeSignature [word->Index] = signatureCode ;
        }
        else return true ;
    }
    return false ;
}

#if 0

Boolean
CfrTil_TypeCheck_DoTypeVariable ( Word * word0, Word * word1, Word * compilingWord )
{
    // word1 correlates with the type variable so it can anything
    // word0 is closer to top of stack than word1; word1 is lower in the stack than word 0
    // eg. if word0 is TOS word1 would be NOS
    // word1 was parsed and pushed before word0
    // in the case of equal ('=' : word1 = word0 , word1 word0 = , word0 word1 store) word1 can be a type variable and word0 can be any fixed type
    //if ( ( word1->CAttribute & ( PARAMETER_VARIABLE | NAMESPACE_VARIABLE | LOCAL_VARIABLE | REGISTER_VARIABLE | T_LISP_SYMBOL | OBJECT_FIELD ) )
    //    || ( ! ( word1->CAttribute & ( T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT ) ) ) )
    {
        //if ( ! ( word1->CAttribute & ( NAMESPACE_VARIABLE | OBJECT_FIELD ) ) )
        {
            //uint64 word1_CAttribute = ( word1->CAttribute & ( T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT ) ) ;
            uint64 word0_CAttribute = ( word0->CAttribute & ( T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT ) ) ;
            //if ( word1_CAttribute && word0_CAttribute && ( word1_CAttribute != word0_CAttribute ) ) return true ; //type error
            //else 
            if ( word0_CAttribute )
            {
                // we infer that ...
                word1->CAttribute |= word0_CAttribute ;
                if ( compilingWord && ( word1->CAttribute & PARAMETER_VARIABLE ) )
                    compilingWord->W_TypeSignature [word1->Index - 1] = CfrTil_Convert_Word_TypeAttributeToTypeCode ( word0 ) ;
            }
        }
        return false ;
    }
    //else return true ;
}
#else

Boolean
CfrTil_TypeCheck_DoTypeVariable ( Word * word0, Word * word1, Word * compilingWord )
{
    // word1 correlates with the type variable so it can anything
    // word0 is closer to top of stack than word1; word1 is lower in the stack than word 0
    // eg. if word0 is TOS word1 would be NOS
    // word1 was parsed and pushed before word0
    // in the case of equal ('=' : word1 = word0 , word1 word0 = , word0 word1 store) word1 can be a type variable and word0 can be any fixed type
    //CfrTil_TypeStatus_Print ( word, actualTypeRecorded ) ;
    uint64 word0_CAttribute = ( word0->CAttribute & ( T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT ) ) ;
    if ( word0_CAttribute )
    {
        // we infer that ...
        word1->CAttribute |= word0_CAttribute ;
        if ( compilingWord && ( word1->CAttribute & PARAMETER_VARIABLE ) )
            compilingWord->W_TypeSignature [word1->Index - 1] = CfrTil_Convert_Word_TypeAttributeToTypeCode ( word0 ) ;
    }
    return false ;
}
#endif

void
UpdateBuffers ( Word * word, byte * expandedTypeCodeBuffer, byte * actualTypeRecorded, Boolean separatorFlag )
{
    if ( ! word ) return ; //CfrTil_TypeError ( opWord, 0 ) ;
    expandedTypeCodeBuffer [0] = 0 ; // init
    byte wtlc = CfrTil_ConvertTypeAttributeToTypeLetterCode ( word->CAttribute ) ;
    byte *etlc = CfrTil_ExpandTypeLetterCode ( wtlc, expandedTypeCodeBuffer ) ;
    if ( separatorFlag ) strcat ( actualTypeRecorded, ". " ) ;
    strcat ( actualTypeRecorded, etlc ) ;
}

byte *
_CfrTil_TypeCheckAndInfer ( Word * opWord, int64 stackDepth, byte * buffer )
{
    Boolean typeError = false, dot = false ;
    int64 depth = 0, i, tsl ;
    Word * pword, * word, *wordBeingCompiled ;
    byte sigCode, *actualTypeRecorded = buffer, expandedTypeCodeBuffer [32] ;
    //byte * expandedTypeCodeBuffer = _expandedTypeCodeBuffer ;
    byte * opWordTypeSignature = opWord->W_TypeSignature ;
    for ( i = 0 ; ( ( opWordTypeSignature[i] ) && ( opWordTypeSignature[i] != '.' ) && ( opWordTypeSignature[i] != '_' ) ) ; i ++ )
    {
        if ( opWordTypeSignature [i + 1] == '.' )
        {
            sigCode = opWordTypeSignature [i + 2] ;
            if ( ( sigCode != 'V' ) && ( sigCode != '_' ) ) dot = true ;
        }
    }
    tsl = i ;
    wordBeingCompiled = Compiling ? _CfrTil_->CurrentWordBeingCompiled : 0 ;
    if ( wordBeingCompiled && ( ! wordBeingCompiled->W_TypeSignature [0] ) )
        strcpy ( wordBeingCompiled->W_TypeSignature, "_______" ) ;
#if 0        
    if ( ( Is_DebugOn ) && ( _Q_->Verbosity > 1 ) )
    {
        byte abuffer [128] ;
        abuffer [0] = 0 ;
        _Printf ( ( byte* ) "\nopWord %s.%s :: type signature expected :: %s",
            opWord->S_ContainingNamespace ? opWord->S_ContainingNamespace->Name : ( byte* ) "<literal>",
            opWord->Name, CfrTil_ExpandTypeSignature ( opWord, abuffer, 1 ) ) ;
        CfrTil_TypeStackPrint ( ) ;
    }
#endif        
    for ( i = 0 ; ( ( i < stackDepth ) && ( i < tsl ) ) ; i ++ )
    {
        depth = tsl > stackDepth ? stackDepth : tsl ;
        word = ( Word * ) _CfrTil_->TypeWordStack->StackPointer[- ( depth - ( i + 1 ) )] ; // we are starting lower in the stack and working up
        UpdateBuffers ( word, expandedTypeCodeBuffer, actualTypeRecorded, i ) ;
        if ( ! typeError ) // in any case UpdateBuffers
        {
            switch ( opWordTypeSignature [i] )
            {
                case 'X':
                {
                    // word1 correlates with the type variable so it can anything
                    // word0 is closer to top of stack than word1; word1 is lower in the stack than word 0
                    // word1 was parsed and pushed before word0
                    // in the case of equal ('=' : word1 = word0 , word1 word0 = , word0 word1 store) word1 can be a type variable and word0 can be any fixed type
                    i ++ ;
                    Word * word1 = word, *word0 = ( Word * ) _CfrTil_->TypeWordStack->StackPointer[- ( depth - ( i + 1 ) )] ;
                    if ( ! word0 ) word0 = ( Word * ) _CfrTil_->TypeWordStack->StackPointer[- ( depth - ( i - 1 ) )] ;
                    UpdateBuffers ( word0, expandedTypeCodeBuffer, actualTypeRecorded, i ) ;
                    //if ( Is_DebugOn ) 
                    CfrTil_TypeStatus_Print ( opWord, actualTypeRecorded ) ;
                    if ( CfrTil_TypeCheck_DoTypeVariable ( word0, word1, wordBeingCompiled ) ) typeError = true ;
                    break ;
                }
                case 'N': case 'I': case 'S': case 'B': case 'O': case 'V': case '_':
                {
                    //if ( Is_DebugOn ) 
                    CfrTil_TypeStatus_Print ( opWord, actualTypeRecorded ) ;
                    if ( CfrTil_TypeCheck_DoASignatureCode ( word, wordBeingCompiled, CfrTil_ConvertTypeSigCodeToAttribute ( opWordTypeSignature [i] ), opWordTypeSignature [i] ) ) typeError = true ;
                    break ;
                }
                default: break ;
            }
        }
    }
done:
    if ( ( ! typeError ) && ( ! GetState ( _Compiler_, ( DOING_BEFORE_AN_INFIX_WORD | DOING_BEFORE_A_PREFIX_WORD ) ) ) ) _Stack_DropN ( _CfrTil_->TypeWordStack, depth ) ;
    if ( dot ) //&& (!(opWord->CAttribute & KEYWORD)))
    {
        pword = _CopyDuplicateWord ( opWord, 0 ) ;
        pword->CAttribute = CfrTil_ConvertTypeSigCodeToAttribute ( sigCode ) ;
        CfrTil_TypeStackPush ( pword ) ;
        //Word_Recycle ( pword ) ; // recycle the list at reset instead
    }
    if ( typeError ) return actualTypeRecorded ;
    else return false ;
}

void
CfrTil_Typecheck ( Word * opWord )
{
    if ( GetState ( _CfrTil_, TYPECHECK_ON ) )
    {
        byte * typeError, buffer0 [128] ;
        buffer0 [0] = 0 ; // init
        int64 stackDepth = Stack_Depth ( _CfrTil_->TypeWordStack ) ;
        if ( stackDepth && ( opWord->W_TypeSignature[0] ) )
        {
            typeError = _CfrTil_TypeCheckAndInfer ( opWord, stackDepth, buffer0 ) ;
            if ( typeError ) CfrTil_TypeError ( opWord, typeError ) ;
        }
    }
}

void
CfrTil_TypeStatus_Print ( Word * word, byte * actualTypeRecorded )
{
    byte buffer [128] ;
    buffer [0] = 0 ;
    _Printf ( ( byte* ) "\nopWord %s.%s :: type signature expected :: %s :: recorded : %s : at %s", word->S_ContainingNamespace ? word->S_ContainingNamespace->Name : ( byte* ) "<literal>",
        word->Name, CfrTil_ExpandTypeSignature ( word, buffer, 1 ), actualTypeRecorded, Context_Location () ) ;
}

void
CfrTil_TypeError ( Word * word, byte * actualTypeRecorded )
{
    //actualTypeRecorded [strlen ( actualTypeRecorded ) - 3 ] = 0 ; // remove final '.' 
    CfrTil_ShowInfo ( word, "apparent type mismatch", 0 ) ;
    CfrTil_TypeStatus_Print ( word, actualTypeRecorded ) ;
    if ( _Q_->Verbosity > 1 )
    {
        CfrTil_TypeStackPrint ( ) ;
        Pause ( ) ;
        Warning ( "Apparent TypeMismatch : ", Context_Location ( ), 0 ) ;
    }
    //CfrTil_TypeStackReset ( ) ;
    //Warning ( "Apparent TypeMismatch: TypeStack has been reset.", Context_Location ( ), 0 ) ;
}

void
_CfrTil_TypeStackReset ( )
{
#if 0 // while not this ??
    int64 i, i0 = Stack_Depth ( _CfrTil_->TypeWordStack ) ;
    while ( i = Stack_Depth ( _CfrTil_->TypeWordStack ) )
    {
        Word * tword = ( Word * ) Stack_Pop ( _CfrTil_->TypeWordStack ) ;
        _CheckRecycleWord ( tword ) ;
    }
#endif    
    Stack_Init ( _CfrTil_->TypeWordStack ) ;
}

byte
CfrTil_ConvertTypeAttributeToTypeLetterCode ( uint64 attribute )
{
    if ( attribute & T_INT ) return 'I' ;
    else if ( attribute & T_STRING ) return 'S' ;
    else if ( attribute & T_BIG_NUM ) return 'N' ;
    else if ( attribute & T_BOOLEAN ) return 'B' ;
    else if ( attribute & OBJECT ) return 'O' ;
    else if ( attribute & T_VOID ) return 'V' ;
    else if ( attribute & T_UNDEFINED ) return '_' ;
    else return '_' ;
}

byte
CfrTil_Convert_Word_TypeAttributeToTypeCode ( Word * word )
{
    byte code = CfrTil_ConvertTypeAttributeToTypeLetterCode ( word->CAttribute ) ;
    if ( code ) return code ;
    else if ( word->CAttribute2 & T_TYPE_VARIABLE ) return 'X' ;
    else if ( word->CAttribute2 & T_ANY_FIXED_TYPE ) return 'A' ;
    else return '_' ;
}

byte *
CfrTil_ExpandTypeLetterCode ( byte typeCode, byte * buffer )
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
            //dot = true ;
            break ;
        }
        default: break ;
    }
    return buffer ;
}

byte *
CfrTil_ExpandTypeSignature ( Word * opWord, byte * buffer, Boolean flag )
{
    int64 i ;
    Boolean dot = false ;
    byte tsc, *ts, abuffer [64] ; // type signature code
    for ( i = 0, ts = opWord->W_TypeSignature ; tsc = ts [i] ; i ++ )
    {
        CfrTil_ExpandTypeLetterCode ( tsc, abuffer ) ;
        if ( abuffer[0] )
        {
            if ( String_Equal ( abuffer, "-> " ) ) dot = true ;
            if ( dot && flag ) break ;
            strcat ( buffer, abuffer ) ;
            if ( ( ! dot ) && ( ts [i + 1] != '.' ) ) strcat ( buffer, ". " ) ; // cartesian product symbol
        }
        else break ;
    }
    return buffer ;
}

uint64
CfrTil_ConvertTypeSigCodeToAttribute ( byte sigCode )
{
    switch ( sigCode )
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

Word *
CfrTil_TypeStack_Pop ( )
{
    if ( GetState ( _CfrTil_, TYPECHECK_ON ) && Stack_Depth ( _CfrTil_->TypeWordStack ) )
    {
        Word * tword = ( Word * ) Stack_Pop ( _CfrTil_->TypeWordStack ) ;
        return tword ;
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




