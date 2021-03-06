
#include "../include/csl.h"

void
OpenVmTil_Verbosity ( )
{
    if ( Compiling ) _Compile_Stack_Push ( DSP, ACC, ( int64 ) &_O_->Verbosity ) ; //CSL_CompileAndRecord_Word0_PushReg ( ACC ) ; //_Compile_Stack_Push ( DSP, ( int64 ) & _O_->Verbosity ) ;
    else DataStack_Push ( ( int64 ) & _O_->Verbosity ) ;
}

void
OpenVmTil_ShowMachineCodeInstructions ( )
{
    if ( Compiling ) _Compile_Stack_Push ( DSP, ACC, ( int64 ) & _O_->Dbi ) ; //CSL_CompileAndRecord_Word0_PushReg ( ACC ) ; //_Compile_Stack_Push ( DSP, ( int64 ) & _O_->Verbosity ) ;
    else DataStack_Push ( ( int64 ) & _O_->Dbi ) ;
}

void
Ovt_Optimize ( )
{
    DataStack_Push ( ( int64 ) GetState ( _CSL_, OPTIMIZE_ON ) ? 1 : 0 ) ;
}

void
Ovt_Inlining ( )
{
    DataStack_Push ( ( int64 ) GetState ( _CSL_, INLINE_ON ) ? 1 : 0 ) ;
}

// allows variables to be created on first use without a "var" declaration

void
Ovt_AutoVar ( )
{
    DataStack_Push ( ( int64 ) GetState ( _O_, AUTO_VAR ) ? 1 : 0 ) ;
}

void
Ovt_AutoVarOff ( )
{
    SetState ( _O_, AUTO_VAR, false ) ;
}

// allows variables to be created on first use without a "var" declaration

void
Ovt_AutoVarOn ( )
{
    SetState ( _O_, AUTO_VAR, true ) ;
}

void
OpenVmTil_HistorySize ( )
{
    DataStack_Push ( ( int64 ) & _O_->HistorySize ) ;
}

void
OpenVmTil_DataStackSize ( )
{
    DataStack_Push ( ( int64 ) & _O_->DataStackSize ) ;
}

void
OpenVmTil_CodeSize ( )
{
    DataStack_Push ( ( int64 ) & _O_->MachineCodeSize ) ;
}

void
OpenVmTil_SessionObjectsSize ( )
{
    DataStack_Push ( ( int64 ) & _O_->SessionObjectsSize ) ;
}

void
OpenVmTil_CompilerTempObjectsSize ( )
{
    DataStack_Push ( ( int64 ) & _O_->CompilerTempObjectsSize ) ;
}

void
OpenVmTil_ObjectsSize ( )
{
    DataStack_Push ( ( int64 ) & _O_->ObjectsSize ) ;
}

void
OpenVmTil_DictionarySize ( )
{
    DataStack_Push ( ( int64 ) & _O_->DictionarySize ) ;
}

void
OpenVmTil_Print_DataSizeofInfo ( int64 flag )
{
    if ( flag || ( _O_->Verbosity > 1 ) )
    {
        _Printf ( ( byte* ) "\nOpenVimTil size : %d bytes, ", sizeof (OpenVmTil ) ) ;
        _Printf ( ( byte* ) "Object size : %d bytes, ", sizeof (Object ) ) ;
        _Printf ( ( byte* ) "dobject size : %d bytes, ", sizeof ( dobject ) ) ;
        _Printf ( ( byte* ) "DLNode size : %d bytes, ", sizeof ( DLNode ) ) ;
        _Printf ( ( byte* ) "PropInfo size : %d bytes, ", sizeof (AttributeInfo ) ) ;
        //_Printf ( ( byte* ) "\nCAttribute0 size : %d bytes, ", sizeof (struct _T_CAttribute0 ) ) ;
        _Printf ( ( byte* ) "\nCSL size : %d bytes, ", sizeof (CSL ) ) ;
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
    _OVT_ShowMemoryAllocated ( _O_ ) ;
}

void
OVT_Exit ( )
{
    if ( _O_->Verbosity > 0 ) _Printf ( ( byte* ) "bye\n" ) ;
    exit ( 0 ) ;
}

void
OVT_StartupMessage ( Boolean promptFlag )
{
    if ( _O_->Verbosity > 0 )
    {
        DefaultColors ;
        //if ( CSL->InitSessionCoreTimes > 1 ) CSL_NewLine () ;
        if ( promptFlag && ( _O_->Restarts < 2 ) )
        {
            System_Time ( _CSL_->Context0->System0, 0, ( char* ) "\nStartup", 1 ) ;
            _CSL_Version ( promptFlag ) ;
        }
        if ( _O_->Verbosity > 1 )
        {
            _Printf ( ( byte* ) "\nOpenVmTil : csl comes with ABSOLUTELY NO WARRANTY; for details type `license' in the source directory." ) ;
            _Printf ( ( byte* ) "\nType 'tc' 'demo' for starters" ) ;
            _Printf ( ( byte* ) "\nType 'bye' to exit" ) ;
        }
    }
    else if ( promptFlag && ( _O_->Restarts < 2 ) ) _O_->Verbosity = 1 ;
}

void
_OVT_Ok ( Boolean promptFlag )
{
    if ( _O_->Verbosity > 3 )
    {
        _CSL_SystemState_Print ( 0 ) ;
        _Printf ( ( byte* ) "\n<Esc> - break, <Ctrl-C> - quit, <Ctrl-D> - restart, \'bye\'/\'exit\' - leave." ) ;
    }
    _Context_Prompt ( _O_->Verbosity && promptFlag ) ;
}

void
OVT_Ok ( )
{
    _OVT_Ok ( 1 ) ;
    //_CSL_Prompt ( _O_->Verbosity && ( ( _O_->RestartCondition < RESET_ALL ) || _O_->StartTimes > 1 ) ) ;
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

