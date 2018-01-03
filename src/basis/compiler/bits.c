
#include "../../include/cfrtil64.h"

/*
void
Compile_Test ( Compiler * compiler )
{
    if ( CheckOptimizeOperands ( compiler, 5 ) )
    {
        _Compile_Test ( compiler->optInfo->Optimize_Mod, compiler->optInfo->Optimize_Reg,
                compiler->optInfo->Optimize_Rm, compiler->optInfo->Optimize_Disp, compiler->optInfo->Optimize_Imm ) ;
    }
    else
    {
        _Compile_Stack_PopToReg ( DSP, R8 ) ;
        _Compile_Stack_PopToReg ( DSP, ECX ) ;
        _Compile_Test ( REG, R8, ECX, 0, 0 ) ;
    }
   _Compiler_Setup_BI_tttn ( _Context->Compiler0, ZERO, N ) ;
}

void
Compile_BitWise_TEST ( Compiler * compiler )
{
    Compile_Test ( compiler ) ;
}
 
void
CfrTil_TEST ( )
{
    if ( GetState( _Context_->Compiler0, BLOCK_MODE ) )
    {
        Compile_BitWise_TEST ( _Context->Compiler0 ) ;
    }
    else
    {
        Error ( ( byte* ) "\n\"TEST\" can be used only in compile mode.", 1 ) ;
    }
}
 */

void
Compile_X_Group3 ( Compiler * compiler, int64 code ) //OP_1_ARG
{
    int64 optFlag = CheckOptimize ( compiler, 5 ) ; //OP_1_ARG
    if ( optFlag & OPTIMIZE_DONE ) return ;
    else if ( optFlag )
    {
        //_Compile_Group3 ( cell code, cell mod, cell rm, cell sib, cell disp, cell imm, cell size )
        _Compile_Group3 ( code, compiler->optInfo->Optimize_Mod,
            compiler->optInfo->Optimize_Rm, REX_B | MODRM_B, 0, compiler->optInfo->Optimize_Disp, compiler->optInfo->Optimize_Imm, 0 ) ;
        if ( compiler->optInfo->Optimize_Rm != DSP ) // if the result is not already tos
        {
            if ( compiler->optInfo->Optimize_Rm != ACC ) _Compile_Move_Rm_To_Reg ( ACC, compiler->optInfo->Optimize_Rm,
                compiler->optInfo->Optimize_Disp ) ;
            _Compiler_CompileAndRecord_PushAccum ( compiler ) ;
        }
    }
    else
    {
        _Compile_Group3 ( code, MEM, DSP, REX_B | MODRM_B, 0, 0, 0, 0 ) ;
    }
}

void
Compile_X_Shift ( Compiler * compiler, int64 op, int64 stackFlag )
{
    int64 optFlag = CheckOptimize ( compiler, 5 ) ; //OP_1_ARG
    if ( optFlag & OPTIMIZE_DONE ) return ;
    else if ( optFlag )
    {
        // _Compile_Group2 ( int64 mod, int64 regOpCode, int64 rm, int64 sib, cell disp, cell imm )
        if ( compiler->optInfo->OptimizeFlag & OPTIMIZE_IMM )
        {
            _Compile_Group2 ( compiler->optInfo->Optimize_Mod,
                op, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp, compiler->optInfo->Optimize_Imm ) ;
        }
        else //if ( ( compiler->optInfo->Optimize_Imm == 0 ) && ( compiler->optInfo->Optimize_Rm != ACC ) ) // this logic is prototype maybe not precise 
        {
            _Compile_Group2_CL ( MEM, op, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp ) ;
        }
        if ( stackFlag && ( compiler->optInfo->Optimize_Rm != DSP ) ) // if the result is not already tos
        {
            if ( compiler->optInfo->Optimize_Rm != ACC ) _Compile_Move_Rm_To_Reg ( ACC, compiler->optInfo->Optimize_Rm,
                compiler->optInfo->Optimize_Disp ) ;
            _Compiler_CompileAndRecord_PushAccum ( compiler ) ;
        }
    }
    else
    {
        Word *one = ( Word* ) Compiler_WordList ( 1 ) ; // the operand
        if ( one->StackPushRegisterCode )
        {
            SetHere ( one->StackPushRegisterCode ) ; // leave optInfo->O_two value in R8 we don't need to push it
            _Compile_Move_Reg_To_Reg ( RCX, one->RegToUse ) ;
        }
        else
        {
            _Compile_Move_StackN_To_Reg ( RCX, DSP, 0 ) ;
            Compile_SUBI ( REG, DSP, 0, CELL, BYTE ) ;
        }
        //_Compile_Group2_CL ( int64 mod, int64 regOpCode, int64 rm, int64 sib, cell disp )
        _Compile_Group2_CL ( MEM, op, DSP, 0, 0 ) ;
    }
}

void
Compile_BitWise_NOT ( Compiler * compiler )
{
    Compile_X_Group3 ( compiler, NOT ) ;
}

// two complement

void
Compile_BitWise_NEG ( Compiler * compiler )
{
    Compile_X_Group3 ( compiler, NEG ) ;
}

void
Compile_ShiftLeft ( )
{
    Compile_X_Shift ( _Context_->Compiler0, SHL, 1 ) ;
}

void
Compile_ShiftRight ( )
{
    Compile_X_Shift ( _Context_->Compiler0, SHR, 1 ) ;
}

