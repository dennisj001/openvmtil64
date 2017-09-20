#include "../../include/cfrtil.h"

void
_CpuState_Show ( Cpu * cpu )
{
    byte * location = Context_Location ( ) ;
    if ( cpu == _Debugger_->cs_Cpu ) _Printf ( ( byte* ) "\nDebugger CpuState : at %s", location ) ;
    else _Printf ( ( byte* ) "\nC Runtime (_CfrTil_) CpuState :" ) ;
    _Printf ( ( byte* ) "\nRAX " UINT_FRMT_0x016, cpu->Rax ) ;
    _Printf ( ( byte* ) " RCX " UINT_FRMT_0x016, cpu->Rcx ) ;
    _Printf ( ( byte* ) " RDX " UINT_FRMT_0x016, cpu->Rdx ) ;
    _Printf ( ( byte* ) " RBX " UINT_FRMT_0x016, cpu->Rbx ) ;
    _Printf ( ( byte* ) "\nRSP " UINT_FRMT_0x016, cpu->Rsp ) ;
    _Printf ( ( byte* ) " RBP " UINT_FRMT_0x016, cpu->Rbp ) ;
    _Printf ( ( byte* ) " RSI " UINT_FRMT_0x016, cpu->Rsi ) ;
    _Printf ( ( byte* ) " RDI " UINT_FRMT_0x016, cpu->Rdi ) ;
    _Printf ( ( byte* ) "\nR8  " UINT_FRMT_0x016, cpu->R8d ) ;
    _Printf ( ( byte* ) " R9  " UINT_FRMT_0x016, cpu->R9d ) ;
    _Printf ( ( byte* ) " R10 " UINT_FRMT_0x016, cpu->R10d ) ;
    _Printf ( ( byte* ) " R11 " UINT_FRMT_0x016, cpu->R11d ) ;
    _Printf ( ( byte* ) "\nR12 " UINT_FRMT_0x016, cpu->R12d ) ;
    _Printf ( ( byte* ) " R13 " UINT_FRMT_0x016, cpu->R13d ) ;
    _Printf ( ( byte* ) " R14 " UINT_FRMT_0x016, cpu->R14d ) ;
    _Printf ( ( byte* ) " R15 " UINT_FRMT_0x016, cpu->R15d ) ;
    if ( _Debugger_->DebugAddress ) _Printf ( ( byte* ) "\nRIP " UINT_FRMT_0x016, _Debugger_->DebugAddress ) ;
    else _Printf ( ( byte* ) "\nRIP " UINT_FRMT_0x016, cpu->Rip ) ;
    _Printf ( ( byte* ) " RFlags :: 0x%08x :: ", cpu->RFlags ) ;
    Print_Binary ( ( uint64 ) cpu->RFlags, 14, 14 ) ;
    _Printf ( ( byte* ) " :: of:11 %d sf:7:%d, zf:6:%d, af:4:%d, pf:2:%d, cf:0:%d :: flag:bit:value",
        ( uint64 ) cpu->RFlags & OVERFLOW_FLAG ? 1 : 0, ( uint64 ) cpu->RFlags & SIGN_FLAG ? 1 : 0, ( uint64 ) cpu->RFlags & ZERO_FLAG ? 1 : 0,
        ( uint64 ) cpu->RFlags & AUX_FLAG ? 1 : 0, ( uint64 ) cpu->RFlags & PARITY_FLAG ? 1 : 0, ( uint64 ) cpu->RFlags & CARRY_FLAG ? 1 : 0
        ) ;
    d0 ( _PrintNStackWindow ( ( int64* ) cpu->Rsp, "ReturnStack", "ESP", 8 ) ) ;
}

// save the incoming current cpu register state to the C struct
// we are mainly concerned here about what goes into the C struct
// but we have to be careful not to negatively affect the C compiler 
// runtime in the process

void
_Compile_CpuState_Save ( Cpu * cpu )
{
    // push order for pushad
    // nb : intel stacks grow down toward lesser memory by 
    // subtracting from ESP to push and adding to pop
    // SoftwareDevelopersManual-253665.pdf, section 6.2
    // registers are pushed in this order ...
    // eax, ecx, edx, ebx, esp, ebp, esi, edi
    _Compile_PushReg ( RAX ) ; // scratch reg1
    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->R9d, R9D, RAX ) ; // save scratch reg r9d thru rax
    _Compile_PopToReg ( RAX ) ; // restore rax

    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->Rax, RAX, R9D ) ; // eax
    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->Rcx, RCX, R9D ) ; // edx
    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->Rdx, RDX, R9D ) ; // edx
    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->Rbx, RBX, R9D ) ; // edx
    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->Rsp, RSP, R9D ) ; // Rsp //this won't be accurate for the runtime because it is called from C 
    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->Rbp, RBP, R9D ) ; // edx
    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->Rsi, RSI, R9D ) ; // edx
    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->Rdi, RDI, R9D ) ; // edx

    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->R8d, R8D, R9D ) ; // edx
    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->R9d, R9D, R9D ) ; // edx
    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->R10d, R10D, R9D ) ; // edx
    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->R11d, R11D, R9D ) ; // ebx

    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->R12d, R12D, R9D ) ; // esp //this won't be accurate for the runtime because it is called from C 
    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->R13d, R13D, R9D ) ; // ebp
    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->R14d, R14D, R9D ) ; // esi
    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->R15d, R15D, R9D ) ; // edi

    //_Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & _Debugger_->DebugESP, RSP, R9D ) ; // esp //this won't be accurate for the runtime because it is called from C 
    //_Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & _Debugger_->DebugEBP, RBP, R9D ) ; // ebp
    //_Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & _Debugger_->DebugESI, R14D, R9D ) ; // esi
    //_Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & _Debugger_->DebugEDI, R15D, R9D ) ; // edi

    //_Compile_MoveImm_To_Reg ( RAX, 0, CELL_SIZE ) ;
    _Compile_PushFD ( ) ; // save flags
    _Compile_PopToReg ( RAX ) ; // ebx now has eflags
    _Compile_MoveImm_To_Reg ( RBX, 0xfffbffff, 4 ) ;
    _Compile_Int8 ( 0x40 ) ;
    Compile_AND ( REG, REG, RAX, RBX, 0, 0, CELL_SIZE ) ;
    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & cpu->RFlags, RAX, R9D ) ; //flags
    _Compile_Get_FromCAddress_ToReg ( RAX, ( byte* ) & cpu->Rax ) ; // our scratch reg

    // restore our scratch regs so we leave things as we found them
    _Compile_Get_FromCAddress_ToReg ( R9D, ( byte* ) & cpu->R9d ) ; // our scratch reg
}

// we have the cpu register state stored in a C struct 
// accurately restore that struct into the cpu register state 
// so that the cpu register state is as saved in the C struct when we leave

void
_Compile_CpuState_Restore ( Cpu * cpu, int8 cStackRegFlag, int8 jmpRetFlag )
{
    _Compile_Get_FromCAddress_ToReg ( RAX, ( byte* ) & cpu->Rax ) ; // rax
    _Compile_Get_FromCAddress_ToReg ( RDX, ( byte* ) & cpu->Rdx ) ; // rdx
    _Compile_Get_FromCAddress_ToReg ( RCX, ( byte* ) & cpu->Rcx ) ; // rcx
    _Compile_Get_FromCAddress_ToReg ( RBX, ( byte* ) & cpu->Rbx ) ; // rbx

    _Compile_Get_FromCAddress_ToReg ( RSI, ( byte* ) & cpu->Rsi ) ; // rsi
    _Compile_Get_FromCAddress_ToReg ( RDI, ( byte* ) & cpu->Rdi ) ; // rdi
    _Compile_Get_FromCAddress_ToReg ( R8D, ( byte* ) & cpu->R8d ) ; // r8d
    _Compile_Get_FromCAddress_ToReg ( R9D, ( byte* ) & cpu->R9d ) ; // r9d
    _Compile_Get_FromCAddress_ToReg ( R10D, ( byte* ) & cpu->R10d ) ; // r10d
    _Compile_Get_FromCAddress_ToReg ( R11D, ( byte* ) & cpu->R11d ) ; // r11d
    _Compile_Get_FromCAddress_ToReg_ThruReg ( R12D, ( byte * ) & cpu->R12d, R9D ) ;
    _Compile_Get_FromCAddress_ToReg_ThruReg ( R13D, ( byte * ) & cpu->R13d, R9D ) ;
    _Compile_Get_FromCAddress_ToReg ( R14D, ( byte* ) & cpu->R14d ) ; // r14d
    _Compile_Get_FromCAddress_ToReg ( R15D, ( byte* ) & cpu->R15d ) ; // r15d

    //if ( ! jmpRetFlag )
    {
        //DBI_ON ;
        //_Compile_MoveImm_To_Reg ( RAX, 0, CELL_SIZE ) ;
        _Compile_Get_FromCAddress_ToReg ( RAX, ( byte* ) & cpu->RFlags ) ;
        _Compile_MoveImm_To_Reg ( RBX, 0x00003ffff, 8 ) ;
        _Compile_Int8 ( 0x40 ) ;
        Compile_AND ( REG, REG, RAX, RBX, 0, 0, CELL_SIZE ) ;
        _Compile_PushReg ( RAX ) ; // the flags
        _Compile_PopFD ( ) ; // pops the pushed flags in ebx to flags reg           // eflags
#if 0        
        _Compile_PushFD ( ) ;
        _Compile_PopFD ( ) ; // pops the pushed flags in ebx to flags reg           // eflags
#endif        

        _Compile_Get_FromCAddress_ToReg ( RBX, ( byte* ) & cpu->Rbx ) ; // restore scratch reg rax
        _Compile_Get_FromCAddress_ToReg ( RAX, ( byte* ) & cpu->Rax ) ; // restore scratch reg rax
        //DBI_OFF ;
    }

    if ( cStackRegFlag )
    {
        _Compile_Get_FromCAddress_ToReg_ThruReg ( RSP, ( byte * ) & cpu->Rsp, R9D ) ;
        _Compile_Get_FromCAddress_ToReg_ThruReg ( RBP, ( byte * ) & cpu->Rbp, R9D ) ;
        _Compile_Get_FromCAddress_ToReg ( R9D, ( byte* ) & cpu->R9d ) ; // r9d
    }
    if ( jmpRetFlag )
    {
        _Compile_Get_FromCAddress_ToReg ( R9D, ( byte* ) & cpu->Rsp ) ; // r9d
        Compile_SUBI ( REG, RSP, 0, CELL, 0 ) ;
        _Compile_JumpToReg ( R9D ) ;
    }
}

void
Compile_CpuState_Restore ( Cpu * cpu )
{
    _Compile_CpuState_Restore ( cpu, 0, 0 ) ;
}

void
Compile_CpuState_RestoreHere ( Cpu * cpu )
{
    _Compile_CpuState_Restore ( cpu, 1, 1 ) ;
}

Cpu *
_CpuState_Copy ( Cpu *dst, Cpu * src )
{
    memcpy ( dst, src, sizeof ( Cpu ) ) ;
    return dst ;
}

Cpu *
CpuState_Copy ( Cpu * cpu0, uint64 type )
{
    Cpu * cpu = CpuState_New ( type ) ;
    _CpuState_Copy ( cpu, cpu0 ) ;
    return cpu ;
}

Cpu *
CpuState_New ( uint64 type )
{
    Cpu * cpu ;
    cpu = ( Cpu * ) Mem_Allocate ( sizeof (Cpu ), type ) ;
    return cpu ;
}

Cpu *
_CpuState_SaveCurrent ( )
{
    Cpu * newCpu = CpuState_New ( TEMPORARY ) ;
    _CfrTil_->SaveCpuState ( ) ;
    _CpuState_Copy ( newCpu, _CfrTil_->cs_Cpu ) ;
    return newCpu ;
}

void
_CpuState_Restore ( Cpu * cpu )
{
    Cpu *svCpu = _CfrTil_->cs_Cpu ; //CpuState_Copy ( _CfrTil_->cs_Cpu, TEMPORARY ) ;
    _CfrTil_->cs_Cpu = cpu ;
    _CfrTil_->RestoreCpuState ( ) ;
    _CfrTil_->cs_Cpu = svCpu ;
}

void
CpuState_Save ( )
{
    Cpu *newCpu = _CpuState_SaveCurrent ( ) ;
    _DataStack_Push ( ( int64 ) newCpu ) ;
}

void
CpuState_Restore ( )
{
    Cpu *cpu = ( Cpu * ) _DataStack_Pop ( ) ;
    _CpuState_Restore ( cpu ) ;
}

