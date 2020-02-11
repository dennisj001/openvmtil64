
#include "../../include/cfrtil64.h"
// words need to be copied because a word may be used more than once in compiling a new word, 
// each needs to have their own coding, wordIndex, etc.
// this information is used by the compiler, optimizer and the debugger

Word *
_CopyDuplicateWord ( Word * word0, Boolean complete )
{
    Word * wordc ;
    wordc = Word_Copy ( word0, DICTIONARY ) ; // use DICTIONARY since we are recycling these anyway
    _dlnode_Init ( ( dlnode * ) wordc ) ; // necessary!
    wordc->W_ObjectAttributes |= ( uint64 ) RECYCLABLE_COPY ;
    if ( complete )
    {
        wordc->WL_OriginalWord = Word_GetOriginalWord ( word0 ) ;
        Word_SetLocation ( wordc ) ;
    }
    return wordc ;
}

Word *
CopyDuplicateWord ( dlnode * anode, Word * word0 )
{
    Word *cpdword = 0, * wordn = ( Word* ) dobject_Get_M_Slot ( ( dobject* ) anode, SCN_T_WORD ) ;
    int64 iuoFlag = dobject_Get_M_Slot ( ( dobject* ) anode, SCN_IN_USE_FLAG ) ;
    if ( iuoFlag && ( word0 == wordn ) ) cpdword = _CopyDuplicateWord ( word0, 1 ) ;
    //else if ( word0 == wordn ) cpdword = _CopyDuplicateWord ( word0, 1 ) ;
    return cpdword ;
}

Word *
_CfrTil_CopyDuplicates ( Word * word0 )
{
    Word * word1, *wordToBePushed ;
    if ( word0->W_MorphismAttributes & ( KEYWORD | CFRTIL_WORD | T_LISP_SYMBOL ) ) word1 = _CopyDuplicateWord ( word0, 1 ) ;
    else word1 = ( Word * ) dllist_Map1_WReturn ( _CfrTil_->Compiler_N_M_Node_WordList, ( MapFunction1 ) CopyDuplicateWord, ( int64 ) word0 ) ;
    if ( word1 ) wordToBePushed = word1 ;
    else wordToBePushed = word0 ;
    return wordToBePushed ;
}

Word *
Compiler_CopyDuplicatesAndPush ( Word * word0, int64 tsrli, int64 scwi )
{
    Word *wordp = 0 ;
    if ( word0 )
    {
        if ( ( word0->W_MorphismAttributes & ( DEBUG_WORD | INTERPRET_DBG ) ) || ( word0->W_TypeAttributes & ( W_COMMENT | W_PREPROCESSOR ) ) ) return word0 ;
        if ( GetState ( _Compiler_, ( COMPILE_MODE | ASM_MODE ) ) ) // don't we want to copy in non-compile mode too ??
        {
            wordp = _CfrTil_CopyDuplicates ( word0 ) ;
        }
        else wordp = word0 ;
        Lexer_Set_ScIndex_RlIndex ( _Lexer_, wordp, tsrli, scwi ) ;
        CfrTil_WordList_PushWord ( wordp ) ;
    }
    return wordp ;
}

void
Compiler_IncrementCurrentAccumulatedOffset ( Compiler * compiler, int64 increment )
{
    if ( compiler->AccumulatedOffsetPointer ) ( *( int64* ) ( compiler->AccumulatedOffsetPointer ) ) += ( increment ) ;
    if ( compiler->AccumulatedOptimizeOffsetPointer ) ( *( int64* ) ( compiler->AccumulatedOptimizeOffsetPointer ) ) += ( increment ) ;
    _Debugger_->PreHere = ( ( byte* ) compiler->AccumulatedOffsetPointer ) - 3 ; // 3 : sizeof add immediate insn with rex
}

void
Compiler_SetCurrentAccumulatedOffsetValue ( Compiler * compiler, int64 value )
{
    if ( compiler->AccumulatedOffsetPointer ) ( *( int64* ) ( compiler->AccumulatedOffsetPointer ) ) = ( value ) ;
    if ( compiler->AccumulatedOptimizeOffsetPointer ) ( *( int64* ) ( compiler->AccumulatedOptimizeOffsetPointer ) ) = ( value ) ;
}

NamedByteArray *
_Compiler_SetCompilingSpace ( byte * name )
{
    NamedByteArray *nba = _OVT_Find_NBA ( name ) ;
    if ( nba ) Set_CompilerSpace ( nba->ba_CurrentByteArray ) ;
    return nba ;
}

byte *
_Compiler_GetCodeSpaceHere ( )
{
    NamedByteArray *nba = _OVT_Find_NBA ( ( byte* ) "CodeSpace" ) ;
    byte * here = _ByteArray_Here ( nba->ba_CurrentByteArray ) ;
    return here ;
}

void
Compiler_SetCompilingSpace ( byte * name )
{
    _Compiler_SetCompilingSpace ( name ) ;
}

void
_Compiler_SetCompilingSpace_MakeSureOfRoom ( byte * name, int64 room )
{
    NamedByteArray * nba = _Compiler_SetCompilingSpace ( name ) ; // same problem as namespace ; this can be called in the middle of compiling another word 
    ByteArray * ba = _ByteArray_AppendSpace_MakeSure ( nba->ba_CurrentByteArray, room ) ;
    if ( ! ba ) Error_Abort ( "\n_Compiler_SetCompilingSpace_MakeSureOfRoom", "no ba?!\n" ) ;
}

void
Compiler_SetCompilingSpace_MakeSureOfRoom ( byte * name )
{
    _Compiler_SetCompilingSpace_MakeSureOfRoom ( name, 4 * K ) ;
}

Word *
Compiler_PreviousNonDebugWord ( int64 startIndex )
{
    Word * word ;
    int64 i ;
    for ( i = startIndex ; ( word = ( Word* ) CfrTil_WordList ( i ) ) && i > - 3 ; i -- )
    {
        if ( ( Symbol* ) word && ( ! ( word->W_MorphismAttributes & DEBUG_WORD ) ) ) break ;
    }
    return word ;
}

void
GotoInfo_Print ( dlnode * node )
{
    GotoInfo * gi = ( GotoInfo * ) node ;
    _Printf ( ( byte* ) "\nLabelName = %s : Type = %3d : CompileAtAddress = 0x%016lx : LabeledAddress = 0x%016lx : JmpOffsetPointer = : 0x%016lx",
        gi->pb_LabelName, gi->GI_CAttribute, gi->CompileAtAddress, gi->LabeledAddress, gi->pb_JmpOffsetPointer ) ;
}

void
Compiler_GotoList_Print ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    _Printf ( ( byte* ) "\nTypes : GI_BREAK = 1 : GI_RETURN = 2 : GI_CONTINUE = 4 : GI_GOTO = 8 : GI_RECURSE = 16 : GI_LABEL = 64 : GI_GOTO_LABEL = 128" ) ;
    dllist_Map ( compiler->GotoList, ( MapFunction0 ) GotoInfo_Print ) ;
}

Word *
_CfrTil_WordList ( int64 n )
{
    return ( Word * ) _dllist_Get_N_InUse_Node_M_Slot ( _CfrTil_->Compiler_N_M_Node_WordList, n, SCN_T_WORD ) ;
}

Word *
CfrTil_WordList ( int64 n )
{
    return ( Word * ) _CfrTil_WordList ( n ) ;
}

void
_CompileOptimizeInfo_Init ( CompileOptimizeInfo * optInfo )
{
    memset ( ( byte* ) & optInfo->State, 0, sizeof ( CompileOptimizeInfo ) - sizeof ( DLNode ) ) ;
}

void
CompileOptimizeInfo_Init ( CompileOptimizeInfo * optInfo, uint64 state )
{
    _CompileOptimizeInfo_Init ( optInfo ) ;
    dlnode * node ;
    int64 i ;
    // we don't really use optInfo->COIW much 
    for ( i = 0, node = dllist_First ( ( dllist* ) _CfrTil_->Compiler_N_M_Node_WordList ) ; node ; node = dlnode_Next ( node ) ) // nb. this is a little subtle
    {
        if ( dobject_Get_M_Slot ( ( dobject* ) node, SCN_IN_USE_FLAG ) )
        {
            if ( i < 8 ) optInfo->COIW [ i ++ ] = ( Word * ) dobject_Get_M_Slot ( ( dobject* ) node, SCN_T_WORD ) ;
            else break ;
        }
    }
    optInfo->State = state ;
}

CompileOptimizeInfo *
_CompileOptimizeInfo_New ( uint64 type )
{
    CompileOptimizeInfo * optInfo = ( CompileOptimizeInfo * ) Mem_Allocate ( sizeof (CompileOptimizeInfo ), type ) ;
    optInfo->InUseFlag = N_LOCKED ;
    return optInfo ;
}

CompileOptimizeInfo *
CompileOptimizeInfo_New ( uint64 type )
{
    CompileOptimizeInfo * optInfo = optInfo = _CompileOptimizeInfo_New ( type ) ;
    return optInfo ;
}

CompileOptimizeInfo *
Compiler_CompileOptimizeInfo_PushNew ( Compiler * compiler )
{
    CompileOptimizeInfo * coi = CompileOptimizeInfo_New ( COMPILER_TEMP ) ;
    if ( coi )
    {
        List_Push ( compiler->OptimizeInfoList, ( dlnode* ) coi ) ;
        compiler->OptInfo = coi ; // we are using the top of the stack/list
    }
    return coi ;
}

CompileOptimizeInfo *
Compiler_CompileOptimizeInfo_New ( Compiler * compiler, uint64 type )
{
    compiler->OptInfo = _CompileOptimizeInfo_New ( type ) ;
    return compiler->OptInfo ;
}

CompileOptimizeInfo *
CompileOptInfo_NewCopy ( CompileOptimizeInfo * optInfo, uint64 type )
{
    CompileOptimizeInfo * copyOptInfo = CompileOptimizeInfo_New ( type ) ;
    MemCpy ( copyOptInfo, optInfo, sizeof (CompileOptimizeInfo ) ) ;
    return copyOptInfo ;
}

int64
Compiler_BlockLevel ( Compiler * compiler )
{
    int64 depth = _Stack_Depth ( compiler->BlockStack ) ;
    return depth ;
}

void
Compiler_Init_AccumulatedOffsetPointers ( Compiler * compiler, Word * word )
{
    compiler->AccumulatedOffsetPointer = 0 ;
    word->AccumulatedOffset = 0 ;
    if ( word ) compiler->AccumulatedOptimizeOffsetPointer = & word->AccumulatedOffset ;
    else compiler->AccumulatedOptimizeOffsetPointer = 0 ;
}

void
CfrTil_SaveDebugInfo ( Word * word, uint64 allocType )
{
    Compiler * compiler = _Compiler_ ;
    if ( ! allocType ) allocType = CFRTIL ; // COMPILER_TEMP ;
    word = word ? word : _CfrTil_->LastFinished_Word ;
    if ( compiler->NumberOfVariables )
    {
        word->NamespaceStack = Stack_Copy ( compiler->LocalsCompilingNamespacesStack, allocType ) ;
        Namespace_RemoveNamespacesStack ( compiler->LocalsCompilingNamespacesStack ) ;
    }
    Stack_Init ( compiler->LocalsCompilingNamespacesStack ) ;
    if ( ! word->W_SC_WordList )
    {
        word->W_SC_WordList = _CfrTil_->Compiler_N_M_Node_WordList ;
        _CfrTil_->Compiler_N_M_Node_WordList = _dllist_New ( allocType ) ;
    }
    else List_Init ( _CfrTil_->Compiler_N_M_Node_WordList ) ;

}

void
Compiler_FreeLocalsNamespaces ( Compiler * compiler )
{
    if ( compiler->NumberOfVariables )
    {
        Namespace_RemoveAndClearNamespacesStack ( compiler->LocalsCompilingNamespacesStack ) ;
        _Namespace_RemoveFromUsingListAndClear ( compiler->LocalsNamespace ) ;
        CfrTil_NonCompilingNs_Clear ( _CfrTil_ ) ;
    }
}

void
CfrTil_DeleteDebugInfo ( )
{
    Compiler_FreeLocalsNamespaces ( _Compiler_ ) ;
    if ( ! _Context_->CurrentWordBeingCompiled ) _CfrTil_RecycleInit_Compiler_N_M_Node_WordList ( ) ;
}

void
_CfrTil_FinishWordDebugInfo ( Word * word )
{
    if ( ! GetState ( _CfrTil_, ( RT_DEBUG_ON | GLOBAL_SOURCE_CODE_MODE ) ) ) CfrTil_DeleteDebugInfo ( ) ;
    else CfrTil_SaveDebugInfo ( word, 0 ) ;
}

void
Compiler_Init ( Compiler * compiler, uint64 state )
{
    compiler->State = ( state &= ( ~ ARRAY_MODE ) ) ;
    compiler->ContinuePoint = 0 ;
    compiler->BreakPoint = 0 ;
    compiler->InitHere = Here ;
    compiler->ParenLevel = 0 ;
    compiler->ArrayEnds = 0 ;
    compiler->NumberOfNonRegisterLocals = 0 ;
    compiler->NumberOfLocals = 0 ;
    compiler->NumberOfRegisterLocals = 0 ;
    compiler->NumberOfArgs = 0 ;
    compiler->NumberOfNonRegisterArgs = 0 ;
    compiler->NumberOfRegisterArgs = 0 ;
    compiler->NumberOfVariables = 0 ;
    compiler->NumberOfRegisterVariables = 0 ;
    compiler->NumberOfNonRegisterVariables = 0 ;
    compiler->LocalsFrameSize = 0 ;
    compiler->AccumulatedOffsetPointer = 0 ;
    compiler->ReturnVariableWord = 0 ;
    compiler->Current_Word_New = 0 ;
    compiler->Current_Word_Create = 0 ;
    Stack_Init ( compiler->BlockStack ) ;
    Stack_Init ( compiler->CombinatorBlockInfoStack ) ;
    Stack_Init ( compiler->PointerToOffsetStack ) ;
    Stack_Init ( compiler->CombinatorInfoStack ) ;
    Stack_Init ( compiler->InfixOperatorStack ) ;
    Stack_Init ( compiler->LocalsCompilingNamespacesStack ) ;
    _dllist_Init ( compiler->GotoList ) ;
    _dllist_Init ( compiler->CurrentSwitchList ) ;
    _dllist_Init ( compiler->RegisterParameterList ) ;
    _dllist_Init ( compiler->OptimizeInfoList ) ;
    CfrTil_TypeStackReset ( ) ;
    SetState ( _CfrTil_, RT_DEBUG_ON, false ) ;
    Compiler_CompileOptimizeInfo_PushNew ( compiler ) ;
    SetBuffersUnused ( 1 ) ;
    SetState ( compiler, VARIABLE_FRAME, false ) ;
}

Compiler *
Compiler_New ( uint64 allocType )
{
    Compiler * compiler = ( Compiler * ) Mem_Allocate ( sizeof (Compiler ), allocType ) ;
    compiler->BlockStack = Stack_New ( 64, allocType ) ;
    compiler->CombinatorInfoStack = Stack_New ( 64, allocType ) ;
    compiler->InfixOperatorStack = Stack_New ( 64, allocType ) ;
    compiler->PointerToOffsetStack = Stack_New ( 64, allocType ) ;
    compiler->CombinatorBlockInfoStack = Stack_New ( 64, allocType ) ;
    compiler->LocalsCompilingNamespacesStack = Stack_New ( 64, allocType ) ;
    compiler->InternalNamespacesStack = Stack_New ( 64, allocType ) ; //initialized when using
    compiler->PostfixLists = _dllist_New ( allocType ) ;
    compiler->GotoList = _dllist_New ( allocType ) ;
    compiler->OptimizeInfoList = _dllist_New ( allocType ) ;
    Compiler_Init ( compiler, 0 ) ;
    return compiler ;
}

Compiler *
Compiler_Copy ( Compiler * compiler, uint64 allocType )
{
    Compiler * compilerCopy = ( Compiler * ) Mem_Allocate ( sizeof (Compiler ), allocType ) ;
    memcpy ( compilerCopy, compiler, sizeof (Compiler ) ) ;
    return compilerCopy ;
}

void
Compiler_CalculateAndSetPreviousJmpOffset ( Compiler * compiler, byte * jmpToAddress )
{
    // we now can not compile blocks (cf. _Compile_Block_WithLogicFlag ) if their logic is not called so depth check is necessary
    if ( _Stack_Depth ( compiler->PointerToOffsetStack ) ) _SetOffsetForCallOrJump ( ( byte* ) Stack_Pop ( compiler->PointerToOffsetStack ), jmpToAddress, 0 ) ;
}

void
CfrTil_CalculateAndSetPreviousJmpOffset_ToHere ( )
{
    Compiler_CalculateAndSetPreviousJmpOffset ( _Context_->Compiler0, Here ) ;
}

void
_Stack_PointerToJmpOffset_Set ( byte * address )
{
    Stack_Push ( _Context_->Compiler0->PointerToOffsetStack, ( int64 ) address ) ;
}

void
Stack_Push_PointerToJmpOffset ( byte * compiledAtAddress )
{
    _Stack_PointerToJmpOffset_Set ( compiledAtAddress + 1 ) ;
}

void
CfrTil_CompileAndRecord_Word0_PushReg ( Boolean reg, Boolean recordFlag )
{
    Word * word = _CfrTil_WordList ( 0 ) ;
    _Word_CompileAndRecord_PushReg ( word, reg, recordFlag ) ;
}

void
CfrTil_CompileAndRecord_Word0_PushRegToUse ( )
{
    Word * word = _CfrTil_WordList ( 0 ) ;
    _Word_CompileAndRecord_PushReg ( word, word->RegToUse, true ) ;
}

void
CfrTil_CompileAndRecord_PushAccum ( )
{
    Word * word = _CfrTil_WordList ( 0 ) ;
    _Word_CompileAndRecord_PushReg ( word, ACC, true ) ;
}


