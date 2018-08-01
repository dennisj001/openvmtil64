#include "../include/cfrtil64.h"

void
CfrTil_DoWord ( )
{
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    _Interpreter_DoWord ( _Context_->Interpreter0, word, - 1, - 1 ) ;
}

void
CfrTil_CommentToEndOfLine ( )
{
    Lexer * lexer = _Lexer_ ;
    _CfrTil_UnAppendTokenFromSourceCode ( _CfrTil_, lexer->OriginalToken ) ;
    int64 svState = GetState ( lexer, ( ADD_TOKEN_TO_SOURCE | ADD_CHAR_TO_SOURCE ) ) ;
    Lexer_SourceCodeOff ( _Lexer_ ) ;
    ReadLiner_CommentToEndOfLine ( _Context_->ReadLiner0 ) ;
    String_RemoveEndWhitespace ( _CfrTil_->SC_Buffer ) ;
    _CfrTil_SC_ScratchPadIndex_Init ( _CfrTil_ ) ;
    SetState ( lexer, LEXER_END_OF_LINE, true ) ;
    //Lexer_SourceCodeOn ( _Lexer_ ) ;
    if ( Compiling ) SetState ( lexer, ( ADD_TOKEN_TO_SOURCE | ADD_CHAR_TO_SOURCE ), svState ) ;
}

void
CfrTil_ParenthesisComment ( )
{
    Lexer * lexer = _Lexer_ ;
    _CfrTil_UnAppendTokenFromSourceCode ( _CfrTil_, lexer->OriginalToken ) ;
    int64 svState = GetState ( lexer, ( ADD_TOKEN_TO_SOURCE | ADD_CHAR_TO_SOURCE ) ) ;
    Lexer_SourceCodeOff ( lexer ) ;
    while ( 1 )
    {
        int64 inChar = ReadLine_PeekNextChar ( lexer->ReadLiner0 ) ;
        if ( ( inChar == - 1 ) || ( inChar == eof ) ) break ;
        char * token = ( char* ) Lexer_ReadToken ( lexer ) ;
        if ( strcmp ( token, "*/" ) == 0 ) return ;
    }
    //Lexer_SourceCodeOn ( _Lexer_ ) ;
    if ( Compiling ) SetState ( lexer, ( ADD_TOKEN_TO_SOURCE | ADD_CHAR_TO_SOURCE ), svState ) ;
}

void
CfrTil_Define ( )
{
    Interpreter * interp = _Context_->Interpreter0 ;
    SetState ( interp, PREPROCESSOR_DEFINE, true ) ;
    _CfrTil_Colon ( 0 ) ;
    _Interpret_ToEndOfLine ( interp ) ;
    int64 locals = Stack_Depth ( _Context_->Compiler0->LocalsCompilingNamespacesStack ) ;
    SetState ( interp, PREPROCESSOR_DEFINE, false ) ;
    CfrTil_SemiColon ( ) ;
    CfrTil_Inline ( ) ;
    if ( locals ) CfrTil_Prefix ( ) ;
    CfrTil_SourceCode_Init ( ) ; //don't leave the define in sc
}

void
CfrTil_Interpreter_IsDone ( )
{
    DataStack_Push ( GetState ( _Context_->Interpreter0, END_OF_FILE | END_OF_STRING | INTERPRETER_DONE ) ) ;
}

void
CfrTil_Interpreter_Done ( )
{
    SetState ( _Context_->Interpreter0, INTERPRETER_DONE, true ) ;
}

void
CfrTil_Interpreter_Init ( )
{
    Interpreter_Init ( _Context_->Interpreter0 ) ;
}

void
CfrTil_InterpretNextToken ( )
{
    Interpreter_InterpretNextToken ( _Context_->Interpreter0 ) ;
}

void
CfrTil_Interpret ( )
{
    _Context_InterpretFile ( _Context_ ) ;
}

void
CfrTil_InterpretPromptedLine ( )
{
    CfrTil_DoPrompt ( ) ;
    //Context_Interpret ( _CfrTil_->Context0 ) ;
    _Interpret_ToEndOfLine ( _Interpreter_ ) ;
}

void
CfrTil_InterpretString ( )
{
    _Interpret_String ( ( byte* ) DataStack_Pop ( ) ) ;
}

void
CfrTil_Interpreter_EvalWord ( )
{

    _Interpreter_DoWord ( _Context_->Interpreter0, ( Word* ) DataStack_Pop ( ), - 1, - 1 ) ;
}

void
CfrTil_TokenToWord ( )
{
    byte * token = ( byte* ) DataStack_Pop ( ) ;
    DataStack_Push ( ( int64 ) _Interpreter_TokenToWord ( _Context_->Interpreter0, token ) ) ;
}

void
CfrTil_InterpreterStop ( )
{

    SetState ( _Context_->Interpreter0, INTERPRETER_DONE, true ) ;
    SetState ( _CfrTil_, CFRTIL_RUN, false ) ;
}

dllist *
_CfrTil_Interpret_ReadToList ( )
{
    byte * token ;
    Interpreter * interp = _Context_->Interpreter0 ;
    interp->InterpList = List_New ( SESSION ) ;
    while ( token = Lexer_ReadToken ( _Lexer_ ) )
    {
        if ( String_Equal ( token, ";l" ) ) break ;
        Word * word = _Interpreter_TokenToWord ( interp, token ) ;
        if ( word )
        {

            _Word_Interpret ( word ) ;
            //List_Push_A_1Value_Node ( interp->InterpList, word ) ;
            List_PushNew_T_WORD ( interp->InterpList, (int64) word, COMPILER_TEMP ) ;
        }
    }
    return interp->InterpList ;
}

void
CfrTil_Interpret_ReadToList ( )
{

    dllist * interpList = _CfrTil_Interpret_ReadToList ( ) ;
    DataStack_Push ( ( int64 ) interpList ) ;
}

void
CfrTil_Interpret_List ( )
{
    dllist * interpList = ( dllist* ) DataStack_Pop ( ) ;
    List_Interpret ( interpList ) ;
}

#if 0
#include "/usr/local/include/python3.7m/Python.h"

void
CfrTil_Interpret_Python ( )
{
    byte * pstring = ( byte* ) DataStack_Pop ( ) ;
    wchar_t *program = Py_DecodeLocale ( "python3.7", NULL ) ;
    Py_SetProgramName ( program ) ; /* optional but recommended */
    Py_Initialize ( ) ;
    PyRun_SimpleString ( pstring ) ;
    PyMem_RawFree ( program ) ;
}
#endif
