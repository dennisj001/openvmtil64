
#include "../../include/cfrtil64.h"

// ?!? this file could be reworked for simplity, elegance and integration ?!?

void
CfrTil_If ( )
{
    if ( CompileMode )
    {
        _Compile_Jcc ( 0, 0, NZ, ZERO_TTT ) ;
        // N, ZERO : use inline|optimize logic which needs to get flags immediately from a 'cmp', jmp if the zero flag is not set
        // for non-inline|optimize ( reverse polarity : cf. _Compile_Jcc comment ) : jmp if cc is not true; cc is set by setcc after 
        // the cmp, or is a value on the stack. 
        // We cmp that value with zero and jmp if this second cmp sets the flag to zero else do the immediately following block code
        // ?? an explanation of the relation of the setcc terms with the flags is not clear to me yet (20110801) from the intel literature ?? 
        // but by trial and error this works; the logic i use is given in _Compile_Jcc.
        // ?? if there are problems check this area ?? cf. http://webster.cs.ucr.edu/AoA/Windows/HTML/IntegerArithmetic.html
        Stack_PointerToJmpOffset_Set ( ) ;
    }
    else
    {
        if ( String_IsPreviousCharA_ ( _Context_->ReadLiner0->InputLine, _Context_->Lexer0->TokenStart_ReadLineIndex - 1, '}' ) ) CfrTil_If2Combinator ( ) ;
        else if ( String_IsPreviousCharA_ ( _Context_->ReadLiner0->InputLine, _Context_->Lexer0->TokenStart_ReadLineIndex - 1, '#' ) ) CfrTil_If_ConditionalInterpret ( ) ;
        else if ( GetState ( _Context_, C_SYNTAX | PREFIX_MODE | INFIX_MODE ) ) CfrTil_If_C_Combinator ( ) ;
        else
        {
            Interpreter * interp = _Context_->Interpreter0 ;
            if ( DataStack_Pop ( ) )
            {
                // interpret until "else" or "endif"
                byte * token = _Interpret_C_Until_EitherToken ( interp, ( byte* ) "else", ( byte* ) "endif", 0, 0 ) ;
                //if ( ( rtrn == 2 ) || ( rtrn == 0 ) ) return ;
                if ( ( token == 0 ) || ( String_Equal ( token, "endif" ) ) ) return ;
                Parse_SkipUntil_Token ( ( byte* ) "endif" ) ;

            }
            else
            {
                // skip until "else"
                Parse_SkipUntil_Token ( ( byte* ) "else" ) ;
                _Interpret_Until_Token ( interp, ( byte* ) "endif", 0 ) ;
            }
        }
    }
}

// same as CfrTil_JMP

void
CfrTil_Else ( )
{
    if ( CompileMode )
    {
        _Compile_UninitializedJump ( ) ; // at the end of the 'if block' we need to jmp over the 'else block'
        CfrTil_CalculateAndSetPreviousJmpOffset_ToHere ( ) ;
        Stack_PointerToJmpOffset_Set ( ) ;
    }
    else
    {
        if ( String_IsPreviousCharA_ ( _Context_->ReadLiner0->InputLine, _Context_->Lexer0->TokenStart_ReadLineIndex - 1, '#' ) ) CfrTil_Else_ConditionalInterpret ( ) ;
        else
        {
            _Interpret_Until_Token ( _Context_->Interpreter0, ( byte* ) "endif", 0 ) ;
        }
    }
}

void
CfrTil_EndIf ( )
{
    if ( CompileMode )
    {
        CfrTil_CalculateAndSetPreviousJmpOffset_ToHere ( ) ;
    }
    //else { ; //nop  }
}

// ttt n : notation from intel manual 253667 ( N-Z ) - table B-10 : ttt = condition codes, n is a negation bit
// tttn notation is used with the SET and JCC instructions

// note : intex syntax  : instruction dst, src
//        att   syntax  : instruction src, dst
// cmp : compares by subtracting src from dst, dst - src, and setting eflags like a "sub" insn 
// eflags affected : cf of sf zf af pf : Intel Instrucion Set Reference Manual for "cmp"
// ?? can this be done better with test/jcc ??
// want to use 'test eax, 0' as a 0Branch (cf. jonesforth) basis for all block conditionals like if/else, do/while, for ...

void
Compile_Cmp_Set_tttn_Logic ( Compiler * compiler, int64 ttt, int64 negateFlag )
{
    //SC_ForcePush ( _Context_->CurrentlyRunningWord ) ;
    //SC_SetForcePush ( true ) ;
    int8 reg = ACC ;
    int64 optFlag = CheckOptimize ( compiler, 5 ) ;
#define dbgON_13 0
#if dbgON_13    
    d1 ( byte * here = Here ) ;
#endif    
    if ( optFlag & OPTIMIZE_DONE ) return ;
    else if ( optFlag )
    {
#if 1  // clears the stack     
        if ( ( optFlag == 2 ) && ( compiler->OptInfo->Optimize_Rm == DSP ) )
        {
            //DBI_ON ;
            _Compile_Stack_PopToReg ( DSP, ACC ) ; // assuming optimize always uses R8 first
            compiler->OptInfo->Optimize_Rm = ACC ;
            compiler->OptInfo->Optimize_Mod = REG ;
        }
#endif        
        //DBI_ON ;
        if ( compiler->OptInfo->OptimizeFlag & OPTIMIZE_IMM )
        {
            if ( ( ttt == EQUAL ) && ( compiler->OptInfo->Optimize_Imm == 0 ) ) //Compile_TEST ( compiler->OptInfo->Optimize_Mod, compiler->OptInfo->Optimize_Rm, 0, compiler->OptInfo->Optimize_Disp, compiler->OptInfo->Optimize_Imm, CELL ) ;
            {
                if ( compiler->OptInfo->COIW [2]->StackPushRegisterCode ) SetHere ( compiler->OptInfo->COIW [2]->StackPushRegisterCode ) ; // leave optInfo_0_two value in ACCUM we don't need to push it
                _Compile_TEST_Reg_To_Reg ( ACC, ACC ) ;
            }
            else
            {
                int64 size ;
                if ( compiler->OptInfo->Optimize_Imm >= 0x100000000 )
                {
                    // considering _Compile_X_Group1_Immediate ( int8 code, int8 mod, int8 rm, int64 disp, uint64 imm, int8 iSize ) with size == 8
                    size = 8 ;
                    negateFlag = ! negateFlag ;
                    //reg = OREG2 ;
                }
                else size = 0 ;
                //_DBI_ON ;
                // Compile_CMPI( mod, operandReg, offset, immediateData, size
                Compile_CMPI ( compiler->OptInfo->Optimize_Mod, compiler->OptInfo->Optimize_Rm, compiler->OptInfo->Optimize_Disp, compiler->OptInfo->Optimize_Imm, size ) ;
            }
        }
        else
        {
            // Compile_CMP( toRegOrMem, mod, reg, rm, sib, disp )
            Compile_CMP ( compiler->OptInfo->Optimize_Dest_RegOrMem, compiler->OptInfo->Optimize_Mod,
                compiler->OptInfo->Optimize_Reg, compiler->OptInfo->Optimize_Rm, 0, compiler->OptInfo->Optimize_Disp, CELL_SIZE ) ;
        }
    }
    else
    {
        _Compile_Move_StackN_To_Reg ( OREG, DSP, 0 ) ;
        _Compile_Move_StackN_To_Reg ( ACC, DSP, - 1 ) ;
        // must do the DropN before the CMP because CMP sets eflags 
        _Compile_Stack_DropN ( DSP, 2 ) ; // before cmp 
        Compile_CMP ( REG, REG, ACC, OREG, 0, 0, CELL ) ;
    }
    _Compile_SETcc_tttn_REG ( ttt, negateFlag, reg ) ; // immediately after the 'cmp' insn which changes the flags appropriately
    _Compile_MOVZX_REG ( reg ) ;
    //Compiler_CompileAndRecord_PushAccum ( compiler ) ;
    _Compiler_CompileAndRecord_PushAccum ( compiler, ACC ) ;
    //DBI_OFF ;
#if dbgON_13    
    d1 ( //if ( DBI )
    {
        d1 ( _Printf ( ( byte* ) "\nCompile_Cmp_Set_tttn_Logic :" ) ) ;
        d1 ( _Debugger_Disassemble ( _Debugger_, ( byte* ) here, Here - here, 0 ) ) ;
    } ) ;
#endif    
    //DBI_OFF ;
}

// SET : 0x0f 0x9tttn mod 000 rm/reg
// ?!? wanna use TEST insn here to eliminate need for _Compile_MOVZX_REG insn ?!? is that possible

void
_Compile_SETcc ( int8 ttt, int8 negFlag, int8 reg )
{
#define dbgON_11 0
#if dbgON_11    
    d1 ( byte * here = Here ) ;
#endif    
    //SC_ForcePush ( _Context_->CurrentlyRunningWord ) ;
    //SC_SetForcePush ( true ) ;
    //int8 rex = _Calculate_Rex ( reg, 0, 1 ) ;//( immSize == 8 ) || ( controlFlag & REX_B ) ) ;
    int8 rex = Calculate_Rex ( 0, reg, 0 ) ; //( immSize == 8 ) || ( controlFlag & REX_B ) ) ;
    if ( rex ) _Compile_Int8 ( rex ) ;
    _Compile_Int8 ( ( byte ) 0x0f ) ;
    _Compile_Int8 ( ( 0x9 << 4 ) | ( ttt << 1 ) | negFlag ) ;
    _Compile_Int8 ( CalculateModRmByte ( REG, 0, reg, 0, 0 ) ) ;
#if dbgON_11    
    d1 ( //if ( DBI )
    {
        d1 ( _Printf ( ( byte* ) "\n_Compile_SETcc :" ) ) ;
        d1 ( Debugger_UdisOneInstruction ( _Debugger_, here, ( byte* ) "", ( byte* ) "" ) ; ) ;
    } ) ;
#endif    
}

void
_Compile_SETcc_tttn_REG ( int8 ttt, int8 negFlag, int8 reg )
{
    BlockInfo_Setup_BI_tttn ( _Context_->Compiler0, ttt, negFlag, 6 ) ;
    _Compile_SETcc ( ttt, negFlag, reg ) ;
}

// cf. : Compile_BlockInfoTestLogic ( Compiler * compiler, int8 reg, int8 negFlag )
void
Compile_GetLogicFromTOS ( BlockInfo * bi, byte * start )
{
    if ( bi && bi->LogicCodeWord && bi->LogicCodeWord->StackPushRegisterCode )
    {
        //if ( start ) SetHere ( start + (bi->LogicCodeWord->StackPushRegisterCode - bi->Start) ) ; else 
        _ByteArray_UnAppendSpace ( _Q_CodeByteArray, 7 ) ; // 7 : add r14, 0x8, mov [r14], rax 
        _Compile_TEST_Reg_To_Reg ( bi->LogicCodeWord->RegToUse, bi->LogicCodeWord->RegToUse ) ;
    }
    else
    {
        Compile_Pop_To_Acc ( DSP ) ;
        _Compile_TEST_Reg_To_Reg ( ACC, ACC ) ;
    }
}

int64
Compile_CheckReConfigureLogicInBlock ( BlockInfo * bi, int8 overwriteFlag )
{
    if ( GetState ( _CfrTil_, OPTIMIZE_ON | INLINE_ON ) )
    {
        byte * saveHere = Here ;
        if ( bi->JccLogicCode ) // && ( bi->LogicCodeWord->Symbol->Category & CATEGORY_LOGIC ) )
        {
            SetHere ( bi->JccLogicCode ) ;
            // standard compile of logic is overwritten for optimize and inline
            if ( overwriteFlag )
            {
                int64 i, n ;
                _Compile_Return ( ) ;
                bi->bp_Last = Here ;
                for ( i = 0, n = bi->OverWriteSize - 1; i < n ; i++ ) _Compile_Noop ( ) ; // adjust so Disassemble doesn't get an "invalid" insn; we overwrite a 3 byte insn ( 0fb6c0 : movzx eax, al ) with RET NOP NOP
                //for ( i = 0, n = (3 - 1) ; i < n ; i++ ) _Compile_Noop ( ) ; // adjust so Disassemble doesn't get an "invalid" insn; we overwrite a 3 byte insn ( 0fb6c0 : movzx eax, al ) with RET NOP NOP
                SetHere ( saveHere ) ;
            }
            return true ;
        }
    }
    return false ;
}

/*
 *  Logical operators
 */

void
Compile_BlockInfoTestLogic ( Compiler * compiler, int8 reg, int8 negFlag )
{
    BlockInfo *bi = ( BlockInfo * ) _Stack_Top ( compiler->CombinatorBlockInfoStack ) ;
#if 0    
    if ( bi->LogicCodeWord && bi->LogicCodeWord->StackPushRegisterCode ) 
        SetHere (bi->LogicCodeWord->StackPushRegisterCode) ;
#endif    
    bi->LogicTestCode = Here ;
    _Compile_TEST_Reg_To_Reg ( reg, reg ) ;
    BlockInfo_Set_tttn ( bi, ZERO_TTT, negFlag, 6 ) ; // 6 : length of jcc insn ?
}

void
Compile_TestLogicAndStackPush ( Compiler * compiler, int8 reg, int8 negFlag )
{
    Compile_BlockInfoTestLogic ( compiler, reg, negFlag ) ;
    Compiler_CompileAndRecord_PushAccum ( compiler ) ;
}

BlockInfo *
_Set_JccLogicCode ( Compiler * compiler )
{
    BlockInfo *bi = ( BlockInfo * ) _Stack_Top ( compiler->CombinatorBlockInfoStack ) ;
    bi->JccLogicCode = Here ; // used by combinators
    return bi ;
}

void
_Compile_LogicResultForStack ( int64 reg, Boolean negFlag )
{
    Compile_JCC ( negFlag, ZERO_TTT, Here + 21 ) ; // if eax is zero return not(R8) == 1 else return 0
    // return 0 in reg :
    _Compile_MoveImm_To_Reg ( reg, 0, CELL_SIZE ) ; // 6 bytes
    _Compile_JumpWithOffset ( 10 ) ; // 6 bytes

    //return 1 in reg :
    _Compile_MoveImm_To_Reg ( reg, 1, CELL_SIZE ) ;
    //_Set_JccLogicCode ( _Compiler_ ) ;
}

void
_Compile_LogicalAnd ( Compiler * compiler )
{
    Compile_BlockInfoTestLogic ( compiler, OREG, Z ) ;
    Compile_JCC ( Z, ZERO_TTT, Here + 15 ) ; // if eax is zero return not(R8) == 1 else return 0
    Compile_BlockInfoTestLogic ( compiler, ACC, NZ ) ;
    _Compile_LogicResultForStack ( ACC, NZ ) ;
    _Set_JccLogicCode ( compiler ) ;
    _Compiler_CompileAndRecord_PushAccum ( compiler, ACC ) ;
}

void
Compile_LogicalAnd ( Compiler * compiler )
{
    int64 optFlag = CheckOptimize ( compiler, 5 ) ;
    if ( optFlag & OPTIMIZE_DONE ) return ;
    else if ( optFlag )
    {
        _Compile_LogicalAnd ( compiler ) ;
    }
    else
    {
        //Word *one = Compiler_WordStack ( - 1 ) ; // assumes two values ( n m ) on the DSP stack 
        Word *one = _Compiler_WordList ( compiler, 1 ) ; // assumes two values ( n m ) on the DSP stack 
        if ( one->StackPushRegisterCode && ( one->RegToUse == ACC ) ) SetHere ( one->StackPushRegisterCode ) ;
        else _Compile_Stack_PopToReg ( DSP, ACC ) ;
        _Compile_Stack_PopToReg ( DSP, OREG ) ;
        _Compile_LogicalAnd ( compiler ) ;
    }
}

BlockInfo *
_Set_JccLogicCodeForNot ( Compiler * compiler )
{
    BlockInfo *bi = ( BlockInfo * ) _Stack_Top ( compiler->CombinatorBlockInfoStack ) ;
    bi->JccLogicCodeForNot = Here ; // used by combinators
    return bi ;
}

void
_Compile_LogicalNot ( Compiler * compiler )
{
    //_DBI_ON ;
    Compile_BlockInfoTestLogic ( compiler, ACC, Z ) ;
    _Set_JccLogicCodeForNot ( compiler ) ;
    _Compile_LogicResultForStack ( ACC, Z ) ;
    _Set_JccLogicCode ( compiler ) ;
    _Compiler_CompileAndRecord_PushAccum ( compiler, ACC ) ;
    //DBI_OFF ;
}

void
Compile_LogicalNot ( Compiler * compiler )
{
    //Word *one = Compiler_WordStack ( - 1 ) ; // assumes two values ( n m ) on the DSP stack 
    Word *one = _Compiler_WordList ( compiler, 1 ) ; // assumes two values ( n m ) on the DSP stack 
    int64 optFlag = CheckOptimize ( compiler, 2 ) ; // check especially for cases that optimize literal ops
    if ( optFlag & OPTIMIZE_DONE ) return ;
        // just need to get to valued to be operated on ( not'ed ) in eax
    else if ( optFlag ) //&& ( ! GetState ( _Context_->Compiler0, PREFIX_PARSING ) ) )
    {
        if ( compiler->OptInfo->OptimizeFlag & OPTIMIZE_IMM )
        {
            _Compile_MoveImm_To_Reg ( ACC, compiler->OptInfo->Optimize_Imm, CELL ) ;
        }
        else if ( compiler->OptInfo->Optimize_Rm == DSP )
        {
            if ( one->StackPushRegisterCode ) SetHere (one->StackPushRegisterCode ) ;
            else _Compile_Move_StackN_To_Reg ( ACC, DSP, 0 ) ;
        }
        else if ( compiler->OptInfo->Optimize_Rm != ACC )
        {
            Compile_GetVarLitObj_RValue_To_Reg ( one, ACC ) ;
        }
    }
    else
    {
        //if ( ( ! GetState ( _Context_->Compiler0, PREFIX_PARSING ) )  && one->StackPushRegisterCode ) SetHere ( one->StackPushRegisterCode ) ; // PREFIX_PARSING : nb! could be a prefix function 
        if ( one->StackPushRegisterCode ) SetHere ( one->StackPushRegisterCode ) ; // PREFIX_PARSING : nb! could be a prefix function 
        else if ( one->CAttribute2 & RAX_RETURN ) ; // do nothing
        else _Compile_Stack_PopToReg ( DSP, ACC ) ;
        //int64 a, b, c= 0, d ; a = 1; b = !a, d= !c ; _Printf ( "a = %d b = %d c =%d ~d = %d", a, b, c, d ) ;
    }
    _Compile_LogicalNot ( compiler ) ;
}

//  logical equals - "=="

void
Compile_Equals ( Compiler * compiler )
{
    Compile_Cmp_Set_tttn_Logic ( compiler, EQUAL, Z ) ;
}

void
Compile_DoesNotEqual ( Compiler * compiler )
{
    Compile_Cmp_Set_tttn_Logic ( compiler, EQUAL, NZ ) ;
}

void
Compile_LessThan ( Compiler * compiler )
{
    Compile_Cmp_Set_tttn_Logic ( compiler, LESS, Z ) ;
}

void
Compile_GreaterThan ( Compiler * compiler )
{
    Compile_Cmp_Set_tttn_Logic ( compiler, LE, NZ ) ;
}

void
Compile_LessThanOrEqual ( Compiler * compiler )
{
    Compile_Cmp_Set_tttn_Logic ( compiler, LE, Z ) ;
}

void
Compile_GreaterThanOrEqual ( Compiler * compiler )
{
    Compile_Cmp_Set_tttn_Logic ( compiler, LESS, NZ ) ;
}

void
Compile_Logical_X ( Compiler * compiler, int64 op )
{
    int64 optFlag = CheckOptimize ( compiler, 5 ) ;
    if ( optFlag == OPTIMIZE_DONE ) return ;
    else if ( optFlag )
    {
        // TODO : this optimization somehow is *very* little used, why is that ?!? 
        // assumes we have unordered operands in eax, ecx
        _Compile_X_Group1 ( op, REG, REG, ACC, OREG, 0, 0, CELL ) ;
        Compile_TestLogicAndStackPush ( compiler, ACC, NZ ) ;
    }
    else
    {
        // operands are still on the stack
        _Compile_Move_StackN_To_Reg ( ACC, DSP, 0 ) ;
        //_Compile_Group1 ( int64 code, int64 toRegOrMem, int64 mod, int64 reg, int64 rm, int64 sib, int64 disp, int64 osize )
        _Compile_X_Group1 ( op, REG, MEM, ACC, DSP, 0, - 4, CELL ) ;
        _Compile_Stack_DropN ( DSP, 2 ) ;

        Compile_TestLogicAndStackPush ( compiler, ACC, NZ ) ;
    }
}
