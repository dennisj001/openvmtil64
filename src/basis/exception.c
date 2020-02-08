
#include "../include/cfrtil64.h"

// ?? the logic of exceptions *definitely* could be reworked ??

// this block needs to be rethought but it may be ok for now

void
_OpenVmTil_ShowExceptionInfo ( )
{
    Word * word = _O_->ExceptionWord ;
    Debugger * debugger = _Debugger_ ;
    DebugOn ;
    if ( ! _O_->ExceptionCode & ( STACK_ERROR | STACK_OVERFLOW | STACK_UNDERFLOW ) ) Debugger_Stack ( debugger ) ;
    if ( ! word )
    {
        word = Finder_Word_FindUsing ( _Finder_, _O_->ExceptionToken, 1 ) ;
        if ( ! word )
        {
            if ( _O_->SigAddress ) word = Word_GetFromCodeAddress ( ( byte* ) _O_->SigAddress ) ;
            else word = _Context_->CurrentEvalWord ? _Context_->CurrentEvalWord : _Context_->LastEvalWord ;
            debugger->w_Word = word ;
        }
    }
    AlertColors ;
    SetState ( debugger, DBG_INFO, true ) ;
    Debugger_Locals_Show ( debugger ) ;
    Debugger_ShowInfo ( debugger, _O_->ExceptionMessage, _O_->Signal ) ;

    if ( GetState ( debugger, DBG_STEPPING ) && debugger->DebugAddress )
    {
        Debugger_Registers ( debugger ) ;
        Debugger_UdisOneInstruction ( debugger, debugger->DebugAddress, ( byte* ) "", ( byte* ) "" ) ;
    }
    if ( word ) _CfrTil_Source ( word, 0 ) ;
    _Printf ( ( byte* ) "\nOpenVmTil_SignalAction : address = 0x%016lx : %s", _O_->SigAddress, _O_->SigLocation ) ;
}

int64
OpenVmTil_ShowExceptionInfo ( )
{
    if ( _O_->Verbosity )
    {
        if ( _O_->ExceptionMessage )
        {
            _Printf ( "\n%s : %s\n",
                _O_->ExceptionMessage, _O_->ExceptionSpecialMessage ? _O_->ExceptionSpecialMessage : Context_Location ( ) ) ;
        }
        if ( ( _O_->SigSegvs < 2 ) && ( _O_->SignalExceptionsHandled ++ < 2 ) && _CfrTil_ )
        {
            _DisplaySignal ( _O_->Signal ) ;
            _OpenVmTil_ShowExceptionInfo ( ) ;
        }
    }
    int64 rtrn = OVT_Pause ( 0, _O_->SignalExceptionsHandled ) ;
    _O_->Signal = 0 ;
    return rtrn ;
}

void
OVT_PauseInterpret ( Context * cntx, byte key )
{
    Boolean svDbgState = GetState ( _CfrTil_, DEBUG_MODE | _DEBUG_SHOW_ ) ;
    Boolean svcm = GetState ( cntx->Compiler0, ( COMPILE_MODE ) ) ;
    Boolean svath = GetState ( cntx->ReadLiner0, ADD_TO_HISTORY ) ;
    OpenVmTil_AddStringToHistoryOn ( ) ;
    Set_CompileMode ( false ) ;
    DebugOff ;
    ReadLine_Init ( cntx->ReadLiner0, _CfrTil_Key ) ;
    SetState ( cntx, AT_COMMAND_LINE, true ) ;
    if ( key >= ' ' )
    {
        do
        {
            Context_DoPrompt ( cntx ) ;
            _ReadLine_GetLine ( cntx->ReadLiner0, key ) ;
            if ( ReadLine_PeekNextChar ( cntx->ReadLiner0 ) < ' ' ) break ; // '\n', <esc>, etc.
            Interpret_ToEndOfLine ( cntx->Interpreter0 ) ;
            CfrTil_NewLine ( ) ;
        }
        while ( 1 ) ;
    }
    SetState ( cntx, AT_COMMAND_LINE, false ) ;
    ReadLine_SetRawInputFunction ( cntx->ReadLiner0, ReadLine_GetNextCharFromString ) ;
    SetState ( _Context_->ReadLiner0, ADD_TO_HISTORY, svath ) ;
    SetState ( cntx->Compiler0, ( COMPILE_MODE ), svcm ) ;
    SetState ( _CfrTil_, DEBUG_MODE | _DEBUG_SHOW_, svDbgState ) ;
}

int64
OVT_Pause ( byte * prompt, int64 signalExceptionsHandled )
{
    int64 rtrn = 0 ;
    SetState ( _O_, OVT_PAUSE, true ) ;
    if ( _CfrTil_ && _Context_ )
    {
        if ( _Context_->CurrentlyRunningWord ) _Debugger_->ShowLine = ( byte* ) "" ;
        byte buffer [512], *defaultPrompt =
            ( byte * ) "\n%s\n%s : at %s :: %s'd' (d)ebugger, 't' s(t)ack, c' (c)ontinue, 'q' (q)uit, 'x' e(x)it, 'i' '\\' or <key> (i)interpret, <return> loop%s" ;
        snprintf ( ( char* ) buffer, 512, prompt ? ( char* ) prompt : ( char* ) defaultPrompt, _O_->ExceptionMessage ? ( char* ) _O_->ExceptionMessage : "\r",
            c_gd ( "pause" ), _Context_Location ( _Context_ ), c_gd ( _Debugger_->ShowLine ? _Debugger_->ShowLine : _Context_->ReadLiner0->InputLine ),
            c_gd ( "\n-> " ) ) ;
        DebugColors ;
        int64 tlw = Strlen ( defaultPrompt ) ;
        if ( tlw > _Debugger_->TerminalLineWidth ) _Debugger_->TerminalLineWidth = tlw ;
        if ( signalExceptionsHandled ) _Printf ( ( byte* ) "\n_OVT_Pause : Signals Handled = %d : signal = %d : restart condition = %d\n", signalExceptionsHandled, _O_->Signal,
            _O_->RestartCondition ) ;
        do
        {
            _Debugger_->w_Word = Context_CurrentWord ( ) ;
            _Debugger_ShowInfo ( _Debugger_, ( byte* ) "\r", _O_->Signal, 0 ) ;
            _Printf ( ( byte* ) "%s", buffer ) ;

            int64 key = Key ( ) ;
            _ReadLine_PrintfClearTerminalLine ( ) ;
            switch ( key )
            {
                case 'x': case 'X':
                {
                    byte * msg = ( byte * ) "Exit cfrTil from pause?" ;
                    _Printf ( ( byte* ) "\n%s : 'x' to e(x)it cfrTil : any other <key> to continue%s", msg, c_gd ( "\n-> " ) ) ;
                    key = Key ( ) ;
                    if ( ( key == 'x' ) || ( key == 'X' ) ) OVT_Exit ( ) ;
                    goto done ;
                }
                case 'q':
                {
                    byte * msg = ( byte * ) "Quit to interpreter loop from pause?" ;
                    _Printf ( ( byte* ) "\n%s : 'q' to (q)uit : any other key to continue%s", msg, c_gd ( "\n-> " ) ) ;
                    key = Key ( ) ;
                    if ( ( key == 'q' ) || ( key == 'Q' ) ) DefaultColors, CfrTil_Quit ( ) ;
                    goto done ;
                }
                case 'd':
                {
                    if ( Is_DebugOn )
                    {
                        Debugger * debugger = _Debugger_ ;
                        SetState ( debugger, DBG_AUTO_MODE | DBG_AUTO_MODE_ONCE, false ) ; // stop auto mode and get next key command code
                        Debugger_InterpreterLoop ( debugger ) ;
                    }
                    else
                    {
                        CfrTil_DebugOn ( ) ;
                        SetState ( _Debugger_, DBG_INFO | DBG_MENU | DBG_PROMPT, true ) ;
                    }
                    goto done ;
                }
                case 'c':
                {
                    // if ( signalsHandled ) ;
                    rtrn = 1 ;
                    goto done ;
                }
                case 't':
                {
                    CfrTil_PrintDataStack ( ) ;
                    break ;
                }
                case '\n':
                case '\r':
                {
                    continue ;
                }
                case 'i':
                {
                    // interpret in context
                    Context * cntx = _Context_ ;
                    OVT_PauseInterpret ( cntx, key ) ;
                    continue ;
                }
                default:
                {
                    // new context
                    Context * cntx = CfrTil_Context_PushNew ( _CfrTil_ ) ;
                    OVT_PauseInterpret ( cntx, key ) ;
                    CfrTil_Context_PopDelete ( _CfrTil_ ) ;
                    continue ;
                }
            }
        }
        while ( 1 ) ;
    }
done:
    DefaultColors ;

    return rtrn ;
}

int64
_OpenVmTil_Pause ( byte * msg )
{
    _Printf ( ( byte* ) "\n%s", msg ) ;
    return OVT_Pause ( 0, _O_->SignalExceptionsHandled ) ;
}

void
OpenVmTil_Pause ( )
{

    DebugColors ;
    _OpenVmTil_Pause ( Context_Location ( ) ) ;
}

void
OVT_ResetSignals ( int64 signals )
{
    sigset_t signal_set ;
    sigemptyset ( &signal_set ) ;
    sigaddset ( &signal_set, signals ) ;
    sigprocmask ( SIG_UNBLOCK, &signal_set, NULL ) ;
}

void
_OVT_SigLongJump ( sigjmp_buf * jb )
{
    siglongjmp ( *jb, 1 ) ;
}

void
OVT_SigLongJump ( byte * restartMessage, sigjmp_buf * jb )
{
    printf ( "\n%s\n", restartMessage ) ;
    _OVT_SigLongJump ( jb ) ;

}

void
OVT_SetRestartCondition ( OpenVmTil *ovt, int64 restartCondition )
{
    ovt->LastRestartCondition = ovt->RestartCondition ;
    ovt->RestartCondition = restartCondition ;
}

// OVT_Throw needs to be reworked ???

void
OVT_Throw ( int signal, int64 restartCondition, Boolean pauseFlag )
{
    sigjmp_buf * jb ;
    OVT_SetRestartCondition ( _O_, restartCondition ) ;
    if ( signal )
    {
        if ( ( signal == SIGTERM ) || ( signal == SIGKILL ) || ( signal == SIGQUIT ) || ( signal == SIGSTOP ) || ( signal == SIGHUP ) ) OVT_Exit ( ) ;
        else if ( signal == SIGSEGV ) _O_->SigSegvs ++ ;
        else if ( signal == SIGBUS )
        {
            jb = & _O_->JmpBuf0 ;
            OVT_SetRestartCondition ( _O_, INITIAL_START ) ;
            _OVT_SimpleFinal_Key_Pause ( "\nOVT_Throw : signal == SIGBUS : restarting to INITIAL_START ... with any <key>", true ) ;
            goto jump ;
        }
        if ( ( restartCondition > QUIT ) || ( _O_->Signal == SIGFPE ) )
        {
            if ( ++ _O_->SigSegvs < 2 )
            {
                jb = & _CfrTil_->JmpBuf0 ;
                OpenVmTil_ShowExceptionInfo ( ) ;
                pauseFlag ++ ;
                OVT_SetRestartCondition ( _O_, ABORT ) ;
            }
            else OVT_SetRestartCondition ( _O_, INITIAL_START ) ;
            if ( _O_->SigSegvs > 3 ) _OVT_SigLongJump ( & _O_->JmpBuf0 ) ; //OVT_Exit ( ) ;
            else if ( ( _O_->SigSegvs > 1 ) || ( restartCondition == INITIAL_START ) ) jb = & _O_->JmpBuf0 ;
        }
        else jb = & _CfrTil_->JmpBuf0 ;
    }
    else
    {
        if ( restartCondition >= INITIAL_START ) jb = & _O_->JmpBuf0 ;
        else jb = & _CfrTil_->JmpBuf0 ;
    }
    //OVT_SetExceptionMessage ( _O_ ) ;

    snprintf ( Buffer_Data_Cleared ( _O_->ThrowBuffer ), BUFFER_SIZE, "\n%s\n%s %s from %s -> ...", _O_->ExceptionMessage,
        ( jb == & _CfrTil_->JmpBuf0 ) ? "reseting cfrTil" : "restarting OpenVmTil",
        ( _O_->Signal == SIGSEGV ) ? ": SIGSEGV" : "", Context_Location ( ) ) ; //( _O_->SigSegvs < 2 ) ? Context_Location ( ) : ( byte* ) "" ) ;
    _OVT_SimpleFinal_Key_Pause ( _O_->ThrowBuffer->Data, 1 ) ; //( _O_->Signal != SIGSEGV ) ) ;
    if ( pauseFlag && ( _O_->SignalExceptionsHandled < 2 ) && ( _O_->SigSegvs < 2 ) ) OVT_Pause ( 0, _O_->SignalExceptionsHandled ) ;
jump:
    _OVT_SigLongJump ( jb ) ;
}

void
OpenVmTil_Throw ( byte * excptMessage, byte * specialMessage, int64 restartCondition, int64 infoFlag )
{
    _O_->ExceptionMessage = excptMessage ;
    _O_->Thrown = restartCondition ;
    _O_->ExceptionSpecialMessage = specialMessage ;

    if ( infoFlag ) OpenVmTil_ShowExceptionInfo ( ) ;
    OVT_Throw ( 0, restartCondition, 0 ) ;
}

void
_OpenVmTil_LongJmp_WithMsg ( int64 restartCondition, byte * msg )
{
    OpenVmTil_Throw ( msg, 0, restartCondition, 0 ) ;
}

void
OpenVmTil_SignalAction ( int signal, siginfo_t * si, void * uc ) //nb. void ptr necessary 
{
    d0 ( _Printf ( ( byte* ) "\nOpenVmTil_SignalAction :: signal = %d\n", signal ) ) ;
    if ( ( signal == SIGTERM ) || ( signal == SIGKILL ) || ( signal == SIGQUIT ) || ( signal == SIGSTOP ) ) OVT_Exit ( ) ;
    _O_->Signal = signal ;
    _O_->SigAddress = ( Is_DebugOn && _Debugger_->DebugAddress ) ? _Debugger_->DebugAddress : si->si_addr ;
    _O_->SigLocation = ( ( ! ( signal & ( SIGSEGV | SIGBUS ) ) ) && _Context_ ) ? ( byte* ) c_gd ( Context_Location ( ) ) : ( byte* ) "" ;
    OVT_ResetSignals ( _O_->Signal ) ;
    if ( ( signal >= SIGCHLD ) || ( signal == SIGTRAP ) ) //||( signal == SIGBUS ))
    {
        if ( ( signal != SIGCHLD ) && ( signal != SIGWINCH ) && ( signal != SIGTRAP ) ) OpenVmTil_ShowExceptionInfo ( ) ;
        else
        {
            // ignore this category -- just return
            _O_->SigAddress = 0 ; //|| ( signal == SIGWINCH ) ) _O_->SigAddress = 0 ; // 17 : "CHILD TERMINATED" : ignore; its just back from a shell fork
            _O_->Signal = 0 ;
        }
    }
    else if ( _O_->SigSegvs )
    {
        OVT_SeriousErrorPause ( ) ;
        _OVT_SigLongJump ( & _O_->JmpBuf0 ) ;
    }
    else OVT_Throw ( _O_->Signal, _O_->RestartCondition, 0 ) ;
}

void
CfrTil_Exception ( int64 exceptionCode, byte * message, int64 restartCondition )
{
    byte * b = Buffer_Data ( _CfrTil_->ScratchB1 ) ;
    AlertColors ;
    _O_->ExceptionCode = exceptionCode ;
    printf ( "\n\nCfrTil_Exception at %s\n", Context_Location ( ) ) ;
    fflush ( stdout ) ;
    switch ( exceptionCode )
    {
        case CASE_NOT_LITERAL_ERROR:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Syntax Error : \"case\" only takes a literal/constant as its parameter after the block", 0, restartCondition, 1 ) ;
            break ;
        }
        case DEBUG_ERROR:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Debug Error : User is not in debug mode", 0, restartCondition, 1 ) ;
            break ;
        }
        case OBJECT_REFERENCE_ERROR:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Object Reference Error", 0, restartCondition, 1 ) ;
            break ;
        }
        case OBJECT_SIZE_ERROR:
        {
            sprintf ( ( char* ) b, "Exception : Warning : Class object size is 0. Did you declare 'size' for %s? ",
                _Context_->CurrentlyRunningWord->ContainingNamespace->Name ) ;
            OpenVmTil_Throw ( b, 0, restartCondition, 1 ) ;
            break ;
        }
        case STACK_OVERFLOW:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Stack Overflow", 0, restartCondition, 1 ) ;
            break ;
        }
        case STACK_UNDERFLOW:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Stack Underflow", 0, restartCondition, 1 ) ;
            break ;
        }
        case STACK_ERROR:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Stack Error", 0, restartCondition, 1 ) ;
            break ;
        }
        case SEALED_NAMESPACE_ERROR:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : New words can not be added to sealed namespaces", 0, restartCondition, 1 ) ;
            break ;
        }
        case NAMESPACE_ERROR:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Namespace (Not Found?) Error", 0, restartCondition, 1 ) ;
            break ;
        }
        case SYNTAX_ERROR:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Syntax Error", message, restartCondition, 1 ) ;
            break ;
        }
        case NESTED_COMPILE_ERROR:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Nested Compile Error", 0, restartCondition, 1 ) ;
            break ;
        }
        case COMPILE_TIME_ONLY:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Compile Time Use Only", 0, restartCondition, 1 ) ;
            break ;
        }
        case BUFFER_OVERFLOW:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Buffer Overflow", 0, restartCondition, 1 ) ;
            break ;
        }
        case MEMORY_ALLOCATION_ERROR:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Memory Allocation Error", 0, restartCondition, 1 ) ;
            break ;
        }
        case LABEL_NOT_FOUND_ERROR:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Word not found. Misssing namespace qualifier?", 0, QUIT, 1 ) ;
            break ;
        }
        case NOT_A_KNOWN_OBJECT:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Not a known object", message, QUIT, 1 ) ;
            break ;
        }
        case ARRAY_DIMENSION_ERROR:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Array has no dimensions!?", 0, QUIT, 1 ) ;
            break ;
        }
        case INLINE_MULTIPLE_RETURN_ERROR:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Multiple return points in a inlined function", 0, restartCondition, 1 ) ;
            break ;
        }
        case MACHINE_CODE_ERROR:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : in machine coding", 0, restartCondition, 1 ) ;
            break ;
        }
        case VARIABLE_NOT_FOUND_ERROR:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Variable not found error", 0, restartCondition, 1 ) ;
            break ;
        }
        case USEAGE_ERROR:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Useage Error", 0, restartCondition, 1 ) ;
            break ;
        }
        case FIX_ME_ERROR:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Fix Me", 0, restartCondition, 1 ) ;
            break ;
        }
        case OUT_OF_CODE_MEMORY:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Out of Code Memory : Increase Code Memory Size for Startup!!", 0, INITIAL_START, 1 ) ;
            break ;
        }
        default:
        {
            OpenVmTil_Throw ( message, 0, restartCondition, 1 ) ;
            break ;
        }
    }
    return ;
}

void
CfrTil_SystemBreak ( )
{
    _OpenVmTil_LongJmp_WithMsg ( BREAK, ( byte* ) "System.interpreterBreak : returning to main interpreter loop." ) ;
}

void
CfrTil_Quit ( )
{
    _OpenVmTil_LongJmp_WithMsg ( QUIT, ( byte* ) "Quit : Session Memory, temporaries, are reset." ) ;
}

void
CfrTil_Abort ( )
{
    _OpenVmTil_LongJmp_WithMsg ( ABORT, ( byte* ) "Abort : Session Memory and the DataStack are reset (as in a cold restart)." ) ;
}

void
CfrTil_DebugStop ( )
{
    _OpenVmTil_LongJmp_WithMsg ( STOP, ( byte* ) "Stop : Debug Stop. " ) ;
}

void
CfrTil_ResetAll ( )
{
    _OpenVmTil_LongJmp_WithMsg ( RESET_ALL, ( byte* ) "ResetAll. " ) ;
}

void
CfrTil_Restart ( )
{
    _OpenVmTil_LongJmp_WithMsg ( RESTART, ( byte* ) "Restart. " ) ;
}

void
CfrTil_WarmInit ( )
{
    _CfrTil_Init_SessionCore ( _CfrTil_, 1, 1 ) ;
}

// cold init

void
CfrTil_RestartInit ( )
{
    _OpenVmTil_LongJmp_WithMsg ( RESET_ALL, ( byte* ) "Restart Init... " ) ;
}

void
CfrTil_FullRestart ( )
{
    _O_->Signal = 0 ;
    _OpenVmTil_LongJmp_WithMsg ( INITIAL_START, ( byte* ) "Full Initial Re-Start : ..." ) ;
}

void
Error ( byte * emsg, byte * smsg, uint64 state )
{
    AlertColors ;
    if ( ( state ) & PAUSE )
    {
        CfrTil_NewLine ( ) ;
        CfrTil_Location ( ) ;
        _Printf ( emsg, smsg ) ;
        Pause ( ) ;
        DebugColors ;
    }
    else
    {
        if ( ( state ) >= QUIT )
        {
            Throw ( emsg, smsg, state ) ;
        }
    }
}

void
OVT_ExceptionState_Print ( )
{
    _Printf ( ( byte* ) "\nSignalExceptionsHandled = %d ; SigSegvs = %d ; Restarts = %d\nStartedTimes = %d ; RestartCondition = %s ; LastRestartCondtion = %s",
        _O_->SignalExceptionsHandled, _O_->SigSegvs, _O_->Restarts, _O_->StartedTimes, Convert_RestartCondtion ( _O_->LastRestartCondition ),
        Convert_RestartCondtion ( _O_->RestartCondition ) ) ;
}

void
_OVT_SimpleFinal_Key_Pause ( byte * msg, Boolean useKey )
{
    byte key, * instr = ".: (p)ause, <key> restart" ;
    printf ( "%s\n%s", msg, instr ) ;
    fflush ( stdout ) ;
    if ( useKey ) key = Key ( ) ;
    if ( key = 'p' ) Pause () ;
}

void
OVT_SeriousErrorPause ( )
{
    _OVT_SimpleFinal_Key_Pause ( "\n!!Serious Error : SIGSEGV while handling a SIGSEGV : hit any key to continue full restart!!\n:!!> ", true ) ;
    fflush ( stdout ) ;
    Key ( ) ;
}

#if 0

void
OVT_SetExceptionMessage ( OpenVmTil * ovt )
{
    if ( ovt->RestartCondition == INITIAL_START ) ovt->ExceptionMessage = ( byte* ) "Full Initial Re-Start : ..." ;
    else if ( ovt->RestartCondition == ABORT ) ovt->ExceptionMessage = ( byte* ) "Aborting : ..." ;
}
#endif

