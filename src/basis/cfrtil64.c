
#include "../include/cfrtil64.h"

void
CFT_Run ( CfrTil * cfrTil, int64 restartCondition )
{
    while ( 1 )
    {
        cfrTil = _CFT_New ( cfrTil ) ;
        if ( ! sigsetjmp ( cfrTil->JmpBuf0, 0 ) )
        {
            _CFT_ReStart ( cfrTil, restartCondition ) ;
            Ovt_RunInit ( _O_ ) ;
            CFT_InterpreterRun ( ) ;
        }
    }
}

void
CFT_RunInit ( )
{
    if ( _O_->Signal > QUIT ) CFT_DataStack_Init ( ) ;
    else if ( DataStack_Underflow ( ) || ( DataStack_Overflow ( ) ) ) CFT_PrintDataStack ( ) ;
}

void
_CFT_ReStart ( CfrTil * cfrTil, int64 restartCondition )
{
    CFT_RunInit ( ) ;
    switch ( restartCondition )
    {
        case 0:
        case INITIAL_START:
        case FULL_RESTART:
        case RESTART:
        case RESET_ALL: CFT_ResetAll_Init ( cfrTil ) ;
        case ABORT: Set_DataStackPointer_FromDspReg ( ) ;
        default:
        case QUIT:
        case STOP: ;
    }
}

void
_CFT_CpuState_CheckSave ( )
{
    if ( ! GetState ( _CFT_->cs_Cpu, CPU_SAVED ) )
    {
        _CFT_->SaveCpuState ( ) ;
        SetState ( _CFT_->cs_Cpu, CPU_SAVED, true ) ;
    }
}

void
CFT_CpuState_Show ( )
{
    _CpuState_Show ( _CFT_->cs_Cpu ) ;
}

void
CFT_CpuState_Current_Show ( )
{
    _CFT_->SaveCpu2State ( ) ;
    _CpuState_Show ( _CFT_->cs_Cpu2 ) ;
    _CFT_->RestoreCpu2State ( ) ;
}

void
CFT_CpuState_CheckShow ( )
{
    _CFT_CpuState_CheckSave ( ) ;
    CFT_CpuState_Show ( ) ;
}

void
CFT_Debugger_CheckSaveCpuStateShow ( )
{
    Debugger_CpuState_CheckSaveShow ( _Debugger_ ) ;
}

void
CFT_Debugger_UdisOneInsn ( )
{
    Debugger_UdisOneInstruction ( _Debugger_, _Debugger_->DebugAddress, ( byte* ) "\r\r", ( byte* ) "" ) ; // current insn
}

void
CFT_Debugger_State_CheckSaveShow ( )
{
    CFT_Debugger_CheckSaveCpuStateShow ( ) ;
    //if ( _O_->Verbosity > 3 ) Debugger_PrintReturnStackWindow () ;
}

void
CFT_Debugger_SaveCpuState ( )
{
    _Debugger_CpuState_CheckSave ( _Debugger_ ) ;
}

void
CFT_PrintReturnStackWindow ( )
{
    _PrintNStackWindow ( ( uint64* ) _CFT_->cs_Cpu->Rsp, (byte*) "CfrTil C ReturnStack (RSP)", (byte*) "RSP", 4 ) ;
}

void
_CFT_NamespacesInit ( CfrTil * cfrTil )
{
    Namespace * ns = DataObject_New (NAMESPACE, 0, ( byte* ) "Namespaces", 0, 0, 0, 0, 0, 0, 0, 0, - 1 ) ;
    ns->State |= USING ; // nb. _Namespace_SetState ( ns, USING ) ; // !! can't be used with "Namespaces"
    cfrTil->Namespaces = ns ;
    CFT_AddCPrimitives ( ) ;
}

void
_CFT_DataStack_Init ( CfrTil * cfrTil )
{
    _Stack_Init ( _CFT_->DataStack, _O_->DataStackSize ) ;
    _Dsp_ = _CFT_->DataStack->StackPointer ;
    cfrTil->SaveDsp = _Dsp_ ;
}

void
CFT_DataStack_Init ( )
{
    _CFT_DataStack_Init ( _CFT_ ) ;
    if ( _O_->Verbosity > 2 ) _Printf ( ( byte* ) "\nData Stack reset." ) ;
}

void
_CFT_Init ( CfrTil * cfrTil, Namespace * nss )
{
    uint64 allocType = CFRTIL ;
    _CFT_ = cfrTil ;
    // TODO : organize these buffers and their use 
    cfrTil->OriginalInputLineB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->InputLineB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->SourceCodeBuffer = _Buffer_NewPermanent ( SOURCE_CODE_BUFFER_SIZE ) ;
    cfrTil->LC_PrintB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->LC_DefineB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->TokenB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->ScratchB1 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->ScratchB2 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->ScratchB3 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->StringB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->DebugB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->DebugB1 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->DebugB2 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->DebugB3 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->StringInsertB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->StringInsertB2 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->StringInsertB3 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->StringInsertB4 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->StringInsertB5 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->TabCompletionBuf = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->StringMacroB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->StrCatBuffer = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->OriginalInputLine = Buffer_Data ( cfrTil->OriginalInputLineB ) ;
    cfrTil->SC_Buffer = Buffer_Data ( cfrTil->SourceCodeBuffer ) ;
    cfrTil->TokenBuffer = Buffer_Data ( cfrTil->TokenB ) ;
    SetState ( cfrTil, CFRTIL_RUN | OPTIMIZE_ON | INLINE_ON, true ) ;

    if ( _O_->Verbosity > 2 ) _Printf ( ( byte* ) "\nSystem Memory is being reallocated.  " ) ;

    cfrTil->ContextDataStack = Stack_New ( 256, allocType ) ;
    //cfrTil->ObjectStack = Stack_New ( 1 * K, allocType ) ;
    cfrTil->TypeWordStack = Stack_New ( 1 * K, allocType ) ;
    //cfrTil->TokenList = _dllist_New ( allocType ) ;
    cfrTil->Compiler_N_M_Node_WordList = _dllist_New ( allocType ) ;

    _Context_ = cfrTil->Context0 = _Context_New ( cfrTil ) ;

    cfrTil->Debugger0 = _Debugger_New ( allocType ) ; 
    cfrTil->cs_Cpu = CpuState_New ( allocType ) ;
    cfrTil->cs_Cpu2 = CpuState_New ( allocType ) ;
    cfrTil->PeekPokeByteArray = ByteArray_AllocateNew ( 32, allocType ) ;
    if ( nss )
    {
        cfrTil->Namespaces = nss ;
    }
    else
    {
        _CFT_NamespacesInit ( cfrTil ) ;
    }
    if ( cfrTil->SaveDsp && cfrTil->DataStack ) // with _O_->RestartCondition = STOP from Debugger_Stop
    {
        _Dsp_ = cfrTil->SaveDsp ;
    }
    else
    {
        cfrTil->DataStack = Stack_New ( _O_->DataStackSize, CFRTIL ) ;
        _Dsp_ = cfrTil->DataStack->StackPointer ;
        cfrTil->SaveDsp = _Dsp_ ;
    }
    CFT_MachineCodePrimitive_AddWords ( cfrTil ) ; // in any case we need to reinit these for eg. debugger->SaveCpuState (), etc.
    cfrTil->StoreWord = Finder_FindWord_AnyNamespace ( _Finder_, ( byte* ) "store" ) ;
    cfrTil->PokeWord = Finder_FindWord_InOneNamespace ( _Finder_, (byte*) "Compiler", (byte*) "=" ) ; //Finder_FindWord_AnyNamespace ( _Finder_, ( byte* ) "=" ) ;
    cfrTil->RightBracket = Finder_FindWord_AnyNamespace ( _Finder_, ( byte* ) "]" ) ;
    cfrTil->InfixNamespace = Namespace_Find ( (byte*) "Infix" ) ;
    cfrTil->StringNamespace = Namespace_Find ( (byte*) "String" ) ;
    cfrTil->BigNumNamespace = Namespace_Find ( (byte*) "BigNum" ) ;
    cfrTil->IntegerNamespace = Namespace_Find ( (byte*) "Integer" ) ;
    //cfrTil->RawStringNamespace = Namespace_Find ( (byte*) "RawString" ) ;
    //cfrTil->CharNamespace = Namespace_Find ( (byte*) "Char" ) ;
    //cfrTil->FloatNamespace = Namespace_Find ( (byte*) "Float" ) ;
    CFT_ReadTables_Setup ( cfrTil ) ;
    CFT_LexerTables_Setup ( cfrTil ) ;
    cfrTil->LC = 0 ;
    cfrTil->SC_QuoteMode = 0 ;
    cfrTil->EndBlockWord = Finder_FindWord_InOneNamespace ( _Finder_, (byte*) "Reserved", (byte*) "}" ) ;
    cfrTil->BeginBlockWord = Finder_FindWord_InOneNamespace ( _Finder_, (byte*) "Reserved", (byte*) "{" ) ;
    SetState ( cfrTil, SOURCE_CODE_ON, true ) ;
}

void
CFT_ResetMemory ( CfrTil * cfrTil )
{
#if 0    
    if ( cfrTil->ContextDataStack )
    {
        while ( Stack_Depth ( cfrTil->ContextDataStack ) )
        {
            Context * cntx = ( Context* ) _Stack_Pop ( cfrTil->ContextDataStack ) ;
            Context_Recycle ( cntx ) ;
        }
        //if ( cfrTil->Context0 ) NamedByteArray_Delete ( cfrTil->Context0->ContextNba ) ;
    }
#else
    if ( cfrTil->ContextDataStack )
    {
        while ( Stack_Depth ( cfrTil->ContextDataStack ) )
        {
            Context * cntx = ( Context* ) _Stack_Pop ( cfrTil->ContextDataStack ) ;
            NamedByteArray_Delete ( cntx->ContextNba, 0 ) ;
        }
        if ( cfrTil->Context0 ) NamedByteArray_Delete ( cfrTil->Context0->ContextNba, 0 ) ;
    }
#endif    
    //OVT_MemListFree_ContextMemory ( ) ;
    OVT_MemListFree_Session ( ) ;
    OVT_MemListFree_ContextMemory ( ) ;
    OVT_MemListFree_LispTemp ( ) ;
    OVT_MemListFree_TempObjects ( ) ;
    OVT_MemListFree_Buffers ( ) ;
    OVT_MemListFree_CompilerTempObjects ( ) ;
    _OVT_MemListFree_CfrTilInternal ( ) ;
    if ( _O_->Verbosity > 1 ) OVT_ShowMemoryAllocated ( ) ;
}

CfrTil *
_CFT_New ( CfrTil * cfrTil )
{
    // nb. not all of this logic has really been needed or used or tested; it should be reworked according to need
    Namespace * nss = 0 ;
    if ( cfrTil )
    {
        if ( _O_->RestartCondition < RESET_ALL )
        {
            nss = cfrTil->Namespaces ; // in this case (see also below) only preserve Namespaces, all else is recycled and reinitialized
            if ( cfrTil->LogFILE )
            {
                CFT_LogOff ( ) ;
            }
        }
        CFT_ResetMemory ( cfrTil ) ;
    }
    else nss = 0 ;
    _Context_ = 0 ;
    cfrTil = ( CfrTil* ) Mem_Allocate ( sizeof ( CfrTil ), OPENVMTIL ) ;
    _CFT_Init ( cfrTil, nss ) ;
    Linux_SetupSignals ( &cfrTil->JmpBuf0, 1 ) ;
    return cfrTil ;
}

void
CFT_OptimizeOn ( )
{
    SetState ( _CFT_, OPTIMIZE_ON, true ) ;
}

void
_CFT_OptimizeOff ( )
{
    SetState ( _CFT_, OPTIMIZE_ON, false ) ;
}

void
CFT_OptimizeOff ( )
{
    _CFT_OptimizeOff ( ) ;
    //_Printf ( (byte*) "\nCurrently optimize cannot be turned off else c syntax will not compile correctly in some cases, other problems may be there also." ) ;
    //Pause () ;
}

void
CFT_StringMacrosOn ( )
{
    SetState ( _CFT_, STRING_MACROS_ON, true ) ;
    _CFT_StringMacros_Init ( ) ;
}

void
CFT_StringMacrosOff ( )
{
    SetState ( _CFT_, STRING_MACROS_ON, false ) ;
    SetState ( &_CFT_->Sti, STI_INITIALIZED, false ) ;
}

void
CFT_InlineOn ( )
{
    SetState ( _CFT_, INLINE_ON, true ) ;
}

void
CFT_InlineOff ( )
{
    SetState ( _CFT_, INLINE_ON, false ) ;
}

