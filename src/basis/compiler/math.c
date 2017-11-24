#include "../../include/cfrtil64.h"

// X variable op compile for group 5 opCodes - inc/dec - ia32 

void
Compile_Minus ( Compiler * compiler )
{
    Compile_X_Group1 ( compiler, SUB, ZERO_TTT, NZ ) ;
}

void
Compile_Plus ( Compiler * compiler )
{
    Compile_X_Group1 ( compiler, ADD, ZERO_TTT, NZ ) ;
}

#if 0

void
Compile_X_Group3 ( Compiler * compiler, int64 op )
{
    Word *zero = Compiler_WordStack ( 0 ) ; // refers to this current multiply insn word
    if ( CheckOptimize ( compiler, 6 ) ) // 6 : especially for the factorial - qexp, bexp 
    {
        // Compile_IMUL ( mod, rm, sib, disp, imm, size )
        // always uses R8 as the first operand and destination of the operation
        if ( compiler->optInfo->OptimizeFlag & OPTIMIZE_IMM )
        {
            // IMULI : intel insn can't mult to tos in place must use reg ...
            // _Compile_IMUL ( cell mod, cell reg, cell rm, cell sib, cell disp )
            _Compile_Group3 ( op, compiler->optInfo->Optimize_Mod, ACC, REX_B | MODRM_B, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp,
                compiler->optInfo->Optimize_Imm ) ;
        }
        else
        {
            //_Compile_IMUL ( cell mod, cell reg, cell rm, cell sib, cell disp )
            _Compile_Group3 ( op, compiler->optInfo->Optimize_Mod, ACC, REX_B | MODRM_B, compiler->optInfo->Optimize_Rm, 0,
                compiler->optInfo->Optimize_Disp ) ;
        }
        zero->StackPushRegisterCode = Here ;
        _Compile_Stack_PushReg ( DSP, ACC ) ;
    }
    else
    {
        Compile_Pop_To_Acc ( DSP ) ;
        //Compile_IMUL ( cell mod, cell reg, cell rm, sib, disp, imm, size )
        _Compile_Group3 ( op, MEM, ACC, REX_B | MODRM_B, DSP, 0, 0 ) ;
        //zero->StackPushRegisterCode = Here ;
        Compile_Move_ACC_To_TOS ( DSP ) ;
    }
}

void
Compile_Multiply ( Compiler * compiler )
{
    Compile_X_Group3 ( compiler, MUL ) ;
}
#endif

void
Compile_Multiply ( Compiler * compiler )
{
    //if ( CheckOptimizeOperands ( compiler, 6 ) ) // 6 : especially for the factorial - qexp, bexp 
    //DBI_ON ;
    int64 optFlag = CheckOptimize ( compiler, 6 ) ;
    if ( optFlag & OPTIMIZE_DONE ) return ;
    else if ( optFlag )
    {
        // optimizer must have put args in ACC and OREG
        // always uses RAX as the first operand and destination of the operation
        if ( ! ( compiler->optInfo->OptimizeFlag & OPTIMIZE_REGISTER ) ) compiler->optInfo->Optimize_Reg = ACC ;
        else
        {
            compiler->optInfo->Optimize_Rm = compiler->optInfo->Optimize_SrcReg ;
            compiler->optInfo->Optimize_Reg = compiler->optInfo->Optimize_DstReg ;
        }
        if ( compiler->optInfo->Optimize_DstReg != ACC ) _Compile_Move_Reg_To_Reg ( ACC, compiler->optInfo->Optimize_DstReg ) ;
        Compile_MUL ( compiler->optInfo->Optimize_Mod, compiler->optInfo->Optimize_Rm, REX_B | MODRM_B | DISP_B, 0,
            compiler->optInfo->Optimize_Disp, 0, CELL_SIZE ) ;
        if ( compiler->optInfo->Optimize_DstReg != ACC ) _Compile_Move_Reg_To_Reg ( compiler->optInfo->Optimize_DstReg, ACC ) ;
        //if ( GetState ( _Context_, C_SYNTAX ) ) _Stack_DropN ( _Context_->Compiler0->WordStack, 2 ) ;
        Word * zero = Compiler_WordList ( 0 ) ;
        zero->StackPushRegisterCode = Here ;
        if ( compiler->optInfo->Optimize_Rm == DSP ) Compile_Move_ACC_To_TOS ( DSP ) ;
        else _Word_CompileAndRecord_PushReg ( zero, compiler->optInfo->Optimize_DstReg ? compiler->optInfo->Optimize_DstReg : ACC ) ;
    }
    else
    {
        Compile_Pop_To_Acc ( DSP ) ;
        //Compile_IMUL ( cell mod, cell reg, cell rm, sib, disp, imm, size )
        //_Compile_IMUL ( MEM, ACC, DSP, REX_B | MODRM_B | DISP_B, 0, 0 ) ;
        Compile_MUL ( MEM, DSP, REX_B | MODRM_B | DISP_B, 0, 0, 0, CELL_SIZE ) ;
        //zero->StackPushRegisterCode = Here ;
        Compile_Move_ACC_To_TOS ( DSP ) ;
    }
    //DBI_OFF ;
}

#define DIVIDE 1
#define MOD 2
// ( a b -- a / b ) dividend in edx:eax, quotient in eax, remainder in edx ; immediate divisor in ecx

void
_Compile_Divide ( Compiler * compiler, uint64 type )
{
    int8 reg ;
    // dividend in edx:eax, quotient/divisor in eax, remainder in edx
    int64 optFlag = CheckOptimize ( compiler, 5 ) ;
    if ( optFlag & OPTIMIZE_DONE ) return ;
    else if ( optFlag )
    {
        _Compile_MoveImm ( REG, RDX, IMM_B | REX_B | MODRM_B | DISP_B, 0, 0, 0, CELL ) ;
        _Compile_Move_Reg_To_Reg ( ACC, ACC ) ;
        // for idiv the dividend must be eax:edx, divisor can be reg or rm ; here we use ECX
        // idiv eax by reg or mem
        // Compile_IDIV ( mod, rm, sib, disp, imm, size )
        Compile_IDIV ( compiler->optInfo->Optimize_Mod, compiler->optInfo->Optimize_Rm, ( ( compiler->optInfo->Optimize_Disp != 0 ) ? DISP_B : 0 ), 0,
            compiler->optInfo->Optimize_Disp, 0, 0 ) ;
        //_Compile_Move_Reg_To_Reg ( R8D, RAX ) ;
        if ( type == MOD ) reg = RDX ;
        else reg = ACC ;
        _Compile_Move_Reg_To_Reg ( ACC, reg ) ; // for consistency finally use R8 so optInfo can always count on eax as the pushed reg
        //Word * zero = Compiler_WordStack ( 0 ) ;
        //Word * zero = Compiler_WordList ( 0 ) ;
        //zero->StackPushRegisterCode = Here ;
        //_Compile_Stack_PushReg ( DSP, R8 ) ;
        _Word_CompileAndRecord_PushReg ( Compiler_WordList ( 0 ), ACC ) ;
    }
    else
    {
        // 64 bit dividend EDX:R8 / srcReg
        // EDX holds high order bits
        _Compile_Move_StackN_To_Reg ( ACC, DSP, - 1 ) ;
        _Compile_MoveImm ( REG, RDX, IMM_B | REX_B | MODRM_B | DISP_B, 0, 0, 0, CELL ) ;
        Compile_IDIV ( MEM, DSP, 0, 0, 0, 0, 0 ) ;
        _Compile_Stack_DropN ( DSP, 1 ) ;
        if ( type == MOD ) reg = RDX ; //_Compile_Move_Reg_To_Reg ( R8, EDX ) ; // for consistency finally use R8 so optInfo can always count on eax as the pushed reg
        else reg = ACC ; //Compile_Move_R8_To_TOS ( DSP ) ;
        _Compile_Move_Reg_To_StackN ( DSP, 0, reg ) ;
        return ;
    }
    //if ( GetState ( _Context_, C_SYNTAX ) ) _Stack_DropN ( _Context_->Compiler0->WordStack, 2 ) ;
}

void
Compile_Divide ( Compiler * compiler )
{
    _Compile_Divide ( compiler, DIVIDE ) ;
}

// ( a b -- a / b ) quotient in eax, divisor and remainder in edx

void
Compile_Mod ( Compiler * compiler )
{
    _Compile_Divide ( compiler, MOD ) ;
}

// ( x n -- )
// C : "x += n" :: cfrTil : "x n +="

// X variable op compile for group 1 opCodes - ia32 

void
Compile_Group1_X_OpEqual ( Compiler * compiler, int64 op ) // +=/-= operationCode
{
#if 0    
    if ( ( GetState ( _Context_, C_SYNTAX ) ) && ( ! GetState ( compiler, C_INFIX_EQUAL ) ) )
    {
        Word * zero = Compiler_WordList ( 0 ) ;
        _CfrTil_C_Infix_EqualOp ( zero ) ;
    }
    else
#endif        
    {
        if ( CheckOptimize ( compiler, 5 ) )
        {
            _Compile_optInfo_X_Group1 ( compiler, op ) ;
        }
        else
        {
            // next :
            // EBX is used by compiler as register variable in some combinators
            _Compile_Move_StackN_To_Reg ( ACC, DSP, 0 ) ; // n
            _Compile_Move_StackN_To_Reg ( OREG, DSP, - 1 ) ; // x
            Compile_SUBI ( REG, DSP, 0, 2 * CELL_SIZE, BYTE ) ;
            //Compile_ADD ( MEM, MEM, R8, ECX, 0, 0, CELL ) ;
            //_Compile_Group1 ( ADD, toRegOrMem, mod, reg, rm, sib, disp, isize )
            _Compile_X_Group1 ( op, MEM, MEM, ACC, OREG, 0, 0, CELL ) ;
        }
    }
}

void
Compile_MultiplyEqual ( Compiler * compiler )
{
    if ( ( GetState ( _Context_, C_SYNTAX ) ) && ( ! GetState ( compiler, C_INFIX_EQUAL ) ) )
    {
        Word * zero = Compiler_WordList ( 0 ) ;
        _CfrTil_C_Infix_EqualOp ( zero ) ;
    }
    else
    {

        if ( CheckOptimize ( compiler, 5 ) )
        {
            // address is in R8
            // Compile_IMUL ( mod, rm, sib, disp, imm, size )
            //_Compile_IMULI ( cell mod, cell reg, cell rm, cell sib, cell disp, cell imm, cell size )
            if ( compiler->optInfo->UseReg ) _Compile_Move_Reg_To_Reg ( THRU_REG, compiler->optInfo->UseReg ) ;
            else
            {
                _Compile_Move_Reg_To_Reg ( THRU_REG, ACC ) ;
                _Compile_Move_Rm_To_Reg ( ACC, THRU_REG, 0 ) ;
            }
            if ( compiler->optInfo->OptimizeFlag & OPTIMIZE_IMM )
            {
                //_Compile_IMULI ( MEM, compiler->optInfo->Optimize_Reg, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp,
                //    compiler->optInfo->Optimize_Imm, CELL ) ;
                Compile_MUL ( MEM, compiler->optInfo->Optimize_Rm, REX_B | MODRM_B | DISP_B, 0,
                    compiler->optInfo->Optimize_Disp, compiler->optInfo->Optimize_Imm, CELL_SIZE ) ;
            }
            else
            {
                // address is in R8
                //_Compile_IMUL_Reg ( cell mod, cell reg, cell rm, cell sib, cell disp )
                //_Compile_IMUL ( compiler->optInfo->Optimize_Mod, compiler->optInfo->Optimize_Reg, compiler->optInfo->Optimize_Rm, REX_B | MODRM_B | DISP_B, 0,
                //    compiler->optInfo->Optimize_Disp ) ;
                Compile_MUL ( compiler->optInfo->Optimize_Mod, compiler->optInfo->Optimize_Rm, REX_B | MODRM_B | DISP_B, 0,
                    compiler->optInfo->Optimize_Disp, 0, CELL_SIZE ) ;
            }
            _Compile_Move_Reg_To_Rm ( THRU_REG, ACC, 0 ) ;
        }
        else
        {
            _Compile_Move_StackNRm_To_Reg ( ACC, DSP, - 1 ) ;
            //_Compile_IMUL ( MEM, ACC, DSP, REX_B | MODRM_B | DISP_B, 0, 0 ) ;
            Compile_MUL ( MEM, DSP, REX_B | MODRM_B | DISP_B, 0, 0, 0, CELL_SIZE ) ;
            _Compile_Stack_Drop ( DSP ) ;
            _Compile_Move_Reg_To_StackNRm_UsingReg ( DSP, 0, ACC, OREG ) ;
        }
    }
}

void
Compile_DivideEqual ( Compiler * compiler )
{
    if ( ( GetState ( _Context_, C_SYNTAX ) ) && ( ! GetState ( compiler, C_INFIX_EQUAL ) ) )
    {
        Word * zero = Compiler_WordList ( 0 ) ;
        _CfrTil_C_Infix_EqualOp ( zero ) ;
    }
    else
    {
        // for idiv the dividend must be eax:edx, divisor can be reg or rm
        // idiv eax by reg or mem
        if ( CheckOptimize ( compiler, 5 ) )
        {
            // assumes destination address is in EBX
            //_Compile_Move_Reg_To_Reg ( EBX, R8 ) ;
            _Compile_Move_Reg_To_Reg ( THRU_REG, ACC ) ; //R8D ) ; //compiler->optInfo->UseReg ) ;
            _Compile_Move_Rm_To_Reg ( ACC, THRU_REG, 0 ) ;
            _Compile_MoveImm ( REG, RDX, IMM_B | REX_B | MODRM_B, 0, 0, 0, CELL ) ;
            // Compile_IDIV( mod, rm, sib, disp, imm, size )
            if ( compiler->optInfo->OptimizeFlag & OPTIMIZE_IMM )
            {
                _Compile_MoveImm ( REG, OREG, IMM_B | REX_B | MODRM_B, 0, 0, compiler->optInfo->Optimize_Imm, CELL ) ;
                //Compile_IDIV ( REG, R9D, 0, 0, 0, 0, 0 ) ;
                Compile_IDIV ( REG, OREG, 0, 0, 0, 0, 0 ) ;
            }
            else
            {
                Compile_DIV ( compiler->optInfo->Optimize_Mod, compiler->optInfo->Optimize_Rm, REX_B | MODRM_B | DISP_B, 0,
                    compiler->optInfo->Optimize_Disp, 0, CELL_SIZE ) ;
            }
            _Compile_Move_Reg_To_Rm ( THRU_REG, ACC, 0 ) ; // move result to destination
        }
        else
        {
            _Compile_Move_StackNRm_To_Reg ( ACC, DSP, - 1 ) ; // address of dividend is second on stack
            _Compile_MoveImm ( REG, RDX, IMM_B | REX_B | MODRM_B | DISP_B, 0, 0, 0, CELL ) ;
            Compile_IDIV ( MEM, DSP, 0, 0, 0, 0, 0 ) ; // divisor is tos
            _Compile_Stack_Drop ( DSP ) ;
            _Compile_Move_Reg_To_StackNRm_UsingReg ( DSP, 0, ACC, THRU_REG ) ;
        }
    }
}

void
_CfrTil_Do_IncDec ( int64 op )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    if ( CompileMode )
    {
        Compile_X_Group5 ( compiler, op ) ; // ? INC : DEC ) ; //, RVALUE ) ;
    }
    else
    {
        int64 sd = List_Depth ( compiler->WordList ) ;
        Word *one = ( Word* ) Compiler_WordList ( 1 ) ; // the operand
        if ( op == INC )
        {
            if ( ( sd > 1 ) && one->CAttribute & ( PARAMETER_VARIABLE | LOCAL_VARIABLE | NAMESPACE_VARIABLE ) )
            {
                *( ( int64* ) ( TOS ) ) += 1 ;
                DataStack_Drop ( ) ;
            }
            else _Dsp_ [0] ++ ;
        }
        else
        {
            if ( ( sd > 1 ) && one->CAttribute & ( PARAMETER_VARIABLE | LOCAL_VARIABLE | NAMESPACE_VARIABLE ) )
            {
                *( ( int64* ) ( TOS ) ) -= 1 ;
                DataStack_Drop ( ) ;
            }
            else _Dsp_ [0] -- ;
        }
        //_CfrTil_->set_DspReg_FromDataStackPointer ( ) ; // update DSP reg
    }
}

