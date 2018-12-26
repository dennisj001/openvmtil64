
#include "../include/cfrtil64.h"

void
CfrTil_Token ( )
{
    DataStack_Push ( ( int64 ) Lexer_ReadToken ( _Context_->Lexer0 ) ) ;
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
Parse_SkipUntil_EitherToken ( byte * end1, byte* end2 )
{
    byte * token ; int64 inChar ;
    do
    {
        if ( ( token = Lexer_ReadToken ( _Context_->Lexer0 ) ) )
        {
            if ( ( end1 && String_Equal ( token, end1 ) ) || ( end2 && String_Equal ( token, end2 ) ) ) break ;
        }
        inChar = ReadLine_PeekNextChar ( _Context_->ReadLiner0 ) ;
        if ( ( inChar == 0 ) || ( inChar == - 1 ) || ( inChar == eof ) ) token = 0 ;
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

