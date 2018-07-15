
#include "../../include/cfrtil64.h"

// ?!? this file could be reworked for simplity, elegance and integration ?!?

void
CfrTil_If ( )
{
    if ( CompileMode )
    {
        _Compile_Jcc ( 0, 0, ZERO_TTT ) ;
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

void
Compile_TestLogicAndStackPush ( Compiler * compiler, int8 reg, int8 negFlag )
{
    Compile_BlockInfoTestLogic ( compiler, reg, negFlag ) ;
    Compiler_CompileAndRecord_PushAccum ( compiler ) ;
}

BlockInfo *
BI_Set_JccLogicCodeToHere ( BlockInfo * bi )
{
    bi->JccLogicCode = Here ; // used by combinators
}

BlockInfo *
Set_JccLogicCode ( Compiler * compiler )
{
    BlockInfo *bi = ( BlockInfo * ) _Stack_Top ( compiler->CombinatorBlockInfoStack ) ;
    BI_Set_JccLogicCodeToHere ( bi ) ;
    return bi ;
}

void
_Compile_LogicResultForStack ( int64 reg, Boolean negFlag )
{
    Compile_JCC ( negFlag, ZERO_TTT, Here + 21 ) ; // if eax is zero return not(R8) == 1 else return 0
    // return 0 in reg :
    Compile_MoveImm_To_Reg ( reg, 0, CELL_SIZE ) ; // 6 bytes
    _Compile_JumpWithOffset ( 10 ) ; // 6 bytes

    //return 1 in reg :
    Compile_MoveImm_To_Reg ( reg, 1, CELL_SIZE ) ;
    //_Set_JccLogicCode ( _Compiler_ ) ;
}

void
_Compile_LogicalAnd ( Compiler * compiler )
{
    //byte * here = Here ;
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    Set_SCA ( 0 ) ;
    Compile_BlockInfoTestLogic ( compiler, OREG, NEGFLAG_Z ) ; // jz
    Compile_JCC ( NEGFLAG_Z, ZERO_TTT, Here + 15 ) ; // if eax is zero return not(R8) == 1 else return 0
    Compile_BlockInfoTestLogic ( compiler, ACC, NEGFLAG_NZ ) ;
    _Compile_LogicResultForStack ( ACC, NEGFLAG_NZ ) ; // jnz
    Set_JccLogicCode ( compiler ) ;
    _Compiler_CompileAndRecord_Word0_PushReg ( compiler, ACC ) ;
    //d1 ( {_Debugger_Disassemble ( _Debugger_, ( byte* ) here, Here - here, 1 ) ; Pause () ; } ) ;
}

void
Compile_LogicalAnd ( Compiler * compiler )
{
    int64 optFlag = Compiler_CheckOptimize ( compiler, 0 ) ;
    if ( optFlag & OPTIMIZE_DONE ) return ;
    else if ( optFlag )
    {
        _Compile_LogicalAnd ( compiler ) ;
    }
    else
    {
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
    Set_SCA ( 0 ) ;
    Compile_BlockInfoTestLogic ( compiler, ACC, NEGFLAG_Z ) ;
    _Set_JccLogicCodeForNot ( compiler ) ;
    _Compile_LogicResultForStack ( ACC, NEGFLAG_Z ) ;
    Set_JccLogicCode ( compiler ) ;
    _Compiler_CompileAndRecord_Word0_PushReg ( compiler, ACC ) ;
    //DBI_OFF ;
}

void
Compile_LogicalNot ( Compiler * compiler )
{
    Word *one = _Compiler_WordList ( compiler, 1 ) ; // assumes two values ( n m ) on the DSP stack 
    int64 optFlag = Compiler_CheckOptimize ( compiler, 0 ) ; // check especially for cases that optimize literal ops
    if ( optFlag & OPTIMIZE_DONE ) return ;
        // just need to get to valued to be operated on ( not'ed ) in eax
    else if ( optFlag )
    {
        if ( compiler->OptInfo->OptimizeFlag & OPTIMIZE_IMM )
        {
            Compile_MoveImm_To_Reg ( ACC, compiler->OptInfo->Optimize_Imm, CELL ) ;
        }
        else if ( compiler->OptInfo->Optimize_Rm == DSP )
        {
            if ( one->StackPushRegisterCode ) SetHere ( one->StackPushRegisterCode ) ;
            else _Compile_Move_StackN_To_Reg ( ACC, DSP, 0 ) ;
        }
        else if ( compiler->OptInfo->Optimize_Rm != ACC )
        {
            Compile_GetVarLitObj_RValue_To_Reg ( one, ACC ) ;
        }
    }
    else
    {
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
    Compile_Cmp_Set_tttn_Logic ( compiler, EQUAL, NEGFLAG_Z ) ;
}

void
Compile_DoesNotEqual ( Compiler * compiler )
{
    Compile_Cmp_Set_tttn_Logic ( compiler, EQUAL, NEGFLAG_NZ ) ;
}

void
Compile_LessThan ( Compiler * compiler )
{
    Compile_Cmp_Set_tttn_Logic ( compiler, LESS, NEGFLAG_Z ) ;
}

void
Compile_GreaterThan ( Compiler * compiler )
{
    Compile_Cmp_Set_tttn_Logic ( compiler, LE, NEGFLAG_NZ ) ;
}

void
Compile_LessThanOrEqual ( Compiler * compiler )
{
    Compile_Cmp_Set_tttn_Logic ( compiler, LE, NEGFLAG_Z ) ;
}

void
Compile_GreaterThanOrEqual ( Compiler * compiler )
{
    Compile_Cmp_Set_tttn_Logic ( compiler, LESS, NEGFLAG_NZ ) ;
}

void
Compile_Logical_X ( Compiler * compiler, int64 op )
{
    int64 optFlag = Compiler_CheckOptimize ( compiler, 0 ) ;
    if ( optFlag == OPTIMIZE_DONE ) return ;
    else if ( optFlag )
    {
        // TODO : this optimization somehow is *very* little used, why is that ?!? 
        // assumes we have unordered operands in eax, ecx
        _Compile_X_Group1 ( op, REG, REG, ACC, OREG, 0, 0, CELL ) ;
        Compile_TestLogicAndStackPush ( compiler, ACC, NEGFLAG_NZ ) ;
    }
    else
    {
        // operands are still on the stack
        _Compile_Move_StackN_To_Reg ( ACC, DSP, 0 ) ;
        //_Compile_Group1 ( int64 code, int64 toRegOrMem, int64 mod, int64 reg, int64 rm, int64 sib, int64 disp, int64 osize )
        _Compile_X_Group1 ( op, REG, MEM, ACC, DSP, 0, CELL, CELL ) ;
        _Compile_Stack_DropN ( DSP, 2 ) ;

        Compile_TestLogicAndStackPush ( compiler, ACC, NEGFLAG_NZ ) ;
    }
}
