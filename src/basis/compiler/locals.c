#include "../../include/cfrtil64.h"

// ?? is the frame pointer needed ?? 
// remember LocalsStack is not pushed or popped so ...

/* ------------------------------------------------------
 *     a Locals Stack Frame on the DataStack - referenced by DSP
 * ------------------------------------------------------
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *     higher memory adresses -- nb. reverse from intel push/pop where push moves esp to a lower memory address and pop moves esp to a higher memory address. This seemed more intuitive.
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * s <------------------------< new DSP - dsp [ n+1|n+2]   --- used by the new function
 * t           "saved esp"        slot n+1 fp [ n+1]   --- with 'return' function
 * a    "local variable n"        slot n   fp [  n ]
 * c    "local variable 3"        slot 3   fp [  3 ]
 * k    "local variable 2"        slot 2   fp [  2 ]
 *      "local variable 1"        slot 1   fp [  1 ]
 * f  -------------------------
 * r
 * a    saved pre fp = edi                 fp [  0 ]  <--- new fp - FP points here > == edi[0]       <pre dsp [ 1] --->
 * m                                                  <--- stack frame size = number of locals + 1 (fp) + 1 (esp)  --->
 * e <-----------------------------------------------
 *      "parameter variable"      slot 1   fp [ -1 ]   --- already on the "locals function" incoming stack     <pre dsp [ 0] == pre esi [0]> 
 *      "parameter variable"      slot 2   fp [ -2 ]   --- already on the "locals function" incoming stack     <pre dsp [-1]>
 *      "parameter variable"      slot x   fp [-etc]   --- already on the "locals function" incoming stack     <pre dsp [-2]>
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *     lower memory addresses  on DataStack - referenced by DSP
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *                      notations : fp = FP = Fp   = EDI 
 *                                  sp = DSP = Dsp = ESI
 */

void
_Compiler_AddLocalFrame ( Compiler * compiler )
{
    _Compile_Move_Reg_To_StackN ( DSP, 1, FP ) ; // save pre fp
    _Compile_LEA ( FP, DSP, 0, LocalVarIndex_Disp ( 1 ) ) ; // set new fp
    Compile_ADDI ( REG, DSP, 0, ( compiler->LocalsFrameSize + 1 ) * CELL, INT32_SIZE ) ; // 1 : fp - add stack frame -- this value is going to be reset 
    compiler->FrameSizeCellOffset = ( int64* ) ( Here - INT32_SIZE ) ; // in case we have to add to the framesize with nested locals
    d0 ( if ( IsSourceCodeOn ) Compile_Call_TestRSP ( ( byte* ) CfrTil_Debugger_Locals_Show ) ) ;
}

void
Compiler_SetLocalsFrameSize_AtItsCellOffset ( Compiler * compiler )
{
    //if ( IsSourceCodeOn ) compiler->NumberOfLocals ++ ; // interesting idea but not fully working yet
    int64 size = compiler->NumberOfLocals - compiler->NumberOfRegisterVariables ;
    int64 fsize = compiler->LocalsFrameSize = ( ( ( size < 0 ? 0 : size ) + 1 ) * CELL ) ; //1 : the frame pointer 
    if ( fsize ) *( ( int32* ) ( compiler->FrameSizeCellOffset ) ) = compiler->LocalsFrameSize ; //+ ( IsSourceCodeOn ? 8 : 0 ) ;
}

void
_Compiler_RemoveLocalFrame ( Compiler * compiler )
{
    int64 parameterVarsSubAmount ;
    Boolean returnValueFlag ;
    Compiler_SetLocalsFrameSize_AtItsCellOffset ( compiler ) ;
    parameterVarsSubAmount = ( ( compiler->NumberOfArgs ) * CELL ) ;
    //parameterVarsSubAmount = ( ( compiler->NumberOfArgs + ( IsSourceCodeOn ? 1 : 0 ) ) * CELL ) ;
    returnValueFlag = ( _Context_->CurrentlyRunningWord->CAttribute & C_RETURN ) || ( GetState ( compiler, RETURN_TOS | RETURN_ACCUM ) ) || IsWordRecursive || compiler->ReturnVariableWord ;
    if ( ( ! returnValueFlag ) && GetState ( _Context_, C_SYNTAX ) && ( compiler->CurrentWordCompiling->S_ContainingNamespace ) && ( ! String_Equal ( compiler->CurrentWordCompiling->S_ContainingNamespace->Name, "void" ) ) )
    {
        SetState ( compiler, RETURN_TOS, true ) ;
    }
    //Word * word = compiler->ReturnVariableWord ;
    if ( compiler->ReturnVariableWord )
    {
        Compile_GetVarLitObj_RValue_To_Reg ( compiler->ReturnVariableWord, ACC ) ; // nb. these variables have no lasting lvalue - they exist on the stack - therefore we can only return there rvalue
    }
    else if ( compiler->NumberOfArgs && returnValueFlag && ( ! GetState ( compiler, RETURN_ACCUM ) ) )
    {
        Compile_Move_TOS_To_ACCUM ( DSP ) ; // save TOS to ACCUM so we can set return it as TOS below
    }
    else if ( GetState ( compiler, RETURN_TOS ) )
    {
        Compile_Move_TOS_To_ACCUM ( DSP ) ;
    }
    //PeepHole_Optimize ( ) ;
    _Compile_LEA ( DSP, FP, 0, - LocalVarIndex_Disp ( 1 ) ) ; // restore sp - release locals stack frame
    _Compile_Move_StackN_To_Reg ( FP, DSP, 1 ) ; // restore the saved pre fp - cf AddLocalsFrame
    // remove the incoming parameters -- like in C
    parameterVarsSubAmount -= ( returnValueFlag ? CELL : 0 ) ; // reduce the subtract amount to make room for the return value
    if ( parameterVarsSubAmount > 0 )
    {
        Compile_SUBI ( REG, DSP, 0, parameterVarsSubAmount, 0 ) ; // remove stack variables
    }
    else if ( parameterVarsSubAmount < 0 )
    {
        Compile_ADDI ( REG, DSP, 0, abs ( parameterVarsSubAmount ), 0 ) ; // add a place on the stack for return value
    }
    if ( returnValueFlag && ( ! GetState ( compiler, RETURN_ACCUM ) ) )
    {
        // nb : stack was already adjusted accordingly for this above by reducing the SUBI subAmount or adding if there weren't any parameter variables
        Compile_Move_ACC_To_TOS ( DSP ) ;
    }
}
// rvalue

void
CfrTil_LocalsAndStackVariablesBegin ( )
{
    _CfrTil_Parse_LocalsAndStackVariables ( 1, 0, 0, 0, 0 ) ;
}

void
CfrTil_LocalVariablesBegin ( )
{
    _CfrTil_Parse_LocalsAndStackVariables ( 0, 0, 0, _Compiler_->LocalsCompilingNamespacesStack, 0 ) ;
}
#if 0

void
CheckAddLocalFrame ( Compiler * compiler )
{
    if ( GetState ( compiler, ADD_FRAME ) )
    {
        _Compiler_AddLocalFrame ( compiler ) ;
        SetState ( compiler, ADD_FRAME, false ) ; // only one frame necessary
    }
}

void
CheckCompileRemoveLocalFrame ( Compiler * compiler )
{
    if ( _Compiler_IsFrameNecessary ( compiler ) )
    {
        _Compiler_RemoveLocalFrame ( compiler ) ;
    }
}

void
_RspReg_Setup ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    if ( compiler->RspSaveOffset ) *( compiler->RspSaveOffset ) = ( compiler->NumberOfLocals + 2 ) * CELL ; // 2 : fp + esp
    if ( compiler->RspRestoreOffset ) *( compiler->RspRestoreOffset ) = ( compiler->NumberOfLocals + 1 ) * CELL ; // 1 : esp - already based on fp
}

#endif
