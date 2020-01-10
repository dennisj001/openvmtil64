#include "../../include/cfrtil64.h"

ListObject *
_LO_Eval (LambdaCalculus * lc, ListObject *l0, ListObject *locals, Boolean applyFlag )
{
    //d1 ( if ( _Is_DebugOn ) LO_PrintWithValue ( l0 ) ) ;
    SetState ( lc, LC_EVAL, true ) ;
    if ( l0 && ( ! LO_IsQuoted ( l0 ) ) )
    {
        if ( l0->LAttribute & T_LISP_SYMBOL ) l0 = _LO_EvalSymbol (lc, l0, locals ) ;
        else if ( l0->LAttribute & ( LIST | LIST_NODE ) ) l0 = LO_EvalList (lc, l0, locals, applyFlag ) ;
    }
    SetState ( lc, LC_EVAL, false ) ;
    //d1 ( if ( _Is_DebugOn ) LO_PrintWithValue ( l0 ) ) ;
    return l0 ;
}

ListObject *
LO_EvalList (LambdaCalculus * lc, ListObject *l0, ListObject *locals, Boolean applyFlag )
{
    ListObject *lfunction, *largs, *lfirst ;
    if ( CompileMode )
    {
        LO_CheckEndBlock ( ) ;
        LO_CheckBeginBlock ( ) ;
    }
    lc->ParenLevel ++ ;
    lfirst = _LO_First ( l0 ) ;
    if ( lfirst )
    {
        if ( lfirst->LAttribute & ( T_LISP_SPECIAL | T_LISP_MACRO ) )
        {
            if ( LO_IsQuoted ( lfirst ) ) return lfirst ;
            l0 = LO_SpecialFunction (lc, l0, locals ) ;
            lc->ParenLevel -- ;
        }
        else
        {
            lfunction = LO_CopyOne ( _LO_Eval (lc, lfirst, locals, applyFlag ) ) ;
            largs = _LO_EvalList (lc, _LO_Next ( lfirst ), locals, applyFlag ) ;
            l0 = LO_Apply (lc, l0, lfirst, lfunction, largs, applyFlag ) ;
        }
    }
    //if ( Is_DebugOn ) Compiler_SC_WordList_Show ( 0, 0, 0 ) ;
    return l0 ;
}

ListObject *
_LO_EvalSymbol (LambdaCalculus * lc, ListObject *l0, ListObject *locals )
{
    Compiler *compiler = _Context_->Compiler0 ;
    Word *w ;
    w = LC_FindWord ( l0->Name, locals ) ;
    if ( l0 && ( ( ! LO_IsQuoted ( l0 ) ) && w ) )
    {
        if ( w->LAttribute & T_LC_DEFINE ) l0 = ( ListObject * ) w->Lo_Value ; // created by define
        else if ( w->CAttribute & ( CPRIMITIVE | CFRTIL_WORD | LOCAL_VARIABLE | PARAMETER_VARIABLE | T_LISP_COMPILED_WORD ) )
        {
            l0->Lo_Value = w->W_Value ;
            l0->Lo_CfrTilWord = w ;
            l0->CAttribute |= w->CAttribute ;
            l0->CAttribute2 |= w->CAttribute2 ;
            l0->LAttribute |= w->LAttribute ;
        }
        else 
        {
            w->W_SC_Index = l0->W_SC_Index ;
            w->W_RL_Index = l0->W_RL_Index ;
            l0 = w ;
        }
        if ( ( CompileMode ) && LO_CheckBeginBlock ( ) ) _LO_CompileOrInterpret_One ( l0, 0 ) ;
        if ( w->CAttribute & COMBINATOR )
        {
            SetState ( compiler, LISP_COMBINATOR_MODE, true ) ;
            CombinatorInfo ci ; // remember sizeof of CombinatorInfo = 4 bytes
            ci.BlockLevel = Compiler_BlockLevel ( compiler ) ; //compiler->BlockLevel ;
            ci.ParenLevel = lc->ParenLevel ;
            _Stack_Push ( compiler->CombinatorInfoStack, ( int64 ) ci.CI_i32_Info ) ; // this stack idea works because we can only be in one combinator at a time
        }
    }
    return l0 ;
}

ListObject *
_LO_EvalList (LambdaCalculus * lc, ListObject *lorig, ListObject *locals, Boolean applyFlag )
{
    ListObject *lnew = 0, *lnode, *lnext, *lce ;
    if ( lorig )
    {
        lnew = LO_New ( LIST, 0 ) ;
        for ( lnode = lorig ; lnode ; lnode = lnext ) //_LO_Next ( lnode ) ) // eval each node
        {
            lnext = _LO_Next ( lnode ) ;
            // research : why doesn't this work without copy ? copying here wastes time and memory!!
            //d1 ( if ( _Is_DebugOn ) _LO_PrintWithValue ( lnode, "\n_LO_EvalList : lnode ", "" ) ) ;
            lce = LO_CopyOne ( _LO_Eval (lc, lnode, locals, applyFlag ) ) ;
            LO_AddToTail ( lnew, lce ) ;
        }
    }
    return lnew ;
}

