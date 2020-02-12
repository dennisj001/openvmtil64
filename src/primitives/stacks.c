#include "../include/cfrtil64.h"

void
CFT_Dsp ( )
{
    DataStack_Push ( ( int64 ) _Dsp_ ) ;
}

void
CFT_Drop ( )
{
    if ( CompileMode )
    {
        //Word * one = Compiler_WordStack ( - 1 ) ;
        Word * one = CFT_WordList ( 1 ) ;
        if ( GetState ( _CFT_, OPTIMIZE_ON ) && one && ( one->StackPushRegisterCode ) ) SetHere (one->StackPushRegisterCode, 1) ;
        else _Compile_Stack_Drop ( DSP ) ;
    }
    else
    {
        DataStack_Drop ( ) ;
    }
}

void
CFT_DropN ( )
{
    if ( CompileMode ) _Compile_Stack_DropN ( DSP, _DataStack_Top ( ) + 1 ) ;
    else DataStack_DropN ( TOS + 1 ) ;
}

#if 0 // ??not needed 
void
_CFT_Push ( int64 value )
{
    if ( CompileMode )
    {
        _Compile_Stack_Push ( DSP, value ) ;
    }
    else
    {
        DataStack_Push ( value ) ;
    }
}
#endif

void
CFT_Dup ( )
{
    if ( CompileMode ) _Compile_Stack_Dup ( DSP ) ;
    else DataStack_Dup ( ) ;
    CFT_TypeStack_Dup ( ) ;
}
#if 0
void
CFT_Ndrop ( )
{
    if ( CompileMode )
    {
        //Compile_SUBI( mod, operandReg, offset, immediateData, size ) 
        Word * one = CFT_WordList ( 1 ) ;
        SetHere (one->Coding, 1) ;
        Compile_SUBI ( REG, DSP, 0, one->W_Value * CELL_SIZE, BYTE ) ;
    }
    else
    {
        uint64 n = _DataStack_Top ( ) ;
        DataStack_DropN ( n + 1 ) ;
    }
}
#endif
// result is as if one did n dups in a row 

void
CFT_NDup ( )
{
    int64 n = TOS ;
    int64 value = * -- _Dsp_ ; // -1 : n now occupies 1 to be also used slot
    while ( n -- )
    {

        * ++ _Dsp_ = value ;
    }
    //CFT->Set_DspReg_FromDataStackPointer ( ) ; // update DSP reg
}

// pick is from stack below top index
// 0 pick is Dsp [ 0] - TOS 
// 1 pick is Dsp [-1]
// ..., etc.

void
CFT_Pick ( ) // pick
{
    if ( CompileMode )
    {
        _Compile_Stack_Pick ( DSP ) ;
    }
    else
    {
        //* Dsp = ( * ( Dsp - * ( Dsp ) - 1 ) ) ;
        //int64 top = Dsp [0] ;
        _Dsp_ [0] = _Dsp_ [ - ( _Dsp_ [0] + 1 ) ] ;
    }
}

void
CFT_Swap ( )
{
    if ( CompileMode )
    {
        _Compile_Stack_Swap ( DSP ) ;
    }
    else
    {
        int64 a = TOS ;
        TOS = _Dsp_ [ - 1 ] ;
        _Dsp_ [ - 1 ] = a ;
    }
}
void
CFT_PrintNDataStack ( )
{
    // Intel SoftwareDevelopersManual-253665.pdf section 6.2 : a push decrements ESP, a pop increments ESP
    // therefore TOS is in lower mem addresses, bottom of stack is in higher memory addresses
    int64 size = DataStack_Pop ( ) ;
    _CFT_PrintNDataStack ( size ) ;
}

#if 0
void
CFT_PrintRspRegStack ( )
{
    // Intel SoftwareDevelopersManual-253665.pdf section 6.2 : a push decrements ESP, a pop increments ESP
    // therefore TOS is in lower mem addresses, bottom of stack is in higher memory addresses
    _CFT_PrintNReturnStack ( 8 ) ;
}
#endif

void
CFT_PrintReturnStack ( )
{
    _CFT_PrintNReturnStack ( 8, 1 ) ;
    CFT_NewLine ( ) ;

}


void
CFT_PrintNReturnStack ( )
{
    // Intel SoftwareDevelopersManual-253665.pdf section 6.2 : a push decrements ESP, a pop increments ESP
    // therefore TOS is in lower mem addresses, bottom of stack is in higher memory addresses
    int64 size = DataStack_Pop ( ) ;
    _CFT_PrintNReturnStack ( size, 1 ) ;
    CFT_NewLine () ;
}

void
CFT_PrintNDataStack_8 ( )
{
    // Intel SoftwareDevelopersManual-253665.pdf section 6.2 : a push decrements ESP, a pop increments ESP
    // therefore TOS is in lower mem addresses, bottom of stack is in higher memory addresses
    _CFT_PrintNDataStack ( 8 ) ;
}

