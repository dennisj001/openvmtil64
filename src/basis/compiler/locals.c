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

int64
ParameterVar_Offset ( Word * word )
{
    int64 offset ;
    offset = - ( _Compiler_->NumberOfArgs - word->Index + ( Compiler_IsFrameNecessary ( _Compiler_ ) ? 1 : 0 ) ) ;
    //offset = - word->Index ;
    return offset ;
}

inline int64
LocalVar_FpOffset ( Word * word )
{
    return word->Index ;
}

inline int64
LocalVar_Disp ( Word * word )
{
    return ( word->Index * CELL ) ;
}

inline int64
ParameterVar_Disp ( Word * word )
{
    return ( ParameterVar_Offset ( word ) * CELL ) ;
}

inline int64
LocalOrParameterVar_Offset ( Word * word )
{
    return ( ( word->CAttribute & LOCAL_VARIABLE ) ? ( LocalVar_FpOffset ( word ) ) : ( ParameterVar_Offset ( word ) ) ) ;
}

inline int64
LocalOrParameterVar_Disp ( Word * word )
{
    int64 offset = LocalOrParameterVar_Offset ( word ) ;
    return ( offset * CELL_SIZE ) ;
}

Word *
_Compiler_LocalWord ( Compiler * compiler, byte * name, int64 ctype, int64 ctype2, int64 ltype, int64 allocType )
{
    Word *word = _DObject_New ( name, 0, ( ctype | IMMEDIATE ), ctype2, ltype, LOCAL_VARIABLE, ( byte* ) _DataObject_Run, 0, 1, 0, allocType ) ;
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
    word->CAttribute2 |= RECYCLABLE_LOCAL ;
    return word ;
}

void
Compiler_LocalsNamespace_New ( Compiler * compiler )
{
    Namespace_FindOrNew_Local ( compiler->LocalsCompilingNamespacesStack, 1 ) ;
    Finder_SetQualifyingNamespace ( _Finder_, 0 ) ;
}

Word *
Compiler_LocalWord ( Compiler * compiler, byte * name, int64 ctype, int64 ctype2, int64 ltype, int64 allocType )
{
    if ( ( ! GetState ( compiler, DOING_C_TYPE ) && ( ! GetState ( _LC_, LC_BLOCK_COMPILE ) ) ) ) Compiler_LocalsNamespace_New ( compiler ) ;
    Word * word = _Compiler_LocalWord ( compiler, name, ctype, ctype2, ltype, allocType ) ;
    return word ;
}

//nb. correct only if Compiling !!

inline Boolean
Compiler_IsFrameNecessary ( Compiler * compiler )
{
    return ( ( compiler->NumberOfNonRegisterLocals || compiler->NumberOfNonRegisterArgs ) ? true : false ) ;
}

void
Compile_Init_LocalRegisterParamenterVariables ( Compiler * compiler )
{
    Compiler_WordStack_SCHCPUSCA ( 0, 0 ) ;
    dllist * list = compiler->RegisterParameterList ;
    dlnode * node ;
    Boolean frameFlag = Compiler_IsFrameNecessary ( compiler ) ; // compiler->NumberOfNonRegisterLocals ; 
    for ( node = dllist_First ( ( dllist* ) list ) ; node ; node = dlnode_Next ( node ) ) //, i -- )
    {
        Word * word = ( Word* ) dobject_Get_M_Slot ( ( dobject* ) node, SCN_T_WORD ) ;
        _Compile_Move_StackN_To_Reg ( word->RegToUse, ( frameFlag ? FP : DSP ), ParameterVar_Offset ( word ) ) ;
    }
}

void
_Compiler_AddLocalFrame ( Compiler * compiler )
{
    Compiler_WordStack_SCHCPUSCA ( 0, 0 ) ;
    _Compile_Move_Reg_To_StackN ( DSP, 1, FP ) ; // save pre fp
    _Compile_LEA ( FP, DSP, 0, CELL ) ; // set new fp
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

// Compiler_RemoveLocalFrame : the logic definitely needs to be simplified???
// Compiler_RemoveLocalFrame has "organically evolved" it need to be logically simplified??

void
Compiler_RemoveLocalFrame ( Compiler * compiler )
{
    if ( ! GetState ( _Compiler_, LISP_MODE ) ) Compiler_WordStack_SCHCPUSCA ( 0, 0 ) ;
    int64 parameterVarsSubAmount = 0 ;
    Boolean returnValueFlag, already = false ;
    returnValueFlag = ( Context_CurrentWord ( )->CAttribute & C_RETURN ) || ( GetState ( compiler, RETURN_TOS | RETURN_ACCUM ) ) || compiler->ReturnVariableWord ;
    if ( compiler->NumberOfArgs ) parameterVarsSubAmount = ( compiler->NumberOfArgs - returnValueFlag ) * CELL ;
#if 0    
    if ( ( ! returnValueFlag ) && GetState ( _Context_, C_SYNTAX ) && ( _CfrTil_->CurrentWordBeingCompiled->S_ContainingNamespace ) &&
        ( ! String_Equal ( _CfrTil_->CurrentWordBeingCompiled->S_ContainingNamespace->Name, "void" ) ) )
    {
        SetState ( compiler, RETURN_TOS, true ) ;
    }
#endif    
    // nb. these variables have no lasting lvalue - they exist on the stack - we can only return their rvalue
    if ( compiler->ReturnVariableWord )
    {
        if ( ! ( compiler->ReturnVariableWord->CAttribute & REGISTER_VARIABLE ) ) Compile_GetVarLitObj_RValue_To_Reg ( compiler->ReturnVariableWord, ACC ) ; // need to copy because ReturnVariableWord may have been used within the word already
    }
    else if ( GetState ( compiler, RETURN_TOS ) || ( compiler->NumberOfNonRegisterArgs && returnValueFlag && ( ! GetState ( compiler, RETURN_ACCUM ) ) ) )
    {
        Word * one = 0 ;
        if ( ! GetState ( compiler, LISP_MODE ) ) one = WordStack ( 1 ) ;
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
        if ( ! GetState ( _Compiler_, LISP_MODE ) ) Compiler_WordStack_SCHCPUSCA ( 0, 0 ) ;
        _Compile_LEA ( DSP, FP, 0, - CELL ) ; // restore sp - release locals stack frame
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
    // nb : stack was already adjusted accordingly for this above by reducing the SUBI subAmount or adding if there weren't any parameter variables
    if ( returnValueFlag || ( IsWordRecursive && ( ! GetState ( compiler, RETURN_ACCUM ) ) ) )
    {
        if ( compiler->ReturnVariableWord )
        {
            Compiler_Word_SCHCPUSCA ( compiler->ReturnVariableWord, 0 ) ;
            if ( compiler->ReturnVariableWord->CAttribute & REGISTER_VARIABLE )
            {
                _Compile_Move_Reg_To_StackN ( DSP, 0, compiler->ReturnVariableWord->RegToUse ) ;
                return ;
            }
        }
        Compile_Move_ACC_To_TOS ( DSP ) ;
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
    _CfrTil_Parse_LocalsAndStackVariables ( 0, 0, 0, 0, 0, false ) ;
}

