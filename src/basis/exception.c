
#include "../include/cfrtil64.h"

int64
_OpenVmTil_ShowExceptionInfo ( int signal )
{
    if ( _Q_->Verbosity )
    {
        if ( _Q_->SignalExceptionsHandled ++ < 2 ) // ++ : for when this block throws and exception prevent looping and stack overflow
        {
            if ( _CfrTil_ )
            {
                Debugger * debugger = _Debugger_ ;
                if ( _Q_->ExceptionMessage ) _Printf ( "\n%s: %s\n", _Q_->ExceptionMessage, _Q_->ExceptionSpecialMessage ) ;
                Word * word = _Q_->ExceptionWord ;
                DebugOn ;
                if ( _Q_->Signal != SIGSEGV )
                {
                    if ( debugger->w_Word ) _Debugger_Locals_Show ( debugger, debugger->w_Word ) ;
                    Debugger_Stack ( debugger ) ;
                    if ( ! word )
                    {
                        word = Finder_Word_FindUsing ( _Finder_, _Q_->ExceptionToken, 1 ) ;
                        if ( ! word )
                        {
                            if ( _Q_->SigAddress ) word = Word_GetFromCodeAddress ( ( byte* ) _Q_->SigAddress ) ;
                            else word = _Context_->CurrentlyRunningWord ;
                            debugger->w_Word = word ;
                        }
                    }
                }
                AlertColors ;
                debugger->w_Word = _Context_->CurrentlyRunningWord ; //= word ; //_Interpreter_->LastWord ; ;
                SetState ( debugger, DBG_INFO, true ) ;
                Debugger_ShowInfo ( debugger, _Q_->ExceptionMessage, _Q_->Signal ) ;

                if ( _Q_->Signal != 11 )
                {
                    if ( GetState ( debugger, DBG_STEPPING ) ) Debugger_Registers ( debugger ) ;
                    if ( word )
                    {
                        _CfrTil_Source ( word, 0 ) ;
                        //if ( ! CompileMode && ( ! ( word->CAttribute & CPRIMITIVE ) ) ) _CfrTil_Word_Disassemble ( word ) ;
                    }
                }
            }
        }
        else
        {
            _Q_->RestartCondition = FULL_RESTART ;
        }
        _DisplaySignal ( _Q_->Signal ) ;
    }
    int64 rtrn = _OVT_Pause ( 0, _Q_->SignalExceptionsHandled ) ;
    _Q_->Signal = 0 ;
    return rtrn ;
}

int64
_OVT_Pause ( byte * prompt, int64 signalsHandled )
{
    int64 rtrn = 0 ;
    if ( _CfrTil_ && _Context_ )
    {
        if ( _Context_->CurrentlyRunningWord ) _Debugger_->ShowLine = "" ;
        byte buffer [512], *defaultPrompt =
            ( byte * ) "\n%s\n%s : at %s :: %s'd' (d)ebugger, 't' s(t)ack, c' (c)ontinue, 'q' (q)uit, 'x' e(x)it, 'i' '\\' or <key> (i)interpret, <return> loop%s" ;
        snprintf ( ( char* ) buffer, 512, ( char* ) prompt ? prompt : defaultPrompt, _Q_->ExceptionMessage ? _Q_->ExceptionMessage : ( byte* ) "\r",
            c_gd ( "pause" ), _Context_Location ( _Context_ ), c_gd ( _Debugger_->ShowLine ? _Debugger_->ShowLine : _Context_->ReadLiner0->InputLine ),
            c_gd ( "\n-> " ) ) ;
        DebugColors ;
        int64 tlw = Strlen ( defaultPrompt ) ;
        if ( tlw > _Debugger_->TerminalLineWidth ) _Debugger_->TerminalLineWidth = tlw ;
        if ( signalsHandled ) _Printf ( "\n_OVT_Pause : Signals Handled = %d : signal = %d : restart condition = %d\n", signalsHandled, _Q_->Signal,
            _Q_->RestartCondition ) ;
        do
        {
            if ( _Debugger_->w_Word = _Context_->CurrentlyRunningWord )
            {
                _CfrTil_ShowInfo ( _Debugger_, "\r", _Q_->Signal, 0 ) ;
                _Debugger_->w_Word = 0 ;
            }
            _Printf ( ( byte* ) "%s", buffer ) ;

            int64 key = Key ( ) ;
            _ReadLine_PrintfClearTerminalLine ( ) ;
            if ( ( key == 'x' ) || ( key == 'X' ) )
            {
                byte * msg = ( byte * ) "Exit cfrTil from pause?" ;
                _Printf ( ( byte* ) "\n%s : 'x' to e(x)it cfrTil : any other <key> to continue%s", msg, c_gd ( "\n-> " ) ) ;
                key = Key ( ) ;
                if ( ( key == 'x' ) || ( key == 'X' ) ) OVT_Exit ( ) ;
            }
            else if ( key == 'q' )
            {
                byte * msg = ( byte * ) "Quit to interpreter loop from pause?" ;
                _Printf ( ( byte* ) "\n%s : 'q' to (q)uit : any other key to continue%s", msg, c_gd ( "\n-> " ) ) ;
                key = Key ( ) ;
                if ( ( key == 'q' ) || ( key == 'Q' ) ) DefaultColors, _OVT_Throw ( QUIT, 1 ) ;
            }
            else if ( key == 'd' )
            {
                if ( Is_DebugOn )
                {
                    Debugger * debugger = _Debugger_ ;
                    SetState ( debugger, DBG_AUTO_MODE, false ) ;
                    SetState ( debugger, DBG_EVAL_AUTO_MODE, false ) ;
                    _Debugger_InterpreterLoop ( debugger ) ;
                }
                else
                {
                    CfrTil_DebugOn ( ) ;
                    SetState ( _Debugger_, DBG_INFO | DBG_MENU | DBG_PROMPT, true ) ;
                }
                break ;
            }
            else if ( key == 'c' )
            {
                // if ( signalsHandled ) ;
                rtrn = 1 ;
                break ;
            }
            else if ( key == 't' )
            {
                CfrTil_PrintDataStack ( ) ;
            }
            else if ( key == 'i' )
            {
                CfrTil_DoPrompt ( ) ;
                ReadLine_Init ( _Context_->ReadLiner0, _CfrTil_Key ) ;
                OpenVmTil_AddStringToHistoryOn ( ) ;
                SetState ( _Context_, AT_COMMAND_LINE, true ) ;
                _Interpret_ToEndOfLine ( _Interpreter_ ) ;
                ReadLine_SetRawInputFunction ( _Context_->ReadLiner0, ReadLine_GetNextCharFromString ) ;
            }
            else //if ( key >= ' ' )
            {
                CfrTil_DebugOff ( ) ; // ? new idea ?
                Context * cntx = CfrTil_Context_PushNew ( _CfrTil_ ) ;
                OpenVmTil_AddStringToHistoryOn ( ) ;
                SetState ( cntx, AT_COMMAND_LINE, true ) ;
                Context_DoPrompt ( cntx ) ;
                if ( key >= ' ' )
                {
                    if ( key == '\\' ) key = 0 ;
                    _ReadLine_GetLine ( cntx->ReadLiner0, key ) ;
                    _Interpret_ToEndOfLine ( _Interpreter_ ) ; // just one line in a new context
                }
                SetState ( cntx, AT_COMMAND_LINE, false ) ;
                CfrTil_Context_PopDelete ( _CfrTil_ ) ;
            }
        }
        while ( 1 ) ;
    }
    DefaultColors ;

    return rtrn ;
}

int64
_OpenVmTil_Pause ( byte * msg )
{
    _Printf ( ( byte* ) "\n%s", msg ) ;
    return _OVT_Pause ( 0, _Q_->SignalExceptionsHandled ) ;
}

void
OpenVmTil_Pause ( )
{

    DebugColors ;
    _OpenVmTil_Pause ( Context_Location ( ) ) ;
}

void
_OVT_Throw ( int64 restartCondition, int8 pauseFlag )
{
    sigjmp_buf * jb ;
    _Q_->RestartCondition = restartCondition ;
    if ( _Q_->Signal == SIGBUS )
    {
        jb = & _Q_->JmpBuf0 ;
        _Q_->RestartCondition = INITIAL_START ;
        siglongjmp ( *jb, 1 ) ;
    }
    if ( ( restartCondition > QUIT ) && ( ( _Q_->Signal & ( SIGSEGV | SIGBUS | SIGILL ) ) ) )
    {
        if ( _Q_->Signal & ( SIGSEGV | SIGBUS ) )
        {
            sigset_t signal_set ;
            sigemptyset ( &signal_set ) ;
            sigaddset ( &signal_set, ( SIGSEGV | SIGBUS ) ) ;
            sigprocmask ( SIG_UNBLOCK, &signal_set, NULL ) ;
            if ( ++ _Q_->SigSegvs < 2 )
            {
                jb = & _CfrTil_->JmpBuf0 ;
                if ( _Q_->Signal != SIGBUS )
                {
                    _OpenVmTil_ShowExceptionInfo ( _Q_->Signal ) ;
                    pauseFlag ++ ;
                    _Q_->RestartCondition = ABORT ;
                }
            }
            else _Q_->RestartCondition = INITIAL_START ;
        }
        if ( ( _Q_->SignalExceptionsHandled > 1 ) || ( restartCondition == INITIAL_START ) )
        {
            jb = & _Q_->JmpBuf0 ;
            _Q_->RestartCondition = INITIAL_START ;
        }
        else jb = & _CfrTil_->JmpBuf0 ;
    }
    else
    {
        if ( _Q_->RestartCondition >= INITIAL_START ) jb = & _Q_->JmpBuf0 ;
        else jb = & _CfrTil_->JmpBuf0 ;
    }
    printf ( "\n%s\n%s %s at %s -> ...", ( _Q_->ExceptionMessage ? _Q_->ExceptionMessage : ( byte* ) "" ),
        ( jb == & _CfrTil_->JmpBuf0 ) ? "reseting cfrTil" : "fully restarting", ( _Q_->Signal == SIGSEGV ) ? ": SIGSEGV" : "", Context_Location ( ) ) ;
    fflush ( stdout ) ;

    //if ( ( ! pauseFlag ) && ( _Q_->SignalExceptionsHandled < 2 ) ) _OVT_Pause ( 0, _Q_->SignalExceptionsHandled ) ;
    siglongjmp ( *jb, 1 ) ;
}

void
OpenVmTil_Throw ( byte * excptMessage, byte * specialMessage, int64 restartCondition, int64 infoFlag )
{
    _Q_->ExceptionMessage = excptMessage ;
    _Q_->Thrown = restartCondition ;
    _Q_->ExceptionSpecialMessage = specialMessage ;

    if ( infoFlag && ( _Q_->SignalExceptionsHandled < 2 ) ) _OpenVmTil_ShowExceptionInfo ( 0 ) ;
    _OVT_Throw ( restartCondition, 0 ) ;
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
    if ( ( signal >= SIGCHLD ) || ( signal == SIGTRAP ) ) //||( signal == SIGBUS ))
    {
        if ( ( signal != SIGCHLD ) && ( signal != SIGWINCH ) && ( signal != SIGTRAP ) ) _OpenVmTil_ShowExceptionInfo ( signal ) ;
        _Q_->SigAddress = 0 ; //|| ( signal == SIGWINCH ) ) _Q_->SigAddress = 0 ; // 17 : "CHILD TERMINATED" : ignore; its just back from a shell fork
        _Q_->Signal = 0 ;
    }
    else
    {
        //_Q_->SignalExceptionsHandled ++ ;
        if ( ( signal != SIGSEGV ) || _Q_->SignalExceptionsHandled < 2 ) _Printf ( ( byte* ) "\nOpenVmTil_SignalAction : address = 0x%016lx : %s", _Q_->SigAddress, _Q_->SigLocation ) ;
        if ( _Debugger_->DebugAddress )
        {
            _Debugger_Udis_OneInstruction ( _Debugger_, _Debugger_->DebugAddress, "", "" ) ;
            Debugger_Registers ( _Debugger_ ) ;
        }
        _OVT_Throw ( _Q_->RestartCondition, 0 ) ;
    }
}

void
CfrTil_Exception ( int64 signal, byte * message, int64 restartCondition )
{
    byte * b = Buffer_Data ( _CfrTil_->ScratchB1 ) ;
    AlertColors ;
    switch ( signal )
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
            OpenVmTil_Throw ( ( byte* ) "Exception : Word not found. Misssing namespace qualifier?\n", 0, QUIT, 1 ) ;
            break ;
        }
        case NOT_A_KNOWN_OBJECT:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Not a known object.\n", message, QUIT, 1 ) ;
            break ;
        }
        case ARRAY_DIMENSION_ERROR:
        {
            OpenVmTil_Throw ( ( byte* ) "Exception : Array has no dimensions!? ", 0, QUIT, 1 ) ;
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

// ?? the logic of exceptions could be reworked ??

void
Error3 ( byte * format, byte * one, byte * two, int64 three )
{

    char buffer [ 128 ] ;
    sprintf ( ( char* ) buffer, ( char* ) format, one, two ) ;
    Error ( ( byte* ) buffer, "", three ) ;
}

void
Error2 ( byte * format, byte * one, int64 two )
{
    char buffer [ 128 ] ;
    sprintf ( ( char* ) buffer, ( char* ) format, one ) ;
    Error ( ( byte* ) buffer, "", two ) ;
}

