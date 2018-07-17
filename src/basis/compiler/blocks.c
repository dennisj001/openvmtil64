#include "../../include/cfrtil64.h"

void
_Block_Eval ( block blck )
{
    ( ( block ) blck ) ( ) ;
}

void
Block_Eval ( block blck )
{
    if ( blck )
    {
        ( ( block ) blck ) ( ) ;
    }
}

void
BI_Block_Copy (BlockInfo * bi, byte* dstAddress, byte * srcAddress, int64 bsize, int8 optFlag )
{
    Compiler * compiler = _Compiler_ ;
    if ( ! bi ) bi = ( BlockInfo * ) _Stack_Top ( compiler->CombinatorBlockInfoStack ) ;
    byte * saveHere = Here, * saveAddress = srcAddress ;
    ud_t * ud = Debugger_UdisInit ( _Debugger_ ) ;
    int64 isize, left ;
    if ( dstAddress ) SetHere ( dstAddress ) ;
    bi->CopiedToStart = Here ;
    for ( left = bsize ; ( left > 0 ) ; srcAddress += isize )
    {
        byte * here = Here ;
        PeepHole_Optimize ( ) ;
        isize = _Udis_GetInstructionSize ( ud, srcAddress ) ;
        left -= isize ;
        _CfrTil_AdjustDbgSourceCodeAddress ( srcAddress, Here ) ;
        //d1 ( if ( Is_DebugModeOn ) _DWL_ShowList ( _Compiler_->WordList, 0 ) ) ;
        _CfrTil_AdjustLabels ( srcAddress ) ;
        if ( * srcAddress == _RET )
        {
            if ( ( left > 0 ) && ( ( * srcAddress + 1 ) != NOOP ) ) //  noop from our logic overwrite
            {
                // ?? unable at present to compile inline with more than one return in the block
                SetHere ( saveHere ) ;
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
            if ( offset )
            {
                dllist_Map1 ( compiler->GotoList, ( MapFunction1 ) AdjustJmpOffsetPointer, ( int64 ) ( srcAddress + 1 ) ) ;
            }
            else //if ( offset == 0 ) //signature of a goto point
            {
                if ( optFlag ) continue ; // don't copy a jmp 0 offset
                dllist_Map1 ( compiler->GotoList, ( MapFunction1 ) _AdjustGotoInfo, ( int64 ) srcAddress ) ; //, ( int64 ) end ) ;

            }
        }
        _CompileN ( srcAddress, isize ) ; // memcpy ( dstAddress, address, size ) ;
        //_CfrTil_AdjustDbgSourceCodeAddress ( srcAddress, Here ) ;
        d0 ( if ( Is_DebugModeOn ) _Debugger_Disassemble ( _Debugger_, ( byte* ) here, Here - here, 1 ) ) ;
    }
    bi->CopiedToEnd = Here ;
    bi->CopiedSize = bi->CopiedToEnd - bi->CopiedToStart ;
    _Debugger_Disassemble ( _Debugger_, ( byte* ) bi->CopiedToStart, bi->CopiedSize, 1 ) ;
}

void
Compile_BlockLogicTest ( BlockInfo * bi ) // , byte * start )
{
    int64 diff ;
    Word_Set_SCA ( bi->LogicCodeWord ) ;
    if ( bi && ( bi->JccLogicCode || ( bi->LogicCodeWord && bi->LogicCodeWord->StackPushRegisterCode ) ) )
    {
        if ( ! bi->JccLogicCode )
        {
            bi->JccLogicCode = bi->LogicCodeWord->StackPushRegisterCode ;
        }
        diff = bi->JccLogicCode - bi->bp_First ;
        bi->CopiedToLogicJccCode = bi->CopiedToStart + diff ;
        SetHere ( bi->CopiedToLogicJccCode ) ; 
        if ( ! ( bi->LogicCodeWord->CAttribute & CATEGORY_LOGIC ) ) _Compile_TestCode ( bi->LogicCodeWord->RegToUse, CELL ) ;
        //d1 ( if ( Is_DebugOn ) _Debugger_Disassemble ( _Debugger_, ( byte* ) bi->JccLogicCode, Here - bi->JccLogicCode, 0 ) ) ;
    }
    else
    {
        _Compile_GetTestLogicFromTOS ( bi ) ;
        SetHere ( bi->CopiedToLogicJccCode ) ; 
    }
}

void
Block_CopyCompile ( byte * srcAddress, int64 bindex, Boolean jccFlag )
{
    Compiler * compiler = _Context_->Compiler0 ;
    //int64 depth = _Stack_Depth ( compiler->CombinatorBlockInfoStack ) ;
    BlockInfo *bi = ( BlockInfo * ) _Stack_Pick ( compiler->CombinatorBlockInfoStack, bindex ) ;
    BI_Block_Copy (bi, Here, srcAddress, bi->bp_Last - bi->bp_First, 0 ) ;
    //if ( Is_DebugModeOn ) 
    //_Debugger_Disassemble ( _Debugger_, ( byte* ) bi->CopiedToStart, bi->CopiedSize, 1 ) ;
    if ( jccFlag )
    {
        Compile_BlockLogicTest ( bi ) ;
        //bi->CopiedToLogicJccCode = Here ;
        _Compile_Jcc ( 0, ZERO_TTT, 0 ) ;
        Stack_PointerToJmpOffset_Set ( ) ;
        bi->CopiedToEnd = Here ;
        bi->CopiedSize = bi->CopiedToEnd - bi->CopiedToStart ;
        //if ( Is_DebugModeOn ) 
        _Debugger_Disassemble ( _Debugger_, ( byte* ) bi->CopiedToStart, bi->CopiedSize, 1 ) ;
    }
}

// a 'block' is merely a notation borrowed from C
// for a pointer to an anonymous subroutine 'call'

void
CfrTil_TurnOffBlockCompiler ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    if ( ! GetState ( compiler, LISP_MODE ) ) CfrTil_LeftBracket ( ) ;
    _Compiler_FreeAllLocalsNamespaces ( compiler ) ;
    _CfrTil_RemoveNamespaceFromUsingListAndClear ( ( byte* ) "__labels__" ) ;
    SetState ( compiler, VARIABLE_FRAME, false ) ;
}

void
CfrTil_TurnOnBlockCompiler ( )
{
    CfrTil_RightBracket ( ) ;
    Compiler_WordList_RecycleInit ( _Context_->Compiler0 ) ;
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
    Compiler * compiler = _Context_->Compiler0 ;
    BlockInfo *bi = ( BlockInfo * ) Mem_Allocate ( sizeof (BlockInfo ), COMPILER_TEMP ) ;
    if ( ! compiler->BlockLevel ) compiler->CurrentWordCompiling = compiler->CurrentWord ;
    compiler->BlockLevel ++ ;
    if ( ! CompileMode ) // first block
    {
        CfrTil_TurnOnBlockCompiler ( ) ;
    }
    bi->ActualCodeStart = Here ;
    _Compile_UninitializedJump ( ) ;
    bi->JumpOffset = Here - INT32_SIZE ; // before CfrTil_CheckCompileLocalFrame after CompileUninitializedJump
    Stack_PointerToJmpOffset_Set ( ) ;
    bi->bp_First = Here ; // after the jump for inlining

    return bi ;
}

BlockInfo *
_CfrTil_BeginBlock1 ( BlockInfo * bi )
{
    Set_SCA ( 0 ) ;
    Compiler * compiler = _Context_->Compiler0 ;
    if ( _Stack_IsEmpty ( compiler->BlockStack ) )
    {
        // remember : we always jmp around the blocks to the combinator ; the combinator sees the blocks on the stack and uses them otherwise they are lost
        // the jmps are optimized out so the word->Definition is a call to the first combinator
        // we always add a frame and if not needed move the blocks to overwrite the extra code
        bi->LocalFrameStart = Here ; // before _Compile_AddLocalFrame
        _Compiler_AddLocalFrame ( compiler ) ; // cf EndBlock : if frame is not needed we use BI_Start else BI_FrameStart -- ?? could waste some code space ??
        if ( compiler->NumberOfRegisterVariables ) Compile_InitRegisterParamenterVariables ( compiler ) ; // this function is called twice to deal with words that have locals before the first block and regular colon words
    }
    bi->Start = bi->AfterLocalFrame = Here ; // after _Compiler_AddLocalFrame and Compile_InitRegisterVariables

    return bi ;
}

BlockInfo *
_CfrTil_BeginBlock2 ( BlockInfo * bi )
{
    Compiler * compiler = _Context_->Compiler0 ;
    _Stack_Push ( compiler->BlockStack, ( int64 ) bi ) ; // _Context->CompileSpace->IndexStart before set frame size after turn on
    _Stack_Push ( compiler->CombinatorBlockInfoStack, ( int64 ) bi ) ; // _Context->CompileSpace->IndexStart before set frame size after turn on
    compiler->LHS_Word = 0 ;
}

void
CfrTil_BeginBlock ( )
{
    CheckCodeSpaceForRoom ( ) ;
    BlockInfo * bi = _CfrTil_BeginBlock0 ( ) ;
    _CfrTil_BeginBlock1 ( bi ) ;
    _CfrTil_BeginBlock2 ( bi ) ;
}

Boolean
_Compiler_IsFrameNecessary ( Compiler * compiler )
{
    return ( compiler->NumberOfLocals + compiler->NumberOfArgs ) > ( compiler->NumberOfRegisterLocals + compiler->NumberOfRegisterArgs ) ;
}

void
_CfrTil_EndBlock1 ( BlockInfo * bi )
{
    Compiler * compiler = _Context_->Compiler0 ;
    if ( ! _Stack_Depth ( compiler->BlockStack ) )
    {
        _CfrTil_InstallGotoCallPoints_Keyed ( bi, GI_RETURN ) ;
        if ( _Compiler_IsFrameNecessary ( compiler ) && ( ! GetState ( compiler, DONT_REMOVE_STACK_VARIABLES ) ) )
        {
            _Compiler_RemoveLocalFrame ( compiler ) ;
            bi->bp_First = bi->LocalFrameStart ; // include _Compile_Rsp_Save code
        }
        else if ( compiler->NumberOfRegisterVariables )
        {
            if ( compiler->NumberOfRegisterVariables >= ( compiler->NumberOfArgs + compiler->NumberOfLocals ) ) bi->bp_First = bi->Start ;
            if ( compiler->ReturnVariableWord )
            {

                if ( compiler->ReturnVariableWord )
                {
                    if ( compiler->ReturnVariableWord->CAttribute & REGISTER_VARIABLE )
                    {
                        _Compile_Move_Reg_To_StackN ( DSP, 0, compiler->ReturnVariableWord->RegToUse ) ;
                    }
                    else
                    {
                        Compile_GetVarLitObj_RValue_To_Reg ( compiler->ReturnVariableWord, ACC ) ;
                        Compile_Move_ACC_To_TOS ( DSP ) ;
                    }
                }
            }
            else if ( GetState ( compiler, RETURN_ACCUM ) || GetState ( compiler, RETURN_TOS ) )
            {
                Compile_Move_ACC_To_TOS ( DSP ) ;
            }
        }
        else
        {

            bi->bp_First = bi->Start ; //bi->AfterFrame ; 
        }
    }
    _Compile_Return ( ) ;
    DataStack_Push ( ( int64 ) bi->bp_First ) ;
    bi->bp_Last = Here ;
    Compiler_CalculateAndSetPreviousJmpOffset ( compiler, bi->JumpOffset ) ;
    _SetOffsetForCallOrJump ( bi->JumpOffset, Here ) ;
}

byte *
_CfrTil_EndBlock2 ( BlockInfo * bi )
{
    Set_SCA ( 0 ) ;
    Compiler * compiler = _Context_->Compiler0 ;
    compiler->BlockLevel -- ;
    byte * first = bi->bp_First ;
    if ( ! _Stack_Depth ( compiler->BlockStack ) )
    {
        _CfrTil_InstallGotoCallPoints_Keyed ( bi, GI_GOTO | GI_RECURSE ) ;
#if TESTING        
        BI_Block_Copy ( bi, bi->bp_First, bi->bp_First, Here - bi->bp_First, 2 ) ; // 2 : retFlag will include '_' (dropped blocks) with a 'ret' : final optimization and for PeepHoleOptimize
#endif        
        CfrTil_TurnOffBlockCompiler ( ) ;
        Compiler_Init ( compiler, 0 ) ;
    }
    else
    {
        _Namespace_RemoveFromUsingListAndClear ( bi->LocalsNamespace ) ; //_Compiler_FreeBlockInfoLocalsNamespace ( bi, compiler ) ;
    }
    return first ;
}

byte *
_CfrTil_EndBlock ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    BlockInfo * bi = ( BlockInfo * ) Stack_Pop_WithExceptionOnEmpty ( compiler->BlockStack ) ;
    if ( ! GetState ( _Context_, C_SYNTAX ) ) bi->LogicCodeWord = _Compiler_WordList ( compiler, 1 ) ;
    _CfrTil_EndBlock1 ( bi ) ;
    byte * blockStart = _CfrTil_EndBlock2 ( bi ) ;
    return blockStart ;
}

void
CfrTil_EndBlock ( )
{
    _CfrTil_EndBlock ( ) ;
}

