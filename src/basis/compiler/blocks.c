
#include "../../include/cfrtil64.h"

BlockInfo *
BI_Block_Copy ( BlockInfo * bi, byte* dstAddress, byte * srcAddress, int64 bsize, Boolean optSetupFlag )
{
    Compiler * compiler = _Compiler_ ;
    if ( ! bi ) bi = ( BlockInfo * ) Stack_Top ( compiler->CombinatorBlockInfoStack ) ;
    byte * saveHere = Here, * saveAddress = srcAddress ;
    ud_t * ud = Debugger_UdisInit ( _Debugger_ ) ;
    int64 isize, left ;
    if ( dstAddress ) SetHere ( dstAddress, 1 ) ;
    bi->CopiedToStart = Here ;
    //CfrTil_AdjustDbgSourceCode_ScInUseFalse ( srcAddress ) ;
    for ( left = bsize ; ( left > 0 ) ; srcAddress += isize )
    {
        if ( optSetupFlag ) PeepHole_Optimize ( ) ;
        isize = _Udis_GetInstructionSize ( ud, srcAddress ) ;
        left -= isize ;
        CfrTil_AdjustDbgSourceCodeAddress ( srcAddress, Here ) ;
        CfrTil_AdjustLabels ( srcAddress ) ;
        if ( * srcAddress == _RET )
        {
            if ( ( left > 0 ) && ( ( * srcAddress + 1 ) != NOOP ) ) //  noop from our logic overwrite
            {
                // ?? unable at present to compile inline with more than one return in the block
                SetHere ( saveHere, 1 ) ;
                Compile_Call ( saveAddress ) ;
            }
            else break ; // don't include RET
        }
        else if ( * srcAddress == CALLI32 )
        {
            int32 offset = * ( int32* ) ( srcAddress + 1 ) ; // 1 : 1 byte CALLI32 opCode
            if ( ! offset )
            {
                dllist_Map1 ( compiler->GotoList, ( MapFunction1 ) AdjustGotoJmpOffsetPointer, ( int64 ) ( srcAddress + 1 ) ) ;
                CfrTil_SetupRecursiveCall ( ) ;
                continue ;
            }
            else
            {
                byte * jcAddress = JumpCallInstructionAddress ( srcAddress ) ;
                Word * word = Word_GetFromCodeAddress ( jcAddress ) ;
                if ( word )
                {
                    _Word_Compile ( word ) ;
                    continue ;
                }
            }
        }
        else if ( * srcAddress == JMPI32 )
        {
            int64 offset = * ( int32* ) ( srcAddress + 1 ) ; // 1 : 1 byte JMPI32 opCode
            if ( offset )
            {
                dllist_Map1 ( compiler->GotoList, ( MapFunction1 ) AdjustGotoJmpOffsetPointer, ( int64 ) ( srcAddress + 1 ) ) ;
            }
            else dllist_Map1 ( compiler->GotoList, ( MapFunction1 ) _AdjustGotoInfo, ( int64 ) srcAddress ) ; //, ( int64 ) end ) ;
        }
        _CompileN ( srcAddress, isize ) ;
        //if ( _DBI || _O_->Dbi ) Debugger_UdisOneInstruction ( _Debugger_, srcAddress, ( byte* ) "", ( byte* ) "" ) ;
        //if ( _DBI  ) Debugger_UdisOneInstruction ( _Debugger_, srcAddress, ( byte* ) "", ( byte* ) "" ) ;
    }
    bi->CopiedToEnd = Here ;
    bi->CopiedSize = bi->CopiedToEnd - bi->CopiedToStart ;
    d0 ( if ( Is_DebugModeOn ) Debugger_Disassemble ( _Debugger_, bi->CopiedToStart, bi->CopiedSize, 1 ) ) ;
    return bi ;
}

void
Compile_BlockLogicTest ( BlockInfo * bi )
{
    int64 diff ;
    if ( bi )
    {
        if ( ( bi->JccLogicCode || ( bi->LogicCodeWord && bi->LogicCodeWord->StackPushRegisterCode ) ) )
        {
            if ( ! bi->JccLogicCode ) bi->JccLogicCode = bi->LogicCodeWord->StackPushRegisterCode ;
            diff = bi->JccLogicCode - bi->bp_First ; // find its diff position in original block
            bi->CopiedToLogicJccCode = bi->CopiedToStart + diff ; // use diff in copied block
            if ( bi->LogicCodeWord && ( bi->LogicCodeWord->W_OpInsnCode != CMP ) ) // cmp sets flags no need for test code //CAttribute & CATEGORY_LOGIC ) ) )
            {
                SetHere ( bi->CopiedToLogicJccCode, 1 ) ;
                Compiler_SCA_Word_SetCodingHere_And_ClearPreviousUse ( bi->LogicCodeWord, 0 ) ;
                BI_CompileRecord_TestCode_Reg (bi, bi->LogicCodeWord->RegToUse, CELL) ;
                bi->CopiedToLogicJccCode = Here ;
                BI_Set_Tttn ( bi, TTT_ZERO, NEGFLAG_ON, TTT_ZERO, NEGFLAG_OFF ) ;
            }
            else if ( bi->LogicCodeWord && ( bi->LogicCodeWord->W_MorphismAttributes & CATEGORY_OP_1_ARG ) && ( bi->LogicCodeWord->W_MorphismAttributes & LOGIC_NEGATE ) )
            {
                SetHere ( bi->LogicCodeWord->Coding, 1 ) ;
                Compiler_SCA_Word_SetCodingHere_And_ClearPreviousUse ( bi->LogicCodeWord, 0 ) ;
                BI_CompileRecord_TestCode_Reg (bi, bi->LogicCodeWord->RegToUse, CELL) ;
                bi->CopiedToLogicJccCode = Here ;
                BI_Set_Tttn ( bi, TTT_ZERO, NEGFLAG_ON, TTT_ZERO, NEGFLAG_ON ) ;
            }
        }
        else
        {
            _Compile_GetTestLogicFromTOS ( bi ) ;
            bi->CopiedToLogicJccCode = Here ;
        }
    }
}

byte *
Block_CopyCompile ( byte * srcAddress, int64 bindex, Boolean jccFlag )
{
    byte * compiledAtAddress = 0 ;
    Compiler * compiler = _Context_->Compiler0 ;
    BlockInfo *bi = ( BlockInfo * ) _Stack_Pick ( compiler->CombinatorBlockInfoStack, bindex ) ;
    BI_Block_Copy ( bi, Here, srcAddress, bi->bp_Last - bi->bp_First, 0 ) ; //nb!! 0 : turns off peephole optimization ; peephole optimization will be done in CfrTil_EndCombinator
    if ( jccFlag )
    {
        Compile_BlockLogicTest ( bi ) ;
        compiledAtAddress = _BI_Compile_Jcc ( bi, 0 ) ;
        Stack_Push_PointerToJmpOffset ( compiledAtAddress ) ;
        bi->CopiedToEnd = Here ;
        bi->CopiedSize = bi->CopiedToEnd - bi->CopiedToStart ;
        //d1 ( if ( Is_DebugModeOn ) Debugger_Disassemble ( _Debugger_, ( byte* ) bi->CopiedToStart, bi->CopiedSize, 1 ) ) ;
    }
    return compiledAtAddress ;
}

// a 'block' is merely a notation borrowed from C
// for a pointer to an anonymous subroutine 'call'

void
CfrTil_TurnOffBlockCompiler ( )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    if ( ! GetState ( compiler, LISP_MODE ) ) CfrTil_LeftBracket ( ) ;
    _CfrTil_RemoveNamespaceFromUsingListAndClear ( ( byte* ) "__labels__" ) ;
    Compiler_FreeLocalsNamespaces ( compiler ) ;
    SetState ( compiler, COMPILE_MODE | VARIABLE_FRAME, false ) ;
    cntx->LastCompiledWord = cntx->CurrentWordBeingCompiled ;
    cntx->CurrentWordBeingCompiled = 0 ;
}

void
CfrTil_TurnOnBlockCompiler ( )
{
    _CfrTil_RightBracket ( ) ;
}

// blocks are a notation for subroutines or blocks of code compiled in order,
// nested in code, for any purpose, worded or anonymously
// we currently jmp over them to code which pushes
// a pointer to the beginning of the block on the stack
// so the next word will see it on the top of the stack
// some combinators take more than one block on the stack

BlockInfo *
_CfrTil_BeginBlock0 ( )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    BlockInfo *bi = BlockInfo_New ( ) ;
    if ( ( ! CompileMode ) || ( ! Compiler_BlockLevel ( compiler ) ) )// first block
    {
        CheckCodeSpaceForRoom ( ) ;
        _Context_->CurrentWordBeingCompiled = compiler->Current_Word_Create ;
        CfrTil_TurnOnBlockCompiler ( ) ;
    }
    compiler->LHS_Word = 0 ;
    bi->OriginalActualCodeStart = Here ;
    byte * compiledAtAddress = Compile_UninitializedJump ( ) ;
    bi->PtrToJumpOffset = Here - INT32_SIZE ; // before CfrTil_CheckCompileLocalFrame after CompileUninitializedJump
    Stack_Push_PointerToJmpOffset ( compiledAtAddress ) ;
    bi->bp_First = Here ; // after the jump for inlining
    return bi ;
}

BlockInfo *
_CfrTil_BeginBlock1 ( BlockInfo * bi )
{
    Compiler * compiler = _Context_->Compiler0 ;
    if ( _Stack_IsEmpty ( compiler->BlockStack ) )
    {
        // remember : we always jmp around the blocks to the combinator ; the combinator sees the blocks on the stack and uses them otherwise they are lost
        // the jmps are optimized out so the word->Definition is a call to the first combinator
        // we always add a frame and if not needed we move the blocks to overwrite the extra code
        bi->LocalFrameStart = Here ; // before _Compile_AddLocalFrame
        _Compiler_AddLocalFrame ( compiler ) ; // cf EndBlock : if frame is not needed we use BI_Start else BI_FrameStart -- ?? could waste some code space ??
        if ( compiler->NumberOfRegisterArgs ) Compile_Init_LocalRegisterParamenterVariables ( compiler ) ; // this function is called twice to deal with words that have locals before the first block and regular colon words
        CfrTil_TypeStackReset ( ) ;
    }
    bi->AfterLocalFrame = Here ; // after _Compiler_AddLocalFrame and Compile_InitRegisterVariables
    return bi ;
}

void
_CfrTil_BeginBlock2 ( BlockInfo * bi )
{
    Compiler * compiler = _Context_->Compiler0 ;
    _Stack_Push ( compiler->BlockStack, ( int64 ) bi ) ; // _Context->CompileSpace->IndexStart before set frame size after turn on
    _Stack_Push ( compiler->CombinatorBlockInfoStack, ( int64 ) bi ) ; // _Context->CompileSpace->IndexStart before set frame size after turn on
}

void
CfrTil_BeginBlock ()
{
    BlockInfo * bi = _CfrTil_BeginBlock0 ( ) ;
    _CfrTil_BeginBlock1 ( bi ) ;
    _CfrTil_BeginBlock2 ( bi ) ;
}

void
CfrTil_FinalizeBlocks ( BlockInfo * bi )
{
    Compiler * compiler = _Context_->Compiler0 ;
    _CfrTil_InstallGotoCallPoints_Keyed ( bi, GI_RETURN ) ;
    if ( Compiler_IsFrameNecessary ( compiler ) )
    {
        Compiler_SetLocalsFrameSize_AtItsCellOffset ( compiler ) ;
        Compiler_RemoveLocalFrame ( compiler ) ;
        bi->bp_First = bi->LocalFrameStart ; // default 
    }
    else
    {
        if ( compiler->NumberOfRegisterVariables ) Compiler_RemoveLocalFrame ( compiler ) ;
        bi->bp_First = bi->AfterLocalFrame ;
    }
}

void
_CfrTil_EndBlock1 ( BlockInfo * bi )
{
    Compiler * compiler = _Context_->Compiler0 ;
    if ( ! Compiler_BlockLevel ( compiler ) ) CfrTil_FinalizeBlocks ( bi ) ;
    compiler->LHS_Word = 0 ;
    _Compile_Return ( ) ;
    DataStack_Push ( ( int64 ) bi->bp_First ) ;
    bi->bp_Last = Here ;
    Compiler_CalculateAndSetPreviousJmpOffset ( compiler, bi->PtrToJumpOffset ) ;
    _SetOffsetForCallOrJump ( bi->PtrToJumpOffset, Here, 0 ) ;
}

byte *
_CfrTil_EndBlock2 ( BlockInfo * bi )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    byte * first = bi->bp_First ;
    if ( ! Compiler_BlockLevel ( compiler ) )
    {
        _CfrTil_InstallGotoCallPoints_Keyed ( bi, GI_GOTO | GI_RECURSE ) ;
        CfrTil_TurnOffBlockCompiler ( ) ;
    }
    else _Namespace_RemoveFromUsingListAndClear ( bi->BI_LocalsNamespace ) ;
    CfrTil_TypeStackReset ( ) ;
    return first ;
}

void
CfrTil_EndBlock ( )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    BlockInfo * bi = ( BlockInfo * ) Stack_Pop_WithExceptionOnEmpty ( compiler->BlockStack ) ;
    bi->LogicCodeWord = _CfrTil_WordList ( 1 ) ;
    _CfrTil_EndBlock1 ( bi ) ;
    _CfrTil_EndBlock2 ( bi ) ;
}

BlockInfo *
BlockInfo_New ( )
{
    BlockInfo *bi = ( BlockInfo * ) Mem_Allocate ( sizeof (BlockInfo ), COMPILER_TEMP ) ;
    return bi ;
}

