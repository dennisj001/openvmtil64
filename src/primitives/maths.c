
#include "../include/cfrtil64.h"

void
CfrTil_Plus ( ) // +
{
    if ( CompileMode )
    {
        Compile_X_Group1 ( _Context_->Compiler0, ADD, TTT_ZERO, NEGFLAG_ON ) ;
    }
    else
    {
        _Dsp_ [ - 1 ] = _Dsp_ [ 0 ] + _Dsp_ [ - 1 ] ;
        DataStack_Drop ( ) ;
    }
}

// if rvalue leave on stack else drop after inc/dec

void
CfrTil_PlusPlus ( ) // +
{
    CfrTil_IncDec ( INC ) ;
}

void
CfrTil_MinusMinus ( ) // --
{
    CfrTil_IncDec ( DEC ) ;
}

void
CfrTil_PlusEqual ( ) // +=
{
    if ( CompileMode )
    {
        Compile_X_OpEqual ( _Context_->Compiler0, CfrTil_Plus ) ; //ADD ) ;
    }
    else
    {

        int64 *x, n ;
        n = DataStack_Pop ( ) ;
        x = ( int64* ) DataStack_Pop ( ) ;
        *x = * x + n ;
        //_DataStack_SetTop ( Dsp, _DataStack_Pop () + _DataStack_GetTop ( Dsp ) ) ;
    }
}

void
CfrTil_MinusEqual ( ) // -=
{
    if ( CompileMode )
    {
        Compile_X_OpEqual ( _Context_->Compiler0, CfrTil_Minus ) ; //SUB ) ;
    }
    else
    {

        int64 *x, n ;
        n = DataStack_Pop ( ) ;
        x = ( int64* ) DataStack_Pop ( ) ;
        *x = * x - n ;
        //_DataStack_SetTop ( Dsp, _DataStack_Pop () + _DataStack_GetTop ( Dsp ) ) ;
    }
}

void
CfrTil_MultiplyEqual ( ) // *=
{
    if ( CompileMode )
    {
        //Compile_MultiplyEqual ( _Context_->Compiler0 ) ;
        Compile_X_OpEqual ( _Compiler_, CfrTil_Multiply ) ; //MUL_OP ) ;
    }
    else
    {
        int64 *x, n ;
        n = DataStack_Pop ( ) ;
        x = ( int64* ) DataStack_Pop ( ) ;
        *x = * x * n ;
        //_DataStack_SetTop ( Dsp, _DataStack_Pop () + _DataStack_GetTop ( Dsp ) ) ;
    }
}

void
CfrTil_DivideEqual ( ) // +=
{
    if ( CompileMode )
    {
        //Compile_DivideEqual ( _Context_->Compiler0 ) ;
        Compile_X_OpEqual ( _Compiler_, CfrTil_Divide ) ; //DIV_OP ) ;
    }
    else
    {
        int64 *x, n ;
        n = DataStack_Pop ( ) ;
        x = ( int64* ) DataStack_Pop ( ) ;
        *x = * x / n ;
        //_DataStack_SetTop ( Dsp, _DataStack_Pop () + _DataStack_GetTop ( Dsp ) ) ;
    }
}

// ( b top | b - top ) dpans

void
CfrTil_Minus ( )
{
    if ( CompileMode )
    {
        Compile_X_Group1 ( _Context_->Compiler0, SUB, TTT_ZERO, NEGFLAG_ON ) ;
    }
    else
    {
        _Dsp_ [ - 1 ] = _Dsp_ [ - 1 ] - _Dsp_ [ 0 ] ;
        DataStack_Drop ( ) ;
    }
}

void
CfrTil_Multiply ( ) // *
{
    if ( CompileMode )
    {
        Compile_Multiply ( _Context_->Compiler0 ) ;
    }
    else
    {

        _Dsp_ [ - 1 ] = _Dsp_ [ 0 ] * _Dsp_ [ - 1 ] ;
        DataStack_Drop ( ) ;
    }
}

// ( b top | b < top ) dpans

void
CfrTil_Divide ( ) // *
{
    if ( CompileMode )
    {
        Compile_Divide ( _Context_->Compiler0 ) ;
    }
    else
    {

        int64 a, b ;
        a = DataStack_Pop ( ) ;
        b = _DataStack_GetTop ( ) ;
        _DataStack_SetTop ( ( int64 ) ( b / a ) ) ;
    }
}

void
CfrTil_Mod ( ) // *
{
    if ( CompileMode )
    {
        Compile_Mod ( _Context_->Compiler0 ) ;
    }
    else
    {

        int64 a, b ;
        a = DataStack_Pop ( ) ;
        b = _DataStack_GetTop ( ) ;
        _DataStack_SetTop ( ( int64 ) ( b % a ) ) ;
    }
}

#if 0
#if 0
"Ar3" class : { int64 ar [3][3][2] } ;
: a7 ( n m o Ar3 a )
a.ar[n @ 1 + ][m @][o @] a.ar[n @ 2 + ][m @][o @] @ =
// nl "a6.a : " ps location a.ar[1][2][1] 72 dump
nl "a7.a : " ps location a @ 72 dump
// a.ar[n @ 2 +][m @][o @] @ dup p 89 s _assert 
a.ar[n @ 1 + ][m @][o @] @ dup p 89 s _assert
;
#endif

void
a7 ( int64 n, int64 m, int64 o, A3 * a )
{

    a->ar[n + 1][m][o] = a->ar[n + 2][m][o] ;
    __CfrTil_Dump ( ( int64 ) a, sizeof (*a ), 8 ) ;
}

void
call_a7 ( )
{
    A3 ar ;
    memset ( &ar, 0, sizeof (A3 ) ) ;
    ar.ar[2][2][1] = 89 ;

    int64 a = DataStack_Pop ( ) ;
    int64 b = DataStack_Pop ( ) ;
    int64 c = DataStack_Pop ( ) ;

    a7 ( a, b, c, &ar ) ;
    memset ( &ar, 0, sizeof (A3 ) ) ;
    ar.ar[2][2][1] = 89 ;
    a7 ( a, b, c, &ar ) ;
}
#endif
#pragma GCC reset_options