
#include "../include/cfrtil64.h"

void
CfrTil_Class_New ( void )
{
    byte * name = ( byte* ) DataStack_Pop ( ) ;
    DataObject_New (CLASS, 0, name, 0, 0, 0, 0, 0, 0, 0, 0, - 1 ) ;
}

void //Word *
CfrTil_Class_Value_New ( )
{
    byte * name = ( byte* ) DataStack_Pop ( ) ;
    Word * word = DataObject_New (OBJECT, 0, name, 0, 0, 0, 0, 0, 0, 0, 0, - 1 ) ;
}

void
CfrTil_Class_Clone ( void )
{
    byte * name = ( byte* ) DataStack_Pop ( ) ;
    DataObject_New (CLASS_CLONE, 0, name, 0, 0, 0, 0, 0, 0, 0, 0, - 1 ) ;
}

void
CfrTil_DObject_New ( )
{
    // clone DObject -- create an object with DObject as it's prototype (but not necessarily as it's namespace)
    DataObject_New (DOBJECT, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, - 1 ) ;
}

Namespace *
CfrTil_Type_New ( )
{
    byte * name ;
    Namespace * ns = 0 ;
    CfrTil_Token ( ) ;
    name = ( byte* ) DataStack_Pop ( ) ;
    if ( ( String_Equal ( "struct", name ) ) || ( String_Equal ( "class", name ) ) )
    {
        CfrTil_Token ( ) ;
        name = ( byte* ) DataStack_Pop ( ) ;
    }
    ns = DataObject_New (C_TYPE, 0, name, 0, 0, 0, 0, 0, 0, 0, 0, - 1 ) ;
    return ns ;
}

int64
Type_Create ()
{
    int64 size = 0 ;
    byte * token = Lexer_ReadToken ( _Lexer_ ) ; // 
    if ( token [ 0 ] == '{' )  size = _CfrTil_Parse_Typedef_Field () ; //Namespace_ActivateAsPrimary ( ( byte* ) "C_Typedef" ) ;
    return size ;
}

#if 0
void
_CfrTil_TypeDef ( )
{
    Context * cntx = _Context_ ;
    //Namespace * ns = CfrTil_Type_New ( ) ;
    //CfrTil_Token ( ) ;
    //byte * name ; //= ( byte* ) DataStack_Pop ( ) ;
    //Namespace * ns = DataObject_New ( C_TYPE, 0, name, 0, 0, 0, 0, 0, 0, 0, - 1 ) ;
    Namespace * ns = 0 ; //= Class_New ( name, CLASS, 0 ) ;
    Lexer * lexer = cntx->Lexer0 ;
    Word * alias ;
    Boolean typeFlag = false ;
    int64 size = 0 ;
    byte * token, *token1 ;
    Lexer_SetTokenDelimiters ( lexer, ( byte* ) " ,\n\r\t", COMPILER_TEMP ) ;
    do
    {
        token = Lexer_Peek_Next_NonDebugTokenWord ( cntx->Lexer0, 1, 0 ) ;
        if ( token [ 0 ] == ';' )
        {
            Lexer_ReadToken ( cntx->Lexer0 ) ;
            break ;
        }
        else if ( ( String_Equal ( "struct", token ) ) || ( String_Equal ( "class", token ) ) )
        {
            Lexer_ReadToken ( cntx->Lexer0 ) ;
            continue ;
        }
        else if ( ( token [ 0 ] == '{' ) )
        {
            if ( ! typeFlag )
            {
                size = Type_Create ( token ) ;
                typeFlag = true ;
                continue ;
            }
            else SyntaxError ( 1 ) ;
        }
        token = Lexer_ReadToken ( cntx->Lexer0 ) ; //, ( byte* ) " ,\n\r\t" ) ;
        if ( token [ 0 ] == ',' ) continue ;
        else
        {
            if ( ns )
            {
                alias = _CfrTil_Alias ( ns, token ) ;
                alias->Lo_List = ns->Lo_List ;
                alias->W_MorphismAttributes |= IMMEDIATE ;
                _CfrTil_->LastFinished_Word = 0 ; // nb! : for _CfrTil_RecycleInit_Compiler_N_M_Node_WordList
            }
            else
            {
                token1 = Lexer_Peek_Next_NonDebugTokenWord ( lexer, 1, 0 ) ;
                if ( token1 [0] != '*' ) 
                {
                    Lexer_ReadToken ( lexer ) ;
                    size = CELL ;
                }
                ns = DataObject_New (C_TYPE, 0, token, 0, 0, 0, 0, 0, 0, 0, 0, - 1 ) ;
                _Namespace_VariableValueSet ( ns, ( byte* ) "size", size ) ;
                ns->Size = size ;
            }
        }
    }
    while ( 1 ) ;
}
#endif

void
CfrTil_Typedef ( )
{
    DataObject_New (C_TYPEDEF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, - 1 ) ; //--> _CfrTil_TypeDef ( ) ;
}


