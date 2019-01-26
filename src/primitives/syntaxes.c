#include "../include/cfrtil64.h"

// examples of the use of PrefixCombinators are in interpreter.cft

void
CfrTil_InfixModeOff ( )
{
    SetState ( _Context_, INFIX_MODE, false ) ;
    Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "Infix" ) ;
}

void
CfrTil_InfixModeOn ( )
{
    SetState ( _Context_, INFIX_MODE, true ) ;
    Namespace_DoNamespace_Name ( ( byte* ) "Infix" ) ;
}

void
CfrTil_PrefixModeOff ( )
{
    SetState ( _Context_, PREFIX_MODE, false ) ;
}

void
CfrTil_PrefixModeOn ( )
{
    SetState ( _Context_, PREFIX_MODE, true ) ;
}

void
CfrTil_C_Syntax_Off ( )
{
    Context * cntx = _Context_ ;
    SetState ( cntx, C_SYNTAX | PREFIX_MODE | INFIX_MODE, false ) ;
    //Namespace_SetAsNotUsing ( "C" ) ;
    Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "PrefixCombinators" ) ;
    Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "Infix" ) ;
    Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "C_Syntax" ) ;
    //Namespace_DoNamespace ( "Bits" ) ; // TODO : must be a better way
    CfrTil_SetInNamespaceFromBackground ( ) ;
    //if ( cntx->Compiler0->C_BackgroundNamespace ) _CfrTil_Namespace_InNamespaceSet ( cntx->Compiler0->C_BackgroundNamespace ) ;
    Context_SetDefaultTokenDelimiters ( cntx, ( byte* ) " \n\r\t", CONTEXT ) ;
    Ovt_AutoVarOff ( ) ;
}

// switch to the default forth, postfix mode

void
CfrTil_Postfix ( )
{
    CfrTil_C_Syntax_Off ( ) ;
    Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "Lisp" ) ;
    Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "LispTemp" ) ;
    Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "LispDefines" ) ;
}

void
CfrTil_C_Syntax_On ( )
{
    Context * cntx = _Context_ ;
    Compiler_Get_C_BackgroundNamespace ( cntx->Compiler0 ) ;
    SetState ( cntx, C_SYNTAX | PREFIX_MODE | INFIX_MODE, true ) ;
    Namespace_DoNamespace_Name ( ( byte* ) "C" ) ;
    Namespace_DoNamespace_Name ( ( byte* ) "PrefixCombinators" ) ;
    Namespace_DoNamespace_Name ( ( byte* ) "Infix" ) ;
    Namespace_DoNamespace_Name ( ( byte* ) "C_Syntax" ) ;
    Compiler_SetAs_InNamespace_C_BackgroundNamespace ( cntx->Compiler0 ) ;
    Context_SetDefaultTokenDelimiters ( cntx, ( byte* ) " ,\n\r\t", CONTEXT ) ;
}

void
CfrTil_AddressOf ( )
{
    SetState ( _Context_, ADDRESS_OF_MODE, true ) ; // turned off after one object
}

void
CfrTil_C_Semi ( )
{
    _Compiler_->LHS_Word = 0 ;
    if ( ! Compiling )
    {
        CfrTil_InitSourceCode ( _CfrTil_ ) ;
        //Compiler_Init ( _Compiler_, 0, 1 ) ;
        Compiler_DeleteDebugInfo ( _Compiler_ ) ;
    }
}

void
CfrTil_End_C_Block ( )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    CfrTil_EndBlock ( ) ; // NB. CfrTil_EndBlock changes cntx->Compiler0->BlockLevel
    if ( ! Compiler_BlockLevel ( compiler ) ) _CfrTil_InitFinal ( ) ;
    else
    {
        // we're still compiling so ... ??

        Word * word = _Context_CurrentWord ( cntx ) ;
        word->W_NumberOfArgs = compiler->NumberOfArgs ;
        word->W_NumberOfLocals = compiler->NumberOfLocals ;
    }
    CfrTil_SetInNamespaceFromBackground ( ) ;
}

void
CfrTil_Begin_C_Block ( )
{
    if ( Compiling && GetState ( _Context_, C_SYNTAX ) )
    {
        if ( GetState ( _Compiler_, C_COMBINATOR_PARSING ) ) CfrTil_BeginBlock ( ) ;
        else Interpret_Until_Token ( _Interpreter_, ( byte* ) "}", 0 ) ;
    }
}

Namespace *
CfrTil_C_Class_New ( void )
{
    byte * name = ( byte* ) DataStack_Pop ( ) ;
    return DataObject_New ( C_CLASS, 0, name, 0, 0, 0, 0, 0, 0, 0, - 1 ) ;
}

void
CfrTil_C_Infix_Equal ( )
{
    _CfrTil_C_Infix_EqualOp ( 0 ) ;
}

void
CfrTil_If_PrefixCombinators ( )
{
    Compiler * compiler = _Compiler_ ;
    Word * combinatorWord0 = CfrTil_WordList ( 0 ) ;
    combinatorWord0->W_SC_Index = _Lexer_->SC_Index ;
    byte svscp = GetState ( compiler, C_COMBINATOR_PARSING ) ;
    SetState ( compiler, C_COMBINATOR_PARSING, true ) ;
    compiler->TakesLParenAsBlock = true ;
    compiler->BeginBlockFlag = false ;
    int64 blocksParsed = CfrTil_Interpret_C_Blocks ( 2, 1, 0 ) ;
    _Context_->SC_CurrentCombinator = combinatorWord0 ;
    if ( blocksParsed > 2 ) CfrTil_TrueFalseCombinator3 ( ) ;
    else
    {
        d0 ( if ( Is_DebugOn ) _Printf ( ( byte* ) "\n\nbefore CfrTil_If2Combinator : blockStack depth = %d : %s : %s\n\n", _Stack_Depth ( compiler->BlockStack ), _Context_->CurrentlyRunningWord->Name, Context_Location ( ) ) ) ;
        CfrTil_If2Combinator ( ) ;
    }
    SetState ( compiler, C_COMBINATOR_PARSING, svscp ) ;
}

void
CfrTil_DoWhile_PrefixCombinators ( )
{
    Word * currentWord0 = CfrTil_WordList ( 0 ) ;
    currentWord0->W_SC_Index = _Lexer_->SC_Index ;
    byte * start = Here ;
    _Compiler_->BeginBlockFlag = false ;
    CfrTil_Interpret_C_Blocks ( 1, 0, 0 ) ;
    // just assume 'while' is there 
    Lexer_ReadToken ( _Context_->Lexer0 ) ; // drop the "while" token
    _Compiler_->TakesLParenAsBlock = true ;
    _Compiler_->BeginBlockFlag = false ;
    CfrTil_Interpret_C_Blocks ( 1, 0, 0 ) ;
    _Context_->SC_CurrentCombinator = currentWord0 ;
    if ( ! CfrTil_DoWhileCombinator ( ) ) SetHere ( start, 1 ) ;
}

void
CfrTil_For_PrefixCombinators ( )
{
    Word * currentWord0 = CfrTil_WordList ( 0 ) ;
    currentWord0->W_SC_Index = _Lexer_->SC_Index ;
    //_Compiler_->SemicolonEndsThisBlock = true ;
    _Compiler_->TakesLParenAsBlock = true ;
    _Compiler_->BeginBlockFlag = false ;
    CfrTil_Interpret_C_Blocks ( 4, 0, 1 ) ;
    _Context_->SC_CurrentCombinator = currentWord0 ;
    CfrTil_ForCombinator ( ) ;
}

void
CfrTil_Loop_PrefixCombinators ( )
{
    Word * currentWord0 = CfrTil_WordList ( 0 ) ;
    currentWord0->W_SC_Index = _Lexer_->SC_Index ;
    _Compiler_->BeginBlockFlag = false ;
    CfrTil_Interpret_C_Blocks ( 1, 0, 0 ) ;
    _Context_->SC_CurrentCombinator = currentWord0 ;
    CfrTil_LoopCombinator ( ) ;
}

void
CfrTil_While_PrefixCombinators ( )
{
    Word * currentWord0 = CfrTil_WordList ( 0 ) ;
    currentWord0->W_SC_Index = _Lexer_->SC_Index ;
    byte * start = Here ;
    _Compiler_->TakesLParenAsBlock = true ;
    _Compiler_->BeginBlockFlag = false ;
    CfrTil_Interpret_C_Blocks ( 2, 0, 0 ) ;
    _Context_->SC_CurrentCombinator = currentWord0 ;
    if ( ! CfrTil_WhileCombinator ( ) ) SetHere ( start, 1 ) ;
}

int64
_CfrTil_TypedefStructBegin ( void )
{
    int64 size = _CfrTil_Parse_ClassStructure ( 0 ) ;
    return size ;
}

void
CfrTil_TypedefStructBegin ( void )
{
    int64 size = _CfrTil_TypedefStructBegin ( ) ;
    //DataStack_Push ( size ) ;
}

void
CfrTil_TypedefStructEnd ( void )
{
    Namespace_SetAsNotUsing ( ( byte* ) "C_Typedef" ) ;
    Compiler_SetAs_InNamespace_C_BackgroundNamespace ( _Compiler_ ) ;
}

// infix equal is unique in 'C' because the right hand side of '=' runs to the ';'

// type : typedef

int64
_Type_Create ( byte * token )
{
    int64 size = 0 ;
    if ( token [ 0 ] == '{' )
    {
        Context * cntx = _Context_ ;
        Lexer * lexer = cntx->Lexer0 ;
        Lexer_ReadToken ( lexer ) ; // 
        size = _CfrTil_TypedefStructBegin ( ) ; //Namespace_ActivateAsPrimary ( ( byte* ) "C_Typedef" ) ;
        Compiler_SetAs_InNamespace_C_BackgroundNamespace ( cntx->Compiler0 ) ;
    }
    return size ;
}

void
Type_Create ( )
{

    Context * cntx = _Context_ ;
    byte * token = Lexer_Peek_Next_NonDebugTokenWord ( cntx->Lexer0, 1 ) ;
    int64 size = _Type_Create ( token ) ;
    //DataStack_Push ( size ) ;
}

void
_CfrTil_TypeDef ( )
{
    Context * cntx = _Context_ ;
    Namespace * ns = CfrTil_Type_New ( ) ;
    Lexer * lexer = cntx->Lexer0 ;
    Word * alias ;
    Boolean typeFlag = false ;
    int64 size = 0 ;
    Lexer_SetTokenDelimiters ( lexer, ( byte* ) " ,\n\r\t", COMPILER_TEMP ) ;
    do
    {
        byte * token = Lexer_Peek_Next_NonDebugTokenWord ( cntx->Lexer0, 1 ) ;
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
                size = _Type_Create ( token ) ;
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
                alias->CAttribute |= IMMEDIATE ;
            }
            else
            {
                ns = DataObject_New ( C_TYPE, 0, token, 0, 0, 0, 0, 0, 0, 0, - 1 ) ;
                _Namespace_VariableValueSet ( ns, ( byte* ) "size", size ) ;
            }
        }
    }
    while ( 1 ) ;
}
