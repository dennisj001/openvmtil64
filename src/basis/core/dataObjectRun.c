
#include "../../include/cfrtil64.h"

void
_DataObject_Run ( Word * word0 )
{
    Context * cntx = _Context_ ;
    Word * word = cntx->CurrentlyRunningWord ; // = word0 : set CurrentlyRunningWord with the DObject Compile_SetCurrentlyRunningWord_Call_TestRSP created word
    Word * ns = word0 ; // set CurrentlyRunningWord with the DObject Compile_SetCurrentlyRunningWord_Call_TestRSP created word
    cntx->Interpreter0->w_Word = word ; // for ArrayBegin : all literals are run here
    _Set_SCA ( word0 ) ;
    _Set_SCA ( word ) ;
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
    else if ( word->CAttribute & DOBJECT )
    {
        CfrTil_Do_DynamicObject ( word, ACC ) ;
    }
    else if ( word->CAttribute & ( LITERAL | CONSTANT ) )
    {
        _CfrTil_Do_Literal ( word ) ;
    }
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
    else if ( word->CAttribute & ( C_TYPE | C_CLASS ) )
    {
        _Namespace_Do_C_Type ( word ) ;
    }
    else if ( ns->CAttribute & ( NAMESPACE ) ) //| CLASS | CLASS_CLONE ) )
    {
        _Namespace_DoNamespace ( ns, 1 ) ; // namespaces are the only word that needs to run the word set DObject Compile_SetCurrentlyRunningWord_Call_TestRSP created word ??
    }
    else if ( word->CAttribute & ( CLASS | CLASS_CLONE ) )
    {
        _Namespace_DoNamespace ( word, 0 ) ;
    }
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
    byte * token1, *token2 ; Word * beginWord ;
    if ( ! GetState ( compiler, DOING_C_TYPE ) )
    {
        SetState ( compiler, DOING_C_TYPE, true ) ;
        if ( ! GetState ( compiler, LC_ARG_PARSING ) )
        {
            if ( ( ! Compiling ) )
            {
                Compiler_Init ( compiler, 0 ) ; //compiler->State ) ;
                _CfrTil_InitSourceCode_WithName ( _CfrTil_, ns->Name ) ;
            }
            CfrTil_WordList_RecycleInit ( _CfrTil_, 0, 0, 1, 1 ) ;
            Compiler_Get_C_BackgroundNamespace ( compiler ) ;
            if ( GetState ( cntx, C_SYNTAX ) )
            {
                LambdaCalculus * svlc = _Q_->OVT_LC ;
                _Q_->OVT_LC = 0 ;
                // ?? parts of this could be screwing up other things and adds an unnecessary level of complexity
                // for parsing C functions 
                token1 = _Lexer_NextNonDebugOrCommentTokenWord ( lexer, 1, 0 ) ; // ? peekFlag ?
                int64 t1_tsrli = lexer->TokenStart_ReadLineIndex ;
                token2 = Lexer_PeekNextNonDebugTokenWord ( lexer, 1 ) ;
                if ( token2 [0] == '(' )
                {
                    compiler->C_FunctionBackgroundNamespace = compiler->C_BackgroundNamespace ;
                    SetState ( _Compiler_, C_COMBINATOR_PARSING, true ) ;
                    Namespace_DoNamespace ( ( byte* ) "C_Syntax" ) ;
                    _Namespace_ActivateAsPrimary ( ns ) ;
                    Word * word = Word_New ( token1 ) ; // "("
                    DataStack_Push ( ( int64 ) word ) ;
#if 1                    
                    beginWord = _CfrTil_->BeginBlockWord ;
                    Block_Eval ( beginWord->Definition ) ; //( beginWord ) ;
                    CfrTil_LocalsAndStackVariablesBegin ( ) ;
                    CfrTil_WordList_PushWord ( beginWord ) ;
                    _Set_SCA ( beginWord ) ;
#else                    
                    CfrTil_BeginBlock ( ) ; // nb! before CfrTil_LocalsAndStackVariablesBegin
                    CfrTil_LocalsAndStackVariablesBegin ( ) ;
#endif                    
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
                    Interpreter_InterpretAToken ( cntx->Interpreter0, token1, t1_tsrli ) ;
                    if ( Compiling )
                    {
                        Compiler_Get_C_BackgroundNamespace ( compiler ) ;
                        while ( 1 )
                        {
                            byte * token = _Interpret_C_Until_EitherToken ( cntx->Interpreter0, ( byte* ) ",", ( byte* ) ";", 0, 0 ) ;
                            if ( ! token ) break ;
                            if ( ( String_Equal ( token, "," ) ) )
                            {
                                compiler->LHS_Word = 0 ;
                                if ( GetState ( compiler, DOING_A_PREFIX_WORD ) ) break ;
                                else continue ;
                            }
                            if ( ( String_Equal ( token, ";" ) ) )
                            {
                                _CfrTil_PushToken_OnTokenList ( token ) ;
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
                _Q_->OVT_LC = svlc ;
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

    if ( word->Offset )
    {
        Compiler_IncrementCurrentAccumulatedOffset ( compiler, word->Offset ) ;
    }
    if ( ( CompileMode ) || GetState ( compiler, LC_ARG_PARSING ) )
    {
    }
    else
    {
        accumulatedAddress = ( byte* ) TOS ; //_DataStack_Pop ( ) ;
        accumulatedAddress += word->Offset ;
        //TOS += word->Offset ;
        if ( GetState ( cntx, C_SYNTAX ) && ( ! Is_LValue ( word ) ) && ( ! GetState ( _Context_, ADDRESS_OF_MODE ) ) )
        {
            //_DataStack_Push ( * ( int64* ) accumulatedAddress ) ; // C rvalue
            TOS = ( * ( int64* ) accumulatedAddress ) ; // C rvalue
        }
        else
        {
            //_DataStack_Push ( accumulatedAddress ) ;
            TOS = ( uint64 ) accumulatedAddress ;
            //SetState ( _Context_, ADDRESS_OF_MODE, false ) ;
        }
    }
    if ( Lexer_IsTokenForwardDotted ( cntx->Lexer0 ) ) Finder_SetQualifyingNamespace ( cntx->Finder0, word->ClassFieldTypeNamespace ) ;
}

// nb. 'word' is the previous word to the '.' (dot) cf. CfrTil_Dot so it can be recompiled, a little different maybe, as an object

void
CfrTil_Dot ( ) // .
{
    Context * cntx = _Context_ ;
    if ( ! cntx->Interpreter0->BaseObject )
    {
        SetState ( cntx, CONTEXT_PARSING_QID, true ) ;
        d0 ( if ( Is_DebugModeOn ) _Compiler_Show_WordList ( "\nCfrTil_Dot", 0 ) ) ;

        Word * word = Compiler_PreviousNonDebugWord ( 0 ) ; // 0 : rem: we just popped the WordStack above
        if ( word )
        {
            if ( word->CAttribute & NAMESPACE_TYPE )
            {
                Finder_SetQualifyingNamespace ( cntx->Finder0, word ) ;
            }
            else
            {
                cntx->Interpreter0->BaseObject = word ;
            }
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

void
_Do_Literal ( int64 value )
{
    if ( CompileMode )
    {
        Compile_MoveImm_To_Reg ( ACC, value, CELL ) ;
        Compiler_CompileAndRecord_PushAccum ( _Context_->Compiler0 ) ; // does word == top of word stack always
    }
    else DataStack_Push ( value ) ;
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
    if ( ! Lexer_IsTokenForwardDotted ( cntx->Lexer0 ) )
    {
        _Namespace_ActivateAsPrimary ( ns ) ;
    }
    else
    {
        Finder_SetQualifyingNamespace ( cntx->Finder0, ns ) ;
    }
    cntx->Interpreter0->BaseObject = 0 ;
}

DObject *
_CfrTil_Do_DynamicObject_ToReg ( DObject * dobject0, int8 reg )
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
    _Set_SCA ( dobject ) ;
    if ( CompileMode ) _Compile_Move_Literal_Immediate_To_Reg ( reg, ( int64 ) & dobject->W_Value ) ;
    cntx->Interpreter0->CurrentObjectNamespace = TypeNamespace_Get ( dobject ) ; // do this elsewhere when needed
    return dobject ;
}

void
CfrTil_Do_DynamicObject ( DObject * dobject0, int8 reg )
{
    DObject * dobject = _CfrTil_Do_DynamicObject_ToReg ( dobject0, reg ) ;
    if ( CompileMode )
    {
        //CfrTil_WordLists_PopWord ( ) ;
        //dobject0 = Compiler_CopyDuplicatesAndPush ( dobject ) ;
        _Word_CompileAndRecord_PushReg ( dobject0, reg ) ;
    }
    else
    {
        DataStack_Push ( ( int64 ) & dobject->W_Value ) ; //& dobject->W_DObjectValue ) ; //dobject ) ;
    }
}

void
_Do_Variable ( Word * word )
{
    Context * cntx = _Context_ ;
    if ( GetState ( cntx, C_SYNTAX | INFIX_MODE ) || GetState ( cntx->Compiler0, LC_ARG_PARSING ) )
    {
#if 1       
        if ( Is_LValue ( word ) )
        {
            cntx->Compiler0->LHS_Word = word ;
            word->Coding = Here ;
            //_Compile_GetVarLitObj_LValue_To_Reg ( word, ACC ) ;
        }
        else
#endif            
        {
            if ( GetState ( _Context_, ADDRESS_OF_MODE ) )
            {
                _Compile_GetVarLitObj_LValue_To_Reg ( word, ACC ) ;
                //SetState ( _Context_, ADDRESS_OF_MODE, false ) ; // only good for one variable
            }
            else if ( ! ( word->CAttribute & REGISTER_VARIABLE ) )
            {
                Compile_GetVarLitObj_RValue_To_Reg ( word, ACC ) ;
            }
            _Word_CompileAndRecord_PushReg ( word, ( word->CAttribute & REGISTER_VARIABLE ) ? word->RegToUse : ACC ) ;
        }
    }
    else
    {
        if ( word->CAttribute & REGISTER_VARIABLE )
        {
            //_Compile_Stack_PushReg ( DSP, word->RegToUse ) ;
            _Word_CompileAndRecord_PushReg ( word, word->RegToUse ) ;
        }
        else
        {
            _Compile_GetVarLitObj_LValue_To_Reg ( word, ACC ) ;
            _Word_CompileAndRecord_PushReg ( word, ACC ) ;
        }
    }
}

void
_CfrTil_Do_Literal ( Word * word )
{
    if ( CompileMode )
    {
        Compile_GetVarLitObj_RValue_To_Reg ( word, ACC ) ;
        _Word_CompileAndRecord_PushReg ( word, ACC ) ;
    }
    else
    {
        if ( word->CAttribute & ( T_STRING | T_RAW_STRING ) ) DataStack_Push ( ( uint64 ) word->W_BytePtr ) ;
        else DataStack_Push ( word->W_Value ) ;
    }
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
    // since we can have multiple uses of the same word in a block we make copies in Compiler_CheckAndCopyDuplicates 
    // so be sure to use the current copy on top of the WordStack
    if ( CompileMode && GetState ( _CfrTil_, OPTIMIZE_ON ) && ( ! _Q_->OVT_LC ) ) word = CfrTil_WordList ( 0 ) ; //_Context_->CurrentlyRunningWord ; //WordStack ( 0 ) ;
    if ( ! ( word->CAttribute & ( NAMESPACE_VARIABLE ) ) )
    {
        if ( word->CAttribute & ( OBJECT | THIS | QID ) || GetState ( word, QID ) ) //Finder_GetQualifyingNamespace ( cntx->Finder0 ) )
        {
            word->AccumulatedOffset = 0 ;
            word->Coding = Here ;
            cntx->Interpreter0->BaseObject = word ;
            cntx->Interpreter0->CurrentObjectNamespace = TypeNamespace_Get ( word ) ;
            cntx->Compiler0->AccumulatedOffsetPointer = 0 ;
            cntx->Compiler0->AccumulatedOptimizeOffsetPointer = & word->AccumulatedOffset ;
            word->CAttribute |= OBJECT ;
            if ( word->CAttribute & THIS )
            {
                word->S_ContainingNamespace = _Context_->Interpreter0->ThisNamespace ;
            }
        }
    }
    if ( CompileMode )
    {
        _Do_Variable ( word ) ;
    }
    else
    {

        if ( word->CAttribute & ( OBJECT | THIS ) )
        {
            if ( cntx->Compiler0->AccumulatedOffsetPointer )
            {
                if ( GetState ( cntx, C_SYNTAX ) )
                {
                    if ( ( ! Is_LValue ( word ) ) && ( Lexer_NextNonDelimiterChar ( cntx->Lexer0 ) != '.' ) )
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
                if ( Is_LValue ( word ) ) value = ( int64 ) word->W_PtrToValue ;
                else value = ( int64 ) * word->W_PtrToValue ;
            }
            else value = ( int64 ) word->W_PtrToValue ;
            if ( cntx->Interpreter0->BaseObject )
            {
                TOS = value ;
            }
            else DataStack_Push ( value ) ;
        }
    }
}

void
_Do_LocalObject_AllocateInit ( Namespace * typeNamespace, byte ** value, int64 size )
{
    Word * word = _CfrTil_ObjectNew ( size, "<object>", 0, TEMPORARY ) ;
    _Class_Object_Init ( word, typeNamespace ) ;
    * value = ( byte* ) word->W_Value ;
}


