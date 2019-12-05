
#include "../../include/cfrtil64.h"

void
Interpreter_SetLexState ( Interpreter * interp )
{
    if ( GetState ( _Lexer_, LEXER_END_OF_LINE ) ) SetState ( interp, END_OF_LINE, true ) ;
    if ( interp->LastLexedChar == 0 ) SetState ( interp, END_OF_STRING, true ) ;
    else if ( interp->LastLexedChar == eof ) SetState ( interp, END_OF_FILE, true ) ;
    else if ( interp->LastLexedChar == '\n' ) SetState ( interp, END_OF_LINE, true ) ;
}

Word *
Interpreter_InterpretAToken ( Interpreter * interp, byte * token, int64 tsrli, int64 scwi )
{
    Word * word = 0 ;
    if ( token )
    {
        word = _Interpreter_TokenToWord ( interp, token, tsrli, scwi ) ;
        Interpreter_DoWord ( interp, word, tsrli, scwi ) ;
    }
    else SetState ( _Context_->Lexer0, LEXER_END_OF_LINE, true ) ;
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
    if ( IS_MORPHISM_TYPE ( word ) ) SetState ( _Context_, ADDRESS_OF_MODE, false ) ;
    return word ; //let callee know about actual word evaled here after Compiler_CopyDuplicatesAndPush
}

void
Interpreter_DoInfixWord ( Interpreter * interp, Word * word )
{
    byte * token = 0 ;
    Compiler * compiler = _Compiler_ ;
    SetState ( compiler, ( DOING_AN_INFIX_WORD | DOING_BEFORE_AN_INFIX_WORD ), true ) ;
    if ( GetState ( _Context_, C_SYNTAX ) && ( word->CAttribute & ( CATEGORY_OP_EQUAL | CATEGORY_OP_OPEQUAL ) ) ) //&& ( ! GetState ( compiler, DOING_C_TYPE ) ) )
    {
        if ( ( word->CAttribute2 & C_INFIX_OP_EQUAL ) ) SetState ( compiler, C_INFIX_EQUAL, true ) ;
        token = Interpret_C_Until_Token4 ( interp, ( byte* ) ";", ( byte* ) ",", ( byte* ) ")", ( byte* ) "]", ( byte* ) " \n\r\t", 0 ) ;
    }
    else Interpreter_InterpretNextToken ( interp ) ;
    // then continue and interpret this 'word' - just one out of lexical order
    SetState ( compiler, DOING_BEFORE_AN_INFIX_WORD, false ) ; //svState ) ;
    Interpreter_DoWord_Default ( interp, word, word->W_RL_Index, word->W_SC_Index ) ;
    if ( token ) Interpreter_InterpretAToken ( interp, token, - 1, - 1 ) ;
    //List_InterpretLists ( _Compiler_->PostfixLists ) ; 
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
    else if ( word->CAttribute & CATEGORY_OP_1_ARG ) Interpreter_DoInfixWord ( interp, word ) ; //goto doInfix ;
    else _SyntaxError ( ( byte* ) "Attempting to call a prefix function without following parenthesized args", 1 ) ;
}

void
Interpreter_C_PREFIX_RTL_ARGS_Word ( Word * word )
{
    LC_CompileRun_C_ArgList ( word ) ;
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
        //if ( ( word->W_RL_Index != _Lexer_->TokenStart_ReadLineIndex ) || ( word->W_SC_Index != _Lexer_->SC_Index ) ) 
        Word_SetTsrliScwi ( word, tsrli, scwi ) ; // some of this maybe too much
        DEBUG_SETUP ( word ) ;
        Context * cntx = _Context_ ;
        interp->w_Word = word ;
        if ( ( word->WAttribute == WT_INFIXABLE ) && ( GetState ( cntx, INFIX_MODE ) ) ) // nb. Interpreter must be in INFIX_MODE because it is effective for more than one word
            Interpreter_DoInfixWord ( interp, word ) ;
            //else if ( ( word->CAttribute & PREFIX ) || Lexer_IsWordPrefixing (0, word ) ) _Interpreter_DoPrefixWord ( cntx, interp, word ) ; //, tsrli, scwi ) ;
        else if ( ( word->WAttribute == WT_PREFIX ) || Lexer_IsWordPrefixing ( 0, word ) ) _Interpreter_DoPrefixWord ( cntx, interp, word ) ; //, tsrli, scwi ) ;
        else if ( word->WAttribute == WT_C_PREFIX_RTL_ARGS ) Interpreter_C_PREFIX_RTL_ARGS_Word ( word ) ;
        else Interpreter_DoWord_Default ( interp, word, tsrli, scwi ) ; //  case WT_POSTFIX: case WT_INFIXABLE: // cf. also _Interpreter_SetupFor_MorphismWord
        if ( ! ( word->CAttribute & DEBUG_WORD ) ) interp->LastWord = word ;
        if ( ! GetState ( _Context_, ( C_SYNTAX ) ) ) List_InterpretLists ( _Compiler_->PostfixLists ) ; // with C_SYNTAX this is done in by _CfrTil_C_Infix_EqualOp or CfrTil_Interpret_C_Blocks
    }
}
// interpret with find after parse for known objects
// !! this version eliminates the possiblity of numbers being used as words !!
// objects and morphisms - terms from category theory

Word *
_Interpreter_TokenToWord ( Interpreter * interp, byte * token, int64 tsrli, int64 scwi )
{
    Word * word ;
    _Context_->CurrentTokenWord = 0 ;
    if ( token )
    {
        interp->Token = token ;
        word = Finder_Word_FindUsing ( interp->Finder0, token, 0 ) ;
        if ( word && interp->Compiler0->AutoVarTypeNamespace && ( word->CAttribute & NAMESPACE_VARIABLE ) ) word = 0 ;
        if ( ! word ) word = Lexer_ObjectToken_New ( interp->Lexer0, token, tsrli, scwi ) ;
        Word_SetTsrliScwi ( word, tsrli, scwi ) ;
        _Context_->CurrentTokenWord = word ;
        DEBUG_SETUP ( word ) ;
        if ( word ) SetState ( word, STEPPED, false ) ;
    }
    return _Context_->CurrentTokenWord ; // allow DEBUG_SETUP to set this to 0 to skip it when it is 'stepped'
}

Word *
Interpreter_ReadNextTokenToWord ( Interpreter * interp )
{
    Word * word = 0 ;
    byte * token ;
    if ( token = Lexer_ReadToken ( interp->Lexer0 ) ) word = _Interpreter_TokenToWord ( interp, token, - 1, - 1 ) ;
    else SetState ( _Context_->Lexer0, LEXER_END_OF_LINE, true ) ;
    return word ;
}

#if 0

Word *
Interpreter_SetupNextWord ( Interpreter * interp )
{
    Word * word = 0 ;
    byte * token = Lexer_ReadToken ( interp->Lexer0 ) ;
    if ( token ) word = _Interpreter_TokenToWord ( interp, token, _Lexer_->TokenStart_ReadLineIndex, _Lexer_->SC_Index ) ;
    else SetState ( _Context_->Lexer0, LEXER_END_OF_LINE, true ) ;
    return word ;
}

void
Interpreter_InterpretNextToken2 ( Interpreter * interp )
{
    Word * word = Interpreter_SetupNextWord ( interp ) ;
    Interpreter_DoWord ( interp, word, - 1, - 1 ) ;
}
#endif
