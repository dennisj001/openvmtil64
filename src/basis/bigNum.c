#include "../include/cfrtil64.h"

#define BN_DBG_OFF 1
#if BN_DBG_OFF
#define d1m(x) 
#endif

mpfr_t *
_BigNum_New ( byte * token )
{
    mpfr_t *bfr = ( mpfr_t* ) Mem_Allocate ( sizeof ( mpfr_t ), OBJECT_MEMORY ) ;
    double bf ;
    long i, bi ;
    if ( token )
    {
        for ( i = 0 ; token [i] ; i ++ )
        {
            if ( token [i] == '.' )
            {
                if ( sscanf ( ( char* ) token, "%lf", &bf ) )
                {
                    mpfr_init_set_d ( *bfr, bf, MPFR_RNDN ) ;
                    goto retrn ;
                }
                else goto doDefaultZeroValue ;
            }
        }
        if ( sscanf ( ( char* ) token, "%ld", &bi ) ) mpfr_init_set_si ( *bfr, bi, MPFR_RNDN ) ;
            //if ( sscanf ( ( char* ) token, "%lf", &bf ) ) mpfr_set_d ( *bfr, bf, MPFR_RNDD ) ;
            //else if ( sscanf ( ( char* ) token, "%ld", &bi ) ) mpfr_init2 ( *bfr, bi) ; //, MPFR_RNDN ) ;
        else goto doDefaultZeroValue ;
        goto retrn ;
    }
doDefaultZeroValue:
    mpfr_init_set_si ( *bfr, ( long ) 0, MPFR_RNDN ) ;
retrn:
    d0 ( _CfrTil_->SaveSelectedCpuState ( ) ) ;
    //d1m ( _CfrTil_->SaveCpuState ( ) ) ;
    return bfr ;
}

//"For a, A, e, E, f and F specifiers: this is the number of digits to be printed after the decimal point" 

mpfr_t *
BigNum_GetPrintfPrecision_BigNum ( )
{
    DataStack_Push ( _Context_->System0->BigNum_Printf_Precision ) ; // this precision is used by BigNum_FPrint like printf
}

// width is a parameter to mpfr_printf; it works like printf and sets minimum number of characters to print
// "Minimum number of characters to be printed. If the value to be printed is shorter than this number, 
// the result is padded with blank spaces. The value is not truncated even if the result is larger."

void
BigNum_GetPrintfWidth ( )
{
    DataStack_Push ( ( int64 ) _Context_->System0->BigNum_Printf_Width ) ;
}

// set from BigNum 

void
BigNum_Set_PrintfPrecision ( )
{
    //int64 precision = DataStack_Pop ( ) ; // number of decimal digits
    mpfr_t * prec = ( mpfr_t* ) DataStack_Pop ( ) ; // number of decimal digits
    int64 precision = mpfr_get_si ( *prec, MPFR_RNDN ) ;
    _Context_->System0->BigNum_Printf_Precision = precision ; // this precision is used by BigNum_FPrint like printf
}

// set from BigNum 

void
BigNum_Set_PrintfWidth ( )
{
    mpfr_t * mpfwidth = ( mpfr_t* ) DataStack_Pop ( ) ;
    int64 width = mpfr_get_si ( *mpfwidth, MPFR_RNDN ) ;
    _Context_->System0->BigNum_Printf_Width = width ;
}

// internal mpfr bit precision

void
BigNum_GetAndPrint_BitPrecision ( )
{
    mpfr_prec_t precision = mpfr_get_default_prec ( ) ; // number of decimal digits
    _Printf ( ( byte* ) "\nBigNum Internal Bit Precision = %ld", precision ) ;
}

// set from BigNum 

void
BigNum_SetDefaultBitPrecision ( )
{
    mpfr_t * prec = ( mpfr_t* ) DataStack_Pop ( ) ; // number of decimal digits
    long precision = mpfr_get_si ( *prec, MPFR_RNDN ) ;
    mpfr_set_default_prec ( precision ) ; // "precision is the number of bits used to represent the significand of a floating-point number"
}

void
BigNum_StateShow ( )
{
    BigNum_Info ( ) ;
    BigNum_GetAndPrint_BitPrecision ( ) ;
    _Printf ( ( byte * ) "\nBigNum :: Width = %d : Precision = %d", _Context_->System0->BigNum_Printf_Width, _Context_->System0->BigNum_Printf_Precision ) ;

}
#if 0

void
BigNum_FPrint ( )
{
    mpfr_t * value = ( mpfr_t* ) DataStack_Pop ( ) ;
    if ( _Q_->Verbosity ) mpfr_printf ( "%*.*Rf", _Context_->System0->BigNum_Printf_Width, _Context_->System0->BigNum_Printf_Precision, *value ) ;
    fflush ( stdout ) ;
}

// scientific format

void
BigNum_EPrint ( )
{
    mpfr_t * value = ( mpfr_t* ) DataStack_Pop ( ) ;
    if ( _Q_->Verbosity ) mpfr_printf ( "%*.*Re", _Context_->System0->BigNum_Printf_Width, _Context_->System0->BigNum_Printf_Precision, *value ) ;
    fflush ( stdout ) ;
}
#else

void
BigNum_Info ( )
{
    _Printf ( ( byte* ) "\nMPFR library: %-12s\nMPFR header:  %s (based on %d.%d.%d)\n",
        mpfr_get_version ( ), MPFR_VERSION_STRING, MPFR_VERSION_MAJOR,
        MPFR_VERSION_MINOR, MPFR_VERSION_PATCHLEVEL ) ;
}

void
_BigNum_FPrint ( mpfr_t * value )
{
    Context * cntx = _Context_ ;
    char * format ;
    //mpfr_t * value = ( mpfr_t* ) DataStack_Pop ( ) ;
    if ( _Q_->Verbosity )
    {
#if 0        
        {
            unsigned int i ;
            mpfr_t s, t, u ;

            mpfr_init2 ( t, 200 ) ;
            mpfr_set_d ( t, 1.0, MPFR_RNDD ) ;
            mpfr_init2 ( s, 200 ) ;
            mpfr_set_d ( s, 1.0, MPFR_RNDD ) ;
            mpfr_init2 ( u, 200 ) ;
            for ( i = 1 ; i <= 100 ; i ++ )
            {
                mpfr_mul_ui ( t, t, i, MPFR_RNDU ) ;
                mpfr_set_d ( u, 1.0, MPFR_RNDD ) ;
                mpfr_div ( u, u, t, MPFR_RNDD ) ;
                mpfr_add ( s, s, u, MPFR_RNDD ) ;
            }
            printf ( "Sum is " ) ;
            mpfr_out_str ( stdout, 10, 0, s, MPFR_RNDD ) ;
            putchar ( '\n' ) ;
            mpfr_clear ( s ) ;
            mpfr_clear ( t ) ;
            mpfr_clear ( u ) ;
        }
#endif       
        if ( cntx->System0->NumberBase == 10 ) format = "%*.*Rf" ;
        else if ( cntx->System0->NumberBase == 2 ) format = "%*.*Rb" ;
        else if ( cntx->System0->NumberBase == 16 ) format = "%*.*Rx" ;
        d1m ( if ( GetState ( _CfrTil_->cs_Cpu2, CPU_SELECTED_SAVED ) ) _CfrTil_->RestoreSelectedCpuState ( ) ) ;
        d1m ( CfrTil_CpuState_Current_Show ( ) ) ;
        d0 ( Cpu_CheckRspForWordAlignment ( "BigNum_FPrint" ) ) ;
        // a bug (?) in mpfr apparently so ...
#if 1 // ?? bug work around ??       
        if ( _CfrTil_->SaveSelectedCpuState ( ), ( ( uint64 ) _CfrTil_->cs_Cpu->Rsp & ( uint64 ) 0x8 ) )
            mpfr_out_str ( stdout, cntx->System0->NumberBase, 0, *value, MPFR_RNDN ) ;
        else mpfr_printf ( format, _Context_->System0->BigNum_Printf_Width, _Context_->System0->BigNum_Printf_Precision, *value ) ;
#else
        mpfr_printf ( format, _Context_->System0->BigNum_Printf_Width, _Context_->System0->BigNum_Printf_Precision, *value ) ;
#endif        
        d1m ( _CfrTil_->SaveSelectedCpuState ( ) ; SetState ( _CfrTil_->cs_Cpu2, CPU_SELECTED_SAVED, true ) ; ) ;
        d1m ( CfrTil_CpuState_Current_Show ( ) ) ;
    }
    fflush ( stdout ) ;
}

void
BigNum_FPrint ( )
{
    _BigNum_FPrint ( ( mpfr_t* ) DataStack_Pop ( ) ) ;
}

#if 0

void
BigNum_FPrint2 ( )
{
    Context * cntx = _Context_ ;
    char * format ;
    mpfr_t * value = ( mpfr_t* ) DataStack_Pop ( ) ;
    if ( _Q_->Verbosity )
    {
#if 1        
        if ( cntx->System0->NumberBase == 10 ) format = "%*.*Rf" ;
        else if ( cntx->System0->NumberBase == 2 ) format = "%*.*Rb" ;
        else if ( cntx->System0->NumberBase == 16 ) format = "%*.*Rx" ;
        mpfr_printf ( format, _Context_->System0->BigNum_Printf_Width, _Context_->System0->BigNum_Printf_Precision, *value ) ;
#else
        mpfr_printf ( "%*.*Rf", 16, 16, *value ) ;
#endif        
    }
    fflush ( stdout ) ;
}
#endif
// scientific format

void
BigNum_EPrint ( )
{
    mpfr_t * value = ( mpfr_t* ) DataStack_Pop ( ) ;
    if ( _Q_->Verbosity ) mpfr_printf ( "%*.*Re", _Context_->System0->BigNum_Printf_Width, _Context_->System0->BigNum_Printf_Precision, *value ) ;
    fflush ( stdout ) ;
}
#endif

void
BigNum_PopTwoOps_PushFunctionResult ( mpf2andOutFunc func )
{
    mpfr_t *result = _BigNum_New ( 0 ) ;
    mpfr_t *op1 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_t * op2 = ( mpfr_t* ) DataStack_Pop ( ) ;
    func ( *result, *op2, *op1, MPFR_RNDN ) ;
    d0 ( _CfrTil_->SaveSelectedCpuState ( ) ) ;
    //d1m ( _CfrTil_->SaveCpuState ( ) ) ;
    DataStack_Push ( ( int64 ) result ) ;
}

#define USE_FUNCTION 1

void
BigNum_Add ( )
{
#if USE_FUNCTION
    BigNum_PopTwoOps_PushFunctionResult ( mpfr_add ) ;
#else    
    mpfr_t *result = _BigNum_New ( 0 ) ;
    mpfr_t *op1 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_t * op2 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_add ( *result, *op2, *op1, MPFR_RNDN ) ;
    DataStack_Push ( ( int64 ) result ) ;
#endif    
}

void
BigNum_Multiply ( )
{
#if USE_FUNCTION    
    BigNum_PopTwoOps_PushFunctionResult ( mpfr_mul ) ;
#else    
    mpfr_t *result = _BigNum_New ( 0 ) ;
    mpfr_t *op1 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_t * op2 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_mul ( *result, *op2, *op1, MPFR_RNDN ) ;
    DataStack_Push ( ( int64 ) result ) ;
#endif    
}

void
BigNum_Divide ( )
{
#if USE_FUNCTION    
    BigNum_PopTwoOps_PushFunctionResult ( mpfr_div ) ;
#else    
    mpfr_t *result = _BigNum_New ( 0 ) ;
    mpfr_t *op1 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_t * op2 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_div ( *result, *op2, *op1, MPFR_RNDN ) ;
    DataStack_Push ( ( int64 ) result ) ;
#endif    
}

void
BigNum_Subtract ( )
{
#if USE_FUNCTION    
    BigNum_PopTwoOps_PushFunctionResult ( mpfr_sub ) ;
#else    
    mpfr_t *result = _BigNum_New ( 0 ) ;
    mpfr_t *op1 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_t * op2 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_sub ( *result, *op2, *op1, MPFR_RNDN ) ;
    DataStack_Push ( ( int64 ) result ) ;
#endif    
}

void
_BigNum_OpEqualTemplate ( mpf2andOutFunc func )
{
    mpfr_t *result = _BigNum_New ( 0 ) ;
    mpfr_t * op2 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_t **p_op1 = ( mpfr_t** ) DataStack_Pop ( ) ;
    func ( *result, **p_op1, *op2, MPFR_RNDN ) ;
    *p_op1 = result ;
    d0 ( _CfrTil_->SaveSelectedCpuState ( ) ) ;
    //d1m ( _CfrTil_->SaveCpuState ( ) ) ;
}

void
BigNum_PlusEqual ( )
#if 0
{
    mpfr_t *sum = _BigNum_New ( 0 ) ;
    mpfr_t * op1 = ( mpfr_t* ) DataStack_Pop ( ), **p_op2 = ( mpfr_t** ) DataStack_Pop ( ) ;
    mpfr_add ( *sum, *op1, **p_op2, MPFR_RNDN ) ;
    *p_op2 = sum ;
}
#else
{
    //_BigNum_OpEqualTemplate ( mpfr_add ) ;
    mpfr_t *result = _BigNum_New ( 0 ) ;
    mpfr_t * op2 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_t **p_op1 = ( mpfr_t** ) DataStack_Pop ( ) ;
    mpfr_add ( *result, **p_op1, *op2, MPFR_RNDN ) ;
    *p_op1 = result ;
}
#endif

void
BigNum_MinusEqual ( )
{
#if 1    
    _BigNum_OpEqualTemplate ( mpfr_sub ) ;
#else    
    mpfr_t *result = _BigNum_New ( 0 ) ;
    mpfr_t * op2 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_t **p_op1 = ( mpfr_t** ) DataStack_Pop ( ) ;
    mpfr_sub ( *result, **p_op1, *op2, MPFR_RNDN ) ;
    *p_op1 = result ;
#endif
}

void
BigNum_MultiplyEqual ( )
{
#if 1    
    _BigNum_OpEqualTemplate ( mpfr_mul ) ;
#else    
    mpfr_t *result = _BigNum_New ( 0 ) ;
    mpfr_t * op2 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_t **p_op1 = ( mpfr_t** ) DataStack_Pop ( ) ;
    mpfr_mul ( *result, **p_op1, *op2, MPFR_RNDN ) ;
    *p_op1 = result ;
#endif
}

void
BigNum_DivideEqual ( ) // remainder discarded
{
#if 1    
    _BigNum_OpEqualTemplate ( mpfr_div ) ;
#else    
    mpfr_t *result = _BigNum_New ( 0 ) ;
    mpfr_t * op2 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_t **p_op1 = ( mpfr_t** ) DataStack_Pop ( ) ;
    mpfr_div ( *result, **p_op1, *op2, MPFR_RNDN ) ;
    *p_op1 = result ;
#endif
}

// ++

void
BigNum_PlusPlus ( )
{
    mpfr_t *sum = _BigNum_New ( 0 ) ;
    mpfr_t * op1 = ( mpfr_t* ) _DataStack_GetTop ( ), *op2 = ( mpfr_t* ) _BigNum_New ( "1" ) ;
    mpfr_add ( *sum, *op1, *op2, MPFR_RNDN ) ;
    _DataStack_SetTop ( ( int64 ) sum ) ;
}

void
BigNum_MinusMinus ( )
{
    mpfr_t *sum = _BigNum_New ( 0 ) ;
    mpfr_t * op1 = ( mpfr_t* ) _DataStack_GetTop ( ), *op2 = ( mpfr_t* ) _BigNum_New ( "1" ) ;
    mpfr_sub ( *sum, *op1, *op2, MPFR_RNDN ) ;
    _DataStack_SetTop ( ( int64 ) sum ) ;
}

void
BigNum_SquareRoot ( )
{
    mpfr_t *rop = _BigNum_New ( 0 ) ;
    mpfr_t * op1 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_sqrt ( *rop, *op1, MPFR_RNDN ) ;
    DataStack_Push ( ( int64 ) rop ) ;
}

void
BigNum_Power ( )
{
    mpfr_t *rop = _BigNum_New ( 0 ) ;
    mpfr_t * expf = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_t * op1 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_pow ( *rop, *op1, *expf, MPFR_RNDN ) ;
    DataStack_Push ( ( int64 ) rop ) ;
}

// returns op1 - op2

int64
BigNum_Cmp ( )
{
    mpfr_t * op2 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_t *op1 = ( mpfr_t* ) DataStack_Pop ( ) ;
    return mpfr_cmp ( *op1, *op2 ) ;
}

void
BigNum_Equal ( )
{
    DataStack_Push ( BigNum_Cmp ( ) == 0 ? 1 : 0 ) ;
}

// op1 < op2 => (op1 - op2 < 0 )

void
BigNum_LessThan ( )
{
    DataStack_Push ( ( BigNum_Cmp ( ) < 0 ) ? 1 : 0 ) ;
}

// op1 <= op2 => (op1 - op2 <= 0 )

void
BigNum_LessThanOrEqual ( )
{
    DataStack_Push ( BigNum_Cmp ( ) <= 0 ? 1 : 0 ) ;
}

// op1 > op2 => (op1 - op2 > 0 )

void
BigNum_GreaterThan ( )
{
    DataStack_Push ( BigNum_Cmp ( ) > 0 ? 1 : 0 ) ;
}

// op1 >= op2 => (op1 - op2 >= 0 )

void
BigNum_GreaterThanOrEqual ( )
{
    DataStack_Push ( ( BigNum_Cmp ( ) >= 0 ) ? 1 : 0 ) ;
}

void
BigNum_LogicalEquals ( )
{
    DataStack_Push ( BigNum_Cmp ( ) == 0 ? 1 : 0 ) ;
}

void
BigNum_LogicalDoesNotEqual ( )
{
    DataStack_Push ( BigNum_Cmp ( ) == 0 ? 0 : 1 ) ;
}

#if 0

void
BigNum_Init ( )
{
    // assuming TOS is a uint64 
    _DataStack_SetTop ( ( int64 ) _BigNum_New ( _DataStack_GetTop ( ) ) ) ;
}

void
BigNum_DivideWithRemainder ( )
{
    mpfr_t *quotient = _BigNum_New ( 0 ) ;
    mpfr_t *remainder = _BigNum_New ( 0 ) ;
    mpfr_t * denominator = ( mpfr_t* ) DataStack_Pop ( ), *numerator = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_cdiv_qr ( *quotient, *remainder, *numerator, *denominator ) ;
    DataStack_Push ( ( int64 ) remainder ) ;
    DataStack_Push ( ( int64 ) quotient ) ;
}

void
BigNum_Add ( )
{
    mpfr_t *sum = _BigNum_New ( 0 ) ;
    mpfr_t * op1 = ( mpfr_t* ) DataStack_Pop ( ), *op2 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_add ( *sum, *op1, *op2, MPFR_RNDN ) ;
    DataStack_Push ( ( int64 ) sum ) ;
}

void
BigNum_Multiply ( )
{
    mpfr_t *prod = _BigNum_New ( 0 ) ;
    mpfr_t * op1 = ( mpfr_t* ) DataStack_Pop ( ), *op2 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_mul ( *prod, *op1, *op2, MPFR_RNDN ) ;
    DataStack_Push ( ( int64 ) prod ) ;
}

void
BigNum_Divide ( )
{
    mpfr_t *quotient = _BigNum_New ( 0 ) ;
    mpfr_t * denominator = ( mpfr_t* ) DataStack_Pop ( ), *numerator = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_div ( *quotient, *numerator, *denominator, MPFR_RNDN ) ;
    DataStack_Push ( ( int64 ) quotient ) ;
}

void
BigNum_Subtract ( )
{
    mpfr_t *diff = _BigNum_New ( 0 ) ;
    mpfr_t * op2 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_t *op1 = ( mpfr_t* ) DataStack_Pop ( ) ;
    mpfr_sub ( *diff, *op1, *op2, MPFR_RNDN ) ; // diff = op1 - op2
    DataStack_Push ( ( int64 ) diff ) ;
}

void
BigNum_GetPrintfPrecision_Pointer ( )
{
    DataStack_Push ( ( int64 ) & _Context_->System0->BigNumPrecision ) ;
}

void
BigNum_GetPrintfWidth_Pointer ( )
{
    DataStack_Push ( ( int64 ) & _Context_->System0->BigNumWidth ) ;
}

#endif


