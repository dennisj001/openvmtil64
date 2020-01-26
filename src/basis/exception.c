
#include "../include/cfrtil64.h"

// ?? the logic of exceptions *definitely* could be reworked ??

// this block needs to be rethought but it may be ok for now

void
_OpenVmTil_ShowExceptionInfo ( )
{
    Word * word = _Q_->ExceptionWord ;
    Debugger * debugger = _Debugger_ ;
    DebugOn ;
    if ( ! _Q_->ExceptionCode & ( STACK_ERROR | STACK_OVERFLOW | STACK_UNDERFLOW ) ) Debugger_Stack ( debugger ) ;
    if ( ! word )
    {
        word = Finder_Word_FindUsing ( _Finder_, _Q_->ExceptionToken, 1 ) ;
        if ( ! word )
        {
            if ( _Q_->SigAddress ) word = Word_GetFromCodeAddress ( ( byte* ) _Q_->SigAddress ) ;
            //else word = _Context_->CurrentEvalWord ? _Context_->CurrentEvalWord : _Context_->LastEvalWord;
            debugger->w_Word = word ;
        }
    }
    AlertColors ;
    SetState ( debugger, DBG_INFO, true ) ;
    Debugger_Locals_Show ( debugger ) ;
    Debugger_ShowInfo ( debugger, _Q_->ExceptionMessage, _Q_->Signal ) ;

    if ( GetState ( debugger, DBG_STEPPING ) && debugger->DebugAddress )
    {
        Debugger_Registers ( debugger ) ;
        Debugger_UdisOneInstruction ( debugger, debugger->DebugAddress, ( byte* ) "", ( byte* ) "" ) ;
    }
    if ( word ) _CfrTil_Source ( word, 0 ) ;
    _Printf ( ( byte* ) "\nOpenVmTil_SignalAction : address = 0x%016lx : %s", _Q_->SigAddress, _Q_->SigLocation ) ;
}

int64
OpenVmTil_ShowExceptionInfo ( )
{
    if ( _Q_->Verbosity )
    {
        if ( _Q_->ExceptionMessage )
        {
            _Printf ( "\n%s : %s\n", 
                _Q_->ExceptionMessage, _Q_->ExceptionSpecialMessage ? _Q_->ExceptionSpecialMessage : Context_Location ( ) ) ;
        }
        if ( ( _Q_->SigSegvs < 2 ) && ( _Q_->SignalExceptionsHandled ++ < 2 ) && _CfrTil_ )
        {
            _DisplaySignal ( _Q_->Signal ) ;
            _OpenVmTil_ShowExceptionInfo ( ) ;
        }
    }
    int64 rtrn = OVT_Pause ( 0, _Q_->SignalExceptionsHandled ) ;
    _Q_->Signal = 0 ;
    return rtrn ;
}

int64
OVT_Pause ( byte * prompt, int64 signalExceptionsHandled )
{
    int64 rtrn = 0 ;
    SetState ( _Q_, OVT_PAUSE, true ) ;
    if ( _CfrTil_ && _Context_ )
    {
        if ( _Context_->CurrentlyRunningWord ) _Debugger_->ShowLine = ( byte* ) "" ;
        byte buffer [512], *defaultPrompt =
            ( byte * ) "\n%s\n%s : at %s :: %s'd' (d)ebugger, 't' s(t)ack, c' (c)ontinue, 'q' (q)uit, 'x' e(x)it, 'i' '\\' or <key> (i)interpret, <return> loop%s" ;
        snprintf ( ( char* ) buffer, 512, prompt ? ( char* ) prompt : ( char* ) defaultPrompt, _Q_->ExceptionMessage ? ( char* ) _Q_->ExceptionMessage : "\r",
            c_gd ( "pause" ), _Context_Location ( _Context_ ), c_gd ( _Debugger_->ShowLine ? _Debugger_->ShowLine : _Context_->ReadLiner0->InputLine ),
            c_gd ( "\n-> " ) ) ;
        DebugColors ;
        int64 tlw = Strlen ( defaultPrompt ) ;
        if ( tlw > _Debugger_->TerminalLineWidth ) _Debugger_->TerminalLineWidth = tlw ;
        if ( signalExceptionsHandled ) _Printf ( ( byte* ) "\n_OVT_Pause : Signals Handled = %d : signal = %d : restart condition = %d\n", signalExceptionsHandled, _Q_->Signal,
            _Q_->RestartCondition ) ;
        do
        {
            _Debugger_->w_Word = Context_CurrentWord ( ) ;
            _Debugger_ShowInfo ( _Debugger_, ( byte* ) "\r", _Q_->Signal, 0 ) ;
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
                default:
                {
                    CfrTil_DoPrompt ( ) ;
                    if ( ( key == '/' ) || ( key == '\\' ) || ( key == 'i' ) ) key = 0 ;
                    _CfrTil_PrintChar ( key ) ;
                    ReadLine_Init ( _Context_->ReadLiner0, _CfrTil_Key ) ;
                    OpenVmTil_AddStringToHistoryOn ( ) ;
                    SetState ( _Context_, AT_COMMAND_LINE, true ) ;
                    Interpret_ToEndOfLine ( _Interpreter_ ) ;
                    ReadLine_SetRawInputFunction ( _Context_->ReadLiner0, ReadLine_GetNextCharFromString ) ;
                    continue ;
                }
#if 0                
                default:
                {
                    CfrTil_DebugOff ( ) ; // ? new idea ?
                    Context * cntx = CfrTil_Context_PushNew ( _CfrTil_ ) ;
                    OpenVmTil_AddStringToHistoryOn ( ) ;
                    SetState ( cntx, AT_COMMAND_LINE, true ) ;
                    Context_DoPrompt ( cntx ) ;
                    if ( key >= ' ' )
                    {
                        _ReadLine_GetLine ( cntx->ReadLiner0, key ) ;
                        Interpret_ToEndOfLine ( _Interpreter_ ) ; // just one line in a new context
                    }
                    SetState ( cntx, AT_COMMAND_LINE, false ) ;
                    CfrTil_Context_PopDelete ( _CfrTil_ ) ;
                    goto done ;
                }
#endif                
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
    return OVT_Pause ( 0, _Q_->SignalExceptionsHandled ) ;
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
OVT_SetExceptionMessage ( OpenVmTil * ovt )
{
    if ( ovt->RestartCondition == INITIAL_START ) ovt->ExceptionMessage = ( byte* ) "Full Initial Re-Start : ..." ;
    else if ( ovt->RestartCondition == ABORT ) ovt->ExceptionMessage = ( byte* ) "Aborting : ..." ;
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
// OVT_Throw needs to be reworked

void
OVT_Throw ( int signal, int64 restartCondition, Boolean pauseFlag )
{
    sigjmp_buf * jb ;
    OVT_SetRestartCondition ( _Q_, restartCondition ) ;
    if ( signal )
    {
        if ( ( signal == SIGTERM ) || ( signal == SIGKILL ) || ( signal == SIGQUIT ) || ( signal == SIGSTOP ) ) OVT_Exit ( ) ;
        else if ( signal == SIGBUS )
        {
            jb = & _Q_->JmpBuf0 ;
            OVT_SetRestartCondition ( _Q_, INITIAL_START ) ;
            _OVT_SimpleFinalPause ( "\nOVT_Throw : signal == SIGBUS : restarting to INITIAL_START ... with any <key>" ) ;
            goto jump ; 
        }
        else
        {
            if ( ( restartCondition > QUIT ) || ( _Q_->Signal == SIGSEGV ) || ( _Q_->Signal == SIGILL ) || ( _Q_->Signal == SIGFPE ) )
            {
                if ( ++ _Q_->SigSegvs < 2 )
                {
                    jb = & _CfrTil_->JmpBuf0 ;
                    OpenVmTil_ShowExceptionInfo ( ) ;
                    pauseFlag ++ ;
                    OVT_SetRestartCondition ( _Q_, ABORT ) ;
                }
                else OVT_SetRestartCondition ( _Q_, INITIAL_START ) ;
                if ( _Q_->SigSegvs > 3 ) _OVT_SigLongJump ( & _Q_->JmpBuf0 ) ; //OVT_Exit ( ) ;
                else if ( ( _Q_->SigSegvs > 1 ) || ( restartCondition == INITIAL_START ) ) jb = & _Q_->JmpBuf0 ;
            }
            else jb = & _CfrTil_->JmpBuf0 ;
        }
    }
    else
    {
        if ( restartCondition >= INITIAL_START ) jb = & _Q_->JmpBuf0 ;
        else jb = & _CfrTil_->JmpBuf0 ;
    }
    //OVT_SetExceptionMessage ( _Q_ ) ;
    
    snprintf ( Buffer_Data_Cleared (_Q_->ThrowBuffer), BUFFER_SIZE, "\n%s\n%s %s from %s -> ...", _Q_->ExceptionMessage, 
        ( jb == & _CfrTil_->JmpBuf0 ) ? "reseting cfrTil" : "restarting OpenVmTil",
        ( _Q_->Signal == SIGSEGV ) ? ": SIGSEGV" : "", ( _Q_->SigSegvs < 2 ) ? Context_Location ( ) : ( byte* ) "" ) ;
    _OVT_SimpleFinalPause ( _Q_->ThrowBuffer->Data ) ;
    if ( pauseFlag && ( _Q_->SignalExceptionsHandled < 2 ) && ( _Q_->SigSegvs < 2 ) ) OVT_Pause ( 0, _Q_->SignalExceptionsHandled ) ;
jump:
    _OVT_SigLongJump ( jb ) ;
}

void
OpenVmTil_Throw ( byte * excptMessage, byte * specialMessage, int64 restartCondition, int64 infoFlag )
{
    _Q_->ExceptionMessage = excptMessage ;
    _Q_->Thrown = restartCondition ;
    _Q_->ExceptionSpecialMessage = specialMessage ;

    if ( infoFlag ) OpenVmTil_ShowExceptionInfo ( ) ;
    OVT_Throw ( 0, restartCondition, 0 ) ;
}

void
_OpenVmTil_LongJmp_WithMsg ( int64 restartCondition, byte * msg )
{
    OpenVmTil_Throw ( msg, 0, restartCondition, 0 ) ;
}

void
OpenVmTil_SignalAction ( int signal, siginfo_t * si, void * uc )
{
    d0 ( _Printf ( ( byte* ) "\nOpenVmTil_SignalAction :: signal = %d\n", signal ) ) ;
    _Q_->Signal = signal ;
    _Q_->SigAddress = ( Is_DebugOn && _Debugger_->DebugAddress ) ? _Debugger_->DebugAddress : si->si_addr ;
    _Q_->SigLocation = ( ( ! ( signal & ( SIGSEGV | SIGBUS ) ) ) && _Context_ ) ? ( byte* ) c_gd ( Context_Location ( ) ) : ( byte* ) "" ;
    OVT_ResetSignals ( _Q_->Signal ) ;
    if ( ( signal >= SIGCHLD ) || ( signal == SIGTRAP ) ) //||( signal == SIGBUS ))
    {
        if ( ( signal != SIGCHLD ) && ( signal != SIGWINCH ) && ( signal != SIGTRAP ) ) OpenVmTil_ShowExceptionInfo ( ) ;
        _Q_->SigAddress = 0 ; //|| ( signal == SIGWINCH ) ) _Q_->SigAddress = 0 ; // 17 : "CHILD TERMINATED" : ignore; its just back from a shell fork
        _Q_->Signal = 0 ;
    }
    else if ( _Q_->SigSegvs )
    {
        OVT_SimpleFinalPause ( ) ;
        _OVT_SigLongJump ( & _Q_->JmpBuf0 ) ;
    }
    else OVT_Throw ( _Q_->Signal, _Q_->RestartCondition, 0 ) ;
}

void
CfrTil_Exception ( int64 exceptionCode, byte * message, int64 restartCondition )
{
    byte * b = Buffer_Data ( _CfrTil_->ScratchB1 ) ;
    AlertColors ;
    _Q_->ExceptionCode = exceptionCode ;
    printf ( "\n\nCfrTil_Exception at %s\n", Context_Location () ) ; fflush (stdout) ;
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
    _Q_->Signal = 0 ;
    _OpenVmTil_LongJmp_WithMsg ( INITIAL_START, ( byte* ) "Full Initial Re-Start : ..." ) ;
}

void
Error ( byte * emsg, byte * smsg, uint64 state )
{
    AlertColors ;
    if ( ( state ) & PAUSE )
    {
        CfrTil_NewLine () ;
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
_OVT_SimpleFinalPause ( byte * msg )
{
    printf ( "%s", msg ) ;
    fflush ( stdout ) ;
    Key ( ) ;
}

void
OVT_SimpleFinalPause ( )
{
    _OVT_SimpleFinalPause ( "\n!!Serious Error : SIGSEGV while handling a SIGSEGV : hit any key to continue full restart!!\n:!!> " ) ;
    fflush ( stdout ) ;
    Key ( ) ;
}

