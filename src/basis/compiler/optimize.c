#include "../../include/cfrtil64.h"

/* ------
 * 2 args
 * ----------
 * lit lit op 
 * lit var op
 * var lit op
 * var var op
 * -------
 * op args
 * -------
 * lit op op
 * op lit op
 * op var op
 * var op op
 * op op op
 * 
 * x xword [var|lit|op] op :: xword = nonvar, nonlit, nonop
 * [var|lit|op] [var|lit|op] op :: 9 combinations + x betweenWord [var|lit|op] op :: 3 combinations = 12 total combinations
 * ----------------------------
 * 1 arg
 * -----
 * [var|lit|op] op :: 3 combinations
 * 15 total total combinations
 * 
 */
// remember this is rpn code so arg 1 is lower on the stack (STACK_1) than arg2 (STACK_0)
// need to consider also REGISTER args/parameters !!
// but we still need to consider types (sizes) and type checking
// and ARM cpu adjustments

// get arg actual setup
// convert arg setup to standard arg1=ACC, arg2=OREG (RCX)
// setup machine insn parameters 

// standard locations are :: arg1=reg=ACC=RAX ; arg2=rm=OREG=RCX
// for 2 arg ops : STACK_1= arg1 : STACK_0 = arg2 

int64
_Compiler_CheckOptimize ( Compiler * compiler, Word * word, int64 _forcedReturn )
{
    int64 forcedReturn = _forcedReturn ? _forcedReturn : compiler->OptimizeForcedReturn ;
    if ( ! forcedReturn )
    {
        if ( GetState ( _CfrTil_, OPTIMIZE_ON ) ) _forcedReturn = Compiler_GetOptimizeState ( compiler, word ) ;
    }
    return _forcedReturn ? _forcedReturn : compiler->OptimizeForcedReturn ;
}

int64
Compiler_CheckOptimize ( Compiler * compiler, int64 forcedReturn )
{
    return _Compiler_CheckOptimize ( compiler, Compiler_WordList ( 0 ), forcedReturn ) ;
}

int64
Compiler_GetOptimizeState ( Compiler * compiler, Word * word )
{
    if ( word )
    {
        CompileOptimizeInfo * optInfo = compiler->OptInfo ;
        CompileOptimizeInfo_Init ( optInfo, compiler->OptInfo->State ) ; // State : not used yet ??
        optInfo->opWord = word ;
        SetState ( _CfrTil_, IN_OPTIMIZER, true ) ;
        optInfo->Arg1AssumedLocation = LOC_STACK_0 ;
        optInfo->Arg2AssumedLocation = LOC_STACK_1 ;
        for ( optInfo->node = optInfo->wordNode = dllist_First ( ( dllist* ) compiler->WordList ), optInfo->node = dlnode_Next ( optInfo->node ) ;
            optInfo->node ; optInfo->node = optInfo->nextNode )
        {
            optInfo->nextNode = dlnode_Next ( optInfo->node ) ;
            if ( dobject_Get_M_Slot ( optInfo->node, SCN_IN_USE_FLAG ) ) optInfo->wordn = ( Word* ) dobject_Get_M_Slot ( optInfo->node, SCN_WORD ) ;
            else continue ;
            if ( optInfo->wordn->CAttribute2 & ( NO_OP_WORD | LEFT_PAREN ) ) continue ;
            else if ( optInfo->wordn->CAttribute & ( CATEGORY_OP ) )
            {
                if ( optInfo->wordn->Definition == CfrTil_DoubleQuoteMacro ) continue ;
                else if ( optInfo->wordn->CAttribute & ( CATEGORY_OP_LOAD ) )
                {
                    optInfo->rvalue ++ ; // for constructions like @ @ and @ @ @ etc.
                    continue ;
                }
                else
                {
                    optInfo->NumberOfArgs ++ ;
                    if ( optInfo->wordArg2 )
                    {
                        optInfo->wordArg1 = optInfo->wordn ;
                        optInfo->wordArg1_Op = true ;
                    }
                    else
                    {
                        optInfo->wordArg2 = optInfo->wordn ;
                        optInfo->wordArg2_Op = true ;
                    }
                    //if ( optInfo->wordArg1 ) break ;
                    //else continue ; //
                    break ;
                }
            }
            else if ( IS_MORPHISM_TYPE ( optInfo->wordn ) )
            {
                if ( optInfo->wordArg2 )
                {
                    optInfo->xBetweenArg1AndArg2 = optInfo->wordn ;
                }
                else optInfo->wordArg2 = optInfo->wordn ;
                break ; // no optimization possible if ( ( ! optInfo->wordArg2 ) && ( IS_MORPHISM_TYPE ( optInfo->wordn ) ) )
            }
            else if ( optInfo->wordArg2 )
            {
                optInfo->NumberOfArgs ++ ;
                optInfo->wordArg1 = optInfo->wordn ;
                optInfo->wordArg1Node = optInfo->node ;
                optInfo->wordArg1_rvalue = optInfo->rvalue ? optInfo->rvalue :
                    ( ( GetState ( _Context_, INFIX_MODE ) || GetState ( compiler, LISP_MODE ) ) 
                    && ( ! ( optInfo->opWord->CAttribute & ( CATEGORY_OP_EQUAL ) ) ) ) ;
                optInfo->rvalue = false ;
                if ( optInfo->wordArg1->CAttribute & ( CONSTANT | LITERAL ) ) optInfo->wordArg1_literal = true ;
                break ;
            }
            else // nb! : remember this is a rpn optimizer ; get second arg first when going right to left : arg1 arg2 op 
            {
                optInfo->NumberOfArgs ++ ;
                optInfo->wordArg2 = optInfo->wordn ;
                optInfo->wordArg2Node = optInfo->node ;
                optInfo->wordArg2_rvalue = optInfo->rvalue ? optInfo->rvalue :
                    ( ( GetState ( _Context_, INFIX_MODE ) || GetState ( compiler, LISP_MODE ) ) 
                    && ( ! ( optInfo->opWord->CAttribute & ( CATEGORY_OP_STORE ) ) ) ) ;
                optInfo->rvalue = false ;
                if ( optInfo->wordArg2->CAttribute & ( CONSTANT | LITERAL ) ) optInfo->wordArg2_literal = true ;
                if ( optInfo->opWord->CAttribute & ( CATEGORY_OP_LOAD ) && ( ! ( GetState ( _Context_, INFIX_MODE ) ) ) ) optInfo->wordArg2_rvalue ++ ;
                if ( optInfo->opWord->CAttribute & ( CATEGORY_OP_1_ARG | CATEGORY_OP_STACK | CATEGORY_OP_LOAD ) ) break ;
            }
        }
        Compiler_OptimizeForOp ( compiler ) ;
        SetState ( _CfrTil_, IN_OPTIMIZER, false ) ;
        return optInfo->rtrn ;
    }
    else return 0 ;
}

void
Compiler_OptimizeForOp ( Compiler * compiler )
{
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    Compiler_SetupArgsToStandardLocations ( compiler ) ;
    if ( optInfo->opWord->CAttribute & ( CATEGORY_OP_STORE ) ) Compile_Optimize_Store ( compiler ) ;
    else if ( optInfo->opWord->CAttribute & ( CATEGORY_OP_EQUAL ) ) Compile_Optimize_Equal ( compiler ) ;
    else if ( optInfo->opWord->CAttribute & ( CATEGORY_OP_OPEQUAL ) ) Compile_Optimize_OpEqual ( compiler ) ;
    else if ( ! optInfo->rtrn ) Setup_MachineCodeInsnParameters ( compiler, REG, REG, ACC, OREG, 0, 0, 0, 0 ) ;
}

// standard locations are :: arg1=reg=ACC=RAX ; arg2=rm=OREG=RCX
// for 2 arg ops : STACK_1= arg1 : STACK_0 = arg2 
// for 1 arg ops : STACK_0= arg1 

void
Compiler_SetupArgsToStandardLocations ( Compiler * compiler )
{
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    // op args first
    _Set_SCA ( optInfo->opWord ) ;
    if ( optInfo->opWord->CAttribute & ( CATEGORY_DUP ) ) Compile_Optimize_Dup ( compiler ) ;
    else if ( optInfo->wordArg1_literal && optInfo->wordArg2_literal ) Do_OptimizeOp2Literals ( compiler ) ;
    else if ( optInfo->wordArg2_Op || optInfo->xBetweenArg1AndArg2 ) Compiler_Optimizer_WordArg2Op_Or_xBetweenArg1AndArg2 ( compiler ) ;
    else if ( ( optInfo->NumberOfArgs == 2 ) || optInfo->wordArg1_Op ) Compiler_Optimizer_2Args_Or_WordArg1_Op ( compiler ) ;
    else if ( optInfo->NumberOfArgs == 1 ) Compiler_Optimizer_1Arg ( compiler ) ;
    else if ( optInfo->NumberOfArgs == 0 ) Compiler_Optimizer_0Args ( compiler ) ;
    //else Error ( "\nCompiler_SetupArgsToStandardLocations : Shouldn't come here!!\n", QUIT ) ;
}

void
Compiler_Optimizer_0Args ( Compiler * compiler )
{
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    if ( optInfo->opWord->CAttribute & CATEGORY_OP_LOAD )
    {
        Compile_Move_Rm_To_Reg ( ACC, DSP, 0 ) ;
        Compile_Move_Rm_To_Reg ( ACC, ACC, 0 ) ;
        Compile_Move_Reg_To_Rm ( DSP, ACC, 0 ) ;
        optInfo->rtrn = OPTIMIZE_DONE ;
    }
#if 1
    else if ( optInfo->opWord->CAttribute & CATEGORY_OP_1_ARG )
    {
        if ( optInfo->wordArg2 )
        {
            if ( optInfo->wordArg2->StackPushRegisterCode ) _SetHere_To_Word_StackPushRegisterCode ( optInfo->wordArg2 ) ;
                //else if ( optInfo->wordArg2->CAttribute & CATEGORY_DUP ) ;
            else //if ( optInfo->wordArg2->CAttribute & ( CATEGORY_STACK ) )
            {
                _Compile_Move_StackN_To_Reg ( ACC, DSP, 0 ), optInfo->Optimize_Reg = ACC | REG_ON_BIT ;
                Compile_SUBI ( REG, DSP, 0, CELL, 0 ) ;
            }
        }
        else Word_Check_SetHere_To_StackPushRegisterCode ( optInfo->opWord ) ;
    }
#endif    
    else Compile_StandardUnoptimized ( compiler ) ;
}

void
Compiler_Optimizer_WordArg2Op_Or_xBetweenArg1AndArg2 ( Compiler * compiler )
{
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    if ( ( optInfo->wordArg2 && optInfo->wordArg2->StackPushRegisterCode ) || ( optInfo->xBetweenArg1AndArg2->StackPushRegisterCode ) )
    {
        if ( optInfo->wordArg2->StackPushRegisterCode ) _SetHere_To_Word_StackPushRegisterCode ( optInfo->wordArg2 ) ;
        else if ( optInfo->xBetweenArg1AndArg2->StackPushRegisterCode ) _SetHere_To_Word_StackPushRegisterCode ( optInfo->xBetweenArg1AndArg2 ) ;
        if ( ! ( optInfo->opWord->CAttribute & ( CATEGORY_OP_1_ARG | CATEGORY_OP_OPEQUAL ) ) )
        {
            Compile_Move_Reg_To_Reg ( OREG, ACC ) ;
            _Compile_Move_StackN_To_Reg ( ACC, DSP, 0 ) ;
            Compile_SUBI ( REG, DSP, 0, CELL, 0 ) ;
            optInfo->Optimize_Reg = ACC | REG_ON_BIT ; // 0x16 : let Setup_MachineCodeInsnParameters know we have a parameter for it in case of ACC == 0
            optInfo->Optimize_Rm = OREG ;

        }
    }
    else Compile_StandardUnoptimized ( compiler ) ;
}

void
Compiler_Optimizer_1Arg ( Compiler * compiler )
{
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    // remember : CATEGORY_DUP && CATEGORY_OP_LOAD were handled already in Compiler_OptimizeForOpNew
    if ( optInfo->opWord->CAttribute & ( CATEGORY_OP_LOAD ) ) Compiler_CompileOptimizedLoad ( compiler ) ;
    else if ( optInfo->opWord->CAttribute & ( CATEGORY_PLUS_PLUS_MINUS_MINUS ) ) Compiler_CompileOptimize_IncDec ( compiler ) ;
    else if ( optInfo->wordArg2->StackPushRegisterCode ) _SetHere_To_Word_StackPushRegisterCode ( optInfo->wordArg2 ), optInfo->Optimize_Reg = ACC | REG_ON_BIT ;
    else _Compile_Move_StackN_To_Reg ( ACC, DSP, 0 ), optInfo->Optimize_Reg = ACC | REG_ON_BIT ;
}

void
Compiler_Optimizer_2Args_Or_WordArg1_Op ( Compiler * compiler )
{
    // we know ( ! ( optInfo->wordArg2_Op || optInfo->xBetweenArg1AndArg2 ) ) because we already handled that above
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    // can this be optimized ??            
    if ( optInfo->wordArg2->CAttribute & DOBJECT ) Compile_StandardUnoptimized ( compiler ) ;
    else
    {
        int8 rm = ( optInfo->wordArg2->CAttribute & REGISTER_VARIABLE ) ? optInfo->wordArg2->RegToUse : OREG ;
        if ( optInfo->opWord->CAttribute & CATEGORY_OP_OPEQUAL ) SetHere ( optInfo->wordArg1->Coding ) ;
        else
        {
            optInfo->Optimize_Reg = ACC | REG_ON_BIT ;
            if ( optInfo->wordArg1->StackPushRegisterCode )
            {
                _SetHere_To_Word_StackPushRegisterCode ( optInfo->wordArg1 ) ;
                if ( optInfo->wordArg1_Op && ( optInfo->wordArg1->RegFlags ) )
                {
                    rm = optInfo->wordArg1->Opt_Reg ;
                    optInfo->Optimize_Rm = rm ;
                }
            }
            else
            {
                SetHere ( optInfo->wordArg2->Coding ) ;
                _Compile_Stack_PopToReg ( DSP, ACC ) ;
            }
        }
        Compile_StandardArg ( optInfo->wordArg2, rm, optInfo->wordArg2_rvalue, 0 ) ;
        optInfo->Optimize_Rm = rm | REG_ON_BIT ;
        //optInfo->rtrn = 1 ;
    }
}

void
Compile_StandardArg ( Word * word, int8 reg, Boolean rvalueFlag, byte * setHere )
{
    if ( setHere ) SetHere ( setHere ) ;
    if ( rvalueFlag -- )
    {
        Compile_GetVarLitObj_RValue_To_Reg ( word, reg ) ;
        while ( rvalueFlag -- ) Compile_Move_Rm_To_Reg ( ACC, ACC, 0 ) ;
    }
    else _Compile_GetVarLitObj_LValue_To_Reg ( word, reg ) ;
    word->StackPushRegisterCode = Here ; // we are not pushing this but in case we are just rewriting the code in the next arg ?
}

void
Compile_StandardUnoptimized ( Compiler * compiler )
{
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    _Compile_Move_StackN_To_Reg ( OREG, DSP, 0 ), optInfo->Optimize_Rm = OREG ;
    _Compile_Move_StackN_To_Reg ( ACC, DSP, - 1 ), optInfo->Optimize_Reg = ACC | REG_ON_BIT ;
    Compile_SUBI ( REG, DSP, 0, 2 * CELL, 0 ) ;
}

void
Compiler_CompileOptimize_IncDec ( Compiler * compiler )
{
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    if ( GetState ( _Context_, C_SYNTAX ) || ( ! optInfo->wordArg2_rvalue ) )
    {
        GetRmDispImm ( optInfo, optInfo->wordArg2, - 1 ) ;
        if ( ! ( optInfo->OptimizeFlag & OPTIMIZE_IMM ) )
        {
            int8 reg ;
            if ( optInfo->wordArg2->CAttribute & REGISTER_VARIABLE ) reg = optInfo->wordArg2->RegToUse ;
            else reg = optInfo->Optimize_Rm ;
            SetHere ( optInfo->wordArg2->Coding ) ;
            if ( optInfo->wordArg2->CAttribute & ( NAMESPACE_VARIABLE ) )
            {
                _Compile_Move_Literal_Immediate_To_Reg ( reg, ( int64 ) optInfo->wordArg2->W_PtrToValue ) ;
            }
            _Compile_Group5 ( optInfo->opWord->W_OpInsnCode, ( optInfo->wordArg2->CAttribute & REGISTER_VARIABLE ) ? REG : MEM, reg, 0, optInfo->Optimize_Disp, 0 ) ;
            optInfo->rtrn = OPTIMIZE_DONE ;
        }
    }
    else Word_Check_SetHere_To_StackPushRegisterCode ( optInfo->wordArg2 ) ; //if ( optInfo->wordArg2->StackPushRegisterCode )
}

void
Compiler_CompileOptimizedLoad ( Compiler * compiler )
{
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    _Set_SCA ( optInfo->opWord ) ;
    if ( optInfo->wordArg2->StackPushRegisterCode )
    {
        if ( optInfo->wordArg2->CAttribute & DOBJECT )
        {
            _SetHere_To_Word_StackPushRegisterCode ( optInfo->wordArg2 ) ;
            Compile_Move_Rm_To_Reg ( ACC, ACC, 0 ) ;
        }
        else
        {
            SetHere ( optInfo->wordArg2->Coding ) ;
            Compile_StandardArg ( optInfo->wordArg2, ACC, optInfo->wordArg2_rvalue, optInfo->wordArg2->Coding ) ;
        }
        Word_Set_StackPushRegisterCode_To_Here ( optInfo->opWord ) ; // for EndBlock and LogicCodeWord with '@'
        _Word_CompileAndRecord_PushReg ( optInfo->wordArg2, ACC ) ;
    }
    else
    {
        Compile_Move_Rm_To_Reg ( ACC, DSP, 0 ) ;
        Compile_Move_Rm_To_Reg ( ACC, ACC, 0 ) ;
        Compile_Move_Reg_To_Rm ( DSP, ACC, 0 ) ;
    }
    optInfo->rtrn = OPTIMIZE_DONE ;
}

int8
CheckForRegisterVariable ( Compiler * compiler, int8 reg )
{
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    if ( ( reg == OREG ) && ( optInfo->wordArg2 && optInfo->wordArg2->CAttribute & REGISTER_VARIABLE ) ) reg = optInfo->wordArg2->RegToUse ;
    else if ( ( reg == ACC ) && ( optInfo->wordArg1 && optInfo->wordArg1->CAttribute & REGISTER_VARIABLE ) ) reg = optInfo->wordArg1->RegToUse ;
    return reg ;
}

// if we have a parameter already set in optInfo honor it else use the default 
// adjust if needed

void
Setup_MachineCodeInsnParameters ( Compiler * compiler, int8 direction, int8 mod, int8 reg, int8 rm, int64 disp, int64 immediate, int8 immSize, int8 forceSet )
{
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    if ( optInfo->rtrn != OPTIMIZE_DONE )
    {
        optInfo->Optimize_Reg = CheckForRegisterVariable ( compiler, reg ) ; // register variables override REG_ON_BIT
        if ( ( optInfo->Optimize_Reg & REG_ON_BIT ) && ( ! forceSet ) ) optInfo->Optimize_Reg = ( optInfo->Optimize_Reg & 0xf ) ;
        optInfo->Optimize_Mod = mod ;
        optInfo->Optimize_Dest_RegOrMem = direction ;
        if ( optInfo->opWord->CAttribute & CATEGORY_OP_1_ARG ) rm = ACC ;
        optInfo->Optimize_Rm = CheckForRegisterVariable ( compiler, rm ) ;
        if ( ( optInfo->Optimize_Rm & REG_ON_BIT ) && ( ! forceSet ) ) optInfo->Optimize_Rm = ( optInfo->Optimize_Rm & 0xf ) ;
        optInfo->Optimize_Disp = disp ;
        if ( ( optInfo->wordArg2 && optInfo->wordArg2->CAttribute & REGISTER_VARIABLE ) || ( optInfo->wordArg1 && optInfo->wordArg1->CAttribute & REGISTER_VARIABLE ) )
            optInfo->OptimizeFlag |= OPTIMIZE_REGISTER ;
        if ( optInfo->opWord->CAttribute & BIT_SHIFT ) optInfo->Optimize_Rm = RAX ;
        optInfo->rtrn = 1 ;
    }
}

void
Compile_Optimize_Dup ( Compiler * compiler )
{
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    _Set_SCA ( optInfo->opWord ) ;
    if ( optInfo->wordArg2 && optInfo->wordArg2->StackPushRegisterCode )
    {
        _SetHere_To_Word_StackPushRegisterCode ( optInfo->wordArg2 ) ;
        Compile_ADDI ( REG, DSP, 0, 2 * CELL, 0 ) ;
        _Compile_Move_Reg_To_StackN ( DSP, 0, ACC ) ;
        _Compile_Move_Reg_To_StackN ( DSP, - 1, ACC ) ;
    }
    else
    {

        Compile_Move_Rm_To_Reg ( ACC, DSP, 0 ) ;
        //optInfo->opWord->StackPushRegisterCode = Here ;
        Compile_ADDI ( REG, DSP, 0, sizeof (int64 ), 0 ) ;
        Compile_Move_Reg_To_Rm ( DSP, ACC, 0 ) ;
    }
    optInfo->rtrn = OPTIMIZE_DONE ;
}

void
Word_Set_StackPushRegisterCode_To_Here ( Word * word )
{
    word->StackPushRegisterCode = Here ;
}

void
_SetHere_To_Word_StackPushRegisterCode ( Word * word )
{
    SetHere ( word->StackPushRegisterCode ) ;
}

void
Word_Check_SetHere_To_StackPushRegisterCode ( Word * word )
{
    if ( word->StackPushRegisterCode ) _SetHere_To_Word_StackPushRegisterCode ( word ) ;
}

#if 0

void
Compiler_CompileOp ( Compiler * compiler )
{
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    //_Compile_IMUL ( int8 mod, int8 reg, int8 rm, int8 sib, int64 disp, uint64 imm )
    //optInfo->Optimize_Reg = ACC ; // emulate MUL
    _Compile_IMUL ( optInfo->Optimize_Mod, optInfo->Optimize_Reg, optInfo->Optimize_Rm, 0, optInfo->Optimize_Disp, 0 ) ;
    if ( optInfo->Optimize_Rm == DSP ) _Compile_Move_Reg_To_StackN ( DSP, 0, optInfo->Optimize_Reg ) ;
    else _Word_CompileAndRecord_PushReg ( _Compiler_WordList ( compiler, 0 ), optInfo->Optimize_Reg ) ;
}
#endif
// OpEqual is different from Store/Equal because we have to do the op first then the equal, obviously but important to remember 
// we need to set up the more specific OpEqual for that
// arg1 *= arg2 
// equals
// arg1 = arg1 * arg2 ;

void
Compile_Optimize_OpEqual ( Compiler * compiler )
{
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    if ( optInfo->NumberOfArgs && ( ! optInfo->xBetweenArg1AndArg2 ) )
    {
        block def = 0 ;
        if ( optInfo->opWord->Definition == CfrTil_MultiplyEqual ) def = CfrTil_Multiply ;
        else if ( optInfo->opWord->Definition == CfrTil_DivideEqual ) def = CfrTil_Divide ;
        else if ( optInfo->opWord->Definition == CfrTil_PlusEqual ) def = CfrTil_Plus ;
        else if ( optInfo->opWord->Definition == CfrTil_MinusEqual ) def = CfrTil_Minus ;
        else if ( optInfo->opWord->Definition == CfrTil_BitWise_OrEqual ) def = CfrTil_BitWise_OR ;
        else if ( optInfo->opWord->Definition == CfrTil_BitWise_AndEqual ) def = CfrTil_BitWise_AND ;
        else if ( optInfo->opWord->Definition == CfrTil_ShiftRight_Equal ) def = CfrTil_ShiftRight ;
        else if ( optInfo->opWord->Definition == CfrTil_ShiftLeft_Equal ) def = CfrTil_ShiftLeft ; //optInfo->Optimize_Reg = OREG ; }
        CompileOptimizeInfo *tempOptInfo = CompileOptInfo_NewCopy ( optInfo, CONTEXT ) ;
        CompileOptimizeInfo * svOptInfo = optInfo ;
        optInfo = tempOptInfo ;
        compiler->OptInfo = optInfo ; // we want to keep using the same variable
        _Set_SCA ( optInfo->opWord ) ;
        Setup_MachineCodeInsnParameters ( compiler, REG, REG, ACC, OREG, 0, 0, 0, 1 ) ;
        if ( optInfo->NumberOfArgs == 2 )
        {
            if ( ! ( optInfo->wordArg1->CAttribute & REGISTER_VARIABLE ) )
            {
                Word_Check_SetHere_To_StackPushRegisterCode ( optInfo->wordArg2 ) ;
                Compile_StandardArg ( optInfo->wordArg1, OREG2, 0, 0 ) ;
                Compile_StandardArg ( optInfo->wordArg1, optInfo->wordArg1->RegToUse, 1, 0 ) ;
            }
        }
        if ( ( optInfo->opWord->Definition == CfrTil_DivideEqual ) || ( optInfo->opWord->CAttribute2 & OP_RAX_PLUS_1ARG ) ) //|| ( optInfo->opWord->CAttribute & BIT_SHIFT ) )
        {
            optInfo->Optimize_Rm = OREG ;
        }
        compiler->OptimizeForcedReturn = 1 ;
        Block_Eval ( def ) ;
        Word_Check_SetHere_To_StackPushRegisterCode ( optInfo->opWord ) ;
        _Set_SCA ( optInfo->opWord ) ;
        if ( ! ( optInfo->wordArg1->CAttribute & REGISTER_VARIABLE ) ) Compile_Move_Reg_To_Rm ( OREG2, optInfo->wordArg1->RegToUse, 0 ) ;
        compiler->OptimizeForcedReturn = 0 ;
        compiler->OptInfo = svOptInfo ;
        svOptInfo->rtrn = OPTIMIZE_DONE ;
    }
    else optInfo->rtrn = 0 ;
}

void
Compile_Optimize_Equal ( Compiler * compiler )
{
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    int8 reg ;
    if ( optInfo->wordArg1 && ( optInfo->wordArg1->CAttribute & REGISTER_VARIABLE ) )
    {
        reg = optInfo->wordArg1->RegToUse ;
        if ( optInfo->wordArg2_literal )
        {
            SetHere ( optInfo->wordArg2->Coding ) ;
            _Set_SCA ( optInfo->wordArg2 ) ;
            Compile_MoveImm_To_Reg ( reg, optInfo->wordArg2->W_Value, CELL ) ;
        }
        else
        {
            if ( optInfo->wordArg2->CAttribute & REGISTER_VARIABLE )
            {
                SetHere ( optInfo->wordArg1->Coding ) ;
            }
            _Set_SCA ( optInfo->wordArg2 ) ;
            Compile_Move_Reg_To_Reg ( ( optInfo->wordArg2->CAttribute & REGISTER_VARIABLE ) ? optInfo->wordArg2->RegToUse : ACC, reg ) ;
        }
        goto done ;
    }

    else reg = OREG ;
    _Set_SCA ( optInfo->opWord ) ;
    Compile_Move_Reg_To_Rm ( ACC, reg, 0 ) ;
done:
    optInfo->rtrn = OPTIMIZE_DONE ;
}

void
Compile_Optimize_Store ( Compiler * compiler )
{
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;
    int8 reg = OREG, rm = ACC ;
    if ( optInfo->wordArg2 && ( optInfo->wordArg2->CAttribute & REGISTER_VARIABLE ) )
    {
        reg = optInfo->wordArg2->RegToUse ;
        if ( optInfo->wordArg1_literal )
        {
            SetHere ( optInfo->wordArg1->Coding ) ;
            _Set_SCA ( optInfo->wordArg1 ) ;
            Compile_MoveImm_To_Reg ( reg, optInfo->wordArg1->W_Value, CELL ) ;
        }
        else
        {
            rm = optInfo->wordArg1->RegToUse ;
            if ( optInfo->wordArg1->CAttribute & REGISTER_VARIABLE )
            {
                SetHere ( optInfo->wordArg1->Coding ) ;
            }
            else
            {
                SetHere ( optInfo->wordArg2->Coding ) ;
            }
            if ( optInfo->wordArg1_Op && optInfo->wordArg1->RegFlags )
            {

                rm = optInfo->wordArg1->Opt_Reg ;
                //optInfo->wordArg1->Opt_Reg = 0 ;
                optInfo->wordArg1->RegFlags = false ; // reset !
            }
            _Set_SCA ( optInfo->opWord ) ;
            Compile_Move_Reg_To_Reg ( reg, rm ) ;
        }
        goto done ;
    }
    _Set_SCA ( optInfo->opWord ) ;
    Compile_Move_Reg_To_Rm ( reg, rm, 0 ) ;
done:
    optInfo->rtrn = OPTIMIZE_DONE ;
}

void
Do_OptimizeOp2Literals ( Compiler * compiler )
{
    CompileOptimizeInfo * optInfo = compiler->OptInfo ;

    if ( optInfo->wordArg1->Coding ) SetHere ( optInfo->wordArg1->Coding ) ;
    int64 value ;
    // a little tricky here ...
    // ?? maybe we should setup and use a special compiler stack and use it here ... ??
    DataStack_Push ( ( int64 ) * optInfo_0_two->W_PtrToValue ) ;
    DataStack_Push ( ( int64 ) * optInfo_0_one->W_PtrToValue ) ;
    SetState ( compiler, COMPILE_MODE, false ) ;
    SetState ( _CfrTil_, OPTIMIZE_ON, false ) ; //prevent recursion here
    Word_Run ( optInfo_0_zero ) ;
    SetState ( compiler, COMPILE_MODE, true ) ;
    SetState ( _CfrTil_, OPTIMIZE_ON, true ) ; //prevent recursion here
    value = DataStack_Pop ( ) ;
    SetHere ( optInfo_0_two->Coding ) ;
    _Set_SCA ( optInfo_0_two ) ;
    Compile_MoveImm_To_Reg ( ACC, value, CELL ) ;
    _Word_CompileAndRecord_PushReg ( optInfo->opWord, ACC ) ; // this is helpful in future optimizations looking for StackPushRegisterCode
    optInfo->rtrn = OPTIMIZE_DONE ;
}

// skip back WordStack words for the args of an op parameter in GetOptimizeState

void
PeepHole_Optimize ( )
{
    if ( GetState ( _CfrTil_, OPTIMIZE_ON ) )
    {
        byte * here = _Q_CodeByteArray->EndIndex ;
        byte sub_r14_0x8__add_r14_0x8 [ ] = { 0x49, 0x83, 0xee, 0x08, 0x49, 0x83, 0xc6, 0x08 } ;
        byte add_r14_0x8__mov_r14_rax__mov_rax_r14__sub_r14_0x8 [ ] = { 0x49, 0x83, 0xc6, 0x08, 0x49, 0x89, 0x06, 0x49, 0x8b, 0x06, 0x49, 0x83, 0xee, 0x08 } ;
        //byte add_r14_0x8__mov_r14_rdi__mov_rax_r14__sub_r14_0x8 [ ] = { 0x49, 0x83, 0xc6, 0x08, 0x49, 0x89, 0x3e, 0x49, 0x8b, 0x06, 0x49, 0x83, 0xee, 0x08 } ;
        //byte add_esi_04__mov_tos_eax_sub_esi_04 [ ] = { 0x83, 0xc6, 0x04, 0x89, 0x06, 0x83, 0xee, 0x04 } ;
        //byte mov_eax_tos_sub_esi_04_test_eax_eax [ ] = { 0x89, 0x06, 0x83, 0xee, 0x04, 0x85, 0xc0 } ;
        byte mov_r14_rax__mov_rax_r14 [] = { 0x49, 0x89, 0x06, 0x49, 0x8b, 0x06 } ;
        byte add_rax_0x0 [] = { 0x48, 0x81, 0xc0, 0x00, 0x00, 0x00, 0x00 } ;
        if ( ! memcmp ( sub_r14_0x8__add_r14_0x8, here - 8, 8 ) )
        {
            _ByteArray_UnAppendSpace ( _Q_CodeByteArray, 8 ) ;
        }
        else if ( ! memcmp ( add_r14_0x8__mov_r14_rax__mov_rax_r14__sub_r14_0x8, here - 14, 14 ) )
        {
            _ByteArray_UnAppendSpace ( _Q_CodeByteArray, 14 ) ;
        }
        else if ( ! memcmp ( mov_r14_rax__mov_rax_r14, here - 6, 6 ) )
        {
            _ByteArray_UnAppendSpace ( _Q_CodeByteArray, 6 ) ;
        }
        else if ( ! memcmp ( add_rax_0x0, here - 7, 7 ) )
        {
            _ByteArray_UnAppendSpace ( _Q_CodeByteArray, 7 ) ;
        }
#if 0        
        else if ( ! memcmp ( add_r14_0x8__mov_r14_rdi__mov_rax_r14__sub_r14_0x8, here - 14, 14 ) )
        {
            _ByteArray_UnAppendSpace ( _Q_CodeByteArray, 14 ) ;
        }
            // this occurs one time at startup in _assertStkChk : change it where it is caused and eliminate testing every instruction !! 
        else if ( ! memcmp ( mov_eax_tos_sub_esi_04_test_eax_eax, here - 7, 7 ) )
        {

            _ByteArray_UnAppendSpace ( _Q_CodeByteArray, 7 ) ;
            Compile_TEST_Reg_To_Reg ( ACC, ACC ) ;
        }
#endif        
    }
}

void
GetRmDispImm ( CompileOptimizeInfo * optInfo, Word * word, int64 suggestedReg )
{
    if ( suggestedReg == - 1 ) suggestedReg = ACC ;
    optInfo->Optimize_Reg = suggestedReg ;
    if ( word->CAttribute & REGISTER_VARIABLE )
    {
        optInfo->OptimizeFlag |= OPTIMIZE_REGISTER ;
        optInfo->Optimize_Dest_RegOrMem = REG ;
        optInfo->Optimize_Mod = REG ;
        //optInfo->Optimize_Rm = optInfo->Optimize_Reg = ( suggestedReg != - 1 ) ? suggestedReg : word->RegToUse ;
        optInfo->Optimize_Rm = optInfo->Optimize_Reg = word->RegToUse ;
    }
    else if ( word->CAttribute & LOCAL_VARIABLE )
    {
        optInfo->Optimize_Rm = FP ;
        optInfo->Optimize_Disp = LocalVarIndex_Disp ( LocalVarOffset ( word ) ) ;
        optInfo->OptimizeFlag |= OPTIMIZE_RM ;
    }
    else if ( word->CAttribute & PARAMETER_VARIABLE )
    {
        optInfo->Optimize_Rm = FP ;
        optInfo->Optimize_Disp = LocalVarIndex_Disp ( ParameterVarOffset ( word ) ) ;
        optInfo->OptimizeFlag |= OPTIMIZE_RM ;
    }
    else if ( word->CAttribute & ( LITERAL | CONSTANT ) )
    {
        optInfo->Optimize_Imm = ( int64 ) * word->W_PtrToValue ;
        optInfo->OptimizeFlag |= OPTIMIZE_IMM ;
    }
    else if ( word->CAttribute & ( NAMESPACE_VARIABLE ) )
    {
        if ( suggestedReg == - 1 ) suggestedReg = ACC ;
        //_Compile_Move_Literal_Immediate_To_Reg ( suggestedReg, ( int64 ) word->W_PtrToValue ) ; // ?? should this be here ??
        optInfo->Optimize_Rm = suggestedReg ;
        optInfo->OptimizeFlag |= OPTIMIZE_RM ;
    }
    else //if ( word->CAttribute & CATEGORY_OP_1_ARG )
    {
        optInfo->Optimize_Rm = DSP ;
        optInfo->OptimizeFlag |= OPTIMIZE_RM ;
    }
}

