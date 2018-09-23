#include "../../include/cfrtil64.h"
//===================================================================================================================
//| LO_SpecialFunction(s) 
//===================================================================================================================

ListObject *
_LO_Define ( ListObject * idNode, ListObject * locals )
{
    LambdaCalculus * lc = _LC_ ;
    ListObject *value0, *value, *l1 ;
    Word * word = idNode->Lo_CfrTilWord ;
    CfrTil_WordList_Init ( _CfrTil_, word, 1 ) ;
    word->Definition = 0 ; // reset the definition from LO_Read
    value0 = _LO_Next ( idNode ) ;
    _CfrTil_->CurrentWordCompiling = word ;
    word->Lo_CfrTilWord = word ;
    SetState ( lc, ( LC_DEFINE_MODE ), true ) ;
    Namespace_DoAddWord ( lc->LispInternalNamespace, word ) ; // put it at the beginning of the list to be found first
    word->CAttribute = NAMESPACE_VARIABLE ; // nb. !
    value = _LO_Eval ( lc, value0, locals, 0 ) ; // 0 : don't apply
    if ( value && ( value->LAttribute & T_LAMBDA ) )
    {
        value->Lo_LambdaFunctionParameters = _LO_Copy ( value->Lo_LambdaFunctionParameters, LISP ) ;
        value->Lo_LambdaFunctionBody = _LO_Copy ( value->Lo_LambdaFunctionBody, LISP ) ;
    }
    else value = _LO_CopyOne ( value, LISP ) ; // this value object should now become part of LISP non temporary memory
    //else value = LO_Copy ( value ) ; // doesn't work ?? LO_Copy is broken :: this value object should now become part of LISP non temporary memory
    //d1 ( if ( _Is_DebugOn ) LO_PrintWithValue ( value ) ) ;
    word->Lo_Value = ( uint64 ) value ; // used by eval
    word->LAttribute |= ( T_LISP_DEFINE | T_LISP_SYMBOL ) ;
    word->State |= LC_DEFINED ;
    // the value was entered into the LISP memory, now we need a temporary carrier for LO_Print
    //l1 = _DataObject_New ( T_LC_NEW, LO_New ( LIST_NODE, word ), 0, word->CAttribute, word->CAttribute2, word->LAttribute, 
    l1 = DataObject_New ( T_LC_NEW, 0, word->Name, word->CAttribute, word->CAttribute2, word->LAttribute, 
        0, ( int64 ) value, LISP, - 1, - 1 ) ; // all words are symbols
    l1->LAttribute |= ( T_LISP_DEFINE | T_LISP_SYMBOL ) ;
    SetState ( lc, ( LC_DEFINE_MODE ), false ) ;
    l1->W_SourceCode = word->W_SourceCode = lc->LC_SourceCode ;
    _Word_Finish ( l1 ) ;
    Compiler_Init ( _Context_->Compiler0, 0 ) ; // we could be compiling a cfrTil word as in oldLisp.cft
    return l1 ; 
}

ListObject *
_LO_MakeLambda ( ListObject * l0 )
{
    ListObject *args, *body, *word, *lnew, *body0 ;
    // allow args to be optionally an actual parenthesized list or just vars after the lambda
    if ( GetState ( _LC_, LC_DEFINE_MODE ) ) word = _CfrTil_->CurrentWordCompiling ;
    else word = _Word_New ( ( byte* ) "<lambda>", WORD_CREATE, 0, 0, 0, 0, DICTIONARY ) ; // don't _Word_Add : must *not* be "lambda" else it will wrongly replace the lambda T_SPECIAL_FUNCTION word in LO_Find
    args = l0 ;
    body0 = _LO_Next ( l0 ) ;
    if ( args->LAttribute & ( LIST | LIST_NODE ) ) args = _LO_Copy ( args, LISP_TEMP ) ;
    else
    {
        lnew = LO_New ( LIST, 0 ) ;
        do
        {
            LO_AddToTail ( lnew, _LO_CopyOne ( args, LISP_TEMP ) ) ;
        }
        while ( ( args = _LO_Next ( args ) ) != body0 ) ;
        args = lnew ;
    }
    if ( ( body0->LAttribute & ( LIST | LIST_NODE ) ) ) body = _LO_Copy ( body0, LISP_TEMP ) ;
    else
    {
        lnew = LO_New ( LIST, 0 ) ;
        LO_AddToTail ( lnew, _LO_CopyOne ( body0, LISP_TEMP ) ) ;
        body = lnew ;
    }
    if ( GetState ( _LC_, LC_COMPILE_MODE ) )
    {
        SetState ( _LC_, LC_LAMBDA_MODE, true ) ;
        block codeBlk = CompileLispBlock ( args, body ) ;
        *word->W_PtrToValue = ( uint64 ) codeBlk ;
    }
    if ( ! GetState ( _LC_, LC_COMPILE_MODE ) ) // nb! this needs to be 'if' not 'else' or else if' because the state is sometimes changed by CompileLispBlock, eg. for function parameters
    {
        word->Lo_CfrTilWord = word ;
        word->Lo_LambdaFunctionParameters = args ;
        word->Lo_LambdaFunctionBody = body ;
        word->LAttribute |= T_LAMBDA | T_LISP_SYMBOL ;
        //word->CAttribute = 0 ;
    }
    return word ;
}

ListObject *
LO_SpecialFunction ( LambdaCalculus * lc, ListObject * l0, ListObject * locals )
{
    ListObject * lfirst, *macro = 0 ;
    if ( lfirst = _LO_First ( l0 ) )
    {
        while ( lfirst && ( lfirst->LAttribute & T_LISP_MACRO ) )
        {
            d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 0, 0, ( byte* ) "\nLO_SpecialFunction : macro eval before : l0 = %s : locals = %s", c_gd ( _LO_PRINT_TO_STRING ( l0 ) ), locals ? _LO_PRINT_TO_STRING ( locals ) : ( byte* ) "" ) ) ;
            macro = lfirst ;
            macro->LAttribute &= ~ T_LISP_MACRO ; // prevent short recursive loop calling of this function thru LO_Eval below
            l0 = _LO_Eval ( lc, l0, locals, 1 ) ;
            macro->LAttribute |= T_LISP_MACRO ; // restore to its true type
            lfirst = _LO_First ( l0 ) ;
            macro = 0 ;
            d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 0, 0, ( byte* ) "\nLO_SpecialFunction : macro eval after : l0 = %s : locals = %s", c_gd ( _LO_PRINT_TO_STRING ( l0 ) ), locals ? _LO_PRINT_TO_STRING ( locals ) : ( byte* ) "" ) ) ;
        }
        if ( lfirst && lfirst->Lo_CfrTilWord && IS_MORPHISM_TYPE ( lfirst->Lo_CfrTilWord ) )
        {
            //if ( GetState ( _LC_, LC_COMPILE_MODE ) ) return lfirst ;
            l0 = ( ( LispFunction2 ) ( lfirst->Lo_CfrTilWord->Definition ) ) ( lfirst, locals ) ; // non macro special functions here
        }
        else
        {
            d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 0, 0, ( byte* ) "\nLO_SpecialFunction : final eval before : l0 = %s : locals = %s", c_gd ( _LO_PRINT_TO_STRING ( l0 ) ), locals ? _LO_PRINT_TO_STRING ( locals ) : ( byte* ) "nil" ) ) ;
            l0 = _LO_Eval ( lc, l0, locals, 1 ) ;
            d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 0, 0, ( byte* ) "\nLO_SpecialFunction : final eval after : l0 = %s : locals = %s", c_gd ( _LO_PRINT_TO_STRING ( l0 ) ), locals ? _LO_PRINT_TO_STRING ( locals ) : ( byte* ) "nil" ) ) ;
        }
    }
    return l0 ;
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
    if (l0->Lo_CfrTilWord) l0->Lo_CfrTilWord->LAttribute |= T_LISP_MACRO ;
    if ( GetState ( _CfrTil_, DEBUG_MODE ) ) LO_Print ( l0 ) ;
    return l0 ;
}

ListObject *
LO_CompileDefine ( ListObject * l0, ListObject * locals )
{
    SetState ( _Context_->Compiler0, RETURN_TOS, true ) ;
    SetState ( _LC_, LC_COMPILE_MODE, true ) ;
    ListObject * idNode = _LO_Next ( l0 ) ;
    l0 = _LO_Define ( idNode, locals ) ;
    SetState ( _LC_, LC_COMPILE_MODE, false ) ;
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
LO_Set ( ListObject * lfirst, ListObject * locals )
{
    ListObject *l0, * lsymbol, *lvalue, *lset ;
    // lfirst is the 'set' signature
    for ( l0 = lfirst ; lsymbol = _LO_Next ( l0 ) ; l0 = lvalue )
    {
        lvalue = _LO_Next ( lsymbol ) ;
        if ( lvalue )
        {
            lset = _LO_Define ( lsymbol, lvalue ) ;
            LO_Print ( lset ) ;
        }
        else break ;
    }
    return 0 ; 
}

ListObject *
LO_Let ( ListObject * lfirst, ListObject * locals )
{
    return LO_Set ( lfirst, locals ) ;
}

ListObject *
_LO_Cons ( ListObject *first, ListObject * second, uint64 allocType )
{
    ListObject * l0 = LO_New ( LIST, 0 ) ;
    LO_AddToTail ( l0->Lo_List, first ) ;
    LO_AddToTail ( l0->Lo_List, second ) ;

    return l0 ;
}

ListObject *
LO_If ( ListObject * l0, ListObject * locals )
{
    LambdaCalculus * lc = _LC_ ;
    ListObject * tf, *test, *trueList, *elseList, *value ;
    test = _LO_Next ( l0 ) ;
    trueList = _LO_Next ( test ) ;
    elseList = _LO_Next ( trueList ) ;
    tf = _LO_Eval ( lc, test, locals, 1 ) ;
    if ( ( *tf->Lo_PtrToValue ) && ( tf != nil ) ) value = _LO_Eval ( lc, trueList, locals, 1 ) ;
    else value = _LO_Eval ( lc, elseList, locals, 1 ) ;

    return value ;
}

// lisp cond : conditional
// ( cond (tf) (ifTrue) (tf) (ifTrue) ... (else) )

ListObject *
LO_Cond ( ListObject * l0, ListObject * locals )
{
    LambdaCalculus * lc = _LC_ ;
    ListObject * tfTestNode, *trueNode, * elseNode = nil ;
    // 'cond' is first node ; skip it.
    l0 = _LO_First ( l0 ) ; // the 'cond' (maybe aliased)
    tfTestNode = _LO_Next ( l0 ) ;
    while ( ( trueNode = _LO_Next ( tfTestNode ) ) )
    {
        tfTestNode = _LO_Eval ( lc, tfTestNode, locals, 1 ) ;
        if ( ( tfTestNode != nil ) && ( *tfTestNode->Lo_PtrToValue ) )
        {
            return _LO_Eval ( lc, trueNode, locals, 1 ) ;
        }
            // nb we have to copy one here else we return the whole rest of the list 
            // and we can't remove it else it could break a LambdaBody, etc.
        else
        {
            tfTestNode = elseNode = _LO_Next ( trueNode ) ;
        }
    }
    return _LO_Eval ( lc, elseNode, locals, 1 ) ; // last one no need to copy
}

// lisp 'list' function
// lfirst must be the first element of the list

ListObject *
_LO_List ( LambdaCalculus * lc, ListObject * lfirst )
{
    ListObject * lnew = LO_New ( LIST, 0 ), *l0, *lnext, *l1 ;
    for ( l0 = lfirst ; l0 ; l0 = lnext )
    {
        lnext = _LO_Next ( l0 ) ;
        if ( l0->LAttribute & ( LIST | LIST_NODE ) ) l1 = _LO_List ( lc, _LO_First ( l0 ) ) ;
        else l1 = LO_Eval ( lc, LO_CopyOne ( l0 ) ) ;
        LO_AddToTail ( lnew, l1 ) ;
    }
    return lnew ;
}

ListObject *
LO_List ( ListObject * lfirst )
{
    LambdaCalculus * lc = _LC_ ;
    // 'list' is first node ; skip it.
    ListObject * l0 = _LO_List ( lc, _LO_Next ( lfirst ) ) ;
    return l0 ;
}

ListObject *
LO_Begin ( ListObject * l0, ListObject * locals )
{
    LambdaCalculus * lc = _LC_ ;
    ListObject * leval ;
    // 'begin' is first node ; skip it.
    if ( l0 )
    {
        for ( l0 = _LO_Next ( l0 ) ; l0 ; l0 = _LO_Next ( l0 ) )
        {
            leval = _LO_Eval ( lc, l0, locals, 1 ) ;
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
    LambdaCalculus * lc = _LC_ ;
    ListObject * lfirst = _LO_Next ( l0 ) ;
    return LO_Eval ( lc, lfirst ) ;
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
    if ( GetState ( _LC_, LC_READ ) )
    {
        SetState ( _LC_, LC_READ_MACRO_OFF, true ) ;
        return 0 ;
    }
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    LambdaCalculus * lc = 0 ;
    ListObject *ldata, *word = 0 ;
    if ( _LC_ )
    {
        SetState ( _LC_, LC_INTERP_MODE, true ) ;
        lc = _LC_ ;
    }
    _CfrTil_Namespace_NotUsing ( ( byte * ) "Lisp" ) ; // nb. don't use Lisp words when compiling cfrTil
    SetState ( compiler, LC_CFRTIL, true ) ;
    SetState ( compiler, LISP_MODE, false ) ;
    for ( ldata = _LO_Next ( lfirst ) ; ldata ; ldata = _LO_Next ( ldata ) )
    {
        Word_SetCodingHere_And_ClearPreviousUseOf_Here_SCA ( ldata->CfrTilWord, 0 ) ;
        if ( ldata->LAttribute & ( LIST|LIST_NODE ) )
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
        _LC_ = lc ;
        SetState ( _LC_, LC_INTERP_DONE, true ) ;
        SetState ( _LC_, LC_READ_MACRO_OFF, false ) ;
        //LC_RestoreStack ( ) ;
    }
    Namespace_DoNamespace ( ( byte * ) "Lisp" ) ;
    return nil ;
}

