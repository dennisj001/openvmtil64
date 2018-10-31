
#include "../../include/cfrtil64.h"

// these functions are part of the C vm and can't be compiled
// ! they are should only be called in C functions !
#if ! DSP_IS_GLOBAL_REGISTER

uint64
DataStack_Pop ( )
{
    _CfrTil_->Set_DataStackPointer_FromDspReg ( ) ;
    int64 value = _Dsp_ [ 0 ] ; //
    _Dsp_ -- ;
    _CfrTil_->Set_DspReg_FromDataStackPointer ( ) ; // update DSP reg
    return value ;
}

void
DataStack_Push ( int64 value )
{
    _CfrTil_->Set_DataStackPointer_FromDspReg ( ) ;
    _Dsp_ ++ ;
    _Dsp_ [0] = value ;
    _CfrTil_->Set_DspReg_FromDataStackPointer ( ) ; // update DSP reg
}

void
DataStack_Dup ( )
{
    _CfrTil_->Set_DataStackPointer_FromDspReg ( ) ;
    _Dsp_ [ 1 ] = _Dsp_[0] ;
    _Dsp_ ++ ;
    _CfrTil_->Set_DspReg_FromDataStackPointer ( ) ; // update DSP reg
}

void
DataStack_DropN ( int64 n )
{
    _CfrTil_->Set_DataStackPointer_FromDspReg ( ) ;
    _Dsp_ -= n ;
    _CfrTil_->Set_DspReg_FromDataStackPointer ( ) ; // update DSP reg
}

void
DataStack_Drop ( )
{
    _CfrTil_->Set_DataStackPointer_FromDspReg ( ) ;
    _Dsp_ -- ;
    _CfrTil_->Set_DspReg_FromDataStackPointer ( ) ; // update DSP reg
}
#else

uint64
DataStack_Pop ( )
{
    int64 value = _Dsp_ [ 0 ] ; //
    _Dsp_ -- ;
    return value ;
}

void
DataStack_Push ( int64 value )
{
    _Dsp_ ++ ;
    _Dsp_ [0] = value ;
}

#if 0
void
DataStack_Push_TypeStackPush ( Word * word, int64 value )
{
    DataStack_Push ( value ) ;
    //if ( GetState ( _CfrTil_, OPTIMIZE_ON ) ) 
    CfrTil_TypeStackPush ( word ) ;
}
#endif

void
DataStack_Dup ( )
{
    _Dsp_ [ 1 ] = _Dsp_[0] ;
    _Dsp_ ++ ;
}

void
DataStack_DropN ( int64 n )
{
    _Dsp_ -= n ;
}

void
DataStack_Drop ( )
{
    _Dsp_ -- ;
}
#endif

inline int64
DataStack_Overflow ( )
{
    return ( _Dsp_ >= _DataStack_->StackMax ) ;
}

inline int64
DataStack_Underflow ( )
{
    return ( _Dsp_ < _DataStack_->InitialTosPointer ) ;
}

void
DataStack_Check ( )
{
    if ( DataStack_Underflow ( ) || DataStack_Overflow ( ) )
    {
        CfrTil_Exception ( STACK_OVERFLOW, 0, QUIT ) ;
    }
}

int64
DataStack_Depth ( )
{
    if ( _Q_ && _CfrTil_ && _DataStack_ )
    {
        _DataStackPointer_ = _Dsp_ ;
        return Stack_Depth ( _DataStack_ ) ;
    }
    return 0 ;
}

// safe form with stack checking

void
_CfrTil_PrintDataStack ( )
{
    Stack_Print ( _DataStack_, ( byte* ) "DataStack", 0 ) ;
}

void
CfrTil_PrintDataStack ( )
{
    Set_DataStackPointer_FromDspReg ( ) ;
    _CfrTil_PrintDataStack ( ) ;
}

void
CfrTil_PrintStackDepth ( )
{
    _Printf ( ( byte* ) "\nDataStack : depth = %d", Stack_Depth ( _DataStack_ ) ) ;
}

void
CpuState_Set_CpuStateDsp_WithDataStackPointer ( Cpu * cpu )
{
    cpu->CPU_DSP = _Dsp_ ;
}

void
_Debugger_Set_DataStackPointer_WithCpuStateDsp ( Debugger * debugger )
{
    _Dsp_ = debugger->cs_Cpu->CPU_DSP ;
}

void
Set_DebuggerDspReg_FromDspReg ( )
{
    _Debugger_->cs_Cpu->R14d = _Dsp_ ;
}

void
Set_DspReg_FromDebuggerDspReg ( )
{
    _Dsp_ = _Debugger_->cs_Cpu->R14d ;
}

void
Set_DataStackPointers_FromDebuggerDspReg ( )
{
    _Dsp_ = _Debugger_->cs_Cpu->R14d ;
    _CfrTil_->DataStack->StackPointer = _Dsp_ ;
}

void
Set_DataStackPointer_FromDspReg ( )
{
    _CfrTil_->Set_DataStackPointer_FromDspReg ( ) ;
}

void
Set_DspReg_FromDataStackPointer ( )
{
    _Debugger_->cs_Cpu->R14d = _Dsp_ ;
    _CfrTil_->Set_DspReg_FromDataStackPointer ( ) ;
}

void
CfrTil_CheckInitDataStack ( )
{
    //CfrTil_SetStackPointerFromDsp ( _CfrTil_ ) ;
    if ( Stack_Depth ( _DataStack_ ) < 0 )
    {
        _Stack_PrintHeader ( _DataStack_, ( byte* ) "DataStack" ) ;
        _Printf ( ( byte* ) c_ad ( "\n\nError : %s : %s : Stack Underflow!" ), _Context_->CurrentlyRunningWord ? _Context_->CurrentlyRunningWord->Name : ( byte * ) "", _Context_Location ( _Context_ ) ) ;
        _Printf ( ( byte* ) c_gd ( "\nReseting DataStack.\n" ) ) ;
        _Stack_Init ( _CfrTil_->DataStack, _Q_->DataStackSize ) ;
        _CfrTil_DataStack_Init ( _CfrTil_ ) ;
        _Stack_PrintHeader ( _DataStack_, ( byte* ) "DataStack" ) ;
    }
    //_Set_DspReg_FromDataStackPointer ( ) ;
}

void
CfrTil_DataStack_Size ( )
{
    DataStack_Push ( DataStack_Depth ( ) ) ;
}

#if 0

void
Debugger_SyncStackPointersFromCpuState ( Debugger * debugger )
{
    int64 pflag = false ;
    if ( debugger->cs_Cpu->State && ( debugger->cs_Cpu->CPU_DSP != _Dsp_ ) )
    {
        if ( Is_DebugModeOn && ( _Q_->Verbosity > 3 ) )
        {
            pflag = true ;
            _Printf ( ( byte* ) "\n_Debugger_SetStackPointerFromDebuggerCpuState : stack pointer adjust ::> debugger->cs_CpuState->State = %d : Dsp = 0x%016lx != cpu->CPU_DSP = 0x%016lx",
                debugger->cs_Cpu->State, _Dsp_, debugger->cs_Cpu->CPU_DSP ) ;
        }
        CpuState_Set_CpuStateDsp_WithDataStackPointer ( debugger->cs_Cpu ) ;
        if ( pflag )
        {
            _Printf ( ( byte* ) "\n_Debugger_SetStackPointerFromDebuggerCpuState : stack pointer adjusted ::> cfrTil->DataStack->StackPointer = 0x%016lx : Dsp = 0x%016lx : cpu->CPU_DSP = 0x%016lx\n",
                _CfrTil_->DataStack->StackPointer, _Dsp_, debugger->cs_Cpu->CPU_DSP ) ;
        }
    }
    else Set_DataStackPointer_FromDspReg ( ) ;
}

void
CfrTil_SetStackPointerFromDsp ( CfrTil * cfrTil )
{
    if ( cfrTil && cfrTil->DataStack )
    {
        if ( ( Is_DebugModeOn || ( _Q_->Verbosity > 3 ) ) && ( cfrTil->DataStack->StackPointer != _Dsp_ ) )
        {
            _Printf ( ( byte* ) "\nCfrTil_SetStackPointerFromDsp : stack pointers adjust ::> DataStack->StackPointer = 0x%016lx != Dsp = 0x%016lx\n", cfrTil->DataStack->StackPointer, _Dsp_ ) ;
        }
        Set_DataStackPointer_FromDspReg ( cfrTil ) ;
    }
}

void
CfrTil_SyncStackPointersFromDsp ( )
{
    CfrTil_SetStackPointerFromDsp ( _CfrTil_ ) ;
}

void
_CfrTil_InitDspFromStackPointer ( CfrTil * cfrTil )
{
#if 0    
    if ( cfrTil && cfrTil->DataStack && ( cfrTil->DataStack->StackPointer != _Dsp_ ) )
    {
        if ( Is_DebugModeOn || ( _Q_->Verbosity > 1 ) )
        {
            _Printf ( ( byte* ) "\n_CfrTil_SetDspFromStackPointer : stack pointers adjust ::> Dsp = 0x%016lx != DataStack->StackPointer = 0x%016lx\n", _Dsp_, cfrTil->DataStack->StackPointer ) ;
        }
    }
#endif    
    Set_DspReg_FromDataStackPointer ( ) ;
}

void
CfrTil_InitDspFromStackPointer ( CfrTil * cfrTil )
{
    if ( cfrTil && cfrTil->DataStack ) _CfrTil_InitDspFromStackPointer ( cfrTil ) ;
}

void
CfrTil_DataStack_InitEssential ( CfrTil * cfrTil )
{
    //Stack * stk = cfrTil->DataStack ;
    //_Stack_Init ( cfrTil->DataStack, _Q_->DataStackSize ) ;
    //Stack_Init ( cfrTil->DataStack ) ;
    //_CfrTil_InitDspFromStackPointer ( cfrTil ) ;
    Set_DspReg_FromDataStackPointer ( ) ;
    cfrTil->SaveDsp = _Dsp_ ;
}
#endif


