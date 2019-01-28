#include "../../include/cfrtil64.h"
// a combinator can be thought of as a finite state machine that
// operates on a stack or more theoretically as a finite state control
// for a pda/turing machine but more simply as a function on a stack to
// a stack like a forth word but the items on the stack can be taken,
// depending on the combinator, as subroutine calls. The idea comes from, for me, 
// Foundations of Mathematical Logic by Haskell Curry and the joy
// and factor programming languages. It works out
// to be an intuitive idea ; you may not need to understand it, but you can
// see how it works. It simplifies syntax beyond Forth because
// it reduces the number of necessary prefix operators to one - tick ("'") = quote.

// nb : can't fully optimize if there is code between blocks
// check if there is any code between blocks if so we can't optimize fully

void
CfrTil_EndCombinator ( int64 quotesUsed, int64 moveFlag )
{
    Compiler * compiler = _Context_->Compiler0 ;
    BlockInfo *bi = ( BlockInfo * ) _Stack_Pick ( compiler->CombinatorBlockInfoStack, quotesUsed - 1 ) ; // -1 : remember - stack is zero based ; stack[0] is top
    //
    compiler->BreakPoint = Here ;
    _CfrTil_InstallGotoCallPoints_Keyed ( ( BlockInfo* ) bi, GI_CONTINUE | GI_BREAK ) ;
    bi->CombinatorEndsAt = Here ;
    if ( moveFlag && Compiling ) BI_Block_Copy ( bi, bi->OriginalActualCodeStart,
        bi->CombinatorStartsAt, bi->CombinatorEndsAt - bi->CombinatorStartsAt, 0 ) ; // 0 : can't generally peephole optimize (arrayTest.cft problems) ??
    //_CfrTil_InstallGotoCallPoints_Keyed ( ( BlockInfo* ) bi, GI_GOTO | GI_RETURN | GI_RECURSE ) ; // done in a final EndBlock not here
    _Stack_DropN ( compiler->CombinatorBlockInfoStack, quotesUsed ) ;
    if ( GetState ( compiler, LISP_COMBINATOR_MODE ) )
    {
        _Stack_Pop ( compiler->CombinatorInfoStack ) ;
        if ( ! Stack_Depth ( compiler->CombinatorInfoStack ) ) SetState ( compiler, LISP_COMBINATOR_MODE, false ) ;
    }
    //Compiler_WordStack_SCHCPUSCA( 0, 0 ) ;
}

// Combinators are first created after the original code using 'Here' in CfrTil_BeginCombinator 
// then copied into the original code locations at EndCombinator

BlockInfo *
CfrTil_BeginCombinator ( int64 quotesUsed )
{
    Compiler * compiler = _Context_->Compiler0 ;
    BlockInfo *bi = ( BlockInfo * ) _Stack_Pick ( compiler->CombinatorBlockInfoStack, quotesUsed - 1 ) ; // -1 : remember - stack is zero based ; stack[0] is top
    //_NBA_SetCompilingSpace_MakeSureOfRoom ( _Q_->MemorySpace0->CodeSpace, 8 * K ) ;
    // optimize out jmps such that the jmp from first block is to Here the start of the combinator code
    bi->CombinatorStartsAt = Here ;
    _SetOffsetForCallOrJump ( bi->JumpOffset, bi->CombinatorStartsAt ) ;
    return bi ;
}

// ( q -- )

void
CfrTil_DropBlock ( )
{
    //block dropBlock = ( block ) TOS ;
    DataStack_DropN ( 1 ) ;
    if ( CompileMode )
    {
        CfrTil_BeginCombinator ( 1 ) ;
        //Block_CopyCompile ( ( byte* ) dropBlock, 0, 0 ) ; // in case there are control labels
        CfrTil_EndCombinator ( 1, 0 ) ;
    }
}

void
CfrTil_BlockRun ( )
{
    block doBlock = ( block ) TOS ;
    DataStack_DropN ( 1 ) ;
    if ( CompileMode )
    {
        CfrTil_BeginCombinator ( 1 ) ;
        Block_CopyCompile ( ( byte* ) doBlock, 0, 0 ) ;
        CfrTil_EndCombinator ( 1, 1 ) ; // 0 : don't copy
    }
    else
    {
        DEBUG_SETUP_ADDRESS ( (byte*) doBlock, 1 ) ;
        Block_Eval ( doBlock ) ;
        //Set_DataStackPointer_FromDspReg ( ) ;
    }
}

// ( q -- )

void
CfrTil_LoopCombinator ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    block loopBlock = ( block ) TOS ;
    DataStack_DropN ( 1 ) ;
    if ( CompileMode )
    {
        CfrTil_BeginCombinator ( 1 ) ;
        byte * start = Here ;
        compiler->ContinuePoint = start ;
        Block_CopyCompile ( ( byte* ) loopBlock, 0, 0 ) ;
        _Compile_JumpToAddress ( start ) ;
        CfrTil_EndCombinator ( 1, 1 ) ;
    }
    else
    {
        while ( 1 ) Block_Eval ( loopBlock ) ;
    }
}

// ( q q -- )

int64
CfrTil_WhileCombinator ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    block testBlock = ( block ) _Dsp_ [ - 1 ], trueBlock = ( block ) TOS ;
    DataStack_DropN ( 2 ) ;
    if ( CompileMode )
    {
        CfrTil_BeginCombinator ( 2 ) ;
        byte * start = Here ;
        compiler->ContinuePoint = Here ;
        d0 ( if ( Is_DebugModeOn ) Compiler_SC_WordList_Show ( ( byte* ) "\nCheckOptimize : after optimize :", 0, 0 ) ) ;
        Block_CopyCompile ( ( byte* ) testBlock, 1, 1 ) ;
        Block_CopyCompile ( ( byte* ) trueBlock, 0, 0 ) ;
        _Compile_JumpToAddress ( start ) ;
        CfrTil_CalculateAndSetPreviousJmpOffset_ToHere ( ) ;
        CfrTil_EndCombinator ( 2, 1 ) ;
    }
    else
    {
        while ( 1 )
        {
            Block_Eval ( testBlock ) ;
            if ( ! DataStack_Pop ( ) ) break ;
            Block_Eval ( trueBlock ) ;
        }
    }
    return 1 ;
}

int64
CfrTil_DoWhileCombinator ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    block testBlock = ( block ) TOS, doBlock = ( block ) _Dsp_ [ - 1 ] ;
    DataStack_DropN ( 2 ) ;
    if ( CompileMode )
    {
        CfrTil_BeginCombinator ( 2 ) ;
        byte * start = Here ;
        compiler->ContinuePoint = Here ;
        Block_CopyCompile ( ( byte* ) doBlock, 1, 0 ) ;
        Block_CopyCompile ( ( byte* ) testBlock, 0, 1 ) ;
        _Compile_JumpToAddress ( start ) ;
        CfrTil_CalculateAndSetPreviousJmpOffset_ToHere ( ) ;
        CfrTil_EndCombinator ( 2, 1 ) ;
    }
    else
    {
        do
        {
            Block_Eval ( doBlock ) ;
            Block_Eval ( testBlock ) ;
            if ( ! DataStack_Pop ( ) ) break ;
        }
        while ( 1 ) ;
    }
    return 1 ;
}

// ( b q -- ) 

void
CfrTil_If1Combinator ( )
{
    block doBlock = ( block ) DataStack_Pop ( ) ;
    if ( CompileMode )
    {
        //DBI_ON ;
        BlockInfo * bi = CfrTil_BeginCombinator ( 1 ) ;
        Compile_BlockLogicTest ( bi ) ;
        _Compile_UninitializedJumpEqualZero ( ) ;
        Stack_Push_PointerToJmpOffset ( ) ;
        Block_CopyCompile ( ( byte* ) doBlock, 0, 0 ) ;
        CfrTil_CalculateAndSetPreviousJmpOffset_ToHere ( ) ;
        CfrTil_EndCombinator ( 1, 1 ) ;
        //DBI_OFF ;
    }
    else
    {
        if ( DataStack_Pop ( ) ) Block_Eval ( doBlock ) ;
    }
}

// ( q q -- )

void
CfrTil_If2Combinator ( )
{
    block testBlock = ( block ) _Dsp_ [ - 1 ], doBlock = ( block ) TOS ;
    DataStack_DropN ( 2 ) ;
    if ( CompileMode )
    {
        CfrTil_BeginCombinator ( 2 ) ;
        Block_CopyCompile ( ( byte* ) testBlock, 1, 1 ) ;
        Block_CopyCompile ( ( byte* ) doBlock, 0, 0 ) ;
        CfrTil_CalculateAndSetPreviousJmpOffset_ToHere ( ) ;
        CfrTil_EndCombinator ( 2, 1 ) ;
    }
    else
    {
        Block_Eval ( testBlock ) ;
        if ( DataStack_Pop ( ) ) Block_Eval ( doBlock ) ;
    }
}

// ( b q q -- )
// takes 2 blocks
// nb. does not drop the boolean so it can be used in a block which takes a boolean - an on the fly combinator

void
CfrTil_TrueFalseCombinator2 ( )
{
    int64 testCondition = _Dsp_ [ - 2 ] ;
    block trueBlock = ( block ) _Dsp_ [ - 1 ], falseBlock = ( block ) TOS ;
    DataStack_DropN ( 2 ) ;
    if ( CompileMode )
    {
        BlockInfo * bi = CfrTil_BeginCombinator ( 2 ) ;
        Compile_BlockLogicTest ( bi ) ;
        _Compile_UninitializedJumpEqualZero ( ) ;
        Stack_Push_PointerToJmpOffset ( ) ;
        Block_CopyCompile ( ( byte* ) trueBlock, 1, 0 ) ;
        CfrTil_CalculateAndSetPreviousJmpOffset_ToHere ( ) ;
        Block_CopyCompile ( ( byte* ) falseBlock, 0, 0 ) ;
        CfrTil_EndIf ( ) ;
        CfrTil_EndCombinator ( 2, 1 ) ;
    }
    else
    {
        if ( testCondition ) Block_Eval ( trueBlock ) ;
        else Block_Eval ( falseBlock ) ;
    }
}

// ( q q q -- )
// takes 3 blocks

void
CfrTil_TrueFalseCombinator3 ( )
{
    block testBlock = ( block ) Dsp ( 2 ), trueBlock = ( block ) Dsp ( 1 ), falseBlock = ( block ) Dsp ( 0 ) ;
    DataStack_DropN ( 3 ) ;
    if ( CompileMode )
    {
        CfrTil_BeginCombinator ( 3 ) ;
        Block_CopyCompile ( ( byte* ) testBlock, 2, 1 ) ;
        Block_CopyCompile ( ( byte* ) trueBlock, 1, 0 ) ;
        CfrTil_Else ( ) ;
        Block_CopyCompile ( ( byte* ) falseBlock, 0, 0 ) ;
        CfrTil_EndIf ( ) ;
        CfrTil_EndCombinator ( 3, 1 ) ;
    }
    else
    {
        Block_Eval ( testBlock ) ;
        if ( DataStack_Pop ( ) ) Block_Eval ( trueBlock ) ;
        else Block_Eval ( falseBlock ) ;
    }
}

//  ( q q q -- )

inline void
CfrTil_IfElseCombinator ( )
{
    CfrTil_TrueFalseCombinator3 ( ) ;
}

inline void
CfrTil_If3Combinator ( )
{
    CfrTil_TrueFalseCombinator3 ( ) ;
}

void
CfrTil_DoWhileDoCombinator ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    block testBlock = ( block ) _Dsp_ [ - 1 ], doBlock2 = ( block ) TOS, doBlock1 =
        ( block ) _Dsp_ [ - 2 ] ;
    byte * start ;
    DataStack_DropN ( 3 ) ;
    if ( CompileMode )
    {
        CfrTil_BeginCombinator ( 3 ) ;
        compiler->ContinuePoint = Here ;
        start = Here ;
        Block_CopyCompile ( ( byte* ) doBlock1, 2, 0 ) ;

        Block_CopyCompile ( ( byte* ) testBlock, 1, 1 ) ;

        Block_CopyCompile ( ( byte* ) doBlock2, 0, 0 ) ;
        _Compile_JumpToAddress ( start ) ; // runtime
        CfrTil_CalculateAndSetPreviousJmpOffset_ToHere ( ) ;
        CfrTil_EndCombinator ( 3, 1 ) ;
    }
    else
    {
        do
        {
            Block_Eval ( doBlock1 ) ;
            Block_Eval ( testBlock ) ;
            if ( ! DataStack_Pop ( ) ) break ;
            Block_Eval ( doBlock2 ) ;
        }
        while ( 1 ) ;
    }
}

// ( q q q q -- )

void
CfrTil_ForCombinator ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    block doBlock = ( block ) TOS, doPostBlock = ( block ) _Dsp_ [ - 1 ],
        testBlock = ( block ) _Dsp_ [ - 2 ], doPreBlock = ( block ) _Dsp_ [ - 3 ] ;
    DataStack_DropN ( 4 ) ;
    if ( CompileMode )
    {
        CfrTil_BeginCombinator ( 4 ) ;
        Block_CopyCompile ( ( byte* ) doPreBlock, 3, 0 ) ;

        byte * start = Here ;

        Block_CopyCompile ( ( byte* ) testBlock, 2, 1 ) ; // 1 : jccFlag for this block

        compiler->ContinuePoint = Here ;

        Block_CopyCompile ( ( byte* ) doBlock, 0, 0 ) ;

        d0 ( Compiler_SC_WordList_Show ( ( byte* ) "for combinator : before doPostBlock", 0, 0 ) ) ;
        Block_CopyCompile ( ( byte* ) doPostBlock, 1, 0 ) ;

        _Compile_JumpToAddress ( start ) ;
        CfrTil_CalculateAndSetPreviousJmpOffset_ToHere ( ) ;

        CfrTil_EndCombinator ( 4, 1 ) ;
    }
    else
    {
        Block_Eval ( doPreBlock ) ;
        do
        {
            Block_Eval ( testBlock ) ;
            if ( ! DataStack_Pop ( ) )
                break ;
            Block_Eval ( doBlock ) ;
            Block_Eval ( doPostBlock ) ;
        }
        while ( 1 ) ;
    }
}

