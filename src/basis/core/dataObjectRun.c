
#include "../../include/cfrtil64.h"

void
_DataObject_Run ( Word * word0 )
{
    Context * cntx = _Context_ ;
    Word * word = _Context_CurrentWord ( cntx ) ; // = word0 : set CurrentlyRunningWord with the DObject Compile_SetCurrentlyRunningWord_Call_TestRSP created word
    Word * ns = word0 ; // set CurrentlyRunningWord with the DObject Compile_SetCurrentlyRunningWord_Call_TestRSP created word
    cntx->Interpreter0->w_Word = word ; // for ArrayBegin : all literals are run here
    if ( word->LAttribute & LOCAL_OBJECT )
    {
        if ( ( word->CAttribute & LOCAL_VARIABLE ) && ( ! GetState ( word, W_INITIALIZED ) ) ) // this is a local variable so it is initialed at creation 
        {
            int64 size = _Namespace_VariableValueGet ( word->TypeNamespace, ( byte* ) "size" ) ;
            Compile_MoveImm_To_Reg ( RDI, ( int64 ) word->TypeNamespace, CELL ) ;
            _Compile_LEA ( RSI, FP, 0, LocalVarIndex_Disp ( LocalVarOffset ( word ) ) ) ;
            //_Compile_Move_Rm_To_Reg ( RSI, RSI, 0 ) ;
            Compile_MoveImm_To_Reg ( RDX, ( int64 ) size, CELL ) ;
            Compile_Call_TestRSP ( ( byte* ) _Do_LocalObject_AllocateInit ) ; // we want to only allocate this object once and only at run time; and not at compile time
            SetState ( word, W_INITIALIZED, true ) ;
        }
        _CfrTil_Do_Variable ( word ) ;
    }
    else if ( word->CAttribute & T_LISP_SYMBOL )
    {
        if ( ! GetState ( cntx->Compiler0, LC_CFRTIL ) ) _CfrTil_Do_LispSymbol ( word ) ;
        else _CfrTil_Do_Variable ( word ) ;
    }
    else if ( word->CAttribute & DOBJECT ) CfrTil_Do_DynamicObject ( word, ACC ) ;
    else if ( word->CAttribute & ( LITERAL | CONSTANT ) ) _CfrTil_Do_LiteralWord ( word ) ;
    else if ( word->CAttribute & OBJECT_FIELD )
    {
        _CfrTil_Do_ClassField ( word ) ;
        if ( ( ! Lexer_IsTokenForwardDotted ( cntx->Lexer0 ) ) && ( ! GetState ( cntx->Compiler0, LC_ARG_PARSING ) ) ) cntx->Interpreter0->BaseObject = 0 ;
    }
    else if ( word->CAttribute & ( NAMESPACE_VARIABLE | THIS | OBJECT | LOCAL_VARIABLE | PARAMETER_VARIABLE ) )
    {
        _CfrTil_Do_Variable ( word ) ;
        if ( ( ! Lexer_IsTokenForwardDotted ( cntx->Lexer0 ) ) && ( ! GetState ( cntx->Compiler0, LC_ARG_PARSING ) ) ) cntx->Interpreter0->BaseObject = 0 ;
    }
    else if ( word->CAttribute & ( C_TYPE | C_CLASS ) ) _Namespace_Do_C_Type ( word ) ;
    else if ( ns->CAttribute & ( NAMESPACE ) ) //| CLASS | CLASS_CLONE ) )
    {
        _Namespace_DoNamespace ( ns, 1 ) ; // namespaces are the only word that needs to run the word set DObject Compile_SetCurrentlyRunningWord_Call_TestRSP created word ??
    }
    else if ( word->CAttribute & ( CLASS | CLASS_CLONE ) ) _Namespace_DoNamespace ( word, 0 ) ;
}

void
DataObject_Run ( )
{
    Word * word = ( Word * ) DataStack_Pop ( ) ; //_Context_->CurrentlyRunningWord ;
    _DataObject_Run ( word ) ;
}

void
Compiler_Get_C_BackgroundNamespace ( Compiler * compiler )
{
    compiler->C_BackgroundNamespace = _Namespace_FirstOnUsingList ( ) ; //nb! must be before CfrTil_LocalsAndStackVariablesBegin else CfrTil_End_C_Block will 
}

void
Compiler_SetAs_InNamespace_C_BackgroundNamespace ( Compiler * compiler )
{
    if ( compiler->C_BackgroundNamespace ) _CfrTil_Namespace_InNamespaceSet ( compiler->C_BackgroundNamespace ) ;
}

void
_Namespace_Do_C_Type ( Namespace * ns )
{
    Context * cntx = _Context_ ;
    Lexer * lexer = cntx->Lexer0 ;
    Compiler * compiler = cntx->Compiler0 ;
    byte * token1, *token2 ;
    Word * word ;
    if ( ! GetState ( compiler, DOING_C_TYPE ) )
    {
        SetState ( compiler, DOING_C_TYPE, true ) ;
        if ( ! GetState ( compiler, LC_ARG_PARSING ) )
        {
            if ( ( ! Compiling ) )
            {
                Compiler_Init ( compiler, 0, 0 ) ; //compiler->State ) ;
                CfrTil_InitSourceCode_WithName ( _CfrTil_, ns->Name, 1 ) ;
            }
            CfrTil_WordList_Init ( 0, 1 ) ;
            Compiler_Get_C_BackgroundNamespace ( compiler ) ;
            if ( GetState ( cntx, C_SYNTAX ) )
            {
                LambdaCalculus * svlc = _LC_ ;
                _LC_ = 0 ;
                // ?? parts of this could be screwing up other things and adds an unnecessary level of complexity
                // for parsing C functions 
                token1 = _Lexer_NextNonDebugOrCommentTokenWord (lexer, 0, 1, 0 ) ; // ? peekFlag ?
                int64 t1_tsrli = lexer->TokenStart_ReadLineIndex ;
                token2 = Lexer_PeekNextNonDebugTokenWord ( lexer, 1 ) ;
                if ( token2 [0] == '(' )
                {
                    compiler->C_FunctionBackgroundNamespace = compiler->C_BackgroundNamespace ;
                    SetState ( _Compiler_, C_COMBINATOR_PARSING, true ) ;
                    //Namespace_DoNamespace ( ( byte* ) "C_Syntax" ) ;
                    //_Namespace_ActivateAsPrimary ( ns ) ;
                    CfrTil_C_Syntax_On ( ) ;
                    Word * word = Word_New ( token1 ) ; // "("
                    DataStack_Push ( ( int64 ) word ) ;
                    CfrTil_BeginBlock ( ) ; // nb! before CfrTil_LocalsAndStackVariablesBegin
                    CfrTil_LocalsAndStackVariablesBegin ( ) ;
                    Ovt_AutoVarOn ( ) ;
                    do
                    {
                        byte * token = Lexer_ReadToken ( lexer ) ;
                        if ( String_Equal ( token, "s{" ) )
                        {
                            Interpreter_InterpretAToken ( _Interpreter_, token, - 1 ) ;
                            break ;
                        }
                        else if ( token [ 0 ] == '{' )
                        {
                            break ; // take nothing else (would be Syntax Error ) -- we have already done CfrTil_BeginBlock
                        }
                        else _Lexer_ConsiderDebugAndCommentTokens ( token, 1, 0 ) ;
                    }
                    while ( 1 ) ;
                    goto rtrn ;
                }
                else
                {
                    if ( Compiling ) Ovt_AutoVarOn ( ) ;
                    _Namespace_DoNamespace ( ns, 1 ) ;
                    // remember : we have already gotten a token
                    word = Finder_Word_FindUsing ( cntx->Finder0, token1, 0 ) ;
                    Interpreter_InterpretAToken ( cntx->Interpreter0, token1, t1_tsrli ) ;
                    //if ( word ) goto rtrn ;//else Interpreter_DoWord ( cntx->Interpreter0, word, -1, - 1 ) ;
                    if ( (! word) && Compiling )
                    {
                        Compiler_Get_C_BackgroundNamespace ( compiler ) ;
                        while ( 1 )
                        {
                            byte * token = Interpret_C_Until_Token4 (cntx->Interpreter0, ( byte* ) ",", ( byte* ) ";", 0, 0, 0 ) ;
                            if ( ! token ) break ;
                            if ( ( String_Equal ( token, "," ) ) )
                            {
                                compiler->LHS_Word = 0 ;
                                break ;
                            }
                            if ( ( String_Equal ( token, ";" ) ) )
                            {
                                _CfrTil_PushToken_OnTokenList ( token ) ;
                                //compiler->LHS_Word = 0 ;
                                break ;
                            }
                            else
                            {
                                if ( ( String_Equal ( token, ")" ) ) )
                                {
                                    if ( GetState ( compiler, DOING_A_PREFIX_WORD ) ) _CfrTil_PushToken_OnTokenList ( token ) ; // add ahead of token2 :: ?? this could be screwing up other things and adds an unnecessary level of complexity
                                }
                                compiler->LHS_Word = 0 ;
                                break ;
                            }
                        }
                    }
                }
                _LC_ = svlc ;
            }
        }
        else _Namespace_DoNamespace ( ns, 1 ) ;
rtrn:
        if ( ! Compiling ) Compiler_SetAs_InNamespace_C_BackgroundNamespace ( compiler ) ;
        SetState ( compiler, DOING_C_TYPE, false ) ;
    }
}

void
_CfrTil_Do_ClassField ( Word * word )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    cntx->Interpreter0->CurrentObjectNamespace = word ; // update this namespace 
    compiler->ArrayEnds = 0 ;
    byte * accumulatedAddress ;

    if ( word->Offset ) Compiler_IncrementCurrentAccumulatedOffset ( compiler, word->Offset ) ;
    if ( ! ( ( CompileMode ) || GetState ( compiler, LC_ARG_PARSING ) ) )
    {
        accumulatedAddress = ( byte* ) TOS ; //_DataStack_Pop ( ) ;
        accumulatedAddress += word->Offset ;
        if ( GetState ( cntx, C_SYNTAX ) && ( ! Lexer_IsLValue_CheckBackToLastSemiForParenOrBracket ( _Lexer_, word ) ) && ( ! GetState ( cntx, ADDRESS_OF_MODE ) ) )
        {
            TOS = ( * ( int64* ) accumulatedAddress ) ; // C rlvalue
        }
        else TOS = ( uint64 ) accumulatedAddress ; // C lvalue
    }
    if ( Lexer_IsTokenForwardDotted ( cntx->Lexer0 ) ) Finder_SetQualifyingNamespace ( cntx->Finder0, word->ClassFieldTypeNamespace ) ;
    CfrTil_TypeStack_SetTop ( word ) ;
}

// nb. 'word' is the previous word to the '.' (dot) cf. CfrTil_Dot so it can be recompiled, a little different maybe, as an object

void
CfrTil_Dot ( ) // .
{
    Context * cntx = _Context_ ;
    if ( ! cntx->Interpreter0->BaseObject )
    {
        SetState ( cntx, CONTEXT_PARSING_QID, true ) ;
        d0 ( if ( Is_DebugModeOn ) Compiler_SC_WordList_Show ( "\nCfrTil_Dot", 0, 0 ) ) ;
        Word * word = Compiler_PreviousNonDebugWord ( 0 ) ; // 0 : rem: we just popped the WordStack above
        if ( word )
        {
            if ( word->CAttribute & NAMESPACE_TYPE ) Finder_SetQualifyingNamespace ( cntx->Finder0, word ) ;
            else cntx->Interpreter0->BaseObject = word ;
        }
    }
}

// rvalue - rhs value - right hand side of '=' - the actual value, used on the right hand side of C statements

void
_Word_CompileAndRecord_PushReg ( Word * word, int64 reg )
{
    if ( word )
    {
        word->StackPushRegisterCode = Here ; // nb. used! by the rewriting optInfo
        if ( word->CAttribute & REGISTER_VARIABLE ) _Compile_Stack_PushReg ( DSP, word->RegToUse ) ;
        else
        {
            _Compile_Stack_PushReg ( DSP, reg ) ;
            word->RegToUse = reg ;
        }
    }
}

// a constant is, of course, a literal

void
_Namespace_DoNamespace ( Namespace * ns, int64 immFlag )
{
    Context * cntx = _Context_ ;
    if ( ( ! immFlag ) && CompileMode && ( Lexer_NextNonDelimiterChar ( cntx->Lexer0 ) != '.' ) && ( ! GetState ( cntx->Compiler0, LC_ARG_PARSING ) ) )
    {
        _Compile_C_Call_1_Arg ( ( byte* ) _Namespace_DoNamespace, ( int64 ) ns ) ;
    }
    if ( ! Lexer_IsTokenForwardDotted ( cntx->Lexer0 ) ) _Namespace_ActivateAsPrimary ( ns ) ;
    else Finder_SetQualifyingNamespace ( cntx->Finder0, ns ) ;
    cntx->Interpreter0->BaseObject = 0 ;
}

DObject *
_CfrTil_Do_DynamicObject_ToReg ( DObject * dobject0, Boolean reg )
{
    Context * cntx = _Context_ ;
    Lexer * lexer = cntx->Lexer0 ;
    DObject *dobject = dobject0, * ndobject ;
    byte * token ;
    while ( Lexer_IsTokenForwardDotted ( lexer ) )
    {
        Lexer_ReadToken ( lexer ) ; // the '.'
        token = Lexer_ReadToken ( lexer ) ;
        if ( String_Equal ( "prototype", ( char* ) token ) )
        {
            dobject = dobject->ContainingNamespace ;
            continue ;
        }
        if ( ! ( ndobject = _DObject_FindSlot_BottomUp ( dobject, token ) ) )
        {
            dobject = _DObject_NewSlot ( dobject, token, 0 ) ;
        }
        else dobject = ndobject ;
    }
    Word_SetCodingHere_And_ClearPreviousUseOf_Here_SCA ( dobject, 0 ) ;
    if ( CompileMode ) _Compile_Move_Literal_Immediate_To_Reg ( reg, ( int64 ) & dobject->W_Value ) ;
    cntx->Interpreter0->CurrentObjectNamespace = TypeNamespace_Get ( dobject ) ; // do this elsewhere when needed
    return dobject ;
}

void
CfrTil_Do_DynamicObject ( DObject * dobject0, Boolean reg )
{
    DObject * dobject = _CfrTil_Do_DynamicObject_ToReg ( dobject0, reg ) ;
    if ( CompileMode ) _Word_CompileAndRecord_PushReg ( dobject0, reg ) ;
    else DataStack_Push ( ( int64 ) & dobject->W_Value ) ; //& dobject->W_DObjectValue ) ; //dobject ) ;
}

void
_Do_C_Syntax_Variable ( Word * word )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    Boolean isLValue = Is_LValue ( cntx, word ) ;
    if ( isLValue )
    {
        if ( ( ! compiler->LHS_Word ) || ( compiler->LHS_Word == word ) || GetState ( compiler, ARRAY_MODE ) )
        {
            compiler->LHS_Word = word ;
            Word_SetCoding ( word, Here, 1 ) ;
            if ( ( word->CAttribute & ( OBJECT | THIS | QID ) ) || GetState ( word, QID ) )
            {
                _Compile_GetVarLitObj_LValue_To_Reg ( word, ACC ) ;
            }
            else { Word_SetCoding ( word, 0, 1 ) ; return ; } //no code for this case
        }
        else _Compile_GetVarLitObj_LValue_To_Reg ( word, ACC ) ;
    }
    else if ( ( ! ( word->CAttribute & REGISTER_VARIABLE ) ) ) Compile_GetVarLitObj_RValue_To_Reg ( word, ACC ) ;
    if ( Is_DebugOn ) _Printf ( ( byte * ) "\n_Do_C_Syntax_Variable : word = %s :: %s compiled", word->Name, isLValue ? "lvalue" : "rvalue" ) ;
    _Word_CompileAndRecord_PushReg ( word, ( word->CAttribute & REGISTER_VARIABLE ) ? word->RegToUse : ACC ) ;
    //CfrTil_TypeStackPush ( word ) ;
}

void
_Do_Variable ( Word * word )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    if ( GetState ( cntx, C_SYNTAX | INFIX_MODE ) || GetState ( compiler, LC_ARG_PARSING ) )
    {
        _Do_C_Syntax_Variable ( word ) ;
    }
    else
    {
        if ( word->CAttribute & REGISTER_VARIABLE )
        {
            SetPreHere_ForDebug ( Here ) ;
            _Word_CompileAndRecord_PushReg ( word, word->RegToUse ) ;
        }
        else
        {
            _Compile_GetVarLitObj_LValue_To_Reg ( word, ACC ) ;
            _Word_CompileAndRecord_PushReg ( word, ACC ) ;
        }
    }
    CfrTil_TypeStackPush ( word ) ;
}

void
_Do_LiteralValue ( int64 value )
{
    if ( CompileMode )
    {
        Compile_MoveImm_To_Reg ( ACC, value, CELL ) ;
        CfrTil_CompileAndRecord_PushAccum ( ) ; // does word == top of word stack always
    }
    else DataStack_Push ( value ) ;
}

void
_CfrTil_Do_LiteralWord ( Word * word )
{
    if ( CompileMode )
    {
        Compile_GetVarLitObj_RValue_To_Reg ( word, ACC ) ;
        _Word_CompileAndRecord_PushReg ( word, ACC ) ;
    }
    else
    {
        uint64 value ;
        if ( word->CAttribute & ( T_STRING | T_RAW_STRING ) ) value = ( uint64 ) word->W_BytePtr ; //DataStack_Push ( ( uint64 ) word->W_BytePtr ) ;
        else value = word->W_Value ;
        DataStack_Push ( value ) ;
    }
    CfrTil_TypeStackPush ( word ) ;
}

void
_CfrTil_Do_LispSymbol ( Word * word )
{
    // rvalue - rhs for stack var
    _Compile_Move_StackN_To_Reg ( ACC, FP, ParameterVarOffset ( word ) ) ;
    _Word_CompileAndRecord_PushReg ( word, ACC ) ;
}

void
_CfrTil_Do_Variable ( Word * word )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    // since we can have multiple uses of the same word in a block we make copies in Compiler_CheckAndCopyDuplicates 
    // so be sure to use the current copy on top of the WordStack
    if ( CompileMode && GetState ( _CfrTil_, OPTIMIZE_ON ) && ( ! _LC_ ) ) word = CfrTil_WordList ( 0 ) ; //_Context_->CurrentlyRunningWord ; //WordStack ( 0 ) ;
    //if ( ! compiler->LHS_Word ) compiler->LHS_Word = word ;
    if ( ! ( word->CAttribute & ( NAMESPACE_VARIABLE ) ) )
    {
        if ( word->CAttribute & ( OBJECT | THIS | QID ) || GetState ( word, QID ) ) //Finder_GetQualifyingNamespace ( cntx->Finder0 ) )
        {
            word->AccumulatedOffset = 0 ;
            cntx->Interpreter0->BaseObject = word ;
            cntx->Interpreter0->CurrentObjectNamespace = TypeNamespace_Get ( word ) ;
            Compiler_Init_AccumulatedOffsetPointers ( compiler, word ) ;
            word->CAttribute |= OBJECT ;
            if ( word->CAttribute & THIS ) word->S_ContainingNamespace = _Context_->Interpreter0->ThisNamespace ;
        }
    }
    if ( CompileMode ) _Do_Variable ( word ) ;
    else
    {
        if ( word->CAttribute & ( OBJECT | THIS ) )
        {
            if ( cntx->Compiler0->AccumulatedOffsetPointer )
            {
                if ( GetState ( cntx, C_SYNTAX ) )
                {
                    if ( ( ! Is_LValue ( cntx, word ) ) && ( Lexer_NextNonDelimiterChar ( cntx->Lexer0 ) != '.' ) )
                    {
                        DataStack_Push ( * ( int64* ) word->W_PtrToValue + word->AccumulatedOffset ) ;
                    }
                    else DataStack_Push ( ( uint64 ) ( word->W_PtrToValue + word->AccumulatedOffset ) ) ;
                }
            }
            else DataStack_Push ( word->W_Value ) ;
        }
        else if ( word->CAttribute & NAMESPACE_VARIABLE )
        {
            int64 value ;
            if ( GetState ( cntx, C_SYNTAX ) )
            {
                if ( Is_LValue ( cntx, word ) ) value = ( int64 ) word->W_PtrToValue ;
                else value = ( int64 ) * word->W_PtrToValue ;
            }
            else value = ( int64 ) word->W_PtrToValue ;
            if ( cntx->Interpreter0->BaseObject ) TOS = value ;
            else DataStack_Push ( value ) ;
            //else DataStack_Push_TypeStackPush ( word, value ) ;
        }
        CfrTil_TypeStackPush ( word ) ;
    }
}

void
_Do_LocalObject_AllocateInit ( Namespace * typeNamespace, byte ** value, int64 size )
{
    Word * word = _CfrTil_ObjectNew ( size, "<object>", 0, TEMPORARY ) ;
    _Class_Object_Init ( word, typeNamespace ) ;
    * value = ( byte* ) word->W_Value ;
}


