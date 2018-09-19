
#include "../../include/cfrtil64.h"

Word *
Interpreter_SetupNextWord ( Interpreter * interp )
{
    Word * word = 0 ;
    byte * token = Lexer_ReadToken ( interp->Lexer0 ) ;
    if ( token )
    {
        word = _Interpreter_TokenToWord ( interp, token ) ;
    }
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
        _Interpreter_DoWord ( interp, word, tokenStartReadLineIndex, - 1 ) ;
    }
    else SetState ( _Context_->Lexer0, LEXER_END_OF_LINE, true ) ;
    return word ;
}

void
Interpreter_InterpretNextToken2 ( Interpreter * interp )
{
    Word * word = Interpreter_SetupNextWord ( interp ) ;
    _Interpreter_DoWord ( interp, word, - 1, - 1 ) ;
}

void
Interpreter_InterpretNextToken ( Interpreter * interp )
{
    byte * token = Lexer_ReadToken ( interp->Lexer0 ) ;
    Interpreter_InterpretAToken ( interp, token, - 1 ) ;
}

Word *
_Interpreter_DoWord_Default ( Interpreter * interp, Word * word0, int64 tsrli, int64 scwi )
{
    Word * word = Compiler_CopyDuplicatesAndPush ( word0 ) ;
    word->W_SC_Index = ( scwi != - 1 ) ? scwi : _Lexer_->SC_Index ;
    word->W_RL_Index = ( tsrli != - 1 ) ? tsrli : _Lexer_->TokenStart_ReadLineIndex ;
    interp->w_Word = word ;
    Word_Eval ( word ) ;
    if ( IS_MORPHISM_TYPE ( word ) ) SetState ( _Context_, ADDRESS_OF_MODE, false ) ;
    return word ; //let callee know about actual word evaled here after Compiler_CopyDuplicatesAndPush
}

void
Interpreter_DoInfixWord ( Interpreter * interp, Word * word, int64 tsrli, int64 scwi )
{
    //DEBUG_SETUP ( word ) ;
    SetState ( _Compiler_, DOING_AN_INFIX_WORD, true ) ;
    Interpreter_InterpretNextToken ( interp ) ;
    // then continue and interpret this 'word' - just one out of lexical order
    _Interpreter_DoWord_Default ( interp, word, tsrli, scwi ) ;
    SetState ( _Compiler_, DOING_AN_INFIX_WORD, false ) ;
}

void
_Interpreter_DoPrefixWord ( Context * cntx, Interpreter * interp, Word * word )
{
    DEBUG_SETUP ( word ) ;
    SetState ( cntx->Compiler0, DOING_A_PREFIX_WORD, true ) ;
    _Interpret_PrefixFunction_Until_RParen ( interp, word ) ;
    SetState ( cntx->Compiler0, DOING_A_PREFIX_WORD, false ) ;
}

void
Interpreter_DoPrefixWord ( Context * cntx, Interpreter * interp, Word * word, int64 tsrli, int64 scwi )
{
    if ( _Interpreter_IsWordPrefixing ( interp, word ) )
    {
        _Interpreter_DoPrefixWord ( cntx, interp, word ) ;
    }
    else if ( word->CAttribute & CATEGORY_OP_1_ARG ) Interpreter_DoInfixWord ( interp, word, tsrli, scwi ) ; //goto doInfix ;
    else _SyntaxError ( "Attempting to call a prefix function without following parenthesized args", 1 ) ;
}

void
Interpreter_C_PREFIX_RTL_ARGS_Word ( Word * word, int64 tsrli, int64 scwi )
{
    //DEBUG_SETUP ( word ) ;
    word->W_RL_Index = tsrli = ( tsrli != - 1 ) ? tsrli : _Lexer_->TokenStart_ReadLineIndex ;
    word->W_SC_Index = scwi = ( scwi != - 1 ) ? scwi : _Lexer_->SC_Index ;
    LC_CompileRun_C_ArgList ( word ) ;
}

// four types of words related to syntax
// 1. regular rpn - reverse polish notation
// 2. regular prefix : polish, prefix notation where the function precedes the arguments - as in lisp
// 3. infix which takes one (or more) following 'args' and then becomes regular rpn : here only one arg is currently accepted
// 4. C arg lists which are left to right but are evaluated right to left, ie. the rightmost operand goes on the stack first then the next rightmost and so on such that topmost is the left operand
// we just rearrange the functions and args such that they all become regular rpn - forth like
void
_Interpreter_DoWord ( Interpreter * interp, Word * word, int64 tsrli, int64 scwi )
{
    if ( word )
    {
        Context * cntx = _Context_ ;
        interp->w_Word = word ;
        if ( ( word->WAttribute == WT_INFIXABLE ) && ( GetState ( cntx, INFIX_MODE ) ) ) // nb. Interpreter must be in INFIX_MODE because it is effective for more than one word
            Interpreter_DoInfixWord ( interp, word, tsrli, scwi ) ;
        else if ( word->CAttribute & PREFIX ) //WAttribute == WT_PREFIX ) 
            Interpreter_DoPrefixWord ( cntx, interp, word, tsrli, scwi ) ;
        else if ( Interpreter_IsWordPrefixing ( interp, word ) ) Interpreter_DoPrefixWord ( cntx, interp, word, tsrli, scwi ) ;
        else if ( word->WAttribute == WT_C_PREFIX_RTL_ARGS )
            Interpreter_C_PREFIX_RTL_ARGS_Word ( word, tsrli, scwi ) ;
        else _Interpreter_DoWord_Default ( interp, word, tsrli, scwi ) ; //  case WT_POSTFIX: case WT_INFIXABLE: // cf. also _Interpreter_SetupFor_MorphismWord
        if ( ! ( word->CAttribute & DEBUG_WORD ) ) interp->LastWord = word ;
        if ( ! GetState ( _Context_, ( C_SYNTAX ) ) ) List_InterpretLists ( _Compiler_->PostfixLists ) ;
    }
}
// interpret with find after parse for known objects
// !! this version eliminates the possiblity of numbers being used as words !!
// objects and morphismsm - terms from category theory

Word *
_Interpreter_NewWord ( Interpreter * interp, byte * token )
{
    if ( token )
    {
        Word * word = Lexer_ObjectToken_New ( interp->Lexer0, token ) ;
        if ( word )
        {
            if ( ( interp->Lexer0->TokenType & T_RAW_STRING ) && ( GetState ( _Q_, AUTO_VAR ) ) ) // this logic needs to be simplified with Lexer_ObjectToken_New
            {
                if ( Compiling && GetState ( _Context_, C_SYNTAX ) )
                {
                    byte * token2 = Lexer_PeekNextNonDebugTokenWord ( _Lexer_, 1 ) ;
                    if ( ! String_Equal ( token2, "=" ) ) return 0 ; // it was already 'interpreted' by Lexer_ObjectToken_New
                }
            }
            word->W_SC_Index = _Lexer_->SC_Index ;
            return interp->w_Word = word ;
        }
    }
}

Word *
_Interpreter_TokenToWord ( Interpreter * interp, byte * token )
{
    Word * word = 0 ;
    if ( token )
    {
        interp->Token = token ;
        word = Finder_Word_FindUsing ( interp->Finder0, token, 0 ) ;
        if ( ! word )
        {
            word = _Interpreter_NewWord ( interp, token ) ;
        }
    }
    return interp->w_Word = word ;
}

Word *
Interpreter_ReadNextTokenToWord ( Interpreter * interp )
{
    Word * word = 0 ;
    byte * token ;
    if ( token = Lexer_ReadToken ( interp->Lexer0 ) )
    {
        word = _Interpreter_TokenToWord ( interp, token ) ;
    }
    else SetState ( _Context_->Lexer0, LEXER_END_OF_LINE, true ) ;
    return word ;
}

Boolean
_Interpreter_IsWordPrefixing ( Interpreter * interp, Word * word )
{
    // with this any postfix word that is not a keyword or a c rtl arg word can now be used prefix with parentheses 
    byte c = Lexer_NextNonDelimiterChar ( interp->Lexer0 ) ;
    if ( ( c == '(' ) )
    {
        return true ;
    }
    else return false ;
}

Boolean
Interpreter_IsWordPrefixing ( Interpreter * interp, Word * word )
{
    if ( GetState ( _Context_, LC_INTERPRET ) ) return true ;
    else if ( ( GetState ( _Context_, PREFIX_MODE ) ) && ( ! ( word->CAttribute & KEYWORD ) ) && ( ! ( word->WAttribute & WT_C_PREFIX_RTL_ARGS ) ) ) //_Namespace_IsUsing ( _CfrTil_->LispNamespace ) ) )
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

