
#include "../../include/cfrtil64.h"
// words need to be copied because a word may be used more than once in compiling a new word, 
// each needs to have their own coding, wordIndex, etc.
// this information is used by the compiler, optimizer and the debugger

Word *
_CopyDuplicateWord ( Word * word0 )
{
    d0 ( if ( Is_DebugModeOn ) DWL_ShowList ( _Compiler_->WordList, 0 ) ) ;
    Word * wordc = Word_Copy ( word0, DICTIONARY ) ; // use DICTIONARY since we are recycling these anyway
    wordc->W_OriginalWord = Word_GetOriginalWord ( word0 ) ;
    _dlnode_Init ( ( dlnode * ) wordc ) ; // necessary!
    wordc->S_CAttribute |= ( uint64 ) RECYCLABLE_COPY ;
    // included with Word_Copy
    //wordc->StackPushRegisterCode = word0->StackPushRegisterCode ;
    //wordc->W_SC_ScratchPadIndex = word0->W_SC_WordIndex ;
    //wordc->W_TokenStart_ReadLineIndex = word0->W_TokenStart_ReadLineIndex ;
    Word_SetLocation ( wordc ) ;
    return wordc ;
}

Word *
CopyDuplicateWord ( dlnode * anode, Word * word0 )
{
    Word * wordn = ( Word* ) dobject_Get_M_Slot ( anode, SCN_WORD ) ;
    int64 iuoFlag = dobject_Get_M_Slot ( anode, SCN_IN_USE_FLAG ) ;
    if ( iuoFlag && ( word0 == wordn ) ) return _CopyDuplicateWord ( word0 ) ;
    else return 0 ;
}

Word *
_Compiler_CopyDuplicatesAndPush ( Compiler * compiler, Word * word0 )
{
    Word * word1, *wordToBePushed ;
    word0->W_OriginalWord = word0 ;
    word0->S_CAttribute &= ( ~ RECYCLABLE_COPY ) ;
    if ( word1 = ( Word * ) dllist_Map1_WReturn ( compiler->WordList, ( MapFunction1 ) CopyDuplicateWord, ( int64 ) word0 ) )
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
        word0 = _Compiler_CopyDuplicatesAndPush ( _Context_->Compiler0, word0 ) ;
    }
    CfrTil_WordList_PushWord ( word0 ) ;
    return word0 ;
}

void
Compiler_IncrementCurrentAccumulatedOffset ( Compiler * compiler, int64 increment )
{
    if ( compiler->AccumulatedOffsetPointer )
    {
        ( *( int64* ) ( compiler->AccumulatedOffsetPointer ) ) += ( increment ) ;
    }
#if 1   
    if ( compiler->AccumulatedOptimizeOffsetPointer )
    {
        ( *( int64* ) ( compiler->AccumulatedOptimizeOffsetPointer ) ) += ( increment ) ;
    }
#endif    
}

void
Compiler_SetCurrentAccumulatedOffsetValue ( Compiler * compiler, int64 value )
{
    if ( compiler->AccumulatedOffsetPointer )
    {
        ( *( int64* ) ( compiler->AccumulatedOffsetPointer ) ) = ( value ) ;
    }
#if 1    
    if ( compiler->AccumulatedOptimizeOffsetPointer )
    {
        ( *( int64* ) ( compiler->AccumulatedOptimizeOffsetPointer ) ) = ( value ) ;
    }
#endif    
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
    if ( ! ba ) Error_Abort ( ( byte* ) "\nCompiler_SetCompilingSpace_MakeSureOfRoom : no ba?!\n" ) ;
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
    for ( i = startIndex ; ( word = ( Word* ) Compiler_WordList ( i ) ) && i > - 3 ; i -- )
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
    _Printf ("\nLabelName = %s : Type = %3d : CompileAtAddress = 0x%016lx : LabeledAddress = 0x%016lx : JmpOffsetPointer = : 0x%016lx", 
        gi->pb_LabelName, gi->GI_CAttribute, gi->CompileAtAddress, gi->LabeledAddress, gi->pb_JmpOffsetPointer ) ;
}

void
Compiler_GotoList_Print ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    _Printf ("\nTypes : GI_BREAK = 1 : GI_RETURN = 2 : GI_CONTINUE = 4 : GI_GOTO = 8 : GI_RECURSE = 16 : GI_LABEL = 64 : GI_GOTO_LABEL = 128" ) ;
    dllist_Map ( compiler->GotoList, ( MapFunction0 ) GotoInfo_Print ) ;
}

Word *
_Compiler_WordList ( Compiler * compiler, int64 n )
{
    return ( Word * ) _dllist_Get_N_InUse_Node_M_Slot ( compiler->WordList, n, SCN_WORD ) ;
}

Word *
Compiler_WordList ( int64 n )
{
    return ( Word * ) _Compiler_WordList ( _Compiler_, n ) ;
}

void
_CompileOptimizeInfo_Init ( CompileOptimizeInfo * optInfo )
{
    memset ( optInfo, 0, sizeof (CompileOptimizeInfo ) ) ;
}

void
CompileOptimizeInfo_Init ( CompileOptimizeInfo * optInfo, uint64 state )
{
    _CompileOptimizeInfo_Init ( optInfo ) ;
    dlnode * node ;
    int64 i ;
    for ( i = 0, node = dllist_First ( ( dllist* ) _Compiler_->WordList ) ; node ; node = dlnode_Next ( node ) ) // nb. this is a little subtle
    {
        if ( dobject_Get_M_Slot ( node, SCN_IN_USE_FLAG ) )
        {
            if ( i < 8 ) optInfo->COIW [ i ++ ] = ( Word * ) dobject_Get_M_Slot ( node, SCN_WORD ) ;
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
Compiler_CompileOptimizeInfo_New ( Compiler * compiler, uint64 type )
{
    compiler->OptInfo = _CompileOptimizeInfo_New ( type ) ;
}

CompileOptimizeInfo *
CompileOptInfo_NewCopy ( CompileOptimizeInfo * optInfo, uint64 type )
{
    CompileOptimizeInfo * copyOptInfo = _CompileOptimizeInfo_New ( type ) ;
    memcpy ( copyOptInfo, optInfo, sizeof (CompileOptimizeInfo ) ) ;   
    return copyOptInfo ;
}

void
CompileoptInfo_Delete ( CompileOptimizeInfo * optInfo )
{
    Mem_FreeItem ( &_Q_->PermanentMemList, ( byte* ) optInfo ) ;
}

void
CfrTil_InitBlockSystem ( Compiler * compiler )
{
    Stack_Init ( compiler->BlockStack ) ;
    Stack_Init ( compiler->CombinatorBlockInfoStack ) ;
}

void
Compiler_WordList_RecycleInit ( Compiler * compiler )
{
    if ( ! IsSourceCodeOn )
    {
        DLList_RecycleWordList ( compiler->WordList ) ;
        List_Init ( compiler->WordList ) ;
    }
}

void
Compiler_Init ( Compiler * compiler, uint64 state )
{
    compiler->State = state ;
    _dllist_Init ( compiler->GotoList ) ;
    if ( ! IsSourceCodeOn )
    {
        DLList_RecycleWordList ( compiler->WordList ) ;
        compiler->WordList = _dllist_New ( CFRTIL ) ;
    }
#if 1    
    else
    {
        _Context_->WordList = compiler->WordList ;
        if ( compiler->CurrentWordCompiling )
        {
            compiler->CurrentWordCompiling->W_SC_WordList = compiler->WordList ;
            compiler->CurrentWordCompiling->W_SC_MemSpaceRandMarker = _Q_->MemorySpace0->TempObjectSpace->InitFreedRandMarker ; // this insures that memory for this list hasn't been recycled
        }
        DLList_RecycleWordList ( compiler->WordList ) ;
        compiler->WordList = _dllist_New ( CFRTIL ) ;
    }
#endif    
    CfrTil_InitBlockSystem ( compiler ) ;
    compiler->ContinuePoint = 0 ;
    compiler->BreakPoint = 0 ;
    compiler->InitHere = Here ;
    compiler->ParenLevel = 0 ;
    compiler->BlockLevel = 0 ;
    compiler->ArrayEnds = 0 ;
    compiler->NumberOfLocals = 0 ;
    compiler->NumberOfArgs = 0 ;
    compiler->NumberOfRegisterLocals = 0 ;
    compiler->NumberOfRegisterArgs = 0 ;
    compiler->NumberOfRegisterVariables = 0 ;
    compiler->LocalsFrameSize = 0 ;
    compiler->AccumulatedOffsetPointer = 0 ;
    compiler->ReturnVariableWord = 0 ;
    Stack_Init ( compiler->PointerToOffset ) ;
    Stack_Init ( compiler->CombinatorInfoStack ) ;
    _Compiler_FreeAllLocalsNamespaces ( compiler ) ;
    Stack_Init ( compiler->InfixOperatorStack ) ;
    _dllist_Init ( compiler->CurrentSwitchList ) ;
    _dllist_Init ( compiler->RegisterParameterList ) ;
    compiler->CurrentCreatedWord = 0 ;
    compiler->CurrentWord = 0 ;
    compiler->CurrentWordCompiling = 0 ;
    SetBuffersUnused ( 1 ) ;
    SetState ( compiler, VARIABLE_FRAME, false ) ;
}

Compiler *
Compiler_New ( uint64 type )
{
    Compiler * compiler = ( Compiler * ) Mem_Allocate ( sizeof (Compiler ), type ) ;
    compiler->BlockStack = Stack_New ( 64, type ) ;
    compiler->WordList = _dllist_New ( CFRTIL ) ;
    compiler->PostfixLists = _dllist_New ( type ) ;
    compiler->CombinatorBlockInfoStack = Stack_New ( 64, type ) ;
    compiler->GotoList = _dllist_New ( type ) ;
    compiler->LocalsCompilingNamespacesStack = Stack_New ( 32, type ) ;
    compiler->NamespacesStack = Stack_New ( 32, type ) ;
    compiler->PointerToOffset = Stack_New ( 32, type ) ;
    compiler->CombinatorInfoStack = Stack_New ( 64, type ) ;
    compiler->InfixOperatorStack = Stack_New ( 32, type ) ;
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
Stack_PointerToJmpOffset_Set ( )
{
    _Stack_PointerToJmpOffset_Set ( Here - DISP_SIZE ) ;
}

void
_Compiler_CompileAndRecord_Word0_PushReg ( Compiler * compiler, int8 reg )
{
    _Word_CompileAndRecord_PushReg ( _Compiler_WordList ( compiler, 0 ), reg ) ;
}

void
Compiler_CompileAndRecord_PushAccum ( Compiler * compiler )
{
    _Compiler_CompileAndRecord_Word0_PushReg ( compiler, ACC ) ;
}


