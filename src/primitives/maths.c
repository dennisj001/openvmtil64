
#include "../include/cfrtil64.h"

void
CfrTil_Plus ( ) // +
{
    if ( CompileMode )
    {
        Compile_X_Group1 ( _Context_->Compiler0, ADD, ZERO_TTT, NZ ) ;
    }
    else
    {
        _Dsp_ [ - 1 ] = _Dsp_ [ 0 ] + _Dsp_ [ - 1 ] ;
        DataStack_Drop ( ) ;
    }
}

// if rvalue leave on stack else drop after inc/dec

void
CfrTil_IncDec ( int64 op ) // +
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    int64 sd = List_Depth ( compiler->WordList ) ;
    if ( ( sd > 1 ) && ( ! GetState ( compiler, LC_CFRTIL ) ) ) //|INFIX_LIST_INTERPRET ) )
    {
        Word *one = ( Word* ) _Compiler_WordList ( compiler, 1 ) ; //, *three = Compiler_WordList ( 3 ) ; // the operand
        byte * nextToken = Lexer_PeekNextNonDebugTokenWord ( cntx->Lexer0, 1 ) ;
        Word * currentWord = _Context_->CurrentlyRunningWord ;
        Word * nextWord = Finder_Word_FindUsing ( cntx->Interpreter0->Finder0, nextToken, 0 ) ;
        SetState ( _Debugger_, DEBUG_SHTL_OFF, true ) ;
        if ( nextWord && ( nextWord->CAttribute & ( CATEGORY_OP_ORDERED | CATEGORY_OP_UNORDERED | CATEGORY_OP_DIVIDE | CATEGORY_OP_EQUAL ) ) ) // postfix
        {
            List_DropN ( compiler->WordList, 1 ) ; // the operator; let higher level see the variable
            //Interpreter_InterpretNextToken ( cntx->Interpreter0 ) ;
            if ( GetState ( compiler, C_INFIX_EQUAL ) && GetState ( _CfrTil_, OPTIMIZE_ON ) && CompileMode )
            {
                SetHere ( one->Coding ) ;
                // ?? couldn't this stuff be done with _Interpret_C_Until_EitherToken ??
                dllist * postfixList = List_New ( ) ;
                List_Push_1Value_Node ( postfixList, currentWord, COMPILER_TEMP ) ;
                List_Push_1Value_Node ( postfixList, one, COMPILER_TEMP ) ;
                List_Push_1Value_Node ( compiler->PostfixLists, postfixList, COMPILER_TEMP ) ;
                return ;
            }
            else
            {
                Interpreter_InterpretNextToken ( cntx->Interpreter0 ) ;
                if ( sd > 1 )
                {
                    _Interpreter_DoWord ( cntx->Interpreter0, one, - 1 ) ;
                    _Interpreter_DoWord ( cntx->Interpreter0, currentWord, - 1 ) ;
                    return ;
                }
            }
        }
        if ( one->CAttribute & ( PARAMETER_VARIABLE | LOCAL_VARIABLE | NAMESPACE_VARIABLE ) )
        {
            //if ( ( ! ( two->CAttribute & ( KEYWORD ) ) ) && GetState ( _Context_, C_SYNTAX ) )
            {
                if ( ! GetState ( compiler, INFIX_LIST_INTERPRET ) )
                {
                    List_DropN ( compiler->WordList, 1 ) ; // the operator; let higher level see the variable
                    SetHere ( one->Coding ) ;
                    CfrTil_WordList_PushWord ( one ) ;
                    dllist * postfixList = List_New ( ) ;
                    List_Push_1Value_Node ( postfixList, currentWord, COMPILER_TEMP ) ;
                    List_Push_1Value_Node ( postfixList, one, COMPILER_TEMP ) ;
                    List_Push_1Value_Node ( compiler->PostfixLists, postfixList, COMPILER_TEMP ) ;
                    List_DropN ( compiler->WordList, 1 ) ; // the operator; let higher level see the variable for optimization
                    return ;
                }
            }
        }
        else if ( nextWord && ( nextWord->CAttribute & ( PARAMETER_VARIABLE | LOCAL_VARIABLE | NAMESPACE_VARIABLE ) ) ) // prefix
        {
            //List_DropN ( compiler->WordList, 1 ) ; // the operator; let higher level see the variable
            //_Interpreter_DoWord ( cntx->Interpreter0, nextWord, - 1 ) ;
            //_Compiler_CopyDuplicatesAndPush ( compiler, currentWord ) ; // the operator
            //_Interpreter_DoWord ( cntx->Interpreter0, currentWord, - 1 ) ;
            //_Compile_GetVarLitObj_RValue_To_Reg ( nextWord, R8D ) ;
            if ( String_Equal ( currentWord->Name, "++" ) ) op = INC ;
            else op = DEC ;
            if ( nextWord->CAttribute & ( PARAMETER_VARIABLE | LOCAL_VARIABLE ) )
            {
                _Compile_Group5 ( op, MEM, FP, 0, LocalVarIndex_WordDisp ( nextWord ), 0 ) ;
            }
            else // crash ; FIXME!!
            {
                //_Compile_GetVarLitObj_RValue_To_Reg ( nextWord, R8D ) ;
                _Compile_Move_Literal_Immediate_To_Reg ( THRU_REG, ( int64 ) nextWord->W_PtrToValue ) ;
                Compile_Move_Rm_To_Reg ( ACC, THRU_REG, 0 ) ;
                _Compile_Group5 ( op, REG, ACC, 0, 0, 0 ) ;
                Compile_Move_Reg_To_Rm ( THRU_REG, ACC, 0 ) ;

            }
            //_Word_CompileAndRecord_PushReg ( nextWord, R8D ) ;
            return ;
        }
        else
        {
            if ( GetState ( compiler, C_INFIX_EQUAL ) )
            {
                if ( ! GetState ( compiler, INFIX_LIST_INTERPRET ) ) // new logic test ??
                {
                    int64 i ;
                    Word * word ;
                    dllist * postfixList = List_New ( ) ;
                    List_Push_1Value_Node ( postfixList, currentWord, COMPILER_TEMP ) ; // remember : this will be lifo
                    for ( i = 1 ; word = _Compiler_WordList ( compiler, i ), ( word->CAttribute & ( CATEGORY_OP_ORDERED | CATEGORY_OP_UNORDERED | CATEGORY_OP_DIVIDE | CATEGORY_OP_EQUAL ) ) ; i ++ ) ;
                    List_Push_1Value_Node ( postfixList, _Compiler_WordList ( compiler, i ), COMPILER_TEMP ) ;
                    List_Push_1Value_Node ( compiler->PostfixLists, postfixList, COMPILER_TEMP ) ;
                    List_DropN ( compiler->WordList, 1 ) ; // the operator; let higher level see the variable for optimization
                    return ;
                }
            }
        }
    }
    _CfrTil_Do_IncDec ( op ) ;
    SetState ( _Debugger_, DEBUG_SHTL_OFF, false ) ;
}

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
        Compile_Group1_X_OpEqual ( _Context_->Compiler0, ADD ) ;
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
        Compile_Group1_X_OpEqual ( _Context_->Compiler0, SUB ) ;
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
        Compile_MultiplyEqual ( _Context_->Compiler0 ) ;
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
        Compile_DivideEqual ( _Context_->Compiler0 ) ;
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
        Compile_X_Group1 ( _Context_->Compiler0, SUB, ZERO_TTT, NZ ) ;
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

int64
_CFib ( int64 n )
{
    if ( n < 2 ) return n ;

    else return ( _CFib ( n - 1 ) + _CFib ( n - 2 ) ) ;
}

void
CFib ( )
{

    TOS = ( _CFib ( TOS ) ) ;
}

void
CfrTil_Power ( ) // **
{
    int64 pow = _Dsp_ [ 0 ], base = _Dsp_ [ - 1 ], n ;
    for ( n = base ; -- pow ; )
    {

        n *= base ;
    }
    _Dsp_ [ - 1 ] = n ;
    DataStack_Drop ( ) ;
}

void
CFactorial ( )
{
    int64 n = TOS ;
    if ( n > 1 )
    {
        TOS = TOS - 1 ;
        CFactorial ( ) ;
        TOS *= n ;
    }

    else TOS = 1 ;
}

int64
_CFactorial ( int64 n )
{
    if ( n > 1 ) return ( n * _CFactorial ( n - 1 ) ) ;

    else return 1 ;
}

void
CFactorial2 ( )
{

    TOS = ( _CFactorial ( TOS ) ) ;
}

void
CFactorial3 ( void )
{
    int64 rec1 = 1, n = TOS ;
    while ( n > 1 )
    {

        rec1 *= n -- ;
    }
    TOS = rec1 ;
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