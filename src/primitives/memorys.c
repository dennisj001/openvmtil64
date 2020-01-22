#include "../include/cfrtil64.h"

void
CfrTil_Peek ( ) // @
{
    if ( CompileMode ) Compile_Peek ( _Context_->Compiler0, DSP ) ;
    else TOS = * ( int64* ) TOS ;
    //_Context_->Interpreter0->BaseObject = 0 ;
}

// reg -- puts reg value TOS

// peekReg ( reg -- regValue ) //reg : reg number :: returns reg value on top of stack

void
CfrTil_PeekReg ( ) // @
{
    //DBI_ON ;
    ByteArray * svcs = _Q_CodeByteArray, *ba = _CfrTil_->PeekPokeByteArray ;
    _ByteArray_DataClear ( ba ) ;
    Set_CompilerSpace ( ba ) ; // now compile to this space
    Compile_Move_Reg_To_Rm ( DSP, TOS & 0xf, 0, 0 ) ;
    _Compile_Return ( ) ;
    Set_CompilerSpace ( svcs ) ; // now compile to this space
    ( ( VoidFunction ) ba->BA_Data ) ( ) ;
    //DBI_OFF ;
}

// pokeRegWithValue ( lvalue reg -- puts value of reg at lvalue address )

void
CfrTil_PokeRegWithValue ( ) // @
{
    //DBI_ON ;
    uint64 reg = DataStack_Pop ( ) ;
    uint64 value = DataStack_Pop ( ) ;
    ByteArray * svcs = _Q_CodeByteArray, *ba = _CfrTil_->PeekPokeByteArray ;
    _ByteArray_DataClear ( ba ) ;
    Set_CompilerSpace ( ba ) ; // now compile to this space
    Compile_MoveImm ( REG, reg, 0, ( uint64 ) value, CELL ) ;
    _Compile_Return ( ) ;
    Set_CompilerSpace ( svcs ) ; // now compile to this space
    ( ( VoidFunction ) ba->BA_Data ) ( ) ;
    //DBI_OFF ;
}

// pokeRegAtAddress ( address, reg -- )

void
CfrTil_PokeRegAtAddress ( ) // @
{
    uint64 reg = DataStack_Pop ( ) ;
    uint64 address = DataStack_Pop ( ) ;
    ByteArray * svcs = _Q_CodeByteArray, *ba = _CfrTil_->PeekPokeByteArray ;
    _ByteArray_Init ( ba ) ;
    Set_CompilerSpace ( ba ) ; // now compile to this space
    _Compile_PushReg ( ACC ) ;
    Compile_MoveImm ( REG, ACC, 0, ( uint64 ) address, CELL ) ;
    Compile_Move_Reg_To_Rm ( ACC, reg, 0, 0 ) ;
    _Compile_PopToReg ( ACC ) ;
    _Compile_Return ( ) ;
    Set_CompilerSpace ( svcs ) ; // reset compiler space pointer
    ( ( VoidFunction ) ba->BA_Data ) ( ) ;
}

void
_CfrTil_Move ( int64 * address, int64 value, int64 lvalueSize )
{
    //int64 lvalueSize = lvalueWord->ObjectByteSize ; //, rvalueSize = rvalueWord->ObjectByteSize ;
    switch ( lvalueSize )
    {
        case 1:
        {
            if ( value > 255 )
            {
                Error ( "\nType Error", "value is greater than 255 - sizeof (byte)", QUIT ) ;
            }
            else * ( byte* ) address = ( byte ) value ;
            break ;
        }
        case 2:
        {
            if ( value > 65535 )
            {
                Error ( "\nType Error", "value is greater than 65535 - sizeof (int16)", QUIT ) ;
            }
            else * ( int16* ) address = ( int16 ) value ;
            break ;
        }
        case 4:
        {
            if ( value > 2147483647 )
            {
                Error ( "\nType Error", "value is greater than 2147483647 - sizeof (int32)", QUIT ) ;
            }
            else * ( int32* ) address = ( int32 ) value ;
            break ;
        }
        case 8:
        default:
        {
            * ( int64 * ) address = ( int64 ) value ;
            break ;
        }
    }
}
// ( addr n -- ) // (*addr) = n

int
Word_LvalueObjectByteSize ( Word * lvalueWord, Word * rValueWord ) // = 
{
    return (( rValueWord->Size == 8 ) || ( lvalueWord->W_ObjectAttributes & (BIGNUM | REGISTER_VARIABLE) ) 
        || ( Namespace_IsUsing ( ( byte* ) "BigNum" ) ) ) ? ( sizeof (int64 ) ) : lvalueWord->ObjectByteSize ? lvalueWord->ObjectByteSize : ( sizeof (int64 ) ) ;
}

void
CfrTil_Poke ( ) // = 
{
    Word * lvalueWord = TWS ( - 1 ), *rvalueWord = TWS ( 0 ) ;
    int64 lvalueSize = Word_LvalueObjectByteSize ( lvalueWord, rvalueWord ) ;
    //if ( ! _TypeMismatch_CheckError_Print ( lvalueWord, rvalueWord, 1 ) )
    {
        if ( CompileMode ) Compile_Poke ( _Context_->Compiler0, lvalueSize ) ;
        else
        {
            _CfrTil_Move ( ( int64 * ) NOS, TOS, lvalueSize ) ;
            _Dsp_ -= 2 ;
        }
    }
}

void
CfrTil_AtEqual ( ) // !
{
    Word * lvalueWord = TWS ( 0 ), *rvalueWord = TWS ( -1 )  ;
    //Word * lvalueWord = TWS ( - 1 ), *rvalueWord = TWS ( 0 ) ;
    int64 lvalueSize = Word_LvalueObjectByteSize ( lvalueWord, rvalueWord ) ;
    //if ( ! _TypeMismatch_CheckError_Print ( lvalueWord, rvalueWord, 1 ) )
    {
        if ( CompileMode ) Compile_AtEqual ( DSP ) ;
        else
        {
            _CfrTil_Move ( ( int64 * ) NOS, * ( int64* ) TOS, lvalueSize ) ;
            _Dsp_ -= 2 ;
        }
    }
}

// ( n addr -- ) // (*addr) = n

void
CfrTil_Store ( ) // !
{
    Word * lvalueWord = TWS ( 0 ), *rvalueWord = TWS ( -1 )  ;
    int64 lvalueSize = Word_LvalueObjectByteSize ( lvalueWord, rvalueWord ) ;
    //if ( ! _TypeMismatch_CheckError_Print ( lvalueWord, rvalueWord, 1 ) )
    {
        if ( CompileMode ) Compile_Store ( _Context_->Compiler0, Word_LvalueObjectByteSize ( lvalueWord, rvalueWord ) ) ;
        else
        {
            _CfrTil_Move ( ( int64 * ) TOS, NOS, lvalueSize ) ;
            _Dsp_ -= 2 ;
        }
    }
}


