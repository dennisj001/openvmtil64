
#include "../include/cfrtil64.h"

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
            case '_':
            {
                strcat ( buffer, "Undefined " ) ;
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

void
CfrTil_TypeError ( Word * opWord, int64 stackDepth )
{
    byte buffer [128] ;
    buffer [0] = 0 ;
    _Printf ( ( byte* ) "\nopWord %s.%s :: TypeSignature :: %s", opWord->S_ContainingNamespace ? opWord->S_ContainingNamespace->Name : ( byte* ) "",
        opWord->Name, CfrTil_ExpandTypeSignature ( opWord, buffer ) ) ;
    _Stack_Print ( _CfrTil_->TypeWordStack, "TypeWordStack", stackDepth, 1 ) ;
    CfrTil_TypeStackReset ( ) ;
    Error ( "TypeError", Context_Location ( ), ABORT ) ;
}

void
CfrTil_TypeStackReset ( )
{
    if ( ! GetState ( _CfrTil_, TYPESTACK_RESET_OFF ) ) Stack_Init ( _CfrTil_->TypeWordStack ) ;
}

Boolean
_CfrTil_TypeCheckAndInfer ( Word * opWord, int64 stackDepth )
{
    Boolean typeError = false ;
    if ( ! GetState ( _CfrTil_, TYPECHECK_OFF ) )
    {
        byte * ts = opWord->W_TypeSignature ;
        int64 i, tsl, depth, tsl0 = strlen ( ts ) ;
        if ( ts [ tsl0 - 2 ] == '.' ) tsl = tsl0 - 2 ; // 2 : assuming a "." and a following TypeCode in the signature, eg. NN.N
        else tsl = tsl0 ;
        Word * word, *compilingWord = Compiling ? _CfrTil_->CurrentWordCompiling : 0 ;
        if ( compilingWord && ( ! compilingWord->W_TypeSignature [0] ))
            strcpy ( compilingWord->W_TypeSignature, "_______" ) ;
        for ( i = 0 ; ( ( i < stackDepth ) && ( i < tsl ) ) ; i ++ )
        {
            depth = tsl > stackDepth ? stackDepth : tsl ;
            word = ( Word * ) _CfrTil_->TypeWordStack->StackPointer[- ( depth - ( i + 1 ) )] ;
            if ( ! word ) CfrTil_TypeError ( opWord, stackDepth ) ;
            switch ( ts [i] )
            {
                case 'N':
                {
                    if ( ! ( word->CAttribute & T_BIG_NUM ) )
                    {
                        if ( ( word->CAttribute & ( PARAMETER_VARIABLE | NAMESPACE_VARIABLE | LOCAL_VARIABLE | REGISTER_VARIABLE | T_LISP_SYMBOL | OBJECT_FIELD ) )
                            && ( ! ( word->CAttribute & ( T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT ) ) ) ) 
                        {
                            word->CAttribute |= T_BIG_NUM ; // inference
                            if ( compilingWord && (word->CAttribute & PARAMETER_VARIABLE )) 
                                compilingWord->W_TypeSignature [word->Index - 1] = 'N' ;
                        }
                        else
                        {
                            typeError = true ;
                            goto done ;
                        }
                    }
                    continue ;
                }
                case 'I':
                {
                    if ( ! ( word->CAttribute & T_INT ) )
                    {
                        if ( ( word->CAttribute & ( PARAMETER_VARIABLE | NAMESPACE_VARIABLE | LOCAL_VARIABLE | REGISTER_VARIABLE | T_LISP_SYMBOL | OBJECT_FIELD ) )
                            && ( ! ( word->CAttribute & ( T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT ) ) ) ) 
                        {
                            word->CAttribute |= T_INT ; // inference
                            if ( compilingWord && (word->CAttribute & PARAMETER_VARIABLE )) 
                                compilingWord->W_TypeSignature [word->Index - 1] = 'I' ;
                        }
                        else
                        {
                            typeError = true ;
                            goto done ;
                        }
                    }
                    continue ;
                }
                case 'S':
                {
                    if ( ! ( word->CAttribute & T_STRING ) )
                    {
                        if ( ( word->CAttribute & ( PARAMETER_VARIABLE | NAMESPACE_VARIABLE | LOCAL_VARIABLE | REGISTER_VARIABLE | T_LISP_SYMBOL | OBJECT_FIELD ) )
                            && ( ! ( word->CAttribute & ( T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT ) ) ) ) 
                        {
                            word->CAttribute |= T_STRING ; // inference
                            if ( compilingWord && (word->CAttribute & PARAMETER_VARIABLE )) 
                                compilingWord->W_TypeSignature [word->Index - 1] = 'S' ;
                        }
                        else
                        {
                            typeError = true ;
                            goto done ;
                        }
                    }
                    continue ;
                }
                case '_': case 'B': case 'O': default : continue ; // TODO ??
            }
        }
    }
    done :
    return typeError ;
}

void
CfrTil_Typecheck ( Word * opWord, Boolean resetStackFlag )
{
    Boolean typeError ;
    int64 stackDepth = Stack_Depth ( _CfrTil_->TypeWordStack ) ;
    if ( stackDepth )
    {
        //_Stack_Print ( _CfrTil_->TypeWordStack, "TypeWordStack", depth, 1 ) ;
        if ( opWord->W_TypeSignature[0] )
        {
            typeError = _CfrTil_TypeCheckAndInfer ( opWord, stackDepth ) ;
            if ( typeError ) CfrTil_TypeError ( opWord, stackDepth ) ;
        }
        if ( resetStackFlag ) CfrTil_TypeStackReset ( ) ;
    }
}

void
CfrTil_TypeStackPush ( Word * word )
{
    Stack_Push ( _CfrTil_->TypeWordStack, ( int64 ) word ) ;
}

