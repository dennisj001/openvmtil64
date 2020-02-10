
#include "../../include/cfrtil64.h"

// rvalue - rhs value - right hand side of '=' - the actual value, used on the right hand side of C statements

void
Object_Run ( Word * word )
{
    Context * cntx = _Context_ ;
    Boolean rvalueFlag, isForwardDotted, isReverseDotted ;
    cntx->Interpreter0->w_Word = word ; // for ArrayBegin : all literals are run here
    if ( word->W_ObjectAttributes & ( LITERAL | CONSTANT ) ) CfrTil_Do_LiteralWord ( word ) ;
    else
    {
        isForwardDotted = ReadLiner_IsTokenForwardDotted ( _ReadLiner_, word->W_RL_Index ), isReverseDotted = Lexer_IsTokenReverseDotted ( cntx->Lexer0 ) ;
        if ( GetState ( _Compiler_, LC_ARG_PARSING ) )
        {
            if ( GetState ( _Context_, ADDRESS_OF_MODE ) ) rvalueFlag = false ;
            else rvalueFlag = true ;
        }
        else rvalueFlag = ( ! Is_LValue ( cntx, word ) ) ;
        if ( word->W_ObjectAttributes & LOCAL_OBJECT ) Do_LocalObject ( word, rvalueFlag, isForwardDotted ) ;
        else if ( ( word->W_LispAttributes & T_LISP_SYMBOL ) || ( word->W_ObjectAttributes & T_LISP_SYMBOL ) ) //lambda variables are parsed as CAttribute & T_LISP_SYMBOL
        {
            if ( ! GetState ( cntx, LC_CFRTIL ) ) CfrTil_Do_LispSymbol ( word ) ;
            else CfrTil_Do_Variable ( word, rvalueFlag, isForwardDotted, 0 ) ;
        }
        else if ( word->W_ObjectAttributes & DOBJECT ) CfrTil_Do_DynamicObject ( word, ACC ) ;
        else if ( word->W_ObjectAttributes & OBJECT_FIELD ) CfrTil_Do_ClassField ( word, isForwardDotted, rvalueFlag ) ;
        else if ( word->W_ObjectAttributes & ( NAMESPACE_VARIABLE | THIS | OBJECT | LOCAL_VARIABLE | PARAMETER_VARIABLE ) )
            CfrTil_Do_Variable ( word, rvalueFlag, isForwardDotted, isReverseDotted ) ;
        else if ( word->W_ObjectAttributes & ( C_TYPE | C_CLASS ) ) Namespace_Do_C_Type ( word, isForwardDotted ) ;
        else if ( word->W_ObjectAttributes & ( NAMESPACE | CLASS | CLASS_CLONE ) ) Namespace_DoNamespace ( word, isForwardDotted ) ; // namespaces are the only word that needs to run the word set DObject Compile_SetCurrentlyRunningWord_Call_TestRSP created word ??
    }
    if ( ( ! isForwardDotted ) && ( ! GetState ( cntx->Compiler0, ( LC_ARG_PARSING | ARRAY_MODE ) ) ) )
    {
        cntx->Interpreter0->BaseObject = 0 ;
        CfrTil_UnsetQualifyingNamespace ( ) ;
    }
}

void
_DataObject_Run ( Word * word0 )
{
    Context * cntx = _Context_ ;
    Word * word = _Context_CurrentWord ( cntx ) ; // seems we don't need to compile definition code for object type words
    Object_Run ( word ) ;
}

void
DataObject_Run ( )
{
    Word * word = ( Word * ) DataStack_Pop ( ) ; //_Context_->CurrentlyRunningWord ;
    _DataObject_Run ( word ) ;
}

void
Do_Variable ( Word * word, Boolean rvalueFlag, Boolean isForwardDotted )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    int64 value ;
    //if ( ( ! GetState ( compiler, ARRAY_MODE ) ) && ( ! isForwardDotted ) && ( ! isReverseDotted ) ) cntx->Interpreter0->BaseObject = 0 ;
    if ( CompileMode ) //&& ( ! GetState ( compiler, LC_ARG_PARSING )))
    {
        if ( GetState ( cntx, ( C_SYNTAX | INFIX_MODE ) ) && ( ! rvalueFlag )
            && ( ! compiler->LHS_Word ) && ( ! isForwardDotted ) ) compiler->LHS_Word = word ;
        _Do_Compile_Variable ( word, rvalueFlag ) ;
    }
    else
    {
        if ( word->W_ObjectAttributes & ( OBJECT | THIS ) )
        {
            if ( word->W_ObjectAttributes & ( THIS ) )
            {
                if ( rvalueFlag ) value = ( int64 ) word->W_Value ;
                value = ( int64 ) word->W_PtrToValue ;
            }
            else value = ( int64 ) word->W_Value ;
        }
        else
        {
            if ( GetState ( cntx, ( C_SYNTAX | INFIX_MODE ) ) )
            {
                if ( rvalueFlag ) value = ( int64 ) * word->W_PtrToValue ;
                else
                {
                    if ( ! compiler->LHS_Word ) compiler->LHS_Word = word ;
                    goto done ; // LHS_Word : delayed compile by _CfrTil_C_Infix_EqualOp
                    //else value = ( int64 ) word->W_PtrToValue ;
                }
            }
            else if ( rvalueFlag ) value = word->W_Value ;
            else value = ( int64 ) word->W_PtrToValue ;
        }
        Interpreter * interp = cntx->Interpreter0 ;
        if ( interp->BaseObject && ( interp->BaseObject != word )
            && ( ! GetState ( compiler, C_INFIX_EQUAL ) ) && ( ! ( word->W_ObjectAttributes & ( THIS ) ) ) ) TOS = value ; //?? maybe needs more precise state logic
        else DataStack_Push ( value ) ;
    }
done:
    if ( ( word->W_ObjectAttributes & STRUCT ) || isForwardDotted ) Finder_SetQualifyingNamespace ( cntx->Finder0, word->TypeNamespace ) ;
    CfrTil_TypeStackPush ( word ) ;
}

void
CfrTil_Do_Variable ( Word * word, Boolean rvalueFlag, Boolean isForwardDotted, Boolean isReverseDotted )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    Interpreter * interp = cntx->Interpreter0 ;
    if ( ( word->W_ObjectAttributes & THIS ) || ( ! ( word->W_ObjectAttributes & ( NAMESPACE_VARIABLE ) ) ) )
    {
        if ( word->W_ObjectAttributes & ( OBJECT | THIS | QID ) || GetState ( word, QID ) ) //|| isForwardDotted ) 
        {
            if ( isForwardDotted || ( ! interp->BaseObject ) || ( ! isReverseDotted ) )
            {
                interp->BaseObject = word ;
                Finder_SetQualifyingNamespace ( cntx->Finder0, Word_UnAlias ( word ) ) ;
                //_CfrTil_Namespace_InNamespaceSet ( word->S_ContainingNamespace ) ;
            }
            word->AccumulatedOffset = 0 ;
            interp->CurrentObjectNamespace = TypeNamespace_Get ( word ) ;
            Compiler_Init_AccumulatedOffsetPointers ( compiler, word ) ;
            word->W_ObjectAttributes |= OBJECT ;
            if ( word->W_ObjectAttributes & THIS ) word->S_ContainingNamespace = _Context_->Interpreter0->ThisNamespace ;
        }
    }
    if ( ( ! GetState ( compiler, ARRAY_MODE ) ) && ( ! isForwardDotted ) && ( ! isReverseDotted ) ) interp->BaseObject = 0 ;
    Do_Variable ( word, rvalueFlag, isForwardDotted ) ;
}

void
_Do_Compile_Variable ( Word * word, Boolean rvalueFlag )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    int64 size = CfrTil_Get_ObjectByteSize ( word ) ;
    if ( GetState ( cntx, C_SYNTAX | INFIX_MODE ) || GetState ( compiler, LC_ARG_PARSING ) )
    {
        if ( rvalueFlag ) Compile_GetVarLitObj_RValue_To_Reg ( word, ACC, size ) ;
        else
        {
            Word_SetCodingAndSourceCoding ( word, Here ) ;
            if ( ( word->W_ObjectAttributes & ( OBJECT | THIS | QID ) ) || GetState ( word, QID ) ) _Compile_GetVarLitObj_LValue_To_Reg ( word, ACC, size ) ;
            else // this compilation is delayed to _CfrTil_C_Infix_Equal/Op
            {
                Word_SetCodingAndSourceCoding ( word, 0 ) ;
                return ;
            }
        }
    }
    else _Compile_GetVarLitObj_LValue_To_Reg ( word, ACC, size ) ;
    _Word_CompileAndRecord_PushReg ( word, ( word->W_ObjectAttributes & REGISTER_VARIABLE ) ? word->RegToUse : ACC, true ) ;
    //if ( !( word->W_ObjectAttributes & REGISTER_VARIABLE )) 
    //_Word_CompileAndRecord_PushReg ( word, ACC, true ) ;
}

void
_Do_LiteralValue ( int64 value )
{
    if ( CompileMode ) //&& ( ! GetState ( _Compiler_, LC_ARG_PARSING ) ) )
    {
        Compile_MoveImm_To_Reg ( ACC, value, CELL ) ;
        CfrTil_CompileAndRecord_PushAccum ( ) ; // does word == top of word stack always
    }
    else DataStack_Push ( value ) ;
}

void
CfrTil_Do_LiteralWord ( Word * word )
{
    _Do_LiteralValue ( word->W_Value ) ;
    CfrTil_TypeStackPush ( word ) ;
}

void
_Do_LocalObject_AllocateInit ( Namespace * typeNamespace, byte ** value, int64 size )
{
    Word * word = _CfrTil_ObjectNew ( size, ( byte* ) "<object>", 0, TEMPORARY ) ;
    _Class_Object_Init ( word, typeNamespace ) ;
    * value = ( byte* ) word->W_Value ;
}

void
Do_LocalObject ( Word * word, Boolean rvalueFlag, Boolean isForwardDotted )
{
    if ( ( word->W_ObjectAttributes & LOCAL_VARIABLE ) && ( ! GetState ( word, W_INITIALIZED ) ) ) // this is a local variable so it is initialed at creation 
    {
        int64 size = _Namespace_VariableValueGet ( word->TypeNamespace, ( byte* ) "size" ) ;
        Compile_MoveImm_To_Reg ( RDI, ( int64 ) word->TypeNamespace, CELL ) ;
        _Compile_LEA ( RSI, FP, 0, LocalVar_Disp ( word ) ) ;
        //_Compile_Move_Rm_To_Reg ( RSI, RSI, 0 ) ;
        Compile_MoveImm_To_Reg ( RDX, ( int64 ) size, CELL ) ;
        Compile_Call_TestRSP ( ( byte* ) _Do_LocalObject_AllocateInit ) ; // we want to only allocate this object once and only at run time; and not at compile time
        SetState ( word, W_INITIALIZED, true ) ;
    }
    CfrTil_Do_Variable ( word, rvalueFlag, isForwardDotted, 0 ) ;
}

void
Compile_C_FunctionDeclaration ( byte * token1 )
{
    byte * token ;
    _Compiler_->C_FunctionBackgroundNamespace = _Compiler_->C_BackgroundNamespace ;
    SetState ( _Compiler_, C_COMBINATOR_PARSING, true ) ;
    CfrTil_C_Syntax_On ( ) ;
    Word * word = Word_New ( token1 ) ; // "("
    CfrTil_WordList_PushWord ( word ) ;
    Compiler_Word_SCHCPUSCA ( word, 1 ) ;
    DataStack_Push ( ( int64 ) word ) ;
    CfrTil_BeginBlock ( ) ; // nb! before CfrTil_LocalsAndStackVariablesBegin
    CfrTil_LocalsAndStackVariablesBegin ( ) ;
    Ovt_AutoVarOn ( ) ;
    do // the rare occurence of any tokens between closing locals right paren ')' and beginning block '}'
    {
        if ( token = Lexer_ReadToken ( _Lexer_ ) )
        {
            if ( String_Equal ( token, "s{" ) )
            {
                Interpreter_InterpretAToken ( _Interpreter_, token, - 1, - 1 ) ;
                break ;
            }
            else if ( token [ 0 ] == '{' ) break ; // take nothing else (would be Syntax Error ) -- we have already done CfrTil_BeginBlock
            else _Lexer_ConsiderDebugAndCommentTokens ( token, 1 ) ;
        }
    }
    while ( token ) ;
    //CfrTil_Interpret_C_Blocks ( 1, 1, 0 ) ; // ??? seems like this should be used somewhere here 
    Ovt_AutoVarOff ( ) ;
}

// this is currently kinda rough
// this also interprets the rest of a c function after a type declaration

void
_Compile_C_TypeDeclaration ( )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    byte * token ;
    while ( token = Interpret_C_Until_Token4 ( cntx->Interpreter0,
        ( byte* ) ",", ( byte* ) ";", ( byte* ) "{", ( GetState ( cntx, C_SYNTAX ) ? ( byte* ) "}" : ( byte* ) "=" ), 0, 0 ) )
    {
        if ( String_Equal ( token, ";" ) )
        {
            Lexer_ReadToken ( _Lexer_ ) ;
            Interpreter_InterpretAToken ( cntx->Interpreter0, token, _Lexer_->TokenStart_ReadLineIndex, _Lexer_->SC_Index ) ;
            break ;
        }
        else if ( String_Equal ( token, "," ) || ( ( ! GetState ( cntx, C_SYNTAX ) ) && String_Equal ( token, "=" ) ) ) Lexer_ReadToken ( _Lexer_ ) ;
        else
        {
            if ( String_Equal ( token, ")" ) && GetState ( compiler, DOING_A_PREFIX_WORD ) ) CfrTil_PushToken_OnTokenList ( token ) ;
            if ( GetState ( cntx, C_SYNTAX ) ) Compiler_Save_C_BackgroundNamespace ( compiler ) ;

            break ;
        }
        compiler->LHS_Word = 0 ;
    }
}

// nb.Compiling !!

void
Compile_C_TypeDeclaration ( byte * token0 ) //, int64 tsrli, int64 scwi)
{
    // remember : we are not in a C function
    Interpreter * interp = _Interpreter_ ;
    Word * word ;
    byte * token1 ;
    if ( Compiling )
    {
        if ( token0[0] == ')' )
        {
            //  C cast code here ; 
            // nb! : we have no (fully) implemented operations on operand size less than 8 bytes
            token1 = Lexer_ReadToken ( interp->Lexer0 ) ;
            interp->LastLexedChar = interp->Lexer0->LastLexedChar ;
            if ( token1 )
            {
                Word * word0 = _Interpreter_TokenToWord ( interp, token1, - 1, - 1 ) ;
                word = Compiler_CopyDuplicatesAndPush ( word0, _Lexer_->TokenStart_ReadLineIndex, _Lexer_->SC_Index ) ;
                if ( word )
                {
                    word->ObjectByteSize = CfrTil_Get_ObjectByteSize ( word ) ;
                    Interpreter_DoWord ( interp, word, - 1, - 1 ) ;
                }
            }
            else SetState ( _Context_->Lexer0, LEXER_END_OF_LINE, true ) ;
        }
        else
        {
            Ovt_AutoVarOn ( ) ;
            Compiler_LocalsNamespace_New ( _Compiler_ ) ;
            word = _Interpreter_TokenToWord ( interp, token0, - 1, - 1 ) ;
            _Compiler_->LHS_Word = word ;
            Interpreter_DoWord ( interp, word, - 1, - 1 ) ;
            _Compile_C_TypeDeclaration ( ) ;
        }
        Ovt_AutoVarOff ( ) ;
    }
}

void
_Namespace_Do_C_Type ( Namespace * ns )
{
    Lexer * lexer = _Lexer_ ;
    byte * token1, *token2 ;
    if ( ! Compiling ) _Namespace_ActivateAsPrimary ( ns ) ;
    token1 = _Lexer_Next_NonDebugOrCommentTokenWord ( lexer, 0, 1, 0 ) ;
    token2 = Lexer_Peek_Next_NonDebugTokenWord ( lexer, 1, 0 ) ;
    if ( token2 && ( token2 [0] == '(' ) ) Compile_C_FunctionDeclaration ( token1 ) ;
    else
    {
        if ( Compiling )
        {
            _Compiler_->AutoVarTypeNamespace = ns ;
            Compile_C_TypeDeclaration ( token1 ) ;
            _Compiler_->AutoVarTypeNamespace = 0 ;
        }
        else Interpreter_InterpretAToken ( _Interpreter_, token1, - 1, - 1 ) ; //_Lexer_->TokenStart_ReadLineIndex, _Lexer_->SC_Index ) ;
    }
}

void
Namespace_Do_C_Type ( Namespace * ns, Boolean isForwardDotted )
{
    if ( ! isForwardDotted )
    {
        Context * cntx = _Context_ ;
        Compiler * compiler = cntx->Compiler0 ;
        if ( GetState ( cntx, C_SYNTAX ) ) Compiler_Save_C_BackgroundNamespace ( compiler ) ;
        if ( ( ! Compiling ) || ( ! GetState ( _CfrTil_, SOURCE_CODE_STARTED ) ) ) CfrTil_InitSourceCode_WithCurrentInputChar ( _CfrTil_, 0 ) ; // must be here for wdiss and add addToHistory
        if ( ! GetState ( compiler, DOING_C_TYPE ) )
        {
            SetState ( compiler, DOING_C_TYPE, true ) ;
            if ( ! GetState ( compiler, LC_ARG_PARSING ) )
            {
                LC_Delete ( _LC_ ) ;
                if ( ! Compiling )
                {
                    Compiler_Init (compiler, 0) ;
                    //CfrTil_RightBracket ( ) ; //nb. only Compiler_Init here. We don't want to turn on compile mode!! RightBracket is a forth term.
                    CfrTil_SourceCode_Init ( ) ;
                    CfrTil_WordList_Init ( 0 ) ;
                }
                _Namespace_Do_C_Type ( ns ) ;
            }
            SetState ( compiler, DOING_C_TYPE, false ) ;
        }
        //if ( ( ! Compiling ) && GetState ( cntx, C_SYNTAX ) ) Compiler_SetAs_InNamespace_C_BackgroundNamespace ( compiler ) ;
        if ( GetState ( cntx, C_SYNTAX ) ) Compiler_SetAs_InNamespace_C_BackgroundNamespace ( compiler ) ;
    }
    else Namespace_DoNamespace ( ns, isForwardDotted ) ;
}

void
CfrTil_Do_ClassField ( Word * word, Boolean isForwardDotted, Boolean rvalueFlag )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    cntx->Interpreter0->CurrentObjectNamespace = word ; // update this namespace 
    compiler->ArrayEnds = 0 ;

    if ( GetState ( cntx, ( C_SYNTAX | INFIX_MODE ) ) && ( ! compiler->LHS_Word ) && ( ! isForwardDotted ) && ( ! rvalueFlag ) ) compiler->LHS_Word = word ;
    if ( word->Offset ) Compiler_IncrementCurrentAccumulatedOffset ( compiler, word->Offset ) ;
    if ( ! ( ( CompileMode ) || GetState ( compiler, LC_ARG_PARSING ) ) ) CfrTil_Do_AccumulatedAddress ( word, ( byte* ) TOS, word->Offset, rvalueFlag ) ;
    if ( isForwardDotted ) Finder_SetQualifyingNamespace ( cntx->Finder0, word->TypeNamespace ) ;
    word->BaseObject = cntx->Interpreter0->BaseObject ;
    CfrTil_TypeStack_SetTop ( word ) ;
}

// a constant is, of course, a literal

void
CfrTil_Do_LispSymbol ( Word * word )
{
    // rvalue - rhs for stack var
    if ( Compiling )
    {
        _Compile_GetVarLitObj_RValue_To_Reg ( word, ACC, 0 ) ;
        _Word_CompileAndRecord_PushReg ( word, ACC, true ) ;
    }
    CfrTil_TypeStackPush ( word ) ;
}

void
Array_Do_AccumulatedAddress ( int64 totalOffset )
{
#if 0
    int64 totalOffset = ( * ( int64 * ) accumulatedOffsetPointer ) + offset ;
    byte * address = ( ( ( byte* ) _Context_->Interpreter0->BaseObject->W_PtrToValue ) + totalOffset ) ;
    if ( rvalueFlag ) TOS = ( uint64 ) * address ; //( * ( int64* ) accumulatedAddress ) ; // C rvalue
    else TOS = ( uint64 ) address ; // C lvalue
#else    
    byte * address = ( ( byte* ) _Interpreter_->BaseObject->W_Value ) + totalOffset ;
    //if ( rvalueFlag ) TOS = (uint64) * address ; //( * ( int64* ) accumulatedAddress ) ; // C rvalue
    //else 
    TOS = ( uint64 ) address ; // C lvalue
#endif        
}

void
Do_AccumulatedAddress ( byte * accumulatedOffsetPointer, int64 offset, Boolean rvalueFlag, byte size )
{
    accumulatedOffsetPointer += offset ;
    if ( rvalueFlag )
    {
        if ( size == 1 ) TOS = ( int64 ) ( ( * ( byte* ) accumulatedOffsetPointer ) ) ; // C rvalue
        else if ( size == 2 ) TOS = ( int64 ) ( ( * ( int16* ) accumulatedOffsetPointer ) ) ; // C rvalue
        else if ( size == 4 ) TOS = ( int64 ) ( ( * ( int32* ) accumulatedOffsetPointer ) ) ; // C rvalue
        else TOS = ( * ( int64* ) accumulatedOffsetPointer ) ; // default and 8 bytes - cell
    }
    else TOS = ( uint64 ) accumulatedOffsetPointer ; // C lvalue
}

void
CfrTil_Do_AccumulatedAddress ( Word * word, byte * accumulatedAddress, int64 offset, Boolean rvalueFlag )
{
    Namespace * ns ;
    byte size = ( ( ns = TypeNamespace_Get ( word ) ) ? ( int64 ) _Namespace_VariableValueGet ( ns, "size" ) : CELL ) ;
    Do_AccumulatedAddress ( accumulatedAddress, offset, rvalueFlag, size ) ;
}

// nb. 'word' is the previous word to the '.' (dot) cf. CfrTil_Dot so it can be recompiled, a little different maybe, as an object

void
CfrTil_Dot ( ) // .
{
    Context * cntx = _Context_ ;
    if ( ! cntx->Interpreter0->BaseObject )
    {
        SetState ( cntx, CONTEXT_PARSING_QID, true ) ;
        d0 ( if ( Is_DebugModeOn ) _CfrTil_SC_WordList_Show ( "\nCfrTil_Dot", 0, 0 ) ) ;
        Word * word = Compiler_PreviousNonDebugWord ( 0 ) ; // 0 : rem: we just popped the WordStack above
        if ( word )
        {
            if ( word->W_ObjectAttributes & NAMESPACE_TYPE ) Finder_SetQualifyingNamespace ( cntx->Finder0, word ) ;
            else cntx->Interpreter0->BaseObject = word ;
            //else if ( ! ( word->ObjectAttributes &  ) ) cntx->Interpreter0->BaseObject = word ;
        }
    }
}

void
_Word_CompileAndRecord_PushReg ( Word * word, int64 reg, Boolean recordFlag )
{
    if ( word )
    {
        if ( recordFlag ) word->StackPushRegisterCode = Here ; // nb. used! by the rewriting optInfo
        if ( word->W_ObjectAttributes & REGISTER_VARIABLE ) _Compile_Stack_PushReg ( DSP, word->RegToUse ) ;
        else
        {

            _Compile_Stack_PushReg ( DSP, reg ) ;
            word->RegToUse = reg ;
        }
    }
}

void
Compiler_Save_C_BackgroundNamespace ( Compiler * compiler )
{
    compiler->C_BackgroundNamespace = _Namespace_FirstOnUsingList ( ) ; //nb! must be before CfrTil_LocalsAndStackVariablesBegin else CfrTil_End_C_Block will 
}

void
Compiler_SetAs_InNamespace_C_BackgroundNamespace ( Compiler * compiler )
{
    if ( compiler->C_BackgroundNamespace ) _CfrTil_Namespace_InNamespaceSet ( compiler->C_BackgroundNamespace ) ;
}


