#include "../../include/cfrtil64.h"

// X variable op compile for group 5 opCodes - inc/dec - ia32 

inline int64
Abs ( int64 x )
{
    return (( int64 ) ( ( ( x ) >= 0 ) ? ( x ) : ( - ( x ) ) ) ) ;
}

void
Compile_Minus ( Compiler * compiler )
{
    Compile_X_Group1 ( compiler, SUB, TTT_ZERO, NEGFLAG_NZ ) ;
}

void
Compile_Plus ( Compiler * compiler )
{
    Compile_X_Group1 ( compiler, ADD, TTT_ZERO, NEGFLAG_NZ ) ;
}

void
Compile_Multiply ( Compiler * compiler )
{
    int64 optSetupFlag = Compiler_CheckOptimize ( compiler, 0 ) ;
    if ( optSetupFlag & OPTIMIZE_DONE ) return ;
    else if ( optSetupFlag )
    {
        CompileOptimizeInfo * optInfo = compiler->OptInfo ; //Compiler_CheckOptimize may change the optInfo
        //_Compile_IMUL ( int8 mod, int8 reg, int8 rm, int8 sib, int64 disp, uint64 imm )
        //optInfo->Optimize_Reg = ACC ; // emulate MUL
        Compiler_SCA_Word_SetCodingHere_And_ClearPreviousUse ( optInfo->opWord, 1 ) ;
        _Compile_IMUL ( optInfo->Optimize_Mod, optInfo->Optimize_Reg, optInfo->Optimize_Rm, 0, optInfo->Optimize_Disp, 0 ) ;
        if ( optInfo->Optimize_Rm == DSP ) _Compile_Move_Reg_To_StackN ( DSP, 0, optInfo->Optimize_Reg ) ;
        else _Word_CompileAndRecord_PushReg (_CfrTil_WordList ( 0 ), optInfo->Optimize_Reg , true) ;
    }
    else
    {
        Compile_Pop_To_Acc ( DSP ) ;
        //Compile_IMUL ( cell mod, cell reg, cell rm, sib, disp, imm, size )
        Compiler_WordStack_SCHCPUSCA ( 0, 1 ) ;
        Compile_MUL ( MEM, DSP, REX_W | MODRM_B | DISP_B, 0, 0, 0, CELL_SIZE ) ;
        _CfrTil_WordList ( 0 )->StackPushRegisterCode = Here ;
        Compile_Move_ACC_To_TOS ( DSP ) ;
    }
    //DBI_OFF ;
}
// ( a b -- a / b ) dividend in edx:eax, quotient in eax, remainder in edx ; immediate divisor in ecx

void
_Compile_Divide ( Compiler * compiler, uint64 type )
{
    Boolean reg ;
    // dividend in edx:eax, quotient/divisor in eax, remainder in edx
    int64 optSetupFlag = Compiler_CheckOptimize ( compiler, 0 ) ;
    if ( optSetupFlag & OPTIMIZE_DONE ) return ;
    else if ( optSetupFlag )
    {
        CompileOptimizeInfo * optInfo = compiler->OptInfo ; //Compiler_CheckOptimize may change the optInfo
        //Compiler_SCA_Word_SetCodingHere_And_ClearPreviousUse (optInfo->opWord, 0) ;
        Compile_MoveImm ( REG, RDX, 0, 0, CELL ) ;
#if 0        
        if ( optInfo->OptimizeFlag & OPTIMIZE_IMM )
        {
            Boolean reg = optInfo->wordArg1_literal ? ACC : OREG ;
            Compile_MoveImm_To_Reg ( reg, ( int64 ) optInfo->Optimize_Imm, CELL ) ;
            optInfo->Optimize_Rm = ( reg == ACC ) ? OREG : ACC ; //optInfo->wordArg1ACC_literal ? OREG : ACC ; //reg ;
            optInfo->Optimize_Mod = REG ;
        }
#endif        
        // Compile_IDIV( mod, rm, controlFlag, sib, disp, imm, size )
        Compile_IDIV ( optInfo->Optimize_Mod, optInfo->Optimize_Rm, ( ( optInfo->Optimize_Disp != 0 ) ? DISP_B : 0 ), 0, optInfo->Optimize_Disp, 0, 0 ) ;
        if ( type == MODULO ) reg = RDX ;
        else reg = ACC ;
        if ( reg != ACC ) Compile_Move_Reg_To_Reg (ACC, reg , 0) ; // for consistency finally use RAX so optInfo can always count on rax as the pushed reg
        CfrTil_CompileAndRecord_Word0_PushReg (ACC, true) ;
    }
    else
    {
        // 64 bit dividend EDX:R8 / srcReg
        // EDX holds high order bits
        _Compile_Move_StackN_To_Reg ( ACC, DSP, - 1 ) ;
        Compile_MoveImm ( REG, RDX, 0, 0, CELL ) ;
        //Compiler_WordStack_SCHCPUSCA (0, 0) ;
        Compile_IDIV ( MEM, DSP, 0, 0, 0, 0, 0 ) ;
        _Compile_Stack_DropN ( DSP, 1 ) ;
        if ( type == MODULO ) reg = RDX ;
        else reg = ACC ;
        _Compile_Move_Reg_To_StackN ( DSP, 0, reg ) ;
        return ;
    }
    //if ( GetState ( _Context_, C_SYNTAX ) ) _Stack_DropN ( _Context_->Compiler0->WordStack, 2 ) ;
}

void
Compile_Divide ( Compiler * compiler )
{
    _Compile_Divide ( compiler, DIV ) ;
}

// ( a b -- a / b ) quotient in eax, divisor and remainder in edx

void
Compile_Mod ( Compiler * compiler )
{
    _Compile_Divide ( compiler, MODULO ) ;
}

void
_Compile_optInfo_X_Group1 ( Compiler * compiler, int64 op )
{
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    if ( ( optInfo->OptimizeFlag & OPTIMIZE_IMM ) || optInfo->Optimize_Imm )
    {
        int64 imm = optInfo->Optimize_Imm ;
        // Compile_SUBI( mod, operandReg, offset, immediateData, size )
        //Compiler_SCA_Word_SetCodingHere_And_ClearPreviousUse (optInfo->opWord, 1) ;
        _Compile_X_Group1_Immediate ( op, optInfo->Optimize_Mod,
            optInfo->Optimize_Rm, optInfo->Optimize_Disp,
            optInfo->Optimize_Imm, ( imm >= 0x100000000 ) ? CELL : ( ( imm >= 0x100 ) ? 4 : 1 ) ) ;
    }
    else
    {
        // _Compile_Group1 ( int64 code, int64 toRegOrMem, int64 mod, int8 reg, int8 rm, int8 sib, int64 disp, int64 osize )
        //Compiler_SCA_Word_SetCodingHere_And_ClearPreviousUse (optInfo->opWord, 0) ;
        _Compile_X_Group1 ( op, optInfo->Optimize_Dest_RegOrMem, optInfo->Optimize_Mod,
            optInfo->Optimize_Reg, optInfo->Optimize_Rm, 0,
            optInfo->Optimize_Disp, CELL_SIZE ) ;
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
        Compiler_WordStack_SCHCPUSCA ( 0, 0 ) ;
        int64 sd = List_Depth ( _CfrTil_->Compiler_N_M_Node_WordList ) ;
        Word *one = ( Word* ) _CfrTil_WordList ( 1 ) ; // the operand
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

void
CfrTil_IncDec ( int64 op ) // ++/--
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    int64 sd = List_Depth ( _CfrTil_->Compiler_N_M_Node_WordList ) ;
    if ( ( sd > 1 ) && ( ! GetState ( compiler, LC_CFRTIL ) ) ) //|INFIX_LIST_INTERPRET ) )
    {
        Word * currentWord = _CfrTil_WordList ( 0 ) ; //_Context_CurrentWord ( cntx ) ;
        //Word * currentWord = _Context_CurrentWord ( cntx ) ;
        Word *two = 0, *one = ( Word* ) _CfrTil_WordList ( 1 ) ; // the operand
        if ( GetState ( _Context_, C_SYNTAX ) && ( one->CAttribute & CATEGORY_OP ) && ( ! ( one->CAttribute & CATEGORY_OP_LOAD ) ) ) one = two = _CfrTil_WordList ( 2 ) ; 
        byte * nextToken = Lexer_Peek_Next_NonDebugTokenWord ( cntx->Lexer0, 1, 0 ) ;
        Word * nextWord = Finder_Word_FindUsing ( cntx->Interpreter0->Finder0, nextToken, 0 ) ;
        //SetState ( _Debugger_, DEBUG_SHTL_OFF, true ) ;
        if ( nextWord && ( nextWord->CAttribute & ( CATEGORY_OP_ORDERED | CATEGORY_OP_UNORDERED | CATEGORY_OP_DIVIDE | CATEGORY_OP_EQUAL ) ) ) // postfix
        {
            List_DropN ( _CfrTil_->Compiler_N_M_Node_WordList, 1 ) ; // the operator; let higher level see the variable
            if ( GetState ( compiler, C_INFIX_EQUAL ) && GetState ( _CfrTil_, OPTIMIZE_ON ) && CompileMode )
            {
                //if ( one ) SetHere (one->Coding, 1) ;
                // ?? couldn't this stuff be done with _Interpret_C_Until_EitherToken ??
                dllist * postfixList = List_New ( SESSION ) ;
                List_Push_1Value_NewNode_T_WORD ( postfixList, ( int64 ) currentWord, COMPILER_TEMP ) ;
                if ( one ) List_Push_1Value_NewNode_T_WORD ( postfixList, ( int64 ) one, COMPILER_TEMP ) ;
                List_Push_1Value_NewNode_T_WORD ( compiler->PostfixLists, ( int64 ) postfixList, COMPILER_TEMP ) ;
                return ;
            }
            else
            {
                Interpreter_InterpretNextToken ( cntx->Interpreter0 ) ;
                if ( sd > 1 )
                {
                    Interpreter_DoWord ( cntx->Interpreter0, one, - 1, - 1 ) ;
                    Interpreter_DoWord ( cntx->Interpreter0, currentWord, - 1, - 1 ) ;
                    return ;
                }
            }
        }
        if ( one && one->CAttribute & ( PARAMETER_VARIABLE | LOCAL_VARIABLE | NAMESPACE_VARIABLE ) )
        {
            if ( GetState ( _Context_, C_SYNTAX ) )
            {
                if ( ! GetState ( compiler, INFIX_LIST_INTERPRET ) )
                {
                    List_DropN ( _CfrTil_->Compiler_N_M_Node_WordList, 1 ) ; // the operator; let higher level see the variable
                    if ( GetState ( _CfrTil_, OPTIMIZE_ON ) && ( ! two ) ) SetHere ( one->Coding, 1 ) ;
                    CfrTil_WordList_PushWord ( one ) ;
                    dllist * postfixList = List_New ( SESSION ) ;
                    List_Push_1Value_NewNode_T_WORD ( postfixList, ( int64 ) currentWord, COMPILER_TEMP ) ;
                    List_Push_1Value_NewNode_T_WORD ( postfixList, ( int64 ) one, COMPILER_TEMP ) ;
                    List_Push_1Value_NewNode_T_WORD ( compiler->PostfixLists, ( int64 ) postfixList, COMPILER_TEMP ) ;
                    List_DropN ( _CfrTil_->Compiler_N_M_Node_WordList, 1 ) ; // the operator; let higher level see the variable for optimization
                    return ;
                }
            }
        }
        else if ( nextWord && ( nextWord->CAttribute & ( PARAMETER_VARIABLE | LOCAL_VARIABLE | NAMESPACE_VARIABLE ) ) ) // prefix
        {
            if ( String_Equal ( currentWord->Name, "++" ) ) op = INC ;
            else op = DEC ;
            if ( nextWord->CAttribute & ( PARAMETER_VARIABLE | LOCAL_VARIABLE ) )
            {
                _Compile_Group5 ( op, MEM, FP, 0, LocalOrParameterVar_Disp ( nextWord ), 0 ) ;
            }
            else // crash ; FIXME!!
            {
                _Compile_Move_Literal_Immediate_To_Reg ( THRU_REG, ( int64 ) nextWord->W_PtrToValue ) ;
                Compile_Move_Rm_To_Reg (ACC, THRU_REG, 0 , 0) ;
                _Compile_Group5 ( op, REG, ACC, 0, 0, 0 ) ;
                Compile_Move_Reg_To_Rm (THRU_REG, ACC, 0 , 0) ;

            }
            return ;
        }
        else
        {
            if ( GetState ( compiler, C_INFIX_EQUAL ) )
            {
                if ( ! GetState ( compiler, INFIX_LIST_INTERPRET ) ) // new logic test ??
                {
                    int64 i ;
                    Word * word ;
                    dllist * postfixList = List_New ( SESSION ) ;
                    List_Push_1Value_NewNode_T_WORD ( postfixList, ( int64 ) currentWord, COMPILER_TEMP ) ; // remember : this will be lifo
                    for ( i = 1 ; word = _CfrTil_WordList ( i ), ( word->CAttribute & ( CATEGORY_OP_ORDERED | CATEGORY_OP_UNORDERED | CATEGORY_OP_DIVIDE | CATEGORY_OP_EQUAL ) ) ; i ++ ) ;
                    List_Push_1Value_NewNode_T_WORD ( postfixList, ( int64 ) _CfrTil_WordList ( i ), COMPILER_TEMP ) ;
                    List_Push_1Value_NewNode_T_WORD ( compiler->PostfixLists, ( int64 ) postfixList, COMPILER_TEMP ) ;
                    List_DropN ( _CfrTil_->Compiler_N_M_Node_WordList, 1 ) ; // the operator; let higher level see the variable for optimization
                    return ;
                }
            }
        }
    }
    _CfrTil_Do_IncDec ( op ) ;
    SetState ( _Debugger_, DEBUG_SHTL_OFF, false ) ;
}


