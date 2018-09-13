
#include "../include/cfrtil64.h"


void
_Interpret_String ( byte *str )
{
    _CfrTil_ContextNew_InterpretString ( _CfrTil_, str ) ;
}

byte *
_Interpret_C_Until_EitherToken ( Interpreter * interp, byte * end1, byte * end2, byte* end3, byte * delimiters )
{
    byte * token = 0 ;
    while ( 1 )
    {
        token = _Lexer_ReadToken ( interp->Lexer0, delimiters ) ;
        List_CheckInterpretLists_OnVariable ( _Compiler_->PostfixLists, token ) ;
        if ( String_Equal ( token, end1 ) || String_Equal ( token, end2 ) || ( end3 ? String_Equal ( token, end3 ) : 0 ) ) break ;
        else if ( GetState ( interp->Compiler0, DOING_A_PREFIX_WORD ) && String_Equal ( token, ")" ) )
        {
            Interpreter_InterpretAToken ( interp, token, - 1 ) ;
            if ( ! Compiling ) _Compiler_FreeAllLocalsNamespaces ( _Compiler_ ) ;
            break ;
        }
        else if ( GetState ( _Context_, C_SYNTAX ) && ( String_Equal ( token, "," ) || String_Equal ( token, ";" ) ) ) break ;
        else Interpreter_InterpretAToken ( interp, token, - 1 ) ;
    }
    //CfrTil_WordList_PushToken ( token ) ;
    return token ;
}

byte *
_Interpret_Until_Token ( Interpreter * interp, byte * end, byte * delimiters )
{
    byte * token ;
    while ( 1 )
    {
        token = _Lexer_ReadToken ( interp->Lexer0, delimiters ) ;
        if ( token )
        {
            if ( String_Equal ( token, end ) )
            {
                if ( GetState ( _Context_->Compiler0, C_COMBINATOR_LPAREN ) && ( String_Equal ( token, ";" ) ) )
                {
                    _CfrTil_PushToken_OnTokenList ( token ) ;
                }
                break ;
            }
            if ( GetState ( _Context_, C_SYNTAX ) && String_Equal ( token, ";" ) && GetState ( _Compiler_, C_COMBINATOR_PARSING ) )
            {
                _CfrTil_PushToken_OnTokenList ( token ) ;
                break ;
            }
            else
            {
                d0 ( byte buffer [128] ;
                    snprintf ( ( char* ) buffer, 128, "\n_Interpret_Until_Token : before interpret of %s", ( char* ) token ) ;
                d0 ( if ( Is_DebugModeOn ) Compiler_SC_WordList_Show (buffer, 0, 0) ) ) ;
                Interpreter_InterpretAToken ( interp, token, - 1 ) ;
                d0 ( snprintf ( ( char* ) buffer, 128, "\n_Interpret_Until_Token : after interpret of %s", ( char* ) token ) ;
                if ( Is_DebugModeOn ) Compiler_SC_WordList_Show (buffer, 0, 0) ) ;
            }
        }
        else break ;
    }
    return token ;
}

void
_Interpret_PrefixFunction_Until_Token ( Interpreter * interp, Word * prefixFunction, byte * end, byte * delimiters )
{
    int64 svscwi = _CfrTil_->SC_Index ;
    _Interpret_Until_Token ( interp, end, delimiters ) ;
    SetState ( _Context_->Compiler0, PREFIX_ARG_PARSING, false ) ;
    if ( prefixFunction ) _Interpreter_DoWord_Default (interp, prefixFunction, -1, svscwi ) ;
}

void
_Interpret_PrefixFunction_Until_RParen ( Interpreter * interp, Word * prefixFunction )
{
    if ( prefixFunction )
    {
        Word * word ;
        byte * token ;
        int64 svs_c_rhs, flag = 0, svscwi = _CfrTil_->SC_Index ;
        Compiler * compiler = _Context_->Compiler0 ;
        while ( 1 )
        {
            token = Lexer_ReadToken ( interp->Lexer0 ) ; // skip the opening left paren
            if ( token && ( ! String_Equal ( token, "(" ) ) )
            {
                if ( word = Finder_Word_FindUsing ( interp->Finder0, token, 1 ) )
                {
                    if ( word->CAttribute & DEBUG_WORD )
                    {
                        continue ;
                    }
                    flag = 1 ;
                    break ;
                }
            }
            else break ;
        }
        d0 ( if ( Is_DebugModeOn ) Compiler_SC_WordList_Show ("\n_Interpret_PrefixFunction_Until_RParen", 0, 0) ) ;
        SetState ( compiler, PREFIX_ARG_PARSING, true ) ;
        if ( flag ) Interpreter_InterpretAToken ( interp, token, - 1 ) ;
        else _Interpret_Until_Token ( interp, ( byte* ) ")", ( byte* ) " ,\n\r\t" ) ;
        SetState ( compiler, PREFIX_ARG_PARSING, false ) ;
        _Interpreter_DoWord_Default (interp, prefixFunction, -1, svscwi ) ;
        if ( GetState ( _Context_, C_SYNTAX ) ) SetState ( _Context_, C_RHS, svs_c_rhs ) ;
        if ( ! Compiling ) _Compiler_FreeAllLocalsNamespaces ( compiler ) ;
    }
}

void
_Interpret_UntilFlagged ( Interpreter * interp, int64 doneFlags )
{
    while ( ( ! Interpreter_IsDone ( interp, doneFlags | INTERPRETER_DONE ) ) )
    {
        Interpreter_InterpretNextToken ( interp ) ;
    }
}

void
_Interpret_ToEndOfLine ( Interpreter * interp )
{
    int64 i ;
    ReadLiner * rl = interp->ReadLiner0 ;
    while ( 1 )
    {
        Interpreter_InterpretNextToken ( interp ) ;
        if ( GetState ( _Context_->Lexer0, LEXER_END_OF_LINE ) ) break ; // either the lexer with get a newline or the readLiner
        i = ReadLiner_PeekSkipSpaces ( rl ) ;
        if ( _ReadLine_PeekIndexedChar ( rl, i ) == '\n' ) break ;
    }
}

void
Interpret_UntilFlaggedWithInit ( Interpreter * interp, int64 doneFlags )
{
    Interpreter_Init ( interp ) ;
    _Interpret_UntilFlagged ( interp, doneFlags ) ;
}

void
_CfrTil_Interpret ( CfrTil * cfrTil )
{
    do
    {
        _CfrTil_Init_SessionCore ( cfrTil, 1, 1 ) ;
        Context_Interpret ( cfrTil->Context0 ) ;
    }
    while ( GetState ( cfrTil, CFRTIL_RUN ) ) ;
}

void
CfrTil_InterpreterRun ( )
{
    _CfrTil_Interpret ( _CfrTil_ ) ;
}

