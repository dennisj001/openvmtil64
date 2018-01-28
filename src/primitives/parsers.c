
#include "../include/cfrtil64.h"

void
CfrTil_Token ( )
{
    DataStack_Push ( ( int64 ) Lexer_ReadToken ( _Context_->Lexer0 ) ) ;
}

void
CfrTil_SingleQuote ( )
{
    _CfrTil_SingleQuote () ;
}

void
CfrTil_Tick ( )
{
    _CfrTil_SingleQuote () ;
}


#if 0

void
Parse_SkipUntil_EitherToken ( byte * end1, byte* end2 )
{
    while ( 1 )
    {
        byte * token ;
        int64 inChar = ReadLine_PeekNextChar ( _Context_->ReadLiner0 ) ;
        if ( ( inChar == - 1 ) || ( inChar == eof ) ) break ;

        if ( ( token = ( char* ) Lexer_ReadToken ( _Context_->Lexer0 ) ) )
        {
            if ( String_Equal ( token, end1 ) ) break ;
            if ( String_Equal ( token, end2 ) ) break ;
        }
    }
}
#endif

void
Parse_SkipUntil_Token ( byte * end )
{
    while ( 1 )
    {
        byte * token ;
        int64 inChar = ReadLine_PeekNextChar ( _Context_->ReadLiner0 ) ;
        if ( ( inChar == 0 ) || ( inChar == - 1 ) || ( inChar == eof ) ) break ;

        if ( ( token = Lexer_ReadToken ( _Context_->Lexer0 ) ) )
        {
            if ( String_Equal ( token, end ) ) break ;
        }
    }
}

void
CfrTil_Parse ( )
{
    Lexer * lexer = _Context_->Lexer0 ;
    byte * token = ( byte* ) DataStack_Pop ( ) ;
    Lexer_ParseObject ( lexer, token ) ;
    DataStack_Push ( lexer->Literal ) ;
}

