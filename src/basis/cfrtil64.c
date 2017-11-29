
#include "../include/cfrtil64.h"
//uint64 *_Dsp_, * _Rsp_ ;

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
                //CfrTil_C_Syntax_Off ( ) ;
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
        case ABORT: Set_DataStackPointer_FromDspReg () ;
        default:
        case QUIT:
        case STOP: ;
    }
}

void
_CfrTil_CpuState_CheckSave ( )
{
    if ( ! GetState ( _CfrTil_->cs_Cpu, CPU_SAVED) )
    {
        _CfrTil_->SaveCpuState ( ) ;
        SetState ( _CfrTil_->cs_Cpu, CPU_SAVED, true ) ; //->State = 1 ;
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
    _CfrTil_->SaveCpu2State () ;
    _CpuState_Show ( _CfrTil_->cs_Cpu2 ) ;
    _CfrTil_->RestoreCpu2State () ;
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
    Namespace * ns = _DataObject_New (NAMESPACE, 0, ( byte* ) "Namespaces", 0, 0, 0, 0, 0, 0 ) ;
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
    cfrTil->SourceCodeSPB = _Buffer_NewPermanent ( SOURCE_CODE_BUFFER_SIZE ) ;
    cfrTil->LC_PrintB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->LC_DefineB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->TokenB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    //cfrTil->PrintfB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->ScratchB1 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->ScratchB2 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->ScratchB3 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->StringB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->DebugB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->DebugB1 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->DebugB2 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->StringInsertB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->StringInsertB2 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->StringInsertB3 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->StringInsertB4 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->StringInsertB5 = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->TabCompletionBuf = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->StringMacroB = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->StrCatBuffer = _Buffer_NewPermanent ( BUFFER_SIZE ) ;
    cfrTil->OriginalInputLine = Buffer_Data ( cfrTil->OriginalInputLineB ) ;
    cfrTil->SC_ScratchPad = Buffer_Data ( cfrTil->SourceCodeSPB ) ;
    cfrTil->LispPrintBuffer = Buffer_Data ( cfrTil->LC_PrintB ) ;
    //cfrTil->LispDefineBuffer = Buffer_Data ( cfrTil->LC_DefineB ) ;
    cfrTil->TokenBuffer = Buffer_Data ( cfrTil->TokenB ) ;
    SetState ( cfrTil, CFRTIL_RUN | OPTIMIZE_ON | INLINE_ON, true ) ;

    if ( _Q_->Verbosity > 2 ) _Printf ( ( byte* ) "\nSystem Memory is being reallocated.  " ) ;

    cfrTil->ContextDataStack = Stack_New ( 256, allocType ) ;
    cfrTil->ObjectStack = Stack_New ( 1 * K, allocType ) ;
    //cfrTil->DebugStateStack = Stack_New ( 1 * K, allocType ) ;
    //_Stack_Push ( cfrTil->DebugStateStack, 0 ) ;
    cfrTil->TokenList = _dllist_New ( allocType ) ;
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
    cfrTil->ReturnStack = Stack_New ( 1 * K, CFRTIL ) ;
    _Rsp_ = cfrTil->ReturnStack->StackPointer ;
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
    _CfrTil_SyncStackPointers_ToRegs ( cfrTil ) ;
    cfrTil->StoreWord = Finder_FindWord_AnyNamespace ( _Finder_, ( byte* ) "store" ) ;
    cfrTil->PokeWord = Finder_FindWord_AnyNamespace ( _Finder_, ( byte* ) "poke" ) ;
    cfrTil->LispNamespace = Namespace_Find ( ( byte* ) "Lisp" ) ;
    CfrTil_ReadTables_Setup ( cfrTil ) ;
    CfrTil_LexerTables_Setup ( cfrTil ) ;
    cfrTil->LC = 0 ;
    cfrTil->SC_QuoteMode = 0 ;
    //cfrTil->CfrTilWordCreateTemp = Namespace_FindOrNew_SetUsing ( "CfrTilWordCreateTemp", cfrTil->Namespaces, 1 ) ;
    //_Namespace_SetState ( cfrTil->CfrTilWordCreateTemp, NOT_USING ) ;
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
    _OVT_MemListFree_CfrTilInternal ( ) ;
    OVT_MemListFree_Session ( ) ;
    OVT_MemListFree_ContextMemory ( ) ;
    OVT_MemListFree_LispTemp ( ) ;
    OVT_MemListFree_TempObjects ( ) ;
    OVT_MemListFree_Buffers ( ) ;
    OVT_MemListFree_CompilerTempObjects ( ) ;
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


//----------------------------------------------------------------------------------------|
//              get from/ add to head  |              | get from head      add to tail    |      
// TokenList Tail <--> TokenList Head  |<interpreter> | PeekList Head <--> PeekList Tail  |
// token token token token token token | currentToken | token token token token token ... |
//----------------------------------------------------------------------------------------|

byte *
_CfrTil_GetTokenFromTokenList ( Lexer * lexer )
{
    Symbol * tknSym ;
    if ( tknSym = ( Symbol* ) _dllist_First ( ( dllist* ) _CfrTil_->TokenList ) )
    {
        dlnode_Remove ( ( dlnode* ) tknSym ) ;
        lexer->TokenStart_ReadLineIndex = tknSym->S_Value ;
        lexer->TokenEnd_ReadLineIndex = tknSym->S_Value2 ;

        return tknSym->S_Name ;
    }
    return 0 ;
}

void
_CfrTil_AddTokenToTailOfTokenList ( byte * token )
{

    Symbol * tknSym = _Symbol_New ( token, TEMPORARY ) ;
    tknSym->S_Value = _Context_->Lexer0->TokenStart_ReadLineIndex ;
    tknSym->S_Value2 = _Context_->Lexer0->TokenEnd_ReadLineIndex ;
    dllist_AddNodeToTail ( _CfrTil_->TokenList, ( dlnode* ) tknSym ) ;
}

void
_CfrTil_AddTokenToHeadOfTokenList ( byte * token )
{

    Symbol * tknSym = _Symbol_New ( token, TEMPORARY ) ;
    tknSym->S_Value = _Context_->Lexer0->TokenStart_ReadLineIndex ;
    tknSym->S_Value2 = _Context_->Lexer0->TokenEnd_ReadLineIndex ;
    dllist_AddNodeToHead ( _CfrTil_->TokenList, ( dlnode* ) tknSym ) ;
}

void
CfrTil_ClearTokenList ( )
{
    _dllist_Init ( _CfrTil_->TokenList ) ;
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

#if 0

void
CfrTil_Compile_SaveIncomingCpuState ( CfrTil * cfrtil )
{
    // save the incoming current C cpu state

    Compile_Call ( ( byte* ) cfrtil->SaveCpuState ) ; // save incoming current C cpu state
    _Compile_MoveReg_ToMem ( RBP, ( byte * ) & cfrtil->cs_CpuState->Ebp, THRU_REG, CELL ) ; // EBX : scratch reg
    _Compile_MoveReg_ToMem ( RSP, ( byte * ) & cfrtil->cs_CpuState->Rsp, THRU_REG, CELL ) ;

}

void
CfrTil_Compile_RestoreIncomingCpuState ( CfrTil * cfrtil )
{
    // restore the incoming current C cpu state
    Compile_Call ( ( byte* ) _CfrTil_->RestoreCpuState ) ;
    _Compile_MoveMem_To_Reg ( RBP, ( byte * ) & cfrtil->cs_CpuState->Ebp, THRU_REG, CELL ) ;
    _Compile_MoveMem_To_Reg ( RSP, ( byte * ) & cfrtil->cs_CpuState->Rsp, THRU_REG, CELL ) ;
}
#endif
