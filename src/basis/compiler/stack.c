
#include "../../include/cfrtil64.h"

// keep this stack code correlated with core/cstack.c

void
_Compile_Stack_Drop ( Boolean stackReg )
{
    //_DBI_ON ;
    Compile_SUBI ( REG, stackReg, 0, sizeof (int64 ), BYTE ) ; // 3 bytes long
    //DBI_OFF ;
}

void
_Compile_Stack_DropN ( Boolean stackReg, int64 n )
{
    Compile_SUBI ( REG, stackReg, 0, n * sizeof ( int64 ), 0 ) ;
}

// RDrop : drop the sytem return, ESP based, stack
// system stack is backward to cfrTil - grows downward

void
_Compile_DropN_Rsp ( int64 n )
{
    Compile_ADDI ( REG, RSP, 0, n * sizeof ( int64 ), 0 ) ;
}

void
_Compile_SetStackN_WithObject ( Boolean stackReg, int64 n, int64 obj )
{
    //_Compile_MoveImm ( int64 direction, int64 rm, int64 sib, int64 disp, int64 imm, int64 operandSize )
    Compile_MoveImm ( MEM, stackReg, 0, n * CELL, obj, CELL ) ;
}

void
_Compile_Stack_Push ( Boolean stackReg, int64 obj ) // runtime
{
    Compile_ADDI ( REG, stackReg, 0, sizeof (int64 ), 0 ) ;
    //_Compile_MoveImm ( MEM, stackReg, 0, 0, obj, CELL ) ;
    _Compile_SetStackN_WithObject ( stackReg, 0, obj ) ;
}

// push a stack at an rvalue using an lvalue

void
_Compile_StackPtrLValue_PushObj ( uint64 stkPtrLvalue, Boolean tempStkReg, int64 obj ) // c lvalue
{
#if 0    
    Compile_ADDI ( REG, tempStkReg, 0, sizeof (int64 ), 0 ) ;
    Compile_MoveReg_ToAddress_ThruReg ( tempStkReg, ( byte* ) stkPtrLvalue, OREG ) ;
    _Compile_SetStackN_WithObject ( tempStkReg, 0, obj ) ;
#else
    //_Compile_GetRValue_FromLValue_ToReg ( reg, ( byte* ) address ) ;
    Compile_MoveImm_To_Reg ( OREG, ( int64 ) stkPtrLvalue, CELL_SIZE ) ; // OREG is lvalue
    Compile_Move_Rm_To_Reg ( tempStkReg, OREG, 0 ) ; // tempStkReg is rvalue
    //_Compile_MoveImm_To_Reg ( tempStkReg, ( int64 ) address, CELL_SIZE ) ;
    Compile_ADDI ( REG, tempStkReg, 0, sizeof (int64 ), 0 ) ;
    _Compile_SetStackN_WithObject ( tempStkReg, 0, obj ) ;
    //_Compile_MoveReg_ToAddress_ThruReg ( reg, ( byte* ) lvalue, OREG ) ;
    //_Compile_MoveImm_To_Reg ( OREG, ( int64 ) lvalue, CELL_SIZE ) ;
    Compile_Move_Reg_To_Rm ( OREG, tempStkReg, 0 ) ; //OREG remained as lvalue set as before 
#endif    
}

// pop a stack at an rvalue using an lvalue

void
_Compile_StackPtrLValue_PopToReg ( uint64 stkPtrLvalue, Boolean tempStkReg, Boolean reg ) // c lvalue
{
    //_Compile_GetRValue_FromLValue_ToReg ( stackReg, ( byte* ) ptr ) ;
    Compile_MoveImm_To_Reg ( OREG, ( int64 ) stkPtrLvalue, CELL_SIZE ) ; // OREG is lvalue
    Compile_Move_Rm_To_Reg ( tempStkReg, OREG, 0 ) ; // OREG is rvalue stack ptr
    //_Compile_MoveImm_To_Reg ( stackReg, ( int64 ) ptr, CELL_SIZE ) ;
    _Compile_Move_StackN_To_Reg ( reg, tempStkReg, 0 ) ; // pop our rvalue stack ptr
    Compile_SUBI ( REG, tempStkReg, 0, sizeof (int64 ), 0 ) ;
    //_Compile_MoveReg_ToAddress_ThruReg ( reg, ( byte* ) lvalue, OREG ) ;
    //_Compile_MoveImm_To_Reg ( thruReg, ( int64 ) lvalue, CELL_SIZE ) ;
    Compile_Move_Reg_To_Rm ( OREG, tempStkReg, 0 ) ; // move the new rvalue back to its lvalue - OREG
}

void
_Compile_Move_StackN_To_Reg ( Boolean reg, Boolean stackReg, int64 index )
{
    Compile_Move_Rm_To_Reg ( reg, stackReg, index * CELL ) ;
}

void
_Compile_Move_Reg_To_StackN ( Boolean stackReg, int64 index, Boolean reg )
{
    Compile_Move_Reg_To_Rm ( stackReg, reg, index * CELL ) ;
}

void
_Compile_Move_StackNRm_To_Reg ( Boolean reg, Boolean stackReg, int64 index )
{
    _Compile_Move_StackN_To_Reg ( reg, stackReg, index ) ;
    Compile_Move_Rm_To_Reg ( reg, reg, 0 ) ; // *x
}

//  ( reg sreg n ) mov_reg_to_stacknMemAddr

void
_Compile_Move_Reg_To_StackNRm_UsingReg ( Boolean stackReg, int64 index, Boolean reg, Boolean ureg )
{
    _Compile_Move_StackN_To_Reg ( ureg, stackReg, index ) ;
    Compile_Move_Reg_To_Rm ( ureg, reg, 0 ) ;
}

// remember to use a negative number to access an existing stack item

void
_Compile_Stack_PushReg ( Boolean stackReg, Boolean reg )
{
    Compile_ADDI ( REG, stackReg, 0, sizeof (int64 ), 1 ) ;
    _Compile_Move_Reg_To_StackN ( stackReg, 0, reg ) ;
}

void
_Compile_Stack_PopToReg ( Boolean stackReg, Boolean reg )
{
    _Compile_Move_StackN_To_Reg ( reg, stackReg, 0 ) ;
    Compile_SUBI ( REG, stackReg, 0, sizeof (int64 ), 1 ) ;
    PeepHole_Optimize_ForStackPopToReg ( ) ; // this happens at least some times
}

void
Compile_Stack_PushACCUM ( Boolean stackReg )
{
    _Compile_Stack_PushReg ( stackReg, ACC ) ;
}

void
Compile_Move_TOS_To_ACCUM ( Boolean stackReg )
{
    _Compile_Move_StackN_To_Reg ( ACC, stackReg, 0 ) ;
}

void
Compile_Move_ACC_To_TOS ( Boolean stackReg )
{
    _Compile_Move_Reg_To_StackN ( stackReg, 0, ACC ) ;
}

void
Compile_Pop_To_Acc ( Boolean stackReg )
{
    _Compile_Stack_PopToReg ( stackReg, ACC ) ;
}

void
Compile_Pop_ToAcc_AndCall ( Boolean stackReg )
{
    _Compile_Stack_PopToReg ( stackReg, ACC ) ;
    _Compile_Call_Acc ( ) ;
}

void
Compile_MoveImm_To_TOS ( Boolean stackReg, int64 imm, Boolean size )
{
    Compile_MoveImm ( MEM, stackReg, 0, 0, imm, size ) ;
}

#if 0
// for n < 64

void
_Compile_Stack_NDup ( Boolean stackReg )
{
    Compile_Move_Rm_To_Reg ( ACC, stackReg, 0 ) ;
    Compile_ADDI ( REG, stackReg, 0, sizeof (int64 ), 0 ) ; // 3 bytes long
    Compile_Move_Reg_To_Rm ( stackReg, ACC, 0 ) ;
}
#endif

void
_Compile_Stack_Dup ( Boolean stackReg )
{
    Compiler * compiler = _Context_->Compiler0 ;
    int64 optFlag = Compiler_CheckOptimize ( compiler, 0 ) ;
    if ( optFlag & OPTIMIZE_DONE ) return ;
    else
    {
        Word * one = CfrTil_WordList ( 1 ) ;
        if ( one->StackPushRegisterCode )
        {
            SetHere (one->StackPushRegisterCode, 1) ;
            Compile_ADDI ( REG, DSP, 0, 2 * CELL, 0 ) ;
            _Compile_Move_Reg_To_StackN ( DSP, 0, ACC ) ;
            _Compile_Move_Reg_To_StackN ( DSP, - 1, ACC ) ;
        }
        else
        {
            Compile_Move_Rm_To_Reg ( ACC, DSP, 0 ) ;
            CfrTil_WordList ( 0 )->StackPushRegisterCode = Here ;
            Compile_ADDI ( REG, DSP, 0, sizeof (int64 ), 0 ) ;
            Compile_Move_Reg_To_Rm ( DSP, ACC, 0 ) ;
        }
    }
}

// pick ( n -- stack[n] )
// the pick is from stack below top index; nb. 0 indexed stack, ie. 0 is the first indexed item on the stack, 1 is the second
// 0 pick is Dsp [ 0] - TOS 
// 1 pick is Dsp [-1]
// ..., etc.
// the result replaces the index on the stack; the rest of the stack remains the same
// so 'pick' just picks the indexed item from the stack and places it on top
// nb. should not try to optimize because it needs the argument slot for it's result

void
_Compile_Stack_Pick ( Boolean stackReg ) // pick
{
    //DBI_ON ;
    Compile_Move_Rm_To_Reg ( ACC, stackReg, 0 ) ;
    Compile_NOT ( REG, ACC, 0, 0, 0 ) ; // negate acc
    //_Compile_InstructionX64 ( int8 rex, int16 opCode, int8 modRm, int64 controlFlag, int8 sib, int64 disp, int8 dispSize, int64 imm, int8 immSize )
    //_Calculate_Rex_Sib ( int8 reg, int8 rm, int8 scale, int8 index, int8 base, int8 rex_w_flag ) ;
    //int8 rex = _Calculate_Rex_With_Sib ( ACC, SCALE_8, ACC, DSP, CELL_SIZE ) ;
    //_Compile_Move ( rex, REG, ACC, stackReg, CalculateSib ( SCALE_CELL, ACC, DSP ), 0 ) ; // move ACC, [DSP + ACC * 4 ] ; but remember eax is now a negative number
    Compile_Move_WithSib ( 0x48, REG, ACC, DSP, REX_W_B, SCALE_CELL, ACC, DSP ) ;

    Compile_Move_Reg_To_Rm ( stackReg, ACC, 0 ) ;
    //DBI_OFF ;
}

void
_Compile_Stack_Swap ( Boolean stackReg )
{
    Compile_Move_Rm_To_Reg ( OREG, stackReg, 0 ) ;
    Compile_Move_Rm_To_Reg ( RAX, stackReg, - CELL ) ;
    Compile_Move_Reg_To_Rm ( stackReg, OREG, - CELL ) ;
    //SetHere ( WordStack ( 0 )->StackPushRegisterCode ) ;
    Compile_Move_Reg_To_Rm ( stackReg, RAX, 0 ) ;
}

void
Compile_DataStack_PushR8 ( )
{
    Compile_Stack_PushACCUM ( DSP ) ;
}

void
_Compile_RspReg_Push ( int64 value )
{
    Compile_MoveImm_To_Reg ( ACC, value, CELL ) ;
    _Compile_PushReg ( ACC ) ;
}

void
Compile_DspPop_RspPush ( )
{
    _Compile_Stack_PopToReg ( DSP, ACC ) ;
    // _Compile_Stack_Push_Reg ( ESP, ECX ) ; // no such op
    _Compile_PushReg ( ACC ) ;
}

#define DEBUG_RETURN 0
#if DEBUG_RETURN

void
DebugReturn ( )
{
    if ( Stack_Depth ( _CfrTil_->ReturnStack ) > 1 )
    {
        CfrTil_PrintReturnStack ( ) ;
        _Printf ( ( byte* ) "\nDebugReturn : at %s", Context_Location ( ) ) ;
        Pause ( ) ;
    }
}
#endif

void
Compile_Set_DspReg_FromDataStackPointer ( )
{
    //DBI_ON ;
    _Compile_GetRValue_FromLValue_ToReg ( DSP, ( byte* ) & _CfrTil_->DataStack->StackPointer ) ; // must use a pointer here since we need not the compile rvalue of the StackPointer but its runtime rvalue
    //DBI_OFF ;
}

void
Compile_Set_DataStackPointer_FromDspReg ( )
{
    //DBI_ON ;
    Compile_MoveReg_ToAddress_ThruReg ( DSP, ( byte* ) & _CfrTil_->DataStack->StackPointer, OREG ) ;
    //DBI_OFF ;
}
