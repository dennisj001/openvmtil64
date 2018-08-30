#include "../../include/cfrtil64.h"
//===================================================================================================================
//| _LO_Apply 
//===================================================================================================================

#define NEW_LC_COMPILE 0

ListObject *
LO_Apply ( LambdaCalculus * lc, ListObject *lfirst, ListObject *lfunction, ListObject *largs, Boolean applyFlag )
{
    SetState ( lc, LC_APPLY, true ) ;
    ListObject *l0 ;
    if ( applyFlag && lfunction && ( ( lfunction->CAttribute & ( CPRIMITIVE | CFRTIL_WORD ) ) || ( lfunction->LAttribute & ( T_LISP_COMPILED_WORD ) ) ) )
    {
        if ( GetState ( lc, LC_DEFINE_MODE ) && ( ! CompileMode ) ) return lfirst ;
        else l0 = _LO_Apply ( lfirst, lfunction, largs ) ;
    }
    else if ( lfunction && ( lfunction->LAttribute & T_LAMBDA ) && lfunction->Lo_LambdaFunctionBody )
    {
        // LambdaArgs, the formal args, are not changed by LO_Substitute (locals - lvals are just essentially 'renamed') and thus don't need to be copied
        LO_Substitute ( _LO_First ( ( ListObject * ) lfunction->Lo_LambdaFunctionParameters ), _LO_First ( largs ) ) ;
        lc->CurrentLambdaFunction = lfunction ;
        l0 = ( ListObject * ) lfunction->Lo_LambdaFunctionBody ;
        l0 = LO_EvalList ( lc, l0, largs, applyFlag ) ;
    }
#if NEW_LC_COMPILE  
    else if ( CompileMode && applyFlag && lfunction && lc->CurrentLambdaFunction && ( lfunction->CAttribute & T_LISP_SYMBOL ) )
    {
        LO_CompileOrInterpretArgs ( _LO_First ( largs ) ) ;
        Compile a function variable _Interpreter_LC_InterpretWord ( _Interpreter_, lfunction, 1 ) ; // function variable
        //_LO_Do_FunctionBlock ( lfunction, largs ) ;
        //_LO_CompileOrInterpretArgs ( largs = lfirst = _LO_First ( largs ) ) ;
    }
#endif
    else
    {
        //these cases seems common sense for what these situations should mean and seem to add something positive to the usual lisp/scheme semantics !?
        if ( ! largs ) l0 = lfunction ;
        else //if ( ( lfirst->LAttribute & ( T_LISP_SPECIAL ) || lc->CurrentLambdaFunction ) ) // CurrentLambdaFunction : if lambda or T_LISP_SPECIAL returns a list 
        {
            LO_AddToHead ( largs, lfunction ) ;
            l0 = largs ;
        }
        SetState ( lc, LC_COMPILE_MODE, false ) ;
    }
    SetState ( lc, LC_APPLY, false ) ;
    return l0 ;
}

ListObject *
_LO_Apply ( ListObject *lfirst, ListObject *lfunction, ListObject *largs )
{
    LambdaCalculus *lc = _Q_->OVT_LC ;
    SetState ( lc, LC_APPLY, true ) ;
    ListObject *vReturn ;
    d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 1, 0, ( byte * ) "\n_LO_Apply : \n\tl0 =%s", _LO_PRINT_TO_STRING ( l0 ) ) ) ;
    if ( lfunction->LAttribute & LIST_FUNCTION ) return (( ListFunction ) lfunction->Lo_CfrTilWord->Definition )( lfirst ) ;
    else if ( lfunction->CAttribute & CFRTIL_WORD ) // this case is hypothetical for now
    {
        if ( lfunction->LAttribute & T_LISP_CFRTIL_COMPILED )
        {
            _Interpreter_DoWord ( _Context_->Interpreter0, lfunction->Lo_CfrTilWord, lfunction->W_RL_Index, lfunction->W_SC_Index ) ;
            vReturn = nil ;
        }
        else vReturn = _LO_Do_FunctionBlock ( lfunction, largs ) ;
    }
#if NEW_LC_COMPILE  
    else if ( ( lfunction->LAttribute & T_LAMBDA ) && ( ! ( lfunction->CAttribute2 & T_OBJECT ) ) )
    {
        //LC_SaveStack ( ) ;
        // like an rpn word but we have the list of words that make it up already and processed by eval
        CompileArgs ( not LO_PushArgs ( largs ) ; )
        CompileFunction lfunction->Lo_CfrTilWord->Definition ( ) ;
        vReturn = _DataObject_New ( T_LC_NEW, 0, 0, 0, 0, LITERAL, 0, DataStack_Pop ( ), 0, - 1, 0 ) ;
        //LC_RestoreStack ( ) ;
    }
#endif    
    else if ( largs ) vReturn = _LO_Do_FunctionBlock ( lfunction, largs ) ;
    else
    {
        lc->ParenLevel -- ;
        if ( CompileMode ) LO_CheckEndBlock ( ) ;
        SetState ( lc, LC_COMPILE_MODE, false ) ;
        vReturn = lfunction ;
    }
    SetState ( lc, LC_APPLY, false ) ;
    //l0->W_Value = (int64) vReturn ; // this seems the right place for vReturn instead of the stack
    return vReturn ;
}

void
_Interpreter_LC_InterpretWord ( Interpreter *interp, ListObject *l0, Boolean functionFlag )
{
    int64 tsrli = l0->W_RL_Index ;
    int64 scwi = l0->W_SC_Index ;
    Word * word ;
#if NEW_LC_COMPILE
    if ( ( l0->LAttribute & T_LISP_SYMBOL ) && functionFlag ) //( ( l0->LAttribute & T_LAMBDA ) ) )
    {
        //DataStack_Push ( (int64) l0 ) ;
        //_Interpreter_DoWord ( interp, word, tsrli, scwi ) ;
        _Compile_Stack_Push ( DSP, ( int64 ) l0->Definition ) ;
        LO_Compile_Runtime_LispSymbol_Function ( ) ;
    }
    else
#endif        
    {
        word = l0->Lo_CfrTilWord ;
        if ( ! word ) word = l0 ;
        //if ( tsrli == lexer->TokenStart_ReadLineIndex ) SetState ( _Debugger_, DEBUG_SHTL_OFF, true ) ;
        _Interpreter_DoWord ( interp, word, tsrli, scwi ) ;
        //SetState ( _Debugger_, DEBUG_SHTL_OFF, false ) ;
    }
}

byte *
LC_GetWordDefinition ( byte *nsName, byte * name )
{
    Word * word = Finder_FindWord_InOneNamespace ( _Finder_, nsName, name ) ;
    if ( word ) return ( byte* ) word->Definition ;
    else return 0 ;
}

#if NEW_LC_COMPILE
#if 0

void
_LO_Compile_Runtime_LispSymbol_Function ( ListObject *lfunction )
{
    // runtime find 
    _Compile_PushReg ( RDI ) ;
    _Compile_PushReg ( RSI ) ;
    Compile_MoveImm_To_Reg ( RSI, ( int64 ) _Q_->OVT_LC->LC_Locals, CELL_SIZE ) ;
    Compile_MoveImm_To_Reg ( RDX, ( int64 ) lfunction->Name, CELL_SIZE ) ;
    //word = _Finder_FindWord_InOneNamespace ( _Finder_, locals, name ) ;
    Compile_Call ( ( byte* ) LC_GetWordDefinition ) ;
    _Compile_CallThru ( RAX, REG ) ;
    _Compile_PopToReg ( RSI ) ;
    _Compile_PopToReg ( RDI ) ;
}
#else

void
LO_Compile_Runtime_LispSymbol_Function ( )
{
    //compile Block_Eval first parameter definition
    //ListObject * l0 = ( ListObject * ) DataStack_Pop ( ) ;
    _Compile_Stack_PopToReg ( DSP, RAX ) ;
    _Compile_CallThru ( RAX, REG ) ;
    //if ( l0->)
    //Compile_Call ( ( byte* ) lfunction->Definition ) ;
}
#endif

void
LO_PushArgs ( ListObject *largs )
{
    ListObject * arg ;
    for ( arg = _LO_First ( largs ) ; arg ; arg = _LO_Next ( arg ) )
    {
        DataStack_Push ( ( int64 ) arg->W_Value ) ; // research : how does CAttribute get set to T_NIL?
    }
}

#endif //NEW_LC_COMPILE

void
_LO_CompileOrInterpret_One ( ListObject *l0, int64 functionFlag )
{
    // just interpret the non-nil, non-list objects
    // nil means that it doesn't need to be interpreted any more
#if 0 //NEW_LC_COMPILE    
    if ( CompileMode && functionFlag ) _LO_Compile_Runtime_LispSymbol_Function ( l0 ) ;
    else
#endif    
        if ( l0 && ( ! ( l0->LAttribute & ( LIST | LIST_NODE | T_NIL ) ) ) ) _Interpreter_LC_InterpretWord ( _Interpreter_, l0, functionFlag ) ;
}

void
LO_CompileOrInterpretArgs ( ListObject *largs )
{
    ListObject * arg ;
    for ( arg = _LO_First ( largs ) ; arg ; arg = _LO_Next ( arg ) )
    {
        if ( GetState ( _Q_->OVT_LC, LC_INTERP_DONE ) ) return ; // i don't remember why this is here ??
        _LO_CompileOrInterpret_One ( arg, 0 ) ; // research : how does CAttribute get set to T_NIL?
    }
}

void
_LO_CompileOrInterpret ( ListObject *lfunction, ListObject *largs )
{
    ListObject *lfword = lfunction->Lo_CfrTilWord ;
    if ( largs && lfword && ( lfword->CAttribute & ( CATEGORY_OP_ORDERED | CATEGORY_OP_UNORDERED ) ) ) // ?!!? 2 arg op with multi-args : this is not a precise distinction yet : need more types ?!!?
    {
        _LO_CompileOrInterpret_One ( largs, 0 ) ;
        while ( ( largs = _LO_Next ( largs ) ) )
        {
            _LO_CompileOrInterpret_One ( largs, 0 ) ; // two args first then op, then after each arg the operator : nb. assumes word can take unlimited args 2 at a time
            _LO_CompileOrInterpret_One ( lfword, 0 ) ;
        }
    }
    else
    {
        LO_CompileOrInterpretArgs ( largs ) ;
#if 0 //NEW_LC_COMPILE    
        if ( lfword && ( ! ( lfword->CAttribute2 & LISP_CFRTIL ) ) ) _LO_CompileOrInterpret_One ( lfword, ( lfunction->LAttribute & T_LISP_SYMBOL ) ) ;
#else        
        if ( lfword && ( ! ( lfword->CAttribute2 & LISP_CFRTIL ) ) ) _LO_CompileOrInterpret_One ( lfword, 1 ) ;
#endif        
    }
    _Q_->OVT_LC->LastInterpretedWord = lfword ;
}

ListObject *
_LO_Do_FunctionBlock ( ListObject *lfunction, ListObject *largs )
{
    LambdaCalculus *lc = _Q_->OVT_LC ;
    ListObject *vReturn, *lfargs = _LO_First ( largs ) ;
    _LO_CompileOrInterpret ( lfunction, lfargs ) ;
    lc->ParenLevel -- ;
    // this is necessary in "lisp" mode : eg. if user hits return but needs to be clarified, refactored, maybe renamed, etc.
    if ( ! GetState ( lc, LC_INTERP_DONE ) )
    {
        if ( CompileMode ) LO_CheckEndBlock ( ) ;
        vReturn = LO_PrepareReturnObject ( ) ;
    }
    else vReturn = nil ;
    return vReturn ;
}

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
    if ( ! Compiler_BlockLevel ( _Compiler_ ) ) _LC_->SavedCodeSpace = _Q_CodeByteArray ;
    CfrTil_BeginBlock ( ) ;
}

void
LO_EndBlock ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    if ( _LC_ && _LC_->SavedCodeSpace )
    {
        BlockInfo * bi = ( BlockInfo * ) _Stack_Top ( compiler->BlockStack ) ;
        CfrTil_EndBlock ( ) ;
        if ( ! GetState ( _LC_, LC_COMPILE_MODE ) )
        {
            CfrTil_BlockRun ( ) ;
        }
        if ( ! Compiler_BlockLevel ( compiler ) ) Set_CompilerSpace ( _LC_->SavedCodeSpace ) ;
        bi->LogicCodeWord = _LC_->LastInterpretedWord ;
    }
}

void
LO_CheckEndBlock ( )
{
    LambdaCalculus * lc = _LC_ ;
    Compiler * compiler = _Context_->Compiler0 ;
    if ( GetState ( compiler, LISP_COMBINATOR_MODE ) )
    {
        int64 cii = _Stack_Top ( compiler->CombinatorInfoStack ) ;
        CombinatorInfo ci ; // remember sizeof of CombinatorInfo = 4 bytes
        ci.CI_i32_Info = cii ;
        if ( ( lc->ParenLevel == ci.ParenLevel ) && ( Compiler_BlockLevel ( compiler ) > ci.BlockLevel ) )
        {
            LO_EndBlock ( ) ;
        }
    }
}

int64
_LO_CheckBeginBlock ( )
{
    LambdaCalculus * lc = _LC_ ;
    Compiler * compiler = _Context_->Compiler0 ;
    int64 cii = _Stack_Top ( compiler->CombinatorInfoStack ) ;
    CombinatorInfo ci ; // remember sizeof of CombinatorInfo = 4 bytes
    ci.CI_i32_Info = cii ;
    if ( ( GetState ( compiler, LISP_COMBINATOR_MODE ) ) && ( lc->ParenLevel == ci.ParenLevel ) && ( Compiler_BlockLevel ( compiler ) == ci.BlockLevel ) )
    {
        return true ;
    }
    return false ;
}

int32
_LO_CheckBegunBlock ( )
{
    LambdaCalculus * lc = _LC_ ;
    Compiler * compiler = _Context_->Compiler0 ;
    int32 cii = _Stack_Top ( compiler->CombinatorInfoStack ) ;
    CombinatorInfo ci ; // remember sizeof of CombinatorInfo = 4 bytes
    ci.CI_i32_Info = cii ;
    if ( ( GetState ( compiler, LISP_COMBINATOR_MODE ) ) && ( lc->ParenLevel == ci.ParenLevel ) && ( Compiler_BlockLevel ( compiler ) > ci.BlockLevel ) )
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
_LO_Apply_ArrayArg ( LambdaCalculus * lc, ListObject ** pl1, int64 i )
{
    Context * cntx = _Context_ ;
    ListObject *l1 = * pl1 ;
    Word * word = l1 ;
    // nb! this block is just CfrTil_ArrayBegin in arrays.c -- refactor??
    // ?needs :: Compiler_CopyDuplicatesAndPush somewhere
    Interpreter * interp = cntx->Interpreter0 ;
    Word * arrayBaseObject = ( ( Word * ) ( LO_Previous ( l1 ) ) )->Lo_CfrTilWord ;
    Word *baseObject = interp->BaseObject ;
    if ( arrayBaseObject )
    {
        Compiler *compiler = cntx->Compiler0 ;
        int64 objSize = 0, increment = 0, variableFlag ;
        int64 svcm = GetState ( compiler, COMPILE_MODE ) ;
        if ( ( ! arrayBaseObject->ArrayDimensions ) ) CfrTil_Exception ( ARRAY_DIMENSION_ERROR, 0, QUIT ) ;
        if ( interp->CurrentObjectNamespace ) objSize = interp->CurrentObjectNamespace->Size ; //_CfrTil_VariableValueGet ( _Context_->Interpreter0->CurrentClassField, ( byte* ) "size" ) ; 
        if ( ! objSize )
        {
            CfrTil_Exception ( OBJECT_SIZE_ERROR, 0, QUIT ) ;
        }
        variableFlag = _CheckArrayDimensionForVariables_And_UpdateCompilerState ( ) ;
        _WordList_Pop ( _CfrTil_->CompilerWordList ) ; // pop the initial '['
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
                SetHere ( baseObject->Coding, 1 ) ;
                _Compile_GetVarLitObj_LValue_To_Reg ( baseObject, ACC ) ;
                _Word_CompileAndRecord_PushReg ( baseObject, ACC ) ;
            }
            if ( Is_DebugModeOn ) Word_PrintOffset ( word, increment, baseObject->AccumulatedOffset ) ;
            if ( baseObject->StackPushRegisterCode ) SetHere ( baseObject->StackPushRegisterCode, 1 ) ;
            Compile_Move_Reg_To_Reg ( RegOrder ( i ++ ), ACC ) ;
            _Debugger_->PreHere = baseObject->Coding ;
            _DEBUG_SHOW ( baseObject, 1 ) ;
        }
        interp->BaseObject = 0 ;
    }
    return i ;
}

int64
_LO_Apply_NonMorphismArg ( LambdaCalculus * lc, ListObject ** pl1, int64 i )
{
    Context * cntx = _Context_ ;
    ListObject *l1 = * pl1 ;
    Word * word = l1 ;
    word = l1->Lo_CfrTilWord ;
    word = Compiler_CopyDuplicatesAndPush ( word ) ;
    word->W_SC_Index = l1->W_SC_Index ;
    byte * here = Here ;
    Word_Eval ( word ) ; // ?? move value directly to RegOrder reg
    Word *baseObject = _Interpreter_->BaseObject ;
    if ( ( word->Name[0] == '\"' ) || ( ! _Lexer_IsTokenForwardDotted ( cntx->Lexer0, l1->W_RL_Index + Strlen ( word->Name ) - 1 ) ) ) // ( word->Name[0] == '\"' ) : sometimes strings have ".[]" chars within but are still just strings
    {
        if ( word->StackPushRegisterCode ) SetHere ( word->StackPushRegisterCode, 1 ) ;
        else if ( baseObject && baseObject->StackPushRegisterCode ) SetHere ( baseObject->StackPushRegisterCode, 1 ) ;
        Compile_Move_Reg_To_Reg ( RegOrder ( i ++ ), ACC ) ;
        if ( baseObject ) _Debugger_->PreHere = baseObject->Coding ;
        SetState ( cntx, ADDRESS_OF_MODE, false ) ;
        _Debugger_->PreHere = here ;
        _DEBUG_SHOW ( word, 1 ) ;
    }
    return i ;
}

int64
_LO_Apply_Arg ( LambdaCalculus * lc, ListObject ** pl1, int64 i )
{
    Context * cntx = _Context_ ;
    ListObject *l1 = * pl1, * l2 ;
    Word * word = l1 ;

    Set_CompileMode ( true ) ;
    if ( l1->LAttribute & ( LIST | LIST_NODE ) )
    {
        Set_CompileMode ( false ) ;
        l2 = LO_Eval ( lc, l1 ) ;
        _Debugger_->PreHere = Here ;
        if ( ! l2 || ( l2->LAttribute & T_NIL ) ) Compile_MoveImm_To_Reg ( RegOrder ( i ++ ), DataStack_Pop ( ), CELL_SIZE ) ;
        else Compile_MoveImm_To_Reg ( RegOrder ( i ++ ), ( int64 ) * l2->Lo_PtrToValue, CELL_SIZE ) ;
        _DEBUG_SHOW ( l2, 1 ) ;
    }
    else if ( ( l1->CAttribute & NON_MORPHISM_TYPE ) )  i = _LO_Apply_NonMorphismArg ( lc, pl1, i ) ;
    else if ( ( l1->Name [0] == '.' ) || ( l1->Name [0] == '&' ) ) 
        _Interpreter_DoWord ( cntx->Interpreter0, l1->Lo_CfrTilWord, l1->W_RL_Index, l1->W_SC_Index ) ;
    else if ( ( l1->Name[0] == '[' ) ) i = _LO_Apply_ArrayArg ( lc, pl1, i ) ;
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
_LO_Apply_C_LtoR_ArgList ( LambdaCalculus * lc, ListObject * l0, Word * word )
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
        if ( ! svcm ) CfrTil_BeginBlock ( ) ;
        if ( word->CAttribute & ( DLSYM_WORD | C_PREFIX ) ) Set_CompileMode ( true ) ;
        _Debugger_->PreHere = Here ;
        for ( i = 0, l1 = _LO_First ( l0 ) ; l1 ; l1 = LO_Next ( l1 ) ) i = _LO_Apply_Arg ( lc, &l1, i ) ;
        Set_CompileMode ( true ) ;
        _Debugger_->PreHere = Here ;
        Word_SetCoding ( word, Here, 1 ) ;
        word->W_SC_Index = l0->W_SC_Index ;
        word = Compiler_CopyDuplicatesAndPush ( word ) ;
        cntx->CurrentlyRunningWord = word ;
        if ( ( String_Equal ( word->Name, "printf" ) || ( String_Equal ( word->Name, "sprintf" ) ) ) ) Compile_MoveImm_To_Reg ( RAX, 0, CELL ) ; // for printf ?? others //System V ABI : "%rax is used to indicate the number of vector arguments passed to a function requiring a variable number of arguments"
        Word_SetCodingHere_And_ClearPreviousUseOf_Here_SCA ( word, 0 ) ;
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

void
LC_CompileRun_C_ArgList ( Word * word ) // C protocol - x64 : left to right arguments put into registers 
{
    LambdaCalculus * lc = LC_NewInit ( ) ;
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
    lc->ParenLevel = 1 ;
    if ( word->CAttribute & ( C_PREFIX | C_PREFIX_RTL_ARGS ) )
    {
        SetState ( compiler, LC_ARG_PARSING, true ) ;
        int64 svcm = CompileMode ;
        Set_CompileMode ( false ) ; // we must have the arguments pushed and not compiled for _LO_Apply_C_Rtl_ArgList which will compile them for a C_Rtl function
        LC_SaveStackPointer ( lc ) ; // ?!? maybe we should do this stuff differently
        DebugShow_Off ;
        l0 = _LO_Read ( lc ) ;
        DebugShow_On ;
        Set_CompileMode ( svcm ) ; // we must have the arguments pushed and not compiled for _LO_Apply_C_Rtl_ArgList which will compile them for a C_Rtl function
        _LO_Apply_C_LtoR_ArgList ( lc, l0, word ) ;
        LC_RestoreStackPointer ( lc ) ; // ?!? maybe we should do this stuff differently
        _LC_ClearTemporariesNamespace ( lc ) ;
        LC_LispNamespaceOff ( ) ;
        SetState ( compiler, LC_ARG_PARSING | LC_C_RTL_ARG_PARSING, false ) ;
    }
    Lexer_SetTokenDelimiters ( lexer, svDelimiters, COMPILER_TEMP ) ;
}

// assumes list contains only one application 

block
CompileLispBlock ( ListObject *args, ListObject * body )
{
    LambdaCalculus * lc = _LC_ ;
    block code ;
    byte * here = Here ;
    Word * word = _CfrTil_->CurrentWordCompiling ;
    LO_BeginBlock ( ) ; // must have a block before local variables if there are register variables because _CfrTil_Parse_LocalsAndStackVariables will compile something
    Namespace * locals = _CfrTil_Parse_LocalsAndStackVariables ( 1, 1, args, 0, 0 ) ;
    word->CAttribute = BLOCK ;
    word->LAttribute |= T_LISP_COMPILED_WORD ;
    SetState ( lc, ( LC_COMPILE_MODE | LC_BLOCK_COMPILE ), true ) ;
    _LO_Eval ( lc, body, locals, 1 ) ;
    if ( GetState ( lc, LC_COMPILE_MODE ) )
    {
        LO_EndBlock ( ) ;
        code = ( block ) DataStack_Pop ( ) ;
        //SetState ( lc, ( LC_COMPILE_MODE | LC_BLOCK_COMPILE ), false ) ;
    }
    else // nb. LISP_COMPILE_MODE : this state can change with some functions that can't be compiled yet
    {
        SetHere ( here, 1 ) ; //recover the unused code space
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
