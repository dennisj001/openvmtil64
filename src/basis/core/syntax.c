
#include "../../include/cfrtil64.h"

void
Interpret_DoParenthesizedRValue ( )
{
    Compiler * compiler = _Compiler_ ;
    int64 svcm = GetState ( compiler, COMPILE_MODE ) ;
    _Interpret_Until_Token ( _Interpreter_, ")", 0 ) ;
    SetState ( compiler, COMPILE_MODE, svcm ) ;
}

void
Interpret_C_Block_EndBlock ( byte * tokenToUse, Boolean insertFlag )
{
    if ( tokenToUse ) _CfrTil_->EndBlockWord->Name = tokenToUse ;
    if ( insertFlag ) SetState ( _Debugger_, DBG_OUTPUT_INSERTION, true ) ;
    int64 tsrli = - 1, scwi = - 1 ;
    Word_SetTsrliScwi ( _CfrTil_->EndBlockWord, tsrli, scwi ) ;
    _Debugger_->SubstitutedWord = _CfrTil_->BeginBlockWord ;
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
    _Debugger_->SubstitutedWord = _CfrTil_->BeginBlockWord ;
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
        byte chr = token[0] ;
        switch ( chr )
        {
            case '(':
            {
                if ( compiler->TakesLParenAsBlock && ( ! compiler->InLParenBlock ) )
                {
                    // interpret a (possible) 'for' c parenthesis expression
                    compiler->InLParenBlock = true ;
                    Interpret_C_Block_BeginBlock ( ( byte* ) "(", 0 ) ;
                    compiler->TakesLParenAsBlock = false ; // after the first block
                    break ;
                }
                else goto doDefault ;
            }
            case ')':
            {
                if ( compiler->InLParenBlock )
                {
                    List_InterpretLists ( compiler->PostfixLists ) ;
                    compiler->InLParenBlock = false ;
                    compiler->TakesLParenAsBlock = false ;
                    Interpret_C_Block_EndBlock ( ( byte* ) ")", 1 ) ;
                    //CfrTil_TypeStack_Pop ( ) ; // the logic word
                    if ( ! _Context_StringEqual_PeekNextToken ( _Context_, ( byte* ) "{", 0 ) )
                    {
                        Interpret_C_Block_BeginBlock ( ( byte* ) "{", 1 ) ;
                        semicolonEndsThisBlock = true ;
                    }
                    blocksParsed ++ ;
                    break ;
                }
                else goto doDefault ;
            }
            case '{':
            {
                Interpret_C_Block_BeginBlock ( 0, 0 ) ;
                semicolonEndsThisBlock = false ;
                break ;
            }
            case '}':
            {
                Interpret_C_Block_EndBlock ( 0, 0 ) ;
                blocksParsed ++ ;
                break ;
            }
                //case ',' :
            case ';':
            {
                List_InterpretLists ( compiler->PostfixLists ) ;
                if ( semicolonEndsThisBlock )
                {
                    Interpret_C_Block_EndBlock ( ( byte* ) ";", 0 ) ;
                    blocksParsed ++ ;
                }
                if ( compiler->InLParenBlock ) Interpret_C_Block_BeginBlock ( ( byte* ) "{", 1 ) ;
                break ;
            }
            case 'e':
            {
                if ( String_Equal ( ( char* ) token, "else" ) )
                {
                    if ( takesAnElseFlag )
                    {
                        takesAnElseFlag = false ;
                        if ( ! _Context_StringEqual_PeekNextToken ( _Context_, ( byte* ) "{", 0 ) )
                        {
                            Interpret_C_Block_BeginBlock ( ( byte* ) "{", 1 ) ;
                            semicolonEndsThisBlock = true ;
                        }
                        continue ;
                    }
                    else _SyntaxError ( "Syntax Error : incorrect \"else\" (with no \"if\"?) : ", 1 ) ;
                }
                // ... drop thru to default:
            }
doDefault:
            default:
            {
                word = _Interpreter_TokenToWord ( interp, token, - 1, - 1 ) ;
                if ( word )
                {
                    Interpreter_DoWord ( interp, word, - 1, - 1 ) ;
                    if ( word->W_MorphismAttributes & COMBINATOR )
                    {
                        if ( semicolonEndsThisBlock )
                        {
                            Interpret_C_Block_EndBlock ( ( byte* ) "}", String_Equal ( token, ";" ) ) ;
                            blocksParsed ++ ;
                        }
                    }
                }
                break ;
            }
        }
        if ( takesAnElseFlag && ( blocksParsed == 2 ) )
        {
            if ( _Context_StringEqual_PeekNextToken ( _Context_, ( byte* ) "else", 1 ) )
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
    Context * cntx = _Context_ ;
    ReadLiner * rl = cntx->ReadLiner0 ;
    if ( ( GetState_TrueFalse ( cntx->Interpreter0, ( PREPROCESSOR_MODE ), ( PREPROCESSOR_DEFINE ) ) ) )
    {
        // this is for "#define" (which is parsed as '#' 'define', two words)
        //if ( isalnum ( ReadLine_LastReadChar ( rl ) ) ) CfrTil_LocalsAndStackVariablesBegin ( ) ;
        //else 
        Interpret_DoParenthesizedRValue ( ) ;
        return ;
    }
    if ( ReadLine_CheckForLocalVariables ( rl ) )
    {
        CfrTil_LocalsAndStackVariablesBegin ( ) ;
        return ;
    }
    else if ( CompileMode && ( ( ! GetState ( cntx->Compiler0, VARIABLE_FRAME ) ) || ( ReadLine_PeekNextNonWhitespaceChar ( rl ) == '|' ) ) )
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
        if ( ( lhsWord->W_ObjectAttributes & ( OBJECT | OBJECT_FIELD | THIS | QID ) || GetState ( lhsWord, QID ) ) )
        {
            if ( ( ! String_Equal ( word0a->Name, "]" ) ) &&
                ( ! ( word0a->W_ObjectAttributes & ( ( LITERAL | NAMESPACE_VARIABLE | THIS | OBJECT | LOCAL_VARIABLE | PARAMETER_VARIABLE ) ) ) ) ) Compile_TosRmToTOS ( ) ;
            wordr = _CfrTil_->PokeWord ;
        }
        else
        {
            int64 svState = cntx->State ;
            SetState ( cntx, C_SYNTAX | INFIX_MODE, false ) ; // we don't want to just set compiler->LHS_Word
            if ( GetState ( _Context_, ADDRESS_OF_MODE ) ) lhsWord->ObjectByteSize = sizeof (byte* ) ;
            Interpreter_DoWord_Default ( interp, lhsWord, lhsWord->W_RL_Index, lhsWord->W_SC_Index ) ;
            //CfrTil_TypeStack_Drop ( ) ;
            cntx->State = svState ;
            wordr = _CfrTil_->StoreWord ;
        }
    }
    else wordr = _CfrTil_->PokeWord ;
    d0 ( if ( Is_DebugModeOn ) _CfrTil_SC_WordList_Show ( "\nCfrTil_C_Infix_EqualOp : before op word", 0, 0 ) ) ;
    if ( op ) Block_Eval ( op ) ;
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
    SetState ( _Context_, ADDRESS_OF_MODE, false ) ;
}

void
CfrTil_IncDec ( int64 op ) // ++/--
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    int64 sd = List_Depth ( _CfrTil_->Compiler_N_M_Node_WordList ) ;
    if ( ( sd > 1 ) && ( ! GetState ( cntx, LC_CFRTIL ) ) )
    {
        Word * currentWord = _CfrTil_WordList ( 0 ) ;
        Word *two = 0, *one = ( Word* ) _CfrTil_WordList ( 1 ) ;
        if ( GetState ( _Context_, C_SYNTAX ) && ( one->W_MorphismAttributes & CATEGORY_OP )
            && ( ! ( one->W_MorphismAttributes & CATEGORY_OP_LOAD ) ) ) one = two = _CfrTil_WordList ( 2 ) ;
        byte * nextToken = Lexer_Peek_Next_NonDebugTokenWord ( cntx->Lexer0, 1, 0 ) ;
        Word * nextWord = Finder_Word_FindUsing ( cntx->Interpreter0->Finder0, nextToken, 0 ) ;
        if ( nextWord && IS_MORPHISM_TYPE ( nextWord )
            && ( nextWord->W_MorphismAttributes & ( CATEGORY_OP_ORDERED | CATEGORY_OP_UNORDERED | CATEGORY_OP_DIVIDE | CATEGORY_OP_EQUAL ) ) )
        {
            _CfrTil_WordList_PopWords ( 1 ) ; // because we are going to call the opWord in compilable order below 
            if ( GetState ( compiler, ( C_INFIX_EQUAL | DOING_AN_INFIX_WORD | DOING_BEFORE_AN_INFIX_WORD ) ) && GetState ( _CfrTil_, OPTIMIZE_ON ) && CompileMode )
            {
                //if ( one ) SetHere (one->Coding, 1) ;
                // ?? couldn't this stuff be done with _Interpret_C_Until_EitherToken ??
                dllist * postfixList = List_New ( SESSION ) ;
                List_Push_1Value_NewNode_T_WORD ( postfixList, ( int64 ) currentWord, COMPILER_TEMP ) ;
                if ( one ) List_Push_1Value_NewNode_T_WORD ( postfixList, ( int64 ) one, COMPILER_TEMP ) ;
                List_Push_1Value_NewNode_T_WORD ( compiler->PostfixLists, ( int64 ) postfixList, COMPILER_TEMP ) ;
                return ;
            }
            else
            {
                Interpreter_InterpretNextToken ( cntx->Interpreter0 ) ;
                if ( sd > 1 )
                {
                    Interpreter_DoWord ( cntx->Interpreter0, one, - 1, - 1 ) ;
                    Interpreter_DoWord ( cntx->Interpreter0, currentWord, - 1, - 1 ) ;
                    return ;
                }
            }
        }
        if ( one && one->W_ObjectAttributes & ( PARAMETER_VARIABLE | LOCAL_VARIABLE | NAMESPACE_VARIABLE ) )
        {
            if ( GetState ( _Context_, C_SYNTAX ) )
            {
                if ( ! GetState ( compiler, INFIX_LIST_INTERPRET ) ) //&& ( ! ( one->W_ObjectAttributes & REGISTER_VARIABLE )) )
                {
                    //List_DropN ( _CfrTil_->Compiler_N_M_Node_WordList, 1 ) ; // the operator; let higher level see the variable
                    _CfrTil_WordList_PopWords ( 1 ) ; // op
                    if ( GetState ( _CfrTil_, OPTIMIZE_ON ) && ( ! two ) ) SetHere ( one->Coding, 1 ) ;
                    CfrTil_WordList_PushWord ( one ) ; // variable
                    dllist * postfixList = List_New ( SESSION ) ;
                    List_Push_1Value_NewNode_T_WORD ( postfixList, ( int64 ) currentWord, COMPILER_TEMP ) ; // op : setup a prefix inc/dec variable list ??
                    List_Push_1Value_NewNode_T_WORD ( postfixList, ( int64 ) one, COMPILER_TEMP ) ; // variable
                    List_Push_1Value_NewNode_T_WORD ( compiler->PostfixLists, ( int64 ) postfixList, COMPILER_TEMP ) ;
                    _CfrTil_WordList_PopWords ( 1 ) ;
                    //List_DropN ( _CfrTil_->Compiler_N_M_Node_WordList, 1 ) ;
                    return ;
                }
            }
        }
        else if ( nextWord && ( nextWord->W_ObjectAttributes & ( PARAMETER_VARIABLE | LOCAL_VARIABLE | NAMESPACE_VARIABLE ) ) ) // prefix
        {
            if ( String_Equal ( currentWord->Name, "++" ) ) op = INC ;
            else op = DEC ;
            if ( nextWord->W_ObjectAttributes & ( PARAMETER_VARIABLE | LOCAL_VARIABLE ) )
            {
                _Compile_Group5 ( op, MEM, FP, 0, LocalOrParameterVar_Disp ( nextWord ), 0 ) ;
            }
            else // crash ; FIXME!!
            {
                _Compile_Move_Literal_Immediate_To_Reg ( THRU_REG, ( int64 ) nextWord->W_PtrToValue, 0 ) ;
                Compile_Move_Rm_To_Reg ( ACC, THRU_REG, 0, 0 ) ;
                _Compile_Group5 ( op, REG, ACC, 0, 0, 0 ) ;
                Compile_Move_Reg_To_Rm ( THRU_REG, ACC, 0, 0 ) ;

            }
            return ;
        }
        else
        {
            if ( GetState ( compiler, C_INFIX_EQUAL ) )
            {
                if ( ! GetState ( compiler, INFIX_LIST_INTERPRET ) ) // new logic test ??
                {
                    int64 i ;
                    Word * word ;
                    dllist * postfixList = List_New ( SESSION ) ;
                    List_Push_1Value_NewNode_T_WORD ( postfixList, ( int64 ) currentWord, COMPILER_TEMP ) ; // remember : this will be lifo
                    for ( i = 1 ; word = _CfrTil_WordList ( i ), ( word->W_MorphismAttributes & ( CATEGORY_OP_ORDERED | CATEGORY_OP_UNORDERED | CATEGORY_OP_DIVIDE | CATEGORY_OP_EQUAL ) ) ; i ++ ) ;
                    List_Push_1Value_NewNode_T_WORD ( postfixList, ( int64 ) _CfrTil_WordList ( i ), COMPILER_TEMP ) ;
                    List_Push_1Value_NewNode_T_WORD ( compiler->PostfixLists, ( int64 ) postfixList, COMPILER_TEMP ) ;
                    List_DropN ( _CfrTil_->Compiler_N_M_Node_WordList, 1 ) ; // the operator; let higher level see the variable for optimization
                    return ;
                }
            }
        }
    }
    _CfrTil_Do_IncDec ( op ) ;
    SetState ( _Debugger_, DEBUG_SHTL_OFF, false ) ;
}

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
        byte * compiledAtAddress = Compile_UninitializedJumpEqualZero ( ) ;
        Stack_Push_PointerToJmpOffset ( compiledAtAddress ) ;
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
    byte * nc ;
    if ( rl->InputStringOriginal ) nc = & rl->InputStringOriginal [lexer->TokenStart_FileIndex] ;
    else nc = & rl->InputLineString [rl->CursorPosition] ;
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
    if ( ( word->W_ObjectAttributes & ( OBJECT | THIS | QID ) ) || GetState ( word, QID ) )
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
    //SetState ( _Context_, ADDRESS_OF_MODE, false ) ;
    return isLValue ;
}

// char sets would be better here ??

Boolean
Lexer_IsTokenReverseDotted ( Lexer * lexer )
{
    ReadLiner * rl = lexer->ReadLiner0 ;
    int64 space = 0, i, graph = 0, start = lexer->TokenStart_ReadLineIndex - 1 ;
    byte * nc = & rl->InputLineString [ start ] ;
    i = start ; //??
    while ( 1 )
    {
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
                graph ++ ;
                if ( i < start ) return false ; //??
                break ;
            }
            case ' ':
            {
                if ( graph ) space ++ ;
                break ;
            }
            default:
            {
                graph ++ ;
                if ( ( ! GetState ( _Compiler_, ARRAY_MODE ) ) && space && isgraph ( *nc ) ) return false ;
                else
                {
                    space = 0 ;
                    break ;
                }
            }
        }
        i -- ;
        nc -- ;
    }
    return false ;
}

// char sets would be better here ??

Boolean
ReadLiner_IsTokenForwardDotted ( ReadLiner * rl, int64 index )
{
    int64 i = 0, space = 0 ;
    byte * nc = & rl->InputLineString [ index ] ;
    for ( i = 0 ; 1 ; i ++, nc ++ )
    {
        switch ( *nc )
        {
            case ']': case '[': return true ;
            case ',': case ';': case '(': case ')': case '\n': case '\'': return false ;
            case '.':
            {
                if ( i && ( *( nc + 1 ) != '.' ) )// watch for (double/triple) dot ellipsis
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

