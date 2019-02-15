#include "../include/cfrtil64.h"

// all except namespaces and number base
// this is called by the main interpreter _CfrTil_Interpret

void
_CfrTil_Init_SessionCore ( CfrTil * cfrTil, int64 cntxDelFlag, int64 promptFlag )
{
    Context * cntx = cfrTil->Context0 ;
    int64 i ;
    CfrTil_LogOff ( ) ;
    CfrTil_DbgSourceCodeOff ( ) ;
    OVT_FreeTempMem ( ) ;
    _System_Init ( cntx->System0 ) ;
    ReadLine_Init ( cntx->ReadLiner0, _CfrTil_Key ) ;
    Lexer_Init ( cntx->Lexer0, 0, 0, CONTEXT ) ;
    Finder_Init ( cntx->Finder0 ) ;
    Compiler_Init (cntx->Compiler0, 0, 0) ;
    Interpreter_Init ( cntx->Interpreter0 ) ;
    //CfrTil_ClearTokenList ( ) ;
    if ( cntxDelFlag )
    {
        int64 stackDepth = Stack_Depth ( cfrTil->ContextDataStack ) ;
        for ( i = 0 ; i < stackDepth ; i ++ ) CfrTil_Context_PopDelete ( cfrTil ) ;
    }
    LC_Init_Runtime ( ) ;
    LC_LispNamespacesOff ( ) ;
    CfrTil_CheckInitDataStack ( ) ;
    OVT_StartupMessage ( ) ;
    _OVT_Ok ( promptFlag ) ;
    cfrTil->SC_QuoteMode = 0 ;
    SC_Global_Off ;
    SetState_TrueFalse ( cfrTil, CFRTIL_RUN, DEBUG_MODE ) ;
    SetState ( cfrTil->Debugger0, DBG_ACTIVE, false ) ;
    DebugOff ;
    SetBuffersUnused ( 1 ) ;
    d0 ( Buffer_PrintBuffers ( ) ) ;
    DefaultColors ;
    cfrTil->ScWord = 0 ;
    SetState ( cfrTil, SOURCE_CODE_ON, true ) ;
    _CfrTil_TypeStackReset ( ) ;
    _CfrTil_RecycleInit_Compiler_N_M_Node_WordList ( 1 ) ;
    cfrTil->InitSessionCoreTimes ++ ;
    OVT_MemList_DeleteNBAMemory ( ( byte* ) "ObjectSpace" ) ; // not able to do this yet ??
}

void
CfrTil_SessionInit ( )
{
    _CfrTil_Init_SessionCore ( _CfrTil_, 0, 1 ) ;
}

void
CfrTil_ResetAll_Init ( CfrTil * cfrTil )
{
    byte * startDirectory = ( byte* ) "namespaces" ;
    if ( ! GetState ( _Q_, OVT_IN_USEFUL_DIRECTORY ) ) startDirectory = ( byte* ) "/usr/local/lib/cfrTil64/namespaces" ;
    DataObject_New ( NAMESPACE_VARIABLE, 0, ( byte* ) "_startDirectory_", NAMESPACE_VARIABLE, 0, 0, 0, ( int64 ) startDirectory, 0, 0, - 1 ) ;
    if ( ( _Q_->RestartCondition >= RESET_ALL ) )
    {
        _Q_->StartIncludeTries = 0 ;
        _CfrTil_Init_SessionCore ( cfrTil, 1, 0 ) ;
        _CfrTil_Namespace_NotUsing ( (byte*) "BigNum" ) ;
        _CfrTil_Namespace_NotUsing ( (byte*) "Lisp" ) ;
        if ( _Q_->StartupFilename )
        {
            _Q_->Verbosity = 0 ;
            _CfrTil_ContextNew_IncludeFile ( ( byte* ) "./namespaces/sinit.cft" ) ;
            _CfrTil_ContextNew_IncludeFile ( _Q_->StartupFilename ) ;
        }
        else
        {
            if ( ! _Q_->StartIncludeTries ++ )
            {
                _CfrTil_ContextNew_InterpretString ( cfrTil, _Q_->InitString ) ;
                _CfrTil_ContextNew_InterpretString ( cfrTil, _Q_->StartupString ) ;
            }
            else if ( _Q_->StartIncludeTries < 3 )
            {
                AlertColors ;
                _CfrTil_ContextNew_IncludeFile ( ( byte* ) "./namespaces/init.cft" ) ;
                if ( _Q_->ErrorFilename )
                {
                    if ( strcmp ( ( char* ) _Q_->ErrorFilename, "Debug Context" ) )
                    {
                        _Printf ( ( byte* ) "\nError : \"%s\" include error!\n", _Q_->SigLocation ? _Q_->SigLocation : _Q_->ErrorFilename ) ;
                    }
                }
                DefaultColors ;
            }
        }
    }
    if ( _Q_->Verbosity > 3 )
    {
        _Printf ( ( byte* ) " \nInternal Namespaces have been initialized.  " ) ;
        OVT_ShowMemoryAllocated ( ) ;
    }
    //if ( ( _Q_->InitSessionCoreTimes == 1 ) || ( ! _Q_->Verbosity ) ) _Q_->Verbosity = 1 ;
}

void
_CfrTil_InitialAddWordToNamespace ( Word * word, byte * containingNamespaceName, byte * superNamespaceName )
// this is only called at startup where we want to add the namespace to the RootNamespace
{
    Namespace *ns, *sns = _CfrTil_->Namespaces ;
    if ( superNamespaceName )
    {
        sns = Namespace_FindOrNew_SetUsing (superNamespaceName, sns, 1 ) ;
        sns->State |= USING ;
    }
    ns = Namespace_FindOrNew_SetUsing (containingNamespaceName, sns, 1 ) ; // find new namespace or create anew
    Namespace_DoAddWord ( ns, word ) ; // add word to new namespace
}

void
_CfrTil_CPrimitiveNewAdd ( const char * name, byte * pb_TypeSignature, uint64 opInsnGroup, uint64 opInsCode, block b, uint64 ctype, uint64 ctype2, uint64 ltype, const char *nameSpace, const char * superNamespace )
{
    Word * word = _Word_New ( ( byte* ) name, CPRIMITIVE | ctype, ctype2, ltype, 1, 0, DICTIONARY ) ;
    _DObject_ValueDefinition_Init ( word, ( int64 ) b, BLOCK, 0, 0 ) ;
    _CfrTil_InitialAddWordToNamespace ( word, ( byte* ) nameSpace, ( byte* ) superNamespace ) ;
    if ( ctype & INFIXABLE ) word->WAttribute = WT_INFIXABLE ;
    else if ( ctype & PREFIX ) word->WAttribute = WT_PREFIX ;
    else if ( ctype & C_PREFIX_RTL_ARGS ) word->WAttribute = WT_C_PREFIX_RTL_ARGS ;
    else word->WAttribute = WT_POSTFIX ;
    word->CAttribute2 = ctype2 ;
    word->W_OpInsnCode = opInsCode ;
    word->W_OpInsnGroup = opInsnGroup ;
    if ( pb_TypeSignature ) strncpy ( ( char* ) &word->W_TypeSignatureString, ( char* ) pb_TypeSignature, 8 ) ;
}

void
CfrTil_AddCPrimitives ( )
{
    int64 i ;
    for ( i = 0 ; CPrimitives [ i ].ccp_Name ; i ++ )
    {
        CPrimitive p = CPrimitives [ i ] ;
        _CfrTil_CPrimitiveNewAdd ( p.ccp_Name, (byte*) p.pb_TypeSignature, p.OpInsnCodeGroup, p.OpInsnCode, p.blk_Definition, p.ui64_CAttribute, p.ui64_CAttribute2, p.ui64_LAttribute, ( char* ) p.NameSpace, ( char* ) p.SuperNamespace ) ;
    }
    //_CfrTil_CPrimitiveNewAdd ( p.ccp_Name, p.blk_Definition, p.ui64_CAttribute, p.ui64_CAttribute2, p.ui64_LAttribute, ( char* ) p.NameSpace, ( char* ) p.SuperNamespace ) ;
}

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
    int64 i, functionArg ;
    block * callHook ;
    Debugger * debugger = _Debugger_ ;
    // this form (below) can and should replace the above form for adding here
    _CfrTil_MachineCodePrimitive_NewAdd ( "restoreCpuState", CPRIMITIVE, 0, & debugger->RestoreCpuState, ( byte* ) Compile_CpuState_Restore, ( int64 ) debugger->cs_Cpu, "Debug", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "saveCpuState", CPRIMITIVE, 0, & debugger->SaveCpuState, ( byte* ) Compile_CpuState_Save, ( int64 ) debugger->cs_Cpu, "Debug", "Root" ) ;

    _CfrTil_MachineCodePrimitive_NewAdd ( "restoreCpuState", CPRIMITIVE, 0, & cfrTil->RestoreCpuState, ( byte* ) Compile_CpuState_Restore, ( int64 ) cfrTil->cs_Cpu, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "saveCpuState", CPRIMITIVE, 0, & cfrTil->SaveCpuState, ( byte* ) Compile_CpuState_Save, ( int64 ) cfrTil->cs_Cpu, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "restoreCpu2State", CPRIMITIVE, 0, & cfrTil->RestoreCpu2State, ( byte* ) Compile_CpuState_Restore, ( int64 ) cfrTil->cs_Cpu2, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "saveCpu2State", CPRIMITIVE, 0, & cfrTil->SaveCpu2State, ( byte* ) Compile_CpuState_Save, ( int64 ) cfrTil->cs_Cpu2, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "restoreSelectedCpuState", CPRIMITIVE, 0, & cfrTil->RestoreSelectedCpuState, ( byte* ) _Compile_CpuState_RestoreSelected, ( int64 ) cfrTil->cs_Cpu, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "saveSelectedCpuState", CPRIMITIVE, 0, & cfrTil->SaveSelectedCpuState, ( byte* ) _Compile_CpuState_SaveSelected, ( int64 ) cfrTil->cs_Cpu, "System", "Root" ) ;
#if 1    
    _CfrTil_MachineCodePrimitive_NewAdd ( "getRsp", CPRIMITIVE, 0, & debugger->getRsp, ( byte* ) Compile_Debug_GetRSP, - 1, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "callCurrentBlock", CPRIMITIVE, 0, & cfrTil->CallCurrentBlock, ( byte* ) Compile_Call_CurrentBlock, - 1, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "set_DataStackPointer_FromDspReg", CPRIMITIVE, 0, & cfrTil->Set_DataStackPointer_FromDspReg, ( byte* ) Compile_Set_DataStackPointer_FromDspReg, - 1, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "set_DspReg_FromDataStackPointer", CPRIMITIVE, 0, & cfrTil->Set_DspReg_FromDataStackPointer, ( byte* ) Compile_Set_DspReg_FromDataStackPointer, - 1, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "call_ToAddressThruR8_TestAlignRSP", CPRIMITIVE, 0, & cfrTil->Call_ToAddressThruR8_TestAlignRSP, ( byte* ) Compile_Call_ToAddressThruR8_TestAlignRSP, - 1, "System", "Root" ) ;
    //{ "popDspToR8AndCall", CPRIMITIVE, 0, ( byte* ) _Compile_PopDspToR8AndCall, - 1, "System", "Root" },
    //_CfrTil_MachineCodePrimitive_NewAdd ( "popDspToR8AndCall", CPRIMITIVE, & cfrTil->PopDspToR8AndCall, ( byte* ) Compile_PopDspToR8AndCall, -1, "System", "Root" ) ;
#if 0 //RSP_ADJUST // x64 ABI   
    _CfrTil_MachineCodePrimitive_NewAdd ( "callReg_TestRSP", CPRIMITIVE, 0, & cfrTil->CallReg_TestRSP, ( byte* ) Compile_Call_ToAddressThruReg_TestAlignRSP, - 1, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "callReg_AdjustRSP", CPRIMITIVE, 0, & cfrTil->CallReg_AdjustRSP, ( byte* ) Compile_CallReg_AdjustRSP, - 1, "System", "Root" ) ;
#endif    
    //_CfrTil_MachineCodePrimitive_NewAdd ( "adjustRSPAndCall", CPRIMITIVE, (block*)& cfrTil->adjustRSPAndCall, ( byte* ) Compile_AdjustRSPAndCall, -1, "System", "Root" ) ;
    //_CfrTil_MachineCodePrimitive_NewAdd ( "adjustRSP", CPRIMITIVE, (block*)& cfrTil->adjustRSP, ( byte* ) Compile_AdjustRSP, -1, "System", "Root" ) ;
#endif    
#if 1  
    for ( i = 0 ; MachineCodePrimitives [ i ].ccp_Name ; i ++ )
    {
        MachineCodePrimitive p = MachineCodePrimitives [ i ] ;
        functionArg = - 1 ; // this is also flag in _DObject_ValueDefinition_Init
        callHook = 0 ;
        _CfrTil_MachineCodePrimitive_NewAdd ( p.ccp_Name, p.ui64_CAttribute, p.ui64_CAttribute2, callHook, p.Function, functionArg, p.NameSpace, p.SuperNamespace ) ;
    }
#endif    
}



