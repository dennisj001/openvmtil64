
#include "../../include/cfrtil64.h"
// words need to be copied because a word may be used more than once in compiling a new word, 
// each needs to have their own coding, wordIndex, etc.
// this information is used by the compiler, optimizer and the debugger

Word *
_CopyDuplicateWord ( Word * word0 )
{
    Word * wordc = Word_Copy ( word0, DICTIONARY ) ; // use DICTIONARY since we are recycling these anyway
    wordc->W_OriginalWord = Word_GetOriginalWord ( word0 ) ;
    _dlnode_Init ( ( dlnode * ) wordc ) ; // necessary!
    wordc->CAttribute |= ( uint64 ) RECYCLABLE_COPY ;
    Word_SetLocation ( wordc ) ;
    return wordc ;
}

Word *
CopyDuplicateWord ( dlnode * anode, Word * word0 )
{
    Word * wordn = ( Word* ) dobject_Get_M_Slot ( ( dobject* ) anode, SCN_T_WORD ) ;
    int64 iuoFlag = dobject_Get_M_Slot ( ( dobject* ) anode, SCN_IN_USE_FLAG ) ;
    if ( iuoFlag && ( word0 == wordn ) ) return _CopyDuplicateWord ( word0 ) ;
    else return 0 ;
}

Word *
_CfrTil_CopyDuplicates ( Word * word0 )
{
    Word * word1, *wordToBePushed ;
    word0->W_OriginalWord = word0 ;
    word0->CAttribute &= ( ~ RECYCLABLE_COPY ) ;
    if ( word1 = ( Word * ) dllist_Map1_WReturn ( _CfrTil_->CompilerWordList, ( MapFunction1 ) CopyDuplicateWord, ( int64 ) word0 ) )
    {
        wordToBePushed = word1 ;
    }
    else wordToBePushed = word0 ;
    return wordToBePushed ;
}

Word *
Compiler_CopyDuplicatesAndPush ( Word * word0 )
{
    if ( ( word0->CAttribute & ( DEBUG_WORD | INTERPRET_DBG ) ) || ( word0->LAttribute & ( W_COMMENT | W_PREPROCESSOR ) ) ) return word0 ;
    if ( word0 && CompileMode )
    {
        word0 = _CfrTil_CopyDuplicates ( word0 ) ;
    }
    CfrTil_WordList_PushWord ( word0 ) ;
    return word0 ;
}

void
Compiler_IncrementCurrentAccumulatedOffset ( Compiler * compiler, int64 increment )
{
    if ( compiler->AccumulatedOffsetPointer ) ( *( int64* ) ( compiler->AccumulatedOffsetPointer ) ) += ( increment ) ;
    if ( compiler->AccumulatedOptimizeOffsetPointer ) ( *( int64* ) ( compiler->AccumulatedOptimizeOffsetPointer ) ) += ( increment ) ;
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
    NamedByteArray *nba = _OVT_Find_NBA ( "CodeSpace" ) ;
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
        if ( ( Symbol* ) word && ( ! ( word->CAttribute & DEBUG_WORD ) ) ) break ;
    }
    return word ;
}

void
_Compiler_FreeAllLocalsNamespaces ( Compiler * compiler )
{
    _Namespace_FreeNamespacesStack ( compiler->LocalsCompilingNamespacesStack ) ;
}

#if 0

typedef struct
{
    Symbol GI_Symbol ;
    byte * pb_LabelName ;
    byte * CompileAtAddress ;
    byte * LabeledAddress ;
    byte * pb_JmpOffsetPointer ;
} GotoInfo ;
// GotoInfo Types
#define GI_BREAK ( (uint64) 1 << 0 )
#define GI_RETURN ( (uint64) 1 << 1 )
#define GI_CONTINUE ( (uint64) 1 << 2 )
#define GI_GOTO ( (uint64) 1 << 3 )
#define GI_RECURSE ( (uint64) 1 << 4 )
#define GI_TAIL_CALL ( (uint64) 1 << 5 )
#define GI_LABEL ( (uint64) 1 << 6 )
#define GI_GOTO_LABEL ( (uint64) 1 << 7 )
#endif

void
GotoInfo_Print ( dlnode * node )
{
    GotoInfo * gi = ( GotoInfo * ) node ;
    _Printf ( "\nLabelName = %s : Type = %3d : CompileAtAddress = 0x%016lx : LabeledAddress = 0x%016lx : JmpOffsetPointer = : 0x%016lx",
        gi->pb_LabelName, gi->GI_CAttribute, gi->CompileAtAddress, gi->LabeledAddress, gi->pb_JmpOffsetPointer ) ;
}

void
Compiler_GotoList_Print ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    _Printf ( "\nTypes : GI_BREAK = 1 : GI_RETURN = 2 : GI_CONTINUE = 4 : GI_GOTO = 8 : GI_RECURSE = 16 : GI_LABEL = 64 : GI_GOTO_LABEL = 128" ) ;
    dllist_Map ( compiler->GotoList, ( MapFunction0 ) GotoInfo_Print ) ;
}

Word *
_CfrTil_WordList ( int64 n )
{
    return ( Word * ) _dllist_Get_N_InUse_Node_M_Slot ( _CfrTil_->CompilerWordList, n, SCN_T_WORD ) ;
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
    for ( i = 0, node = dllist_First ( ( dllist* ) _CfrTil_->CompilerWordList ) ; node ; node = dlnode_Next ( node ) ) // nb. this is a little subtle
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
    return optInfo ;
}

CompileOptimizeInfo *
CompileOptimizeInfo_New ( uint64 type )
{
    CompileOptimizeInfo * optInfo =
        ( CompileOptimizeInfo * ) OVT_CheckRecycleableAllocate ( _Q_->MemorySpace0->RecycledOptInfoList, sizeof (CompileOptimizeInfo ) ) ;
    if ( ! optInfo ) optInfo = _CompileOptimizeInfo_New ( type ) ;
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
}

CompileOptimizeInfo *
CompileOptInfo_NewCopy ( CompileOptimizeInfo * optInfo, uint64 type )
{
    CompileOptimizeInfo * copyOptInfo = CompileOptimizeInfo_New ( type ) ;
    MemCpy ( copyOptInfo, optInfo, sizeof (CompileOptimizeInfo ) ) ;
    return copyOptInfo ;
}

void
CompileoptInfo_Delete ( CompileOptimizeInfo * optInfo )
{
    Mem_FreeItem ( &_Q_->PermanentMemList, ( byte* ) optInfo ) ;
}

int64
Compiler_BlockLevel ( Compiler * compiler )
{
    int64 depth = _Stack_Depth ( compiler->BlockStack ) ;
    return depth ;
}

void
Compiler_RecycleOptInfos ( )
{
    Compiler * compiler = _Compiler_ ;
    CompileOptimizeInfo * coi ;
    int64 depth ;
    while ( depth = List_Depth ( compiler->OptimizeInfoList ) )
    {
        coi = ( CompileOptimizeInfo* ) List_Pop ( compiler->OptimizeInfoList ) ;
        if ( coi && ( coi != compiler->OptInfo ) ) OptInfo_Recycle ( coi ) ;
    }
}

void
Compiler_Init_AccumulatedOffsetPointers ( Compiler * compiler, Word * word )
{
    compiler->AccumulatedOffsetPointer = 0 ;
    if ( word ) compiler->AccumulatedOptimizeOffsetPointer = & word->AccumulatedOffset ;
    else compiler->AccumulatedOptimizeOffsetPointer = 0 ;
}

void
Compiler_Init ( Compiler * compiler, uint64 state )
{
    compiler->State = state & (!ARRAY_MODE);
    compiler->ContinuePoint = 0 ;
    compiler->BreakPoint = 0 ;
    compiler->InitHere = Here ;
    compiler->ParenLevel = 0 ;
    compiler->ArrayEnds = 0 ;
    compiler->NumberOfLocals = 0 ;
    compiler->NumberOfArgs = 0 ;
    compiler->NumberOfRegisterLocals = 0 ;
    compiler->NumberOfRegisterArgs = 0 ;
    compiler->NumberOfRegisterVariables = 0 ;
    compiler->LocalsFrameSize = 0 ;
    compiler->AccumulatedOffsetPointer = 0 ;
    compiler->ReturnVariableWord = 0 ;
    compiler->CurrentCreatedWord = 0 ;
    compiler->CurrentWord = 0 ;
    compiler->NextBlockStart = 0 ;
    Stack_Init ( compiler->BlockStack ) ;
    Stack_Init ( compiler->CombinatorBlockInfoStack ) ;
    Stack_Init ( compiler->PointerToOffset ) ;
    Stack_Init ( compiler->CombinatorInfoStack ) ;
    Stack_Init ( compiler->InfixOperatorStack ) ;
    Stack_Init ( compiler->LocalsCompilingNamespacesStack ) ;
    _dllist_Init ( compiler->GotoList ) ;
    _dllist_Init ( compiler->CurrentSwitchList ) ;
    _dllist_Init ( compiler->RegisterParameterList ) ;
    _Compiler_FreeAllLocalsNamespaces ( compiler ) ;
    SetBuffersUnused ( 1 ) ;
    SetState ( compiler, VARIABLE_FRAME, false ) ;
}

Compiler *
Compiler_New ( uint64 type )
{
    Compiler * compiler = ( Compiler * ) Mem_Allocate ( sizeof (Compiler ), type ) ;
    compiler->BlockStack = Stack_New ( 64, type ) ;
    compiler->CombinatorInfoStack = Stack_New ( 64, type ) ;
    compiler->InfixOperatorStack = Stack_New ( 32, type ) ;
    compiler->PointerToOffset = Stack_New ( 32, type ) ;
    compiler->CombinatorBlockInfoStack = Stack_New ( 64, type ) ;
    compiler->LocalsCompilingNamespacesStack = Stack_New ( 32, type ) ;
    compiler->NamespacesStack = Stack_New ( 32, type ) ; //initialized when using
    compiler->PostfixLists = _dllist_New ( type ) ;
    compiler->GotoList = _dllist_New ( type ) ;
    compiler->OptimizeInfoList = _dllist_New ( type ) ;
    Compiler_CompileOptimizeInfo_New ( compiler, type ) ;
    Compiler_Init ( compiler, 0 ) ;
    return compiler ;
}

void
Compiler_CalculateAndSetPreviousJmpOffset ( Compiler * compiler, byte * jmpToAddress )
{
    // we now can not compile blocks (cf. _Compile_Block_WithLogicFlag ) if their logic is not called so depth check is necessary
    if ( _Stack_Depth ( compiler->PointerToOffset ) ) _SetOffsetForCallOrJump ( ( byte* ) Stack_Pop ( compiler->PointerToOffset ), jmpToAddress ) ;
}

void
CfrTil_CalculateAndSetPreviousJmpOffset_ToHere ( )
{
    Compiler_CalculateAndSetPreviousJmpOffset ( _Context_->Compiler0, Here ) ;
}

void
_Stack_PointerToJmpOffset_Set ( byte * address )
{
    Stack_Push ( _Context_->Compiler0->PointerToOffset, ( int64 ) address ) ;
}

void
Stack_Push_PointerToJmpOffset ( )
{
    _Stack_PointerToJmpOffset_Set ( Here - DISP_SIZE ) ;
}

void
_Compiler_CompileAndRecord_Word0_PushReg ( Boolean reg )
{
    Word * word = _CfrTil_WordList ( 0 ) ;
    _Word_CompileAndRecord_PushReg ( word, reg ) ;
}

void
Compiler_CompileAndRecord_Word0_PushRegToUse ( )
{
    Word * word = _CfrTil_WordList ( 0 ) ;
    _Word_CompileAndRecord_PushReg ( word, word->RegToUse ) ;
}

void
Compiler_CompileAndRecord_PushAccum ( Compiler * compiler )
{
    Word * word = _CfrTil_WordList ( 0 ) ;
    _Word_CompileAndRecord_PushReg ( word, ACC ) ;
}


