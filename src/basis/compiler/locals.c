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
 * a    saved pre fp = r15 //edi           fp [  0 ]  <--- new fp - FP points here > == r15[0] //edi[0] <pre dsp [ 1] --->
 * m                                                  <--- stack frame size = number of locals + 1 (fp) + 1 (esp)  --->
 * e <-----------------------------------------------
 *      "parameter variable"      slot 1   fp [ -1 ]   --- already on the "locals function" incoming stack     <pre dsp [ 0] == pre esi [0]> 
 *      "parameter variable"      slot 2   fp [ -2 ]   --- already on the "locals function" incoming stack     <pre dsp [-1]>
 *      "parameter variable"      slot x   fp [-etc]   --- already on the "locals function" incoming stack     <pre dsp [-2]>
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *     lower memory addresses  on DataStack - referenced by DSP
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *                      notations : fp = FP = Fp   = R15 //32 bit = EDI 
 *                                  sp = DSP = Dsp = R14 //32 bit = ESI
 */

// fp offset : assumes we have a frame 

Word *
_Compiler_LocalWord ( Compiler * compiler, byte * name, int64 ctype, int64 ctype2, int64 ltype, int64 allocType ) // svf : flag - whether stack variables are in the frame
{
    Word *word ;
    word = _DObject_New ( name, 0, ( ctype | IMMEDIATE ), ctype2, ltype, LOCAL_VARIABLE, ( byte* ) _DataObject_Run, 0, 1, 0, allocType ) ; //COMPILER_TEMP ) ; //allocType ) ; //SESSION ) ; //COMPILER_TEMP ) ;
    compiler->NumberOfVariables ++ ;
    if ( ctype & REGISTER_VARIABLE )
    {
        compiler->NumberOfRegisterVariables ++ ;
        if ( ctype & LOCAL_VARIABLE )
        {
            word->Index = ++ compiler->NumberOfRegisterLocals ;
            ++ compiler->NumberOfLocals ;
        }
        else
        {
            word->Index = ++ compiler->NumberOfArgs ;
            ++ compiler->NumberOfRegisterArgs ;
        }
    }
    else
    {
        compiler->NumberOfNonRegisterVariables ++ ;
        if ( ctype & LOCAL_VARIABLE )
        {
            word->Index = ++ compiler->NumberOfNonRegisterLocals ;
            ++ compiler->NumberOfLocals ;
        }
        else
        {
            word->Index = ++ compiler->NumberOfArgs ;
            ++ compiler->NumberOfNonRegisterArgs ;
        }
    }
    return word ;
}

int64
_ParameterVarOffset ( Compiler * compiler, Word * word, Boolean frameFlag )
{
    //int64 offset = - ( ( ( word->CAttribute & REGISTER_VARIABLE ) ? compiler->NumberOfArgs : compiler->NumberOfNonRegisterArgs ) 
    //    - word->Index + ( frameFlag ? 1 : 0 ) ) ;
    int64 offset = - ( compiler->NumberOfArgs - word->Index + ( frameFlag ? 1 : 0 ) ) ;
    //int64 offset = - word->Index ;
    return offset ;
}

int64
ParameterVarOffset ( Compiler * compiler, Word * word )
{
    int64 offset = _ParameterVarOffset ( compiler, word, Compiler_IsFrameNecessary ( compiler ) ) ;
    return offset ;
}

inline int64
LocalVar_FpOffset ( Word * word )
{
    return word->Index ;
}

inline int64
LocalOrParameterVarOffset ( Word * word )
{
    return ( ( word->CAttribute & LOCAL_VARIABLE ) ? ( LocalVar_FpOffset ( word ) ) : ( ParameterVarOffset ( _Compiler_, word ) ) ) ;
}

inline int64
LocalVarIndex_Disp ( int64 i )
{
    return ( ( i ) * CELL ) ;
}

inline int64
LocalVarIndex_WordDisp ( Word * word )
{
    return ( ( word->CAttribute & LOCAL_VARIABLE ) ? ( LocalVar_FpOffset ( word ) * CELL_SIZE ) : ( ParameterVarOffset ( _Compiler_, word ) * CELL_SIZE ) ) ;
}

Boolean
Compiler_IsFrameNecessary ( Compiler * compiler )
{
    return ( compiler->NumberOfNonRegisterLocals || compiler->NumberOfNonRegisterArgs ) ;
}

void
Compile_Init_RegisterParamenterVariables ( Compiler * compiler )
{
    dllist * list = compiler->RegisterParameterList ;
    dlnode * node ;
    Boolean frameFlag = Compiler_IsFrameNecessary ( compiler ) ; // compiler->NumberOfNonRegisterLocals ; 
    for ( node = dllist_First ( ( dllist* ) list ) ; node ; node = dlnode_Next ( node ) ) //, i -- )
    {
        Word * word = ( Word* ) dobject_Get_M_Slot ( ( dobject* ) node, SCN_T_WORD ) ;
        _Compile_Move_StackN_To_Reg ( word->RegToUse, ( frameFlag ? FP : DSP ), _ParameterVarOffset ( compiler, word, frameFlag ) ) ;
    }
}

void
_Compiler_AddLocalFrame ( Compiler * compiler )
{
    _Compile_Move_Reg_To_StackN ( DSP, 1, FP ) ; // save pre fp
    _Compile_LEA ( FP, DSP, 0, LocalVarIndex_Disp ( 1 ) ) ; // set new fp
    Compile_ADDI ( REG, DSP, 0, 1 * CELL, INT32_SIZE ) ; // 1 : fp - add stack frame -- this value is going to be reset 
    compiler->FrameSizeCellOffset = ( int64* ) ( Here - INT32_SIZE ) ; // in case we have to add to the framesize with nested locals
    d0 ( if ( Is_DebugOn ) Compile_Call_TestRSP ( ( byte* ) CfrTil_Debugger_Locals_Show ) ) ;
}

void
Compiler_SetLocalsFrameSize_AtItsCellOffset ( Compiler * compiler )
{
    int64 size = compiler->NumberOfNonRegisterLocals ;
    int64 fsize = compiler->LocalsFrameSize = ( ( ( size <= 0 ? 0 : size ) + 1 ) * CELL ) ; //1 : the frame pointer 
    if ( fsize ) *( ( int32* ) ( compiler->FrameSizeCellOffset ) ) = fsize ; //compiler->LocalsFrameSize ; //+ ( IsSourceCodeOn ? 8 : 0 ) ;
}

// _Compiler_RemoveLocalFrame : the logic definitely needs to be simplified???

void
_Compiler_RemoveLocalFrame ( Compiler * compiler )
{
    int64 parameterVarsSubAmount = 0 ;
    Boolean returnValueFlag, already = false ;
    Word * one ;
    if ( GetState ( compiler, LISP_MODE ) ) one = 0 ;
    else one = WordStack ( 1 ) ;
    returnValueFlag = ( Context_CurrentWord ( )->CAttribute & C_RETURN ) || ( GetState ( compiler, RETURN_TOS | RETURN_ACCUM ) ) || compiler->ReturnVariableWord ;
    if ( compiler->NumberOfArgs ) parameterVarsSubAmount = ( compiler->NumberOfArgs - returnValueFlag ) * CELL ;
    if ( ( ! returnValueFlag ) && GetState ( _Context_, C_SYNTAX ) && ( _CfrTil_->CurrentWordBeingCompiled->S_ContainingNamespace ) &&
        ( ! String_Equal ( _CfrTil_->CurrentWordBeingCompiled->S_ContainingNamespace->Name, "void" ) ) )
        SetState ( compiler, RETURN_TOS, true ) ;
    // nb. these variables have no lasting lvalue - they exist on the stack - we can only return their rvalue
    if ( compiler->ReturnVariableWord ) Compile_GetVarLitObj_RValue_To_Reg ( compiler->ReturnVariableWord, ACC ) ;
    else if ( GetState ( compiler, RETURN_TOS ) || ( compiler->NumberOfNonRegisterArgs && returnValueFlag && ( ! GetState ( compiler, RETURN_ACCUM ) ) ) )
    {
        if ( one && one->StackPushRegisterCode )
        {
            already = true ;
            SetHere ( one->StackPushRegisterCode, 1 ) ;
        }
        else Compile_Move_TOS_To_ACCUM ( DSP ) ; // save TOS to ACCUM so we can set return it as TOS below
    }
    if ( compiler->NumberOfNonRegisterLocals || compiler->NumberOfNonRegisterArgs )
    {
        // remove the incoming parameters -- like in C
        _Compile_LEA ( DSP, FP, 0, - LocalVarIndex_Disp ( 1 ) ) ; // restore sp - release locals stack frame
        _Compile_Move_StackN_To_Reg ( FP, DSP, 1 ) ; // restore the saved pre fp - cf AddLocalsFrame
    }
    if ( ( parameterVarsSubAmount > 0 ) && ( ! IsWordRecursive ) ) Compile_SUBI ( REG, DSP, 0, parameterVarsSubAmount, 0 ) ; // remove stack variables
    else if ( ! already )
    {
        // add a place on the stack for return value
        if ( parameterVarsSubAmount < 0 ) Compile_ADDI ( REG, DSP, 0, abs ( parameterVarsSubAmount ), 0 ) ;
        else if ( ( ! compiler->NumberOfNonRegisterArgs ) && ( parameterVarsSubAmount == 0 ) && GetState ( compiler, RETURN_TOS ) ) //&& ( ! IsWordRecursive ) ) 
            Compile_ADDI ( REG, DSP, 0, CELL, 0 ) ;
    }
    if ( compiler->ReturnVariableWord )
    {
        if ( compiler->ReturnVariableWord->CAttribute & REGISTER_VARIABLE ) _Compile_Move_Reg_To_StackN ( DSP, 0, compiler->ReturnVariableWord->RegToUse ) ;
    }
    // nb : stack was already adjusted accordingly for this above by reducing the SUBI subAmount or adding if there weren't any parameter variables
    if ( ( returnValueFlag || IsWordRecursive ) && ( ! GetState ( compiler, RETURN_ACCUM ) ) ) Compile_Move_ACC_To_TOS ( DSP ) ;
}

void
Compiler_RemoveLocalFrame ( Compiler * compiler )
{
    int64 parameterVarsSubAmount = 0 ;
    Boolean returnValueFlag, already = false ;
    Word * one ;
    if ( GetState ( compiler, LISP_MODE ) ) one = 0 ;
    else one = WordStack ( 1 ) ;
    WordStack_SCHCPUSCA ( 0, 1 ) ;
    Compiler_SetLocalsFrameSize_AtItsCellOffset ( compiler ) ;
    _Compiler_RemoveLocalFrame ( compiler ) ;
}

void
CfrTil_FinalizeBlocks ( BlockInfo * bi )
{
    Compiler * compiler = _Context_->Compiler0 ;
    WordStack_SCHCPUSCA ( 0, 0 ) ;
    _CfrTil_InstallGotoCallPoints_Keyed ( bi, GI_RETURN ) ;
    if ( Compiler_IsFrameNecessary ( compiler ) ) 
    {
        Compiler_RemoveLocalFrame ( compiler ) ;
        bi->bp_First = bi->LocalFrameStart ; // default 
    }
    else 
    {
        if ( compiler->NumberOfRegisterVariables ) _Compiler_RemoveLocalFrame ( compiler ) ;
        bi->bp_First = bi->AfterLocalFrame ;
    }
}

void
CfrTil_LocalsAndStackVariablesBegin ( )
{
    _CfrTil_Parse_LocalsAndStackVariables ( 1, 0, 0, 0, 0, false ) ;
}

void
CfrTil_LocalVariablesBegin ( )
{
    _CfrTil_Parse_LocalsAndStackVariables ( 0, 0, 0, _Compiler_->LocalsCompilingNamespacesStack, 0, false ) ;
}
