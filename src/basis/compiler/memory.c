#include "../../include/cfrtil64.h"

void
_Compile_Set_C_LValue_WithImm_ThruReg ( int64 address, int64 value, int8 rm, byte operandSize )
{
    _Compile_MoveImm_To_Reg ( rm, address, CELL ) ;
    _Compile_MoveImm_To_Mem ( rm, value, operandSize ) ;
}

void
_Compile_Get_C_Value_ToReg ( int8 reg, int64 value )
{
    _Compile_MoveImm_To_Reg ( reg, ( int64 ) value, CELL_SIZE ) ;
}

// nb. necessary for esp/ebp

void
_Compile_Get_FromCAddress_ToReg ( int8 reg, byte * address )
{
    _Compile_MoveMem_To_Reg ( reg, ( byte* ) address, CELL_SIZE ) ;
}

void
_Compile_Get_FromCAddress_ToReg_ThruReg ( int8 reg, byte * address, int8 thruReg )
{
    _Compile_MoveMem_ToReg_ThruReg ( reg, address, CELL_SIZE, thruReg ) ;
}

// thru reg is a 'scratch' reg

void
_Compile_Set_CAddress_WithRegValue_ThruReg ( byte * address, int8 reg, int8 thruReg )
{
    _Compile_MoveReg_ToMem_ThruReg ( reg, address, CELL_SIZE, thruReg ) ;
}

void
Compile_Peek ( Compiler * compiler, int8 stackReg ) // @
{
    int64 optFlag = CheckOptimize ( compiler, 3 ) ;
    if ( optFlag & OPTIMIZE_DONE ) return ;
    _Compile_Move_Rm_To_Reg ( ACC, stackReg, 0 ) ;
    _Compile_Move_Rm_To_Reg ( ACC, ACC, 0 ) ;
    _Compile_Move_Reg_To_Rm ( stackReg, ACC, 0 ) ;
}

// '!' ( value address  -- ) // store value at address - dpans94 - address is on top - value was pushed first, leftmost in rpn, then address

void
Compile_Store ( Compiler * compiler, int8 stackReg ) // !
{
    int64 optFlag = CheckOptimize ( compiler, 5 ) ;
    if ( optFlag & OPTIMIZE_DONE ) return ;
    else if ( optFlag )
    {
        // _Compile_MoveImm ( cell direction, cell rm, cell disp, cell imm, cell operandSize )
        if ( compiler->optInfo->OptimizeFlag & OPTIMIZE_IMM ) _Compile_MoveImm (compiler->optInfo->Optimize_Dest_RegOrMem,
            compiler->optInfo->Optimize_Rm, IMM_B | REX_B | MODRM_B | DISP_B, 0, compiler->optInfo->Optimize_Disp, compiler->optInfo->Optimize_Imm, CELL_SIZE ) ;
        else if ( compiler->optInfo->OptimizeFlag & OPTIMIZE_REGISTER )
        {
            // allow for one of these to be R8 which is 0
            if ( compiler->optInfo->Optimize_SrcReg || compiler->optInfo->Optimize_DstReg ) _Compile_Move_Reg_To_Reg ( compiler->optInfo->Optimize_DstReg, compiler->optInfo->Optimize_SrcReg ) ;
                //_Compile_Move ( int64 direction, int8 reg, int64 rm, int64 sib, int64 disp )
            else _Compile_Move ( compiler->optInfo->Optimize_Dest_RegOrMem, compiler->optInfo->Optimize_Reg, compiler->optInfo->Optimize_Rm, 0, 0 ) ;
        }
        else _Compile_Move_Reg_To_Rm ( compiler->optInfo->Optimize_Rm, compiler->optInfo->Optimize_Reg, compiler->optInfo->Optimize_Disp ) ;
    }
    else
    {
        //DBI_ON ;
        Word * word ;
        if ( ( word = ( Word* ) Compiler_WordList ( 1 ) ) && word->StackPushRegisterCode ) SetHere ( word->StackPushRegisterCode ) ;
        else _Compile_Move_Rm_To_Reg ( ACC, stackReg, 0 ) ;
        _Compile_Move_Rm_To_Reg ( OREG, stackReg, - CELL_SIZE ) ;
        _Compile_Move_Reg_To_Rm ( ACC, OREG, 0 ) ;
        Compile_SUBI ( REG, stackReg, 0, ( word && word->StackPushRegisterCode ) ? CELL_SIZE : 2 * CELL_SIZE, 0 ) ;
        //Compile_SUBI ( REG, stackReg, 0, 2 * CELL_SIZE, BYTE ) ;
        //DBI_OFF ;
    }
}

// ( address value -- ) store value at address - reverse order of parameters from '!'
// ( addr n -- ) // (*addr) = n

void
Compile_Poke ( Compiler * compiler, int8 stackReg ) // =
{
    int64 optFlag = CheckOptimize ( compiler, 7 ) ;
    if ( optFlag & OPTIMIZE_DONE ) return ;
    else if ( optFlag )
    {
        if ( compiler->optInfo->OptimizeFlag & OPTIMIZE_IMM )
        {
            // _Compile_MoveImm ( cell direction, cell rm, cell disp, cell imm, cell operandSize )
            _Compile_MoveImm (compiler->optInfo->Optimize_Dest_RegOrMem,
                compiler->optInfo->Optimize_Rm, IMM_B | REX_B | MODRM_B | DISP_B, 0, compiler->optInfo->Optimize_Disp, compiler->optInfo->Optimize_Imm, 0 ) ;
        }
        else if ( compiler->optInfo->OptimizeFlag & OPTIMIZE_REGISTER )
        {
            // allow for one of these to be R8 which is 0
            if ( compiler->optInfo->Optimize_SrcReg || compiler->optInfo->Optimize_DstReg ) _Compile_Move_Reg_To_Reg ( compiler->optInfo->Optimize_DstReg, compiler->optInfo->Optimize_SrcReg ) ;
                //_Compile_Move ( int64 direction, int8 reg, int64 rm, int64 sib, int64 disp )
            else _Compile_Move ( compiler->optInfo->Optimize_Dest_RegOrMem, compiler->optInfo->Optimize_Reg, compiler->optInfo->Optimize_Rm, 0, 0 ) ;
        }
        else _Compile_Move_Reg_To_Rm ( compiler->optInfo->Optimize_Rm, compiler->optInfo->Optimize_Reg, compiler->optInfo->Optimize_Disp ) ;
    }
    else
    {
        _Compile_Move_Rm_To_Reg ( OREG, stackReg, 0 ) ;
        _Compile_Move_Rm_To_Reg ( ACC, stackReg, - CELL_SIZE ) ;
        _Compile_Move_Reg_To_Rm ( ACC, OREG, 0 ) ;
        //if ( ! GetState ( _Context_, C_SYNTAX ) ) 
        Compile_SUBI ( REG, stackReg, 0, 2 * CELL_SIZE, BYTE ) ;
    }
}

// n = *m
// ( n m -- )
// 

void
Compile_AtEqual ( int8 stackReg ) // !
{
    _Compile_Move_Rm_To_Reg ( ACC, stackReg, 0 ) ;
    _Compile_Move_Rm_To_Reg ( ACC, ACC, 0 ) ;
    _Compile_Move_Rm_To_Reg ( OREG, stackReg, - CELL_SIZE ) ;
    _Compile_Move_Reg_To_Rm ( OREG, ACC, 0 ) ;
    Compile_SUBI ( REG, stackReg, 0, CELL_SIZE * 2, BYTE ) ;
}

