
#include "../../include/csl.h"

// could be integrated with Lexer_ParseToken_ToWord ??
Word *
_Interpreter_TokenToWord ( Interpreter * interp, byte * token, int64 tsrli, int64 scwi )
{
    Word * word ;
    Context * cntx = _Context_ ;
    cntx->CurrentTokenWord = 0 ;
    if ( token )
    {
        interp->Token = token ;
        cntx->CurrentToken = token ;
        word = Lexer_ParseToken_ToWord ( interp->Lexer0, token, tsrli, scwi ) ;
        Word_SetTsrliScwi ( word, tsrli, scwi ) ;
        DEBUG_SETUP ( word ) ;
        cntx->CurrentTokenWord = word ; // dbg flag
        cntx->TokenDebugSetupWord = word ;
    }
    return cntx->CurrentTokenWord ; // allow DEBUG_SETUP to set this to 0 to skip interpreting it when it is 'stepped'
}

Word *
Interpreter_InterpretAToken ( Interpreter * interp, byte * token, int64 tsrli, int64 scwi )
{
    Word * word = 0 ;
    if ( token )
    {
        interp->Token = token ;
        word = _Interpreter_TokenToWord ( interp, token, tsrli, scwi ) ;
        Interpreter_DoWord ( interp, word, tsrli, scwi ) ;
    }
    Interpreter_SetLexState ( interp ) ;
    return word ;
}

void
Interpreter_InterpretNextToken ( Interpreter * interp )
{
    byte * token = Lexer_ReadToken ( interp->Lexer0 ) ;
    interp->LastLexedChar = interp->Lexer0->LastLexedChar ;
    Interpreter_InterpretAToken ( interp, token, _Lexer_->TokenStart_ReadLineIndex, _Lexer_->SC_Index ) ;
}

Word *
Interpreter_DoWord_Default ( Interpreter * interp, Word * word0, int64 tsrli, int64 scwi )
{
    Word * word = Compiler_CopyDuplicatesAndPush ( word0, tsrli, scwi ) ;
    interp->w_Word = word ;
    Word_Eval ( word ) ;
    return word ; //let callee know about actual word evaled here after Compiler_CopyDuplicatesAndPush
}

void
Interpreter_DoInfixWord ( Interpreter * interp, Word * word )
{
    byte * token = 0 ;
    Compiler * compiler = _Compiler_ ;
    SetState ( compiler, ( DOING_AN_INFIX_WORD | DOING_BEFORE_AN_INFIX_WORD ), true ) ;
    if ( GetState ( _Context_, C_SYNTAX ) && ( word->W_MorphismAttributes & ( CATEGORY_OP_EQUAL | CATEGORY_OP_OPEQUAL ) ) ) //&& ( ! GetState ( compiler, DOING_C_TYPE ) ) )
    {
        if ( ( word->W_MorphismAttributes & C_INFIX_OP_EQUAL ) ) SetState ( compiler, C_INFIX_EQUAL, true ) ;
        token = Interpret_C_Until_Token4 ( interp, ( byte* ) ";", ( byte* ) ",", ( byte* ) ")", ( byte* ) "]", ( byte* ) " \n\r\t", 0 ) ;
    }
    else Interpreter_InterpretNextToken ( interp ) ;
    // then continue and interpret this 'word' - just one out of lexical order
    SetState ( compiler, DOING_BEFORE_AN_INFIX_WORD, false ) ; //svState ) ;
    //if ( ! GetState ( _Debugger_, DBG_INFIX_PREFIX ) ) 
    Interpreter_DoWord_Default ( interp, word, word->W_RL_Index, word->W_SC_Index ) ;
    SetState ( compiler, ( DOING_AN_INFIX_WORD | C_INFIX_EQUAL ), false ) ; //svState ) ;
}

void
_Interpreter_DoPrefixWord ( Context * cntx, Interpreter * interp, Word * word )
{
    SetState ( cntx->Compiler0, ( DOING_A_PREFIX_WORD | DOING_BEFORE_A_PREFIX_WORD ), true ) ;
    Interpret_PrefixFunction_OrUntil_RParen ( interp, word ) ;
    SetState ( cntx->Compiler0, DOING_A_PREFIX_WORD, false ) ;
}

void
Interpreter_DoPrefixWord ( Context * cntx, Interpreter * interp, Word * word )
{
    if ( Lexer_IsNextWordLeftParen ( interp->Lexer0 ) ) _Interpreter_DoPrefixWord ( cntx, interp, word ) ;
    else if ( word->W_MorphismAttributes & CATEGORY_OP_1_ARG ) Interpreter_DoInfixWord ( interp, word ) ; //goto doInfix ;
    else _SyntaxError ( ( byte* ) "Attempting to call a prefix function without following parenthesized args", 1 ) ;
}

void
Interpreter_C_PREFIX_RTL_ARGS_Word ( Word * word )
{
    LC_CompileRun_C_ArgList ( word ) ;
}

Boolean
Interpreter_DoInfixOrPrefixWord ( Interpreter * interp, Word * word )
{
    if ( word ) //IS_MORPHISM_TYPE ( word) )
    {
        Context * cntx = _Context_ ;
        //interp->w_Word = word ;
        if ( ( word->W_TypeAttributes == WT_INFIXABLE ) && ( GetState ( cntx, INFIX_MODE ) ) ) Interpreter_DoInfixWord ( interp, word ) ;
            // nb. Interpreter must be in INFIX_MODE because it is effective for more than one word
        else if ( ( word->W_TypeAttributes == WT_PREFIX ) || Lexer_IsWordPrefixing ( interp->Lexer0, word ) )
            //else if ( Lexer_IsWordPrefixing ( interp->Lexer0, word ) &&  ( ( word->W_TypeAttributes == WT_PREFIX ) || GetState ( _Context_, C_SYNTAX ) ) )
            _Interpreter_DoPrefixWord ( cntx, interp, word ) ; //, tsrli, scwi ) ;
        else if ( word->W_TypeAttributes == WT_C_PREFIX_RTL_ARGS ) Interpreter_C_PREFIX_RTL_ARGS_Word ( word ) ;
        else return false ;
        return true ;
    }
    return false ;
}
// four types of words related to syntax
// 1. regular rpn - reverse polish notation
// 2. regular prefix : polish, prefix notation where the function precedes the arguments - as in lisp
// 3. infix which takes one (or more) following 'args' and then becomes regular rpn : here only one arg is currently accepted
// 4. C arg lists which are left to right but are evaluated right to left, ie. the rightmost operand goes on the stack first then the next rightmost and so on such that topmost is the left operand
// we just rearrange the functions and args such that they all become regular rpn - forth like

void
Interpreter_DoWord ( Interpreter * interp, Word * word, int64 tsrli, int64 scwi )
{
    if ( word )
    {
        Word_SetTsrliScwi ( word, tsrli, scwi ) ; // some of this maybe too much
        interp->w_Word = word ;
        if ( ! Interpreter_DoInfixOrPrefixWord ( interp, word ) ) Interpreter_DoWord_Default ( interp, word, tsrli, scwi ) ; //  case WT_POSTFIX: case WT_INFIXABLE: // cf. also _Interpreter_SetupFor_MorphismWord
        if ( ! ( word->W_MorphismAttributes & DEBUG_WORD ) ) interp->LastWord = word ;
        if ( ! GetState ( _Context_, ( C_SYNTAX ) ) ) List_InterpretLists ( _Compiler_->PostfixLists ) ; // with C_SYNTAX this is done in by _CSL_C_Infix_EqualOp or CSL_Interpret_C_Blocks
    }
}
// interpret with find after parse for known objects
// !! this version eliminates the possiblity of numbers being used as words !!
// objects and morphisms - terms from category theory

Word *
Interpreter_ReadNextTokenToWord ( Interpreter * interp )
{
    Word * word = 0 ;
    byte * token ;
    if ( token = Lexer_ReadToken ( interp->Lexer0 ) ) word = _Interpreter_TokenToWord ( interp, token, - 1, - 1 ) ;
    else SetState ( _Context_->Lexer0, LEXER_END_OF_LINE, true ) ;
    return word ;
}

Boolean
Word_IsSyntactic ( Word * word )
{
    if ( ( ! GetState ( _Debugger_, DBG_INFIX_PREFIX ) )
        && ( ( word->W_TypeAttributes & ( WT_PREFIX | WT_C_PREFIX_RTL_ARGS ) ) || ( Lexer_IsWordPrefixing ( _Lexer_, word )
        || ( ( word->W_TypeAttributes == WT_INFIXABLE ) && ( GetState ( _Context_, INFIX_MODE ) ) ) ) ) )
        return true ;
    else return false ;
}

void
Interpreter_SetLexState ( Interpreter * interp )
{
    //if ( GetState ( _Lexer_, LEXER_END_OF_LINE ) ) SetState ( _Interpreter_, END_OF_LINE, true ) ; 
    byte llc = interp->LastLexedChar ;
    if ( llc == 0 ) SetState ( interp, END_OF_STRING, true ) ;
    else if ( llc == eof ) SetState ( interp, END_OF_FILE, true ) ;
        //else if ( ( llc == '\n' ) || GetState ( interp->Lexer0, LEXER_END_OF_LINE ) ) SetState ( interp, END_OF_LINE, true ) ;
    else if ( llc == '\n' ) SetState ( interp, END_OF_LINE, true ) ;
}

