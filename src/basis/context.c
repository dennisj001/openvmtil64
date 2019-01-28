
#include "../include/cfrtil64.h"

void
_Context_Prompt ( int64 control )
{
    if ( ( control && ( ! IS_INCLUDING_FILES ) ) || ( GetState ( _Debugger_, DBG_ACTIVE ) ) ) CfrTil_DoPrompt ( ) ;
}

byte *
_Context_Location ( Context * cntx )
{
    byte * str = 0 ;
    if ( cntx && cntx->ReadLiner0 )
    {
        byte * buffer = Buffer_Data ( _CfrTil_->StringB ) ;
        sprintf ( ( char* ) buffer, "%s : %ld.%ld", ( char* ) cntx->ReadLiner0->Filename ? ( char* ) cntx->ReadLiner0->Filename : "<command line>", cntx->ReadLiner0->LineNumber, cntx->Lexer0->CurrentReadIndex ) ;
        str = cntx->Location = String_New ( buffer, TEMPORARY ) ;
    }
    return str ;
}

byte *
Context_Location ( )
{
    return _Context_Location ( _Context_ ) ;
}

Word *
_Context_CurrentWord ( Context * cntx )
{
    return cntx->CurrentlyRunningWord ? cntx->CurrentlyRunningWord : _Context_->CurrentEvalWord ? _Context_->CurrentEvalWord : _Context_->LastRunWord ? _Context_->LastRunWord : cntx->CurrentTokenWord ;
}

Word *
Context_CurrentWord ( )
{
    return _Context_CurrentWord ( _Context_ ) ;
}

Context *
_Context_Allocate ( )
{
    NBA * nba = MemorySpace_NBA_New ( _Q_->MemorySpace0, ( byte* ) String_New ( ( byte* ) "ContextSpace", STRING_MEM ), 10 * K, OPENVMTIL ) ;
    _Q_->MemorySpace0->ContextSpace = nba ;
    Context * cntx = ( Context* ) Mem_Allocate ( sizeof ( Context ), OPENVMTIL ) ;
    cntx->ContextNba = nba ;
    return cntx ;
}

void
Context_SetDefaultTokenDelimiters ( Context * cntx, byte * delimiters, uint64 allocType )
{
    cntx->DefaultDelimiterCharSet = CharSet_New ( delimiters, allocType ) ;
    cntx->DefaultTokenDelimiters = delimiters ;
}

Context *
_Context_Init ( Context * cntx0, Context * cntx )
{
    if ( cntx0 && cntx0->System0 ) cntx->System0 = System_Copy ( cntx0->System0, CONTEXT ) ; // nb : in this case System is copied -- DataStack is shared
    else cntx->System0 = System_New ( CONTEXT ) ;
    List_Init ( _CfrTil_->Compiler_N_M_Node_WordList ) ;
    Context_SetDefaultTokenDelimiters ( cntx, ( byte* ) " \n\r\t", CONTEXT ) ;
    cntx->Interpreter0 = Interpreter_New ( CONTEXT ) ;
    cntx->Lexer0 = cntx->Interpreter0->Lexer0 ;
    cntx->ReadLiner0 = cntx->Interpreter0->ReadLiner0 ;
    cntx->Lexer0->OurInterpreter = cntx->Interpreter0 ;
    cntx->Finder0 = cntx->Interpreter0->Finder0 ;
    cntx->Compiler0 = cntx->Interpreter0->Compiler0 ;
    cntx->PreprocessorStackList = _dllist_New ( CONTEXT ) ;
    return cntx ;
}

Context *
_Context_New ( CfrTil * cfrTil )
{
    Context * cntx = _Context_Allocate ( ), *cntx0 = cfrTil->Context0 ;
    _Context_ = cfrTil->Context0 = cntx ;
    _Context_Init ( cntx0, cntx ) ;
    cntx->ContextDataStack = cfrTil->DataStack ; // nb. using the same one and only DataStack
    return cntx ;
}

void
_Context_Run_1 ( Context * cntx, ContextFunction_1 contextFunction, byte * arg )
{
    contextFunction ( cntx, arg ) ;
}

void
_Context_Run_2 ( Context * cntx, ContextFunction_2 contextFunction, byte * arg, int64 arg2 )
{
    contextFunction ( cntx, arg, arg2 ) ;
}

void
_Context_Run ( Context * cntx, ContextFunction contextFunction )
{
    contextFunction ( cntx ) ;
}

Context *
CfrTil_Context_PushNew ( CfrTil * cfrTil )
{
    _Stack_Push ( cfrTil->ContextDataStack, ( int64 ) cfrTil->Context0 ) ;
    Context * cntx = _Context_New ( cfrTil ) ;
    return cntx ;
}

void
CfrTil_Context_PopDelete ( CfrTil * cfrTil )
{
    NBA * cnba = cfrTil->Context0->ContextNba ;
    Context * cntx = ( Context* ) _Stack_Pop ( cfrTil->ContextDataStack ) ;
    //Compiler_DeleteDebugInfo ( cntx->Compiler0 ) ;
    _Context_ = cfrTil->Context0 = cntx ;
    _Q_->MemorySpace0->ContextSpace = cntx->ContextNba ;
    NamedByteArray_Delete ( cnba ) ;
}

void
_CfrTil_Contex_NewRun_1 ( CfrTil * cfrTil, ContextFunction_1 contextFunction, byte *arg )
{
    Context * cntx = CfrTil_Context_PushNew ( cfrTil ) ;
    _Context_Run_1 ( cntx, contextFunction, arg ) ;
    CfrTil_Context_PopDelete ( cfrTil ) ; // this could be coming back from wherever so the stack variables are gone
}

void
_CfrTil_Contex_NewRun_2 ( CfrTil * cfrTil, ContextFunction_2 contextFunction, byte *arg, int64 arg2 )
{
    Context * cntx = CfrTil_Context_PushNew ( cfrTil ) ;
    _Context_Run_2 ( cntx, contextFunction, arg, arg2 ) ;
    CfrTil_Context_PopDelete ( cfrTil ) ; // this could be coming back from wherever so the stack variables are gone
}

void
_CfrTil_Contex_NewRun_Void ( CfrTil * cfrTil, Word * word )
{
    if ( word )
    {
        CfrTil_Context_PushNew ( cfrTil ) ;
        Block_Eval ( word->Definition ) ;
        CfrTil_Context_PopDelete ( cfrTil ) ; // this could be coming back from wherever so the stack variables are gone
    }
}

void
_Context_InterpretString ( Context * cntx, byte *str )
{
    Interpreter * interp = cntx->Interpreter0 ;
    ReadLiner * rl = cntx->ReadLiner0 ;
    _SetEcho ( 0 ) ;
    int64 interpState = interp->State ;
    int64 lexerState = interp->Lexer0->State ;
    int64 svIndex = rl->ReadIndex ;
    int64 svState = rl->State ;
    Readline_SaveInputLine ( rl ) ;
    Readline_Setup_OneStringInterpret ( rl, str ) ;
    Interpret_UntilFlaggedWithInit ( cntx->Interpreter0, END_OF_STRING ) ;
    rl->ReadIndex = svIndex ;
    rl->State = svState ;
    Readline_RestoreInputLine ( rl ) ;
    interp->Lexer0->State = lexerState ;
    interp->State = interpState ;
}

void
_CfrTil_ContextNew_InterpretString ( CfrTil * cfrTil, byte * str )
{
    if ( str ) _CfrTil_Contex_NewRun_1 ( cfrTil, _Context_InterpretString, str ) ;
}

void
_Context_InterpretFile ( Context * cntx )
{
    if ( GetState ( _Debugger_, DBG_AUTO_MODE ) )
    {
        _CfrTil_DebugContinue ( 0 ) ;
    }
    else Interpret_UntilFlaggedWithInit ( cntx->Interpreter0, END_OF_FILE | END_OF_STRING ) ;
}

void
_Context_IncludeFile ( Context * cntx, byte *filename, int64 interpretFlag )
{
    if ( filename )
    {
        FILE * file = fopen ( ( char* ) filename, "r" ) ;
        if ( file )
        {
            ReadLiner * rl = cntx->ReadLiner0 ;
            rl->Filename = String_New ( filename, STRING_MEM ) ;
            if ( _Q_->Verbosity > 2 ) _Printf ( ( byte* ) "\nincluding %s ...\n", filename ) ;
            cntx->ReadLiner0->InputFile = file ;
            ReadLine_SetRawInputFunction ( rl, ReadLine_GetNextCharFromString ) ;
            SetState ( cntx->System0, ADD_READLINE_TO_HISTORY, false ) ;
            cntx->System0->IncludeFileStackNumber ++ ;
            _SetEcho ( 0 ) ;

            ReadLine_ReadFileIntoAString ( rl, file ) ;
            fclose ( file ) ;

            if ( interpretFlag ) Interpret_UntilFlaggedWithInit ( cntx->Interpreter0, END_OF_FILE | END_OF_STRING ) ;

            cntx->System0->IncludeFileStackNumber -- ;
            if ( ! cntx->System0->IncludeFileStackNumber ) Ovt_AutoVarOff ( ) ;
            if ( _Q_->Verbosity > 2 ) _Printf ( ( byte* ) "\n%s included\n", filename ) ;
            OVT_MemList_FreeNBAMemory ( ( byte* ) "ObjectSpace", 1 * M, 1 ) ; // not able to do this yet ??
        }
        else
        {
            _Printf ( ( byte* ) "\nError : _CfrTil_IncludeFile : \"%s\" : not found! :: %s\n", filename,
                _Context_Location ( ( Context* ) _CfrTil_->ContextDataStack->StackPointer [0] ) ) ;
        }
    }
}

void
_CfrTil_ContextNew_IncludeFile ( byte * filename )
{
    _CfrTil_Contex_NewRun_2 ( _CfrTil_, _Context_IncludeFile, filename, 1 ) ;
}

int64
_Context_StringEqual_PeekNextToken ( Context * cntx, byte * check, Boolean evalFlag )
{
    byte *token = Lexer_Peek_Next_NonDebugTokenWord (cntx->Lexer0, evalFlag , 0) ;
    if ( token ) return String_Equal ( ( char* ) token, ( char* ) check ) ;
    else return 0 ;
}

// this is funny!?

void
_Context_DoubleQuoteMacro ( Context * cntx )
{
    ReadLiner * rl = _ReadLiner_ ;
    Lexer * lexer = cntx->Lexer0 ;
    if ( ! GetState ( _CfrTil_, SOURCE_CODE_STARTED ) ) CfrTil_InitSourceCode_WithCurrentInputChar ( _CfrTil_, 0 ) ; // must be here for wdiss and add addToHistory
    _CfrTil_->SC_QuoteMode = true ;
    do
    {
        lexer->TokenInputByte = ReadLine_NextChar ( rl ) ;
        if ( lexer->TokenInputByte == '\\' ) _BackSlash ( lexer, 1 ) ;
        else Lexer_Append_ConvertedCharacterToTokenBuffer ( lexer ) ;
    }
    while ( lexer->TokenInputByte != '"' ) ;
    _CfrTil_->SC_QuoteMode = false ;
    SetState ( lexer, LEXER_DONE, true ) ;
    //if ( Is_DebugModeOn ) CfrTil_PrintDataStack ( ) ;
    if ( GetState ( _CfrTil_, STRING_MACROS_ON ) && GetState ( &_CfrTil_->Sti, STI_INITIALIZED ) ) _CfrTil_StringMacros_Do ( lexer->TokenBuffer ) ;
    Word * word = Lexer_ObjectToken_New ( lexer, String_New ( lexer->TokenBuffer, STRING_MEM ), - 1, - 1 ) ;
    //Debugger_On ( _Debugger_ ) ;
    Interpreter_DoWord ( cntx->Interpreter0, word, - 1, - 1 ) ;
    //if ( Is_DebugModeOn ) CfrTil_PrintDataStack ( ) ;
}

void
CfrTil_DoubleQuoteMacro ( )
{
    _Context_DoubleQuoteMacro ( _Context_ ) ;
}

#if 0

void
_Tick ( Context * cntx, int64 findWordFlag )
{
    byte * token = ( byte* ) DataStack_Pop ( ) ;
    if ( token )
    {
        if ( findWordFlag )
        {
            Word * word = Finder_FindQualifiedIDWord ( cntx->Finder0, token ) ;
            token = ( byte * ) word ;
        }
        else
        {
            Lexer * lexer = cntx->Lexer0 ;
            Lexer_ParseObject ( lexer, token ) ; // create a string from a 'raw' token
            if ( GetState ( lexer, KNOWN_OBJECT ) ) token = ( byte* ) lexer->Literal ;
            else token = 0 ;
        }
    }
    DataStack_Push ( ( int64 ) token ) ;
}
#endif

void
Context_Interpret ( Context * cntx )
{
    Interpret_UntilFlaggedWithInit ( cntx->Interpreter0, END_OF_LINE | END_OF_FILE | END_OF_STRING ) ;
}

byte *
Context_IsInFile ( Context * cntx )
{
    return cntx->ReadLiner0->Filename ;
}


