#include "../../include/cfrtil64.h"

void
_Compile_Call_Acc ( void )
{
    //_Compile_Group5 ( int64 code, int64 mod, int64 rm, int64 sib, int64 disp, int64 size )
    _Compile_Group5 ( CALL, 3, 0, 0, 0, 0 ) ;
}

void
Compile_DataStack_PopAndCall ( void )
{
    Compile_Pop_ToAcc_AndCall ( DSP ) ;
}

void
Compile_Call_From_C_Address ( uint64 bptr )
{
    _Compile_GetRValue_FromLValue_ToReg ( ACC, ( byte* ) bptr ) ;
    //_Compile_MoveImm_To_Reg ( ACC, ( uint64 ) bptr, CELL_SIZE ) ;
    _Compile_Call_Acc ( ) ;

}

// c ffi : foreign function interface

void
Compile_CallCFunctionWithParameter_TestAlignRSP ( byte * cFunction, Word * word )
{
    Compile_MoveImm_To_Reg ( RDI, ( int64 ) word, CELL ) ; // RDI is x64 abi first parameter 
    Compile_Call_ToAddressThruReg_TestAlignRSP ( cFunction, CALL_THRU_REG ) ; // compile call cFunction with RDI value as arg
}

void
Compile_Call_CurrentBlock ( )
{
    Compile_Call_From_C_Address ( ( uint64 ) & _CfrTil_->CurrentBlock ) ;
}

// >R - Rsp to

void
_Compile_RspReg_To ( ) // data stack pop to rsp
{
    Compile_DspPop_RspPush ( ) ;
}

// rdrop

void
_Compile_RspReg_Drop ( )
{
    _Compile_DropN_Rsp ( 1 ) ;
}

// rsp

void
_Compile_RspReg_Get ( )
{
    _Compile_Stack_PushReg ( DSP, RSP ) ;
}

// rsp@

void
_Compile_RspReg_Fetch ( )
{
    Compile_Move_Reg_To_Reg ( ACC, RSP ) ;
    Compile_Move_Rm_To_Reg ( ACC, ACC, 0 ) ;
    _Compile_Stack_PushReg ( DSP, ACC ) ;
}

// r< - r from

void
_Compile_RspReg_From ( )
{
    _Compile_RspReg_Fetch ( ) ;
    _Compile_RspReg_Drop ( ) ;
}

#if 0 // not yet with new store
// Rsp! - Rsp store

void
_Compile_RspReg_Store ( ) // data stack pop to rsp [0] !
{
    _Compile_RspReg_From ( ) ;
    Compile_Store ( _Compiler_ ) ;
}
#endif

Word *
_CfrTil_VariableGet ( Namespace * ns, byte * name )
{
    Word * word = _Finder_FindWord_InOneNamespace ( _Finder_, ns, name ) ;
    return word ;
}

int64
_CfrTil_VariableValueGet ( byte* nameSpace, byte * name )
{
    return _Namespace_VariableValueGet ( Namespace_Find ( nameSpace ), name ) ;
}

#if 1 // new experimental version (890.120.x)

void
_Compile_GetVarLitObj_RValue_To_Reg ( Word * word, int64 reg )
{
    Compiler_SCA_Word_SetCodingHere_And_ClearPreviousUse ( word, 0 ) ;
    if ( word->CAttribute & REGISTER_VARIABLE )
    {
        if ( word->RegToUse == reg ) return ;
        else Compile_Move_Reg_To_Reg ( reg, word->RegToUse ) ;
    }
    else if ( word->CAttribute & ( LOCAL_VARIABLE | PARAMETER_VARIABLE | THIS | T_LISP_SYMBOL ) || ( word->LAttribute & T_LISP_SYMBOL ) )
        //else if ( word->CAttribute & ( LOCAL_VARIABLE | PARAMETER_VARIABLE | T_LISP_SYMBOL ) || ( word->LAttribute & T_LISP_SYMBOL ) )
    {
        if ( word->CAttribute & ( LOCAL_VARIABLE | PARAMETER_VARIABLE | T_LISP_SYMBOL ) || ( word->LAttribute & T_LISP_SYMBOL ) )
            _Compile_Move_StackN_To_Reg ( reg, FP, LocalOrParameterVar_Offset ( word ) ) ;
        else if ( word->CAttribute & ( THIS ) ) _Compile_Move_Literal_Immediate_To_Reg ( reg, ( int64 ) word->W_PtrToValue ) ;
    }
    else if ( word->CAttribute & ( NAMESPACE_VARIABLE ) )
    {
        if ( _Interpreter_->BaseObject ) SetHere ( _Interpreter_->BaseObject->Coding, 1 ) ;
        _Compile_Move_Literal_Immediate_To_Reg ( reg, ( int64 ) word->W_PtrToValue ) ;
        Compile_Move_Rm_To_Reg ( reg, reg, 0 ) ;
    }
    else if ( word->CAttribute & ( OBJECT ) ) _Compile_Move_Literal_Immediate_To_Reg ( reg, ( int64 ) word->W_Value ) ; //( int64 ) word->W_PtrToValue ) ;
    else if ( word->CAttribute & ( LITERAL | CONSTANT ) ) _Compile_Move_Literal_Immediate_To_Reg ( reg, ( int64 ) word->W_Value ) ;
    else if ( word->CAttribute & DOBJECT )
    {
        _CfrTil_Do_DynamicObject_ToReg ( word, reg ) ;
        Compile_Move_Rm_To_Reg ( reg, reg, 0 ) ;
    }
    else if ( word->CAttribute & ( CPRIMITIVE ) ) ; // do nothing here
    else SyntaxError ( QUIT ) ;
}

void
Do_ObjectOffset ( Word * word, int64 reg )
{
    Compiler * compiler = _Context_->Compiler0 ;
    int64 offset = word->AccumulatedOffset ;
    if ( ( offset == 0 ) && GetState ( _CfrTil_, IN_OPTIMIZER ) ) return ;
    else
    {
        Compile_ADDI ( REG, reg, 0, offset, INT32_SIZE ) ; // only a 32 bit offset ??
        compiler->AccumulatedOffsetPointer = ( int32* ) ( Here - INT32_SIZE ) ; // offset will be calculated as we go along by ClassFields and Array accesses
    }
}

void
Compile_GetVarLitObj_RValue_To_Reg ( Word * word, int64 reg )
{
    _Compile_GetVarLitObj_RValue_To_Reg ( word, reg ) ;
    if ( word->CAttribute & ( OBJECT | THIS ) )
    {
        Do_ObjectOffset ( word, reg ) ;
        Compile_Move_Rm_To_Reg ( reg, reg, 0 ) ;
    }
}

// this is not tested for VARIABLE or REGISTER_VARIABLE

void
_Compile_SetVarLitObj_With_Reg ( Word * word, int64 reg, int64 thruReg )
{
    if ( word->CAttribute & REGISTER_VARIABLE )
    {
        if ( word->RegToUse == reg ) return ;
        else Compile_Move_Reg_To_Reg ( word->RegToUse, reg ) ;
    }
    else if ( word->CAttribute & ( LOCAL_VARIABLE | PARAMETER_VARIABLE ) ) _Compile_Move_Reg_To_StackN ( FP, LocalOrParameterVar_Offset ( word ), reg ) ;
    else if ( word->CAttribute & NAMESPACE_VARIABLE ) _Compile_SetAtAddress_WithReg ( ( int64* ) word->W_PtrToValue, reg, thruReg ) ;
}

void
_Compile_GetVarLitObj_LValue_To_Reg ( Word * word, int64 reg )
{
    Compiler_SCA_Word_SetCodingHere_And_ClearPreviousUse ( word, 0 ) ;
    if ( word->CAttribute & REGISTER_VARIABLE )
    {
        if ( word->RegToUse == reg ) return ;
        else Compile_Move_Reg_To_Reg ( reg, word->RegToUse ) ;
    }
        //else if ( ( word->CAttribute & ( OBJECT )  ) ) 
        //_Compile_Move_Literal_Immediate_To_Reg ( reg, ( int64 ) word->W_Value ) ;
    else if ( ( word->CAttribute & ( OBJECT | THIS ) ) )
        _Compile_GetVarLitObj_RValue_To_Reg ( word, reg ) ;
    else if ( word->CAttribute & ( LOCAL_VARIABLE | PARAMETER_VARIABLE ) ) _Compile_LEA ( reg, FP, 0, LocalOrParameterVar_Disp ( word ) ) ;
    else if ( word->CAttribute & ( LITERAL | CONSTANT ) ) _Compile_Move_Literal_Immediate_To_Reg ( reg, ( int64 ) word->W_Value ) ;
    else if ( word->CAttribute & DOBJECT ) _CfrTil_Do_DynamicObject_ToReg ( word, reg ) ;
    else if ( word->CAttribute & NAMESPACE_VARIABLE )
    {
        int64 value ;
        if ( GetState ( _Context_->Compiler0, LC_ARG_PARSING ) || ( GetState ( _Context_, C_SYNTAX ) && ( ! Is_LValue ( _Context_, word ) ) ) )//GetState ( _Context_, C_RHS ) )
        {
            value = ( int64 ) word->W_Value ;
        }
        else value = ( int64 ) word->W_PtrToValue ;
        _Compile_Move_Literal_Immediate_To_Reg ( reg, ( int64 ) value ) ;
    }
    else if ( word->CAttribute & ( CPRIMITIVE ) ) ; // do nothing here
    else SyntaxError ( QUIT ) ;
    if ( word->CAttribute & ( OBJECT | THIS ) ) Do_ObjectOffset ( word, reg ) ;
}

#else //current working(?) version (890.103)

void
_Compile_GetVarLitObj_RValue_To_Reg ( Word * word, int64 reg )
{
    Compiler_SCA_Word_SetCodingHere_And_ClearPreviousUse ( word, 0 ) ;
    if ( word->CAttribute & REGISTER_VARIABLE )
    {
        if ( word->RegToUse == reg ) return ;
        else Compile_Move_Reg_To_Reg ( reg, word->RegToUse ) ;
    }
    else if ( word->CAttribute & ( LOCAL_VARIABLE | PARAMETER_VARIABLE | THIS | T_LISP_SYMBOL ) || ( word->LAttribute & T_LISP_SYMBOL ) )
    {
        _Compile_Move_StackN_To_Reg ( reg, FP, LocalOrParameterVar_Offset ( word ) ) ; // 2 : account for saved fp and return slot
    }
    else if ( word->CAttribute & ( NAMESPACE_VARIABLE | OBJECT ) )
    {
        _Compile_Move_Literal_Immediate_To_Reg ( reg, ( int64 ) word->W_PtrToValue ) ;
        Compile_Move_Rm_To_Reg ( reg, reg, 0 ) ;
    }
    else if ( word->CAttribute & ( LITERAL | CONSTANT ) ) _Compile_Move_Literal_Immediate_To_Reg ( reg, ( int64 ) word->W_Value ) ;
    else if ( word->CAttribute & DOBJECT )
    {
        _CfrTil_Do_DynamicObject_ToReg ( word, reg ) ;
        Compile_Move_Rm_To_Reg ( reg, reg, 0 ) ;
    }
    else if ( word->CAttribute & ( CPRIMITIVE ) ) ; // do nothing here
    else SyntaxError ( QUIT ) ;
}

void
Do_ObjectOffset ( Word * word, int64 reg )
{
    Compiler * compiler = _Context_->Compiler0 ;
    int64 offset = word->AccumulatedOffset ;
    if ( ( offset == 0 ) && GetState ( _CfrTil_, IN_OPTIMIZER ) ) return ;
    else
    {
        Compile_ADDI ( REG, reg, 0, offset, INT32_SIZE ) ; // only a 32 bit offset ??
        compiler->AccumulatedOffsetPointer = ( int32* ) ( Here - INT32_SIZE ) ; // offset will be calculated as we go along by ClassFields and Array accesses
    }
}

void
Compile_GetVarLitObj_RValue_To_Reg ( Word * word, int64 reg )
{
    _Compile_GetVarLitObj_RValue_To_Reg ( word, reg ) ;
    if ( word->CAttribute & ( OBJECT | THIS ) )
    {
        Do_ObjectOffset ( word, reg ) ;
        Compile_Move_Rm_To_Reg ( reg, reg, 0 ) ;
    }
}

// this is not tested for VARIABLE or REGISTER_VARIABLE

void
_Compile_SetVarLitObj_With_Reg ( Word * word, int64 reg, int64 thruReg )
{
    if ( word->CAttribute & REGISTER_VARIABLE )
    {
        if ( word->RegToUse == reg ) return ;
        else Compile_Move_Reg_To_Reg ( word->RegToUse, reg ) ;
    }
    else if ( word->CAttribute & ( LOCAL_VARIABLE | PARAMETER_VARIABLE ) ) _Compile_Move_Reg_To_StackN ( FP, LocalOrParameterVar_Offset ( word ), reg ) ;
    else if ( word->CAttribute & NAMESPACE_VARIABLE ) _Compile_SetAtAddress_WithReg ( ( int64* ) word->W_PtrToValue, reg, thruReg ) ;
}

void
_Compile_GetVarLitObj_LValue_To_Reg ( Word * word, int64 reg )
{
    Compiler_SCA_Word_SetCodingHere_And_ClearPreviousUse ( word, 0 ) ;
    if ( word->CAttribute & REGISTER_VARIABLE )
    {
        if ( word->RegToUse == reg ) return ;
        else Compile_Move_Reg_To_Reg ( reg, word->RegToUse ) ;
    }
    else if ( word->CAttribute & ( OBJECT | THIS ) || ( word->WAttribute & WT_QID ) ) _Compile_GetVarLitObj_RValue_To_Reg ( word, reg ) ;
    else if ( word->CAttribute & ( LOCAL_VARIABLE | PARAMETER_VARIABLE ) ) _Compile_LEA ( reg, FP, 0, LocalOrParameterVar_Disp ( word ) ) ;
    else if ( word->CAttribute & ( LITERAL | CONSTANT ) ) _Compile_Move_Literal_Immediate_To_Reg ( reg, ( int64 ) word->W_Value ) ;
    else if ( word->CAttribute & DOBJECT ) _CfrTil_Do_DynamicObject_ToReg ( word, reg ) ;
    else if ( word->CAttribute & NAMESPACE_VARIABLE )
    {
        int64 value ;
        if ( GetState ( _Context_->Compiler0, LC_ARG_PARSING ) || ( GetState ( _Context_, C_SYNTAX ) && ( ! Is_LValue ( _Context_, word ) ) ) )//GetState ( _Context_, C_RHS ) )
        {
            value = ( int64 ) word->W_Value ;
        }
        else value = ( int64 ) word->W_PtrToValue ;
        _Compile_Move_Literal_Immediate_To_Reg ( reg, ( int64 ) value ) ;
    }
    else if ( word->CAttribute & ( CPRIMITIVE ) ) ; // do nothing here
    else SyntaxError ( QUIT ) ;
    if ( word->CAttribute & ( OBJECT | THIS ) || ( word->WAttribute & WT_QID ) ) Do_ObjectOffset ( word, reg ) ;
}
#endif