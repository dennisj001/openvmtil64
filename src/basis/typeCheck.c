
#include "../include/cfrtil64.h"

Boolean
CfrTil_TypeCheck_DoASignatureCode ( Word * word, Word * compilingWord, uint64 attribute, byte signatureCode )
{
    if ( ! ( word->CAttribute & attribute ) )
    {
        if ( ( word->CAttribute & ( PARAMETER_VARIABLE | NAMESPACE_VARIABLE | LOCAL_VARIABLE | REGISTER_VARIABLE | T_LISP_SYMBOL | OBJECT_FIELD ) )
            && ( ! ( word->CAttribute & ( T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT ) ) ) )
        {
            // infering that ...
            word->CAttribute |= attribute ;
            if ( compilingWord && ( word->CAttribute & PARAMETER_VARIABLE ) )
                compilingWord->W_TypeSignature [word->Index - 1] = signatureCode ;
        }
        else return true ;
    }
    return false ;
}

// word

Boolean
CfrTil_TypeCheck_DoTypeVariable ( Word * word0, Word * word1, Word * compilingWord )
{
    // word0 is closer to top of stack than word1; word1 is lower in the stack than word 0
    // eg. if word0 is TOS word1 would be NOS
    // word1 was parsed and pushed before word0
    // in the case of equal ('=' : word1 = word0 , word1 word0 = , word0 word1 store) word1 can be a type variable and word0 can be any fixed type
    if ( word1->CAttribute & ( PARAMETER_VARIABLE | NAMESPACE_VARIABLE | LOCAL_VARIABLE | REGISTER_VARIABLE | T_LISP_SYMBOL | OBJECT_FIELD ) )
    {
        //if ( ! ( word1->CAttribute & ( NAMESPACE_VARIABLE | OBJECT_FIELD ) ) )
        {
            uint64 word1_CAttribute = ( word1->CAttribute & ( T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT ) ) ;
            uint64 word0_CAttribute = ( word0->CAttribute & ( T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT ) ) ;
            if ( word1_CAttribute && word0_CAttribute && ( word1_CAttribute != word0_CAttribute ) ) return true ; //type error
            else if ( word0_CAttribute )
            {
                // we infer that ...
                word1->CAttribute |= word0_CAttribute ;
                if ( compilingWord && ( word1->CAttribute & PARAMETER_VARIABLE ) )
                    compilingWord->W_TypeSignature [word1->Index - 1] = CfrTil_Convert_Word_TypeAttributeToTypeCode ( word0 ) ;
            }
        }
        return false ;
    }
    else return true ;
}

Boolean
_CfrTil_TypeCheckAndInfer ( Word * opWord, int64 stackDepth )
{
    Boolean typeError = false, dot = false ;
    int64 depth = 0 ;
    Word * pword ;
    byte sigCode ;
    if ( GetState ( _CfrTil_, TYPECHECK_ON ) ) // caller already checked this
    {
        byte * ts = opWord->W_TypeSignature ;
        int64 i, tsl ;
        for ( i = 0, tsl = 0 ; ( ( ts[i] ) && ( ts[i] != '.' ) && ( ts[i] != '_' ) ) ; i ++, tsl ++ )
        {
            if ( ts [i + 1] == '.' )
            {
                sigCode = ts [i + 2] ;
                if ( ( sigCode != 'V' ) && ( sigCode != '_' ) ) dot = true ;
            }
        }
        Word * word, *wordBeingCompiled = Compiling ? _CfrTil_->CurrentWordBeingCompiled : 0 ;
        if ( wordBeingCompiled && ( ! wordBeingCompiled->W_TypeSignature [0] ) )
            strcpy ( wordBeingCompiled->W_TypeSignature, "_______" ) ;
        for ( i = 0 ; ( ( i < stackDepth ) && ( i < tsl ) ) ; i ++ )
        {
            depth = tsl > stackDepth ? stackDepth : tsl ;
            word = ( Word * ) _CfrTil_->TypeWordStack->StackPointer[- ( depth - ( i + 1 ) )] ; // we are starting lower in the stack and working up
            if ( ! word ) CfrTil_TypeError ( opWord ) ;
            switch ( ts [i] )
            {
                case 'X':
                {
                    // word0 is closer to top of stack than word1; word1 is lower in the stack than word 0
                    // word1 was parsed and pushed before word0
                    // in the case of equal ('=' : word1 = word0 , word1 word0 = , word0 word1 store) word1 can be a type variable and word0 can be any fixed type
                    i ++ ;
                    Word * word1 = word, *word0 = ( Word * ) _CfrTil_->TypeWordStack->StackPointer[- ( depth - ( i + 1 ) )] ;
                    if ( ! word0 ) word0 = ( Word * ) _CfrTil_->TypeWordStack->StackPointer[- ( depth - ( i - 1 ) )] ;
                    if ( CfrTil_TypeCheck_DoTypeVariable ( word0, word1, wordBeingCompiled ) )
                    {
                        typeError = true ;
                        goto done ;
                    }
                    else break ;
                }
                case 'N':
                {
                    if ( CfrTil_TypeCheck_DoASignatureCode ( word, wordBeingCompiled, T_BIG_NUM, 'N' ) )
                    {
                        typeError = true ;
                        goto done ;
                    }
                    else break ;
                }
                case 'I':
                {
                    if ( CfrTil_TypeCheck_DoASignatureCode ( word, wordBeingCompiled, T_INT, 'I' ) )
                    {
                        typeError = true ;
                        goto done ;
                    }
                    else break ;
                }
                case 'S':
                {
                    if ( CfrTil_TypeCheck_DoASignatureCode ( word, wordBeingCompiled, T_STRING, 'S' ) )
                    {
                        typeError = true ;
                        goto done ;
                    }
                    else break ;
                }
                case 'B':
                {
                    if ( CfrTil_TypeCheck_DoASignatureCode ( word, wordBeingCompiled, T_BOOLEAN, 'B' ) )
                    {
                        typeError = true ;
                        goto done ;
                    }
                    else break ;
                }
                case 'O':
                {
                    if ( CfrTil_TypeCheck_DoASignatureCode ( word, wordBeingCompiled, OBJECT, 'O' ) )
                    {
                        typeError = true ;
                        goto done ;
                    }
                    else break ;
                }
                case 'V':
                {
                    if ( CfrTil_TypeCheck_DoASignatureCode ( word, wordBeingCompiled, T_VOID, 'V' ) )
                    {
                        typeError = true ;
                        goto done ;
                    }
                    else break ;
                }
                case '_':
                {
                    if ( CfrTil_TypeCheck_DoASignatureCode ( word, wordBeingCompiled, T_UNDEFINED, '_' ) )
                    {
                        typeError = true ;
                        goto done ;
                    }
                    else break ;
                }
                default: break ;
            }
        }
    }
done:
    if ( ! typeError ) _Stack_DropN ( _CfrTil_->TypeWordStack, depth ) ;
#if 1
    if ( dot )
    {
        pword = _CopyDuplicateWord ( opWord, 0 ) ;
        Word_Recycle ( pword ) ;
        pword->CAttribute = CfrTil_ConvertTypeSigCodeToAttribute ( sigCode ) ;
        CfrTil_TypeStackPush ( pword ) ;
    }
#endif
    return typeError ;
}

void
CfrTil_Typecheck ( Word * opWord )
{
    if ( GetState ( _CfrTil_, TYPECHECK_ON ) )
    {
        Boolean typeError ;
        int64 stackDepth = Stack_Depth ( _CfrTil_->TypeWordStack ) ;
        if ( stackDepth )
        {
            if ( opWord->W_TypeSignature[0] )
            {
                typeError = _CfrTil_TypeCheckAndInfer ( opWord, stackDepth ) ;
                if ( typeError ) CfrTil_TypeError ( opWord ) ;
            }
        }
    }
}

byte
CfrTil_ConvertTypeAttributeToTypeCode ( uint64 attribute )
{
    if ( attribute & T_INT ) return 'I' ;
    else if ( attribute & T_STRING ) return 'S' ;
    else if ( attribute & T_BIG_NUM ) return 'N' ;
    else if ( attribute & T_BOOLEAN ) return 'B' ;
    else if ( attribute & OBJECT ) return 'O' ;
    else if ( attribute & T_VOID ) return 'V' ;
    else if ( attribute & T_UNDEFINED ) return '_' ;
    else return 0 ;
}

byte
CfrTil_Convert_Word_TypeAttributeToTypeCode ( Word * word )
{
    byte code = CfrTil_ConvertTypeAttributeToTypeCode ( word->CAttribute ) ;
    if ( code ) return code ;
    else if ( word->CAttribute2 & T_TYPE_VARIABLE ) return 'X' ;
    else if ( word->CAttribute2 & T_ANY_FIXED_TYPE ) return 'A' ;
    else return '_' ;
}

byte *
CfrTil_ExpandTypeSignature ( Word * opWord, byte * buffer )
{
    int64 i ;
    Boolean dot = false ;
    byte tsc, *ts ; // type signature code
    for ( i = 0, ts = opWord->W_TypeSignature ; tsc = ts [i] ; i ++ )
    {
        switch ( tsc )
        {
            case 'I':
            {
                strcat ( buffer, "Integer " ) ;
                break ;
            }
            case 'X':
            {
                strcat ( buffer, "TypeVariable " ) ; // or a type unknown or unset as of now
                break ;
            }
            case 'S':
            {
                strcat ( buffer, "String " ) ;
                break ;
            }
            case 'N':
            {
                strcat ( buffer, "BigNum " ) ;
                break ;
            }
            case 'B':
            {
                strcat ( buffer, "Boolean " ) ;
                break ;
            }
            case 'O':
            {
                strcat ( buffer, "Object " ) ;
                break ;
            }
            case 'A':
            {
                strcat ( buffer, "Any " ) ; // Any fixed, non variable type
                break ;
            }
            case '_':
            {
                strcat ( buffer, "Undefined " ) ; // == Any or TypeVariable
                break ;
            }
            case 'V':
            {
                strcat ( buffer, "Void " ) ;
                break ;
            }
            case '.':
            {
                strcat ( buffer, "-> " ) ;
                dot = true ;
                break ;
            }
            default: break ;
        }
        if ( ( ! dot ) && ( ts [i + 1] != '.' ) ) strcat ( buffer, ". " ) ; // cartesian product symbol
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
        case 'N': return T_INT ;
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
CfrTil_TypeError ( Word * word )
{
    byte buffer [128] ;
    buffer [0] = 0 ;
    CfrTil_ShowInfo ( word, "type mismatch", 0 ) ;
    _Printf ( ( byte* ) "\nopWord %s.%s :: TypeSignature :: %s", word->S_ContainingNamespace ? word->S_ContainingNamespace->Name : ( byte* ) "<literal>",
        word->Name, CfrTil_ExpandTypeSignature ( word, buffer ) ) ;
    CfrTil_TypeStackPrint ( ) ;
    CfrTil_TypeStackReset ( ) ;
    Warning ( "Apparent TypeMismatch: TypeStack has been reset.", Context_Location ( ), 0 ) ;
}

void
_CfrTil_TypeStackReset ( )
{
    Stack_Init ( _CfrTil_->TypeWordStack ) ;
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
    if ( GetState ( _CfrTil_, TYPECHECK_ON ) )
    {
        Word * tword = ( Word * ) Stack_Pop ( _CfrTil_->TypeWordStack ) ;
        return tword ;
    }

}

void
CfrTil_TypeStack_Dup ( )
{
    if ( GetState ( _CfrTil_, TYPECHECK_ON ) ) Stack_Dup ( _CfrTil_->TypeWordStack ) ;
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




