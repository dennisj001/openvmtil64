
#include "../../include/cfrtil64.h"

void
Interpret_DoParenthesizedRValue ( )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    int64 svcm = GetState ( compiler, COMPILE_MODE ) ;
    byte * token ;
    while ( 1 )
    {
        token = _Lexer_ReadToken ( cntx->Lexer0, 0 ) ;
        Interpreter_InterpretAToken ( cntx->Interpreter0, token, - 1, - 1 ) ;
        if ( String_Equal ( ( char* ) token, ")" ) ) break ;
    }
    SetState ( compiler, COMPILE_MODE, svcm ) ;
}

void
Interpret_C_Block_EndBlock ( byte * tokenToUse, Boolean insertFlag )
{
    if ( tokenToUse ) _CfrTil_->EndBlockWord->Name = tokenToUse ;
    if ( insertFlag ) SetState ( _Debugger_, DBG_OUTPUT_INSERTION, true ) ;
    int64 tsrli = -1, scwi = -1; 
    Word_SetTsrliScwi( _CfrTil_->EndBlockWord, tsrli, scwi ) ;
    Interpreter_DoWord_Default ( _Interpreter_, _CfrTil_->EndBlockWord, tsrli, scwi ) ;
    _CfrTil_->EndBlockWord->Name = ( byte* ) "}" ;
    SetState ( _Debugger_, DBG_OUTPUT_INSERTION, false ) ;
}

void
Interpret_C_Block_BeginBlock ( byte * tokenToUse, Boolean insertFlag )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    // ? source code adjustments ?
    if ( tokenToUse ) _CfrTil_->BeginBlockWord->Name = tokenToUse ;
    if ( insertFlag ) SetState ( _Debugger_, DBG_OUTPUT_INSERTION, true ) ;
    int64 tsrli = -1, scwi = -1; 
    Word_SetTsrliScwi( _CfrTil_->BeginBlockWord, tsrli, scwi ) ;
    Interpreter_DoWord_Default ( _Interpreter_, _CfrTil_->BeginBlockWord, tsrli, scwi ) ;
    _CfrTil_->BeginBlockWord->Name = ( byte* ) "{" ;
    compiler->BeginBlockFlag = false ;
    SetState ( _Debugger_, DBG_OUTPUT_INSERTION, false ) ;
}

int64
CfrTil_Interpret_C_Blocks ( int64 blocks, Boolean takesAnElseFlag, Boolean semicolonEndsThisBlock )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    Interpreter * interp = cntx->Interpreter0 ;
    Word * word ;
    byte * token ;
    int64 blocksParsed = 0 ;

    while ( blocksParsed < blocks )
    {
        token = Lexer_ReadToken ( cntx->Lexer0 ) ;
        if ( String_Equal ( ( char* ) token, "(" ) && compiler->TakesLParenAsBlock && ( ! compiler->InLParenBlock ) )
        {
            // interpret a (possible) 'for' c parenthesis expression
            compiler->InLParenBlock = true ;
            Interpret_C_Block_BeginBlock ( ( byte* ) "(", 0 ) ;
            compiler->TakesLParenAsBlock = false ; // after the first block
        }
        else if ( String_Equal ( ( char* ) token, ")" ) && compiler->InLParenBlock )
        {
            List_InterpretLists ( compiler->PostfixLists ) ;
            compiler->InLParenBlock = false ;
            compiler->TakesLParenAsBlock = false ;
            Interpret_C_Block_EndBlock ( ( byte* ) ")", 0 ) ;
            //CfrTil_TypeStack_Pop ( ) ; // the logic word
            if ( ! _Context_StringEqual_PeekNextToken ( _Context_, ( byte* ) "{", 0 ) )
            {
                Interpret_C_Block_BeginBlock ( ( byte* ) "{", 1 ) ;
                semicolonEndsThisBlock = true ;
            }
            blocksParsed ++ ;
        }
        else if ( String_Equal ( ( char* ) token, "{" ) )
        {
            Interpret_C_Block_BeginBlock ( 0, 0 ) ;
            semicolonEndsThisBlock = false ;
        }
        else if ( String_Equal ( ( char* ) token, "}" ) )
        {
            Interpret_C_Block_EndBlock ( 0, 0 ) ;
            blocksParsed ++ ;
        }
        else if ( String_Equal ( ( char* ) token, ";" ) )//|| String_Equal ( ( char* ) token, "," ) )
        {
            List_InterpretLists ( compiler->PostfixLists ) ;
            if ( semicolonEndsThisBlock )
            {
                Interpret_C_Block_EndBlock ( ( byte* ) ";", 0 ) ;
                blocksParsed ++ ;
            }
            if ( compiler->InLParenBlock ) Interpret_C_Block_BeginBlock ( ( byte* ) "{", 1 ) ;
        }
        else if ( String_Equal ( ( char* ) token, "else" ) )
        {
            if ( takesAnElseFlag )
            {
                takesAnElseFlag = false ;
                if ( ! _Context_StringEqual_PeekNextToken ( _Context_, ( byte* ) "{", 0 ) )
                {
                    Interpret_C_Block_BeginBlock ( ( byte* ) "{", 1 ) ;
                    semicolonEndsThisBlock = true ;
                }
            }
            //else SyntaxError () ;
            continue ;
        }
        else
        {
            word = _Interpreter_TokenToWord ( interp, token, - 1, - 1 ) ;
            if ( word )
            {
                Interpreter_DoWord ( interp, word, - 1, - 1 ) ;
                if ( word->CAttribute & COMBINATOR )
                {
                    if ( semicolonEndsThisBlock )
                    {
                        Interpret_C_Block_EndBlock ( ( byte* ) "}", String_Equal ( token, ";" ) ) ;
                        //Interpret_C_Block_EndBlock ( 0, 0 ) ;
                        blocksParsed ++ ;
                    }
                }
            }
        }
        if ( takesAnElseFlag && ( blocksParsed == 2 ) )
        {
            if ( _Context_StringEqual_PeekNextToken ( _Context_, ( byte* ) "else", 0 ) )
            {
                blocks ++ ;
                continue ;
            }
            else break ;
        }
    }
    return blocksParsed ;
}

void
CfrTil_C_LeftParen ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    if ( ( GetState ( _Context_->Interpreter0, PREPROCESSOR_MODE ) ) )
    {
        // this is for "#define" (which is parsed as '#' 'define', two words)
        if ( isalnum ( ReadLine_LastReadChar ( _ReadLiner_ ) ) ) CfrTil_LocalsAndStackVariablesBegin ( ) ;
        else Interpret_DoParenthesizedRValue ( ) ;
    }
    else if ( ( ( ! GetState ( compiler, VARIABLE_FRAME ) ) ) || ( ReadLine_PeekNextNonWhitespaceChar ( _Context_->Lexer0->ReadLiner0 ) == '|' ) )
    {
        CfrTil_LocalsAndStackVariablesBegin ( ) ;
    }
    else Interpret_DoParenthesizedRValue ( ) ;
}

void
_CfrTil_C_Infix_EqualOp ( Word * opWord )
{
    Context * cntx = _Context_ ;
    Interpreter * interp = cntx->Interpreter0 ;
    Compiler *compiler = cntx->Compiler0 ;
    Word * wordr, *word0 = CfrTil_WordList ( 0 ) ;
    Word *lhsWord = CompileMode ? compiler->LHS_Word : 0, *word0a, *rword ;
    int64 tsrli = word0 ? word0->W_RL_Index : 0 ;
    int64 svscwi = word0 ? word0->W_SC_Index : 0 ;
    byte * svName ;
    SetState ( compiler, C_INFIX_EQUAL, true ) ;
    _CfrTil_WordList_PopWords ( 1 ) ;
    word0a = CfrTil_WordList ( 0 ) ;
    if ( lhsWord )
    {
        if ( ! ( lhsWord->CAttribute & ( OBJECT | THIS | QID ) || GetState ( lhsWord, QID ) ) )
        {
            int64 svState = cntx->State ;
            SetState ( cntx, C_SYNTAX | INFIX_MODE, false ) ; // we don't want to just set compiler->LHS_Word
            Interpreter_DoWord_Default ( interp, lhsWord, lhsWord->W_RL_Index, lhsWord->W_SC_Index ) ;
            cntx->State = svState ;
            wordr = _CfrTil_->StoreWord ;
        }
        else
        {
            if ( ! ( word0a->CAttribute & ( ( LITERAL | NAMESPACE_VARIABLE | THIS | OBJECT | LOCAL_VARIABLE | PARAMETER_VARIABLE ) ) ) ) Compile_TosRmToTOS ( ) ;
            wordr = _CfrTil_->PokeWord ;
        }
    }
    else wordr = _CfrTil_->PokeWord ;
    d0 ( if ( Is_DebugModeOn ) Compiler_SC_WordList_Show ( "\nCfrTil_C_Infix_EqualOp : before op word", 0, 0 ) ) ;
    if ( opWord ) rword = opWord ;
    else rword = wordr ;
    svName = rword->Name ;
    rword->Name = ( byte* ) "=" ;
    SetState ( _Debugger_, DBG_OUTPUT_SUBSTITUTION, true ) ;
    _Debugger_->SubstitutedWord = rword ;
    Interpreter_DoWord_Default ( interp, rword, tsrli, svscwi ) ;
    SetState ( _Debugger_, ( DBG_OUTPUT_SUBSTITUTION ), false ) ;
    rword->Name = svName ;
    if ( GetState ( compiler, C_COMBINATOR_LPAREN ) )
    {
        if ( wordr->StackPushRegisterCode ) SetHere ( wordr->StackPushRegisterCode, 1 ) ; // this is the usual after '=' in non C syntax; assuming optimizeOn
        Compiler_Set_BI_setTtnn ( compiler, TTT_ZERO, NEGFLAG_ON, TTT_ZERO, NEGFLAG_Z ) ; // must set logic flag for Compile_ReConfigureLogicInBlock in Block_Compile_WithLogicFlag
    }
    List_InterpretLists ( compiler->PostfixLists ) ;
    compiler->LHS_Word = 0 ;

    if ( ! Compiling ) CfrTil_InitSourceCode ( _CfrTil_ ) ;
    SetState ( compiler, C_INFIX_EQUAL, false ) ;
}

void
CfrTil_SetInNamespaceFromBackground ( )
{
    Context * cntx = _Context_ ;
    if ( cntx->Compiler0->C_FunctionBackgroundNamespace ) _CfrTil_Namespace_InNamespaceSet ( cntx->Compiler0->C_FunctionBackgroundNamespace ) ;
    else Compiler_SetAs_InNamespace_C_BackgroundNamespace ( cntx->Compiler0 ) ;
}

#if 0 // maybe better with blocks ... below ..

void
CfrTil_C_ConditionalExpression ( )
{
    Context * cntx = _Context_ ;
    Interpreter * interp = cntx->Interpreter0 ;
    Word * word = CfrTil_WordList ( 1 ) ;
    if ( word->StackPushRegisterCode )
    {
        _SetHere_To_Word_StackPushRegisterCode ( word, 1 ) ;
        _Compile_TestCode ( word->RegToUse, CELL ) ;
    }
    else
    {
        _Compile_Stack_PopToReg ( DSP, RAX ) ;
        _Compile_TestCode ( RAX, CELL ) ;
    }
    _Compile_UninitializedJumpEqualZero ( ) ;
    byte * ptrToOffsetElse = Here - DISP_SIZE ;
    DEBUG_SHOW ;
    Interpret_Until_Token ( interp, ( byte* ) ":", 0 ) ;
    _Compile_UninitializedJump ( ) ;
    byte * ptrToOffsetEnd = Here - DISP_SIZE ;
    if ( GetState ( cntx, C_SYNTAX ) )
    {
        _SetOffsetForCallOrJump ( ptrToOffsetElse, Here ) ;
        byte * token = Interpret_C_Until_Token4 ( interp, ( byte* ) ";", ( byte* ) ",", ( byte* ) ")", 0, 0 ) ;
        DEBUG_SHOW ;
        CfrTil_PushToken_OnTokenList ( token ) ; // maybe conditionally push ??
    }
    else
    {
        _SetOffsetForCallOrJump ( ptrToOffsetElse, Here ) ;
        Interpreter_InterpretNextToken ( interp ) ;
    }
    _SetOffsetForCallOrJump ( ptrToOffsetEnd, Here ) ;
}
#elif 1

void
CfrTil_C_ConditionalExpression ( )
{
    Context * cntx = _Context_ ;
    Interpreter * interp = cntx->Interpreter0 ;
    CfrTil_If_ConditionalExpression ( ) ;
    if ( CompileMode )
    {
        byte * token = Interpret_C_Until_Token4 ( interp, ( byte* ) ":", ( byte* ) ",", ( byte* ) ")", (byte*) "}", 0 ) ;
        if ( String_Equal ( token, ":" ) )
        {
            Lexer_ReadToken ( _Lexer_ ) ;
            CfrTil_Else ( ) ;
            Interpret_C_Until_Token4 ( interp, ( byte* ) ";", ( byte* ) ",", ( byte* ) ")", (byte*) "}", 0 ) ;
            CfrTil_EndIf ( ) ;
        }
    }
}
#else

void
CfrTil_C_ConditionalExpression ( )
{
    Context * cntx = _Context_ ;
    Interpreter * interp = cntx->Interpreter0 ;
    CfrTil_BeginBlock ( ) ;
    Interpret_Until_Token ( interp, ( byte* ) ":", 0 ) ;
    CfrTil_EndBlock ( ) ;
    CfrTil_BeginBlock ( ) ;
    Interpret_C_Until_Token4 ( interp, ( byte* ) ";", ( byte* ) ",", ( byte* ) ")", "}", 0 ) ;
    CfrTil_EndBlock ( ) ;
    CfrTil_TrueFalseCombinator2 ( ) ;
}
#endif

Boolean
C_Syntax_AreWeParsingACFunctionCall ( Lexer * lexer )
{
    if ( ! GetState ( _Context_, C_SYNTAX | INFIX_MODE ) ) return false ;
    return _C_Syntax_AreWeParsingACFunctionCall ( & lexer->ReadLiner0->InputLine [ lexer->TokenStart_ReadLineIndex ] ) ;
}

