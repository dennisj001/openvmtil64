#include "../include/cfrtil64.h"

// all except namespaces and number base
// this is called by the main interpreter _CfrTil_Interpret

void
_CfrTil_Init_SessionCore ( CfrTil * cfrTil, int64 cntxDelFlag, int64 promptFlag )
{
    int64 i ;
    CfrTil_LogOff ( ) ;
    CfrTil_DbgSourceCodeOff () ;
    _System_Init ( _Context_->System0 ) ;
    ReadLine_Init ( _Context_->ReadLiner0, _CfrTil_Key ) ;
    Lexer_Init ( _Context_->Lexer0, 0, 0, CONTEXT ) ;
    Finder_Init ( _Context_->Finder0 ) ;
    Compiler_Init ( _Context_->Compiler0, 0 ) ;
    Interpreter_Init ( _Context_->Interpreter0 ) ;
    CfrTil_ClearTokenList ( ) ;
    if ( cntxDelFlag )
    {
        int64 stackDepth = Stack_Depth ( cfrTil->ContextDataStack ) ;
        for ( i = 0 ; i < stackDepth ; i ++ ) CfrTil_Context_PopDelete ( cfrTil ) ;
    }
    OVT_MemListFree_TempObjects ( ) ;
    OVT_MemListFree_CompilerTempObjects ( ) ;
    OVT_MemListFree_LispTemp ( ) ; // more careful allocation accounting work needs to be done before something like this can be done now
    CfrTil_CheckInitDataStack ( ) ;
    if ( ! _Q_->Verbosity ) _Q_->Verbosity = 1 ;
    _OVT_Ok ( promptFlag ) ;
    cfrTil->SC_QuoteMode = 0 ;
    SC_Global_Off ;
    SetState_TrueFalse ( cfrTil, CFRTIL_RUN, DEBUG_MODE ) ;
    SetState ( cfrTil->Debugger0, DBG_ACTIVE, false ) ;
    DebugOff ;
    SetBuffersUnused ( 1 ) ;
    d0 ( Buffer_PrintBuffers ( ) ) ;
}

void
CfrTil_ContextInit ( )
{
    _CfrTil_Init_SessionCore ( _CfrTil_, 0, 1 ) ;
}

void
CfrTil_ResetAll_Init ( CfrTil * cfrTil )
{
    byte * startDirectory = ( byte* ) "namespaces" ;
    if ( ! GetState ( _Q_, OVT_IN_USEFUL_DIRECTORY ) ) startDirectory = ( byte* ) "/usr/local/lib/cfrTil64/namespaces" ;
    _DataObject_New (NAMESPACE_VARIABLE, 0, ( byte* ) "_startDirectory_", NAMESPACE_VARIABLE, 0, 0, 0, ( int64 ) startDirectory, 0 ) ;
    if ( ( _Q_->RestartCondition >= RESET_ALL ) ) 
    {
        _Q_->StartIncludeTries = 0 ;
        _CfrTil_Init_SessionCore ( cfrTil, 1, 0 ) ;
        if ( _Q_->StartupFilename )
        {
            _Q_->Verbosity = 0 ;
            _CfrTil_ContextNew_IncludeFile ( ( byte* ) "./namespaces/.sinit.cft" ) ;
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
                _CfrTil_ContextNew_IncludeFile ( ( byte* ) "./namespaces/.init.cft" ) ;
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
    if ( ( _Q_->InitSessionCoreTimes == 1 ) || ( ! _Q_->Verbosity ) ) _Q_->Verbosity = 1 ;
}

void
_CfrTil_InitialAddWordToNamespace ( Word * word, byte * containingNamespaceName, byte * superNamespaceName )
// this is only called at startup where we want to add the namespace to the RootNamespace
{
    Namespace *ns, *sns = _CfrTil_->Namespaces ;
    if ( superNamespaceName )
    {
        sns = Namespace_FindOrNew_SetUsing ( superNamespaceName, sns, 1 ) ;
        sns->State |= USING ;
    }
    ns = Namespace_FindOrNew_SetUsing ( containingNamespaceName, sns, 1 ) ; // find new namespace or create anew
    Namespace_DoAddWord ( ns, word ) ; // add word to new namespace
}

void
_CfrTil_CPrimitiveNewAdd ( const char * name, block b, uint64 ctype, uint64 ctype2, uint64 ltype, const char *nameSpace, const char * superNamespace )
{
    Word * word = _Word_New (( byte* ) name, CPRIMITIVE | ctype, ctype2, ltype, 1, 0, EXISTING ) ; //DICTIONARY ) ;
    _DObject_ValueDefinition_Init ( word, ( int64 ) b, BLOCK, 0, 0 ) ;
    _CfrTil_InitialAddWordToNamespace ( word, ( byte* ) nameSpace, ( byte* ) superNamespace ) ;
    if ( ctype & INFIXABLE ) word->WAttribute = WT_INFIXABLE ;
    else if ( ctype & PREFIX ) word->WAttribute = WT_PREFIX ;
    else if ( ctype & C_PREFIX_RTL_ARGS ) word->WAttribute = WT_C_PREFIX_RTL_ARGS ;
    else word->WAttribute = WT_POSTFIX ;
    word->CAttribute2 = ctype2 ;
}

void
CfrTil_AddCPrimitives ( )
{
    int64 i ;
    for ( i = 0 ; CPrimitives [ i ].ccp_Name ; i ++ )
    {
        CPrimitive p = CPrimitives [ i ] ;
        _CfrTil_CPrimitiveNewAdd ( p.ccp_Name, p.blk_Definition, p.ui64_CAttribute, p.ui64_CAttribute2, p.ui64_LAttribute, ( char* ) p.NameSpace, ( char* ) p.SuperNamespace ) ;
    }
}

void
CfrTil_MachineCodePrimitive_AddWords ( CfrTil * cfrTil )
{
    int64 i, functionArg ;
    block * callHook ;
    Debugger * debugger = _Debugger_ ;
    for ( i = 0 ; MachineCodePrimitives [ i ].ccp_Name ; i ++ )
    {
        MachineCodePrimitive p = MachineCodePrimitives [ i ] ;
        functionArg = - 1 ; // this is also flag in _DObject_ValueDefinition_Init

        // initialize some values in MachineCodePrimitives that are variables and have to be calculated at run time
#if 1        
        if ( String_Equal ( p.ccp_Name, "getRsp" ) )
        {
            functionArg = - 1 ; //0 ; //( int64 ) debugger->DebugESP ;
            callHook = & debugger->getRsp ;
        }
        else
#endif            
        if ( ( String_Equal ( p.ccp_Name, "restoreCpuState" ) ) && ( String_Equal ( p.NameSpace, "Debug" ) ) )
        {
            functionArg = ( int64 ) debugger->cs_Cpu ;
            callHook = & debugger->RestoreCpuState ;
        }
        else if ( ( String_Equal ( p.ccp_Name, "saveCpuState" ) ) && ( String_Equal ( p.NameSpace, "Debug" ) ) )
        {
            functionArg = ( int64 ) debugger->cs_Cpu ;
            callHook = & debugger->SaveCpuState ;
        }
        else if ( ( String_Equal ( p.ccp_Name, "restoreCpuState" ) ) && ( String_Equal ( p.NameSpace, "System" ) ) )
        {
            functionArg = ( int64 ) cfrTil->cs_Cpu ;
            callHook = & cfrTil->RestoreCpuState ;
        }
        else if ( ( String_Equal ( p.ccp_Name, "saveCpuState" ) ) && ( String_Equal ( p.NameSpace, "System" ) ) )
        {
            functionArg = ( int64 ) cfrTil->cs_Cpu ;
            //functionArg = cfrTil ;
            callHook = & cfrTil->SaveCpuState ;
        }
        else if ( ( String_Equal ( p.ccp_Name, "saveCpu2State" ) ) && ( String_Equal ( p.NameSpace, "System" ) ) )
        {
            functionArg = ( int64 ) cfrTil->cs_Cpu2 ;
            //functionArg = cfrTil ;
            callHook = & cfrTil->SaveCpu2State ;
        }
        else if ( ( String_Equal ( p.ccp_Name, "restoreCpu2State" ) ) && ( String_Equal ( p.NameSpace, "System" ) ) )
        {
            functionArg = ( int64 ) cfrTil->cs_Cpu2 ;
            //functionArg = cfrTil ;
            callHook = & cfrTil->RestoreCpu2State ;
        }
        else if ( ( String_Equal ( p.ccp_Name, "restoreSelectedCpuState" ) ) && ( String_Equal ( p.NameSpace, "System" ) ) )
        {
            functionArg = ( int64 ) cfrTil->cs_Cpu ;
            callHook = & cfrTil->RestoreSelectedCpuState ;
        }
        else if ( ( String_Equal ( p.ccp_Name, "saveSelectedCpuState" ) ) && ( String_Equal ( p.NameSpace, "System" ) ) )
        {
            functionArg = ( int64 ) cfrTil->cs_Cpu ;
            callHook = & cfrTil->SaveSelectedCpuState ;
        }
        else if ( ( String_Equal ( p.ccp_Name, "callCurrentBlock" ) ) && ( String_Equal ( p.NameSpace, "System" ) ) )
        {
            callHook = & cfrTil->CallCurrentBlock ;
        }
#if 0        
        else if ( ( String_Equal ( p.ccp_Name, "set_DspReg_FromDataStackPointer" ) ) && ( String_Equal ( p.NameSpace, "System" ) ) )
        {
            callHook = & cfrTil->Set_DspReg_FromDataStackPointer ;
        } 
        else if ( ( String_Equal ( p.ccp_Name, "set_DataStackPointer_FromDspReg" ) ) && ( String_Equal ( p.NameSpace, "System" ) ) )
        {
            callHook = & cfrTil->Set_DataStackPointer_FromDspReg ;
        } 
        else if ( ( String_Equal ( p.ccp_Name, "set_DataStackPointer_FromDspReg" ) ) && ( String_Equal ( p.NameSpace, "System" ) ) )
        {
            callHook = & cfrTil->_StackPtr_Push  ;
        } 
#endif        
        else
        {
            functionArg = - 1 ;
            callHook = 0 ;
        }
        _CfrTil_MachineCodePrimitive_NewAdd ( p.ccp_Name, p.ui64_CAttribute, callHook, p.Function, functionArg, p.NameSpace, p.SuperNamespace ) ;
    }
#if 0
    //{ "callCfrTilWord", CPRIMITIVE, 0, ( byte* ) Compile_Call_CfrTilWord, 0, "System", "Root" },
        else if ( ( String_Equal ( p.ccp_Name, "callCfrTilWord" ) ) && ( String_Equal ( p.NameSpace, "System" ) ) )
        {
            callHook = & cfrTil->CallCfrTilWord ;
        }
        else if ( ( String_Equal ( p.ccp_Name, "set_CfrTilRsp_FromReturnStackPointer" ) ) && ( String_Equal ( p.NameSpace, "System" ) ) )
        {
            callHook = & cfrTil->Set_CfrTilRspReg_FromReturnStackPointer ;
        } 
        else if ( ( String_Equal ( p.ccp_Name, "set_ReturnStackPointer_FromCfrTilRsp" ) ) && ( String_Equal ( p.NameSpace, "System" ) ) )
        {
            callHook = & cfrTil->Set_ReturnStackPointer_FromCfrTilRspReg ;
        } 
#endif    
    //_CfrTil_MachineCodePrimitive_NewAdd ( const char * name, uint64 cType, block * callHook, byte * function, int64 functionArg, const char *nameSpace, const char * superNamespace )
    _CfrTil_MachineCodePrimitive_NewAdd ( "callCfrTilWord", CPRIMITIVE, & cfrTil->CallCfrTilWord, ( byte* ) Compile_Call_CfrTilWord, -1, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "set_CfrTilRsp_FromReturnStackPointer", CPRIMITIVE, & cfrTil->Set_CfrTilRspReg_FromReturnStackPointer, ( byte* ) Compile_Set_CfrTilRspReg_FromReturnStackPointer, -1, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "set_ReturnStackPointer_FromCfrTilRsp", CPRIMITIVE, & cfrTil->Set_ReturnStackPointer_FromCfrTilRspReg, ( byte* ) Compile_Set_ReturnStackPointer_FromCfrTilRspReg, -1, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "set_DataStackPointer_FromDspReg", CPRIMITIVE, & cfrTil->Set_DataStackPointer_FromDspReg, ( byte* ) Compile_Set_DataStackPointer_FromDspReg, -1, "System", "Root" ) ;
    _CfrTil_MachineCodePrimitive_NewAdd ( "set_DspReg_FromDataStackPointer", CPRIMITIVE, & cfrTil->Set_DspReg_FromDataStackPointer, ( byte* ) Compile_Set_DspReg_FromDataStackPointer, -1, "System", "Root" ) ;
}


