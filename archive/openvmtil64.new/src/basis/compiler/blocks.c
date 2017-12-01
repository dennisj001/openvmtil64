#include "../../include/cfrtil64.h"

#if 0

void
Cpu_CheckRspForWordAlignment ( byte * prefix )
{
    //d1 (
    if ( _CfrTil_->SaveSelectedCpuState )
    {
        _CfrTil_->SaveSelectedCpuState ( ) ;
        if ( ( uint64 ) _CfrTil_->cs_Cpu->Rsp & ( uint64 ) 0x7 )
            _Printf ( ( byte* ) "\nUnaligned :: %s : Rsp = %lx : Word = \'%s\' at %s", prefix, _CfrTil_->cs_Cpu->Rsp, _Context_->CurrentlyRunningWord ? _Context_->CurrentlyRunningWord->Name : ( byte* ) "", Context_Location ( ) ) ; //= (uint64*) ((uint64) _CfrTil_->cs_Cpu->Rsp & ( uint64 ) 0xfffffffffffffff0) ;
        else _Printf ( ( byte* ) "\nAligned  ::  %s : Rsp = %lx : Word = \'%s\' at %s", prefix, _CfrTil_->cs_Cpu->Rsp, _Context_->CurrentlyRunningWord ? _Context_->CurrentlyRunningWord->Name : ( byte* ) "", Context_Location ( ) ) ; //= (uint64*) ((uint64) _CfrTil_->cs_Cpu->Rsp & ( uint64 ) 0xfffffffffffffff0) ;
    }
    //    ) ;
}
#endif

void
Byte_PtrCall ( byte * bptr )
{
    if ( bptr )
    {
        ( ( block ) bptr ) ( ) ;
    }
}

void
_Block_Eval ( block blck )
{
    Byte_PtrCall ( ( byte * ) blck ) ;
}
#if 1
void
_Block_Copy ( byte * srcAddress, int64 bsize, Boolean includeReturnFlag )
{
    byte * saveHere = Here, * saveAddress = srcAddress ;
    ud_t * ud = Debugger_UdisInit ( _Debugger_ ) ;
    //_Debugger_->PreHere = Here ;
    int64 isize, left ;
    //byte mov_rax_rbx__sub_rbx_0x8 [ ] = { 0x48, 0x8b, 0x03, 0x48, 0x83, 0xeb, 0x08, 0x48 } ;
    //byte add_rbx_0x8__mov_r9 [ ] = { 0x48, 0x83, 0xc3, 0x08, 0x49, 0xb9 } ;
    byte add_rbx_0x8__mov_r8 [ ] = { 0x48, 0x83, 0xc3, 0x08, 0x49, 0xb8 } ;
    byte mov_rax_rbx__sub_rbx_0x8 [] = { 0x48, 0x8b, 0x03, 0x48, 0x83, 0xeb, 0x08 } ;

    for ( left = bsize ; left > 0 ; srcAddress += isize )
    {
        PeepHole_Optimize ( ) ;
        isize = _Udis_GetInstructionSize ( ud, srcAddress ) ;
        left -= isize ;
        _CfrTil_AdjustDbgSourceCodeAddress ( srcAddress, Here ) ;
        if ( ! memcmp ( mov_rax_rbx__sub_rbx_0x8, srcAddress, 7 ) )
        {
            //_Printf ( (byte*) "\ngot one\n") ;
            if ( includeReturnFlag )
                _CompileN ( srcAddress, 13 ) ; // 
            else SetHere ( Here - 13 ) ;
            break ; // don't include RET
        }
        else if ( ! memcmp ( add_rbx_0x8__mov_r8, srcAddress, 6 ) )
        {
            do
            {
                srcAddress += isize ;
                isize = _Udis_GetInstructionSize ( ud, srcAddress ) ;
                if ( ( isize == 5 ) && ( * srcAddress == JMPI32 ) )
                {
                    srcAddress += isize ;
                    left -= isize ;
                    break ;
                }
            }
            while ( ( left -= isize ) > 0 ) ;
            byte * jcAddress = JumpCallInstructionAddress ( srcAddress - isize ) ;
            Compile_Call ( jcAddress ) ;
            isize = 0 ; // adjust for end of for loop 
            continue ;
        }
        else if ( * srcAddress == _RET ) // don't include RET
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
#if 1                
                byte * jcAddress = JumpCallInstructionAddress ( srcAddress ) ;
                Word * word = Word_GetFromCodeAddress ( jcAddress ) ;
                if ( word )
                {
                    //_CfrTil_AdjustSourceCodeAddress ( jcAddress, Here ) ;
                    _Word_Compile ( word ) ;
                    continue ;
                }
                //else (drop to) _CompileN ( srcAddress, isize )
#else
                byte * jcAddress = JumpCallInstructionAddress ( srcAddress ) ;
#if 0            
                if ( 1 ) //_DBI )
                {
                    Word * word = Word_GetFromCodeAddress ( ( byte* ) jcAddress ) ;
                    if ( word ) _Printf ( ( byte* ) "\n_Compile_Call_CfrTilWord : word = %s : at %s", word ? word->Name : ( byte* ) "", Context_Location ( ) ) ;
                }
#endif            
                Compile_Call ( jcAddress ) ;
                continue ;
#endif                
            }
        }
        else if ( * srcAddress == JMPI32 )
        {
            int64 offset = * ( int32* ) ( srcAddress + 1 ) ; // 1 : 1 byte opCode
            if ( offset != 0 )
            {
                dllist_Map1 ( _Context_->Compiler0->GotoList, ( MapFunction1 ) AdjustJmpOffsetPointer, ( int64 ) ( srcAddress + 1 ) ) ;
#if 1                
                byte * jcAddress = JumpCallInstructionAddress ( srcAddress ) ;
                Word * word = Word_GetFromCodeAddress ( jcAddress ) ;
                if ( word )
                {
                    //_CfrTil_AdjustSourceCodeAddress ( jcAddress, Here ) ;
                    //_Word_Compile ( word ) ;
                    _Compile_Call ( ( byte* ) word->Definition ) ;
                    continue ;
                }
                //else (drop to) _CompileN ( srcAddress, isize )
#else                
                //_CompileN ( srcAddress, 1 ) ; // memcpy ( dstAddress, address, size ) ;
                //byte * jcAddress = JumpCallInstructionAddress ( srcAddress ) ;
                int32 disp = _CalculateOffsetForCallOrJump ( Here + 1, srcAddress, INT32_SIZE ) ;
                //_CompileN ( &disp, 4 ) ; // memcpy ( dstAddress, address, size ) ;
                byte * here = Here ;
                _Compile_Int8 ( JMPI32 ) ;
                _Compile_Int32 ( disp ) ;
                Debugger_UdisOneInstruction ( _Debugger_, here, ( byte* ) "\r", ( byte* ) "" ) ;
                continue ;
#endif                
            }
            else // if ( offset == 0 ) signature of a goto point
            {
                //_CfrTil_AdjustGotoPoint ( ( int64 ) srcAddress ) ;
                dllist_Map1 ( _Context_->Compiler0->GotoList, ( MapFunction1 ) _AdjustGotoInfo, ( int64 ) srcAddress ) ;

            }
        }
        _CompileN ( srcAddress, isize ) ; // memcpy ( dstAddress, address, size ) ;
    }
}

// nb : only blocks with one ret insn can be successfully compiled inline

void
Block_Copy ( byte * dst, byte * src, int64 qsize )
{
#if 0    
    if ( dst > src )
    {
        Error_Abort ( ( byte* ) "\nBlock_Copy :: Error : dst > src.\n" ) ;
    }
#endif    
    SetHere ( dst ) ;
    _Block_Copy ( src, qsize, 0 ) ;
}

int64
Block_CopyCompile_WithLogicFlag ( byte * srcAddress, int64 bindex, int64 jccFlag, int64 negFlag )
{
    Compiler * compiler = _Context_->Compiler0 ;
    int64 jccFlag2 ;
    BlockInfo *bi = ( BlockInfo * ) _Stack_Pick ( compiler->CombinatorBlockInfoStack, bindex ) ; // -1 : remember - stack is zero based ; stack[0] is top
    bi->ActualCodeStart = Here ;
    if ( jccFlag )
    {
        if ( ! ( _Q_->OVT_LC && GetState ( _Q_->OVT_LC, ( LC_COMPILE_MODE ) ) ) )
        {
            if ( bi->LiteralWord )//&& bi->LiteralWord->StackPushRegisterCode ) // leave value in ACCUM, don't push it
            {
                if ( bi->LiteralWord->W_Value != 0 )
                {
                    return 1 ; // nothing need to be compiled 
                }
                // else somehow don't use this block at all ie. eliminate the dead code and don't just ...
                return 0 ; // TODO : don't use the block/combinator
            }
        }
        jccFlag2 = Compile_CheckReConfigureLogicInBlock ( bi, 1 ) ;
    }
    if ( ! GetState ( _CfrTil_, INLINE_ON ) ) Compile_Call ( srcAddress ) ;
    else
    {
        _Block_Copy ( srcAddress, bi->bp_Last - bi->bp_First, jccFlag2 ) ;
    }
    if ( jccFlag )
    {
        Word * svcrw = _Context_->CurrentlyRunningWord ;
        _Context_->CurrentlyRunningWord = _Context_->SC_CurrentCombinator ;
        DBI_ON ;
        if ( jccFlag2 )
        {
            Compile_JCC ( negFlag ? bi->NegFlag : ! bi->NegFlag, bi->Ttt, 0 ) ;
        }
        else
        {
#if 0            
            if ( bi->LogicCodeWord && bi->LogicCodeWord->StackPushRegisterCode )
            {
                SetHere ( bi->LogicCodeWord->StackPushRegisterCode ) ;
            }
            else Compile_Pop_To_Acc ( DSP ) ;
            _Compile_TEST_Reg_To_Reg ( ACC, ACC ) ;
#else            
            Compile_GetLogicFromTOS ( bi ) ;
#endif            
            Compile_JCC ( negFlag, ZERO_TTT, 0 ) ;
        }
        DBI_OFF ;
        _Context_->CurrentlyRunningWord = svcrw ;
        _Stack_PointerToJmpOffset_Set ( Here - INT32_SIZE ) ;
    }
    return 1 ;
}

int64
Block_CopyCompile ( byte * srcAddress, int64 bindex, int64 jccFlag )
{
    return Block_CopyCompile_WithLogicFlag ( srcAddress, bindex, jccFlag, 0 ) ;
}
#else
void
_Block_Copy ( byte * srcAddress, int64 bsize )
{
    byte * saveHere = Here, * saveAddress = srcAddress ;
    ud_t * ud = Debugger_UdisInit ( _Debugger_ ) ;
    //_Debugger_->PreHere = Here ;
    int64 isize, left ;
    //byte mov_rax_rbx__sub_rbx_0x8 [ ] = { 0x48, 0x8b, 0x03, 0x48, 0x83, 0xeb, 0x08, 0x48 } ;
    //byte add_rbx_0x8__mov_r9 [ ] = { 0x48, 0x83, 0xc3, 0x08, 0x49, 0xb9 } ;
    byte add_rbx_0x8__mov_r8 [ ] = { 0x48, 0x83, 0xc3, 0x08, 0x49, 0xb8 } ;
    byte mov_rax_rbx__sub_rbx_0x8 [] = { 0x48, 0x8b, 0x03, 0x48, 0x83, 0xeb, 0x08 } ;

    for ( left = bsize ; left > 0 ; srcAddress += isize )
    {
        PeepHole_Optimize ( ) ;
        isize = _Udis_GetInstructionSize ( ud, srcAddress ) ;
        left -= isize ;
        _CfrTil_AdjustDbgSourceCodeAddress ( srcAddress, Here ) ;
        if ( ! memcmp ( mov_rax_rbx__sub_rbx_0x8, srcAddress, 7 ) )
        {
            //_Printf ( (byte*) "\ngot one\n") ;
            //if ( includeReturnFlag )  _CompileN ( srcAddress, 13 ) ; // 
            //else 
            SetHere ( Here - 13 ) ;
            break ; // don't include RET
        }
        else if ( ! memcmp ( add_rbx_0x8__mov_r8, srcAddress, 6 ) )
        {
            do
            {
                srcAddress += isize ;
                isize = _Udis_GetInstructionSize ( ud, srcAddress ) ;
                if ( ( isize == 5 ) && ( * srcAddress == JMPI32 ) )
                {
                    srcAddress += isize ;
                    left -= isize ;
                    break ;
                }
            }
            while ( ( left -= isize ) > 0 ) ;
            byte * jcAddress = JumpCallInstructionAddress ( srcAddress - isize ) ;
            Compile_Call ( jcAddress ) ;
            isize = 0 ; // adjust for end of for loop 
            continue ;
        }
        else if ( * srcAddress == _RET ) // don't include RET
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
#if 1                
                byte * jcAddress = JumpCallInstructionAddress ( srcAddress ) ;
                Word * word = Word_GetFromCodeAddress ( jcAddress ) ;
                if ( word )
                {
                    //_CfrTil_AdjustSourceCodeAddress ( jcAddress, Here ) ;
                    _Word_Compile ( word ) ;
                    continue ;
                }
                //else (drop to) _CompileN ( srcAddress, isize )
#else
                byte * jcAddress = JumpCallInstructionAddress ( srcAddress ) ;
#if 0            
                if ( 1 ) //_DBI )
                {
                    Word * word = Word_GetFromCodeAddress ( ( byte* ) jcAddress ) ;
                    if ( word ) _Printf ( ( byte* ) "\n_Compile_Call_CfrTilWord : word = %s : at %s", word ? word->Name : ( byte* ) "", Context_Location ( ) ) ;
                }
#endif            
                Compile_Call ( jcAddress ) ;
                continue ;
#endif                
            }
        }
        else if ( * srcAddress == JMPI32 )
        {
            int64 offset = * ( int32* ) ( srcAddress + 1 ) ; // 1 : 1 byte opCode
            if ( offset != 0 )
            {
                dllist_Map1 ( _Context_->Compiler0->GotoList, ( MapFunction1 ) AdjustJmpOffsetPointer, ( int64 ) ( srcAddress + 1 ) ) ;
#if 1                
                byte * jcAddress = JumpCallInstructionAddress ( srcAddress ) ;
                Word * word = Word_GetFromCodeAddress ( jcAddress ) ;
                if ( word )
                {
                    //_CfrTil_AdjustSourceCodeAddress ( jcAddress, Here ) ;
                    //_Word_Compile ( word ) ;
                    _Compile_Call ( ( byte* ) word->Definition ) ;
                    continue ;
                }
                //else (drop to) _CompileN ( srcAddress, isize )
#else                
                //_CompileN ( srcAddress, 1 ) ; // memcpy ( dstAddress, address, size ) ;
                //byte * jcAddress = JumpCallInstructionAddress ( srcAddress ) ;
                int32 disp = _CalculateOffsetForCallOrJump ( Here + 1, srcAddress, INT32_SIZE ) ;
                //_CompileN ( &disp, 4 ) ; // memcpy ( dstAddress, address, size ) ;
                byte * here = Here ;
                _Compile_Int8 ( JMPI32 ) ;
                _Compile_Int32 ( disp ) ;
                Debugger_UdisOneInstruction ( _Debugger_, here, ( byte* ) "\r", ( byte* ) "" ) ;
                continue ;
#endif                
            }
            else // if ( offset == 0 ) signature of a goto point
            {
                //_CfrTil_AdjustGotoPoint ( ( int64 ) srcAddress ) ;
                dllist_Map1 ( _Context_->Compiler0->GotoList, ( MapFunction1 ) _AdjustGotoInfo, ( int64 ) srcAddress ) ;

            }
        }
        _CompileN ( srcAddress, isize ) ; // memcpy ( dstAddress, address, size ) ;
    }
}

// nb : only blocks with one ret insn can be successfully compiled inline

void
Block_Copy ( byte * dst, byte * src, int64 qsize )
{
#if 0    
    if ( dst > src )
    {
        Error_Abort ( ( byte* ) "\nBlock_Copy :: Error : dst > src.\n" ) ;
        //return ; // ?? what is going on here ??
    }
#endif    
    SetHere ( dst ) ;
    _Block_Copy ( src, qsize ) ;
}

int64
Block_CopyCompile_WithLogicFlag ( byte * srcAddress, int64 bindex, int64 jccFlag, int64 negFlag )
{
    Compiler * compiler = _Context_->Compiler0 ;
    int64 jccFlag2 ;
    BlockInfo *bi = ( BlockInfo * ) _Stack_Pick ( compiler->CombinatorBlockInfoStack, bindex ) ; // -1 : remember - stack is zero based ; stack[0] is top
    if ( jccFlag )
    {
        if ( ! ( _Q_->OVT_LC && GetState ( _Q_->OVT_LC, ( LC_COMPILE_MODE ) ) ) )
        {
            if ( bi->LiteralWord )//&& bi->LiteralWord->StackPushRegisterCode ) // leave value in ACCUM, don't push it
            {
                if ( bi->LiteralWord->W_Value != 0 )
                {
                    return 1 ; // nothing need to be compiled 
                }
                // else somehow don't use this block at all ie. eliminate the dead code and don't just ...
                return 0 ; // TODO : don't use the block/combinator
            }
        }
        jccFlag2 = Compile_CheckReConfigureLogicInBlock ( bi, 1 ) ;
    }
    if ( ! GetState ( _CfrTil_, INLINE_ON ) ) Compile_Call ( srcAddress ) ;
    else
    {
        _Block_Copy ( srcAddress, bi->bp_Last - bi->bp_First ) ;
    }
    if ( jccFlag )
    {
        Word * svcrw = _Context_->CurrentlyRunningWord ;
        _Context_->CurrentlyRunningWord = _Context_->SC_CurrentCombinator ;
        if ( jccFlag2 )
        {
            DBI_ON ;
            Compile_JCC ( negFlag ? bi->NegFlag : ! bi->NegFlag, bi->Ttt, 0 ) ;
            DBI_OFF ;
        }
        else
        {
            Compile_GetLogicFromTOS ( bi ) ;
            Compile_JCC ( negFlag, ZERO_TTT, 0 ) ;
        }
        _Context_->CurrentlyRunningWord = svcrw ;
        _Stack_PointerToJmpOffset_Set ( Here - INT32_SIZE ) ;
    }
    return 1 ;
}

int64
Block_CopyCompile ( byte * srcAddress, int64 bindex, int64 jccFlag )
{
    return Block_CopyCompile_WithLogicFlag ( srcAddress, bindex, jccFlag, 0 ) ;
}

#endif
// 'tttn' is a notation from the intel manuals

void
BlockInfo_Set_tttn ( BlockInfo * bi, int8 ttt, int8 n, int8 overWriteSize )
{
    bi->LogicCode = Here ; // used by combinators
    //bi->LogicCodeWord = _Context_->CurrentlyRunningWord ;
    bi->Ttt = ttt ;
    bi->NegFlag = n ;
#if 0 //NEW_CALL_RETURN      
    bi->OverWriteSize = 26 ; //overWriteSize ;
#else    
    bi->OverWriteSize = overWriteSize ;
#endif    
}

BlockInfo *
_BlockInfo_Setup_BI_tttn ( Compiler * compiler, int64 ttt, int64 negFlag, int64 overWriteSize )
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
    bi->LastWord = _Context_->Interpreter0->LastWord ;
    if ( bi->LastWord && bi->LastWord->StackPushRegisterCode ) SetHere ( bi->LastWord->StackPushRegisterCode ) ;
    if ( ! compiler->BlockLevel )
        compiler->CurrentWordCompiling = compiler->CurrentCreatedWord ;
    compiler->BlockLevel ++ ;
    if ( ! CompileMode ) // first block
    {
        CfrTil_TurnOnBlockCompiler ( ) ;
    }
    bi->ActualCodeStart = Here ;
    _Compile_UninitializedJump ( ) ;
    bi->JumpOffset = Here - INT32_SIZE ; // before CfrTil_CheckCompileLocalFrame after CompileUninitializedJump
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
    //SC_Global_On ;
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
    return ( compiler->NumberOfLocals + compiler->NumberOfArgs ) > compiler->NumberOfRegisterVariables ; //|| GetState ( compiler, SAVE_Rsp ) ) ;
}

void
_CfrTil_EndBlock1 ( BlockInfo * bi )
{
    Compiler * compiler = _Context_->Compiler0 ;
    if ( _Stack_IsEmpty ( compiler->BlockStack ) )
    {
        _CfrTil_InstallGotoCallPoints_Keyed ( bi, GI_RETURN ) ;
        if ( compiler->NumberOfRegisterVariables )
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
        else if ( _Compiler_IsFrameNecessary ( compiler ) && ( ! GetState ( compiler, DONT_REMOVE_STACK_VARIABLES ) ) )
        {
            _Compiler_RemoveLocalFrame ( compiler ) ;
            bi->bp_First = bi->FrameStart ; // include _Compile_RspReg_Save code
        }
        else
        {
            bi->bp_First = bi->Start ; //bi->AfterFrame ; 
        }
        //Compile_CfrTilWord_Return ( ) ;        
        if ( ! compiler->CurrentWordCompiling )
            _Compile_Return ( ) ;
        else Compile_CfrTilWord_Return ( ) ;
    }
    else _Compile_Return ( ) ;
    //Compile_Return ( ) ;
    DataStack_Push ( ( int64 ) bi->bp_First ) ;
    bi->bp_Last = Here ;
    _SetOffsetForCallOrJump ( bi->JumpOffset, Here ) ;
}

byte *
_CfrTil_EndBlock2 ( BlockInfo * bi )
{
    Compiler * compiler = _Context_->Compiler0 ;
    compiler->BlockLevel -- ;
    byte * bp_First = bi->bp_First ;
    if ( _Stack_IsEmpty ( compiler->BlockStack ) )
    {
        _CfrTil_InstallGotoCallPoints_Keyed ( bi, GI_GOTO | GI_CALL_LABEL | GI_RECURSE ) ;
        CfrTil_TurnOffBlockCompiler ( ) ;
        Compiler_Init ( compiler, 0 ) ;
    }
    else
    {
        _Namespace_RemoveFromUsingListAndClear ( bi->LocalsNamespace ) ; //_Compiler_FreeBlockInfoLocalsNamespace ( bi, compiler ) ;
    }
    return bp_First ;
}

byte *
_CfrTil_EndBlock ( )
{
    BlockInfo * bi = ( BlockInfo * ) Stack_Pop_WithExceptionOnEmpty ( _Context_->Compiler0->BlockStack ) ;
    bi->LogicCodeWord = Compiler_WordList ( 1 ) ;
    _CfrTil_EndBlock1 ( bi ) ;
    byte * blockStart = _CfrTil_EndBlock2 ( bi ) ;
    return blockStart ;
}

void
CfrTil_EndBlock ( )
{
    _CfrTil_EndBlock ( ) ;
}
