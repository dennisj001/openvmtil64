#include "../include/cfrtil64.h"

void
CfrTil_Dsp ( )
{
    _DataStack_Push ( ( int64 ) Dsp ) ;
}

#if 0 //use macros

void
Drop ( )
{
    Dsp -- ;
}

void
DropN ( int64 n )
{
    Dsp -= n ;
}
#endif

void
CfrTil_Drop ( )
{
    if ( CompileMode )
    {
        //Word * one = Compiler_WordStack ( - 1 ) ;
        Word * one = Compiler_WordList ( 1 ) ;
        if ( GetState ( _CfrTil_, OPTIMIZE_ON ) && one && ( one->StackPushRegisterCode ) ) SetHere ( one->StackPushRegisterCode ) ;
        else _Compile_Stack_Drop ( DSP ) ;
    }
    else
    {

        DSP_Drop ( ) ;
    }
}

void
CfrTil_DropN ( )
{
    if ( CompileMode ) _Compile_Stack_DropN ( DSP, _DataStack_Top ( ) + 1 ) ;
    else _DataStack_DropN ( TOS + 1 ) ;
}

void
_CfrTil_Push ( int64 value )
{
    if ( CompileMode )
    {
        _Compile_Stack_Push ( DSP, value ) ;
    }
    else
    {
        _DataStack_Push ( value ) ;
    }
}

void
CfrTil_Dup ( )
{
    if ( CompileMode )
    {
        _Compile_Stack_Dup ( DSP ) ;
    }
    else
    {

        _DataStack_Dup ( ) ;
    }
}
#if 0
void
CfrTil_Ndrop ( )
{
    if ( CompileMode )
    {
        //Compile_SUBI( mod, operandReg, offset, immediateData, size ) 
        Word * one = Compiler_WordList ( 1 ) ;
        SetHere ( one->Coding ) ;
        Compile_SUBI ( REG, DSP, 0, one->W_Value * CELL_SIZE, BYTE ) ;
    }
    else
    {
        uint64 n = _DataStack_Top ( ) ;
        _DataStack_DropN ( n + 1 ) ;
    }
}
#endif
// result is as if one did n dups in a row 

void
CfrTil_NDup ( )
{
    int64 n = TOS ;
    int64 value = * -- Dsp ; // -1 : n now occupies 1 to be also used slot
    while ( n -- )
    {

        * ++ Dsp = value ;
    }
}

// pick is from stack below top index
// 0 pick is Dsp [ 0] - TOS 
// 1 pick is Dsp [-1]
// ..., etc.

void
CfrTil_Pick ( ) // pick
{
    if ( CompileMode )
    {
        _Compile_Stack_Pick ( DSP ) ;
    }
    else
    {
        //* Dsp = ( * ( Dsp - * ( Dsp ) - 1 ) ) ;
        //int64 top = Dsp [0] ;
        Dsp [0] = Dsp [ - ( Dsp [0] + 1 ) ] ;
    }
}

void
CfrTil_Swap ( )
{
    if ( CompileMode )
    {
        _Compile_Stack_Swap ( DSP ) ;
    }
    else
    {
        int64 a = TOS ;
        TOS = Dsp [ - 1 ] ;
        Dsp [ - 1 ] = a ;
    }
}

void
CfrTil_PrintNReturnStack ( )
{
    // Intel SoftwareDevelopersManual-253665.pdf section 6.2 : a push decrements ESP, a pop increments ESP
    // therefore TOS is in lower mem addresses, bottom of stack is in higher memory addresses
    int64 size = _DataStack_Pop ( ) ;
    _CfrTil_PrintNReturnStack ( size ) ;
    CfrTil_NewLine () ;
}

void
CfrTil_PrintNDataStack ( )
{
    // Intel SoftwareDevelopersManual-253665.pdf section 6.2 : a push decrements ESP, a pop increments ESP
    // therefore TOS is in lower mem addresses, bottom of stack is in higher memory addresses
    int64 size = _DataStack_Pop ( ) ;
    _CfrTil_PrintNDataStack ( size ) ;
}

void
CfrTil_PrintReturnStack ( )
{
    // Intel SoftwareDevelopersManual-253665.pdf section 6.2 : a push decrements ESP, a pop increments ESP
    // therefore TOS is in lower mem addresses, bottom of stack is in higher memory addresses
    _CfrTil_PrintNReturnStack ( 8 ) ;
}

void
CfrTil_PrintNDataStack_8 ( )
{
    // Intel SoftwareDevelopersManual-253665.pdf section 6.2 : a push decrements ESP, a pop increments ESP
    // therefore TOS is in lower mem addresses, bottom of stack is in higher memory addresses
    _CfrTil_PrintNDataStack ( 8 ) ;
}

