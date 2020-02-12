#include "../include/cfrtil64.h"

// examples of the use of PrefixCombinators are in interpreter.cft

void
CFT_InfixModeOff ( )
{
    SetState ( _Context_, INFIX_MODE, false ) ;
    if ( ! Compiling ) Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "Infix" ) ;
}

void
CFT_InfixModeOn ( )
{
    SetState ( _Context_, INFIX_MODE, true ) ;
    if ( ! Compiling ) Namespace_DoNamespace_Name ( ( byte* ) "Infix" ) ;
}

void
CFT_PrefixModeOff ( )
{
    SetState ( _Context_, PREFIX_MODE, false ) ;
}

void
CFT_PrefixModeOn ( )
{
    SetState ( _Context_, PREFIX_MODE, true ) ;
}

void
CFT_C_Syntax_Off ( )
{
    Context * cntx = _Context_ ;
    SetState ( cntx, C_SYNTAX | PREFIX_MODE | INFIX_MODE, false ) ;
    //Namespace_SetAsNotUsing ( "C" ) ;
    CFT_SetInNamespaceFromBackground ( ) ; // before below Namespace_SetAsNotUsing_MoveToTail in case one of them is the background namespace
    Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "PrefixCombinators" ) ;
    Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "Infix" ) ;
    Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "C_Syntax" ) ;
    //Namespace_DoNamespace ( "Bits" ) ; // TODO : must be a better way
    //if ( cntx->Compiler0->C_BackgroundNamespace ) _CFT_Namespace_InNamespaceSet ( cntx->Compiler0->C_BackgroundNamespace ) ;
    Context_SetDefaultTokenDelimiters ( cntx, ( byte* ) " \n\r\t", CONTEXT ) ;
    //Ovt_AutoVarOff ( ) ;
}

// switch to the default forth, postfix mode

void
CFT_PostfixModeOn ( )
{
    CFT_C_Syntax_Off ( ) ;
    Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "Lisp" ) ;
    Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "LispTemp" ) ;
    Namespace_SetAsNotUsing_MoveToTail ( ( byte* ) "LispDefines" ) ;
}

void
CFT_C_Syntax_On ( )
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
CFT_AddressOf ( )
{
    SetState ( _Context_, ADDRESS_OF_MODE, true ) ; // turned off after one object
}

void
CFT_C_Semi ( )
{
    _Compiler_->LHS_Word = 0 ;
    if ( ( ! Compiling ) )
    {
        CFT_InitSourceCode ( _CFT_ ) ;
        //CFT_DeleteDebugInfo () ;
    }
    SetState ( _Context_, ADDRESS_OF_MODE, false ) ;
}

void
CFT_C_Comma ( void )
{
    SetState ( _Context_, ADDRESS_OF_MODE, false ) ;
}

void
CFT_End_C_Block ( )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    CFT_EndBlock ( ) ; // NB. CFT_EndBlock changes cntx->Compiler0->BlockLevel
    if ( ! Compiler_BlockLevel ( compiler ) ) CFT_WordInitFinal ( ) ;
    else
    {
        // we're still compiling so ... ??

        Word * word = _Context_CurrentWord ( cntx ) ;
        word->W_NumberOfNonRegisterArgs = compiler->NumberOfArgs ;
        word->W_NumberOfNonRegisterLocals = compiler->NumberOfLocals ;
    }
    CFT_SetInNamespaceFromBackground ( ) ;
}

void
CFT_Begin_C_Block ( )
{
    if ( Compiling && GetState ( _Context_, C_SYNTAX ) )
    {
        if ( GetState ( _Compiler_, C_COMBINATOR_PARSING ) ) CFT_BeginBlock ( ) ;
        else Interpret_Until_Token ( _Interpreter_, ( byte* ) "}", 0 ) ;
    }
}

Namespace *
CFT_C_Class_New ( void )
{
    byte * name = ( byte* ) DataStack_Pop ( ) ;
    return DataObject_New ( C_CLASS, 0, name, 0, 0, 0, 0, 0, 0, 0, 0, - 1 ) ;
}

void
CFT_C_Infix_Equal ( )
{
    _CFT_C_Infix_EqualOp ( 0 ) ;
}

void
CFT_If_PrefixCombinators ( )
{
    Compiler * compiler = _Compiler_ ;
    Word * combinatorWord0 = CFT_WordList ( 0 ) ;
    combinatorWord0->W_SC_Index = _Lexer_->SC_Index ;
    byte svscp = GetState ( compiler, C_COMBINATOR_PARSING ) ;
    SetState ( compiler, C_COMBINATOR_PARSING, true ) ;
    compiler->TakesLParenAsBlock = true ;
    compiler->BeginBlockFlag = false ;
    int64 blocksParsed = CFT_Interpret_C_Blocks ( 2, 1, 0 ) ;
    _Context_->SC_CurrentCombinator = combinatorWord0 ;
    if ( blocksParsed > 2 ) CFT_TrueFalseCombinator3 ( ) ;
    else
    {
        d0 ( if ( Is_DebugOn ) _Printf ( ( byte* ) "\n\nbefore CFT_If2Combinator : blockStack depth = %d : %s : %s\n\n", _Stack_Depth ( compiler->BlockStack ), _Context_->CurrentlyRunningWord->Name, Context_Location ( ) ) ) ;
        CFT_If2Combinator ( ) ;
    }
    SetState ( compiler, C_COMBINATOR_PARSING, svscp ) ;
}

void
CFT_DoWhile_PrefixCombinators ( )
{
    Word * currentWord0 = CFT_WordList ( 0 ) ;
    currentWord0->W_SC_Index = _Lexer_->SC_Index ;
    byte * start = Here ;
    _Compiler_->BeginBlockFlag = false ;
    CFT_Interpret_C_Blocks ( 1, 0, 0 ) ;
    // just assume 'while' is there 
    Lexer_ReadToken ( _Context_->Lexer0 ) ; // drop the "while" token
    _Compiler_->TakesLParenAsBlock = true ;
    _Compiler_->BeginBlockFlag = false ;
    CFT_Interpret_C_Blocks ( 1, 0, 0 ) ;
    _Context_->SC_CurrentCombinator = currentWord0 ;
    if ( ! CFT_DoWhileCombinator ( ) ) SetHere ( start, 1 ) ;
}

void
CFT_For_PrefixCombinators ( )
{
    Word * currentWord0 = CFT_WordList ( 0 ) ;
    currentWord0->W_SC_Index = _Lexer_->SC_Index ;
    //_Compiler_->SemicolonEndsThisBlock = true ;
    _Compiler_->TakesLParenAsBlock = true ;
    _Compiler_->BeginBlockFlag = false ;
    CFT_Interpret_C_Blocks ( 4, 0, 1 ) ;
    _Context_->SC_CurrentCombinator = currentWord0 ;
    CFT_ForCombinator ( ) ;
}

void
CFT_Loop_PrefixCombinators ( )
{
    Word * currentWord0 = CFT_WordList ( 0 ) ;
    currentWord0->W_SC_Index = _Lexer_->SC_Index ;
    _Compiler_->BeginBlockFlag = false ;
    CFT_Interpret_C_Blocks ( 1, 0, 0 ) ;
    _Context_->SC_CurrentCombinator = currentWord0 ;
    CFT_LoopCombinator ( ) ;
}

void
CFT_While_PrefixCombinators ( )
{
    Word * currentWord0 = CFT_WordList ( 0 ) ;
    currentWord0->W_SC_Index = _Lexer_->SC_Index ;
    byte * start = Here ;
    _Compiler_->TakesLParenAsBlock = true ;
    _Compiler_->BeginBlockFlag = false ;
    CFT_Interpret_C_Blocks ( 2, 0, 0 ) ;
    _Context_->SC_CurrentCombinator = currentWord0 ;
    if ( ! CFT_WhileCombinator ( ) ) SetHere ( start, 1 ) ;
}

void
_CFT_Typedef ( void )
{
    int64 size = _CFT_Parse_Typedef_Field ( ) ;
    //DataStack_Push ( size ) ;
}

void
CFT_TypedefStructEnd ( void )
{
    Namespace_SetAsNotUsing ( ( byte* ) "C_Typedef" ) ;
    //Compiler_SetAs_InNamespace_C_BackgroundNamespace ( _Compiler_ ) ;
}

// infix equal is unique in 'C' because the right hand side of '=' runs to the ';'

// type : typedef

