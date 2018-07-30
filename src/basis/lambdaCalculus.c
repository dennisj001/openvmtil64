
#include "../include/cfrtil64.h"
//LambdaCalculus * _Q_->OVT_LC ;
// --------------------------------------------------------
// LC  : an abstract core of a prefix language related to Lambda Calculus with list objects
//       (it seems neither lisp nor scheme as they exist meet my more abstract intent so it's "Lambda Calculus")
// LO  : ListObject
// nb. : a Word is a ListObject is a Namespace is a DObject 
//     : a ListObject is a Word is a Namespace is a DObject 
// ---------------------------------------------------------

// lisp type lists can maybe be thought of as not rpn - not reverse polish notation, 
// not postfix but prefix - cambridge polish/prefix notation blocks

// sections  
// _LO_Eval
// _LO_Apply 
// _LO_Read 
// _LO_Print
// _LO_SpecialFunctions
// LO_Repl
// LO_...misc : _L0_New _L0_Copy
// LC_x

//===================================================================================================================
//| LO_Eval
//===================================================================================================================
// #define EVAL(x)         (isNum(x)? x : isSym(x)? val(x) : evList(x)) // picolisp
#define LispAllocType LISP_TEMP
#define LO_IsQuoted( l0 ) (( l0->State & QUOTED ) || ( ( l0->State & QUASIQUOTED ) && (! ( l0->State & (UNQUOTED|UNQUOTE_SPLICE) ) ) ) ) //( ! ( l0->State & ( QUOTED | QUASIQUOTED ) )  || (l1->State & UNQUOTED) ) )
#define LO_Last( lo ) (ListObject*) dllist_Last ( (dllist*) lo->Lo_List )
#define LO_Previous( lo ) ( ListObject* ) dlnode_Previous ( ( dlnode* ) lo )
#define LO_Next( lo ) ( ListObject* ) dlnode_Next ( ( dlnode* ) lo )
#define LO_AddToTail( lo, lo1 ) dllist_AddNodeToTail ( (( ListObject * ) lo)->Lo_List, ( dlnode* ) (lo1) ) 
#define _LO_AddToTail( lo, lo1 ) dlnode_InsertThisBeforeANode ( (node*) lo1, ((node*)(lo))->tail ) ; 
#define LO_AddToHead( lo, lo1 ) dllist_AddNodeToHead ( (( ListObject * ) lo)->Lo_List, ( dlnode* ) (lo1) ) 
#define LO_New( lType, object ) (ListObject *) _DataObject_New (T_LC_NEW, 0, 0, 0, 0, lType, 0, (int64) object, 0, 0 , -1)
#define LambdaArgs( proc ) proc->p[0]
#define LambdaProcedureBody( proc ) proc->p[1]
#define LambdaVals( proc ) proc->p[2]
#define LO_ReplaceNode( node, anode) dlnode_Replace ( (dlnode *) node, (dlnode *) anode ) 
#define LO_PrintWithValue( l0 ) _Printf ( (byte*) "%s", _LO_PrintListToString ( (ListObject *) l0 , 0, 0, 1 ) ) 
#define _LO_PRINT_TO_STRING(l0) _LO_PrintListToString ( ( ListObject * ) l0, 0, 0, 0 )
#define _LO_PRINT_TO_STRING_WITH_VALUE(l0) _LO_PrintListToString ( ( ListObject * ) l0, 0, 0, 1 )
#define LC_Print( l0 ) LO_PrintWithValue ( l0 ) 
#define LO_CopyTemp( l0 ) _LO_Copy ( l0, LispAllocType )
#define LO_Copy( l0 ) _LO_Copy ( l0, LISP )
#define LO_CopyOne( l0 ) _LO_AllocCopyOne ( l0, LispAllocType )
#define LO_Eval( l0 ) _LO_Eval ( l0, 0, 1 )
#define nil (_Q_->OVT_LC ? _Q_->OVT_LC->Nil : 0)
#define LC_SaveStackPointer( lc ) { if ( lc ) lc->SaveStackPointer = (int64*) _Dsp_ ; }
#define LC_RestoreStackPointer( lc ) _LC_ResetStack ( lc ) //{ if ( lc && lc->SaveStackPointer ) Dsp = lc->SaveStackPointer ; }

ListObject *
_LO_Eval ( ListObject * l0, ListObject * locals, int64 applyFlag )
{
    Compiler * compiler = _Context_->Compiler0 ;
    LambdaCalculus * lc = _Q_->OVT_LC ;
    ListObject *lfunction = 0, *largs, *lfirst ;
    Word * w ;
    SetState ( lc, LC_EVAL, true ) ;
    d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 2, 0, ( byte* ) "\n_LO_Eval : entering : l0 = %s : locals = %s : applyFlag = %d", c_gd ( _LO_PRINT_TO_STRING ( l0 ) ), locals ? _LO_PRINT_TO_STRING ( locals ) : ( byte* ) "", applyFlag ) ) ;
start:

    if ( l0 )
    {
        if ( LO_IsQuoted ( l0 ) ) goto done ;
        else if ( ( l0->LAttribute & T_LISP_SYMBOL ) )
        {
            w = _LO_FindWord ( l0, l0->Name, locals ) ;
            if ( w )
            {
                //if ( w->LAttribute & ( T_STRING | T_RAW_STRING ) ) l0 = w ; else 
                if ( w->LAttribute & T_LISP_DEFINE ) // after macro because a macro is also a define
                {
                    l0 = ( ListObject * ) w->Lo_Value ; // created by define
                }
                else if ( w->CAttribute & ( CPRIMITIVE | CFRTIL_WORD | LOCAL_VARIABLE | PARAMETER_VARIABLE | T_LISP_COMPILED_WORD ) )
                {
                    //if ( ! lc->DontCopyFlag ) l0 = LO_CopyOne ( l0 ) ;
                    l0->Lo_Value = w->W_Value ;
                    l0->Lo_CfrTilWord = w ;
                    l0->CAttribute |= w->CAttribute ;
                    l0->CAttribute2 |= w->CAttribute2 ;
                    l0->LAttribute |= w->LAttribute ;
                }
                else
                {
                    l0 = w ;
                }
                if ( CompileMode )
                {
                    // this maybe could be improved to be a list-block ?!?
                    if ( LO_CheckBeginBlock ( ) )
                    {
                        _LO_CompileOrInterpret_One ( l0 ) ;
                    }
                }
                if ( w->CAttribute & COMBINATOR )
                {
                    SetState ( compiler, LISP_COMBINATOR_MODE, true ) ;
                    CombinatorInfo ci ; // remember sizeof of CombinatorInfo = 4 bytes
                    ci.BlockLevel = Compiler_BlockLevel ( compiler ) ; //compiler->BlockLevel ;
                    ci.ParenLevel = lc->LispParenLevel ;
                    _Stack_Push ( compiler->CombinatorInfoStack, ( int64 ) ci.CI_i32_Info ) ; // this stack idea works because we can only be in one combinator at a time
                }
            }
        }
        else if ( l0->LAttribute & ( LIST | LIST_NODE ) )
        {
            if ( CompileMode )
            {
                LO_CheckEndBlock ( ) ;
                LO_CheckBeginBlock ( ) ;
            }
            lc->LispParenLevel ++ ;
            lfirst = _LO_First ( l0 ) ;
            if ( lfirst )
            {
                if ( lfirst->LAttribute & ( T_LISP_SPECIAL | T_LISP_MACRO ) )
                {
                    if ( LO_IsQuoted ( lfirst ) )
                    {
                        l0 = lfirst ;
                        goto done ;
                    }
                    d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 0, 0, ( byte* ) "\n_LO_Eval : before LO_SpecialFunction : l0 = %s : locals = %s", c_gd ( _LO_PRINT_TO_STRING ( l0 ) ), c_gd ( _LO_PRINT_TO_STRING ( locals ) ) ) ) ;
                    l0 = LO_SpecialFunction ( l0, locals ) ;
                    d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 0, 0, ( byte* ) "\n_LO_Eval : after LO_SpecialFunction : l0 = %s : locals = %s", c_gd ( _LO_PRINT_TO_STRING ( l0 ) ), c_gd ( _LO_PRINT_TO_STRING ( locals ) ) ) ) ;
                    lc->LispParenLevel -- ;
                    goto done ;
                }
                lfunction = LO_CopyOne ( _LO_Eval ( lfirst, locals, applyFlag ) ) ;
                largs = _LO_EvalList ( _LO_Next ( lfirst ), locals, applyFlag ) ;
                if ( applyFlag && lfunction && ( ( lfunction->CAttribute & ( CPRIMITIVE | CFRTIL_WORD ) ) || ( lfunction->LAttribute & ( T_LISP_COMPILED_WORD ) ) ) )
                {
                    l0 = _LO_Apply ( l0, lfunction, largs ) ;
                }
                else if ( lfunction && ( lfunction->LAttribute & T_LAMBDA ) && lfunction->Lo_LambdaFunctionBody )
                    //else if ( lfunction && (( lfunction->LAttribute & T_LAMBDA )||(lfunction->LAttribute & T_LISP_COMPILED_WORD) ) && lfunction->Lo_LambdaFunctionBody )
                {
                    locals = largs ;
                    // LambdaArgs, the formal args, are not changed by LO_Substitute (locals - lvals are just essentially 'renamed') and thus don't need to be copied
                    LO_Substitute ( _LO_First ( ( ListObject * ) lfunction->Lo_LambdaFunctionParameters ), _LO_First ( locals ) ) ;
                    lc->CurrentLambdaFunction = lfunction ;
                    //if ( (lfunction->LAttribute & T_LISP_COMPILED_WORD)) (( void (*)())lfunction->W_Value)() ;
                    //else 
                    l0 = ( ListObject * ) lfunction->Lo_LambdaFunctionBody ;
                    goto start ;
                }
                else
                {
                    //these cases seems common sense for what these situations should mean and seem to add something positive to the usual lisp/scheme semantics !?
                    if ( ! largs )
                    {
                        l0 = lfunction ;
                        lc->LispParenLevel -- ;
                        if ( CompileMode )
                        {
                            if ( _LO_CheckBegunBlock ( ) )
                            {
                                _LO_CompileOrInterpret_One ( l0 ) ;
                                LO_CheckEndBlock ( ) ;
                                goto done ;
                            }
                        }
                    }
                    else if ( ( lfirst->LAttribute & ( T_LISP_SPECIAL ) || lc->CurrentLambdaFunction ) ) // CurrentLambdaFunction : if lambda or T_LISP_SPECIAL returns a list 
                    {
                        d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 0, 0, ( byte* ) "\n_LO_Eval : lfirst->LAttribute & ( T_LISP_SPECIAL ) : before LO_AddToHead : l0 = %s : largs = %s : lfunction = %s",
                            c_gd ( _LO_PRINT_TO_STRING ( l0 ) ), c_gd ( _LO_PRINT_TO_STRING ( largs ) ), c_gd ( _LO_PRINT_TO_STRING ( lfunction ) ) ) ) ;
                        LO_AddToHead ( largs, lfunction ) ;
                        d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 0, 0, ( byte* ) "\n_LO_Eval : lfirst->LAttribute & ( T_LISP_SPECIAL ) : after LO_AddToHead : l0 = %s : largs = %s : lfunction = %s",
                            c_gd ( _LO_PRINT_TO_STRING ( l0 ) ), c_gd ( _LO_PRINT_TO_STRING ( largs ) ), c_gd ( _LO_PRINT_TO_STRING ( lfunction ) ) ) ) ;
                        l0 = largs ;
                    }
                    SetState ( lc, LC_COMPILE_MODE, false ) ;
                    goto done ;
                }
            }
        }
    }
done:
    SetState ( lc, LC_EVAL, false ) ;
    return l0 ;
}

ListObject *
_LO_Read ( )
{
    Context * cntx = _Context_ ;
    Lexer * lexer = cntx->Lexer0 ;
    ListObject *l0, *lreturn, *lnew ;
    Word * word ;
    byte * token, *token1 ;
    int64 scwi ;
    LambdaCalculus * lc = LC_New ( ) ;
    lnew = lc->LispParenLevel ? LO_New ( LIST, 0 ) : 0 ;
    lreturn = lnew ;
    SetState ( lc, LC_READ, true ) ;
    d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 2, 0, ( byte* ) "\nEntering _LO_Read..." ) ) ;
    do
    {
next:
        token = _Lexer_ReadToken ( lexer, ( byte* ) " ,\n\r\t" ) ;
        if ( Lexer_IsTokenQualifiedID ( lexer ) ) SetState ( cntx, CONTEXT_PARSING_QID, true ) ;
        else SetState ( cntx, CONTEXT_PARSING_QID, false ) ;
        int64 qidFlag = GetState ( cntx, CONTEXT_PARSING_QID ) ;
        if ( token )
        {
            if ( String_Equal ( ( char* ) token, ( byte * ) "/*" ) ) CfrTil_ParenthesisComment ( ) ;
            else if ( String_Equal ( ( char* ) token, ( byte * ) "//" ) ) CfrTil_CommentToEndOfLine ( ) ;
            else if ( String_Equal ( ( char* ) token, ( byte * ) "(" ) )
            {
                Stack_Push ( _Q_->OVT_LC->QuoteStateStack, _Q_->OVT_LC->QuoteState ) ;
                _Q_->OVT_LC->QuoteState = _Q_->OVT_LC->ItemQuoteState ;
                lc->LispParenLevel ++ ;
                l0 = _LO_Read ( ) ;
                SetState ( lc, LC_READ, true ) ;
                d0 ( if ( Is_DebugOn ) LO_PrintWithValue ( l0 ) ) ;
                l0 = LO_New ( LIST_NODE, l0 ) ;
                d0 ( if ( Is_DebugOn ) LO_PrintWithValue ( l0 ) ) ;
                _Q_->OVT_LC->QuoteState = Stack_Pop ( _Q_->OVT_LC->QuoteStateStack ) ;
            }
            else if ( String_Equal ( ( char* ) token, ( byte * ) ")" ) )
            {
                lc->LispParenLevel -- ;
                break ;
            }
            else
            {
                scwi = _Lexer_->SC_Index ;
                if ( qidFlag ) SetState ( cntx->Finder0, QID, true ) ;
                word = _LO_FindWord ( 0, token, 0 ) ;
                if ( qidFlag ) SetState ( cntx->Finder0, QID, false ) ;
                if ( word ) //&& ( ! GetState ( _Q_->OVT_LC, LC_READ_LAMBDA_LOCALS ) ) )
                {
                    word->W_RL_Index = lexer->TokenStart_ReadLineIndex ;
                    DEBUG_SETUP ( word ) ;
                    if ( qidFlag ) SetState ( word, QID, true ) ;
                    else SetState ( word, QID, false ) ;
                    l0 = 0 ;
                    if ( ( word->LAttribute & ( T_LISP_READ_MACRO | T_LISP_IMMEDIATE ) ) && ( ! GetState ( _Q_->OVT_LC, LC_READ_MACRO_OFF ) ) )
                    {
                        Word_Eval ( word ) ;
                        if ( word->LAttribute & T_LISP_SPECIAL )
                        {
                            l0 = _DataObject_New ( T_LC_NEW, word, 0, word->CAttribute, word->CAttribute2,
                                T_LISP_SYMBOL | word->LAttribute, 0, word->Lo_Value, 0, - 1, scwi ) ;
                        }
                        else goto next ;
                    }
                    else if ( word->LAttribute & T_LISP_TERMINATING_MACRO )
                    {
                        SetState ( _Q_->OVT_LC, ( LC_READ ), false ) ; // let the value be pushed in this case because we need to pop it below
                        Word_Eval ( word ) ;
                        token1 = ( byte* ) DataStack_Pop ( ) ;
                        SetState ( _Q_->OVT_LC, ( LC_READ ), true ) ;
                        l0 = _DataObject_New ( T_LC_LITERAL, 0, token1, LITERAL, word->CAttribute2, word->LAttribute, 0, 0, 0, - 1, scwi ) ;
                    }
                    else
                    {
                        if ( word->CAttribute & NAMESPACE_TYPE ) _DataObject_Run ( word ) ;
                        l0 = _DataObject_New ( T_LC_NEW, word, 0, word->CAttribute, word->CAttribute2,
                            ( T_LISP_SYMBOL | word->LAttribute ), 0, word->Lo_Value, 0, - 1, scwi ) ;
                    }
                }
                else
                {
                    Lexer_ParseObject ( lexer, token ) ;
                    l0 = _DataObject_New ( T_LC_LITERAL, 0, token, 0, 0, 0, qidFlag, 0, 0, - 1, scwi ) ;
                }
            }
            l0->W_SC_Index = scwi ;
            d1 ( if ( Is_DebugOn ) _Printf ( ( byte* ) "\n_LO_Read : \'%s\' scwi = %d", l0->Name, scwi ) ) ;
            if ( qidFlag ) SetState ( l0, QID, true ) ;
            l0->State |= ( _Q_->OVT_LC->ItemQuoteState | _Q_->OVT_LC->QuoteState ) ;
            if ( ( l0->State & SPLICE ) || ( ( l0->State & UNQUOTE_SPLICE ) && ( ! ( l0->State & QUOTED ) ) ) )
            {
                l0 = LO_Eval ( LO_CopyTemp ( l0 ) ) ;
                if ( lnew )
                {
                    LO_SpliceAtTail ( lnew, l0 ) ;
                }
                else
                {
                    lreturn = l0 ;
                    break ;
                }
            }
            else if ( lnew )
            {
                LO_AddToTail ( lnew, l0 ) ;
                d0 ( if ( Is_DebugOn ) LO_PrintWithValue ( lnew ) ) ;
            }
            else
            {
                lreturn = l0 ;
                break ;
            }
        }
        else return nil ; //Error ( "\n_LO_Read : Syntax error : no token?\n", QUIT ) ;
        _Q_->OVT_LC->ItemQuoteState = 0 ;
    }
    while ( lc->LispParenLevel ) ;
    SetState ( lc, LC_READ, false ) ;
    SetState ( cntx->Finder0, QID, false ) ;
    if ( ( ! lc->LispParenLevel ) && ( ! GetState ( _Compiler_, LC_ARG_PARSING ) ) ) LC_FinishSourceCode ( ) ;
    d0 ( if ( Is_DebugOn ) LO_PrintWithValue ( lreturn ) ) ;
    return lreturn ;
}

// for calling 'C' functions such as printf or other system functions
// where the arguments are pushed first from the end of the list like 'C' arguments

ListObject *
_LO_Apply ( ListObject * l0, ListObject * lfunction, ListObject * ldata )
{
    LambdaCalculus * lc = _Q_->OVT_LC ;

    if ( GetState ( lc, LC_DEFINE_MODE ) && ( ! CompileMode ) ) return l0 ;
    SetState ( lc, LC_APPLY, true ) ;
    ListObject * lfdata = _LO_First ( ldata ), *vReturn ;
    d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 1, 0, ( byte* ) "\n_LO_Apply : \n\tl0 =%s", _LO_PRINT_TO_STRING ( l0 ) ) ) ;
    if ( lfunction->LAttribute & LIST_FUNCTION ) return ( ( ListFunction ) lfunction->Lo_CfrTilWord->Definition ) ( l0 ) ;
    else if ( lfunction->CAttribute & CFRTIL_WORD ) // this case is hypothetical for now
    {
        if ( lfunction->LAttribute & T_LISP_CFRTIL_COMPILED )
        {
            _Interpreter_DoWord ( _Context_->Interpreter0, lfunction->Lo_CfrTilWord, lfunction->W_RL_Index, lfunction->W_SC_Index ) ;
            vReturn = nil ;
        }
        else
        {
            vReturn = _LO_Do_FunctionDataBlock ( lfunction, lfdata ) ;
        }
    }
    else if ( lfdata )
    {
        vReturn = _LO_Do_FunctionDataBlock ( lfunction, lfdata ) ;
    }
    else
    {
        lc->LispParenLevel -- ;
        if ( CompileMode ) LO_CheckEndBlock ( ) ;
        SetState ( lc, LC_COMPILE_MODE, false ) ;
        vReturn = lfunction ;
    }
    SetState ( lc, LC_APPLY, false ) ;
    //l0->W_Value = (int64) vReturn ; // this seems the right place for vReturn instead of the stack
    return vReturn ;
}

// subst : lisp 1.5
// set the value of the lambda parameters to the function call values - a beta reduction in the lambda calculus 

void
LO_Substitute ( ListObject *lambdaParameters, ListObject * funcCallValues )
{
    while ( lambdaParameters && funcCallValues )
    {
        // ?!? this may not be the right idea but we want it so that we can have transparent lists in the parameters, ie. 
        // no affect with a parenthesized list or just unparaenthesized parameters of the same number
        if ( lambdaParameters->LAttribute & ( LIST | LIST_NODE ) )
        {
            if ( funcCallValues->LAttribute & ( LIST | LIST_NODE ) ) funcCallValues = _LO_First ( funcCallValues ) ;
            //else Error ( "\nLO_Substitute : funcCallValues list structure doesn't match parameter list", QUIT ) ;
            lambdaParameters = _LO_First ( lambdaParameters ) ; // can something like this work
        }
        else if ( funcCallValues->LAttribute & ( LIST | LIST_NODE ) )
        {
            if ( lambdaParameters->LAttribute & ( LIST | LIST_NODE ) ) lambdaParameters = _LO_First ( lambdaParameters ) ; // can something like this work
            //else Error ( "\nLO_Substitute : funcCallValues list structure doesn't match parameter list", QUIT ) ;
            funcCallValues = _LO_First ( funcCallValues ) ;
        }
        // just preserve the name of the arg for the finder
        // so we now have the call values with the parameter names - parameter names are unchanged 
        // so when we eval/print these parameter names they will have the function calling values -- lambda calculus substitution - beta reduction
        funcCallValues->Lo_Name = lambdaParameters->Lo_Name ;
        lambdaParameters = _LO_Next ( lambdaParameters ) ;
        funcCallValues = _LO_Next ( funcCallValues ) ;
    }
}

ListObject *
_LO_EvalList ( ListObject * lorig, ListObject * locals, int64 applyFlag )
{
    ListObject * lnew = 0, *lnode, *lnext, *lce ;
    if ( lorig )
    {
        lnew = LO_New ( LIST, 0 ) ;
        for ( lnode = lorig ; lnode ; lnode = lnext ) //_LO_Next ( lnode ) ) // eval each node
        {
            lnext = _LO_Next ( lnode ) ;
            // research : why doesn't this work without copy ? copying here wastes time and memory!!
            lce = LO_CopyOne ( _LO_Eval ( lnode, locals, applyFlag ) ) ;
            d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 0, 0, ( byte* ) "\n_LO_EvalList before LO_AddToTail : lec = %s : lnew = %s", c_gd ( _LO_PRINT_TO_STRING ( lce ) ), c_gd ( _LO_PRINT_TO_STRING ( lnew ) ) ) ) ;
            _LO_AddToTail ( lnew, lce ) ;
            d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 0, 0, ( byte* ) "\n_LO_EvalList after LO_AddToTail : lec = %s : lnew = %s", c_gd ( _LO_PRINT_TO_STRING ( lce ) ), c_gd ( _LO_PRINT_TO_STRING ( lnew ) ) ) ) ;
        }
    }
    return lnew ;
}

void
_Interpreter_LC_InterpretWord ( Interpreter * interp, ListObject * l0, Word * word )
{
    Lexer * lexer = _Context_->Lexer0 ;
    if ( ! word ) word = l0 ;
    //else word->W_RL_Index = l0->W_RL_Index ;
    int64 tsrli = l0->W_RL_Index ;
    int64 scwi = l0->W_SC_Index ;
    if ( word->W_RL_Index == lexer->TokenStart_ReadLineIndex ) SetState ( _Debugger_, DEBUG_SHTL_OFF, true ) ;
    _Interpreter_DoWord ( interp, word, tsrli, scwi ) ;
    SetState ( _Debugger_, DEBUG_SHTL_OFF, false ) ;
}

void
_LO_CompileOrInterpret_One ( ListObject * l0 )
{
    Context * cntx = _Context_ ;
    // just interpret the non-nil, non-list objects
    // nil means that it doesn't need to be interpreted any more
    if ( l0 && ( ! ( l0->LAttribute & ( LIST | LIST_NODE | T_NIL ) ) ) ) _Interpreter_LC_InterpretWord ( cntx->Interpreter0, l0, l0->Lo_CfrTilWord ) ;
}

void
_LO_CompileOrInterpret ( ListObject * lfunction, ListObject * ldata )
{
    ListObject * lfword = lfunction->Lo_CfrTilWord ;
    if ( ldata && lfword && ( lfword->CAttribute & ( CATEGORY_OP_ORDERED | CATEGORY_OP_UNORDERED ) ) ) // ?!!? 2 arg op with multi-args : this is not a precise distinction yet : need more types ?!!? 
    {
        _LO_CompileOrInterpret_One ( ldata ) ;
        while ( ( ldata = _LO_Next ( ldata ) ) )
        {
            _LO_CompileOrInterpret_One ( ldata ) ; // two args first then op, then after each arg the operator : nb. assumes word can take unlimited args 2 at a time
            _LO_CompileOrInterpret_One ( lfword ) ;
        }
    }
    else
    {
        for ( ; ldata ; ldata = _LO_Next ( ldata ) )
        {
            if ( GetState ( _Q_->OVT_LC, LC_INTERP_DONE ) ) return ;
            _LO_CompileOrInterpret_One ( ldata ) ; // research : how does CAttribute get set to T_NIL?
        }
        if ( lfword && ( ! ( lfword->CAttribute2 & LISP_CFRTIL ) ) ) _LO_CompileOrInterpret_One ( lfword ) ; // ( ! ( lfword->CAttribute & LISP_CFRTIL ) ) : don't do it twice (see above)
    }
    _Q_->OVT_LC->LastInterpretedWord = lfword ;
}

ListObject *
_LO_Do_FunctionDataBlock ( ListObject * lfunction, ListObject * lfdata )
{
    LambdaCalculus * lc = _Q_->OVT_LC ;
    ListObject *vReturn ;

    _LO_CompileOrInterpret ( lfunction, lfdata ) ;
    lc->LispParenLevel -- ;
    // this is necessary in "lisp" mode : eg. if user hits return but needs to be clarified, refactored, maybe renamed, etc.    
    if ( ! GetState ( lc, LC_INTERP_DONE ) )
    {
        if ( CompileMode ) LO_CheckEndBlock ( ) ;
        vReturn = LO_PrepareReturnObject ( ) ;
    }
    else
    {
        vReturn = nil ;
    }
    return vReturn ;
}

//===================================================================================================================
//| LO_SpecialFunction(s) 
//===================================================================================================================

ListObject *
_LO_Define ( ListObject * idNode, ListObject * locals )
{
    LambdaCalculus * lc = _Q_->OVT_LC ;
    ListObject *value0, *value, *l1 ;
    Word * word = idNode->Lo_CfrTilWord ;
    CfrTil_WordList_RecycleInit ( _CfrTil_, word, 0, 1, 1 ) ;
    word->Definition = 0 ; // reset the definition from LO_Read
    value0 = _LO_Next ( idNode ) ;
    _CfrTil_->CurrentWordCompiling = word ;
    word->Lo_CfrTilWord = word ;
    SetState ( lc, ( LC_DEFINE_MODE ), true ) ;
    Namespace_DoAddWord ( lc->LispNamespace, word ) ; // put it at the beginning of the list to be found first
    word->CAttribute = NAMESPACE_VARIABLE ; // nb. !
    value = _LO_Eval ( value0, locals, 0 ) ; // 0 : don't apply
    if ( value && ( value->LAttribute & T_LAMBDA ) )
    {
        value->Lo_LambdaFunctionParameters = _LO_Copy ( value->Lo_LambdaFunctionParameters, LISP ) ;
        value->Lo_LambdaFunctionBody = _LO_Copy ( value->Lo_LambdaFunctionBody, LISP ) ;
    }
    else value = LO_Copy ( value ) ; // this value object should now become part of LISP non temporary memory
    word->Lo_Value = ( uint64 ) value ; // used by eval
    word->LAttribute |= ( T_LISP_DEFINE | T_LISP_SYMBOL ) ;
    word->State |= LC_DEFINED ;
    // the value was entered into the LISP memory, now we need a temporary carrier for LO_Print
    l1 = _DataObject_New ( T_LC_NEW, word, 0, word->CAttribute, word->CAttribute2, word->LAttribute, 0, ( int64 ) value, 0, - 1, - 1 ) ; // all words are symbols
    l1->LAttribute |= ( T_LISP_DEFINE | T_LISP_SYMBOL ) ;
    SetState ( lc, ( LC_DEFINE_MODE ), false ) ;
    l1->W_SourceCode = word->W_SourceCode = lc->LC_SourceCode ;
    _Word_Finish ( l1 ) ;
    Compiler_Init ( _Context_->Compiler0, 0 ) ; // we could be compiling a cfrTil word as in oldLisp.cft

    CfrTil_NewLine ( ) ;
    return l1 ;
}

ListObject *
_LO_MakeLambda ( ListObject * l0 )
{
    ListObject *args, *body, *word, *lnew, *body0 ;
    // allow args to be optionally an actual parenthesized list or just vars after the lambda
    if ( GetState ( _Q_->OVT_LC, LC_DEFINE_MODE ) ) word = _CfrTil_->CurrentWordCompiling ;
    else word = _Word_New ( ( byte* ) "<lambda>", WORD_CREATE, 0, 0, 0, 0, DICTIONARY ) ; // don't _Word_Add : must *not* be "lambda" else it will wrongly replace the lambda T_SPECIAL_FUNCTION word in LO_Find
    args = l0 ;
    body0 = _LO_Next ( l0 ) ;
    if ( args->LAttribute & ( LIST | LIST_NODE ) ) args = _LO_Copy ( args, LispAllocType ) ;
    else
    {
        lnew = LO_New ( LIST, 0 ) ;
        do
        {
            _LO_AddToTail ( lnew, _LO_CopyOne ( args, LispAllocType ) ) ;
        }
        while ( ( args = _LO_Next ( args ) ) != body0 ) ;
        args = lnew ;
    }
    if ( ( body0->LAttribute & ( LIST | LIST_NODE ) ) ) body = _LO_Copy ( body0, LispAllocType ) ;
    else
    {
        lnew = LO_New ( LIST, 0 ) ;
        LO_AddToTail ( lnew, _LO_CopyOne ( body0, LispAllocType ) ) ;
        body = lnew ;
    }
    if ( GetState ( _Q_->OVT_LC, LC_COMPILE_MODE ) )
    {
        SetState ( _Q_->OVT_LC, LC_LAMBDA_MODE, true ) ;
        block codeBlk = CompileLispBlock ( args, body ) ;
        //word->LAttribute |= T_LISP_COMPILED_WORD ;
        //word->W_Value = ( uint64 ) codeBlk ;
        *word->W_PtrToValue = ( uint64 ) codeBlk ;
        //word->Lo_LambdaFunctionBody = body ;
    }
    if ( ! GetState ( _Q_->OVT_LC, LC_COMPILE_MODE ) ) // nb! this needs to be 'if' not 'else' or else if' because the state is sometimes changed by CompileLispBlock, eg. for function parameters
    {
        word->Lo_CfrTilWord = word ;
        word->Lo_LambdaFunctionParameters = args ;
        word->Lo_LambdaFunctionBody = body ;
        word->LAttribute |= T_LAMBDA | T_LISP_SYMBOL ;
        word->CAttribute = 0 ;
    }
    return word ;
}

ListObject *
LO_SpecialFunction ( ListObject * l0, ListObject * locals )
{
    ListObject * lfirst, *macro = 0 ;
    if ( lfirst = _LO_First ( l0 ) )
    {
        while ( lfirst && ( lfirst->LAttribute & T_LISP_MACRO ) )
        {
            d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 0, 0, ( byte* ) "\nLO_SpecialFunction : macro eval before : l0 = %s : locals = %s", c_gd ( _LO_PRINT_TO_STRING ( l0 ) ), locals ? _LO_PRINT_TO_STRING ( locals ) : ( byte* ) "" ) ) ;
            macro = lfirst ;
            macro->LAttribute &= ~ T_LISP_MACRO ; // prevent short recursive loop calling of this function thru LO_Eval below
            l0 = _LO_Eval ( l0, locals, 1 ) ;
            macro->LAttribute |= T_LISP_MACRO ; // restore to its true type
            lfirst = _LO_First ( l0 ) ;
            macro = 0 ;
            d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 0, 0, ( byte* ) "\nLO_SpecialFunction : macro eval after : l0 = %s : locals = %s", c_gd ( _LO_PRINT_TO_STRING ( l0 ) ), locals ? _LO_PRINT_TO_STRING ( locals ) : ( byte* ) "" ) ) ;
        }
        if ( lfirst && lfirst->Lo_CfrTilWord && IS_MORPHISM_TYPE ( lfirst->Lo_CfrTilWord ) ) //->Definition )
        {
            l0 = ( ( LispFunction2 ) ( lfirst->Lo_CfrTilWord->Definition ) ) ( lfirst, locals ) ; // non macro special functions here
        }
        else
        {
            d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 0, 0, ( byte* ) "\nLO_SpecialFunction : final eval before : l0 = %s : locals = %s", c_gd ( _LO_PRINT_TO_STRING ( l0 ) ), locals ? _LO_PRINT_TO_STRING ( locals ) : ( byte* ) "nil" ) ) ;
            l0 = _LO_Eval ( l0, locals, 1 ) ;
            d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 0, 0, ( byte* ) "\nLO_SpecialFunction : final eval after : l0 = %s : locals = %s", c_gd ( _LO_PRINT_TO_STRING ( l0 ) ), locals ? _LO_PRINT_TO_STRING ( locals ) : ( byte* ) "nil" ) ) ;
        }
    }
    return l0 ;
}

//
// nb. we must not use the word as the ListObject because it is on its own namespace list
// so we create a new ListObject with a pointer to the word for its values/properties

// can we just use the 'word' instead of this

//===================================================================================================================
//| _LO_Read 
//===================================================================================================================

// remember a Word is a ListObject 

ListObject *
_LO_New_RawStringOrLiteral ( Lexer * lexer, byte * token, int64 qidFlag )
{
    if ( GetState ( lexer, KNOWN_OBJECT ) )
    {
        uint64 ctokenType = qidFlag ? OBJECT : lexer->TokenType | LITERAL ;
        Word * word = _DObject_New ( lexer->OriginalToken, lexer->Literal, ( ctokenType | IMMEDIATE | LITERAL ), 0, ctokenType, ctokenType,
            ( byte* ) _DataObject_Run, 0, 0, 0, 0 ) ;
        word->W_RL_Index = lexer->TokenStart_ReadLineIndex ;
        if ( ( ! qidFlag ) && ( lexer->TokenType & ( T_RAW_STRING ) ) )
        {
            // nb. we don't want to do this block with literals it slows down the eval and is wrong
            word->LAttribute |= ( T_LISP_SYMBOL | T_RAW_STRING ) ;
            _Namespace_DoAddWord ( _Q_->OVT_LC->LispTemporariesNamespace, word, 0 ) ; // nb. here not in _DObject_New :: only for ( ! qidFlag ) && ( lexer->TokenType & T_RAW_STRING ) 
            word->Lo_Value = ( int64 ) word->Lo_Name ;
        }
        word->Lo_CfrTilWord = word ;
        if ( qidFlag ) word->CAttribute &= ~ T_LISP_SYMBOL ;
        return word ;
    }
    else
    {
        _Printf ( ( byte* ) "\n%s ?\n", ( char* ) token ) ;
        CfrTil_Exception ( NOT_A_KNOWN_OBJECT, 0, QUIT ) ;
        return 0 ;
    }
}

ListObject *
_LO_New ( uint64 ltype, uint64 ctype, uint64 ctype2, byte * value, Word * word, uint64 allocType, int64 rl_Index, int64 scwi )
{
    scwi = ( scwi != - 1 ) ? scwi : _Lexer_->SC_Index ;
    //_DObject_New ( byte * name, uint64 value, uint64 ctype, uint64 ltype, uint64 ftype, byte * function, int64 arg, int64 addToInNs, Namespace * addToNs, uint64 allocType )
    ListObject * l0 = _DObject_New ( word ? word->Name : ( byte* ) "", ( uint64 ) value, ctype, ctype2, ltype,
        ( ltype & T_LISP_SYMBOL ) ? word ? word->RunType : 0 : 0, 0, 0, 0, 0, allocType ) ;
    if ( ltype & LIST ) _LO_ListInit ( l0, allocType ) ;
    else if ( ltype & LIST_NODE ) l0->S_SymbolList = ( dllist* ) value ;
    if ( word )
    {
        l0->Lo_CfrTilWord = word ;
        word->Lo_CfrTilWord = word ;
        l0->W_RL_Index = rl_Index ;
        l0->W_SourceCode = word->W_SourceCode ;
        l0->W_SC_Index = word->W_SC_Index = scwi ;
    }
    return l0 ;
}

void
LO_Quote ( )
{
    if ( _Q_->OVT_LC ) _Q_->OVT_LC->ItemQuoteState |= QUOTED ;
    else Lexer_CheckMacroRepl ( _Context_->Lexer0 ) ;
}

void
LO_QuasiQuote ( )
{
    if ( _Q_->OVT_LC ) _Q_->OVT_LC->ItemQuoteState |= QUASIQUOTED ;
    else Lexer_CheckMacroRepl ( _Context_->Lexer0 ) ;
}

void
LO_UnQuoteSplicing ( )
{
    _Q_->OVT_LC->ItemQuoteState |= UNQUOTE_SPLICE ;
}

void
LO_Splice ( )
{
    _Q_->OVT_LC->ItemQuoteState |= SPLICE ;
}

void
LO_UnQuote ( )
{
    _Q_->OVT_LC->ItemQuoteState |= UNQUOTED ;
}

void
LO_SpliceAtTail ( ListObject * lnew, ListObject * l0 )
{
    if ( lnew )
    {
        for ( l0 = _LO_First ( l0 ) ; l0 ; l0 = _LO_Next ( l0 ) )
        {
            _LO_AddToTail ( lnew, LO_CopyOne ( l0 ) ) ;
        }
    }
}

//===================================================================================================================
//| _LO_Apply 
//===================================================================================================================

ListObject *
LO_PrepareReturnObject ( )
{
    uint64 type = 0 ;
    byte * name ;
    if ( ! CompileMode )
    {
        Namespace * ns = _CfrTil_InNamespace ( ) ;
        name = ns->Name ;
        if ( Namespace_IsUsing ( "BigNum" ) ) type = T_BIG_NUM ;
        return _DataObject_New ( T_LC_NEW, 0, 0, LITERAL | type, 0, LITERAL | type, 0, DataStack_Pop ( ), 0, 0, - 1 ) ;
    }
    else return nil ;
}

void
LO_BeginBlock ( )
{
    if ( ! Compiler_BlockLevel ( _Compiler_ ) ) _Q_->OVT_LC->SavedCodeSpace = _Q_CodeByteArray ;
    CfrTil_BeginBlock ( ) ;
}

void
LO_EndBlock ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    if ( _Q_->OVT_LC && _Q_->OVT_LC->SavedCodeSpace )
    {
        BlockInfo * bi = ( BlockInfo * ) _Stack_Top ( compiler->BlockStack ) ;
        CfrTil_EndBlock ( ) ;
        if ( ! GetState ( _Q_->OVT_LC, LC_COMPILE_MODE ) )
        {
            CfrTil_BlockRun ( ) ;
        }
        if ( ! Compiler_BlockLevel ( compiler ) ) Set_CompilerSpace ( _Q_->OVT_LC->SavedCodeSpace ) ;
        bi->LogicCodeWord = _Q_->OVT_LC->LastInterpretedWord ;
    }
}

void
LO_CheckEndBlock ( )
{
    LambdaCalculus * lc = _Q_->OVT_LC ;
    Compiler * compiler = _Context_->Compiler0 ;
    if ( GetState ( compiler, LISP_COMBINATOR_MODE ) )
    {
        int64 cii = _Stack_Top ( compiler->CombinatorInfoStack ) ;
        CombinatorInfo ci ; // remember sizeof of CombinatorInfo = 4 bytes
        ci.CI_i32_Info = cii ;
        if ( ( lc->LispParenLevel == ci.ParenLevel ) && ( Compiler_BlockLevel ( compiler ) > ci.BlockLevel ) )
        {
            LO_EndBlock ( ) ;
        }
    }
}

int64
_LO_CheckBeginBlock ( )
{
    LambdaCalculus * lc = _Q_->OVT_LC ;
    Compiler * compiler = _Context_->Compiler0 ;
    int64 cii = _Stack_Top ( compiler->CombinatorInfoStack ) ;
    CombinatorInfo ci ; // remember sizeof of CombinatorInfo = 4 bytes
    ci.CI_i32_Info = cii ;
    if ( ( GetState ( compiler, LISP_COMBINATOR_MODE ) ) && ( lc->LispParenLevel == ci.ParenLevel ) && ( Compiler_BlockLevel ( compiler ) == ci.BlockLevel ) )
    {
        return true ;
    }
    return false ;
}

int32
_LO_CheckBegunBlock ( )
{
    LambdaCalculus * lc = _Q_->OVT_LC ;
    Compiler * compiler = _Context_->Compiler0 ;
    int32 cii = _Stack_Top ( compiler->CombinatorInfoStack ) ;
    CombinatorInfo ci ; // remember sizeof of CombinatorInfo = 4 bytes
    ci.CI_i32_Info = cii ;
    if ( ( GetState ( compiler, LISP_COMBINATOR_MODE ) ) && ( lc->LispParenLevel == ci.ParenLevel ) && ( Compiler_BlockLevel ( compiler ) > ci.BlockLevel ) )
    {
        return true ;
    }
    return false ;
}

int64
LO_CheckBeginBlock ( )
{
    if ( _LO_CheckBeginBlock ( ) )
    {
        LO_BeginBlock ( ) ;
        return true ;
    }
    return false ;
}

int64
_LO_Apply_Arg ( ListObject ** pl1, int64 i )
{
    Context * cntx = _Context_ ;
    ListObject *l1 = * pl1, * l2 ;
    Word * word = l1 ;

    Set_CompileMode ( true ) ;
    if ( l1->LAttribute & ( LIST | LIST_NODE ) )
    {
        // ?needs :: Compiler_CopyDuplicatesAndPush somewhere
        Set_CompileMode ( false ) ;
        l2 = LO_Eval ( l1 ) ;
        _Debugger_->PreHere = Here ;
        if ( ! l2 || ( l2->LAttribute & T_NIL ) )
        {
            Compile_MoveImm_To_Reg ( RegOrder ( i ++ ), DataStack_Pop ( ), CELL_SIZE ) ;
        }
        else
        {
            Compile_MoveImm_To_Reg ( RegOrder ( i ++ ), ( int64 ) * l2->Lo_PtrToValue, CELL_SIZE ) ;
        }
        _DEBUG_SHOW ( l2, 1 ) ;
    }
    else if ( ( l1->CAttribute & NON_MORPHISM_TYPE ) ) // and literals, etc.
    {
        word = l1->Lo_CfrTilWord ;
        word = Compiler_CopyDuplicatesAndPush ( word ) ;
        word->W_SC_Index = l1->W_SC_Index ;
        byte * here = Here ;
        Word_Eval ( word ) ; // ?? move value directly to RegOrder reg
        Word *baseObject = _Interpreter_->BaseObject ;
        if ( ( word->Name[0] == '\"' ) || ( ! _Lexer_IsTokenForwardDotted ( cntx->Lexer0, l1->W_RL_Index + Strlen ( word->Name ) - 1 ) ) ) // ( word->Name[0] == '\"' ) : sometimes strings have ".[]" chars within but are still just strings
        {
            if ( word->StackPushRegisterCode ) SetHere (word->StackPushRegisterCode, 1) ;
            else if ( baseObject && baseObject->StackPushRegisterCode ) SetHere (baseObject->StackPushRegisterCode, 1) ;
            Compile_Move_Reg_To_Reg ( RegOrder ( i ++ ), ACC ) ;
            if ( baseObject ) _Debugger_->PreHere = baseObject->Coding ;
            SetState ( cntx, ADDRESS_OF_MODE, false ) ;
            _Debugger_->PreHere = here ;
            _DEBUG_SHOW ( word, 1 ) ;
        }
    }
    else if ( ( l1->Name [0] == '.' ) || ( l1->Name [0] == '&' ) )
    {
        _Interpreter_DoWord ( cntx->Interpreter0, l1->Lo_CfrTilWord, l1->W_RL_Index, l1->W_SC_Index ) ;
    }
    else if ( ( l1->Name[0] == '[' ) )
    {
        // nb! this block is just CfrTil_ArrayBegin in arrays.c -- refactor??
        // ?needs :: Compiler_CopyDuplicatesAndPush somewhere
        Interpreter * interp = _Context_->Interpreter0 ;
        Word * arrayBaseObject = ( ( Word * ) ( LO_Previous ( l1 ) ) )->Lo_CfrTilWord ;
        Word *baseObject = interp->BaseObject ;
        if ( arrayBaseObject )
        {
            Compiler *compiler = _Context_->Compiler0 ;
            int64 objSize = 0, increment = 0, variableFlag ;
            int64 svcm = GetState ( compiler, COMPILE_MODE ) ;
            if ( ( ! arrayBaseObject->ArrayDimensions ) ) CfrTil_Exception ( ARRAY_DIMENSION_ERROR, 0, QUIT ) ;
            if ( interp->CurrentObjectNamespace ) objSize = interp->CurrentObjectNamespace->Size ; //_CfrTil_VariableValueGet ( _Context_->Interpreter0->CurrentClassField, ( byte* ) "size" ) ; 
            if ( ! objSize )
            {
                CfrTil_Exception ( OBJECT_SIZE_ERROR, 0, QUIT ) ;
            }
            variableFlag = _CheckArrayDimensionForVariables_And_UpdateCompilerState ( ) ;
            _WordList_Pop ( _CfrTil_->CompilerWordList, 0 ) ; // pop the initial '['
            do
            {
                word = l1 ;
                byte * token = word->Name ;
                if ( Do_NextArrayWordToken ( word, token, arrayBaseObject, objSize, svcm, &variableFlag ) ) break ;
            }
            while ( l1 = LO_Next ( l1 ) ) ;
            *pl1 = l1 ;
            compiler->ArrayEnds = 0 ; // reset for next array word in the current word being compiled
            interp->BaseObject = baseObject ; //arrayBaseObject ; // nb. : _Context_->Interpreter0->baseObject is reset by the interpreter by the types of words between array brackets
            if ( CompileMode )
            {
                if ( ! variableFlag )
                {
                    SetHere (baseObject->Coding, 1) ;
                    _Compile_GetVarLitObj_LValue_To_Reg ( baseObject, ACC ) ;
                    _Word_CompileAndRecord_PushReg ( baseObject, ACC ) ;
                }
                if ( Is_DebugModeOn ) Word_PrintOffset ( word, increment, baseObject->AccumulatedOffset ) ;
                if ( baseObject->StackPushRegisterCode ) SetHere (baseObject->StackPushRegisterCode, 1) ;
                Compile_Move_Reg_To_Reg ( RegOrder ( i ++ ), ACC ) ;
                _Debugger_->PreHere = baseObject->Coding ;
                _DEBUG_SHOW ( baseObject, 1 ) ;
            }
            interp->BaseObject = 0 ;
        }
    }
    else
    {
        word = Compiler_CopyDuplicatesAndPush ( word ) ;
        _DEBUG_SETUP ( word, 1 ) ;
        Compile_MoveImm_To_Reg ( RegOrder ( i ++ ), DataStack_Pop ( ), CELL_SIZE ) ;
        _DEBUG_SHOW ( word, 1 ) ;
    }
done:
    _Debugger_->PreHere = Here ;
    return i ;
}
// for calling 'C' functions such as printf or other system functions
// where the arguments are pushed first from the end of the list like 'C' arguments
// this is a little confusing : the args are LO_Read left to Right for C we want them right to left except qid word which remain left to right

ListObject *
_LO_Apply_ArgList ( ListObject * l0, Word * word )
{
    Context * cntx = _Context_ ;
    ListObject *l1 ;
    ByteArray * scs = _Q_CodeByteArray ;
    Compiler * compiler = cntx->Compiler0 ;
    int64 i, svcm = CompileMode ;

    d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 2, 0, ( byte* ) "\nEntering _LO_Apply_ArgList..." ) ) ;
    if ( l0 )
    {
        Set_CompileMode ( true ) ;
        if ( ! svcm )
        {
            CfrTil_BeginBlock ( ) ;
        }
        if ( word->CAttribute & ( DLSYM_WORD | C_PREFIX ) ) Set_CompileMode ( true ) ;
        _Debugger_->PreHere = Here ;
        for ( i = 0, l1 = _LO_First ( l0 ) ; l1 ; l1 = LO_Next ( l1 ) ) i = _LO_Apply_Arg ( &l1, i ) ;
        Set_CompileMode ( true ) ;
        _Debugger_->PreHere = Here ;
        Word_SetCoding (word, Here , 1) ;
        word->W_SC_Index = l0->W_SC_Index ;
        word = Compiler_CopyDuplicatesAndPush ( word ) ;
        cntx->CurrentlyRunningWord = word ;
        if ( ( String_Equal ( word->Name, "printf" ) || ( String_Equal ( word->Name, "sprintf" ) ) ) )
        {
            Compile_MoveImm_To_Reg ( RAX, 0, CELL ) ; // for printf ?? others //System V ABI : "%rax is used to indicate the number of vector arguments passed to a function requiring a variable number of arguments"
        }
        Word_SetCodingHere_And_ClearPreviousUseOf_This_SCA (word, 0) ;
        Word_Eval ( word ) ;
        if ( word->CAttribute2 & RAX_RETURN ) _Word_CompileAndRecord_PushReg ( word, ACC ) ;
        if ( ! svcm )
        {
            CfrTil_EndBlock ( ) ;
            Set_CompileMode ( svcm ) ;
            Set_CompilerSpace ( scs ) ;
            _DEBUG_SETUP ( word, 1 ) ;
            CfrTil_BlockRun ( ) ;
        }
        d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 2, 0, ( byte* ) "\nLeaving _LO_Apply_ArgList..." ) ) ;
        SetState ( compiler, LC_ARG_PARSING, false ) ;
    }
    return nil ;
}

ListObject *
_LO_Apply_C_LtoR_ArgList ( ListObject * l0, Word * word )
{
    _LO_Apply_ArgList ( l0, word ) ;
}

void
LC_CompileRun_C_ArgList ( Word * word ) // C protocol - x64 : left to right arguments put into registers 
{
    LambdaCalculus * lc = _LC_New ( 1 ) ;
    Context * cntx = _Context_ ;
    Lexer * lexer = cntx->Lexer0 ;
    Compiler * compiler = cntx->Compiler0 ;
    byte *svDelimiters = lexer->TokenDelimiters ;
    ListObject * l0 ;
    byte * token = _Lexer_ReadToken ( lexer, ( byte* ) " ,;\n\r\t" ) ;
    if ( word->CAttribute & ( C_PREFIX | C_PREFIX_RTL_ARGS ) )
    {
        if ( ( ! token ) || strcmp ( "(", ( char* ) token ) ) Error ( "", "Syntax error : C RTL Args : no '('", ABORT ) ; // should be '('
    }
    lc->LispParenLevel = 1 ;
    if ( word->CAttribute & ( C_PREFIX | C_PREFIX_RTL_ARGS ) )
    {
        SetState ( compiler, LC_ARG_PARSING, true ) ;
        int64 svcm = CompileMode ;
        Set_CompileMode ( false ) ; // we must have the arguments pushed and not compiled for _LO_Apply_C_Rtl_ArgList which will compile them for a C_Rtl function
        LC_SaveStackPointer ( lc ) ; // ?!? maybe we should do this stuff differently
        DebugShow_Off ;
        l0 = _LO_Read ( ) ;
        DebugShow_On ;
        Set_CompileMode ( svcm ) ; // we must have the arguments pushed and not compiled for _LO_Apply_C_Rtl_ArgList which will compile them for a C_Rtl function
        _LO_Apply_ArgList ( l0, word ) ;
        LC_RestoreStackPointer ( lc ) ; // ?!? maybe we should do this stuff differently
        LC_Clear ( 1 ) ;
        SetState ( compiler, LC_ARG_PARSING | LC_C_RTL_ARG_PARSING, false ) ;
    }
    Lexer_SetTokenDelimiters ( lexer, svDelimiters, COMPILER_TEMP ) ;
}

// assumes list contains only one application 

block
CompileLispBlock ( ListObject *args, ListObject * body )
{
    LambdaCalculus * lc = _Q_->OVT_LC ;
    block code ;
    byte * here = Here ;
    Word * word = _CfrTil_->CurrentWordCompiling ;
    LO_BeginBlock ( ) ; // must have a block before local variables if there are register variables because _CfrTil_Parse_LocalsAndStackVariables will compile something
    Namespace * locals = _CfrTil_Parse_LocalsAndStackVariables ( 1, 1, args, 0, 0 ) ;
    word->CAttribute = BLOCK ;
    word->LAttribute |= T_LISP_COMPILED_WORD ;
    SetState ( lc, ( LC_COMPILE_MODE | LC_BLOCK_COMPILE ), true ) ;
    _LO_Eval ( body, locals, 1 ) ;
    if ( GetState ( lc, LC_COMPILE_MODE ) )
    {
        LO_EndBlock ( ) ;
        code = ( block ) DataStack_Pop ( ) ;
    }
    else // nb. LISP_COMPILE_MODE : this state can change with some functions that can't be compiled yet
    {
        SetHere (here, 1) ; //recover the unused code space
        code = 0 ;
        word->LAttribute &= ~ T_LISP_COMPILED_WORD ;
        if ( _Q_->Verbosity > 1 )
        {
            AlertColors ;
            _Printf ( ( byte* ) "\nLisp can not compile this word yet : %s : -- interpreting ...\n ", _Word_SourceCodeLocation_pbyte ( word ) ) ;
            DefaultColors ;
        }
    }
    _Word_DefinitionStore ( word, ( block ) code ) ; // not _Word_InitFinal because this is already _CfrTil_->CurrentWordCompiling with W_SourceCode, etc.
    return code ;
}

//===================================================================================================================
//| LO_Print
//===================================================================================================================

byte *
_LO_PrintOneToString ( ListObject * l0, byte * buffer, int64 in_a_LambdaFlag, int64 printValueFlag )
{
    byte * format ;
    byte * buffer2 ;
    if ( ! buffer )
    {
        buffer = _CfrTil_->LispPrintBuffer ;
        buffer [0] = 0 ;
    }
    if ( l0 )
    {
        if ( l0->LAttribute & ( LIST | LIST_NODE ) )
        {
            byte * buffer2 = Buffer_New_pbyte ( BUFFER_SIZE ) ;
            _LO_PrintListToString ( l0, buffer2, in_a_LambdaFlag, printValueFlag ) ;
            if ( ! LO_strcat ( buffer, buffer2 ) ) return buffer ;
        }
        else if ( ( l0 == nil ) || ( l0->LAttribute == T_NIL ) )
        {
            if ( _AtCommandLine ( ) )
            {
                snprintf ( ( char* ) buffer, BUFFER_SIZE, " nil" ) ;
            }
        }
        else if ( l0->LAttribute == true )
        {
            if ( _AtCommandLine ( ) )
            {
                snprintf ( ( char* ) buffer, BUFFER_SIZE, " T" ) ;
            }
        }
            //else if ( l0->LAttribute & (T_STRING|T_RAW_STRING) )
        else if ( l0->LAttribute == T_RAW_STRING )
        {
            snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", ( char* ) l0->Lo_Value ) ;
        }
        else if ( l0->LAttribute & ( T_LISP_DEFINE | T_LISP_COMPILED_WORD ) && ( ! GetState ( _Q_->OVT_LC, LC_DEFINE_MODE ) ) )
        {
            if ( LO_IsQuoted ( l0 ) ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
            else if ( l0->Lo_CfrTilWord && l0->Lo_CfrTilWord->W_SourceCode && ( ! GetState ( _Q_->OVT_LC, LC_PRINT_ENTERED ) ) )
            {
                snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", ( char* ) l0->Lo_CfrTilWord->W_SourceCode ) ;
            }
            else
            {
                //LO_Print ( ( ListObject* ) l0->Lo_Value ) ;
                snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
            }
        }
        else if ( l0->LAttribute & T_LISP_SYMBOL )
        {
            if ( LO_IsQuoted ( l0 ) ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
            else if ( ( ! in_a_LambdaFlag ) && l0->Lo_CfrTilWord && ( l0->LAttribute & T_LAMBDA ) ) //&& ( ! ( l0->LType & T_LISP_SPECIAL ) ) ) // lambdaFlag == lambdaFlag : don't print internal lambda param/body
            {
                //SetState ( _Q_->OVT_LC, LC_PRINT_ENTERED, true ) ;
                buffer2 = Buffer_New_pbyte ( BUFFER_SIZE ) ;
                snprintf ( ( char* ) buffer2, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
                if ( ! LO_strcat ( buffer, buffer2 ) ) return buffer ;
                _LO_PrintListToString ( ( ListObject * ) l0->Lo_LambdaFunctionParameters, buffer2, 1, printValueFlag ) ; // 1 : lambdaFlag = 1 
                if ( ! LO_strcat ( buffer, buffer2 ) ) return buffer ;
                _LO_PrintListToString ( ( ListObject * ) l0->Lo_LambdaFunctionBody, buffer2, 1, printValueFlag ) ; // 1 : lambdaFlag = 1 
                if ( ! LO_strcat ( buffer, buffer2 ) ) return buffer ;
            }
            else if ( printValueFlag ) //&& GetState ( _Q_->OVT_LC, ( PRINT_VALUE ) ) )
            {
                if ( *l0->Lo_PtrToValue != ( uint64 ) nil )
                {
                    if ( ( ! *l0->Lo_PtrToValue ) && l0->Lo_CfrTilWord )
                    {
                        if ( _Q_->Verbosity > 2 ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s = 0x%016lx", l0->Lo_CfrTilWord->Lo_Name, ( int64 ) l0->Lo_CfrTilWord ) ;
                        else snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
                    }
                    else if ( l0->LAttribute & ( T_RAW_STRING | T_RAW_STRING ) )
                    {
                        snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", ( char* ) *l0->Lo_PtrToValue ) ;
                    }
                    else
                    {
                        //return _LO_Print ( ( ListObject * ) *l0->Lo_PtrToValue, buffer, 0, printValueFlag ) ;
                        snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
                    }
                }
                else
                {
                    if ( _Q_->Verbosity > 2 ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " nil: %s", l0->Lo_Name ) ;
                    else snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
                }
            }
            else snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
        }
        else if ( l0->LAttribute & T_STRING )
        {
            if ( l0->State & UNQUOTED ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", ( char* ) l0->Lo_String ) ;
            else snprintf ( ( char* ) buffer, BUFFER_SIZE, " \"%s\"", ( char* ) l0->Lo_String ) ;
        }
        else if ( l0->LAttribute & BLOCK )
        {
            snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s:#<BLOCK>:0x%016lx", l0->Lo_Name, ( uint64 ) l0->Lo_UInteger ) ;
        }
        else if ( l0->LAttribute & T_BIG_NUM )
        {
            //mpfr_printf ( " %*.*Rf\n", _Context_->System0->BigNum_Printf_Width, _Context_->System0->BigNum_Printf_Precision, *l0->Lo_PtrToValue ) ;
            _BigNum_FPrint ( ( mpfr_t * ) l0->W_Value ) ;
        }
        else if ( l0->LAttribute & T_INT )
        {
            if ( _Context_->System0->NumberBase == 16 ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " 0x%016lx", ( uint64 ) l0->Lo_UInteger ) ;
            else
            {
                format = ( ( ( int64 ) l0->Lo_Integer ) < 0 ) ? ( byte* ) " 0x%016lx" : ( byte* ) " %ld" ;
                snprintf ( ( char* ) buffer, BUFFER_SIZE, ( char* ) format, l0->Lo_Integer ) ;
            }
        }
        else if ( l0->LAttribute & LITERAL )
        {
            if ( Namespace_IsUsing ( "BigNum" ) )
            {
                //mpfr_printf ( " %*.*Rf\n", _Context_->System0->BigNum_Printf_Width, _Context_->System0->BigNum_Printf_Precision, *l0->Lo_PtrToValue ) ;
                _BigNum_FPrint ( ( mpfr_t * ) l0->W_Value ) ;
            }
            else
            {
                format = ( ( ( int64 ) l0->Lo_Integer ) < 0 ) ? ( byte* ) " 0x%016lx" : ( byte* ) " %ld" ;
                if ( ( l0->Lo_Integer < 0 ) || ( _Context_->System0->NumberBase == 16 ) ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " 0x%016lx", ( uint64 ) l0->Lo_UInteger ) ;
                else snprintf ( ( char* ) buffer, BUFFER_SIZE, ( char* ) format, l0->Lo_Integer ) ;
            }
        }
        else if ( l0->LAttribute & ( CPRIMITIVE | CFRTIL_WORD ) )
        {
            snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
        }
        else if ( l0->LAttribute & ( T_HEAD | T_TAIL ) )
        {
            ; //break ;
        }
        else
        {
            if ( l0->Lo_CfrTilWord && l0->Lo_CfrTilWord->Lo_Name ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_CfrTilWord->Lo_Name ) ;
            else if ( l0->Name ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Name ) ;
        }
    }
done:
    if ( _Q_->OVT_LC ) SetState ( _Q_->OVT_LC, LC_PRINT_ENTERED, true ) ;

    return buffer ;
}

byte *
_LO_PrintListToString ( ListObject * l0, byte * buffer, int64 lambdaFlag, int64 printValueFlag )
{
    byte * buffer2 = Buffer_New_pbyte ( BUFFER_SIZE ) ;
    ListObject * l1, *lnext ;
    if ( ! buffer )
    {
        buffer = _CfrTil_->LispPrintBuffer ;
        buffer [0] = 0 ;
    }
    if ( l0 )
    {
        if ( l0->LAttribute & ( LIST | LIST_NODE ) )
        {
            snprintf ( ( char* ) buffer2, BUFFER_SIZE, " (" ) ;
            if ( ! LO_strcat ( buffer, buffer2 ) ) goto done ; //return buffer ;
        }
        for ( l1 = _LO_First ( l0 ) ; l1 ; l1 = lnext )
        {
            lnext = _LO_Next ( l1 ) ; //
            if ( l1->LAttribute & ( LIST | LIST_NODE ) )
            {
                _LO_PrintListToString ( l1, buffer2, lambdaFlag, printValueFlag ) ;
                if ( ! LO_strcat ( buffer, buffer2 ) ) goto done ; //return buffer ;
            }
            else
            {
                _LO_PrintOneToString ( l1, buffer2, lambdaFlag, printValueFlag ) ;
                if ( ! LO_strcat ( buffer, buffer2 ) ) goto done ; //return buffer ;
            }
        }
        if ( l0->LAttribute & ( LIST | LIST_NODE ) ) snprintf ( ( char* ) buffer2, BUFFER_SIZE, " )" ) ;
        LO_strcat ( buffer, buffer2 ) ;
    }
done:
    return buffer ;
}

void
LO_Print ( ListObject * l0 )
{

    DefaultColors ;
    SetState ( _Q_->OVT_LC, ( LC_PRINT_VALUE ), true ) ;
    _Printf ( ( byte* ) "%s", _LO_PRINT_TO_STRING ( l0 ) ) ;
    SetState ( _Q_->OVT_LC, LC_PRINT_VALUE, false ) ;
}

ListObject *
LO_Lambda ( ListObject * l0 )
{
    // lambda signature is "lambda" or an alias like "/\", /.", etc.
    //ListObject *lambdaSignature = _LO_First ( l0 ) ;
    Word * word = _LO_MakeLambda ( _LO_Next ( l0 ) ) ;
    word->LAttribute |= T_LAMBDA ;
    return word ;
}

// (define macro (lambda (id (args) (args1)) ( 'define id ( lambda (args)  (args1) ) ) ) )

ListObject *
_LO_Macro ( ListObject * l0, ListObject * locals )
{
    ListObject *idNode = _LO_Next ( l0 ) ;
    //l0 = _LO_Define ( ( byte* ) "macro", idNode, locals ) ;
    l0 = _LO_Define ( idNode, locals ) ;
    l0->LAttribute |= T_LISP_MACRO ;
    l0->Lo_CfrTilWord->LAttribute |= T_LISP_MACRO ;
    if ( GetState ( _CfrTil_, DEBUG_MODE ) ) LC_Print ( l0 ) ;
    return l0 ;
}

ListObject *
LO_CompileDefine ( ListObject * l0, ListObject * locals )
{
    SetState ( _Context_->Compiler0, RETURN_TOS, true ) ;
    SetState ( _Q_->OVT_LC, LC_COMPILE_MODE, true ) ;
    ListObject * idNode = _LO_Next ( l0 ) ;
    l0 = _LO_Define ( idNode, locals ) ;
    SetState ( _Q_->OVT_LC, LC_COMPILE_MODE, false ) ;
    return l0 ;
}

ListObject *
LO_Define ( ListObject * l0, ListObject * locals )
{
    l0 = LO_CompileDefine ( l0, locals ) ;
    return l0 ;
}

// setq

ListObject *
_LO_Set ( ListObject * lfirst, ListObject * locals )
{
    ListObject *l0, *lnext, * lsymbol, *lvalue, *ls ;
    // lfirst is the 'set' signature
    for ( l0 = lfirst ; ( lnext = _LO_Next ( l0 ) ) && ( lvalue = _LO_Next ( lnext ) ) ; l0 = lvalue )
    {
        lsymbol = lnext ; // we want to return the last symbol
        ls = _LO_Define ( lsymbol, locals ) ;
        LO_Print ( ls ) ; // the values are picked by _LO_Define
    }
    return _Q_->OVT_LC->True ;
}

ListObject *
LO_Set ( ListObject * lfirst, ListObject * locals )
{
    return _LO_Set ( lfirst, locals ? locals : _Q_->OVT_LC->LispNamespace ) ;
}

ListObject *
LO_Let ( ListObject * lfirst, ListObject * locals )
{
    return _LO_Set ( lfirst, locals ) ;
}

ListObject *
_LO_Cons ( ListObject *first, ListObject * second, uint64 allocType )
{
    ListObject * l0 = LO_New ( LIST, 0 ) ;
    _LO_AddToTail ( l0->Lo_List, first ) ;
    _LO_AddToTail ( l0->Lo_List, second ) ;

    return l0 ;
}

ListObject *
LO_If ( ListObject * l0, ListObject * locals )
{
    ListObject * tf, *test, *trueList, *elseList, *value ;
    test = _LO_Next ( l0 ) ;
    trueList = _LO_Next ( test ) ;
    elseList = _LO_Next ( trueList ) ;
    tf = _LO_Eval ( test, locals, 1 ) ;
    if ( ( *tf->Lo_PtrToValue ) && ( tf != nil ) ) value = _LO_Eval ( trueList, locals, 1 ) ;
    else value = _LO_Eval ( elseList, locals, 1 ) ;

    return value ;
}

// lisp cond : conditional

ListObject *
LO_Cond ( ListObject * l0, ListObject * locals )
{
    ListObject * tf, *trueNode, * elseNode = nil ;
    // 'cond' is first node ; skip it.
    l0 = _LO_First ( l0 ) ;
    tf = _LO_Next ( l0 ) ;
    while ( ( trueNode = _LO_Next ( tf ) ) )
    {
        tf = _LO_Eval ( tf, locals, 1 ) ;
        if ( ( tf != nil ) && ( *tf->Lo_PtrToValue ) ) return _LO_Eval ( LO_CopyOne ( trueNode ), locals, 1 ) ;
            // nb we have to copy one here else we return the whole rest of the list 
            //and we can't remove it else it could break a LambdaBody, etc.
        else tf = elseNode = _LO_Next ( trueNode ) ;
    }
    return _LO_Eval ( elseNode, locals, 1 ) ; // last one no need to copy
}

// lisp 'list' function
// lfirst must be the first element of the list

ListObject *
_LO_List ( ListObject * lfirst )
{
    ListObject * lnew = LO_New ( LIST, 0 ), *l0, *lnext, *l1 ;
    if ( GetState ( _CfrTil_, DEBUG_MODE ) )
    {
        DebugColors ;
        _Printf ( ( byte* ) "\n_LO_List : on entering\n\tlfirst = %s", c_gd ( _LO_PRINT_TO_STRING_WITH_VALUE ( lfirst ) ) ) ;
        DefaultColors ;
    }
    for ( l0 = lfirst ; l0 ; l0 = lnext )
    {
        lnext = _LO_Next ( l0 ) ;
        if ( l0->LAttribute & ( LIST | LIST_NODE ) )
        {
            l1 = _LO_List ( _LO_First ( l0 ) ) ;
            l1 = LO_New ( LIST_NODE, l1 ) ;
        }
        else
        {
            if ( GetState ( _CfrTil_, DEBUG_MODE ) )
            {
                DebugColors ;
                _Printf ( ( byte* ) "\n_LO_List : Before l1 = LO_Eval ( LO_Copy ( l0 ) ) ;\n\tl0 = %s", c_gd ( _LO_PRINT_TO_STRING_WITH_VALUE ( l0 ) ) ) ;
                DefaultColors ;
            }
            l1 = LO_Eval ( LO_Copy ( l0 ) ) ;
            if ( GetState ( _CfrTil_, DEBUG_MODE ) )
            {
                DebugColors ;
                _Printf ( ( byte* ) "\n_LO_List : After l1 = LO_Eval ( LO_Copy ( l0 ) ) ;\n\tl1 = %s", c_gd ( _LO_PRINT_TO_STRING_WITH_VALUE ( l1 ) ) ) ;
                DefaultColors ;
            }
            if ( l1->LAttribute & ( LIST | LIST_NODE ) ) l1 = LO_New ( LIST_NODE, l1 ) ;
        }
        _LO_AddToTail ( lnew, l1 ) ;
    }
    if ( GetState ( _CfrTil_, DEBUG_MODE ) )
    {
        DebugColors ;
        _Printf ( ( byte* ) "\n_LO_List : on leaving\n\tlnew = %s", c_gd ( _LO_PRINT_TO_STRING_WITH_VALUE ( lnew ) ) ) ;
        DefaultColors ;
    }
    return lnew ;
}

ListObject *
LO_List ( ListObject * lfirst )
{
    // 'list' is first node ; skip it.
    ListObject * l0 = _LO_List ( _LO_Next ( lfirst ) ) ;
    return l0 ;
}

ListObject *
LO_Begin ( ListObject * l0, ListObject * locals )
{
    ListObject * leval ;
    // 'begin' is first node ; skip it.
    if ( l0 )
    {
        for ( l0 = _LO_Next ( l0 ) ; l0 ; l0 = _LO_Next ( l0 ) )
        {
            leval = _LO_Eval ( l0, locals, 1 ) ;
        }
    }
    else leval = 0 ;
    return leval ;
}

ListObject *
LO_Car ( ListObject * l0 )
{
    ListObject * lfirst = _LO_Next ( l0 ) ;
    if ( lfirst->LAttribute & ( LIST_NODE | LIST ) ) return LO_CopyOne ( _LO_First ( lfirst ) ) ; //( ListObject * ) lfirst ;
    else return LO_CopyOne ( lfirst ) ;
}

ListObject *
LO_Cdr ( ListObject * l0 )
{
    ListObject * lfirst = _LO_Next ( l0 ) ;
    if ( lfirst->LAttribute & ( LIST_NODE | LIST ) ) return _LO_Next ( _LO_First ( lfirst ) ) ; //( ListObject * ) lfirst ;
    return ( ListObject * ) _LO_Next ( lfirst ) ;
}

ListObject *
_LC_Eval ( ListObject * l0 )
{
    ListObject * lfirst = _LO_Next ( l0 ) ;
    return LO_Eval ( lfirst ) ;
}

void
_LO_Semi ( Word * word )
{
    if ( word )
    {
        CfrTil_EndBlock ( ) ;
        block blk = ( block ) DataStack_Pop ( ) ;
        Word_InitFinal ( word, ( byte* ) blk ) ;
        word->LAttribute |= T_LISP_CFRTIL_COMPILED ;
    }
}

Word *
_LO_Colon ( ListObject * lfirst )
{
    Context * cntx = _Context_ ;
    ListObject *lcolon = lfirst, *lname, *ldata ;
    lname = _LO_Next ( lcolon ) ;
    ldata = _LO_Next ( lname ) ;
    _CfrTil_Namespace_NotUsing ( ( byte* ) "Lisp" ) ; // nb. don't use Lisp words when compiling cfrTil
    //CfrTil_RightBracket ( ) ;
    Word * word = Word_New ( lname->Name ) ;
    SetState ( cntx->Compiler0, COMPILE_MODE, true ) ;
    CfrTil_BeginBlock ( ) ;

    return word ;
}

// compile cfrTil code in Lisp/Scheme

ListObject *
_LO_CfrTil ( ListObject * lfirst )
{
    if ( GetState ( _Q_->OVT_LC, LC_READ ) )
    {
        SetState ( _Q_->OVT_LC, LC_READ_MACRO_OFF, true ) ;
        return 0 ;
    }
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    LambdaCalculus * lc = 0 ;
    ListObject *ldata, *word = 0 ;
    if ( _Q_->OVT_LC )
    {
        SetState ( _Q_->OVT_LC, LC_INTERP_MODE, true ) ;
        lc = _Q_->OVT_LC ;
        _Q_->OVT_LC = 0 ;
    }
    _CfrTil_Namespace_NotUsing ( ( byte * ) "Lisp" ) ; // nb. don't use Lisp words when compiling cfrTil
    SetState ( compiler, LC_CFRTIL, true ) ;
    SetState ( compiler, LISP_MODE, false ) ;
    for ( ldata = _LO_Next ( lfirst ) ; ldata ; ldata = _LO_Next ( ldata ) )
    {
        Word_SetCodingHere_And_ClearPreviousUseOf_This_SCA (ldata->CfrTilWord, 0) ;
        if ( ldata->LAttribute & ( LIST_NODE ) )
        {
            _CfrTil_Parse_LocalsAndStackVariables ( 1, 1, ldata, compiler->LocalsCompilingNamespacesStack, 0 ) ;
        }
        else if ( String_Equal ( ldata->Name, ( byte * ) "tick" ) || String_Equal ( ldata->Name, ( byte * ) "'" ) )
        {
            ldata = _LO_Next ( ldata ) ;
            Lexer_ParseObject ( _Lexer_, ldata->Name ) ;
            DataStack_Push ( ( int64 ) _Lexer_->Literal ) ;
        }
        else if ( String_Equal ( ldata->Name, ( byte * ) "s:" ) )
        {
            CfrTil_DbgSourceCodeOn ( ) ;
            word = _LO_Colon ( ldata ) ;
            ldata = _LO_Next ( ldata ) ; // bump ldata to account for name - skip name
        }
        else if ( String_Equal ( ldata->Name, ( byte * ) ":" ) )
        {
            word = _LO_Colon ( ldata ) ;
            ldata = _LO_Next ( ldata ) ; // bump ldata to account for name - skip name
        }
        else if ( String_Equal ( ldata->Name, ( byte * ) ";s" ) && ( ! GetState ( cntx, C_SYNTAX ) ) )
        {
            CfrTil_DbgSourceCodeOff ( ) ;
            _LO_Semi ( word ) ;
        }
        else if ( String_Equal ( ldata->Name, ( byte * ) ";" ) && ( ! GetState ( cntx, C_SYNTAX ) ) )
        {
            ListObject *ldata1 = _LO_Next ( ldata ) ; // bump ldata to account for name
            word->W_SourceCode = String_New_SourceCode ( _CfrTil_->SC_Buffer ) ;
            if ( ldata1 && String_Equal ( ldata1->Name, ( byte * ) ":" ) )
            {
                _CfrTil_InitSourceCode_WithName ( _CfrTil_, "(" ) ;
            }
            _LO_Semi ( word ) ;
            word->W_SourceCode = lc->LC_SourceCode ;
        }
        else Interpreter_InterpretAToken ( cntx->Interpreter0, ldata->Name, ldata->W_RL_Index ) ;
    }
    SetState ( compiler, LC_CFRTIL, false ) ;
    if ( lc )
    {
        _Q_->OVT_LC = lc ;
        SetState ( _Q_->OVT_LC, LC_INTERP_DONE, true ) ;
        SetState ( _Q_->OVT_LC, LC_READ_MACRO_OFF, false ) ;
    }
    Namespace_DoNamespace ( ( byte * ) "Lisp" ) ;
    return nil ;
}

//===================================================================================================================
//| LO Misc : _LO_FindWord _LO_New _LO_Copy
//===================================================================================================================

ListObject *
_LO_First ( ListObject * l0 )
{
    if ( l0 && ( ! ( l0->LAttribute & ( T_NIL ) ) ) )
    {
        if ( l0->LAttribute & ( LIST | LIST_NODE ) ) return ( ListObject* ) dllist_First ( ( dllist* ) ( dllist * ) l0->Lo_List ) ;
        else return l0 ;
    }
    return 0 ;
}

ListObject *
_LO_Last ( ListObject * l0 )
{
    if ( l0 )
    {
        if ( l0->LAttribute & ( LIST | LIST_NODE ) ) return ( ListObject* ) dllist_Last ( ( dllist * ) l0->Lo_List ) ;
        else return l0 ;
    }
    return 0 ;
}

ListObject *
_LO_Next ( ListObject * l0 )
{
    return ( ListObject* ) dlnode_Next ( ( dlnode* ) l0 ) ;
}

Word *
_LO_FindWord ( Namespace * l0, byte * name, ListObject * locals )
{
    Word * word = 0 ;
    if ( GetState ( _Compiler_, LC_ARG_PARSING ) ) word = Finder_Word_FindUsing ( _Context_->Finder0, name, 0 ) ;
    else
    {
        if ( locals ) word = _Finder_FindWord_InOneNamespace ( _Finder_, locals, name ) ;
        if ( ! word )
        {
            word = _Finder_FindWord_InOneNamespace ( _Finder_, _Q_->OVT_LC->LispTemporariesNamespace, name ) ;
            if ( ! word )
            {
                word = _Finder_FindWord_InOneNamespace ( _Finder_, _Q_->OVT_LC->LispNamespace, name ) ; // prefer Lisp namespace
                if ( ! word )
                {
                    word = Finder_Word_FindUsing ( _Context_->Finder0, name, 0 ) ;
                }
            }
        }
    }
    return word ;
}

ListObject *
_LO_AllocCopyOne ( ListObject * l0, uint64 allocType )
{
    ListObject * l1 = 0 ;
    if ( l0 )
    {

        l1 = ( ListObject * ) _object_Allocate ( sizeof ( ListObject ), allocType ) ; //Mem_Allocate ( ( sizeof (ListObject ) + ((slots-1) * CELL), AllocType ) ;
        memcpy ( l1, l0, sizeof ( ListObject ) ) ;
        // nb. since we are coping the car/cdr are the same as the original so we must clear them else when try to add to the list and remove first it will try to remove from a wrong list so ...
        l1->Lo_Car = 0 ;
        l1->Lo_Cdr = 0 ;
    }
    return l1 ;
}

void
_LO_ListInit ( ListObject * l0, uint64 allocType )
{
    l0->Lo_Head = _dlnode_New ( allocType ) ;
    l0->Lo_Tail = _dlnode_New ( allocType ) ;
    _dllist_Init ( ( dllist * ) l0 ) ;
    l0->Lo_List = ( dllist* ) l0 ;
    l0->LAttribute |= LIST ; // a LIST_NODE needs to be initialized also to be also a LIST
}

ListObject *
_LO_ListNode_Copy ( ListObject * l0, uint64 allocType )
{
    ListObject * l1 = _LO_AllocCopyOne ( l0, allocType ) ;
    _LO_ListInit ( l1, allocType ) ;
    return l1 ;
}

ListObject *
_LO_CopyOne ( ListObject * l0, uint64 allocType )
{
    ListObject *l1 = 0 ;
    if ( l0 )
    {
        if ( l0->LAttribute & ( LIST | LIST_NODE ) )
        {
            l1 = _LO_Copy ( l0, allocType ) ;
            if ( l0->LAttribute & LIST_NODE ) l1 = _DataObject_New ( T_LC_NEW, 0, 0, LIST_NODE, 0, LIST_NODE, 0, ( int64 ) l1, 0, - 1, - 1 ) ;
        }
        else l1 = _LO_AllocCopyOne ( l0, allocType ) ;
    }
    return l1 ;
}

// copy a whole list or a single node

ListObject *
_LO_Copy ( ListObject * l0, uint64 allocType )
{
    ListObject * lnew = 0, *l1 ;
    if ( l0 )
    {
        if ( l0->LAttribute & ( LIST | LIST_NODE ) ) lnew = _LO_ListNode_Copy ( l0, allocType ) ;
        for ( l0 = _LO_First ( l0 ) ; l0 ; l0 = _LO_Next ( l0 ) )
        {
            l1 = _LO_CopyOne ( l0, allocType ) ;
            if ( lnew ) LO_AddToTail ( lnew, l1 ) ;
            else return l1 ;
        }
    }
    return lnew ;
}

Boolean
LO_strcat ( byte * buffer, byte * buffer2 )
{
    if ( Strlen ( ( char* ) buffer2 ) + Strlen ( ( char* ) buffer ) >= BUFFER_SIZE )
    {
        Error ( "", "LambdaCalculus : LO_strcat : buffer overflow.", QUIT ) ;
    }
    else strcat ( ( char* ) buffer, ( char* ) buffer2 ) ;
    buffer2 [0] = 0 ;

    return true ;
}

//===================================================================================================================
//| LO_Repl
//===================================================================================================================

void
LC_EvalPrint ( ListObject * l0 )
{
    ListObject * l1 ;
    l1 = LO_Eval ( l0 ) ;
    SetState ( _Q_->OVT_LC, LC_PRINT_ENTERED, false ) ;
    LO_PrintWithValue ( l1 ) ;
    SetBuffersUnused ( 1 ) ;
    _Q_->OVT_LC->LispParenLevel = 0 ;
    Compiler_Init ( _Context_->Compiler0, 0 ) ; // we could be compiling a cfrTil word as in oldLisp.cft
}

ListObject *
_LO_Read_ListObject ( int64 parenLevel )
{
    Compiler * compiler = _Context_->Compiler0 ;
    LambdaCalculus * lc = LC_New ( ) ;
    //compiler->BlockLevel = 0 ;
    lc->LispParenLevel = parenLevel ;
    SetState ( lc, LC_PRINT_ENTERED, false ) ;
    ListObject * l0 = _LO_Read ( ) ;
    return l0 ;
}

void
_LO_ReadEvalPrint_ListObject ( int64 parenLevel, int64 continueFlag )
{
    Lexer * lexer = _Context_->Lexer0 ;
    Compiler * compiler = _Context_->Compiler0 ;
    byte *svDelimiters = lexer->TokenDelimiters ;
    SetState ( compiler, LISP_MODE, true ) ;
    compiler->InitHere = Here ;
    if ( ! parenLevel ) CfrTil_InitSourceCode ( _CfrTil_ ) ;
    else CfrTil_InitSourceCode_WithCurrentInputChar ( _CfrTil_ ) ;
    ListObject * l0 = _LO_Read_ListObject ( parenLevel ) ;
    d0 ( if ( Is_DebugOn ) LO_PrintWithValue ( l0 ) ) ;
    LC_EvalPrint ( l0 ) ;
    if ( ! continueFlag )
    {
        LC_Clear ( 0 ) ; // 0 : nb. !! very important for variables from previous evals : but fix; meditate on why? temporaries should be clearable
        Lexer_SetTokenDelimiters ( lexer, svDelimiters, 0 ) ;
    }
    SetState ( compiler, LISP_MODE, false ) ;
}

void
LO_ReadEvalPrint_ListObject ( )
{
    _LO_ReadEvalPrint_ListObject ( 0, 1 ) ;
}

void
LO_ReadEvalPrint_AfterAFirstLParen ( )
{
    _LO_ReadEvalPrint_ListObject ( 1, 0 ) ;
    SetState ( _CfrTil_, SOURCE_CODE_STARTED, false ) ;
}

void
LO_ReadEvalPrint ( )
{
    Namespace_ActivateAsPrimary ( ( byte* ) "Lisp" ) ;
    _LO_ReadEvalPrint_ListObject ( 0, 0 ) ;
}

void
LO_ReadInitFile ( byte * filename )
{
    _Context_IncludeFile ( _Context_, filename, 0 ) ;
}

void
LO_Repl ( )
{
    LambdaCalculus * lc = _LC_New ( 1 ) ;
    Compiler * compiler = _Context_->Compiler0 ;
    lc->LispParenLevel = 0 ;
    //compiler->BlockLevel = 0 ;
    SetState ( compiler, LISP_MODE, true ) ;
    Namespace_DoNamespace ( ( byte* ) "Lisp" ) ;
    SetState ( lc, LC_REPL, true ) ;
    _Printf ( ( byte* ) "\ncfrTil lisp : (type 'exit' or 'bye' to exit)\n including init file :: './namespaces/compiler/lcinit.cft'\n" ) ;
    LO_ReadInitFile ( ( byte* ) "./namespaces/compiler/lcinit.cft" ) ;

    _Repl ( ( block ) LO_ReadEvalPrint_ListObject ) ;

    SetState ( lc, LC_REPL, false ) ;
}

//===================================================================================================================
//| LC_ : lambda calculus
//===================================================================================================================

void
LC_PrintWithValue ( )
{
    LC_New ( ) ;
    ListObject * l0 = ( ListObject * ) DataStack_Pop ( ) ;
    _Printf ( ( byte* ) "%s", _LO_PrintOneToString ( ( ListObject * ) l0, 0, 0, 1 ) ) ;
}

void
LC_Read ( )
{
    ListObject * l0 = _LO_Read_ListObject ( 1 ) ;
    DataStack_Push ( ( int64 ) l0 ) ;
}

void
LC_Eval ( )
{
    LC_New ( ) ;
    ListObject * l0 = ( ListObject * ) DataStack_Pop ( ), *l1 ;
    l1 = LO_Eval ( l0 ) ;
    DataStack_Push ( ( int64 ) l1 ) ;
}

void
LC_DupList ( )
{
    LC_New ( ) ;
    ListObject * l0 = ( ListObject * ) TOS, *l1 ;
    l1 = LO_Copy ( l0 ) ;
    DataStack_Push ( ( int64 ) l1 ) ;
}

void
_LC_SaveStack ( LambdaCalculus * lc )
{
    if ( lc ) lc->SaveStackPointer = _Dsp_ ;
}

void
_LC_ResetStack ( LambdaCalculus * lc )
{
    if ( lc && ( lc->SaveStackPointer ) ) _Dsp_ = lc->SaveStackPointer ;
}

void
LC_RestoreStack ( )
{
    _LC_ResetStack ( _Q_->OVT_LC ) ;
}

void
LC_SaveStack ( )
{
    _LC_SaveStack ( _Q_->OVT_LC ) ;
}

void
LC_FinishSourceCode ( )
{
    _Q_->OVT_LC->LC_SourceCode = _CfrTil_GetSourceCode ( ) ;
}

void
_LC_Init ( LambdaCalculus * lc, int64 newFlag )
{
    DebugShow_Off ;
    int64 svdscs = IsSourceCodeOn ;
    CfrTil_DbgSourceCodeOff ( ) ;
    lc->LispNamespace = Namespace_Find ( ( byte* ) "Lisp" ) ;
    lc->LispTemporariesNamespace = Namespace_FindOrNew_SetUsing ( ( byte* ) "LispTemporaries", lc->LispNamespace, 0 ) ;
    if ( newFlag )
    {
        List_Init ( lc->LispTemporariesNamespace->S_SymbolList ) ;
    }
    lc->SavedCodeSpace = 0 ;
    lc->CurrentLambdaFunction = 0 ;
    lc->SaveStackPointer = 0 ;
    if ( newFlag || ( ! lc->Nil ) )
    {
        //lc->Nil = _DataObject_New (T_LC_NEW, 0, ( byte* ) "nil", 0, 0, T_NIL, 0, 0, LISP, 0, - 1 ) ;
        lc->Nil = _DataObject_New ( T_LC_NEW, 0, ( byte* ) "nil", 0, 0, T_NIL, 0, 0, 0, 0, - 1 ) ;
        lc->True = _DataObject_New ( T_LC_NEW, 0, ( byte* ) "true", 0, 0, 0, 0, ( uint64 ) true, 0, 0, - 1 ) ;
    }
    lc->OurCfrTil = _CfrTil_ ;
    lc->QuoteState = 0 ;
    lc->LispParenLevel = 0 ;
    if ( newFlag || ( ! lc->QuoteStateStack ) ) lc->QuoteStateStack = Stack_New ( 64, LISP_TEMP ) ;
    else _Stack_Init ( lc->QuoteStateStack, 64 ) ;
    lc->State = 0 ;
    DebugShow_On ;
    SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, svdscs ) ;
}

void
LC_Clear ( int64 deleteFlag )
{
    LambdaCalculus * lc = _Q_->OVT_LC ;
    if ( lc )
    {
        _Namespace_Clear ( lc->LispTemporariesNamespace ) ;
        if ( deleteFlag ) _Q_->OVT_LC = 0 ; // this maybe shouldn't be used as a flag
    }
}

LambdaCalculus *
_LC_New ( int64 forceInitFlag )
{
    int64 lcNewFlag = 0 ;
    LambdaCalculus * lc = 0 ;
    if ( ! _Q_->OVT_LC )
    {
        lc = ( LambdaCalculus * ) Mem_Allocate ( sizeof (LambdaCalculus ), LISP ) ;
        _Q_->OVT_LC = lc ;
        lcNewFlag = true ;
    }
    if ( forceInitFlag || lc ) _LC_Init ( _Q_->OVT_LC, forceInitFlag ) ;
    return _Q_->OVT_LC ;
}

LambdaCalculus *
LC_New ( )
{
    return _LC_New ( ! _Q_->OVT_LC ) ;
}

void
LC_Reset ( )
{
    LC_Clear ( 1 ) ;
    _LC_New ( 1 ) ;
}

