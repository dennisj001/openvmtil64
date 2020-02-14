
#include "../include/csl.h"

void
CSL_Run ( CSL * csl, int64 restartCondition )
{
    while ( 1 )
    {
        csl = _CSL_New ( csl ) ;
        if ( ! sigsetjmp ( csl->JmpBuf0, 0 ) )
        {
            _CSL_ReStart ( csl, restartCondition ) ;
            Ovt_RunInit ( _O_ ) ;
            CSL_InterpreterRun ( ) ;
        }
    }
}

void
CSL_RunInit ( )
{
    if ( _O_->Signal > QUIT ) CSL_DataStack_Init ( ) ;
    else if ( DataStack_Underflow ( ) || ( DataStack_Overflow ( ) ) ) CSL_PrintDataStack ( ) ;
}

void
_CSL_ReStart ( CSL * csl, int64 restartCondition )
{
    CSL_RunInit ( ) ;
    switch ( restartCondition )
    {
        case 0:
        case INITIAL_START:
        case FULL_RESTART:
        case RESTART:
        case RESET_ALL: CSL_ResetAll_Init ( csl ) ;
        case ABORT: Set_DataStackPointer_FromDspReg ( ) ;
        default:
        case QUIT:
        case STOP: ;
    }
}

void
_CSL_CpuState_CheckSave ( )
{
    if ( ! GetState ( _CSL_->cs_Cpu, CPU_SAVED ) )
    {
        _CSL_->SaveCpuState ( ) ;
        SetState ( _CSL_->cs_Cpu, CPU_SAVED, true ) ;
    }
}

void
CSL_CpuState_Show ( )
{
    _CpuState_Show ( _CSL_->cs_Cpu ) ;
}

void
CSL_CpuState_Current_Show ( )
{
    _CSL_->SaveCpu2State ( ) ;
    _CpuState_Show ( _CSL_->cs_Cpu2 ) ;
    _CSL_->RestoreCpu2State ( ) ;
}

void
CSL_CpuState_CheckShow ( )
{
    _CSL_CpuState_CheckSave ( ) ;
    CSL_CpuState_Show ( ) ;
}

void
CSL_Debugger_CheckSaveCpuStateShow ( )
{
    Debugger_CpuState_CheckSaveShow ( _Debugger_ ) ;
}

void
CSL_Debugger_UdisOneInsn ( )
{
    Debugger_UdisOneInstruction ( _Debugger_, _Debugger_->DebugAddress, ( byte* ) "\r\r", ( byte* ) "" ) ; // current insn
}

void
CSL_Debugger_State_CheckSaveShow ( )
{
    CSL_Debugger_CheckSaveCpuStateShow ( ) ;
    //if ( _O_->Verbosity > 3 ) Debugger_PrintReturnStackWindow () ;
}

void
CSL_Debugger_SaveCpuState ( )
{
    _Debugger_CpuState_CheckSave ( _Debugger_ ) ;
}

void
CSL_PrintReturnStackWindow ( )
{
    _PrintNStackWindow ( ( uint64* ) _CSL_->cs_Cpu->Rsp, (byte*) "CSL C ReturnStack (RSP)", (byte*) "RSP", 4 ) ;
}

void
_CSL_NamespacesInit ( CSL * csl )
{
    Namespace * ns = DataObject_New (NAMESPACE, 0, ( byte* ) "Namespaces", 0, 0, 0, 0, 0, 0, 0, 0, - 1 ) ;
    ns->State |= USING ; // nb. _Namespace_SetState ( ns, USING ) ; // !! can't be used with "Namespaces"
    csl->Namespaces = ns ;
    CSL_AddCPrimitives ( ) ;
}

void
_CSL_DataStack_Init ( CSL * csl )
{
    _Stack_Init ( _CSL_->DataStack, _O_->DataStackSize ) ;
    _Dsp_ = _CSL_->DataStack->StackPointer ;
    csl->SaveDsp = _Dsp_ ;
}

void
CSL_DataStack_Init ( )
{
    _CSL_DataStack_Init ( _CSL_ ) ;
    if ( _O_->Verbosity > 2 ) _Printf ( ( byte* ) "\nData Stack reset." ) ;
}

void
_CSL_Init ( CSL * csl, Namespace * nss )
{
    uint64 allocType = T_CSL ;
    _CSL_ = csl ;
    // TODO : organize these buffers and their use 
    csl->OriginalInputLineB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->InputLineB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->SourceCodeBuffer = _Buffer_NewPermanent ( SOURCE_CODE_BUFFER_SIZE ) ;
    csl->LC_PrintB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->LC_DefineB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->TokenB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->ScratchB1 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->ScratchB2 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->ScratchB3 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->StringB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->DebugB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->DebugB1 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->DebugB2 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->DebugB3 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->StringInsertB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->StringInsertB2 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->StringInsertB3 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->StringInsertB4 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->StringInsertB5 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->TabCompletionBuf = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->StringMacroB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->StrCatBuffer = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    csl->OriginalInputLine = Buffer_Data ( csl->OriginalInputLineB ) ;
    csl->SC_Buffer = Buffer_Data ( csl->SourceCodeBuffer ) ;
    csl->TokenBuffer = Buffer_Data ( csl->TokenB ) ;
    SetState ( csl, CSL_RUN | OPTIMIZE_ON | INLINE_ON, true ) ;

    if ( _O_->Verbosity > 2 ) _Printf ( ( byte* ) "\nSystem Memory is being reallocated.  " ) ;

    csl->ContextDataStack = Stack_New ( 256, allocType ) ;
    //csl->ObjectStack = Stack_New ( 1 * K, allocType ) ;
    csl->TypeWordStack = Stack_New ( 1 * K, allocType ) ;
    //csl->TokenList = _dllist_New ( allocType ) ;
    csl->Compiler_N_M_Node_WordList = _dllist_New ( allocType ) ;

    _Context_ = csl->Context0 = _Context_New ( csl ) ;

    csl->Debugger0 = _Debugger_New ( allocType ) ; 
    csl->cs_Cpu = CpuState_New ( allocType ) ;
    csl->cs_Cpu2 = CpuState_New ( allocType ) ;
    csl->PeekPokeByteArray = ByteArray_AllocateNew ( 32, allocType ) ;
    if ( nss )
    {
        csl->Namespaces = nss ;
    }
    else
    {
        _CSL_NamespacesInit ( csl ) ;
    }
    if ( csl->SaveDsp && csl->DataStack ) // with _O_->RestartCondition = STOP from Debugger_Stop
    {
        _Dsp_ = csl->SaveDsp ;
    }
    else
    {
        csl->DataStack = Stack_New ( _O_->DataStackSize, T_CSL ) ;
        _Dsp_ = csl->DataStack->StackPointer ;
        csl->SaveDsp = _Dsp_ ;
    }
    CSL_MachineCodePrimitive_AddWords ( csl ) ; // in any case we need to reinit these for eg. debugger->SaveCpuState (), etc.
    csl->StoreWord = Finder_FindWord_AnyNamespace ( _Finder_, ( byte* ) "store" ) ;
    csl->PokeWord = Finder_FindWord_InOneNamespace ( _Finder_, (byte*) "Compiler", (byte*) "=" ) ; //Finder_FindWord_AnyNamespace ( _Finder_, ( byte* ) "=" ) ;
    csl->RightBracket = Finder_FindWord_AnyNamespace ( _Finder_, ( byte* ) "]" ) ;
    csl->InfixNamespace = Namespace_Find ( (byte*) "Infix" ) ;
    csl->StringNamespace = Namespace_Find ( (byte*) "String" ) ;
    csl->BigNumNamespace = Namespace_Find ( (byte*) "BigNum" ) ;
    csl->IntegerNamespace = Namespace_Find ( (byte*) "Integer" ) ;
    //csl->RawStringNamespace = Namespace_Find ( (byte*) "RawString" ) ;
    //csl->CharNamespace = Namespace_Find ( (byte*) "Char" ) ;
    //csl->FloatNamespace = Namespace_Find ( (byte*) "Float" ) ;
    CSL_ReadTables_Setup ( csl ) ;
    CSL_LexerTables_Setup ( csl ) ;
    csl->LC = 0 ;
    csl->SC_QuoteMode = 0 ;
    csl->EndBlockWord = Finder_FindWord_InOneNamespace ( _Finder_, (byte*) "Reserved", (byte*) "}" ) ;
    csl->BeginBlockWord = Finder_FindWord_InOneNamespace ( _Finder_, (byte*) "Reserved", (byte*) "{" ) ;
    SetState ( csl, SOURCE_CODE_ON, true ) ;
}

void
CSL_ResetMemory ( CSL * csl )
{
#if 0    
    if ( csl->ContextDataStack )
    {
        while ( Stack_Depth ( csl->ContextDataStack ) )
        {
            Context * cntx = ( Context* ) _Stack_Pop ( csl->ContextDataStack ) ;
            Context_Recycle ( cntx ) ;
        }
        //if ( csl->Context0 ) NamedByteArray_Delete ( csl->Context0->ContextNba ) ;
    }
#else
    if ( csl->ContextDataStack )
    {
        while ( Stack_Depth ( csl->ContextDataStack ) )
        {
            Context * cntx = ( Context* ) _Stack_Pop ( csl->ContextDataStack ) ;
            NamedByteArray_Delete ( cntx->ContextNba, 0 ) ;
        }
        if ( csl->Context0 ) NamedByteArray_Delete ( csl->Context0->ContextNba, 0 ) ;
    }
#endif    
    //OVT_MemListFree_ContextMemory ( ) ;
    OVT_MemListFree_Session ( ) ;
    OVT_MemListFree_ContextMemory ( ) ;
    OVT_MemListFree_LispTemp ( ) ;
    OVT_MemListFree_TempObjects ( ) ;
    OVT_MemListFree_Buffers ( ) ;
    OVT_MemListFree_CompilerTempObjects ( ) ;
    _OVT_MemListFree_CSLInternal ( ) ;
    if ( _O_->Verbosity > 1 ) OVT_ShowMemoryAllocated ( ) ;
}

CSL *
_CSL_New ( CSL * csl )
{
    // nb. not all of this logic has really been needed or used or tested; it should be reworked according to need
    Namespace * nss = 0 ;
    if ( csl )
    {
        if ( _O_->RestartCondition < RESET_ALL )
        {
            nss = csl->Namespaces ; // in this case (see also below) only preserve Namespaces, all else is recycled and reinitialized
            if ( csl->LogFILE )
            {
                CSL_LogOff ( ) ;
            }
        }
        CSL_ResetMemory ( csl ) ;
    }
    else nss = 0 ;
    _Context_ = 0 ;
    csl = ( CSL* ) Mem_Allocate ( sizeof ( CSL ), OPENVMTIL ) ;
    _CSL_Init ( csl, nss ) ;
    Linux_SetupSignals ( &csl->JmpBuf0, 1 ) ;
    return csl ;
}

void
CSL_OptimizeOn ( )
{
    SetState ( _CSL_, OPTIMIZE_ON, true ) ;
}

void
_CSL_OptimizeOff ( )
{
    SetState ( _CSL_, OPTIMIZE_ON, false ) ;
}

void
CSL_OptimizeOff ( )
{
    _CSL_OptimizeOff ( ) ;
    //_Printf ( (byte*) "\nCurrently optimize cannot be turned off else c syntax will not compile correctly in some cases, other problems may be there also." ) ;
    //Pause () ;
}

void
CSL_StringMacrosOn ( )
{
    SetState ( _CSL_, STRING_MACROS_ON, true ) ;
    _CSL_StringMacros_Init ( ) ;
}

void
CSL_StringMacrosOff ( )
{
    SetState ( _CSL_, STRING_MACROS_ON, false ) ;
    SetState ( &_CSL_->Sti, STI_INITIALIZED, false ) ;
}

void
CSL_InlineOn ( )
{
    SetState ( _CSL_, INLINE_ON, true ) ;
}

void
CSL_InlineOff ( )
{
    SetState ( _CSL_, INLINE_ON, false ) ;
}

