#include "../../include/cfrtil64.h"

void
_Compile_Set_C_LValue_WithImm_ThruReg ( byte * address, int64 value, Boolean rm, byte operandSize )
{
    Compile_MoveImm_To_Reg ( rm, (int64) address, CELL ) ;
    Compile_MoveImm_To_Mem ( rm, value, operandSize ) ;
}
 
void
_Compile_Get_C_Value_ToReg ( Boolean reg, int64 value )
{
    Compile_MoveImm_To_Reg ( reg, ( int64 ) value, CELL_SIZE ) ;
}

// nb. necessary for esp/ebp

void
_Compile_GetRValue_FromLValue_ToReg ( Boolean reg, byte * address )
{
    Compile_MoveMemValue_To_Reg ( reg, ( byte* ) address, CELL_SIZE ) ;
}

void
_Compile_Get_FromCAddress_ToReg_ThruReg ( Boolean reg, byte * address, Boolean thruReg )
{
    Compile_MoveMemValue_ToReg_ThruReg ( reg, address, CELL_SIZE, thruReg ) ;
}

// thru reg is a 'scratch' reg

void
_Compile_Set_CAddress_WithRegValue_ThruReg ( byte * address, Boolean reg, Boolean thruReg )
{
    Compile_MoveReg_ToAddress_ThruReg ( reg, address, thruReg ) ;
}

void
Compile_Peek ( Compiler * compiler, Boolean stackReg ) // @
{
    int64 optFlag = Compiler_CheckOptimize (compiler, 0) ;
    if ( optFlag & OPTIMIZE_DONE ) return ;
    else if ( ! optFlag ) Compile_Move_Rm_To_Reg ( ACC, stackReg, 0 ) ;
    Compile_Move_Rm_To_Reg ( ACC, ACC, 0 ) ;
    Compile_Move_Reg_To_Rm ( stackReg, ACC, 0 ) ;
}

// '!' ( value address  -- ) // store value at address - dpans94 - address is on top - value was pushed first, leftmost in rpn, then address

void
Compile_Store ( Compiler * compiler, Boolean stackReg ) // !
{
    int64 optFlag = Compiler_CheckOptimize (compiler, 0) ;
    if ( optFlag & OPTIMIZE_DONE ) return ;
    else if ( optFlag )
    {
        // _Compile_MoveImm ( cell direction, cell rm, cell disp, cell imm, cell operandSize )
        if ( compiler->OptInfo->OptimizeFlag & OPTIMIZE_IMM ) Compile_MoveImm ( compiler->OptInfo->Optimize_Dest_RegOrMem,
            compiler->OptInfo->Optimize_Rm, 0, compiler->OptInfo->Optimize_Disp, compiler->OptInfo->Optimize_Imm, CELL_SIZE ) ;
        else if ( compiler->OptInfo->OptimizeFlag & OPTIMIZE_REGISTER )
        {
            // allow for one of these to be R8 which is 0
            //if ( compiler->OptInfo->Optimize_SrcReg || compiler->OptInfo->Optimize_DstReg ) _Compile_Move_Reg_To_Reg ( compiler->OptInfo->Optimize_DstReg, compiler->OptInfo->Optimize_SrcReg ) ;
                //_Compile_Move ( int64 direction, int8 reg, int64 rm, int64 sib, int64 disp )
            //else 
            _Compile_Move (compiler->OptInfo->Optimize_Dest_RegOrMem, compiler->OptInfo->Optimize_Reg, compiler->OptInfo->Optimize_Rm, 0, 0 ) ;
        }
        else Compile_Move_Reg_To_Rm ( compiler->OptInfo->Optimize_Rm, compiler->OptInfo->Optimize_Reg, compiler->OptInfo->Optimize_Disp ) ;
    }
    else
    {
        //DBI_ON ;
        Word * word ;
        d0 ( if ( Is_DebugModeOn ) Compiler_SC_WordList_Show ("\nCompile_Store : not optimized", 0, 0) ) ;
        if ( ( word = ( Word* ) _CfrTil_WordList (1) ) && word->StackPushRegisterCode ) SetHere (word->StackPushRegisterCode, 1) ;
        else Compile_Move_Rm_To_Reg ( ACC, stackReg, 0 ) ;
        Compile_Move_Rm_To_Reg ( OREG, stackReg, (word && word->StackPushRegisterCode) ? 0 : (- CELL_SIZE) ) ;
        Compile_Move_Reg_To_Rm ( ((word && word->StackPushRegisterCode) ? word->RegToUse : ACC), OREG, 0 ) ;
        Compile_SUBI ( REG, stackReg, 0, (( word && word->StackPushRegisterCode ) ? 1 : 2 ) * CELL_SIZE, 0 ) ;
        //DBI_OFF ;
    }
}

// ( address value -- ) store value at address - reverse order of parameters from '!'
// ( addr n -- ) // (*addr) = n

void
Compile_Poke ( Compiler * compiler, Boolean stackReg ) // =
{
    int64 optFlag = Compiler_CheckOptimize (compiler, 0) ;
    if ( optFlag & OPTIMIZE_DONE ) return ;
    else if ( optFlag )
    {
        Word_SetCodingHere_And_ClearPreviousUseOf_Here_SCA (compiler->OptInfo->opWord, 0) ;
        if ( compiler->OptInfo->OptimizeFlag & OPTIMIZE_IMM )
        {
            // _Compile_MoveImm ( cell direction, cell rm, cell disp, cell imm, cell operandSize )
            Compile_MoveImm ( compiler->OptInfo->Optimize_Dest_RegOrMem,
                compiler->OptInfo->Optimize_Rm, 0, compiler->OptInfo->Optimize_Disp, compiler->OptInfo->Optimize_Imm, 0 ) ;
        }
        else if ( compiler->OptInfo->OptimizeFlag & OPTIMIZE_REGISTER )
        {
            // allow for one of these to be R8 which is 0
            //if ( compiler->OptInfo->Optimize_SrcReg || compiler->OptInfo->Optimize_DstReg ) _Compile_Move_Reg_To_Reg ( compiler->OptInfo->Optimize_DstReg, compiler->OptInfo->Optimize_SrcReg ) ;
                //_Compile_Move ( int64 direction, int8 reg, int64 rm, int64 sib, int64 disp )
            //else 
            _Compile_Move (compiler->OptInfo->Optimize_Dest_RegOrMem, compiler->OptInfo->Optimize_Reg, compiler->OptInfo->Optimize_Rm, 0, 0 ) ;
        }
        else Compile_Move_Reg_To_Rm ( compiler->OptInfo->Optimize_Rm, compiler->OptInfo->Optimize_Reg, compiler->OptInfo->Optimize_Disp ) ;
    }
    else
    {
        Compile_Move_Rm_To_Reg ( OREG, stackReg, 0 ) ;
        Compile_Move_Rm_To_Reg ( ACC, stackReg, - CELL_SIZE ) ;
        Compile_Move_Reg_To_Rm ( ACC, OREG, 0 ) ;
        //if ( ! GetState ( _Context_, C_SYNTAX ) ) 
        Compile_SUBI ( REG, stackReg, 0, 2 * CELL_SIZE, BYTE ) ;
    }
}

// n = *m
// ( n m -- )
// 

void
Compile_AtEqual ( Boolean stackReg ) // !
{
    Compile_Move_Rm_To_Reg ( ACC, stackReg, 0 ) ;
    Compile_Move_Rm_To_Reg ( ACC, ACC, 0 ) ;
    Compile_Move_Rm_To_Reg ( OREG, stackReg, - CELL_SIZE ) ;
    Compile_Move_Reg_To_Rm ( OREG, ACC, 0 ) ;
    Compile_SUBI ( REG, stackReg, 0, CELL_SIZE * 2, BYTE ) ;
}

