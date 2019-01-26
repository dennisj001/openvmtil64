
#include "../../include/cfrtil64.h"

BlockInfo *
BI_Block_Copy ( BlockInfo * bi, byte* dstAddress, byte * srcAddress, int64 bsize, Boolean optFlag )
{
    Compiler * compiler = _Compiler_ ;
    if ( ! bi ) bi = ( BlockInfo * ) Stack_Top ( compiler->CombinatorBlockInfoStack ) ;
    byte * saveHere = Here, * saveAddress = srcAddress ;
    ud_t * ud = Debugger_UdisInit ( _Debugger_ ) ;
    int64 isize, left ;
    if ( dstAddress ) SetHere ( dstAddress, 1 ) ;
    bi->CopiedToStart = Here ;
    CfrTil_AdjustDbgSourceCode_ScInUseFalse ( srcAddress ) ;
    for ( left = bsize ; ( left > 0 ) ; srcAddress += isize )
    {
        if ( optFlag ) PeepHole_Optimize ( ) ;
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
                dllist_Map1 ( compiler->GotoList, ( MapFunction1 ) AdjustJmpOffsetPointer, ( int64 ) ( srcAddress + 1 ) ) ;
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
            if ( offset ) dllist_Map1 ( compiler->GotoList, ( MapFunction1 ) AdjustJmpOffsetPointer, ( int64 ) ( srcAddress + 1 ) ) ;
            else dllist_Map1 ( compiler->GotoList, ( MapFunction1 ) _AdjustGotoInfo, ( int64 ) srcAddress ) ; //, ( int64 ) end ) ;
        }
        _CompileN ( srcAddress, isize ) ;
    }
    bi->CopiedToEnd = Here ;
    bi->CopiedSize = bi->CopiedToEnd - bi->CopiedToStart ;
    d0 ( if ( Is_DebugModeOn ) Debugger_Disassemble ( _Debugger_, bi->CopiedToStart, bi->CopiedSize, 1 ) ) ;
    return bi ;
}

void
Compile_BlockLogicTest ( BlockInfo * bi ) // , byte * start )
{
    int64 diff ;
    if ( bi )
    {
        if ( ( bi->JccLogicCode || ( bi->LogicCodeWord && bi->LogicCodeWord->StackPushRegisterCode ) ) )
        {
            if ( ! bi->JccLogicCode )
            {
                bi->JccLogicCode = bi->LogicCodeWord->StackPushRegisterCode ;
            }
            diff = bi->JccLogicCode - bi->bp_First ; // find its diff position in original block
            bi->CopiedToLogicJccCode = bi->CopiedToStart + diff ; // use diff in copied block
            if ( ( ! ( bi->LogicCodeWord->CAttribute & CATEGORY_LOGIC ) ) )
            {
                SetHere ( bi->CopiedToLogicJccCode, 1 ) ;
                Compiler_Word_SetCodingHere_And_ClearPreviousUseOf_Here_SCA ( bi->LogicCodeWord, 0 ) ;
                _Compile_TestCode ( bi->LogicCodeWord->RegToUse, CELL ) ;
                bi->CopiedToLogicJccCode = Here ;
                BI_Set_setTtnn ( bi, TTT_ZERO, NEGFLAG_ON, TTT_ZERO, NEGFLAG_OFF ) ;
            }
#if 1        
            else if ( ( bi->LogicCodeWord->CAttribute & CATEGORY_OP_1_ARG ) && ( bi->LogicCodeWord->CAttribute2 & LOGIC_NEGATE ) )
            {
                SetHere ( bi->LogicCodeWord->Coding, 1 ) ;
                Compiler_Word_SetCodingHere_And_ClearPreviousUseOf_Here_SCA ( bi->LogicCodeWord, 0 ) ;
                _Compile_TestCode ( bi->LogicCodeWord->RegToUse, CELL ) ;
                bi->CopiedToLogicJccCode = Here ;
                BI_Set_setTtnn ( bi, TTT_ZERO, NEGFLAG_ON, TTT_ZERO, NEGFLAG_ON ) ;
                //BI_Set_setTtnn ( bi, TTT_ZERO, NEGFLAG_ON, TTT_ZERO, NEGFLAG_OFF ) ;
            }
            //if ( ! ( bi->LogicCodeWord->CAttribute2 & LOGIC_NEGATE ) ) BI_Set_setTtnn ( bi, TTT_ZERO, NEGFLAG_ON, TTT_ZERO, NEGFLAG_OFF ) ;
            //else BI_Set_setTtnn ( bi, TTT_ZERO, NEGFLAG_ON, TTT_ZERO, NEGFLAG_ON ) ;
#endif        
        }
        else
        {
            _Compile_GetTestLogicFromTOS ( bi ) ;
            bi->CopiedToLogicJccCode = Here ;
        }
    }
}

void
Block_CopyCompile ( byte * srcAddress, int64 bindex, Boolean jccFlag )
{
    Compiler * compiler = _Context_->Compiler0 ;
    BlockInfo *bi = ( BlockInfo * ) _Stack_Pick ( compiler->CombinatorBlockInfoStack, bindex ) ;
    BI_Block_Copy ( bi, Here, srcAddress, bi->bp_Last - bi->bp_First, 0 ) ; //nb!! 0 : turns off peephole optimization ; peephole optimization will be done in CfrTil_EndCombinator
    if ( jccFlag )
    {
        Compile_BlockLogicTest ( bi ) ;
        _BI_Compile_Jcc ( bi, 0 ) ;
        Stack_Push_PointerToJmpOffset ( ) ;
        bi->CopiedToEnd = Here ;
        bi->CopiedSize = bi->CopiedToEnd - bi->CopiedToStart ;
        //d1 ( if ( Is_DebugModeOn ) Debugger_Disassemble ( _Debugger_, ( byte* ) bi->CopiedToStart, bi->CopiedSize, 1 ) ) ;
    }
}

// a 'block' is merely a notation borrowed from C
// for a pointer to an anonymous subroutine 'call'

void
CfrTil_TurnOffBlockCompiler ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    if ( ! GetState ( compiler, LISP_MODE ) ) CfrTil_LeftBracket ( ) ;
    _CfrTil_RemoveNamespaceFromUsingListAndClear ( ( byte* ) "__labels__" ) ;
    Namespace_RemoveNamespacesStack ( compiler->LocalsCompilingNamespacesStack ) ;   
    SetState ( compiler, COMPILE_MODE|VARIABLE_FRAME, false ) ;
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
_CfrTil_BeginBlock0 ( Boolean compileJumpFlag, byte * here )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    BlockInfo *bi = BlockInfo_New ( ) ;
    if ( ( ! CompileMode ) || ( ! Compiler_BlockLevel ( compiler ) ) )// first block
    {
        CheckCodeSpaceForRoom ( ) ;
        _CfrTil_->CurrentWordBeingCompiled = compiler->CurrentCreatedWord ;
        CfrTil_TurnOnBlockCompiler ( ) ;
    }
    compiler->LHS_Word = 0 ;
    bi->OriginalActualCodeStart = here ? here : Here ;
    if ( compileJumpFlag ) _Compile_UninitializedJump ( ) ;
    bi->JumpOffset = here ? here - INT32_SIZE : Here - INT32_SIZE ; // before CfrTil_CheckCompileLocalFrame after CompileUninitializedJump
    Stack_Push_PointerToJmpOffset ( ) ;
    bi->bp_First = here ? here : Here ; // after the jump for inlining
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
    //compiler->LHS_Word = 0 ;
}

void
_CfrTil_BeginBlock ( Boolean compileJumpFlag, byte * here )
{
    BlockInfo * bi = _CfrTil_BeginBlock0 ( compileJumpFlag, here ) ;
    _CfrTil_BeginBlock1 ( bi ) ;
    _CfrTil_BeginBlock2 ( bi ) ;
}

void
CfrTil_BeginBlock ( )
{
    _CfrTil_BeginBlock ( 1, 0 ) ;
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
    Compiler_CalculateAndSetPreviousJmpOffset ( compiler, bi->JumpOffset ) ;
    _SetOffsetForCallOrJump ( bi->JumpOffset, Here ) ;
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

