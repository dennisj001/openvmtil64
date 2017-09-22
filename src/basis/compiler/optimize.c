#include "../../include/cfrtil.h"
#define old 0
// TODO : this file is kinda rough and should/could be made a lot more elegant and checked for strict accuracy

/* ************************************************
 * Optimization : observations, assumptions and reasoning ( bottom up heuristics )
 * Optimization here is nothing but a logical reduction of already compiled code and overwriting it with the optimized code.
 * - It seems somewhat similar to the shift-reduce cycle in (top down) compiler theory.
 * ------------------------------------------------
 * - currently optimizable words are : operators (ops), variables, or literals 
 * -- operands are variables or literals and can be the output or function return value of ops (operators)
 * -- the system is either compiling or interpreting, in a block or not
 *      --- if interpreting there are no local variables (they are not implemented yet)
 * -- variables are either stack, local, or global
 * -- local variables are indexed by the FP register
 * -- stacks are indexed by DSP or by FP when there are also local variables
 * -- operators always leave their output operands on the stack unless when optimized by a following operand (which will rewrite the code to leave it in a register)
 * -- operators take either 1 or 2 operands : cf. defines.h
 *      --- 1 operand : @, ~, not, dup, ++, --
 *      --- 2 operand operators are of optInfo->O_two types, ie. taking either ordered or unordered operands
 *          ---- ordered operands : /, -, logic, op_equal : =, +=, -=, *=, etc
 *                  ------ requiring register for a operand : op_equal
 *          ---- unordered operands : +, * 
 * -- ordered operators example subtract : subtract second operand from first and store result in first
- Intel addressing can have 1 or 2 regs or 1 mem address and 1 reg per instruction
 * Assuming :
 * -- reg use order EAX, ECX, EBX, EDX => 1st op EAX, 2nd op ECX, ... (nb: div/mod always uses edx)
 * -- result of any op is always in EAX which may or may not be pushed on the stack (Dsp [0] = TOS = top of stack)
 * -- functions return a value as TOS unless declared different in the locals declaration
 * So :
 * - we take different combinations of previous words that leave operands on the stack
 *  - and optimize access to them for different word categories and let those words know by
 *  - means of Optimize_Flag (cf. defines.h) the state of the operands - whether reg or stack (mem) and 
 *  - in what order or registers
 * 
 * - tail recursion from http://c2.com/cgi/wiki?TailCallOptimization
 * int64 factorial( int64 n )
 {
        int64 accum = 1;
        while ( n >= 2 )
                accum *= n--;
        return accum;
 }
 * *************************************************/

// this function maybe needs to be refined - rethought

void
_GetRmDispImm ( CompileOptimizeInfo * optInfo, Word * word, int64 suggestedReg )
{
    if ( word->CAttribute & REGISTER_VARIABLE )
    {
        optInfo->OptimizeFlag |= OPTIMIZE_REGISTER ;
        optInfo->Optimize_Dest_RegOrMem = REG ;
        optInfo->Optimize_Mod = REG ;
        optInfo->Optimize_Rm = optInfo->Optimize_Reg = ( suggestedReg != - 1 ) ? suggestedReg : word->RegToUse ;
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
        if ( suggestedReg == - 1 ) suggestedReg = R8D ;
        _Compile_Move_Literal_Immediate_To_Reg ( suggestedReg, ( int64 ) word->W_PtrToValue ) ; // ?? should this be here ??
        optInfo->Optimize_Rm = suggestedReg ;
        optInfo->OptimizeFlag |= OPTIMIZE_RM ;
    }
    else //if ( word->CAttribute & CATEGORY_OP_1_ARG )
    {
        optInfo->Optimize_Rm = DSP ;
        optInfo->OptimizeFlag |= OPTIMIZE_RM ;
    }
}

void
PeepHole_Optimize ( )
{
    if ( GetState ( _CfrTil_, OPTIMIZE_ON ) )
    {
        byte * here = _Q_CodeByteArray->EndIndex ;
        byte sub_Esi_04__add_Esi_04 [ ] = { 0x83, 0xee, 0x04, 0x83, 0xc6, 0x04 } ;
        byte add_esi_04__mov_tos_eax_sub_esi_04 [ ] = { 0x83, 0xc6, 0x04, 0x89, 0x06, 0x83, 0xee, 0x04 } ;
        //byte mov_eax_tos_sub_esi_04_test_eax_eax [ ] = { 0x89, 0x06, 0x83, 0xee, 0x04, 0x85, 0xc0 } ;
        if ( * ( int64* ) ( here - 4 ) == 0x068b0689 ) // 0x89068b06 little endian - movEaxToTos_movTosToEax
        {
            _ByteArray_UnAppendSpace ( _Q_CodeByteArray, 2 ) ;
        }
        else if ( ! memcmp ( sub_Esi_04__add_Esi_04, here - 6, 6 ) )
        {
            _ByteArray_UnAppendSpace ( _Q_CodeByteArray, 6 ) ;
        }
        else if ( ! memcmp ( add_esi_04__mov_tos_eax_sub_esi_04, here - 8, 8 ) )
        {
            _ByteArray_UnAppendSpace ( _Q_CodeByteArray, 8 ) ;
        }
#if 0   // this occurs one time at startup in _assertStkChk : change it where it is caused and eliminate testing every instruction !! 
        else if ( ! memcmp ( mov_eax_tos_sub_esi_04_test_eax_eax, here - 7, 7 ) )
        {
            _ByteArray_UnAppendSpace ( _Q_CodeByteArray, 7 ) ;
            _Compile_TEST_Reg_To_Reg ( R8D, R8D ) ;
        }
#endif        
    }
}

// rpn therefore look behind 
// translate word classes into bit patterns

int64
_GetWordStackListState ( int64 count )
{
    int64 attribute ;
    int64 state = 0, op = 0 ; // , dpth = _Stack_Depth ( compiler->WordStack ) ;
    int64 i, j, objectFieldFlag = 0 ;
    Word * word ;
    for ( j = 0, i = 0 ; j < count ; j ++, i ++ )
    {
        //word = Compiler_WordStack ( - j ) ;
        word = Compiler_WordList ( j ) ;
        if ( ! word ) break ;
        if ( GetState ( word, OPTIMIZE_OFF ) )
        {
            SetState ( word, OPTIMIZE_OFF, false ) ;
            continue ;
        }
        attribute = word->CAttribute ;
        if ( attribute & ( DEBUG_WORD ) )
        {
            i -- ;
            continue ;
        }
        else if ( attribute & ( THIS | OBJECT | OBJECT_FIELD ) )
        {
            if ( objectFieldFlag )
            {
                // this case comes up with arrays
                -- i ;
                if ( attribute & ( THIS | OBJECT ) )
                {
                    -- count ;
                    objectFieldFlag = false ;
                }
                continue ; // don't record an OBJECT_FIELD
            }
            else if ( attribute & OBJECT_FIELD )
            {
                if ( ! objectFieldFlag ) ++ count ; // only increment/decrement count once per object
                objectFieldFlag = true ;
                continue ; // don't record an OBJECT_FIELD
            }
            //op = OP_OBJECT ;
            op = OP_VAR ;
        }
        else
        {
            objectFieldFlag = false ;
            if ( attribute & ( LITERAL | CONSTANT ) ) op = OP_LC ;
                //else if ( category & ( THIS | OBJECT | OBJECT_FIELD ) ) op = OP_OBJECT ;
            else if ( attribute & ( LOCAL_VARIABLE | PARAMETER_VARIABLE | NAMESPACE_VARIABLE ) ) op = OP_VAR ;
            else if ( attribute & ( CATEGORY_EQUAL ) ) op = OP_EQUAL ;
            else if ( attribute & ( CATEGORY_OP_EQUAL ) ) op = OP_OPEQUAL ;
            else if ( attribute & ( CATEGORY_OP_1_ARG ) ) op = OP_1_ARG ;
            else if ( attribute & ( CATEGORY_LOGIC ) ) op = OP_LOGIC ;
            else if ( attribute & ( CATEGORY_OP_UNORDERED ) ) op = OP_UNORDERED ;
            else if ( attribute & ( CATEGORY_OP_STORE ) ) op = OP_STORE ;
            else if ( attribute & ( CATEGORY_OP_ORDERED ) ) op = OP_ORDERED ;
            else if ( attribute & ( CATEGORY_DUP ) ) op = OP_DUP ;
                //else if ( category & ( CATEGORY_RECURSIVE ) ) op = OP_RECURSE ;
            else if ( attribute & ( CATEGORY_OP_LOAD ) ) op = OP_FETCH ;
            else if ( attribute & ( CATEGORY_OP_DIVIDE ) ) op = OP_DIVIDE ;
            else if ( attribute & ( CPRIMITIVE | BLOCK ) ) continue ; //op = OP_CPRIMITIVE ;
                //else if ( category & ( STACKING ) ) op = OP_STACK ;
            else
            {
                break ;
            }
        }
        state |= ( op << ( i * O_BITS ) ) ;
    }
    return state ;
}

// A rewriting optInfo with smart operators :
// we have operands on the stack, this optimizes their locations for an operation
// such as add, sub, mul, div, shl, shr, =, etc.
// the op will then be : op dst, src -- intel syntax
// generally set it up so that src operand is in eax register and dst operand is tos
// if we can set this up return true else false
//
// the optimization is simple reason applied to the situation where it 
// occurs based solely on what words are already in the Compiler Word Stack (compiler->WordStack)
// eg. an operator that takes 2 args : if there is optInfo->O_one in the optimize window 
// the other must be on stack so we assume it to be there and rewrite the code
// as if it was there, if it wasn't there the user has made an error by using the
// operator in the first place and also, of course, the compiled code will probably crash

int64
_CheckOptimizeOperands ( Compiler * compiler, int64 maxOperands )
{
    int64 i = 0 ;
    if ( GetState ( _CfrTil_, OPTIMIZE_ON ) )
    {
        CompileOptInfo_Init ( compiler ) ;
        CompileOptimizeInfo * optInfo = compiler->optInfo ;
        int64 state = _GetWordStackListState ( maxOperands ) ;
        int64 depth = List_Depth ( compiler->WordList ) ;
        if ( maxOperands > depth ) maxOperands = depth ;
        for ( i = maxOperands ; i > 0 ; i -- )
        {
            int64 mask = ( 0xf ) << ( i * O_BITS ) ;
            if ( state )
            {
                state &= ~ mask ;
                switch ( state )
                    // these cases of bitwised ORed values represent the "optimize window" ; the right most ORed value is top of word stack = current word
                    // the leftmost ORed value is fartherest down in the stack, etc.
                {
                    case ( OP_VAR << ( 3 * O_BITS ) | OP_FETCH << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_UNORDERED ):
                    case ( OP_VAR << ( 3 * O_BITS ) | OP_FETCH << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_ORDERED ):
                    case ( OP_VAR << ( 3 * O_BITS ) | OP_FETCH << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_DIVIDE ):
                        //case ( OP_VAR << ( 3 * O_BITS ) | OP_FETCH << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_LOGIC ):
                    {
                        SetHere ( optInfo->O_three->Coding ) ;
                        if ( compiler->NumberOfRegisterVariables )
                        {
                            if ( optInfo->O_zero->CAttribute & CATEGORY_OP_DIVIDE )
                                return 0 ; // seems untested 
                            _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                            _GetRmDispImm ( optInfo, optInfo->O_three, - 1 ) ;
                        }
                        else
                        {
                            _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_three, R8D ) ;
                            if ( optInfo->O_zero->CAttribute & CATEGORY_OP_DIVIDE )
                            {
                                _Compile_MoveImm_To_Reg ( R9D, ( int64 ) * optInfo->O_one->W_PtrToValue, CELL ) ;
                                optInfo->Optimize_Mod = REG ;
                                optInfo->Optimize_Rm = R9D ;
                            }
                            else _GetRmDispImm ( optInfo, optInfo->O_one, R9D ) ;
                        }
                        optInfo->Optimize_Dest_RegOrMem = REG ;
                        optInfo->Optimize_Mod = REG ;
                        return i ;
                    }
                    case ( OP_VAR << ( 3 * O_BITS ) | OP_FETCH << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_LOGIC ):
                    {
                        SetHere ( optInfo->O_three->Coding ) ;
                        _GetRmDispImm ( optInfo, optInfo->O_three, - 1 ) ;
                        _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                        optInfo->Optimize_Dest_RegOrMem = MEM ;
                        return i ;
                    }
                        // CONSTANT_FOLDING 
                        // this is the code to collapse (fold) constants and literals with integer operators
                        // can collapse a pipeline of constants with operators
                    case ( OP_LC << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_DIVIDE ):
                    case ( OP_LC << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_UNORDERED ):
                    case ( OP_LC << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_ORDERED ):
                    case ( OP_LC << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_LOGIC ):
                    {
                        int64 value ;
                        SetHere ( optInfo->O_two->Coding ) ;
                        // a little tricky here ...
                        // ?? maybe we should setup and use a special compiler stack and use it here ... ??
                        DSP_Push ( ( int64 ) * optInfo->O_two->W_PtrToValue ) ;
                        DSP_Push ( ( int64 ) * optInfo->O_one->W_PtrToValue ) ;
                        SetState ( compiler, COMPILE_MODE, false ) ;
                        SetState ( _CfrTil_, OPTIMIZE_ON, false ) ; //prevent recursion here
                        _Word_Run ( optInfo->O_zero ) ;
                        SetState ( compiler, COMPILE_MODE, true ) ;
                        SetState ( _CfrTil_, OPTIMIZE_ON, true ) ; //prevent recursion here
                        value = _DataStack_Pop ( ) ;
                        Set_SCA ( 0 ) ;
                        _Compile_MoveImm_To_Reg ( R8D, value, CELL ) ;
                        _Word_CompileAndRecord_PushReg ( optInfo->O_zero, R8D ) ;
                        return OPTIMIZE_DONE ;
                    }
                    case ( OP_VAR << ( 4 * O_BITS ) | OP_FETCH << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_DIVIDE ):
                    case ( OP_VAR << ( 4 * O_BITS ) | OP_FETCH << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_UNORDERED ):
                    case ( OP_VAR << ( 4 * O_BITS ) | OP_FETCH << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_ORDERED ):
                    case ( OP_VAR << ( 4 * O_BITS ) | OP_FETCH << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_LOGIC ):
                    {
                        //if ( optInfo->O_zero->CAttribute & BIT_SHIFT ) return 0 ;
                        //SetHere ( optInfo->O_four->StackPushRegisterCode ) ; // leave optInfo->O_two value in R8 we don't need to push it
                        SetHere ( optInfo->O_four->Coding ) ;
                        if ( compiler->NumberOfRegisterVariables )
                        {
                            optInfo->Optimize_DstReg = optInfo->O_four->RegToUse ;
                            optInfo->Optimize_SrcReg = optInfo->O_two->RegToUse ;
                            _GetRmDispImm ( optInfo, optInfo->O_two, R8D ) ;
                            optInfo->Optimize_Dest_RegOrMem = REG ;
                            optInfo->Optimize_Mod = REG ;
                        }
                        else
                        {
                            _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_four, R8D ) ;
                            if ( optInfo->O_two->CAttribute & ( THIS | OBJECT ) )
                            {
                                _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_two, R9D ) ;
                                optInfo->Optimize_Reg = R8D ; // shouldn't need this but some code still references this as the rm ?? fix ??
                                optInfo->Optimize_Rm = R9D ;
                                optInfo->Optimize_Dest_RegOrMem = REG ;
                                optInfo->Optimize_Mod = REG ;
                            }
                            else
                            {
                                _GetRmDispImm ( optInfo, optInfo->O_two, - 1 ) ;
                                optInfo->Optimize_Dest_RegOrMem = REG ;
                                optInfo->Optimize_Mod = MEM ;
                                optInfo->Optimize_Reg = R8D ;
                            }
                        }
                        return i ;
                    }
                    case ( OP_LC << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_UNORDERED ):
                    case ( OP_LC << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_ORDERED ):
                    case ( OP_LC << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_LOGIC ):
                    case ( OP_LC << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_DIVIDE ):
                    {
                        SetHere ( optInfo->O_three->Coding ) ;
                        _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_three, R8D ) ;
                        if ( optInfo->O_zero->CAttribute & CATEGORY_OP_DIVIDE )
                        {
                            _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_two, R9D ) ;
                            optInfo->Optimize_Rm = R9D ;
                        }
                        optInfo->Optimize_Dest_RegOrMem = REG ;
                        optInfo->Optimize_Mod = REG ;
                        return i ;
                    }
                        // ?? assume correct first operand is there TOS - it would already be a user error if they were not ??
#if 0 // something else needed here
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_UNORDERED ):
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_ORDERED ):
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_DIVIDE ):
#endif                        
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_LOGIC ):
                    {
                        SetHere ( optInfo->O_two->Coding ) ;
                        _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_two, R9D ) ;
                        optInfo->Optimize_Dest_RegOrMem = MEM ;
                        optInfo->Optimize_Mod = MEM ;
                        optInfo->Optimize_Reg = R9D ; // shouldn't need this but some code still references this as the rm ?? fix ??
                        optInfo->Optimize_Rm = DSP ;
                        return i ;
                    }
                    case ( OP_DUP << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_DIVIDE ):
                    case ( OP_DUP << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_UNORDERED ):
                    case ( OP_DUP << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_ORDERED ):
                    case ( OP_DUP << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_LOGIC ):
                    {
                        SetHere ( optInfo->O_two->Coding ) ;
                        _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                        optInfo->Optimize_Dest_RegOrMem = MEM ;
                        optInfo->Optimize_Mod = MEM ;
                        optInfo->Optimize_Rm = DSP ;
                        return i ;
                    }
                        // assume correct first operand (optInfo->O_two) must be there on the stack
                        //case ( OP_LC << ( 1 * O_BITS ) | OP_DIVIDE ):
                    case ( OP_LC << ( 1 * O_BITS ) | OP_UNORDERED ):
                    case ( OP_LC << ( 1 * O_BITS ) | OP_ORDERED ):
                    case ( OP_LC << ( 1 * O_BITS ) | OP_LOGIC ):
                    {
                        SetHere ( optInfo->O_one->Coding ) ;
                        _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                        optInfo->Optimize_Dest_RegOrMem = MEM ;
                        optInfo->Optimize_Mod = MEM ;
                        optInfo->Optimize_Rm = DSP ;
                        return i ;
                    }
                        //case ( OP_DIVIDE << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_DIVIDE ):
                    case ( OP_DIVIDE << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_UNORDERED ):
                    case ( OP_DIVIDE << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_ORDERED ):
                    case ( OP_ORDERED << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_UNORDERED ):
                    case ( OP_UNORDERED << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_UNORDERED ):
                    case ( OP_ORDERED << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_ORDERED ):
                    case ( OP_UNORDERED << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_ORDERED ):
                    {
                        if ( optInfo->O_two->StackPushRegisterCode )
                        {
                            SetHere ( optInfo->O_two->StackPushRegisterCode ) ; // leave optInfo->O_two value in R8 we don't need to push it
                            _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                            optInfo->Optimize_Dest_RegOrMem = REG ;
                            optInfo->Optimize_Mod = REG ;
                            optInfo->Optimize_Reg = R8D ; // only for "mod" will it be edx else eax
                            optInfo->Optimize_Rm = R8D ;
                            return i ;
                        }
                        else return 0 ;
                    }
                    case ( OP_ORDERED << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_DIVIDE ):
                    case ( OP_UNORDERED << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_DIVIDE ):
                    case ( OP_DIVIDE << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_DIVIDE ):
                    {

                        if ( optInfo->O_two->StackPushRegisterCode )
                        {
                            SetHere ( optInfo->O_two->StackPushRegisterCode ) ; // leave optInfo->O_two value in R8 we don't need to push it
                            _Compile_MoveImm_To_Reg ( R9D, ( int64 ) * optInfo->O_one->W_PtrToValue, CELL ) ;
                            optInfo->Optimize_Mod = REG ;
                            optInfo->Optimize_Rm = R9D ;
                            return i ;
                        }
                        else return 0 ;
                    }
                    case ( OP_UNORDERED << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_DIVIDE ):
                    case ( OP_ORDERED << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_DIVIDE ):
                    case ( OP_DIVIDE << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_DIVIDE ):
                    case ( OP_DIVIDE << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_UNORDERED ):
                    case ( OP_DIVIDE << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_ORDERED ):
                    case ( OP_ORDERED << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_UNORDERED ):
                    case ( OP_UNORDERED << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_UNORDERED ):
                    case ( OP_ORDERED << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_ORDERED ):
                    case ( OP_UNORDERED << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_ORDERED ):
                    {
                        if ( optInfo->O_three->StackPushRegisterCode )
                        {
                            SetHere ( optInfo->O_three->StackPushRegisterCode ) ; // leave optInfo->O_two value in R8 we don't need to push it
                            if ( optInfo->O_two->CAttribute & ( THIS | OBJECT ) )
                            {
                                _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_two, R9D ) ;
                                optInfo->Optimize_Dest_RegOrMem = REG ;
                                optInfo->Optimize_Mod = REG ;
                                optInfo->Optimize_Reg = R8D ; // shouldn't need this but some code still references this as the rm ?? fix ??
                                optInfo->Optimize_Rm = R9D ;
                            }
                            else
                            {
                                _GetRmDispImm ( optInfo, optInfo->O_two, - 1 ) ;
                                optInfo->Optimize_Dest_RegOrMem = REG ;
                                optInfo->Optimize_Mod = MEM ;
                            }
                            return i ;
                        }
                        else return 0 ;
                    }
                    case ( OP_VAR << ( 3 * O_BITS ) | OP_FETCH << ( 2 * O_BITS ) | OP_DUP << ( 1 * O_BITS ) | OP_1_ARG ):
                    {
                        SetHere ( optInfo->O_three->Coding ) ;
                        _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_three, R8D ) ;
                        Compile_ADDI ( REG, DSP, 0, 2 * CELL, 0 ) ;
                        _Compile_Move_Reg_To_StackN ( DSP, - 1, R8D ) ;
                        _Compile_Move_Reg_To_StackN ( DSP, 0, R8D ) ;
                        optInfo->Optimize_Mod = MEM ;
                        optInfo->Optimize_Rm = DSP ;
                        return i ;
                    }
                        // CONSTANT_FOLDING - 1 arg op
                        // this is the code to collapse (fold) constants and literals with integer operators
                        // can collapse a pipeline of constants with operators
                    case ( OP_LC << ( 1 * O_BITS ) | OP_1_ARG ):
                    {
                        // compile to a constant
                        int64 value ;
                        SetHere ( optInfo->O_one->Coding ) ;
                        // a little tricky here ...
                        // ?? maybe we should setup and use a special compiler stack and use it here ... ??
                        //_DataStack_Push ( (int64) optInfo->O_two->Object ) ;
                        DSP_Push ( ( int64 ) * optInfo->O_one->W_PtrToValue ) ;
                        SetState ( compiler, COMPILE_MODE, false ) ;
                        SetState ( _CfrTil_, OPTIMIZE_ON, false ) ; //prevent recursion here
                        _Word_Run ( optInfo->O_zero ) ;
                        SetState ( compiler, COMPILE_MODE, true ) ;
                        SetState ( _CfrTil_, OPTIMIZE_ON, true ) ; //prevent recursion here
                        value = _DataStack_Pop ( ) ;
                        Set_SCA ( 0 ) ;
                        _Compile_MoveImm_To_Reg ( R8D, value, CELL ) ;
                        _Word_CompileAndRecord_PushReg ( optInfo->O_zero, R8D ) ;
                        return OPTIMIZE_DONE ;
                    }
                    case ( OP_VAR << ( 1 * O_BITS ) | OP_1_ARG ):
                    {
                        //if ( ! GetState ( _Context_->Compiler0, PREFIX_PARSING ) )
                        {
                            SetHere ( optInfo->O_one->Coding ) ;
                            _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                            optInfo->Optimize_Dest_RegOrMem = REG ;
                            return i ;
                        }
                        //else return 0 ;
                    }
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_UNORDERED << ( 1 * O_BITS ) | OP_1_ARG ):
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_ORDERED << ( 1 * O_BITS ) | OP_1_ARG ):
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_LOGIC << ( 1 * O_BITS ) | OP_1_ARG ):
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_1_ARG << ( 1 * O_BITS ) | OP_1_ARG ):
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_DIVIDE << ( 1 * O_BITS ) | OP_1_ARG ):
                    {
                        // this is mainly for postfix inc/dec in C_SYNTAX
                        if ( GetState ( _Context_, C_SYNTAX ) )
                        {
                            if ( optInfo->O_one->StackPushRegisterCode )
                            {
                                SetHere ( optInfo->O_one->StackPushRegisterCode ) ;
                            }
                            _GetRmDispImm ( optInfo, optInfo->O_two, - 1 ) ;
                            return i ;
                        }
                        else return 0 ;
                    }
                    case ( OP_UNORDERED << ( 1 * O_BITS ) | OP_1_ARG ):
                    case ( OP_ORDERED << ( 1 * O_BITS ) | OP_1_ARG ):
                    case ( OP_LOGIC << ( 1 * O_BITS ) | OP_1_ARG ):
                    case ( OP_1_ARG << ( 1 * O_BITS ) | OP_1_ARG ):
                    case ( OP_DIVIDE << ( 1 * O_BITS ) | OP_1_ARG ):
                    {
                        if ( ! GetState ( _Context_, C_SYNTAX ) )
                        {
                            if ( optInfo->O_one->StackPushRegisterCode ) // leave value in R8, don't push it
                            {
                                SetHere ( optInfo->O_one->StackPushRegisterCode ) ; // leave optInfo->O_two value in R8 we don't need to push it
                                compiler->optInfo->Optimize_Rm = R8D ;
                                optInfo->Optimize_Mod = REG ;
                            }
                            else compiler->optInfo->Optimize_Rm = DSP ;
                            return i ;
                        }
                        else return 0 ;
                    }
                    case ( OP_STACK << ( 1 * O_BITS ) | OP_1_ARG ):
                    {
                        optInfo->Optimize_Mod = MEM ;
                        optInfo->Optimize_Rm = DSP ;
                        return i ;
                    }
                        // OP_EQUAL
                    case ( OP_VAR << ( 5 * O_BITS ) | OP_VAR << ( 4 * O_BITS ) | OP_FETCH << ( 3 * O_BITS ) | OP_LC << ( 2 * O_BITS ) | OP_DIVIDE << ( 1 * O_BITS ) | OP_EQUAL ):
                    case ( OP_VAR << ( 5 * O_BITS ) | OP_VAR << ( 4 * O_BITS ) | OP_FETCH << ( 3 * O_BITS ) | OP_LC << ( 2 * O_BITS ) | OP_UNORDERED << ( 1 * O_BITS ) | OP_EQUAL ):
                    case ( OP_VAR << ( 5 * O_BITS ) | OP_VAR << ( 4 * O_BITS ) | OP_FETCH << ( 3 * O_BITS ) | OP_LC << ( 2 * O_BITS ) | OP_ORDERED << ( 1 * O_BITS ) | OP_EQUAL ):
                    {
                        SetHere ( optInfo->O_five->Coding ) ;
                        _GetRmDispImm ( optInfo, optInfo->O_five, - 1 ) ;
                        if ( optInfo->O_one->Definition == CfrTil_Minus )
                        {
                            Set_SCA ( 1 ) ;
                            _Compile_X_Group1_Immediate ( SUB, MEM, optInfo->Optimize_Rm, compiler->optInfo->Optimize_Disp, *optInfo->O_two->W_PtrToValue, CELL ) ;
                        }
                        else if ( optInfo->O_one->Definition == CfrTil_Plus )
                        {
                            Set_SCA ( 1 ) ;
                            _Compile_X_Group1_Immediate ( ADD, MEM, optInfo->Optimize_Rm, compiler->optInfo->Optimize_Disp, *optInfo->O_two->W_PtrToValue, CELL ) ;
                        }
                        else if ( optInfo->O_one->Definition == CfrTil_BitWise_AND )
                        {
                            Set_SCA ( 1 ) ;
                            _Compile_X_Group1_Immediate ( AND, MEM, optInfo->Optimize_Rm, compiler->optInfo->Optimize_Disp, *optInfo->O_two->W_PtrToValue, CELL ) ;
                        }
                        else if ( optInfo->O_one->Definition == CfrTil_BitWise_OR )
                        {
                            Set_SCA ( 1 ) ;
                            _Compile_X_Group1_Immediate ( OR, MEM, optInfo->Optimize_Rm, compiler->optInfo->Optimize_Disp, *optInfo->O_two->W_PtrToValue, CELL ) ;
                        }
                        else if ( optInfo->O_one->Definition == CfrTil_Multiply )
                        {
                            //_Compile_IMULI ( int64 mod, int64 reg, int64 rm, int64 sib, int64 disp, int64 imm, int64 size )
                            Set_SCA ( 1 ) ;
                            _Compile_IMULI ( MEM, R8D, optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp, *optInfo->O_two->W_PtrToValue, CELL ) ;
                            Set_SCA ( 0 ) ;
                            _Compile_Move ( MEM, R8D, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp ) ;
                        }
                        else if ( optInfo->O_one->Definition == CfrTil_Divide )
                        {
                            Set_SCA ( 5 ) ;
                            _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_five, R8D ) ;
                            _Compile_MoveImm ( REG, R10D, 0, 0, 0, CELL ) ;
                            // for idiv the dividend must be eax:edx, divisor can be reg or rm ; here we use ECX
                            // Compile_IDIV ( mod, rm, sib, disp, imm, size )
                            _Compile_MoveImm ( REG, R9D, 0, 0, *optInfo->O_two->W_PtrToValue, CELL ) ;
                            Set_SCA ( 1 ) ;
                            Compile_IDIV ( REG, R9D, 0, 0, 0, 0 ) ;
                            Set_SCA ( 0 ) ;
                            _Compile_Move ( MEM, R8D, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp ) ;
                        }
                        else if ( optInfo->O_one->Definition == CfrTil_Mod ) // "%" is in Lexer and Int
                        {
                            Set_SCA ( 5 ) ;
                            _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_five, R8D ) ;
                            _Compile_MoveImm ( REG, R10D, 0, 0, 0, CELL ) ;
                            Set_SCA ( 2 ) ;
                            _Compile_MoveImm ( REG, R9D, 0, 0, *optInfo->O_two->W_PtrToValue, CELL ) ;
                            Set_SCA ( 1 ) ;
                            Compile_IDIV ( REG, R9D, 0, 0, 0, 0 ) ;
                            Set_SCA ( 0 ) ;
                            _Compile_Move_Reg_To_Reg ( R8D, R10D ) ; // for consistency finally use R8 so optInfo can always count on eax as the pushed reg
                            _Compile_Move ( MEM, R8D, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp ) ;
                        }
                        else if ( optInfo->O_one->Definition == CfrTil_ShiftLeft )
                        {
                            //_Compile_Group2 ( int64 mod, int64 regOpCode, int64 rm, int64 sib, int64 disp, int64 imm )
                            Set_SCA ( 2 ) ;
                            _Compile_Group2 ( MEM, SHL, optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp, *optInfo->O_two->W_PtrToValue ) ;
                        }
                        else if ( optInfo->O_one->Definition == CfrTil_ShiftRight )
                        {
                            Set_SCA ( 2 ) ;
                            _Compile_Group2 ( MEM, SHR, optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp, *optInfo->O_two->W_PtrToValue ) ;
                        }
                        else continue ;
                        return ( OPTIMIZE_DONE | OPTIMIZE_RESET ) ;
                    }
                    case ( OP_VAR << ( 6 * O_BITS ) | OP_VAR << ( 5 * O_BITS ) | OP_FETCH << ( 4 * O_BITS ) | OP_VAR << ( 3 * O_BITS ) | OP_FETCH << ( 2 * O_BITS ) | OP_DIVIDE << ( 1 * O_BITS ) | OP_EQUAL ):
                    case ( OP_VAR << ( 6 * O_BITS ) | OP_VAR << ( 5 * O_BITS ) | OP_FETCH << ( 4 * O_BITS ) | OP_VAR << ( 3 * O_BITS ) | OP_FETCH << ( 2 * O_BITS ) | OP_UNORDERED << ( 1 * O_BITS ) | OP_EQUAL ):
                    case ( OP_VAR << ( 6 * O_BITS ) | OP_VAR << ( 5 * O_BITS ) | OP_FETCH << ( 4 * O_BITS ) | OP_VAR << ( 3 * O_BITS ) | OP_FETCH << ( 2 * O_BITS ) | OP_ORDERED << ( 1 * O_BITS ) | OP_EQUAL ):
                    {
                        int64 op ;
                        // this needs to be more optimized - these different ifs maybe can be condensed
                        SetHere ( optInfo->O_six->Coding ) ;
                        if ( ( optInfo->O_one->Definition == CfrTil_Minus ) || ( optInfo->O_one->Definition == CfrTil_Plus ) ||
                            ( optInfo->O_one->Definition == CfrTil_BitWise_AND ) || ( optInfo->O_one->Definition == CfrTil_BitWise_OR ) )
                        {
                            if ( optInfo->O_one->Definition == CfrTil_Minus ) op = SUB ;
                            else if ( optInfo->O_one->Definition == CfrTil_Plus ) op = ADD ;
                            else if ( optInfo->O_one->Definition == CfrTil_BitWise_AND ) op = AND ;
                            else if ( optInfo->O_one->Definition == CfrTil_BitWise_OR ) op = OR ;
                            if ( optInfo->O_six->W_OriginalWord != optInfo->O_five->W_OriginalWord )
                            {
                                _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_five, R8D ) ;
                                _GetRmDispImm ( optInfo, optInfo->O_three, - 1 ) ;
                                Set_SCA ( 1 ) ;
                                _Compile_X_Group1 ( op, REG, optInfo->Optimize_Mod, R8D, optInfo->Optimize_Rm, 0, optInfo->Optimize_Disp, CELL ) ;
                                _GetRmDispImm ( optInfo, optInfo->O_six, - 1 ) ;
                                Set_SCA ( 0 ) ;
                                _Compile_Move ( MEM, R8D, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp ) ;
                            }
                            else
                            {
                                _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_three, R8D ) ;
                                _GetRmDispImm ( optInfo, optInfo->O_six, - 1 ) ;
                                Set_SCA ( 1 ) ;
                                _Compile_X_Group1 ( op, MEM, optInfo->Optimize_Mod, R8D, optInfo->Optimize_Rm, 0, optInfo->Optimize_Disp, CELL ) ;
                            }
                        }
                        else if ( optInfo->O_one->Definition == CfrTil_Multiply )
                        {
                            Set_SCA ( 3 ) ;
                            _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_three, R8D ) ;
                            if ( optInfo->O_six->W_OriginalWord != optInfo->O_five->W_OriginalWord )
                            {
                                _GetRmDispImm ( optInfo, optInfo->O_five, - 1 ) ;
                                Set_SCA ( 1 ) ;
                                _Compile_IMUL ( MEM, R8D, optInfo->Optimize_Rm, 0, optInfo->Optimize_Disp ) ;
                                _GetRmDispImm ( optInfo, optInfo->O_six, - 1 ) ;
                                Set_SCA ( 0 ) ;
                                _Compile_Move ( MEM, R8D, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp ) ;
                            }
                            else
                            {
                                _GetRmDispImm ( optInfo, optInfo->O_six, - 1 ) ;
                                Set_SCA ( 1 ) ;
                                _Compile_IMUL ( MEM, R8D, optInfo->Optimize_Rm, 0, optInfo->Optimize_Disp ) ;
                                Set_SCA ( 0 ) ;
                                _Compile_Move ( MEM, R8D, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp ) ;
                            }
                        }
                        else if ( ( optInfo->O_one->Definition == CfrTil_ShiftLeft ) || ( optInfo->O_one->Definition == CfrTil_ShiftRight ) )
                        {
                            if ( optInfo->O_one->Definition == CfrTil_ShiftLeft ) op = SHL ;
                            else if ( optInfo->O_one->Definition == CfrTil_ShiftRight ) op = SHR ;
                            if ( optInfo->O_six->W_OriginalWord == optInfo->O_five->W_OriginalWord )
                            {
                                _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_three, R9D ) ;
                                _GetRmDispImm ( optInfo, optInfo->O_six, - 1 ) ;
                                Set_SCA ( 1 ) ;
                                _Compile_Group2_CL ( MEM, op, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp ) ;
                            }
                            else
                            {
                                _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_three, R9D ) ;
                                _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_five, R8D ) ;
                                Set_SCA ( 1 ) ;
                                _Compile_Group2_CL ( REG, op, R8D, 0, 0 ) ;
                                _GetRmDispImm ( optInfo, optInfo->O_six, - 1 ) ;
                                Set_SCA ( 0 ) ;
                                _Compile_Move ( MEM, R8D, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp ) ;
                            }
                        }
                        else if ( ( optInfo->O_one->Definition == CfrTil_Divide ) || ( optInfo->O_one->Definition == CfrTil_Mod ) )
                        {
                            if ( optInfo->O_six->W_OriginalWord == optInfo->O_five->W_OriginalWord )
                            {
                                _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_six, R8D ) ;
                                _Compile_MoveImm ( REG, R10D, 0, 0, 0, CELL ) ;
                                _GetRmDispImm ( optInfo, optInfo->O_three, - 1 ) ;
                                Set_SCA ( 1 ) ;
                                Compile_IDIV ( MEM, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp, 0, 0 ) ;
                            }
                            else
                            {
                                _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_five, R8D ) ;
                                _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_three, R9D ) ;
                                _Compile_MoveImm ( REG, R10D, 0, 0, 0, CELL ) ;
                                Set_SCA ( 1 ) ;
                                Compile_IDIV ( REG, R9D, 0, 0, 0, 0 ) ;
                            }
                            _GetRmDispImm ( optInfo, optInfo->O_six, - 1 ) ;
                            if ( optInfo->O_one->Definition == CfrTil_Divide )
                            {
                                Set_SCA ( 0 ) ;
                                _Compile_Move ( MEM, R8D, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp ) ;
                            }
                            else _Compile_Move ( MEM, R10D, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp ) ;
                        }
                        else continue ;
                        return ( OPTIMIZE_DONE | OPTIMIZE_RESET ) ;
                    }
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_EQUAL ):
                    {
                        SetHere ( optInfo->O_two->Coding ) ;
                        if ( optInfo->O_two->CAttribute & REGISTER_VARIABLE ) compiler->optInfo->Optimize_Dest_RegOrMem = REG ;
                        else if ( ( optInfo->O_two->CAttribute & THIS ) ) optInfo->Optimize_Dest_RegOrMem = MEM ;
                        if ( optInfo->O_two->CAttribute & ( THIS | REGISTER_VARIABLE ) )
                        {
                            Set_SCA ( 2 ) ;
                            _Compile_GetVarLitObj_LValue_To_Reg ( optInfo->O_two, R8D ) ;
                            _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                            optInfo->Optimize_Rm = R8D ; // shouldn't need this but some code still references this as the rm ?? fix ??
                            return ( i | OPTIMIZE_RESET ) ;
                        }
                        else
                        {
                            Set_SCA ( 2 ) ;
                            _GetRmDispImm ( optInfo, optInfo->O_two, - 1 ) ;
                            Set_SCA ( 0 ) ;
                            _Compile_MoveImm ( MEM, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp, ( int64 ) * optInfo->O_one->W_PtrToValue, CELL ) ;
                            return ( OPTIMIZE_DONE | OPTIMIZE_RESET ) ;
                        }
                    }
                    case ( OP_VAR << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_EQUAL ):
                    {
                        SetHere ( optInfo->O_three->Coding ) ;
                        if ( optInfo->O_three->CAttribute & REGISTER_VARIABLE ) compiler->optInfo->Optimize_Dest_RegOrMem = REG ;
                        else if ( ( optInfo->O_two->CAttribute & THIS ) ) optInfo->Optimize_Dest_RegOrMem = MEM ;
                        if ( optInfo->O_three->CAttribute & ( THIS | REGISTER_VARIABLE ) )
                        {
                            Set_SCA ( 3 ) ;
                            _Compile_GetVarLitObj_LValue_To_Reg ( optInfo->O_three, R8D ) ;
                            SetHere ( optInfo->O_three->StackPushRegisterCode ) ;
                            Set_SCA ( 2 ) ;
                            _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_two, R9D ) ;
                            Set_SCA ( 0 ) ;
                            _Compile_Move_Reg_To_Rm ( R8D, R9D, 0 ) ;
                        }
                        else
                        {
                            Set_SCA ( 2 ) ;
                            _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_two, R9D ) ;
                            _GetRmDispImm ( optInfo, optInfo->O_three, - 1 ) ;
                            //_Compile_Move ( int64 direction, int64 reg, int64 rm, int64 sib, int64 disp )
                            Set_SCA ( 0 ) ;
                            _Compile_Move ( MEM, R9D, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp ) ;
                        }
                        return ( OPTIMIZE_DONE | OPTIMIZE_RESET ) ;
                    }
                    case ( OP_VAR << ( 4 * O_BITS ) | OP_FETCH << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_EQUAL ):
                    {
                        SetHere ( optInfo->O_four->Coding ) ;
                        Set_SCA ( 4 ) ;
                        _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_four, R8D ) ;
                        Set_SCA ( 3 ) ;
                        _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_two, R9D ) ;
                        Set_SCA ( 0 ) ;
                        _Compile_Move_Reg_To_Rm ( R8D, R9D, 0 ) ;
                        return ( OPTIMIZE_DONE | OPTIMIZE_RESET ) ;
                    }
                    case ( OP_VAR << ( 3 * O_BITS ) | OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_OPEQUAL ):
                    {
                        SetHere ( optInfo->O_three->Coding ) ;
                        if ( optInfo->O_zero->CAttribute & BIT_SHIFT )
                        {
                            _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_two, R9D ) ;
                            _GetRmDispImm ( optInfo, optInfo->O_three, - 1 ) ;
                        }
                        else
                        {
                            _Compile_GetVarLitObj_LValue_To_Reg ( optInfo->O_three, R8D ) ;
                            _GetRmDispImm ( optInfo, optInfo->O_two, - 1 ) ;
                        }
                        return (i | OPTIMIZE_RESET ) ;
                    }
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_OPEQUAL ):
                    {
                        if ( GetState ( _Context_, (C_SYNTAX|INFIX_MODE) ) )
                        {
                            SetHere ( optInfo->O_two->Coding ) ;
                            if ( optInfo->O_zero->CAttribute & BIT_SHIFT )
                            {
                                _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_one, R9D ) ;
                                _GetRmDispImm ( optInfo, optInfo->O_two, - 1 ) ;
                            }
                            else
                            {
                                _Compile_GetVarLitObj_LValue_To_Reg ( optInfo->O_one, R9D ) ;
                                _Compile_Move_Rm_To_Reg ( R8D, R9D, 0 ) ;
                                _GetRmDispImm ( optInfo, optInfo->O_two, - 1 ) ;
                                optInfo->UseReg = R9D ;
                                optInfo->Optimize_Reg = R8D ;
                            }
                            return (i | OPTIMIZE_RESET ) ;
                        }
                        else return 0 ;
                    }
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_OPEQUAL ):
                    {
                        SetHere ( optInfo->O_two->Coding ) ;
                        //if ( optInfo->O_two->CAttribute & REGISTER_VARIABLE ) compiler->optInfo->Optimize_Dest_RegOrMem = REG ;
                        //else optInfo->Optimize_Dest_RegOrMem = MEM ;
                        if ( ( optInfo->O_zero->Definition == CfrTil_MultiplyEqual ) || ( optInfo->O_zero->Definition == CfrTil_DivideEqual ) )
                        {
                            _Compile_GetVarLitObj_LValue_To_Reg ( optInfo->O_two, R8D ) ;
                        }
                        _GetRmDispImm ( optInfo, optInfo->O_two, - 1 ) ;
                        Set_SCA ( 1 ) ;
                        _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                        optInfo->Optimize_Dest_RegOrMem = REG ;
                        return ( i | OPTIMIZE_RESET ) ;
                    }
                    case ( OP_VAR << ( 3 * O_BITS ) | OP_FETCH << ( 2 * O_BITS ) | OP_DIVIDE << ( 1 * O_BITS ) | OP_EQUAL ):
                    case ( OP_VAR << ( 3 * O_BITS ) | OP_FETCH << ( 2 * O_BITS ) | OP_LOGIC << ( 1 * O_BITS ) | OP_EQUAL ):
                    case ( OP_VAR << ( 3 * O_BITS ) | OP_FETCH << ( 2 * O_BITS ) | OP_UNORDERED << ( 1 * O_BITS ) | OP_EQUAL ):
                    case ( OP_VAR << ( 3 * O_BITS ) | OP_FETCH << ( 2 * O_BITS ) | OP_ORDERED << ( 1 * O_BITS ) | OP_EQUAL ):
                    {
                        if ( optInfo->O_one->StackPushRegisterCode )
                        {
                            SetHere ( optInfo->O_one->StackPushRegisterCode ) ;
                            Set_SCA ( 3 ) ;
                            _Compile_Move_StackN_To_Reg ( R9D, DSP, 0 ) ;
                            Set_SCA ( 0 ) ;
                            _Compile_Move_Reg_To_Rm ( R9D, R8D, 0 ) ;
                            return ( OPTIMIZE_DONE | OPTIMIZE_RESET ) ;
                        }
                        else return 0 ;
                    }
#if 0                    
                        //case ( OP_VAR << ( 2 * O_BITS ) | OP_CPRIMITIVE << ( 1 * O_BITS ) | OP_EQUAL ):
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_EQUAL ):
                    {
                        if ( optInfo->O_two->StackPushRegisterCode )
                        {
                            SetHere ( optInfo->O_two->Coding ) ;
                            // arg order is maintained here
                            _Compile_GetVarLitObj_LValue_To_Reg ( optInfo->O_two, R8D ) ;
                            if ( optInfo->O_two->StackPushRegisterCode ) SetHere ( optInfo->O_two->StackPushRegisterCode ) ;
                            _Compile_GetVarLitObj_LValue_To_Reg ( optInfo->O_one, R9D ) ;
                            optInfo->Optimize_Rm = R8D ;
                            optInfo->Optimize_Reg = R9D ;
                            return (i | OPTIMIZE_RESET ) ;
                        }
                        else return 0 ;
                    }
#endif                    
                        // OP_STORE
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_STORE ): // "!" - store
                    {
                        if ( GetState ( _Context_, C_SYNTAX ) ) //&& ( optInfo->O_two->StackPushRegisterCode ) )
                        {
                            SetHere ( optInfo->O_two->Coding ) ;
                            SC_DWL_Push ( optInfo->O_two ) ;
                            Word * svcrw = _Context_->CurrentlyRunningWord ;
                            _Context_->CurrentlyRunningWord = optInfo->O_two ;
                            if ( GetState ( _Context_, ADDRESS_OF_MODE ) ) _Compile_GetVarLitObj_LValue_To_Reg ( optInfo->O_two, R8D ) ;
                            else _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_two, R8D ) ;
                            _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                            SC_DWL_Push ( optInfo->O_zero ) ;
                            _Compile_Move ( MEM, R8D, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp ) ;
                            _Context_->CurrentlyRunningWord = svcrw ;
                            return ( OPTIMIZE_DONE | OPTIMIZE_RESET ) ;
                        }
                        else return 0 ;
                    }
                    case ( OP_LC << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_STORE ): // "!" - store
                    {
                        SetHere ( optInfo->O_two->Coding ) ;
                        _GetRmDispImm ( optInfo, optInfo->O_two, - 1 ) ;
                        if ( optInfo->O_one->CAttribute & REGISTER_VARIABLE )
                        {
                            Set_SCA ( 0 ) ;
                            _Compile_MoveImm ( REG, R8D, 0, 0, optInfo->Optimize_Imm, CELL ) ;
                            return ( OPTIMIZE_DONE | OPTIMIZE_RESET ) ;
                        }
                        else
                        {
                            //_Compile_GetVarLitObj_LValue_To_Reg ( optInfo->O_one, R8 ) ;
                            _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                            //_Set_SCA ( 0 ) ;
                            return ( i | OPTIMIZE_RESET ) ;
                        }
                    }
                    case ( OP_DUP << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_STORE ): // "!" - store
                    {
                        SetHere ( optInfo->O_two->Coding ) ;
                        if ( ! ( optInfo->O_one->CAttribute & REGISTER_VARIABLE ) ) //_Compile_MoveImm ( REG, R8, 0, 0, optInfo->Optimize_Imm, CELL ) ;
                        {
                            _Compile_GetVarLitObj_LValue_To_Reg ( optInfo->O_one, R9D ) ;
                        }
                        Set_SCA ( 0 ) ;
                        _Compile_Move_Reg_To_Rm ( R9D, R8D, 0 ) ;
                        return ( OPTIMIZE_DONE | OPTIMIZE_RESET ) ;
                    }
#if 1                   
                    case ( OP_VAR << ( 1 * O_BITS ) | OP_STORE ): // "!" - store
                    {
                        if ( GetState ( _Context_, C_SYNTAX ) ) //&& ( optInfo->O_two->StackPushRegisterCode ) )
                        {
                            //SetHere ( optInfo->O_one->Coding ) ;
                            //_Compile_GetVarLitObj_LValue_To_Reg ( optInfo->O_one, ECX ) ;
                            _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                            if ( optInfo->O_two && optInfo->O_two->StackPushRegisterCode ) SetHere ( optInfo->O_two->StackPushRegisterCode ) ;
                            else
                            {
                                // assume two has pushed something onto the stack ?!
                                _Compile_Move_StackN_To_Reg ( R8D, DSP, 0 ) ;
                                _Compile_Stack_Drop ( DSP ) ;
                            }
                            //_Set_SCA ( 0 ) ;
                            //_Compile_MoveImm ( MEM, R8, 0, 0, optInfo->Optimize_Imm, CELL ) ;
                            return ( i | OPTIMIZE_RESET ) ;
                        }
                        else if ( optInfo->O_two->StackPushRegisterCode )
                        {
                            SetHere ( optInfo->O_two->StackPushRegisterCode ) ;
                            //_Set_SCA ( 0 ) ;
                            //_Compile_Move_Reg_To_Rm ( ECX, R8, 0 ) ;
                            //return ( OPTIMIZE_DONE | OPTIMIZE_RESET ) ;
                            _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                            return ( i | OPTIMIZE_RESET ) ;
                        }
                        return ( 0 ) ;
                    }
#endif                    
                    case ( OP_DIVIDE << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_STORE ): // "!" - store
                    case ( OP_ORDERED << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_STORE ): // "!" - store
                    case ( OP_UNORDERED << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_STORE ): // "!" - store
                    case ( OP_LOGIC << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_STORE ): // "!" - store
                    {
                        if ( optInfo->O_two->StackPushRegisterCode )
                        {
                            SetHere ( optInfo->O_two->StackPushRegisterCode ) ; // leave optInfo->O_two value in R8 we don't need to push it
                            if ( ! ( optInfo->O_one->CAttribute & REGISTER_VARIABLE ) )// this logic may need to be refined but it works with our C.factorial 
                            {
                                _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                                Set_SCA ( 0 ) ;
                                _Compile_Move ( MEM, R8D, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp ) ;
                            }
                            return ( OPTIMIZE_DONE | OPTIMIZE_RESET ) ;
                        }
                        else return 0 ;
                    }
                    case ( OP_FETCH << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_STORE ): // "!" - store
                    {
                        if ( optInfo->O_two->StackPushRegisterCode )
                        {
                            SetHere ( optInfo->O_two->StackPushRegisterCode ) ; //Coding ) ;
                            _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                            Set_SCA ( 0 ) ;
                            _Compile_Move ( MEM, R8D, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp ) ;
                            return ( OPTIMIZE_DONE | OPTIMIZE_RESET ) ; // reset after '=' or store 
                        }
                        else return 0 ;
                    }
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_UNORDERED ):
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_ORDERED ):
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_DIVIDE ):
#if 1                        
                    {
                        SetHere ( optInfo->O_two->Coding ) ;
                        if ( compiler->NumberOfRegisterVariables )
                        {
                            _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                            _GetRmDispImm ( optInfo, optInfo->O_two, - 1 ) ;
                            optInfo->Optimize_Dest_RegOrMem = MEM ;
                        }
                        else
                        {
                            if ( optInfo->O_two->CAttribute & REGISTER_VARIABLE ) _GetRmDispImm ( optInfo, optInfo->O_two, - 1 ) ;
                            else
                            {
                                _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_two, R8D ) ;
                            }
                            _GetRmDispImm ( optInfo, optInfo->O_one, R9D ) ;
                            //_Compile_VarLitObj_RValue_To_Reg ( optInfo->O_one, ECX ) ;
                            optInfo->Optimize_Dest_RegOrMem = REG ;
                            optInfo->Optimize_Mod = REG ;
                            optInfo->Optimize_Reg = R8D ; // shouldn't need this but some code still references this as the rm ?? fix ??
                        }
                        return i ;
                    }
#endif                    
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_LC << ( 1 * O_BITS ) | OP_LOGIC ):
                    {
                        SetHere ( optInfo->O_two->Coding ) ;
                        _GetRmDispImm ( optInfo, optInfo->O_two, - 1 ) ;
                        _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                        optInfo->Optimize_Dest_RegOrMem = MEM ;
                        return i ;
                    }
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_LOGIC ):
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_UNORDERED ):
                    {
                        if ( GetState ( _Context_, C_SYNTAX ) )
                        {
                            SetHere ( optInfo->O_two->Coding ) ;
                            if ( ( optInfo->O_two->CAttribute & REGISTER_VARIABLE ) && ( optInfo->O_one->CAttribute & REGISTER_VARIABLE ) )
                            {
                                optInfo->Optimize_DstReg = optInfo->O_two->RegToUse ;
                                optInfo->Optimize_SrcReg = optInfo->O_one->RegToUse ;
                                _GetRmDispImm ( optInfo, optInfo->O_one, R8D ) ;
                            }
                            else
                            {
                                _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_two, R8D ) ; //optInfo->O_two->RegToUse ? optInfo->O_two->RegToUse : R8 ) ;
                                //_GetRmDispImm ( optInfo, optInfo->O_two, - 1 ) ;
                                _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                                optInfo->Optimize_Dest_RegOrMem = REG ;
                            }
                            return i ;
                        }
                        //else continue ;
                    }
                        // C Syntax :: ...
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_ORDERED ):
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_DIVIDE ):
                        //case ( OP_VAR << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_UNORDERED ):
                    {
                        if ( GetState ( _Context_, C_SYNTAX ) )
                        {
                            SetHere ( optInfo->O_two->Coding ) ;
                            if ( compiler->NumberOfRegisterVariables )
                            {
                                optInfo->Optimize_DstReg = optInfo->O_two->RegToUse ;
                                optInfo->Optimize_SrcReg = optInfo->O_one->RegToUse ;
                                _GetRmDispImm ( optInfo, optInfo->O_one, R8D ) ;
                            }
                            else
                            {
                                _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_two, R8D ) ;
                                //_GetRmDispImm ( optInfo, optInfo->O_two, - 1 ) ;
                                _GetRmDispImm ( optInfo, optInfo->O_one, - 1 ) ;
                                optInfo->Optimize_Dest_RegOrMem = REG ;
                            }
                            return i ;
                        }
                        else continue ;
                    }
                    case ( OP_LC << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_LOGIC ):
                    case ( OP_LC << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_DIVIDE ):
                    case ( OP_LC << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_UNORDERED ):
                    case ( OP_LC << ( 2 * O_BITS ) | OP_VAR << ( 1 * O_BITS ) | OP_ORDERED ):
                    {
                        if ( GetState ( _Context_, C_SYNTAX ) )
                        {
                            SetHere ( optInfo->O_two->Coding ) ;
                            _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_one, R9D ) ;
                            //_GetRmDispImm ( optInfo, optInfo->O_two, - 1 ) ;
                            _GetRmDispImm ( optInfo, optInfo->O_two, - 1 ) ;
                            //_Compile_VarConstOrLit_LValue_To_Reg ( optInfo->O_two, R8)
                            optInfo->Optimize_Mod = REG ;
                            optInfo->Optimize_Dest_RegOrMem = REG ;
                            return i ;
                        }
                        else continue ;
                    }
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_FETCH ):
                    {
                        if ( ! ( optInfo->O_two->CAttribute & REGISTER_VARIABLE ) )
                        {
                            SetHere ( optInfo->O_two->Coding ) ;
                            _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_two, R8D ) ;
                            _Compile_Move_Rm_To_Reg ( R8D, R8D, 0 ) ;
                            _Word_CompileAndRecord_PushReg ( optInfo->O_two, R8D ) ;
                            return OPTIMIZE_DONE ;
                            //optInfo->O_zero->StackPushRegisterCode = optInfo->O_one->StackPushRegisterCode ; // used in further optimization
                        }
                        return ( OPTIMIZE_DONE | OPTIMIZE_DONT_RESET ) ;
                    }
                    case ( OP_VAR << ( 1 * O_BITS ) | OP_FETCH ):
                    {
                        if ( ! ( optInfo->O_one->CAttribute & REGISTER_VARIABLE ) )
                        {
                            SetHere ( optInfo->O_one->Coding ) ;
                            _Compile_GetVarLitObj_RValue_To_Reg ( optInfo->O_one, R8D ) ;
                            _Word_CompileAndRecord_PushReg ( optInfo->O_one, R8D ) ;
                            optInfo->O_zero->StackPushRegisterCode = optInfo->O_one->StackPushRegisterCode ; // used in further optimization
                        }
                        return ( OPTIMIZE_DONE | OPTIMIZE_DONT_RESET ) ;
                    }
                    case ( OP_VAR << ( 2 * O_BITS ) | OP_FETCH << ( 1 * O_BITS ) | OP_DUP ):
                    {
                        if ( optInfo->O_two->StackPushRegisterCode )
                        {
                            SetHere ( optInfo->O_two->StackPushRegisterCode ) ;
                            Compile_ADDI ( REG, DSP, 0, 2 * CELL, 0 ) ;
                            _Compile_Move_Reg_To_StackN ( DSP, 0, R8D ) ;
                            _Compile_Move_Reg_To_StackN ( DSP, - 1, R8D ) ;
                            return ( OPTIMIZE_DONE ) ;
                        }
                    }
                    case ( OP_LOGIC << ( 1 * O_BITS ) | OP_DUP ):
                    case ( OP_DIVIDE << ( 1 * O_BITS ) | OP_DUP ):
                    case ( OP_UNORDERED << ( 1 * O_BITS ) | OP_DUP ):
                    case ( OP_ORDERED << ( 1 * O_BITS ) | OP_DUP ):
                    case ( OP_LC << ( 1 * O_BITS ) | OP_DUP ):
                    {
                        if ( optInfo->O_one->StackPushRegisterCode )
                        {
                            SetHere ( optInfo->O_one->StackPushRegisterCode ) ;
                            Compile_ADDI ( REG, DSP, 0, 2 * CELL, 0 ) ;
                            _Compile_Move_Reg_To_StackN ( DSP, 0, R8D ) ;
                            _Compile_Move_Reg_To_StackN ( DSP, - 1, R8D ) ;
                            return ( OPTIMIZE_DONE ) ;
                        }
                    }
                    default: continue ;
                }
            }
        }
    }
    return i ;
}

int64
CheckOptimize ( Compiler * compiler, int64 maxOperands )
{
    int64 rtrn = 0 ;
    if ( GetState ( _CfrTil_, OPTIMIZE_ON ) )
    {
        SetState ( _CfrTil_, IN_OPTIMIZER, true ) ;
        d0 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( ( byte* ) "\nCheckOptimize : before optimize :" ) ) ;
        rtrn = _CheckOptimizeOperands ( compiler, maxOperands ) ;
        if ( ! ( rtrn & ( OPTIMIZE_DONE ) ) ) Set_SCA ( 0 ) ;
        if ( ( rtrn & OPTIMIZE_RESET ) )
        {
            if ( ( ! Compiling ) && ( ! IsSourceCodeOn ) )
            {
                d0 ( Compiler_Show_WordList ( ( byte* ) _ReadLiner_->InputLineString ) ) ;
                if ( ! IsSourceCodeOn ) DLList_RecycleWordList ( compiler->WordList ) ; //dllist_Map ( compiler->WordList, ( MapFunction0 ) CheckRecycleWord ) ;
                //List_Init ( compiler->WordList ) ;
            }
            Set_SCA ( 0 ) ;
        }
        d0 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( ( byte* ) "\nCheckOptimize : after optimize :" ) ) ;
        SetState ( _CfrTil_, IN_OPTIMIZER, false ) ;
        SetState ( _Context_, ADDRESS_OF_MODE, false ) ;
    }
    return rtrn ;
}


