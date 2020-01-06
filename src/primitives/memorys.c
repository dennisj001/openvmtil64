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
_CfrTil_Move ( int64 * address, int64 value, Word * lvalueWord, Word * rvalueWord ) //int64 lvalueSize, int64 rvalueSize )
{
    //if ( (lvalueSize > 0) && (( value > 2147483647 ) && (rvalueSize > lvalueSize)) ) // for C internal address size may be 0
    int64 lvalueSize = lvalueWord->ObjectByteSize, rvalueSize = rvalueWord->ObjectByteSize ;
    if ( (lvalueSize > 0 ) && (rvalueSize > lvalueSize) ) // for C internal lvalue size may be 0
    {    
        byte * b = Buffer_Data ( _CfrTil_->ScratchB1 ) ;
        sprintf ( ( char* ) b, "Wrong data sizes :: lvalue size == %ld : rvalue size == %ld", lvalueSize, rvalueSize ) ;
        Error ( "\nType Error", b, QUIT ) ;
    }
    else
    {
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
                    Error ( "\nType Error", "value is greater than 65535 - sizeof (int32)", QUIT ) ;
                }
                else * ( int16* ) address = ( int16 ) value ;
                break ;
            }
            case 4:
            {
                if ( value > 2147483647 )
                {
                    Error ( "\nType Error", "value is greater than 4294967295 - sizeof (int32)", QUIT ) ;
                }
                else * ( int32* ) address = ( int32 ) value ;
                break ;
            }
            case 8:
            default:
            {
                * ( int64 *) address = (int64) value ;
                break ;
            }
        }
    }
}
// ( addr n -- ) // (*addr) = n

void
CfrTil_Poke ( ) // = 
{
    if ( CompileMode ) Compile_Poke ( _Context_->Compiler0 ) ;
    else
    {
        //uint64 * tos = ( uint64 * ) TOS ;
        //uint64 * nos = ( uint64* ) _Dsp_ [ - 1 ] ;
        //* nos = ( uint64 ) tos ;
        //* ( int64* ) NOS = TOS ;
        //_CfrTil_Move ( ( int64 * ) NOS, TOS, TWS ( - 1 )->ObjectByteSize, TWS ( 0 )->ObjectByteSize ) ;
        _CfrTil_Move ( ( int64 * ) NOS, TOS, TWS ( -1 ), TWS ( 0 ) ) ;
        _Dsp_ -= 2 ;
    }
}

void
CfrTil_AtEqual ( ) // !
{
    if ( CompileMode ) Compile_AtEqual ( DSP ) ;
    else
    {
        //*( int64* ) _Dsp_ [ - 1 ] = * ( int64* ) TOS ;
        //NOS = * ( int64* ) TOS ;
        //_CfrTil_Move ( ( int64 * ) NOS, * ( int64* ) TOS, TWS ( - 1 )->ObjectByteSize, TWS ( 0 )->ObjectByteSize ) ;
        _CfrTil_Move ( ( int64 * ) NOS, * ( int64* ) TOS, TWS ( -1 ), TWS ( 0 ) ) ;
        _Dsp_ -= 2 ;
    }
}

// ( n addr -- ) // (*addr) = n

void
CfrTil_Store ( ) // !
{
    if ( CompileMode ) Compile_Store ( _Context_->Compiler0 ) ;
    else
    {
        //* ( int64* ) ( TOS ) = NOS ; //_Dsp_ [ - 1 ] ;
        * ( int64* ) TOS = NOS ; //_Dsp_ [ - 1 ] ;
        //_CfrTil_Move ( ( int64 * ) TOS, NOS, TWS ( 0 )->ObjectByteSize, TWS ( - 1 )->ObjectByteSize ) ;
        _CfrTil_Move ( ( int64 * ) TOS, NOS, TWS ( 0 ), TWS ( -1 ) ) ;
        _Dsp_ -= 2 ;
    }
}

