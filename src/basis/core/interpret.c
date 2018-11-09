
#include "../../include/cfrtil64.h"

Word *
Interpreter_SetupNextWord ( Interpreter * interp )
{
    Word * word = 0 ;
    byte * token = Lexer_ReadToken ( interp->Lexer0 ) ;
    if ( token ) word = _Interpreter_TokenToWord ( interp, token ) ;
    else SetState ( _Context_->Lexer0, LEXER_END_OF_LINE, true ) ;
    return word ;
}

Word *
Interpreter_InterpretAToken ( Interpreter * interp, byte * token, int64 tokenStartReadLineIndex )
{
    Word * word = 0 ;
    if ( token )
    {
        word = _Interpreter_TokenToWord ( interp, token ) ;
        Interpreter_DoWord ( interp, word, tokenStartReadLineIndex, - 1 ) ;
    }
    else SetState ( _Context_->Lexer0, LEXER_END_OF_LINE, true ) ;
    return word ;
}

void
Interpreter_InterpretNextToken2 ( Interpreter * interp )
{
    Word * word = Interpreter_SetupNextWord ( interp ) ;
    Interpreter_DoWord ( interp, word, - 1, - 1 ) ;
}

void
Interpreter_InterpretNextToken ( Interpreter * interp )
{
    byte * token = Lexer_ReadToken ( interp->Lexer0 ) ;
    Interpreter_InterpretAToken ( interp, token, - 1 ) ;
}

Word *
Interpreter_DoWord_Default ( Interpreter * interp, Word * word0, int64 tsrli, int64 scwi )
{
    Word * word = Compiler_CopyDuplicatesAndPush ( word0 ) ;
    Lexer_Set_ScIndex_RlIndex ( interp->Lexer0, word, tsrli, scwi ) ;
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
    if ( GetState ( _Context_, C_SYNTAX ) && ( word->CAttribute & (CATEGORY_OP_EQUAL|CATEGORY_OP_OPEQUAL) ) )
    {
        if ( ( word->CAttribute2 & C_INFIX_OP_EQUAL ) ) SetState ( compiler, C_INFIX_EQUAL, true ) ;
        token = Interpret_C_Until_Token4 ( interp, ( byte* ) ";", ( byte* ) ",", ( byte* ) ")", ( byte* ) "]", ( byte* ) " \n\r\t" ) ;
    }
    else Interpreter_InterpretNextToken ( interp ) ;
    // then continue and interpret this 'word' - just one out of lexical order
    SetState ( compiler, DOING_BEFORE_AN_INFIX_WORD, false ) ; //svState ) ;
    Interpreter_DoWord_Default ( interp, word, word->W_RL_Index, word->W_SC_Index ) ;
    if ( token ) Interpreter_InterpretAToken ( interp, token, -1 ) ;
    SetState ( compiler, ( DOING_AN_INFIX_WORD | C_INFIX_EQUAL ), false ) ; //svState ) ;
}

void
_Interpreter_DoPrefixWord ( Context * cntx, Interpreter * interp, Word * word )
{
    //Lexer_Set_ScIndex_RlIndex ( interp->Lexer0, word, tsrli, scwi ) ;
    SetState ( cntx->Compiler0, ( DOING_A_PREFIX_WORD | DOING_BEFORE_A_PREFIX_WORD ), true ) ;
    Interpret_PrefixFunction_Until_RParen ( interp, word ) ;
    SetState ( cntx->Compiler0, DOING_A_PREFIX_WORD, false ) ;
}

void
Interpreter_DoPrefixWord ( Context * cntx, Interpreter * interp, Word * word )
{
    if ( _Interpreter_IsWordPrefixing ( interp, word ) )
    {
        _Interpreter_DoPrefixWord ( cntx, interp, word ) ;
    }
    else if ( word->CAttribute & CATEGORY_OP_1_ARG ) Interpreter_DoInfixWord ( interp, word ) ; //goto doInfix ;
    else _SyntaxError ( "Attempting to call a prefix function without following parenthesized args", 1 ) ;
}

void
Interpreter_C_PREFIX_RTL_ARGS_Word ( Word * word )
{
    //Word_SetTsrliScwi ( word, tsrli, scwi ) ;
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
        Word_SetTsrliScwi ( word, tsrli, scwi ) ;
        DEBUG_SETUP ( word ) ;
        Context * cntx = _Context_ ;
        interp->w_Word = word ;
        if ( ( word->WAttribute == WT_INFIXABLE ) && ( GetState ( cntx, INFIX_MODE ) ) ) // nb. Interpreter must be in INFIX_MODE because it is effective for more than one word
            Interpreter_DoInfixWord ( interp, word ) ;
        else if ( word->CAttribute & PREFIX ) _Interpreter_DoPrefixWord ( cntx, interp, word ) ; //, tsrli, scwi ) ;
        else if ( Interpreter_IsWordPrefixing ( interp, word ) ) _Interpreter_DoPrefixWord ( cntx, interp, word ) ; //, tsrli, scwi ) ;
        else if ( word->WAttribute == WT_C_PREFIX_RTL_ARGS ) Interpreter_C_PREFIX_RTL_ARGS_Word ( word ) ;
        else Interpreter_DoWord_Default ( interp, word, tsrli, scwi ) ; //  case WT_POSTFIX: case WT_INFIXABLE: // cf. also _Interpreter_SetupFor_MorphismWord
        if ( ! ( word->CAttribute & DEBUG_WORD ) ) interp->LastWord = word ;
        if ( ! GetState ( _Context_, ( C_SYNTAX ) ) ) List_InterpretLists ( _Compiler_->PostfixLists ) ;
    }
}
// interpret with find after parse for known objects
// !! this version eliminates the possiblity of numbers being used as words !!
// objects and morphisms - terms from category theory

Word *
_Interpreter_TokenToWord ( Interpreter * interp, byte * token )
{
    Word * word = 0 ;
    if ( token )
    {
        interp->Token = token ;
        word = Finder_Word_FindUsing ( interp->Finder0, token, 0 ) ;
        if ( ! word ) word = Lexer_ObjectToken_New ( interp->Lexer0, token ) ;
        int64 tsrli = - 1, scwi = - 1 ;
        Word_SetTsrliScwi ( word, tsrli, scwi ) ;
        DEBUG_SETUP ( word ) ;
    }
    return word ;
}

Word *
Interpreter_ReadNextTokenToWord ( Interpreter * interp )
{
    Word * word = 0 ;
    byte * token ;
    if ( token = Lexer_ReadToken ( interp->Lexer0 ) ) word = _Interpreter_TokenToWord ( interp, token ) ;
    else SetState ( _Context_->Lexer0, LEXER_END_OF_LINE, true ) ;
    return word ;
}

Boolean
_Interpreter_IsWordPrefixing ( Interpreter * interp, Word * word )
{
    // with this any postfix word that is not a keyword or a c rtl arg word can now be used prefix with parentheses 
    byte c = Lexer_NextNonDelimiterChar ( interp->Lexer0 ) ;
    if ( ( c == '(' ) ) return true ;
    else return false ;
}

Boolean
Interpreter_IsWordPrefixing ( Interpreter * interp, Word * word )
{
    if ( GetState ( _Context_, LC_INTERPRET ) ) return true ;
    else if ( ( GetState ( _Context_, PREFIX_MODE ) ) && ( ! ( word->CAttribute & KEYWORD ) ) && ( ! ( word->WAttribute & WT_C_PREFIX_RTL_ARGS ) ) ) //_Namespace_IsUsing ( _CfrTil_->LispNamespace ) ) )
    //else if ( ( ! ( word->CAttribute & KEYWORD ) ) && ( ! ( word->WAttribute & WT_C_PREFIX_RTL_ARGS ) ) ) //_Namespace_IsUsing ( _CfrTil_->LispNamespace ) ) )
    {
        return _Interpreter_IsWordPrefixing ( interp, word ) ;
    }
    return false ;
}


#if 0

void
IsIt_C_LeftParen ( Word * word )
{
    if ( String_Equal ( word->Name, "(" ) && String_Equal ( word->S_ContainingNamespace->Name, "C" ) )
    {
        _Printf ( "\nCompiler_CopyDuplicatesAndPush : \'%s.%s\' : %s\n", word->S_ContainingNamespace->Name, word->Name, Context_Location ( ) ) ;
        Pause ( ) ;
    }
}

void
Find_C_LeftParen ( )
{
    Word * word = _Finder_FindWord_InOneNamespace ( _Finder_, Namespace_Find ( "C" ), "(" ) ;
    if ( word )
    {
        //if (String_Equal ( word->Name, "(" ) && String_Equal ( word->S_ContainingNamespace->Name, "C" ) )
        {
            //_Printf ( "\nFind_C_LeftParen : \'%s.%s\' : %s\n", word->S_ContainingNamespace->Name, word->Name, Context_Location ( ) ) ;
            //Pause ( ) ;
        }
    }
    else
    {
        _Printf ( "\nFind_C_LeftParen : can't find it at : %s\n", Context_Location ( ) ) ;
        Pause ( ) ;
    }
}
#endif

