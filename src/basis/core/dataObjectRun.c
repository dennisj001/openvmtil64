
#include "../../include/cfrtil64.h"

void
_Namespace_Do_C_Type ( Namespace * ns )
{
    Context * cntx = _Context_ ;
    Lexer * lexer = cntx->Lexer0 ;
    Compiler * compiler = cntx->Compiler0 ;
    byte * token1, *token2 ;
    if ( ! GetState ( compiler, DOING_C_TYPE ) )
    {
        SetState ( compiler, DOING_C_TYPE, true ) ;
        if ( ! GetState ( compiler, LC_ARG_PARSING ) )
        {
            if ( ( ! Compiling ) )
            {
                Compiler_Init ( compiler, compiler->State ) ;
                _CfrTil_InitSourceCode_WithName ( _CfrTil_, ns->Name ) ;
            }
            compiler->C_BackgroundNamespace = _Namespace_FirstOnUsingList ( ) ; //nb! must be before CfrTil_LocalsAndStackVariablesBegin else CfrTil_End_C_Block will 
            if ( GetState ( cntx, C_SYNTAX ) )
            {
                LambdaCalculus * svlc = _Q_->OVT_LC ;
                _Q_->OVT_LC = 0 ;
                // ?? parts of this could be screwing up other things and adds an unnecessary level of complexity
                // for parsing C functions 
                token1 = _Lexer_NextNonDebugOrCommentTokenWord ( lexer, 1 ) ;
                int64 token1TokenStart_ReadLineIndex = lexer->TokenStart_ReadLineIndex ;
                token2 = Lexer_PeekNextNonDebugTokenWord ( lexer, 1 ) ;
                if ( token2 [0] == '(' )
                {
                    compiler->C_FunctionBackgroundNamespace = compiler->C_BackgroundNamespace ;
                    SetState ( _Compiler_, C_COMBINATOR_PARSING, true ) ;
                    _Namespace_ActivateAsPrimary ( ns ) ;
                    Word * word = Word_New ( token1 ) ;
                    word->Coding = Here ;
                    _CfrTil_WordList_PushWord ( word ) ;
                    DataStack_Push ( ( int64 ) word ) ; 
                    CfrTil_RightBracket ( ) ; 
                    CfrTil_BeginBlock ( ) ;
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
#if 1                   // this is a little strange but for now i want this capacity somehow ??             
                            byte * token = Lexer_ReadToken ( lexer ) ;
                            if ( String_Equal ( token, "<dbg>" ) )
                            {
                                Compiler * compiler = _Context_->Compiler0 ;
                                BlockInfo * bi = ( BlockInfo * ) _Stack_Top ( compiler->BlockStack ) ;
                                SetHere ( bi->FrameStart ) ; // before _Compile_AddLocalFrame
                                Interpreter_InterpretAToken ( _Interpreter_, token, - 1 ) ;
                                _Compiler_AddLocalFrame ( compiler ) ;
                                Compile_InitRegisterParamenterVariables ( compiler ) ; // this function is called twice to deal with words that have locals before the first block and regular colon words
                                bi->Start = Here ; // after _Compiler_AddLocalFrame and Compile_InitRegisterVariables
                            }
                            else if ( ! _Lexer_ConsiderDebugAndCommentTokens ( token, 1, 0 ) ) _CfrTil_AddTokenToTailOfTokenList ( token ) ;
#endif            
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
                    Interpreter_InterpretAToken ( cntx->Interpreter0, token1, token1TokenStart_ReadLineIndex ) ;
                    if ( Compiling )
                    {
                        compiler->C_BackgroundNamespace = _Namespace_FirstOnUsingList ( ) ;
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
                                _CfrTil_AddTokenToHeadOfTokenList ( token ) ;
                                break ;
                            }
                            else
                            {
                                if ( ( String_Equal ( token, ")" ) ) )
                                {
                                    if ( GetState ( compiler, DOING_A_PREFIX_WORD ) ) _CfrTil_AddTokenToHeadOfTokenList ( token ) ; // add ahead of token2 :: ?? this could be screwing up other things and adds an unnecessary level of complexity
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
        if ( compiler->C_BackgroundNamespace ) _CfrTil_Namespace_InNamespaceSet ( compiler->C_BackgroundNamespace ) ;
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

#if 1    // for debugger in non compile mode    
    if ( word->Offset )
    {
        Compiler_IncrementCurrentAccumulatedOffset ( compiler, word->Offset ) ;
    }
#endif   
#if 0    
    if ( GetState ( cntx, C_SYNTAX ) && ( Is_LValue ( word ) ) )
    {
        compiler->LHS_Word = word ;
    }
#endif    
    if ( ( CompileMode ) || GetState ( compiler, LC_ARG_PARSING ) )
    {
#if 0        
        if ( word->Offset )
        {
            Compiler_IncrementCurrentAccumulatedOffset ( compiler, word->Offset ) ;
        }
#endif        
        if ( CompileMode ) _WordList_Pop ( cntx->Compiler0->WordList, 0 ) ;
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
        d0 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_Dot" ) ) ;

        Word * word = Compiler_PreviousNonDebugWord ( 1 ) ; // 0 : rem: we just popped the WordStack above
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
    _WordList_Pop ( cntx->Compiler0->WordList, 0 ) ; // nb. first else problems with DataObject_Run ( word ) 
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
        _Compile_MoveImm_To_Reg ( ACC, value, CELL ) ;
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

void
_CfrTil_Do_DynamicObject ( DObject * dobject )
{
    Context * cntx = _Context_ ;
    Lexer * lexer = cntx->Lexer0 ;
    DObject * ndobject ;
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
    cntx->Interpreter0->CurrentObjectNamespace = TypeNamespace_Get ( dobject ) ;
    if ( CompileMode )
    {
        _Compile_DataStack_Push ( ( int64 ) dobject->W_PtrToValue ) ; //& dobject->W_DObjectValue ) ; //dobject ) ;
    }
    else
    {
        DataStack_Push ( ( int64 ) dobject->W_PtrToValue ) ; //& dobject->W_DObjectValue ) ; //dobject ) ;
    }
}

void
_Do_Variable ( Word * word )
{
    Context * cntx = _Context_ ;
    if ( GetState ( cntx, C_SYNTAX ) || GetState ( cntx->Compiler0, LC_ARG_PARSING ) )
    {
        if ( Is_LValue ( word ) )
        {
            cntx->Compiler0->LHS_Word = word ;
            word->Coding = Here ;
        }
        else
        {
            if ( GetState ( _Context_, ADDRESS_OF_MODE ) )
            {
                _Compile_GetVarLitObj_LValue_To_Reg ( word, ACC ) ;
                //SetState ( _Context_, ADDRESS_OF_MODE, false ) ; // only good for one variable
            }
            else if ( ! ( word->CAttribute & REGISTER_VARIABLE ) )
            {
                _Compile_GetVarLitObj_RValue_To_Reg ( word, ACC ) ;
            }
            _Word_CompileAndRecord_PushReg ( word, ( word->CAttribute & REGISTER_VARIABLE ) ? word->RegToUse : ACC ) ;
        }
    }
    else
    {
        if ( word->CAttribute & REGISTER_VARIABLE )
        {
            _Compile_Stack_PushReg ( DSP, word->RegToUse ) ;
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
        //if ( GetState ( _Context_, C_SYNTAX ) || GetState ( _Compiler_, LC_ARG_PARSING ) ) // for now until we have time to integrate this optimization
        {
            _Compile_GetVarLitObj_RValue_To_Reg ( word, ACC ) ;
            _Word_CompileAndRecord_PushReg ( word, ACC ) ;
        }
#if 0        
        else
        {
            Compile_ADDI ( REG, DSP, 0, sizeof (int64 ), 0 ) ;
            _Compile_MoveImm_To_Mem ( DSP, ( int64 ) word->W_Value, CELL_SIZE ) ;
        }
#endif        

    }
    else
    {
        if ( word->CAttribute & ( T_STRING | T_RAW_STRING ) ) DataStack_Push ( ( uint64 ) word->W_PtrValue ) ;
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
    if ( CompileMode && GetState ( _CfrTil_, OPTIMIZE_ON ) && ( ! _Q_->OVT_LC ) ) word = Compiler_WordList ( 0 ) ; //_Context_->CurrentlyRunningWord ; //WordStack ( 0 ) ;
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
#if 0 // wha?      
        if ( word->CAttribute & OBJECT )
        {
            Word * bo = cntx->Interpreter0->BaseObject ;
            if ( ( bo ) && ( bo->S_ContainingNamespace == word->S_ContainingNamespace ) )
            {
                SetHere ( bo->Coding ) ; // ?? not fully understood but it solved some of the remaining problem
            }
        }
#endif      
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
    //SetState ( _Context_, ADDRESS_OF_MODE, false ) ; // only good for one variable
}

void
_Do_LocalObject_AllocateInit ( Namespace * typeNamespace, byte ** value, int64 size )
{
    Word * word = _CfrTil_ObjectNew ( size, "<object>", 0, TEMPORARY ) ;
    _Class_Object_Init ( word, typeNamespace ) ;
    * value = ( byte* ) word->W_Value ;
}

#if 0

void
Do_LocalObject_AllocateInit ( ) //( Namespace * typeNamespace, byte ** value, int64 size )
{
    int64 size = DataStack_Pop ( ) ;
    byte ** value = ( byte** ) DataStack_Pop ( ) ;
    Namespace * typeNamespace = ( Namespace* ) DataStack_Pop ( ) ;

    //Word * word = _CfrTil_ObjectNew ( size, "<object>", 0, TEMPORARY ) ;
    //_Class_Object_Init ( word, typeNamespace ) ;
    //* value = ( byte* ) word->W_Value ;
    _Do_LocalObject_AllocateInit ( typeNamespace, value, size ) ;
}
#endif
// 'Run' :: this is part of runtime in the interpreter/compiler for data objects
// they are compiled to much more optimized native code

void
_DataObject_Run ( Word * word )
{
    Context * cntx = _Context_ ;
    cntx->Interpreter0->w_Word = word ; // for ArrayBegin : all literals are run here
    cntx->CurrentlyRunningWord = word ;
    if ( word->LAttribute & LOCAL_OBJECT )
    {
        if ( ( word->CAttribute & LOCAL_VARIABLE ) && ( ! GetState ( word, W_INITIALIZED ) ) ) // this is a local variable so it is initialed at creation 
        {
#if 0            
            int64 size = _Namespace_VariableValueGet ( word->TypeNamespace, ( byte* ) "size" ) ;
            //_Compile_MoveImm_To_Reg ( RDI, ( int64 ) size, CELL ) ;
            DataStack_Push ( ( uint64 ) size ) ;
            //_Compile_Move_Rm_To_Reg ( RDI, RDI, 0 ) ;
            //_Compile_LEA ( RSI, FP, 0, LocalVarIndex_Disp ( LocalVarOffset ( word ) ) ) ; // 2 : account for saved fp and return slot
            DataStack_Push ( ( uint64 ) LocalVarIndex_Disp ( LocalVarOffset ( word ) ) ) ;
            //_Compile_Move_Rm_To_Reg ( RSI, RSI, 0 ) ;
            //_Compile_MoveImm_To_Reg ( RDX, ( int64 ) word->TypeNamespace, CELL ) ;
            DataStack_Push ( ( uint64 ) word->TypeNamespace ) ;
            Compile_Call ( ( byte* ) Do_LocalObject_AllocateInit ) ; // we want to only allocate this object once and only at run time; and not at compile time
#else
            int64 size = _Namespace_VariableValueGet ( word->TypeNamespace, ( byte* ) "size" ) ;
            _Compile_MoveImm_To_Reg ( RDI, ( int64 ) word->TypeNamespace, CELL ) ;
            _Compile_LEA ( RSI, FP, 0, LocalVarIndex_Disp ( LocalVarOffset ( word ) ) ) ;
            //_Compile_Move_Rm_To_Reg ( RSI, RSI, 0 ) ;
            _Compile_MoveImm_To_Reg ( RDX, ( int64 ) size, CELL ) ;
            Compile_Call ( ( byte* ) _Do_LocalObject_AllocateInit ) ; // we want to only allocate this object once and only at run time; and not at compile time
#endif            
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
        _CfrTil_Do_DynamicObject ( word ) ;
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
    else if ( word->CAttribute & ( NAMESPACE ) ) //| CLASS | CLASS_CLONE ) )
    {
        _Namespace_DoNamespace ( word, 1 ) ;
    }
    else if ( word->CAttribute & ( CLASS | CLASS_CLONE ) )
    {
        _Namespace_DoNamespace ( word, 0 ) ;
    }
}

void
DataObject_Run ( )
{
    d0 ( Cpu_CheckRspForWordAlignment ( "DataObject_Run:Before" ) ) ;
    Word * word = _Context_->CurrentlyRunningWord ;
    DEBUG_SETUP ( word ) ;
    _DataObject_Run ( word ) ;
    DEBUG_SHOW ;
    d0 ( Cpu_CheckRspForWordAlignment ( "DataObject_Run:After" ) ) ;
}

