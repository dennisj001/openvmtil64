
#include "../../include/cfrtil.h"

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
_Compile_DropN_ESP ( int64 n )
{
    Compile_ADDI ( REG, RSP, 0, n * sizeof ( int64 ), 0 ) ;
}

void
_Compile_SetStackN_WithObject ( int8 stackReg, int64 n, int64 obj )
{
    //_Compile_MoveImm ( int64 direction, int64 rm, int64 sib, int64 disp, int64 imm, int64 operandSize )
    _Compile_MoveImm ( MEM, stackReg, 0, n * CELL, obj, CELL ) ;
}

void
_Compile_Stack_Push ( int8 stackReg, int64 obj ) // runtime
{
    Compile_ADDI ( REG, stackReg, 0, sizeof (int64 ), 0 ) ;
    //_Compile_MoveImm ( MEM, stackReg, 0, 0, obj, CELL ) ;
    _Compile_SetStackN_WithObject ( DSP, 0, obj ) ;
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
Compile_Stack_PushR8 ( int8 stackReg )
{
    _Compile_Stack_PushReg ( stackReg, R8D ) ;
}

void
Compile_Move_TOS_To_R8 ( int8 stackReg )
{
    _Compile_Move_StackN_To_Reg ( R8D, stackReg, 0 ) ;
}

void
Compile_Move_R8_To_TOS ( int8 stackReg )
{
    _Compile_Move_Reg_To_StackN ( stackReg, 0, R8D ) ;
}

void
Compile_Pop_To_R8 ( int8 stackReg )
{
    _Compile_Stack_PopToReg ( stackReg, R8D ) ;
}

void
Compile_Pop_ToR8_AndCall ( int8 stackReg )
{
    _Compile_Stack_PopToReg ( stackReg, R8D ) ;
    _Compile_CallR8 ( ) ;
}

void
Compile_MoveImm_To_TOS ( int8 stackReg, int64 imm, int8 size )
{
    _Compile_MoveImm ( MEM, stackReg, 0, 0, imm, size ) ;
}

#if 0
// for n < 64

void
_Compile_Stack_NDup ( int8 stackReg )
{
    _Compile_Move_Rm_To_Reg ( R8D, stackReg, 0 ) ;
    Compile_ADDI ( REG, stackReg, 0, sizeof (int64 ), 0 ) ; // 3 bytes long
    _Compile_Move_Reg_To_Rm ( stackReg, R8D, 0 ) ;
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
        _Compile_Move_Rm_To_Reg ( R8D, stackReg, 0 ) ;
        //Word *zero = Compiler_WordStack ( 0 ) ; // refers to this current multiply insn word
        Word *zero = Compiler_WordList ( 0 ) ; // refers to this current multiply insn word
        zero->StackPushRegisterCode = Here ;
        Compile_ADDI ( REG, stackReg, 0, sizeof (int64 ), 0 ) ; // 3 bytes long
        _Compile_Move_Reg_To_Rm ( stackReg, R8D, 0 ) ;
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
    _Compile_Move_Rm_To_Reg ( R8D, stackReg, 0 ) ;
    Compile_NOT ( REG, R8D, 0, 0 ) ; // negate eax
    _Compile_Move ( REG, R8D, stackReg, _CalculateSib ( SCALE_CELL, R8D, R14 ), 0 ) ; // move eax, [esi + eax * 4 ] ; but remember eax is now a negative number
    _Compile_Move_Reg_To_Rm ( stackReg, R8D, 0 ) ;
}

void
_Compile_Stack_Swap ( int8 stackReg )
{
    _Compile_Move_Rm_To_Reg ( R9D, stackReg, 0 ) ;
    _Compile_Move_Rm_To_Reg ( R11D, stackReg, - CELL ) ;
    _Compile_Move_Reg_To_Rm ( stackReg, R9D, - CELL ) ;
    _Compile_Move_Reg_To_Rm ( stackReg, R11D, 0 ) ;
}

void
Compile_DataStack_PushR8 ( )
{
    Compile_Stack_PushR8 ( DSP ) ;
}

void
_Compile_Esp_Push ( int64 value )
{
    _Compile_MoveImm_To_Reg ( R8D, value, CELL ) ;
    _Compile_PushReg ( R8D ) ;
}

void
Compile_DspPop_EspPush ( )
{
    _Compile_Stack_PopToReg ( DSP, R8D ) ;
    // _Compile_Stack_Push_Reg ( ESP, ECX ) ; // no such op
    _Compile_PushReg ( R8D ) ;
}

#if 0

void
Compile_EspPop_DspPush ( )
{
    _Compile_PopToReg ( R8D ) ; // intel pop is pop esp
    Compile_DataStack_PushR8 ( ) ; // no such op
}
#endif

