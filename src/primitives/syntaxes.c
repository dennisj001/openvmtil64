#include "../include/cfrtil64.h"

// examples of the use of PrefixCombinators are in interpreter.cft

void
CfrTil_InfixModeOff ( )
{
    SetState ( _Context_, INFIX_MODE, false ) ;
    if ( ! Compiling ) Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "Infix" ) ;
}

void
CfrTil_InfixModeOn ( )
{
    SetState ( _Context_, INFIX_MODE, true ) ;
    if ( ! Compiling ) Namespace_DoNamespace_Name ( ( byte* ) "Infix" ) ;
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
    CfrTil_SetInNamespaceFromBackground ( ) ; // before below Namespace_SetAsNotUsing_MoveToTail in case one of them is the background namespace
    Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "PrefixCombinators" ) ;
    Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "Infix" ) ;
    Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "C_Syntax" ) ;
    //Namespace_DoNamespace ( "Bits" ) ; // TODO : must be a better way
    //if ( cntx->Compiler0->C_BackgroundNamespace ) _CfrTil_Namespace_InNamespaceSet ( cntx->Compiler0->C_BackgroundNamespace ) ;
    Context_SetDefaultTokenDelimiters ( cntx, ( byte* ) " \n\r\t", CONTEXT ) ;
    //Ovt_AutoVarOff ( ) ;
}

// switch to the default forth, postfix mode

void
CfrTil_PostfixModeOn ( )
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
    //if ( ! GetState ( cntx, C_SYNTAX | PREFIX_MODE | INFIX_MODE ) )
    {
        Compiler_Save_C_BackgroundNamespace ( cntx->Compiler0 ) ;
        SetState ( cntx, C_SYNTAX | PREFIX_MODE | INFIX_MODE, true ) ;
        Namespace_DoNamespace_Name ( ( byte* ) "C" ) ;
        Namespace_DoNamespace_Name ( ( byte* ) "PrefixCombinators" ) ;
        Namespace_DoNamespace_Name ( ( byte* ) "Infix" ) ;
        Namespace_DoNamespace_Name ( ( byte* ) "C_Syntax" ) ;
        Compiler_SetAs_InNamespace_C_BackgroundNamespace ( cntx->Compiler0 ) ;
        Context_SetDefaultTokenDelimiters ( cntx, ( byte* ) " ,\n\r\t", CONTEXT ) ;
    }
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
    if ( ( ! Compiling ) )
    {
        CfrTil_InitSourceCode ( _CfrTil_ ) ;
        //CfrTil_DeleteDebugInfo () ;
    }
    SetState ( _Context_, ADDRESS_OF_MODE, false ) ;
}

void
CfrTil_C_Comma ( void )
{
    SetState ( _Context_, ADDRESS_OF_MODE, false ) ;
}

void
CfrTil_End_C_Block ( )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    CfrTil_EndBlock ( ) ; // NB. CfrTil_EndBlock changes cntx->Compiler0->BlockLevel
    if ( ! Compiler_BlockLevel ( compiler ) ) CfrTil_WordInitFinal ( ) ;
    else
    {
        // we're still compiling so ... ??

        Word * word = _Context_CurrentWord ( cntx ) ;
        word->W_NumberOfNonRegisterArgs = compiler->NumberOfArgs ;
        word->W_NumberOfNonRegisterLocals = compiler->NumberOfLocals ;
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
_CfrTil_Parse_Typedef_Field ()
{
    //int64 size = CfrTil_Parse_Structure (0, 0, 0, 0) ;
    TypeDefStructCompileInfo * tdsci = _Compiler_->C_Tdsci = TypeDefStructCompileInfo_New () ;
    Parse_A_Typedef_Field (tdsci ) ;
    SetState ( _Compiler_, TDSCI_PARSING, false ) ;
    return tdsci->Tdsci_TotalSize ;
}

void
_CfrTil_Typedef ( void )
{
    int64 size = _CfrTil_Parse_Typedef_Field () ;
    //DataStack_Push ( size ) ;
}

void
CfrTil_TypedefStructEnd ( void )
{
    Namespace_SetAsNotUsing ( ( byte* ) "C_Typedef" ) ;
    //Compiler_SetAs_InNamespace_C_BackgroundNamespace ( _Compiler_ ) ;
}

// infix equal is unique in 'C' because the right hand side of '=' runs to the ';'

// type : typedef

