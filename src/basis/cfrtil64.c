
#include "../include/cfrtil64.h"

void
_CfrTil_Run ( CfrTil * cfrTil, int64 restartCondition )
{
    while ( 1 )
    {
        cfrTil = _CfrTil_New ( cfrTil ) ;
        if ( ! sigsetjmp ( cfrTil->JmpBuf0, 0 ) )
        {
            System_RunInit ( _Context_->System0 ) ;
            _CfrTil_ReStart ( cfrTil, restartCondition ) ;
            // check if reset is ok ...
            if ( cfrTil && _Context_ && _Context_->System0 )
            {
                DebugOff ;
                Ovt_RunInit ( _Q_ ) ;
                CfrTil_InterpreterRun ( ) ;
                d0 ( _Pause ( "\n_CfrTil_Run : ??shouldn't reach here??" ) ; ) ; // shouldn't reach here
            }
        }
    }
}

void
_CfrTil_ReStart ( CfrTil * cfrTil, int64 restartCondition )
{
    switch ( restartCondition )
    {
        case 0:
        case INITIAL_START:
        case FULL_RESTART:
        case RESTART:
        case RESET_ALL:
        {
            CfrTil_ResetAll_Init ( cfrTil ) ;
        }
        case ABORT: Set_DataStackPointer_FromDspReg ( ) ;
        default:
        case QUIT:
        case STOP: ;
    }
}

void
CfrTil_RecycleWordList ( Word * scWord )
{
    scWord = scWord ? scWord : _CfrTil_->ScWord ;
    if ( scWord )
    {
        DLList_RecycleWordList ( scWord->W_SC_WordList ) ;
        List_Init ( scWord->W_SC_WordList ) ;
        _CfrTil_->ScWord = 0 ;
    }
    else
    {
        DLList_RecycleWordList ( _CfrTil_->CompilerWordList ) ;
        List_Init ( _CfrTil_->CompilerWordList ) ;
    }
}

void
CfrTil_WordList_Init ( CfrTil * cfrtil, Word * word, Boolean saveWord0 )
{
    Word * svWord ;
    if ( saveWord0 ) svWord = WordStack ( 0 ) ;
    else svWord = 0 ;
    if ( ( word ) && ( IsSourceCodeOn ) ) cfrtil->LastFinished_DObject = cfrtil->CurrentWordCompiling = cfrtil->ScWord = word ;
    else cfrtil->ScWord = Get_SourceCodeWord ( ) ;
    if ( cfrtil->ScWord ) cfrtil->ScWord->W_SC_WordList = cfrtil->CompilerWordList ;
    if ( svWord )
    {
        svWord->W_SC_Index = 0 ; // before pushWord !
        CfrTil_WordList_PushWord ( svWord ) ; // for source code
    }
}

void
_CfrTil_CpuState_CheckSave ( )
{
    if ( ! GetState ( _CfrTil_->cs_Cpu, CPU_SAVED ) )
    {
        _CfrTil_->SaveCpuState ( ) ;
        SetState ( _CfrTil_->cs_Cpu, CPU_SAVED, true ) ; 
    }
}

void
CfrTil_CpuState_Show ( )
{
    _CpuState_Show ( _CfrTil_->cs_Cpu ) ;
}

void
CfrTil_CpuState_Current_Show ( )
{
    _CfrTil_->SaveCpu2State ( ) ;
    _CpuState_Show ( _CfrTil_->cs_Cpu2 ) ;
    _CfrTil_->RestoreCpu2State ( ) ;
}

void
CfrTil_CpuState_CheckShow ( )
{
    _CfrTil_CpuState_CheckSave ( ) ;
    CfrTil_CpuState_Show ( ) ;
}

void
CfrTil_Debugger_CheckSaveCpuStateShow ( )
{
    Debugger_CpuState_CheckSaveShow ( _Debugger_ ) ;
}

void
CfrTil_Debugger_UdisOneInsn ( )
{
    Debugger_UdisOneInstruction ( _Debugger_, _Debugger_->DebugAddress, ( byte* ) "\r\r", ( byte* ) "" ) ; // current insn
}

void
CfrTil_Debugger_State_CheckSaveShow ( )
{
    CfrTil_Debugger_CheckSaveCpuStateShow ( ) ;
    //if ( _Q_->Verbosity > 3 ) Debugger_PrintReturnStackWindow () ;
}

void
CfrTil_Debugger_SaveCpuState ( )
{
    _Debugger_CpuState_CheckSave ( _Debugger_ ) ;
}

void
CfrTil_PrintReturnStackWindow ( )
{
    _PrintNStackWindow ( ( int64* ) _CfrTil_->cs_Cpu->Rsp, "CfrTil C ReturnStack (RSP)", "RSP", 4 ) ;
}

void
_CfrTil_NamespacesInit ( CfrTil * cfrTil )
{
    Namespace * ns = DataObject_New ( NAMESPACE, 0, ( byte* ) "Namespaces", 0, 0, 0, 0, 0, 0, 0, - 1 ) ;
    ns->State |= USING ; // nb. _Namespace_SetState ( ns, USING ) ; // !! can't be used with "Namespaces"
    cfrTil->Namespaces = ns ;
    CfrTil_AddCPrimitives ( ) ;
}

void
_CfrTil_DataStack_Init ( CfrTil * cfrTil )
{
    _Stack_Init ( _CfrTil_->DataStack, _Q_->DataStackSize ) ;
    //_Set_DspReg_FromDataStackPointer () ;
    cfrTil->SaveDsp = _Dsp_ ;
}

void
CfrTil_DataStack_Init ( )
{
    _CfrTil_DataStack_Init ( _CfrTil_ ) ;
    if ( _Q_->Verbosity > 2 ) _Printf ( ( byte* ) "\nData Stack reset." ) ;
}

void
_CfrTil_Init ( CfrTil * cfrTil, Namespace * nss )
{
    uint64 allocType = CFRTIL ;
    _CfrTil_ = cfrTil ;
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

    if ( _Q_->Verbosity > 2 ) _Printf ( ( byte* ) "\nSystem Memory is being reallocated.  " ) ;

    cfrTil->ContextDataStack = Stack_New ( 256, allocType ) ;
    cfrTil->ObjectStack = Stack_New ( 1 * K, allocType ) ;
    cfrTil->TokenList = _dllist_New ( allocType ) ;
    cfrTil->CompilerWordList = _dllist_New ( allocType ) ;

    _Context_ = cfrTil->Context0 = _Context_New ( cfrTil ) ;

    cfrTil->Debugger0 = _Debugger_New ( allocType ) ; // nb : must be after System_NamespacesInit
    cfrTil->cs_Cpu = CpuState_New ( allocType ) ;
    cfrTil->cs_Cpu2 = CpuState_New ( allocType ) ;
    cfrTil->PeekPokeByteArray = ByteArray_AllocateNew ( 32, allocType ) ;
    if ( nss )
    {
        cfrTil->Namespaces = nss ;
    }
    else
    {
        _CfrTil_NamespacesInit ( cfrTil ) ;
    }
    if ( cfrTil->SaveDsp && cfrTil->DataStack ) // with _Q_->RestartCondition = STOP from Debugger_Stop
    {
        _Dsp_ = cfrTil->SaveDsp ;
    }
    else
    {
        cfrTil->DataStack = Stack_New ( _Q_->DataStackSize, CFRTIL ) ;
        _Dsp_ = cfrTil->DataStack->StackPointer ;
        cfrTil->SaveDsp = _Dsp_ ;
    }
    CfrTil_MachineCodePrimitive_AddWords ( cfrTil ) ; // in any case we need to reinit these for eg. debugger->SaveCpuState (), etc.
    cfrTil->StoreWord = Finder_FindWord_AnyNamespace ( _Finder_, ( byte* ) "store" ) ;
    cfrTil->PokeWord = Finder_FindWord_AnyNamespace ( _Finder_, ( byte* ) "poke" ) ;
    cfrTil->LispNamespace = Namespace_Find ( ( byte* ) "Lisp" ) ;
    cfrTil->InfixNamespace = Namespace_Find ( "Infix" ) ;
    CfrTil_ReadTables_Setup ( cfrTil ) ;
    CfrTil_LexerTables_Setup ( cfrTil ) ;
    cfrTil->LC = 0 ;
    cfrTil->SC_QuoteMode = 0 ;
    cfrTil->EndBlockWord = Finder_FindWord_InOneNamespace ( _Finder_, "Reserved", "}" ) ;
    cfrTil->BeginBlockWord = Finder_FindWord_InOneNamespace ( _Finder_, "Reserved", "{" ) ;
    SetState ( cfrTil, SOURCE_CODE_ON, true ) ;
}

void
CfrTil_ResetMemory ( CfrTil * cfrTil )
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
            NamedByteArray_Delete ( cntx->ContextNba ) ;
        }
        if ( cfrTil->Context0 ) NamedByteArray_Delete ( cfrTil->Context0->ContextNba ) ;
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
    if ( _Q_->Verbosity > 1 ) OVT_ShowMemoryAllocated ( ) ;
}

CfrTil *
_CfrTil_New ( CfrTil * cfrTil )
{
    // nb. not all of this logic has really been needed or used or tested; it should be reworked according to need
    Namespace * nss = 0 ;
    if ( cfrTil )
    {
        if ( _Q_->RestartCondition < RESET_ALL )
        {
            nss = cfrTil->Namespaces ; // in this case (see also below) only preserve Namespaces, all else is recycled and reinitialized
            if ( cfrTil->LogFILE )
            {
                CfrTil_LogOff ( ) ;
            }
        }
        CfrTil_ResetMemory ( cfrTil ) ;
    }
    else
    {
        nss = 0 ;
    }
    _Context_ = 0 ;
    cfrTil = ( CfrTil* ) Mem_Allocate ( sizeof ( CfrTil ), OPENVMTIL ) ;
    _CfrTil_Init ( cfrTil, nss ) ;
    Linux_SetupSignals ( &cfrTil->JmpBuf0, 1 ) ;
    return cfrTil ;
}

void
CfrTil_OptimizeOn ( )
{
    SetState ( _CfrTil_, OPTIMIZE_ON, true ) ;
}

void
CfrTil_OptimizeOff ( )
{
    SetState ( _CfrTil_, OPTIMIZE_ON, false ) ;
}

void
CfrTil_StringMacrosOn ( )
{
    SetState ( _CfrTil_, STRING_MACROS_ON, true ) ;
    _CfrTil_StringMacros_Init ( ) ;
}

void
CfrTil_StringMacrosOff ( )
{
    SetState ( _CfrTil_, STRING_MACROS_ON, false ) ;
    SetState ( &_CfrTil_->Sti, STI_INITIALIZED, false ) ;
}

void
CfrTil_InlineOn ( )
{
    SetState ( _CfrTil_, INLINE_ON, true ) ;
}

void
CfrTil_InlineOff ( )
{
    SetState ( _CfrTil_, INLINE_ON, false ) ;
}

#if 0
void
_CfrTil_DebugOff ( )
{
    DebugOff ;
}

void
_CfrTil_DebugOn ( )
{
    DebugOn ;
}
#endif
