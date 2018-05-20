#include "../../include/cfrtil64.h"

void
_Block_Eval ( block blck )
{
    if ( blck )
    {
        //GetTestRsp_Block () ;
        ( ( block ) blck ) ( ) ;
    }
}

void
_Block_Eval_AdjustRSP ( block blck )
{
    _CfrTil_->CallReg_AdjustRSP ( ) ;
}

void
_Block_Copy ( byte * srcAddress, int64 bsize, int8 optFlag )
{
    byte * saveHere = Here, * saveAddress = srcAddress ;
    ud_t * ud = Debugger_UdisInit ( _Debugger_ ) ;
    int64 isize, left ;

    for ( left = bsize ; left > 0 ; srcAddress += isize )
    {
        byte * here = Here ;
        PeepHole_Optimize ( ) ;
        isize = _Udis_GetInstructionSize ( ud, srcAddress ) ;
        left -= isize ;
        _CfrTil_AdjustDbgSourceCodeAddress ( srcAddress, Here ) ;
        //d1 ( if ( Is_DebugModeOn ) _DWL_ShowList ( _Compiler_->WordList, 0 ) ) ;
        _CfrTil_AdjustLabels ( srcAddress ) ;
        if ( * srcAddress == _RET ) // don't include RET
        {
            if ( left && ( ( * srcAddress + 1 ) != NOOP ) ) //  noop from our logic overwrite
            {
                // ?? unable at present to compile inline with more than one return in the block
                SetHere ( saveHere ) ;
                Compile_Call ( saveAddress ) ;
            }
            break ; // don't include RET
        }
        else if ( * srcAddress == CALLI32 )
        {
            int32 offset = * ( int32* ) ( srcAddress + 1 ) ; // 1 : 1 byte opCode
            if ( ! offset )
            {
                dllist_Map1 ( _Context_->Compiler0->GotoList, ( MapFunction1 ) AdjustJmpOffsetPointer, ( int64 ) ( srcAddress + 1 ) ) ;
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
            int64 offset = * ( int32* ) ( srcAddress + 1 ) ; // 1 : 1 byte opCode
            if ( offset != 0 )
            {
                dllist_Map1 ( _Context_->Compiler0->GotoList, ( MapFunction1 ) AdjustJmpOffsetPointer, ( int64 ) ( srcAddress + 1 ) ) ;
            }
            else //if ( offset == 0 ) //signature of a goto point
            {
                if ( optFlag ) continue ; // don't copy a jmp 0 offset
                dllist_Map1 ( _Context_->Compiler0->GotoList, ( MapFunction1 ) _AdjustGotoInfo, ( int64 ) srcAddress ) ; //, ( int64 ) end ) ;

            }
        }
        _CompileN ( srcAddress, isize ) ; // memcpy ( dstAddress, address, size ) ;
        d0 ( if ( Is_DebugModeOn ) _Debugger_Disassemble ( _Debugger_, ( byte* ) here, Here - here, 1 ) ) ;
    }
}

// nb : only blocks with one ret insn can be successfully compiled inline

int64
Block_CopyCompile_WithLogicFlag ( byte * srcAddress, int64 bindex, Boolean jccFlag, Boolean negFlag )
{
    Compiler * compiler = _Context_->Compiler0 ;
    int64 jccFlag2 ;
    byte * start = Here ;
    BlockInfo *bi = ( BlockInfo * ) _Stack_Pick ( compiler->CombinatorBlockInfoStack, bindex ) ; // -1 : remember - stack is zero based ; stack[0] is top
    if ( jccFlag )
    {
        jccFlag2 = Compile_CheckReConfigureLogicInBlock ( bi, 1 ) ;
    }
    _Block_Copy ( srcAddress, bi->bp_Last - bi->bp_First, 0 ) ;
    if ( jccFlag )
    {
        //_DBI_ON ;
        if ( jccFlag2 )
        {
#if 1          
            if ( bi->JccLogicCodeForNot )
            {
                SetHere ( start + ( bi->JccLogicCodeForNot - bi->Start ) ) ;
                Compile_JCC ( negFlag ? Z : NZ, bi->Ttt, 0 ) ;
            }
            else Compile_JCC ( negFlag ? bi->NegFlag : ! bi->NegFlag, bi->Ttt, 0 ) ;
#else
            Compile_JCC ( negFlag ? bi->NegFlag : ! bi->NegFlag, bi->Ttt, 0 ) ;
#endif           
        }
        else
        {
            Compile_GetLogicFromTOS ( bi, start ) ;
            Compile_JCC ( negFlag, ZERO_TTT, 0 ) ;
        }
        Stack_PointerToJmpOffset_Set ( ) ;
        //DBI_OFF ;
    }
    return 1 ;
}

int64
Block_CopyCompile ( byte * srcAddress, int64 bindex, int64 jccFlag )
{
    return Block_CopyCompile_WithLogicFlag ( srcAddress, bindex, jccFlag, 0 ) ;
}

void
Block_Copy ( byte * dst, byte * src, int64 qsize )
{
    SetHere ( dst ) ;
    _Block_Copy ( src, qsize, 0 ) ;
}

// 'tttn' is a notation from the intel manuals

void
BlockInfo_Set_tttn ( BlockInfo * bi, int8 ttt, int8 negFlag, int8 overWriteSize )
{
    //if ( ! GetState ( _Context_, C_SYNTAX ) ) bi->LogicCodeWord = Compiler_WordList ( 1 ) ;
    bi->Ttt = ttt ;
    bi->NegFlag = negFlag ;
    bi->OverWriteSize = 6 ; //6 : add r14, 08  ; mov [r1], rax :=: 6 bytes
    bi->JccLogicCode = Here ; // used by combinators
}

BlockInfo *
BlockInfo_Setup_BI_tttn ( Compiler * compiler, int8 ttt, int8 negFlag, int8 overWriteSize )
{
    BlockInfo *bi = ( BlockInfo * ) _Stack_Top ( compiler->CombinatorBlockInfoStack ) ;
    if ( bi )
    {
        BlockInfo_Set_tttn ( bi, ttt, negFlag, overWriteSize ) ;
    }
    return bi ;
}

// a 'block' is merely a notation borrowed from C
// for a pointer to an anonymous subroutine 'call'

void
CfrTil_TurnOffBlockCompiler ( )
{
    SetState ( _Context_->Compiler0, COMPILE_MODE, false ) ;
    _Compiler_FreeAllLocalsNamespaces ( _Context_->Compiler0 ) ;
    _CfrTil_RemoveNamespaceFromUsingListAndClear ( ( byte* ) "__labels__" ) ;
    SetState ( _Context_->Compiler0, VARIABLE_FRAME, false ) ;
}

void
CfrTil_TurnOnBlockCompiler ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    SetState ( compiler, COMPILE_MODE, true ) ;
    Compiler_WordList_RecycleInit ( compiler ) ;
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
    Compiler * compiler = _Context_->Compiler0 ;
    if ( _Stack_IsEmpty ( compiler->BlockStack ) )
    {
        // remember : we always jmp around the blocks to the combinator ; the combinator sees the blocks on the stack and uses them otherwise they are lost
        // the jmps are optimized out so the word->Definition is a call to the first combinator
        // we always add a frame and if not needed move the blocks to overwrite the extra code
        bi->FrameStart = Here ; // before _Compile_AddLocalFrame
        _Compiler_AddLocalFrame ( compiler ) ; // cf EndBlock : if frame is not needed we use BI_Start else BI_FrameStart -- ?? could waste some code space ??
        if ( compiler->NumberOfRegisterVariables ) Compile_InitRegisterParamenterVariables ( compiler ) ; // this function is called twice to deal with words that have locals before the first block and regular colon words
    }
    bi->Start = bi->AfterFrame = Here ; // after _Compiler_AddLocalFrame and Compile_InitRegisterVariables
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
    //Compiler * compiler = _Context_->Compiler0 ;
    //d1 ( if ( Is_DebugOn ) _Printf ( ( byte* ) "\n\nCfrTil_BeginBlock : %s : blockStack depth = %d : %s\n\n", _Context_->CurrentlyRunningWord->Name, _Stack_Depth ( compiler->BlockStack ), Context_Location ( ) ) ) ;
    //d1 ( _Printf ( ( byte* ) "\n\nentering CfrTil_BeginBlock : %s : blockStack depth = %d : %s\n\n", _Context_->CurrentlyRunningWord->Name, _Stack_Depth ( compiler->BlockStack ), Context_Location ( ) ) ) ;
    CheckCodeSpaceForRoom ( ) ;
    BlockInfo * bi = _CfrTil_BeginBlock0 ( ) ;
    _CfrTil_BeginBlock1 ( bi ) ;
    _CfrTil_BeginBlock2 ( bi ) ;
}

Boolean
_Compiler_IsFrameNecessary ( Compiler * compiler )
{
    //return ( compiler->NumberOfLocals + compiler->NumberOfArgs ) > compiler->NumberOfRegisterVariables ; 
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
            bi->bp_First = bi->FrameStart ; // include _Compile_Rsp_Save code
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
                        //_Compile_Move_Reg_To_Reg ( ACC, compiler->ReturnVariableWord->RegToUse ) ;
                        _Compile_Move_Reg_To_StackN ( DSP, 0, compiler->ReturnVariableWord->RegToUse ) ;
                    }
                    else
                    {
                        _Compile_GetVarLitObj_RValue_To_Reg ( compiler->ReturnVariableWord, ACC ) ;
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
        //d1 ( if ( Is_DebugOn) _Compile_Stack_Drop ( DSP ) ) ; // debugger->DebugAddress pushed on call
        //_Block_Copy ( bi->bp_First, Here - bi->bp_First, 0 ) ; // would like to copy so we can optimze if no combinators in a word

    }
    _Compile_Return ( ) ;
    DataStack_Push ( ( int64 ) bi->bp_First ) ;
    bi->bp_Last = Here ;
    CfrTil_CalculateAndSetPreviousJmpOffset ( bi->JumpOffset ) ;
    _SetOffsetForCallOrJump ( bi->JumpOffset, Here ) ;
}

byte *
_CfrTil_EndBlock2 ( BlockInfo * bi )
{
    Compiler * compiler = _Context_->Compiler0 ;
    compiler->BlockLevel -- ;
    byte * first = bi->bp_First ;
    if ( ! _Stack_Depth ( compiler->BlockStack ) )
    {
        _CfrTil_InstallGotoCallPoints_Keyed ( bi, GI_GOTO | GI_RECURSE ) ;
        CfrTil_TurnOffBlockCompiler ( ) ;
        Compiler_Init ( compiler, 0 ) ;
        //d0 ( if ( Is_DebugOn ) _Printf ( ( byte* ) "\n\nleaving _CfrTil_EndBlock2 : blockStack depth = %d : %s : %s\n\n", _Stack_Depth ( compiler->BlockStack ), _Context_->CurrentlyRunningWord->Name, Context_Location ( ) ) ) ;
        //d1 ( _Printf ( ( byte* ) "\n\nleaving _CfrTil_EndBlock2 : blockStack depth = %d : %s : %s\n\n", _Stack_Depth ( compiler->BlockStack ), _Context_->CurrentlyRunningWord->Name, Context_Location ( ) ) ) ;
    }
    else
    {
        //d0 ( if ( Is_DebugOn ) _Printf ( ( byte* ) "\n\nleaving _CfrTil_EndBlock2 : blockStack depth = %d : %s : %s\n\n", _Stack_Depth ( compiler->BlockStack ), _Context_->CurrentlyRunningWord->Name, Context_Location ( ) ) ) ;
        //d1 ( _Printf ( ( byte* ) "\n\nleaving _CfrTil_EndBlock2 : blockStack depth = %d : %s : %s\n\n", _Stack_Depth ( compiler->BlockStack ), _Context_->CurrentlyRunningWord->Name, Context_Location ( ) ) ) ;
        _Namespace_RemoveFromUsingListAndClear ( bi->LocalsNamespace ) ; //_Compiler_FreeBlockInfoLocalsNamespace ( bi, compiler ) ;
    }
    return first ;
}

byte *
_CfrTil_EndBlock ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    //d1 ( if ( Is_DebugOn ) _Printf ( ( byte* ) "\n\nCfrTil_EndBlock : %s : blockStack depth = %d : %s\n\n", _Context_->CurrentlyRunningWord->Name, _Stack_Depth ( compiler->BlockStack ), Context_Location ( ) ) ) ;
    //d1 ( _Printf ( ( byte* ) "\n\nentering CfrTil_EndBlock : %s : blockStack depth = %d : %s\n\n", _Context_->CurrentlyRunningWord->Name, _Stack_Depth ( compiler->BlockStack ), Context_Location ( ) ) ) ;
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

