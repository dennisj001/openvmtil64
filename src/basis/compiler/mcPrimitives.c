
#include "../../include/cfrtil64.h"

#if 0
void
MCP_MoveArrayN_To_Reg ( int64 reg, byte * array, int64 n )
{
    // pop reg, array, n
    // move array to reg
}
#endif

#if 0 // useful but not yet in use
void
Compile_CallCFunction_TestAlignRSP_MoveResultRegRaxToTOS ( byte * cFunction )
{
    Compile_Call_ToAddressThruReg_TestAlignRSP ( cFunction, CALL_THRU_REG ) ; 
    _Compile_Stack_PushReg ( DSP, RAX ) ;
}
#endif

void
_CfrTil_MachineCodePrimitive_NewAdd ( const char * name, uint64 cType, int64 ctype2, block * callHook, byte * function, int64 functionArg, const char *nameSpace, const char * superNamespace )
{
    //_DObject_New ( byte * name, uint64 value, uint64 ctype, uint64 ltype, uint64 ftype, byte * function, int64 arg, int64 addToInNs, Namespace * addToNs, uint64 allocType )
    Word * word = _DObject_New ( ( byte* ) name, ( uint64 ) function, ( cType | CPRIMITIVE ), ctype2, 0, 0, function, functionArg, 0, 0, DICTIONARY ) ;
    if ( callHook ) *callHook = word->Definition ;
    _CfrTil_InitialAddWordToNamespace ( word, ( byte* ) nameSpace, ( byte* ) superNamespace ) ;
}

void
CfrTil_MachineCodePrimitive_AddWords ( CfrTil * cfrTil )
{
    Debugger * debugger = _Debugger_ ;
    // this form (below) can and should replace the loop because we need to have variables for some elements
    _CfrTil_MachineCodePrimitive_NewAdd ( "call_ToAddressThruR8_TestAlignRSP", CPRIMITIVE, 0, & cfrTil->Call_ToAddressThruR8_TestAlignRSP, ( byte* ) Compile_Call_ToAddressThruR8_TestAlignRSP, - 1, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "restoreCpuState", CPRIMITIVE, 0, & debugger->RestoreCpuState, ( byte* ) Compile_CpuState_Restore, ( int64 ) debugger->cs_Cpu, "Debug", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "saveCpuState", CPRIMITIVE, 0, & debugger->SaveCpuState, ( byte* ) Compile_CpuState_Save, ( int64 ) debugger->cs_Cpu, "Debug", "Root" ) ;

    _CfrTil_MachineCodePrimitive_NewAdd ( "restoreCpuState", CPRIMITIVE, 0, & cfrTil->RestoreCpuState, ( byte* ) Compile_CpuState_Restore, ( int64 ) cfrTil->cs_Cpu, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "saveCpuState", CPRIMITIVE, 0, & cfrTil->SaveCpuState, ( byte* ) Compile_CpuState_Save, ( int64 ) cfrTil->cs_Cpu, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "restoreCpu2State", CPRIMITIVE, 0, & cfrTil->RestoreCpu2State, ( byte* ) Compile_CpuState_Restore, ( int64 ) cfrTil->cs_Cpu2, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "saveCpu2State", CPRIMITIVE, 0, & cfrTil->SaveCpu2State, ( byte* ) Compile_CpuState_Save, ( int64 ) cfrTil->cs_Cpu2, "System", "Root" ) ;
    //_CfrTil_MachineCodePrimitive_NewAdd ( "restoreSelectedCpuState", CPRIMITIVE, 0, & cfrTil->RestoreSelectedCpuState, ( byte* ) _Compile_CpuState_RestoreSelected, ( int64 ) cfrTil->cs_Cpu, "System", "Root" ) ;
    //_CfrTil_MachineCodePrimitive_NewAdd ( "saveSelectedCpuState", CPRIMITIVE, 0, & cfrTil->SaveSelectedCpuState, ( byte* ) _Compile_CpuState_SaveSelected, ( int64 ) cfrTil->cs_Cpu, "System", "Root" ) ;
    //_CfrTil_MachineCodePrimitive_NewAdd ( "getRsp", CPRIMITIVE, 0, & debugger->getRsp, ( byte* ) Compile_Debug_GetRSP, - 1, "System", "Root" ) ;
    //_CfrTil_MachineCodePrimitive_NewAdd ( "callCurrentBlock", CPRIMITIVE, 0, & cfrTil->CallCurrentBlock, ( byte* ) Compile_Call_CurrentBlock, - 1, "System", "Root" ) ;
    //_CfrTil_MachineCodePrimitive_NewAdd ( "set_DataStackPointer_FromDspReg", CPRIMITIVE, 0, & cfrTil->Set_DataStackPointer_FromDspReg, ( byte* ) Compile_Set_DataStackPointer_FromDspReg, - 1, "System", "Root" ) ;
    //_CfrTil_MachineCodePrimitive_NewAdd ( "set_DspReg_FromDataStackPointer", CPRIMITIVE, 0, & cfrTil->Set_DspReg_FromDataStackPointer, ( byte* ) Compile_Set_DspReg_FromDataStackPointer, - 1, "System", "Root" ) ;
#if 0  
    { "<rt-dbg>", CPRIMITIVE|DEBUG_WORD, RT_STEPPING_DEBUG, 0, ( byte* ) _CfrTil_DebugRuntimeBreakpoint, - 1, "Debug", "Root" },
    { "<dso>", CPRIMITIVE|DEBUG_WORD, RT_STEPPING_DEBUG, 0, ( byte* ) _CfrTil_DebugRuntimeBreakpoint_IsDebugShowOn, - 1, "Debug", "Root" },
    { "<d:dbg>", CPRIMITIVE|DEBUG_WORD, RT_STEPPING_DEBUG, 0, ( byte* ) _CfrTil_DebugRuntimeBreakpoint_IsDebugOn, - 1, "Debug", "Root" },
    { "rspReg", CPRIMITIVE, 0, 0, ( byte* ) _Compile_RspReg_Get, - 1, "System", "Root" },
    { "rspReg@", CPRIMITIVE, 0, 0, ( byte* ) _Compile_RspReg_Fetch, - 1, "System", "Root" },
    { ">rspReg", CPRIMITIVE, 0, 0, ( byte* ) _Compile_RspReg_To, - 1, "System", "Root" },
    { "rspReg>", CPRIMITIVE, 0, 0, ( byte* ) _Compile_RspReg_From, - 1, "System", "Root" },
    { "rspRegdrop", CPRIMITIVE, 0, 0, ( byte* ) _Compile_RspReg_Drop, - 1, "Debug", "Root" },
    //{ "rspReg!", CPRIMITIVE, 0, 0, ( byte* ) _Compile_RspReg_Store, - 1, "System", "Root" },
    for ( i = 0 ; MachineCodePrimitives [ i ].ccp_Name ; i ++ )
    {
        MachineCodePrimitive p = MachineCodePrimitives [ i ] ;
        functionArg = - 1 ; // this is also flag in _DObject_ValueDefinition_Init
        callHook = 0 ;
        _CfrTil_MachineCodePrimitive_NewAdd ( p.ccp_Name, p.ui64_CAttribute, p.ui64_CAttribute2, callHook, p.Function, functionArg, p.NameSpace, p.SuperNamespace ) ;
    }
#endif    
}



