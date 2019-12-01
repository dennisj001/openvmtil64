
#include "../../include/cfrtil64.h"

void
Interpret_DoParenthesizedRValue ( )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    int64 svcm = GetState ( compiler, COMPILE_MODE ) ;
    byte * token ;
    while ( token = _Lexer_ReadToken ( cntx->Lexer0, 0 ) )
    {
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
    int64 tsrli = - 1, scwi = - 1 ;
    Word_SetTsrliScwi ( _CfrTil_->EndBlockWord, tsrli, scwi ) ;
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
    int64 tsrli = - 1, scwi = - 1 ;
    Word_SetTsrliScwi ( _CfrTil_->BeginBlockWord, tsrli, scwi ) ;
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
    ReadLiner * rl = _Context_->ReadLiner0 ;
    if ( ( GetState ( _Context_->Interpreter0, PREPROCESSOR_MODE ) ) )
    {
        // this is for "#define" (which is parsed as '#' 'define', two words)
        if ( isalnum ( ReadLine_LastReadChar ( rl ) ) ) CfrTil_LocalsAndStackVariablesBegin ( ) ;
        else Interpret_DoParenthesizedRValue ( ) ;
    }
    if ( ReadLine_CheckForLocalVariables ( rl ) )
    {
        CfrTil_LocalsAndStackVariablesBegin ( ) ;
        return ;
    }
    else if ( CompileMode && (( ! GetState ( compiler, VARIABLE_FRAME ) ) || ( ReadLine_PeekNextNonWhitespaceChar ( rl ) == '|' ) ))
    {
        CfrTil_LocalsAndStackVariablesBegin ( ) ;
        return ;
    }
    Interpret_DoParenthesizedRValue ( ) ;
}

void
_CfrTil_C_Infix_EqualOp ( block op )
{
    Context * cntx = _Context_ ;
    Interpreter * interp = cntx->Interpreter0 ;
    Compiler *compiler = cntx->Compiler0 ;
    Word * wordr, *word0 = CfrTil_WordList ( 0 ) ;
    Word *lhsWord = compiler->LHS_Word, *word0a, *rword ;
    int64 tsrli = word0 ? word0->W_RL_Index : 0 ;
    int64 svscwi = word0 ? word0->W_SC_Index : 0 ;
    byte * svName ;
    SetState ( compiler, C_INFIX_EQUAL, true ) ;
    _CfrTil_WordList_PopWords ( 1 ) ; // because we are going to call the opWord in compilable order below 
    word0a = CfrTil_WordList ( 0 ) ;
    if ( lhsWord )
    {
        if ( ( lhsWord->CAttribute & ( OBJECT | THIS | QID ) || GetState ( lhsWord, QID ) ) )
        {
            if ( ( ! String_Equal ( word0a->Name, "]" ) ) &&
                ( ! ( word0a->CAttribute & ( ( LITERAL | NAMESPACE_VARIABLE | THIS | OBJECT | LOCAL_VARIABLE | PARAMETER_VARIABLE ) ) ) ) ) Compile_TosRmToTOS ( ) ;
            wordr = _CfrTil_->PokeWord ;
        }
        else
        {
            int64 svState = cntx->State ;
            SetState ( cntx, C_SYNTAX | INFIX_MODE, false ) ; // we don't want to just set compiler->LHS_Word
            Interpreter_DoWord_Default ( interp, lhsWord, lhsWord->W_RL_Index, lhsWord->W_SC_Index ) ;
            cntx->State = svState ;
            wordr = _CfrTil_->StoreWord ;
        }
    }
    else wordr = _CfrTil_->PokeWord ;
    d0 ( if ( Is_DebugModeOn ) Compiler_SC_WordList_Show ( "\nCfrTil_C_Infix_EqualOp : before op word", 0, 0 ) ) ;
    if ( op )
    {
        //rword = opWord ;
        //Interpreter_DoWord_Default ( interp, rword, tsrli, svscwi ) ;
        Block_Eval ( op ) ;
    }
    else
    {
        rword = wordr ;
        svName = rword->Name ;
        rword->Name = ( byte* ) "=" ;
        SetState ( _Debugger_, DBG_OUTPUT_SUBSTITUTION, true ) ;
        _Debugger_->SubstitutedWord = rword ;
        Interpreter_DoWord_Default ( interp, rword, tsrli, svscwi ) ; // remember _CfrTil_WordList_PopWords earlier in this function
        SetState ( _Debugger_, ( DBG_OUTPUT_SUBSTITUTION ), false ) ;
        rword->Name = svName ;
    }
    if ( GetState ( compiler, C_COMBINATOR_LPAREN ) )
    {
        if ( wordr->StackPushRegisterCode ) SetHere ( wordr->StackPushRegisterCode, 1 ) ; // this is the usual after '=' in non C syntax; assuming optimizeOn
        Compiler_Set_BI_Tttn ( compiler, TTT_ZERO, NEGFLAG_ON, TTT_ZERO, NEGFLAG_Z ) ; // must set logic flag for Compile_ReConfigureLogicInBlock in Block_Compile_WithLogicFlag
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

#if 1

void
CfrTil_C_ConditionalExpression ( )
{
    Context * cntx = _Context_ ;
    Interpreter * interp = cntx->Interpreter0 ;
    Compiler * compiler = cntx->Compiler0 ;
    Word * word1 ;
    if ( ( ! Compiling ) && ( ! GetState ( compiler, C_CONDITIONAL_IN ) ) ) Compiler_Init ( _Compiler_, 0, 0 ) ;
    SetState ( compiler, C_CONDITIONAL_IN, true ) ;
    if ( ! CompileMode ) CfrTil_If_ConditionalExpression ( ) ;
    else
    {
        word1 = _CfrTil_WordList ( 1 ) ;
        if ( word1 && word1->StackPushRegisterCode )
        {
            // nb. there is only one block so don't use BlockInfo code ; we may have nested conditionals
            SetHere ( word1->StackPushRegisterCode, 1 ) ;
            _Compile_TestCode ( word1->RegToUse, CELL ) ;
        }
        else
        {
            Compile_Pop_To_Acc ( DSP ) ;
            _Compile_TestCode ( ACC, CELL ) ;
        }
        Compile_UninitializedJumpEqualZero ( ) ;
        Stack_Push_PointerToJmpOffset ( ) ;
        byte * token = Interpret_C_Until_Token4 ( interp, ( byte* ) ":", ( byte* ) ",", ( byte* ) ")", ( byte* ) "}", 0, 0 ) ;
        if ( String_Equal ( token, ":" ) )
        {
            Lexer_ReadToken ( _Lexer_ ) ;
            CfrTil_Else ( ) ;
            Interpret_C_Until_Token4 ( interp, ( byte* ) ";", ( byte* ) ",", ( byte* ) ")", ( byte* ) "}", ( byte* ) " ", 0 ) ; //( byte* ) "}", ( byte* ) " \n\r\t", 0 ) ;
            CfrTil_EndIf ( ) ;
        }
        else SyntaxError ( 1 ) ;
    }
    SetState ( compiler, C_CONDITIONAL_IN, false ) ;
}
#else

void
CfrTil_C_ConditionalExpression ( )
{
    Context * cntx = _Context_ ;
    Interpreter * interp = cntx->Interpreter0 ;
    Compiler * compiler = cntx->Compiler0 ;
    //Word * word1 ;
    byte * token ;
    if ( ( ! Compiling ) && ( ! GetState ( compiler, C_CONDITIONAL_IN ) ) ) Compiler_Init ( _Compiler_, 0, 0 ) ;
    SetState ( compiler, C_CONDITIONAL_IN, true ) ;
    CfrTil_BeginBlock ( ) ;
    token = Interpret_Until_Token ( _Interpreter_, ( byte* ) ":", 0 ) ; //Interpret_C_Until_Token4 ( interp, ( byte* ) ":", ( byte* ) ",", ( byte* ) ")", ( byte* ) "}", 0, 0 ) ;
    if ( ! String_Equal ( token, ":" ) ) SyntaxError ( 1 ) ;
    //else Lexer_ReadToken ( _Lexer_ ) ;
    CfrTil_EndBlock ( ) ;
    CfrTil_BeginBlock ( ) ;
    token = Interpret_C_Until_Token4 ( interp, ( byte* ) ";", ( byte* ) ",", ( byte* ) "?", ( byte* ) "}", ( byte* ) 0, 1 ) ; //( byte* ) "}", ( byte* ) " \n\r\t", 0 ) ;
    CfrTil_EndBlock ( ) ;
    CfrTil_TrueFalseCombinator2 ( ) ;
    SetState ( compiler, C_CONDITIONAL_IN, false ) ;
}
#endif

Boolean
Syntax_AreWeParsingACFunctionCall ( Lexer * lexer )
{
    if ( ! GetState ( _Context_, C_SYNTAX | INFIX_MODE ) ) return false ;
    return _C_Syntax_AreWeParsingACFunctionCall ( & lexer->ReadLiner0->InputLine [ lexer->TokenStart_ReadLineIndex ] ) ;
}

int64
IsLValue_String_CheckForwardToStatementEnd ( byte * nc )
{
    int64 leftBracket = 0 ;
    byte onc1 ;
    while ( *nc )
    {
        switch ( *nc )
        {
            case ';': case ',': case '"': case ')': case '{': case '}': case '\n': return false ;
            case '=':
            {
                if ( * ( nc + 1 ) == '=' ) return false ;
                else
                {
                    onc1 = * ( nc - 1 ) ;
                    if ( ispunct ( onc1 ) )
                    {
                        if ( ( onc1 != '<' ) && ( onc1 != '>' ) && ( onc1 != '!' ) ) return true ; // op equal // ?? >= <=
                        else return false ;
                    }
                    else return true ;
                }
            }
            case '[':
            {
                leftBracket ++ ;
                break ;
            }
            case ']':
            {
                if ( ( -- leftBracket ) && GetState ( _Compiler_, ARRAY_MODE ) ) return false ; // ??
                else break ;
            }
            default: break ;
        }
        nc ++ ;
    }
    return false ;
}

int64
Lexer_CheckForwardToStatementEnd_Is_LValue ( Lexer * lexer, Word * word )
{
    byte * inputPtr ;
    int64 index ;
    int64 tokenStartReadLineIndex = ( ( int64 ) word == - 1 ) ? lexer->TokenStart_ReadLineIndex : word->W_RL_Index ;
    if ( AtCommandLine ( lexer->ReadLiner0 ) )
    {
        index = tokenStartReadLineIndex ;
        inputPtr = & lexer->ReadLiner0->InputLine[index] ;
    }
    else
    {
        index = Lexer_ConvertLineIndexToFileIndex ( lexer, tokenStartReadLineIndex ) ;
        inputPtr = & lexer->ReadLiner0->InputStringOriginal [index] ;
    }
    return IsLValue_String_CheckForwardToStatementEnd ( inputPtr ) ;

}

// assuming no comments

Boolean
Lexer_IsLValue_CheckBackToLastSemiForParenOrBracket ( Lexer * lexer, Word * word )
{
    ReadLiner * rl = lexer->ReadLiner0 ;
    byte * nc = & rl->InputStringOriginal [lexer->TokenStart_FileIndex] ;
    while ( 1 )
    {
        switch ( *nc )
        {
            case ';': case ',': case '}': case '{': case '&': return true ;
            case '=': case '\n': return false ;
            case ')': case '(': return Lexer_CheckForwardToStatementEnd_Is_LValue ( lexer, word ) ;
            default: break ;
        }
        nc -- ;
    }
    return true ;
}

// assuming no comments

Boolean
Lexer_IsLValue_CheckForwardToNextSemiForArrayVariable ( Lexer * lexer, Word * word )
{
    if ( ( word->CAttribute & ( OBJECT | THIS | QID ) ) || GetState ( word, QID ) )
    {
        ReadLiner * rl = lexer->ReadLiner0 ;
        byte * nc = & rl->InputStringOriginal [lexer->TokenStart_FileIndex] ;
        Boolean space = false, inArray = false ;
        byte onc1 ;
        while ( 1 )
        {
            switch ( *nc )
            {
                case ';': case ',': case '}': case '{': case '.': case ')': case ' ': case 0: case (byte ) ( uint8 ) EOF: return true ;
                case '=':
                {
                    if ( * ( nc + 1 ) == '=' ) return false ;
                    else
                    {
                        onc1 = * ( nc - 1 ) ;
                        if ( ispunct ( onc1 ) )
                        {
                            if ( ( onc1 != '<' ) && ( onc1 != '>' ) ) return true ; // op equal // ?? >= <=
                            else return false ;
                        }
                        else return true ;
                    }
                }
                case '[': inArray = true, space = false ;
                case ']': inArray = false, space = false ;
                default: break ;
            }
            if ( ( ! inArray ) && space && isalnum ( *nc ) ) return false ; // false means word is to be an rvalue
            if ( inArray && isalpha ( *nc ) ) // true means we have an array varible with this object
                return true ;
            nc ++ ;
        }
        return true ;
    }
    else return false ;
}

Boolean
Is_LValue ( Context * cntx, Word * word )
{
    Boolean isLValue = true ; // in postfix generally 
    Compiler * compiler = cntx->Compiler0 ;
    if ( GetState ( cntx, ADDRESS_OF_MODE ) ) isLValue = true ;
    else if ( GetState ( cntx, C_SYNTAX | INFIX_MODE ) ) // lvalue is a C syntax concept
    {
        if ( GetState ( compiler, ARRAY_MODE ) ) isLValue = Lexer_IsLValue_CheckForwardToNextSemiForArrayVariable ( cntx->Lexer0, word ) ;
        else isLValue = Lexer_CheckForwardToStatementEnd_Is_LValue ( cntx->Lexer0, word ) ;
    }
    SetState ( _Context_, ADDRESS_OF_MODE, false ) ;
    return isLValue ;
}

// char sets would be better here ??

Boolean
Lexer_IsTokenReverseDotted ( Lexer * lexer )
{
    ReadLiner * rl = lexer->ReadLiner0 ;
    int64 i, space = 0, start = lexer->TokenStart_ReadLineIndex - 1 ;
    byte * nc = & rl->InputLineString [ start ] ;
    while ( 1 )
    {
        //byte * current = & rl->InputLineString [ i ] ;
        switch ( *nc )
        {
            case ']': case '[': return true ;
            case '\n': case ',': case ';': case '(': case ')': case '\'': return false ;
            case '.':
            {
                if ( *( nc + 1 ) != '.' ) // watch for (double/triple) dot ellipsis
                    return true ;
                break ;
            }
            case '"':
            {
                if ( i < start ) return false ;
                break ;
            }
            case ' ':
            {
                space ++ ;
                break ;
            }
            default:
            {
                if ( ( ! GetState ( _Compiler_, ARRAY_MODE ) ) && space && isgraph ( *nc ) ) return false ;
                else
                {
                    space = 0 ;
                    break ;
                }
            }
        }
        nc -- ;
    }
    return false ;
}

// char sets would be better here ??

Boolean
ReadLiner_IsTokenForwardDotted ( ReadLiner * rl, int64 index )
{
    int64 i, space = 0 ;
    byte * nc = & rl->InputLineString [ index ] ;
    while ( 1 )
    {
        switch ( *nc )
        {
            case ']': case '[': return true ;
            case ',': case ';': case '(': case ')': case '\n': case '\'': return false ;
            case '.':
            {
                if ( *( nc + 1 ) != '.' ) // watch for (double/triple) dot ellipsis
                    return true ;
                break ;
            }
            case '"':
            {
                if ( i > index ) return false ;
                break ;
            }
            case ' ':
            {
                space ++ ;
                break ;
            }
            default:
            {
                if ( ( ! GetState ( _Compiler_, ARRAY_MODE ) ) && space && isgraph ( *nc ) ) return false ;
                else
                {
                    space = 0 ;
                    break ;
                }
            }
        }
        nc ++ ;
    }
    return false ;
}

Boolean
_Lexer_IsTokenForwardDotted ( Lexer * lexer, int64 end )
{
    return ReadLiner_IsTokenForwardDotted ( lexer->ReadLiner0, end ? end - 1 : lexer->TokenStart_ReadLineIndex ) ;
}

Boolean
Lexer_IsTokenForwardDotted ( Lexer * lexer )
{
    return _Lexer_IsTokenForwardDotted ( lexer, 0 ) ;
}

