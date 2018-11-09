
#include "../include/cfrtil64.h"

void
OpenVmTil_Verbosity ( )
{
    if ( Compiling ) _Compile_Stack_Push ( DSP, ACC, ( int64 ) & _Q_->Verbosity ) ; //CfrTil_CompileAndRecord_Word0_PushReg ( ACC ) ; //_Compile_Stack_Push ( DSP, ( int64 ) & _Q_->Verbosity ) ;
    else DataStack_Push ( ( int64 ) & _Q_->Verbosity ) ;
    CfrTil_TypeStackPush ( _Context_->CurrentlyRunningWord ) ;
}

void
Ovt_Optimize ( )
{
    DataStack_Push ( ( int64 ) GetState ( _CfrTil_, OPTIMIZE_ON ) ? 1 : 0 ) ;
}

void
Ovt_Inlining ( )
{
    DataStack_Push ( ( int64 ) GetState ( _CfrTil_, INLINE_ON ) ? 1 : 0 ) ;
}

// allows variables to be created on first use without a "var" declaration

void
Ovt_AutoVar ( )
{
    DataStack_Push ( ( int64 ) GetState ( _Q_, AUTO_VAR ) ? 1 : 0 ) ;
}

void
Ovt_AutoVarOff ( )
{
    SetState ( _Q_, AUTO_VAR, false ) ;
}

// allows variables to be created on first use without a "var" declaration

void
Ovt_AutoVarOn ( )
{
    SetState ( _Q_, AUTO_VAR, true ) ;
}

void
OpenVmTil_HistorySize ( )
{
    DataStack_Push ( ( int64 ) & _Q_->HistorySize ) ;
}

void
OpenVmTil_DataStackSize ( )
{
    DataStack_Push ( ( int64 ) & _Q_->DataStackSize ) ;
}

void
OpenVmTil_CodeSize ( )
{
    DataStack_Push ( ( int64 ) & _Q_->MachineCodeSize ) ;
}

void
OpenVmTil_SessionObjectsSize ( )
{
    DataStack_Push ( ( int64 ) & _Q_->SessionObjectsSize ) ;
}

void
OpenVmTil_CompilerTempObjectsSize ( )
{
    DataStack_Push ( ( int64 ) & _Q_->CompilerTempObjectsSize ) ;
}

void
OpenVmTil_ObjectsSize ( )
{
    DataStack_Push ( ( int64 ) & _Q_->ObjectsSize ) ;
}

void
OpenVmTil_DictionarySize ( )
{
    DataStack_Push ( ( int64 ) & _Q_->DictionarySize ) ;
}

void
OpenVmTil_Print_DataSizeofInfo ( int64 flag )
{
    if ( flag || ( _Q_->Verbosity > 1 ) )
    {
        _Printf ( ( byte* ) "\nOpenVimTil size : %d bytes, ", sizeof (OpenVmTil ) ) ;
        _Printf ( ( byte* ) "Object size : %d bytes, ", sizeof (Object ) ) ;
        _Printf ( ( byte* ) "dobject size : %d bytes, ", sizeof ( dobject ) ) ;
        _Printf ( ( byte* ) "DLNode size : %d bytes, ", sizeof ( DLNode ) ) ;
        _Printf ( ( byte* ) "PropInfo size : %d bytes, ", sizeof (AttributeInfo ) ) ;
        //_Printf ( ( byte* ) "\nCAttribute0 size : %d bytes, ", sizeof (struct _T_CAttribute0 ) ) ;
        _Printf ( ( byte* ) "CfrTil size : %d bytes, ", sizeof (CfrTil ) ) ;
        _Printf ( ( byte* ) "Context size : %d bytes, ", sizeof (Context ) ) ;
        _Printf ( ( byte* ) "System size : %d bytes, ", sizeof (System ) ) ;
        _Printf ( ( byte* ) "Debugger size : %d bytes, ", sizeof (Debugger ) ) ;
        _Printf ( ( byte* ) "\nMemorySpace size : %d bytes, ", sizeof (MemorySpace ) ) ;
        _Printf ( ( byte* ) "ReadLiner size : %d bytes, ", sizeof (ReadLiner ) ) ;
        _Printf ( ( byte* ) "Lexer size : %d bytes, ", sizeof (Lexer ) ) ;
        _Printf ( ( byte* ) "Interpreter size : %d bytes, ", sizeof (Interpreter ) ) ;
        _Printf ( ( byte* ) "\nFinder size : %d bytes, ", sizeof (Finder ) ) ;
        _Printf ( ( byte* ) "Compiler size : %d bytes, ", sizeof (Compiler ) ) ;
        _Printf ( ( byte* ) "Word size : %d bytes, ", sizeof (Word ) ) ;
        _Printf ( ( byte* ) "Symbol size : %d bytes, ", sizeof (Symbol ) ) ;
        _Printf ( ( byte* ) "\ndlnode size : %d bytes, ", sizeof (dlnode ) ) ;
        _Printf ( ( byte* ) "dllist size : %d bytes, ", sizeof (dllist ) ) ;
        _Printf ( ( byte* ) "WordData size : %d bytes, ", sizeof (WordData ) ) ;
        _Printf ( ( byte* ) "ListObject size : %d bytes, ", sizeof ( ListObject ) ) ;
        _Printf ( ( byte* ) "\nByteArray size : %d bytes, ", sizeof (ByteArray ) ) ;
        _Printf ( ( byte* ) "NamedByteArray size : %d bytes, ", sizeof (NamedByteArray ) ) ;
        _Printf ( ( byte* ) "MemChunk size : %d bytes", sizeof ( MemChunk ) ) ;
    }
}

void
OVT_ShowMemoryAllocated ( )
{
    _OVT_ShowMemoryAllocated ( _Q_ ) ;
}

void
OVT_Exit ( )
{
    if ( _Q_->Verbosity > 0 ) _Printf ( ( byte* ) "bye\n" ) ;
    exit ( 0 ) ;
}

void
OVT_StartupMessage ( )
{
    if ( ( ++ _Q_->InitSessionCoreTimes == 2 ) && ( _Q_->Verbosity > 0 ) ) // 2 : first time is in CfrTil_ResetAll_Init
    {
        DefaultColors ;
        System_Time ( _CfrTil_->Context0->System0, 0, ( char* ) "\nStartup", 1 ) ; //_Q_->StartedTimes == 1 ) ;
        _CfrTil_Version ( 0 ) ;
        if ( _Q_->Verbosity > 1 )
        {
            _Printf ( ( byte* ) "\nOpenVmTil : cfrTil comes with ABSOLUTELY NO WARRANTY; for details type `license' in the source directory." ) ;
            _Printf ( ( byte* ) "\nType 'testCfrTil' or 'test' <tab><enter> and then 'demo' for starters" ) ;
            _Printf ( ( byte* ) "\nType 'bye' to exit" ) ;
        }
    }
    if ( ! _Q_->Verbosity ) _Q_->Verbosity = 1 ;
}

void
_OVT_Ok ( int64 promptFlag )
{
    if ( _Q_->Verbosity > 3 )
    {
        _CfrTil_SystemState_Print ( 0 ) ;
        _Printf ( ( byte* ) "\n<Esc> - break, <Ctrl-C> - quit, <Ctrl-D> - restart, \'bye\'/\'exit\' - leave." ) ;
    }
    _Context_Prompt ( _Q_->Verbosity && promptFlag ) ;
}

void
OVT_Ok ( )
{
    _OVT_Ok ( 1 ) ;
    //_CfrTil_Prompt ( _Q_->Verbosity && ( ( _Q_->RestartCondition < RESET_ALL ) || _Q_->StartTimes > 1 ) ) ;
}

#if 0 // not used

void
OVT_Prompt ( )
{
    if ( GetState ( _Context_->System0, DO_PROMPT ) ) // && ( ( _Context->OutputLineCharacterNumber == 0 ) || ( _Context->OutputLineCharacterNumber > 3 ) ) )
    {
        _Context_Prompt ( 1 ) ;
    }
}
#endif

