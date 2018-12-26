
#include "../include/cfrtil64.h"

void
Interpret_String ( byte *str )
{
    _CfrTil_ContextNew_InterpretString ( _CfrTil_, str ) ;
}

byte *
Interpret_C_Until_Token4 ( Interpreter * interp, byte * end1, byte * end2, byte* end3, byte* end4, byte * delimiters )
{
    byte * token ;
    int64 inChar ;
    do
    {
        token = _Lexer_ReadToken ( _Lexer_, delimiters ) ;
        List_CheckInterpretLists_OnVariable ( _Compiler_->PostfixLists, token ) ;
        if ( String_Equal ( token, end1 ) || String_Equal ( token, end2 ) 
            || ( end3 ? String_Equal ( token, end3 ) : 0 ) || ( end4 ? String_Equal ( token, end4 ) : 0 ) ) break ;
        else if ( GetState ( _Compiler_, DOING_A_PREFIX_WORD ) && String_Equal ( token, ")" ) )
        {
            Interpreter_InterpretAToken (interp, token, - 1 , -1) ;
            if ( ! Compiling ) 
                _Compiler_FreeAllLocalsNamespaces ( _Compiler_ ) ;
            break ;
        }
        else if ( GetState ( _Context_, C_SYNTAX ) && ( String_Equal ( token, "," ) || String_Equal ( token, ";" ) ) )
        {
            CfrTil_ArrayModeOff ( ) ;
            break ;
        }
        else Interpreter_InterpretAToken (interp, token, - 1 , -1) ; 
        inChar = ReadLine_PeekNextChar ( _Context_->ReadLiner0 ) ;
        if ( ( inChar == 0 ) || ( inChar == - 1 ) || ( inChar == eof ) ) token = 0 ;
    }
    while ( token ) ;
    if ( token ) CfrTil_PushToken_OnTokenList ( token ) ;
    return token ;
}

byte *
Interpret_Until_Token ( Interpreter * interp, byte * end, byte * delimiters )
{
    byte * token ;
    int64 inChar ;
    do
    {
        token = _Lexer_ReadToken ( _Lexer_, delimiters ) ;
        if ( String_Equal ( token, end ) )
        {
            if ( GetState ( _Compiler_, C_COMBINATOR_LPAREN ) && ( String_Equal ( token, ";" ) ) ) CfrTil_PushToken_OnTokenList ( token ) ;
            break ;
        }
        if ( String_Equal ( token, ";" ) && GetState ( _Context_, C_SYNTAX ) && GetState ( _Compiler_, C_COMBINATOR_PARSING ) )
        {
            CfrTil_PushToken_OnTokenList ( token ) ;
            CfrTil_ArrayModeOff ( ) ;
            break ;
        }
        else Interpreter_InterpretAToken (interp, token, - 1 , -1) ;
        inChar = ReadLine_PeekNextChar ( _Context_->ReadLiner0 ) ;
        if ( ( inChar == 0 ) || ( inChar == - 1 ) || ( inChar == eof ) ) token = 0 ;
    }
    while ( token ) ;
    //if ( token ) _CfrTil_PushToken_OnTokenList ( token ) ;
    return token ;
}

void
Interpret_PrefixFunction_Until_Token ( Interpreter * interp, Word * prefixFunction, byte * end, byte * delimiters )
{
    int64 svscwi = _CfrTil_->SC_Index ;
    Interpret_Until_Token ( interp, end, delimiters ) ;
    SetState ( _Context_->Compiler0, PREFIX_ARG_PARSING, false ) ;
    if ( prefixFunction ) Interpreter_DoWord_Default ( interp, prefixFunction, - 1, svscwi ) ;
}

void
Interpret_PrefixFunction_Until_RParen ( Interpreter * interp, Word * prefixFunction )
{
    if ( prefixFunction )
    {
        Word * word ;
        byte * token ;
        int64 svs_c_rhs, flag = 0 ; //, svscwi = _CfrTil_->SC_Index ;
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
        d0 ( if ( Is_DebugModeOn ) Compiler_SC_WordList_Show ( "\n_Interpret_PrefixFunction_Until_RParen", 0, 0 ) ) ;
        SetState ( compiler, PREFIX_ARG_PARSING, true ) ;
        if ( flag ) Interpreter_InterpretAToken (interp, token, - 1 , -1) ;
        else Interpret_Until_Token ( interp, ( byte* ) ")", ( byte* ) " ,\n\r\t" ) ;
        SetState ( compiler, ( DOING_BEFORE_A_PREFIX_WORD ), false ) ;
        Interpreter_DoWord_Default ( interp, prefixFunction, prefixFunction->W_RL_Index, prefixFunction->W_SC_Index ) ;
        SetState ( compiler, ( PREFIX_ARG_PARSING | DOING_A_PREFIX_WORD ), false ) ;
        if ( GetState ( _Context_, C_SYNTAX ) ) SetState ( _Context_, C_RHS, svs_c_rhs ) ;
        //if ( ! Compiling ) _Compiler_FreeAllLocalsNamespaces ( compiler ) ; // should this be here??!??
    }
}

void
Interpret_UntilFlagged ( Interpreter * interp, int64 doneFlags )
{
    while ( ( ! Interpreter_IsDone ( interp, doneFlags | INTERPRETER_DONE ) ) )
    {
        Interpreter_InterpretNextToken ( interp ) ;
    }
}

void
Interpret_ToEndOfLine ( Interpreter * interp )
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
    Interpret_UntilFlagged ( interp, doneFlags ) ;
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

