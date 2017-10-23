
#include "../../include/cfrtil64.h"

// these functions are part of the C vm and can't be compiled
// ! they are should only be called in C functions !

uint64
_DataStack_Pop ( )
{
    return Dsp -- [ 0 ] ;
}

void
_DataStack_Push ( int64 value )
{
    *++ Dsp = value ;
}

void
_DataStack_Dup ( )
{
    Dsp [ 1 ] = TOS ;
    Dsp ++ ;
}

void
_DataStack_DropN ( int64 n )
{
    Dsp -= n ;
}

void
_DataStack_Drop ( )
{
    Dsp -- ;
}

int64
DataStack_Overflow ( )
{
    return ( Dsp >= _DataStack_->StackMax ) ;
}

int64
DataStack_Underflow ( )
{
    return ( Dsp < _DataStack_->InitialTosPointer ) ;
}

void
DataStack_Check ( )
{
    if ( ( Dsp < _DataStack_->InitialTosPointer ) || ( Dsp >= _DataStack_->StackMax ) )
    {
        CfrTil_Exception ( STACK_OVERFLOW, QUIT ) ;
    }
}

int64
DataStack_Depth ( )
{
    if ( _Q_ && _CfrTil_ && _DataStack_ )
    {
        _DataStackPointer_ = Dsp ;
        return Stack_Depth ( _DataStack_ ) ;
    }
    return 0 ;
}

// safe form with stack checking

int64
DataStack_Pop ( )
{
    //_DataStackPointer_ = Dsp ;
    int64 top = _DataStack_Pop ( ) ;
    //int64 top = Stack_Pop_WithExceptionOnEmpty ( _DataStack_ ) ;
    return top ;
}

void
CpuState_SyncStackPointersFromCpuState ( Cpu * cpus )
{
    if ( GetState ( _CfrTil_->cs_Cpu, CPU_SAVED ) ) Dsp = ( uint64* ) cpus->CPU_DSP ;
    _CfrTil_SetStackPointerFromDsp ( _CfrTil_ ) ;
}

void
_Debugger_SyncStackPointersFromCpuState ( Debugger * debugger )
{
    CpuState_SyncStackPointersFromCpuState ( debugger->cs_Cpu ) ;
}

void
Debugger_SyncStackPointersFromCpuState ( Debugger * debugger )
{
    int64 pflag = false ;
    if ( debugger->cs_Cpu->State && ( debugger->cs_Cpu->CPU_DSP != Dsp ) )
    {
        if ( Is_DebugModeOn && ( _Q_->Verbosity > 3 ) )
        {
            pflag = true ;
            _Printf ( ( byte* ) "\n_Debugger_SetStackPointerFromDebuggerCpuState : stack pointer adjust ::> debugger->cs_CpuState->State = %d : Dsp = 0x%016lx != cpu->CPU_DSP = 0x%016lx",
                debugger->cs_Cpu->State, Dsp, debugger->cs_Cpu->CPU_DSP ) ;
        }
        CpuState_SyncStackPointersFromCpuState ( debugger->cs_Cpu ) ;
        if ( pflag )
        {
            _Printf ( ( byte* ) "\n_Debugger_SetStackPointerFromDebuggerCpuState : stack pointer adjusted ::> cfrTil->DataStack->StackPointer = 0x%016lx : Dsp = 0x%016lx : cpu->CPU_DSP = 0x%016lx\n",
                _CfrTil_->DataStack->StackPointer, Dsp, debugger->cs_Cpu->CPU_DSP ) ;
        }
    }
    else  _CfrTil_SetStackPointerFromDsp ( _CfrTil_ ) ;
}

void
_CfrTil_SetStackPointerFromDsp ( CfrTil * cfrTil )
{
    d1 ( uint64 *dsp = Dsp ) ;
    if ( cfrTil && cfrTil->DataStack ) cfrTil->DataStack->StackPointer = Dsp ;
}

void
CfrTil_SetStackPointerFromDsp ( CfrTil * cfrTil )
{
    if ( cfrTil && cfrTil->DataStack ) //&& ( cfrTil->DataStack->StackPointer != Dsp ) )
    {
        if ( ( Is_DebugModeOn || ( _Q_->Verbosity > 3 ) ) && ( cfrTil->DataStack->StackPointer != Dsp ) )
        {
            _Printf ( ( byte* ) "\nCfrTil_SetStackPointerFromDsp : stack pointers adjust ::> DataStack->StackPointer = 0x%016lx != Dsp = 0x%016lx\n", cfrTil->DataStack->StackPointer, Dsp ) ;
        }
        _CfrTil_SetStackPointerFromDsp ( cfrTil ) ;
    }
}

void
CfrTil_SyncStackPointersFromDsp ( )
{
    CfrTil_SetStackPointerFromDsp ( _CfrTil_ ) ;
}

#if 0
void
CfrTil_SyncStackPointersFromESI ( )
{
    
}
#endif

void
_CfrTil_InitDspFromStackPointer ( CfrTil * cfrTil )
{
    if ( cfrTil && cfrTil->DataStack && ( cfrTil->DataStack->StackPointer != Dsp ) )
    {
        if ( Is_DebugModeOn || ( _Q_->Verbosity > 1 ) )
        {
            _Printf ( ( byte* ) "\n_CfrTil_SetDspFromStackPointer : stack pointers adjust ::> Dsp = 0x%016lx != DataStack->StackPointer = 0x%016lx\n", Dsp, cfrTil->DataStack->StackPointer ) ;
        }
        Dsp = cfrTil->DataStack->StackPointer ;
    }
}

void
CfrTil_InitDspFromStackPointer ( CfrTil * cfrTil )
{
    if ( cfrTil && cfrTil->DataStack ) _CfrTil_InitDspFromStackPointer ( cfrTil ) ;
}

void
CfrTil_DataStack_InitEssential ( CfrTil * cfrTil )
{
    Stack * stk = cfrTil->DataStack ;
    _Stack_Init ( stk, _Q_->DataStackSize ) ;
    _CfrTil_InitDspFromStackPointer ( cfrTil ) ;
    cfrTil->SaveDsp = Dsp ;
}

void
_CfrTil_PrintDataStack ( )
{
    _Stack_Print ( _DataStack_, ( byte* ) "DataStack" ) ;
}

void
CfrTil_PrintDataStack ( )
{
    //CfrTil_SetStackPointerFromDsp ( _CfrTil_ ) ;
    CfrTil_SyncStackPointersFromDsp ( ) ;
    _CfrTil_PrintDataStack ( ) ;
}

void
CfrTil_CheckInitDataStack ( )
{
    CfrTil_SetStackPointerFromDsp ( _CfrTil_ ) ;
    if ( Stack_Depth ( _DataStack_ ) < 0 )
    {
        _Stack_PrintHeader ( _DataStack_, ( byte* ) "DataStack" ) ;
        _Printf ( ( byte* ) c_ad ( "\n\nError : %s : %s : Stack Underflow!" ), _Context_->CurrentlyRunningWord ? _Context_->CurrentlyRunningWord->Name : ( byte * ) "", _Context_Location ( _Context_ ) ) ;
        _Printf ( ( byte* ) c_gd ( "\nReseting DataStack.\n" ) ) ;
        _CfrTil_DataStack_Init ( _CfrTil_ ) ;
        _Stack_PrintHeader ( _DataStack_, ( byte* ) "DataStack" ) ;
    }
    //_Printf ( ( byte* ) "\n" ) ;
}

void
CfrTil_DataStack_Size ( )
{
    _DataStack_Push ( DataStack_Depth ( ) ) ;
}

