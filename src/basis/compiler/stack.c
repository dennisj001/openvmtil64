
#include "../../include/cfrtil64.h"

// keep this stack code correlated with core/cstack.c

void
_Compile_Stack_Drop ( int8 stackReg )
{
    Compile_SUBI ( REG, stackReg, 0, sizeof (int64 ), BYTE ) ; // 3 bytes long
}

void
_Compile_Stack_DropN ( int8 stackReg, int64 n )
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
_Compile_SetStackN_WithObject ( int8 stackReg, int64 n, int64 obj )
{
    //_Compile_MoveImm ( int64 direction, int64 rm, int64 sib, int64 disp, int64 imm, int64 operandSize )
    _Compile_MoveImm ( MEM, stackReg, IMM_B | REX_B | MODRM_B | DISP_B, 0, n * CELL, obj, CELL ) ;
}

void
_Compile_Stack_Push ( int8 stackReg, int64 obj ) // runtime
{
    Compile_ADDI ( REG, stackReg, 0, sizeof (int64 ), 0 ) ;
    //_Compile_MoveImm ( MEM, stackReg, 0, 0, obj, CELL ) ;
    _Compile_SetStackN_WithObject ( stackReg, 0, obj ) ;
}

// push a stack at an rvalue using an lvalue
void
_Compile_StackPtrLValue_PushObj ( uint64 stkPtrLvalue, int8 tempStkReg, int64 obj ) // c lvalue
{
#if 0    
    Compile_ADDI ( REG, tempStkReg, 0, sizeof (int64 ), 0 ) ;
    _Compile_MoveReg_ToAddress_ThruReg ( tempStkReg, ( byte* ) stkPtrLvalue, OREG ) ;
    _Compile_SetStackN_WithObject ( tempStkReg, 0, obj ) ;
#else
    //_Compile_GetRValue_FromLValue_ToReg ( reg, ( byte* ) address ) ;
    _Compile_MoveImm_To_Reg ( OREG, ( int64 ) stkPtrLvalue, CELL_SIZE ) ; // OREG is lvalue
    _Compile_Move_Rm_To_Reg ( tempStkReg, OREG, 0 ) ; // tempStkReg is rvalue
    //_Compile_MoveImm_To_Reg ( tempStkReg, ( int64 ) address, CELL_SIZE ) ;
    Compile_ADDI ( REG, tempStkReg, 0, sizeof (int64 ), 0 ) ;
    _Compile_SetStackN_WithObject ( tempStkReg, 0, obj ) ;
    //_Compile_MoveReg_ToAddress_ThruReg ( reg, ( byte* ) lvalue, OREG ) ;
    //_Compile_MoveImm_To_Reg ( OREG, ( int64 ) lvalue, CELL_SIZE ) ;
    _Compile_Move_Reg_To_Rm ( OREG, tempStkReg, 0 ) ; //OREG remained as lvalue set as before 
#endif    
}

// pop a stack at an rvalue using an lvalue
void
_Compile_StackPtrLValue_PopToReg ( uint64 stkPtrLvalue, int8 tempStkReg, int8 reg ) // c lvalue
{
    //_Compile_GetRValue_FromLValue_ToReg ( stackReg, ( byte* ) ptr ) ;
    _Compile_MoveImm_To_Reg ( OREG, ( int64 ) stkPtrLvalue, CELL_SIZE ) ; // OREG is lvalue
    _Compile_Move_Rm_To_Reg ( tempStkReg, OREG, 0 ) ; // OREG is rvalue stack ptr
    //_Compile_MoveImm_To_Reg ( stackReg, ( int64 ) ptr, CELL_SIZE ) ;
    _Compile_Move_StackN_To_Reg ( reg, tempStkReg, 0 ) ; // pop our rvalue stack ptr
    Compile_SUBI ( REG, tempStkReg, 0, sizeof (int64 ), 0 ) ;
    //_Compile_MoveReg_ToAddress_ThruReg ( reg, ( byte* ) lvalue, OREG ) ;
    //_Compile_MoveImm_To_Reg ( thruReg, ( int64 ) lvalue, CELL_SIZE ) ;
    _Compile_Move_Reg_To_Rm ( OREG, tempStkReg, 0 ) ; // move the new rvalue back to its lvalue - OREG
}

void
_Compile_Move_StackN_To_Reg ( int8 reg, int8 stackReg, int64 index )
{
    _Compile_Move_Rm_To_Reg ( reg, stackReg, index * CELL ) ;
}

void
_Compile_Move_Reg_To_StackN ( int8 stackReg, int64 index, int8 reg )
{
    _Compile_Move_Reg_To_Rm ( stackReg, reg, index * CELL ) ;
}

void
_Compile_Move_StackNRm_To_Reg ( int8 reg, int8 stackReg, int64 index )
{
    _Compile_Move_StackN_To_Reg ( reg, stackReg, index ) ;
    _Compile_Move_Rm_To_Reg ( reg, reg, 0 ) ; // *x
}

//  ( reg sreg n ) mov_reg_to_stacknMemAddr

void
_Compile_Move_Reg_To_StackNRm_UsingReg ( int8 stackReg, int64 index, int8 reg, int8 ureg )
{
    _Compile_Move_StackN_To_Reg ( ureg, stackReg, index ) ;
    _Compile_Move_Reg_To_Rm ( ureg, reg, 0 ) ;
}

// remember to use a negative number to access an existing stack item

void
_Compile_Stack_PushReg ( int8 stackReg, int8 reg )
{
    Compile_ADDI ( REG, stackReg, 0, sizeof (int64 ), 0 ) ;
    _Compile_Move_Reg_To_StackN ( stackReg, 0, reg ) ;
}

void
_Compile_Stack_PopToReg ( int8 stackReg, int8 reg )
{
    _Compile_Move_StackN_To_Reg ( reg, stackReg, 0 ) ;
    Compile_SUBI ( REG, stackReg, 0, sizeof (int64 ), 0 ) ;
}

void
Compile_Stack_PushACCUM ( int8 stackReg )
{
    _Compile_Stack_PushReg ( stackReg, ACC ) ;
}

void
Compile_Move_TOS_To_ACCUM ( int8 stackReg )
{
    _Compile_Move_StackN_To_Reg ( ACC, stackReg, 0 ) ;
}

void
Compile_Move_ACC_To_TOS ( int8 stackReg )
{
    _Compile_Move_Reg_To_StackN ( stackReg, 0, ACC ) ;
}

void
Compile_Pop_To_Acc ( int8 stackReg )
{
    _Compile_Stack_PopToReg ( stackReg, ACC ) ;
}

void
Compile_Pop_ToAcc_AndCall ( int8 stackReg )
{
    _Compile_Stack_PopToReg ( stackReg, ACC ) ;
    _Compile_Call_Acc ( ) ;
}

void
Compile_MoveImm_To_TOS ( int8 stackReg, int64 imm, int8 size )
{
    _Compile_MoveImm ( MEM, stackReg, IMM_B | REX_B | MODRM_B | DISP_B, 0, 0, imm, size ) ;
}

#if 0
// for n < 64

void
_Compile_Stack_NDup ( int8 stackReg )
{
    _Compile_Move_Rm_To_Reg ( ACC, stackReg, 0 ) ;
    Compile_ADDI ( REG, stackReg, 0, sizeof (int64 ), 0 ) ; // 3 bytes long
    _Compile_Move_Reg_To_Rm ( stackReg, ACC, 0 ) ;
}
#endif

void
_Compile_Stack_Dup ( int8 stackReg )
{
    Compiler * compiler = _Context_->Compiler0 ;
    int64 optFlag = CheckOptimize ( compiler, 3 ) ;
    if ( optFlag & OPTIMIZE_DONE ) return ;
    else
    {
        _Compile_Move_Rm_To_Reg ( ACC, stackReg, 0 ) ;
        //Word *zero = Compiler_WordStack ( 0 ) ; // refers to this current multiply insn word
        Word *zero = Compiler_WordList ( 0 ) ; // refers to this current multiply insn word
        zero->StackPushRegisterCode = Here ;
        Compile_ADDI ( REG, stackReg, 0, sizeof (int64 ), 0 ) ; // 3 bytes long
        _Compile_Move_Reg_To_Rm ( stackReg, ACC, 0 ) ;
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
_Compile_Stack_Pick ( int8 stackReg ) // pick
{
    //DBI_ON ;
    _Compile_Move_Rm_To_Reg ( ACC, stackReg, 0 ) ;
    Compile_NOT ( REG, ACC, 0, 0, 0 ) ; // negate acc
    //_Compile_InstructionX64 ( int8 rex, int16 opCode, int8 modRm, int64 controlFlag, int8 sib, int64 disp, int8 dispSize, int64 imm, int8 immSize )
    //_Calculate_Rex_Sib ( int8 reg, int8 rm, int8 scale, int8 index, int8 base, int8 rex_w_flag ) ;
    //int8 rex = _Calculate_Rex_With_Sib ( ACC, SCALE_8, ACC, DSP, CELL_SIZE ) ;
    //_Compile_Move ( rex, REG, ACC, stackReg, CalculateSib ( SCALE_CELL, ACC, DSP ), 0 ) ; // move ACC, [DSP + ACC * 4 ] ; but remember eax is now a negative number
    Compile_Move_WithSib ( 0x48, REG, ACC, DSP, REX_W_B, SCALE_CELL, ACC, DSP ) ;

    _Compile_Move_Reg_To_Rm ( stackReg, ACC, 0 ) ;
    //DBI_OFF ;
}

void
_Compile_Stack_Swap ( int8 stackReg )
{
    _Compile_Move_Rm_To_Reg ( OREG, stackReg, 0 ) ;
    _Compile_Move_Rm_To_Reg ( THRU_REG, stackReg, - CELL ) ;
    _Compile_Move_Reg_To_Rm ( stackReg, OREG, - CELL ) ;
    _Compile_Move_Reg_To_Rm ( stackReg, THRU_REG, 0 ) ;
}

void
Compile_DataStack_PushR8 ( )
{
    Compile_Stack_PushACCUM ( DSP ) ;
}

void
_Compile_RspReg_Push ( int64 value )
{
    _Compile_MoveImm_To_Reg ( ACC, value, CELL ) ;
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
    //_Compile_MoveImm ( REG, DSP, IMM_B | REX_B | MODRM_B | DISP_B, 0, 0, ( uint64 ) & _Dsp_, CELL ) ;
    //_Compile_Move_Rm_To_Reg ( DSP, DSP, 0 ) ;
    _Compile_GetRValue_FromLValue_ToReg ( DSP, ( byte* ) & _CfrTil_->DataStack->StackPointer ) ;
    //DBI_OFF ;
}

void
Compile_Set_DataStackPointer_FromDspReg ( )
{
    //DBI_ON ;
    //_Compile_MoveImm ( REG, OREG, IMM_B | REX_B | MODRM_B | DISP_B, 0, 0, ( uint64 ) & _Dsp_, CELL ) ;
    //_Compile_Move_Reg_To_Rm ( OREG, DSP, 0 ) ;
    _Compile_MoveReg_ToAddress_ThruReg ( DSP, ( byte* ) & _CfrTil_->DataStack->StackPointer, OREG ) ;
    //DBI_OFF ;
}
#if 0

// push onto the C esp based stack with the 'push' instruction

void
Compile_Set_CfrTilRspReg_FromReturnStackPointer ( )
{
    //DBI_ON ;
    //_Compile_MoveImm ( REG, CFT_RSP, IMM_B | REX_B | MODRM_B | DISP_B, 0, 0, ( uint64 ) & _Rsp_, CELL ) ;
    //_Compile_Move_Rm_To_Reg ( CFT_RSP, CFT_RSP, 0 ) ;
    _Compile_GetRValue_FromLValue_ToReg ( CFT_RSP, ( byte* ) & _Rsp_ ) ;
    //DBI_OFF ;
}

void
Compile_Set_ReturnStackPointer_FromCfrTilRspReg ( )
{
    //DBI_ON ;
    //_Compile_MoveImm ( REG, OREG, IMM_B | REX_B | MODRM_B | DISP_B, 0, 0, ( uint64 ) & _Rsp_, CELL ) ;
    //_Compile_Move_Reg_To_Rm ( OREG, CFT_RSP, 0 ) ;
    _Compile_MoveReg_ToAddress_ThruReg ( CFT_RSP, ( byte* ) & _Rsp_, OREG ) ;
    //DBI_OFF ;
}

void
Compile_CfrTilWord_Return ( )
{
    //DBI_ON ;
    if ( _DBI )
    {
        Word * word = _Compiler_->CurrentWordCompiling ; //= Word_GetFromCodeAddress ( address ) ;
        _Printf ( ( byte* ) "\nCompile_CfrTilWord_Return : word = %s : at %s", word ? word->Name : ( byte* ) "", Context_Location ( ) ) ;
    }
    //Compile_Set_CfrTilRspReg_FromReturnStackPointer ( ) ;
    //_Compile_Stack_PopToReg ( CFT_RSP, ACC ) ;
    _Compile_StackPtrLValue_PopToReg ( (uint64)&_Rsp_, CFT_RSP, ACC ) ;
#if DEBUG_RETURN
    _Compile_Stack_PushReg ( DSP, ACC ) ;
    _Compile_Call_ThruReg ( ( byte* ) DebugReturn, OREG ) ;
    _Compile_Stack_PopToReg ( DSP, ACC ) ;
#endif
    //Compile_Set_ReturnStackPointer_FromCfrTilRspReg ( ) ;
    _Compile_Group5 ( JMP, REG, ACC, 0, 0, 0 ) ;
    //DBI_OFF ;
}

void
_Compile_Call_CfrTilWord ( byte* address )
{
#if 0    
    DBI_ON ;
    if ( _DBI )
    {
        Word * word = Word_GetFromCodeAddress ( address ) ;
        _Printf ( ( byte* ) "\n_Compile_Call_CfrTilWord : word = %s : at %s", word ? word->Name : ( byte* ) "", Context_Location ( ) ) ;
    }
#endif    
    //Compile_Set_CfrTilRspReg_FromReturnStackPointer ( ) ;
    //byte * here = Here ; int64 increment ;
//#define INCREMENTb 35 // adjust this when changing below code ... 
    //_Compile_Stack_Push ( CFT_RSP, ( uint64 ) Here + 22 ) ;
    _Compile_StackPtrLValue_PushObj (  ( uint64 ) &_Rsp_, CFT_RSP, ( uint64 ) Here + 38 ) ;
    //Compile_Set_ReturnStackPointer_FromCfrTilRspReg ( ) ;
    _Compile_JumpToAddress ( address ) ;
    //increment = Here - here ; // 20
    //DBI_OFF ;
}

void
Compile_Call_CfrTilWord ( )
{
#if 0    
    DBI_ON ;
    if ( _DBI )
    {
        Word * word = _Context_->CurrentlyRunningWord ;
        _Printf ( ( byte* ) "\nCompile_Call_CfrTilWord : word = %s : at %s", word ? word->Name : ( byte* ) "", Context_Location ( ) ) ;
    }
#endif    
    //Compile_Set_DspReg_FromDataStackPointer () ;
    //Compile_Set_CfrTilRspReg_FromReturnStackPointer ( ) ;
    _Compile_Stack_PopToReg ( DSP, ACC ) ; // TOS is word->Definition 
    //Compile_Set_DataStackPointer_FromDspReg ( ) ;
    //byte * here = Here ; int64 increment ;
    //_Compile_Stack_Push ( CFT_RSP, ( uint64 ) Here + INCREMENTa ) ; // inc
    _Compile_StackPtrLValue_PushObj (  ( uint64 ) &_Rsp_, CFT_RSP, ( uint64 ) Here + 36 ) ;
    _Compile_Group5 ( JMP, REG, ACC, 0, 0, 0 ) ;
    //increment = Here - here ; // 20
    //Compile_Set_ReturnStackPointer_FromCfrTilRspReg ( ) ;
    //increment = Here - here ; // 33
    //Compile_Set_DspReg_FromDataStackPointer ( ) ;
    //increment = Here - here ; // 46
    //DBI_OFF ;
}
#endif

void
_Compile_TEST_Reg_To_Reg ( int8 dstReg, int64 srcReg )
{
    _Compile_Op_Special_Reg_To_Reg ( TEST_R_TO_R, dstReg, srcReg ) ;
}

void
_Compile_Return ( )
{
    _Compile_Int8 ( 0xc3 ) ;
    //RET ( ) ; // use codegen_x86.h just to include it in
}

#if 0
void
Compile_Return ( )
{
    if ( ( ! _Compiler_->CurrentWordCompiling ) || ( ! ( _Compiler_->CurrentWordCompiling->CAttribute & CFRTIL_WORD ) ) )
        _Compile_Return ( ) ;
    else Compile_CfrTilWord_Return ( ) ;
    //RET ( ) ; // use codegen_x86.h just to include it in
    // pop rstack to R8
    //_Compile_JumpToReg ( R8 ) ;
}

#endif