
#include "../include/cfrtil64.h"

void
CfrTil_Token ( )
{
    DataStack_Push ( ( int64 ) Lexer_ReadToken ( _Lexer_ ) ) ;
}

void
CfrTil_TokenQID ( )
{
    byte * token ;
    Word * word ;
    while ( 1 )
    {
        token = Lexer_ReadToken ( _Lexer_ ) ;
        word = _Interpreter_TokenToWord ( _Interpreter_, token, -1, -1 ) ;
        Boolean isForwardDotted = ReadLiner_IsTokenForwardDotted ( _ReadLiner_, word->W_RL_Index ) ;
        if ( ( isForwardDotted ) || ( token[0] == '.' )) Word_Eval ( word ) ;
            //Interpreter_DoWord ( _Interpreter_, word, -1, -1 ) ; // Word_Eval ( word ) ;
        else break ;
    }
    if ( GetState ( _Lexer_, LEXER_END_OF_LINE ) ) SetState ( _Interpreter_, END_OF_LINE, true ) ; 
    //Interpreter_SetLexState ( _Interpreter_ ) ;
    DataStack_Push ( ( int64 ) token ) ;
}

void
CfrTil_FilenameToken ( )
{
    byte * token = _Lexer_LexNextToken_WithDelimiters ( _Lexer_, 0, 1, 0, 1, LEXER_ALLOW_DOT ) ;
    DataStack_Push ( ( int64 ) token ) ;
}

void
CfrTil_SingleQuote ( )
{
    _CfrTil_SingleQuote ( ) ;
}

void
CfrTil_Tick ( )
{
    _CfrTil_SingleQuote ( ) ;
}


void
Parse_SkipUntil_EitherToken_OrNewline ( byte * end1, byte* end2 )
{
    byte * token ; int64 inChar ;
    ReadLiner * rl = _Context_->ReadLiner0 ;
    do
    {
        if ( ( token = Lexer_ReadToken ( _Context_->Lexer0 ) ) )
        {
            if ( ( end1 && String_Equal ( token, end1 ) ) || ( end2 && String_Equal ( token, end2 ) ) ) break ;
        }
        inChar = ReadLine_PeekNextChar ( rl ) ;
        if ( ( inChar == 0 ) || ( inChar == - 1 ) || ( inChar == eof ) || ReadLine_AreWeAtNewlineAfterSpaces ( rl ) ) break ;
    }
    while ( token ) ;
}

void
CfrTil_Parse ( )
{
    Lexer * lexer = _Context_->Lexer0 ;
    byte * token = ( byte* ) DataStack_Pop ( ) ;
    Lexer_ParseObject ( lexer, token ) ;
    DataStack_Push ( lexer->Literal ) ;
}

void
CfrTil_DoubleQuoteMacro ( )
{
    Lexer_ParseDoubleQuoteMacro ( _Lexer_ ) ;
}


