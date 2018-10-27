
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
            case 'I' : { strcat ( buffer, "Integer " ) ; break ; }
            case 'S' : { strcat ( buffer, "String " ) ; break ; }
            case 'N' : { strcat ( buffer, "BigNum " ) ; break ; }
            case 'B' : { strcat ( buffer, "Boolean " ) ; break ; }
            case 'O' : { strcat ( buffer, "Object " ) ; break ; }
            case '_' : { strcat ( buffer, "Undefined " ) ; break ; }
            case '.' : { strcat ( buffer, "-> " ) ; dot = true ; break ; }
            default : break ;
        }
        if ( ( ! dot ) && ( ts [i + 1] != '.' ) ) strcat ( buffer, ". " ) ; // cartesian product symbol
    }
    return buffer ;
}

void
CfrTil_TypeError ( Word * opWord, int64 stackDepth )
{
    byte buffer [128] ;
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
        int64 i ;
        Word * word ;
        for ( i = 0 ; i < stackDepth ; i ++ )
        {
            word = ( Word * ) _CfrTil_->TypeWordStack->StackPointer[- ( stackDepth - ( i + 1 ) )] ;
            if ( ! word ) CfrTil_TypeError ( opWord, stackDepth ) ;
            if ( ( opWord->W_TypeSignature[i] == 'N' ) && ( ! ( word->CAttribute & T_BIG_NUM ) ) )
            {
                if ( ( word->CAttribute & ( PARAMETER_VARIABLE | NAMESPACE_VARIABLE | LOCAL_VARIABLE | REGISTER_VARIABLE | T_LISP_SYMBOL ) ) && ( ! ( word->CAttribute & ( T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN ) ) ) ) word->CAttribute |= T_BIG_NUM ;
                else
                {
                    typeError = true ;
                    break ;
                }
            }
            else if ( ( opWord->W_TypeSignature[i] == 'I' ) && ( ! ( word->CAttribute & T_INT ) ) )
            {
                if ( ( word->CAttribute & ( PARAMETER_VARIABLE | NAMESPACE_VARIABLE | LOCAL_VARIABLE | REGISTER_VARIABLE | T_LISP_SYMBOL ) ) && ( ! ( word->CAttribute & ( T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN ) ) ) ) word->CAttribute |= T_INT ;
                else
                {
                    typeError = true ;
                    break ;
                }
            }
            else if ( ( opWord->W_TypeSignature[i] == 'S' ) && ( ! ( word->CAttribute & T_STRING ) ) )
            {
                if ( ( word->CAttribute & ( PARAMETER_VARIABLE | NAMESPACE_VARIABLE | LOCAL_VARIABLE | REGISTER_VARIABLE | T_LISP_SYMBOL ) ) && ( ! ( word->CAttribute & ( T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN ) ) ) ) word->CAttribute |= T_STRING ;
                else
                {
                    typeError = true ;
                    break ;
                }
            }
        }
    }
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

#if 0

void
_Compiler_AttributeCheck1 ( Compiler * compiler, uint64 type32 )
{
    //return ;
    Word * word = ( Word* ) _Stack_Pop ( compiler->TypeStack ) ;
    if ( ! ( word->S_Category & type32 ) ) Error_Abort ( ( byte* ) "CAttribute Error", 1 ) ;
}

void
_Compiler_AttributeCheck2 ( Compiler * compiler, uint64 type0, uint64 type1 )
{
    //return ;
    Word * word = ( Word* ) _Stack_Pop ( compiler->TypeStack ) ;
    if ( ! ( word->S_Category & type0 ) ) Error_Abort ( ( byte* ) "CAttribute Error", 1 ) ;
    if ( ! ( word->S_Category & type1 ) ) Error_Abort ( ( byte* ) "CAttribute Error", 1 ) ;
}
int64
_AttributeCheck1 ( uint64 zero )
{
    //if ( GetState( _Context_->Compiler0, BLOCK_MODE ) )
    {
        if ( ( Compiler_WordStack ( 0 )->S_Category & zero ) ) return true ;
        else Error_Abort ( "", ABORT ) ;
        return false ;
    }
    //else return true ;
}

int64
_AttributeCheck2 ( uint64 zero, uint64 one )
{
    //if ( GetState( _Context_->Compiler0, BLOCK_MODE ) )
    {
        if ( ( Compiler_WordStack ( 0 )->S_Category & zero ) && ( Compiler_WordStack ( 1 )->S_Category & one ) ) return true ;
        else Error_Abort ( "\nTypeError", ABORT ) ;
        return false ;
    }
    //else return true ;
}
#endif

