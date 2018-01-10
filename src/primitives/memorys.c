#include "../include/cfrtil64.h"

// reg -- puts reg value TOS
#define TURN_DBI_OFF 1
#if TURN_DBI_OFF
#define dbion DBI_ON 
#define dbioff DBI_OFF 
#undef DBI_ON
#undef DBI_OFF
#define DBI_ON
#define DBI_OFF
#endif

// peekReg ( reg -- regValue ) //reg : reg number :: returns reg value on top of stack
void
CfrTil_PeekReg ( ) // @
{
    //DBI_ON ;
    //uint64 reg = _DataStack_Top () ;
    ByteArray * svcs = _Q_CodeByteArray, *ba = _CfrTil_->PeekPokeByteArray ;
    _ByteArray_DataClear ( ba ) ;
    Set_CompilerSpace ( ba ) ; // now compile to this space
    _Compile_Move_Reg_To_Rm ( DSP, TOS & 0xf, 0 ) ;
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
    //byte * here = Here ;
    _Compile_MoveImm ( REG, reg, IMM_B | REX_B | MODRM_B | DISP_B, 0, 0, ( uint64 ) value, CELL ) ;
    _Compile_Return ( ) ;
    //int64 size = Here - here ;
    Set_CompilerSpace ( svcs ) ; // now compile to this space
    ( ( VoidFunction ) ba->BA_Data ) ( ) ;
    //DBI_OFF ;
}

// pokeRegAtAddress ( address, reg -- )
void
CfrTil_PokeRegAtAddress ( ) // @
{
    //DBI_ON ;
    uint64 reg = DataStack_Pop ( ) ;
    uint64 address = DataStack_Pop ( ) ;
    ByteArray * svcs = _Q_CodeByteArray, *ba = _CfrTil_->PeekPokeByteArray ;
    _ByteArray_Init ( ba ) ;
    Set_CompilerSpace ( ba ) ; // now compile to this space
    //byte * here = Here ;
    _Compile_PushReg ( ACC ) ;
    _Compile_MoveImm ( REG, ACC, IMM_B | REX_B | MODRM_B | DISP_B, 0, 0, ( uint64 ) address, CELL ) ;
    _Compile_Move_Reg_To_Rm ( ACC, reg, 0 ) ;
    _Compile_PopToReg ( ACC ) ;
    _Compile_Return ( ) ;
    //int64 size = Here - here ;
    Set_CompilerSpace ( svcs ) ; // now compile to this space
    ( ( VoidFunction ) ba->BA_Data ) ( ) ;
    //DBI_OFF ;
}
#if TURN_DBI_OFF
#undef DBI_ON
#undef DBI_OFF
#define DBI_ON dbion
#define DBI_OFF dbioff
#endif

void
CfrTil_Peek ( ) // @
{
    if ( CompileMode )
    {
        Compile_Peek ( _Context_->Compiler0, DSP ) ;
    }
    else
    {
        TOS = * ( int64* ) TOS ;
    }
}

// ( addr n -- ) // (*addr) = n

void
CfrTil_Poke ( ) // = 
{
    if ( CompileMode )
    {
        Compile_Poke ( _Context_->Compiler0, DSP ) ;
    }
    else
    {
        uint64 * tos = ( uint64 * ) TOS ;
        uint64 * nos = ( uint64* ) _Dsp_ [ - 1 ] ;
        * nos = ( uint64 ) tos ;
        _Dsp_ -= 2 ;
        //_CfrTil_->Set_DspReg_FromDataStackPointer ( ) ; // update DSP reg
    }
}

void
CfrTil_AtEqual ( ) // !
{
    if ( CompileMode )
    {
        Compile_AtEqual ( DSP ) ;
    }
    else
    {
        *( int64* ) _Dsp_ [ - 1 ] = * ( int64* ) TOS ;
        _Dsp_ -= 2 ;
        //_CfrTil_->Set_DspReg_FromDataStackPointer ( ) ; // update DSP reg
    }
}

// ( n addr -- ) // (*addr) = n

void
CfrTil_Store ( ) // !
{
    if ( CompileMode )
    {
        Compile_Store ( _Context_->Compiler0, DSP ) ;
    }
    else
    {
        * ( int64* ) ( TOS ) = _Dsp_ [ - 1 ] ;
        _Dsp_ -= 2 ;
        //_CfrTil_->Set_DspReg_FromDataStackPointer ( ) ; // update DSP reg
    }
}

