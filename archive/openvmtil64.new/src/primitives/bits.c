#include "../include/cfrtil64.h"

// ( n ttt -- )

void
CfrTil_JMP ( )
{
    if ( CompileMode )
    {
        _Compile_UninitializedJump ( ) ; // at the end of the 'if block' we need to jmp over the 'else block'
        CfrTil_CalculateAndSetPreviousJmpOffset_ToHere ( ) ;
        Stack_PointerToJmpOffset_Set ( ) ;
    }
    else
    {
        Error_Abort ( ( byte* ) "\njmp : can only be used in compile mode." ) ;
    }
}

void
CfrTil_Compile_Jcc ( )
{
    int64 ttt = DataStack_Pop ( ) ;
    int64 n = DataStack_Pop ( ) ;
    Compile_JCC ( n, ttt, 0 ) ; // we do need to store and get this logic set by various conditions by the compiler : _Compile_SET_tttn_REG
    Stack_PointerToJmpOffset_Set ( ) ;
}

void
CfrTil_Jcc_Label ( )
{
    int64 ttt = DataStack_Pop ( ) ;
    int64 n = DataStack_Pop ( ) ;
    Compile_JCC ( n, ttt, 0 ) ;
#if 0    
    GotoInfo * gotoInfo = ( GotoInfo * ) _GotoInfo_Allocate ( ) ;
    gotoInfo->pb_LabelName = ( byte* ) DataStack_Pop ( ) ;
    gotoInfo->pb_JmpOffsetPointer = Here - INT32_SIZE ; // after the call opcode
    gotoInfo->GI_CAttribute = GI_CALL_LABEL ;
    dllist_AddNodeToTail ( _Context_->Compiler0->GotoList, ( dlnode* ) gotoInfo ) ;
#endif    
    GotoInfo_New ( ( byte* ) DataStack_Pop ( ), GI_CALL_LABEL ) ;
}

void
CfrTil_JmpToHere ( )
{
    CfrTil_CalculateAndSetPreviousJmpOffset_ToHere ( ) ;
}

void
CfrTil_BitWise_NOT ( ) // xor
{
    if ( CompileMode )
    {
        Compile_BitWise_NOT ( _Context_->Compiler0 ) ;
    }
    else
    {
        //if ( Dsp ) { Dsp [0] = ~ Dsp[0] ; }
        TOS = ! TOS ;
    }
}

void
CfrTil_BitWise_NEG ( ) // xor
{
    if ( CompileMode )
    {
        Compile_BitWise_NEG ( _Context_->Compiler0 ) ;
    }
    else
    {
        TOS = ~ TOS ;
    }
}

void
CfrTil_BitWise_OR ( ) // xor
{
    if ( CompileMode )
    {
        Compile_X_Group1 ( _Context_->Compiler0, OR, ZERO_TTT, NZ ) ;
    }
    else
    {
        _Dsp_ [ - 1 ] = _Dsp_ [ - 1 ] | TOS ;
        DataStack_Drop ( ) ;
    }
}

void
CfrTil_BitWise_OrEqual ( ) // -=
{
    if ( CompileMode )
    {
        Compile_Group1_X_OpEqual ( _Context_->Compiler0, OR ) ;
    }
    else
    {
        int64 *x, n ;
        n = DataStack_Pop ( ) ;
        x = ( int64* ) DataStack_Pop ( ) ;
        *x = ( * x ) | n ;
        //_DataStack_SetTop ( Dsp, _DataStack_Pop () + _DataStack_GetTop ( Dsp ) ) ;
        //_CfrTil_->set_DspReg_FromDataStackPointer ( ) ; // update DSP reg
    }
}

void
CfrTil_BitWise_AND ( ) // xor
{
    if ( CompileMode )
    {
        Compile_X_Group1 ( _Context_->Compiler0, AND, ZERO_TTT, NZ ) ;
    }
    else
    {
        _Dsp_ [ - 1 ] = _Dsp_ [ - 1 ] & TOS ;
        DataStack_Drop ( ) ;
    }
}

void
CfrTil_BitWise_AndEqual ( ) // -=
{
    if ( CompileMode )
    {
        Compile_Group1_X_OpEqual ( _Context_->Compiler0, AND ) ;
    }
    else
    {
        int64 *x, n ;
        n = DataStack_Pop ( ) ;
        x = ( int64* ) DataStack_Pop ( ) ;
        *x = ( * x ) & n ;
        //_DataStack_SetTop ( Dsp, _DataStack_Pop () + _DataStack_GetTop ( Dsp ) ) ;
    }
}

void
CfrTil_BitWise_XOR ( ) // xor
{
    if ( CompileMode )
    {
        Compile_X_Group1 ( _Context_->Compiler0, XOR, ZERO_TTT, NZ ) ;
    }
    else
    {
        _Dsp_ [ - 1 ] = _Dsp_ [ - 1 ] ^ TOS ;
        DataStack_Drop ( ) ;
    }
}

void
CfrTil_BitWise_XorEqual ( ) // -=
{
    if ( CompileMode )
    {
        Compile_Group1_X_OpEqual ( _Context_->Compiler0, XOR ) ;
    }
    else
    {
        int64 *x, n ;
        n = DataStack_Pop ( ) ;
        x = ( int64* ) DataStack_Pop ( ) ;
        *x = ( * x ) ^ n ;
        //_DataStack_SetTop ( Dsp, _DataStack_Pop () + _DataStack_GetTop ( Dsp ) ) ;
    }
}

void
CfrTil_ShiftLeft ( ) // lshift
{
    if ( CompileMode )
    {
        Compile_ShiftLeft ( ) ;
    }
    else
    {
        _Dsp_ [ - 1 ] = _Dsp_ [ - 1 ] << TOS ;
        DataStack_Drop ( ) ;
    }
}

void
CfrTil_ShiftRight ( ) // rshift
{
    if ( CompileMode )
    {
        Compile_ShiftRight ( ) ;
    }
    else
    {
        _Dsp_ [ - 1 ] = _Dsp_ [ - 1 ] >> TOS ;
        DataStack_Drop ( ) ;
    }
}

void
CfrTil_ShiftLeft_Equal ( ) // +=
{
    if ( GetState ( _Context_->Compiler0, BLOCK_MODE ) )
    {
        Compile_X_Shift ( _Context_->Compiler0, SHL, 0 ) ;
    }
    else
    {
        int64 *x, n ;
        n = DataStack_Pop ( ) ;
        x = ( int64* ) DataStack_Pop ( ) ;
        *x = * x << n ;
        //_DataStack_SetTop ( Dsp, _DataStack_Pop () + _DataStack_GetTop ( Dsp ) ) ;
    }
}

void
CfrTil_ShiftRight_Equal ( ) // +=
{
    if ( GetState ( _Context_->Compiler0, BLOCK_MODE ) )
    {
        Compile_X_Shift ( _Context_->Compiler0, SHR, 0 ) ;
    }
    else
    {
        int64 *x, n ;
        n = DataStack_Pop ( ) ;
        x = ( int64* ) DataStack_Pop ( ) ;
        *x = * x >> n ;
        //_DataStack_SetTop ( Dsp, _DataStack_Pop () + _DataStack_GetTop ( Dsp ) ) ;
    }
}




