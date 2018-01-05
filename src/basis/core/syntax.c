
#include "../../include/cfrtil64.h"

int64
_Interpret_CheckEqualBeforeSemi_LValue ( byte * nc )
{
    //if ( GetState ( _Context_, ADDRESS_OF_MODE ) ) return true ;
    while ( *nc )
    {
        if ( *nc == '=' )
        {
            if ( * ( nc + 1 ) == '=' ) return false ;
            else return true ; // we have an lvalue
        }
        else if ( *nc == ';' ) return false ; // we have an rvalue
            //else if ( *nc == '"' ) return false ; // we have an rvalue
        else if ( *nc == ')' ) return false ; // we have an rvalue
        else if ( *nc == '(' ) return false ; // we have an rvalue
        else if ( *nc == '{' ) return false ; // we have an rvalue
        else if ( *nc == '}' ) return false ; // we have an rvalue
        nc ++ ;
    }
    return false ;
}

int64
Interpret_CheckEqualBeforeSemi_LValue ( Word * word )
{
    int64 tokenStartReadLineIndex = ( ( int64 ) word == - 1 ) ? _Context_->Lexer0->TokenStart_ReadLineIndex : word->W_TokenStart_ReadLineIndex ;
    return _Interpret_CheckEqualBeforeSemi_LValue ( & _Context_->ReadLiner0->InputLine [ tokenStartReadLineIndex ] ) ; //word->W_StartCharRlIndex ] ) ;
}

void
Interpret_DoParenthesizedRValue ( )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    int64 svcm = GetState ( compiler, COMPILE_MODE ) ;
    byte * token ;
    CfrTil_WordList_PopNode ( ) ; // drop the '(' 
    while ( 1 )
    {
        token = _Lexer_ReadToken ( cntx->Lexer0, 0 ) ;
        if ( String_Equal ( ( char* ) token, ")" ) )
        {
            break ;
        }
        Interpreter_InterpretAToken ( cntx->Interpreter0, token, - 1 ) ;
    }
    SetState ( compiler, COMPILE_MODE, svcm ) ;
}

int64
CfrTil_Interpret_C_Block ( Boolean takesLParenAsBlock, Boolean semicolonWillAlsoEndBlock, Boolean beginBlockFlag )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    Interpreter * interp = cntx->Interpreter0 ;
    Word * word ;
    int64 blocksParsed ;
    byte * token ;
    Boolean leftBracketParsed = 0 ; //bb ; // state controls

    if ( beginBlockFlag )
    {
        // ? source code adjustments ?
        if ( takesLParenAsBlock ) _CfrTil_->BeginBlockWord->Name = "(" ;
        _CfrTil_->BeginBlockWord->W_SC_ScratchPadIndex = 0 ;
        _CfrTil_->BeginBlockWord->W_TokenStart_ReadLineIndex = _Lexer_->TokenStart_ReadLineIndex ;
        Word_Eval ( _CfrTil_->BeginBlockWord ) ;
        _CfrTil_->BeginBlockWord->Name = "{" ;
    }
    for ( blocksParsed = 0 ; token = Lexer_ReadToken ( cntx->Lexer0 ) ; )
    {
        if ( String_Equal ( ( char* ) token, "}" ) )
        {
            leftBracketParsed = 0 ;
            semicolonWillAlsoEndBlock = false ;
            goto endblock ;
        }
        else if ( String_Equal ( ( char* ) token, ")" ) && takesLParenAsBlock && compiler->InLParenBlock )
        {
            compiler->InLParenBlock = false ;
            _CfrTil_->EndBlockWord->Name = ")" ;
            _CfrTil_->EndBlockWord->W_SC_ScratchPadIndex = 0 ;
            _CfrTil_->EndBlockWord->W_TokenStart_ReadLineIndex = _Lexer_->TokenStart_ReadLineIndex ;
            Word_Eval ( _CfrTil_->EndBlockWord ) ;
            _CfrTil_->EndBlockWord->Name = "}" ;
            goto endblock2 ;
        }
        else if ( String_Equal ( ( char* ) token, ";" ) )
        {
            List_InterpretLists ( compiler->PostfixLists ) ;
            if ( semicolonWillAlsoEndBlock )
            {
endblock:
                _CfrTil_->EndBlockWord->W_SC_ScratchPadIndex = 0 ;
                Word_Eval ( _CfrTil_->EndBlockWord ) ;
endblock2:
                CfrTil_ClearTokenList ( ) ;
                blocksParsed ++ ;
                break ;
            }
            else List_InterpretLists ( compiler->PostfixLists ) ;
            continue ;
        }
        else if ( String_Equal ( ( char* ) token, "(" ) && takesLParenAsBlock && ( ! compiler->InLParenBlock ) )
        {
            compiler->InLParenBlock = true ;
            while ( compiler->InLParenBlock ) blocksParsed += CfrTil_Interpret_C_Block ( 1, 1, 1 ) ; //semicolonWillAlsoEndBlock in case of a 'for' block
            if ( _Context_StrCmpNextToken ( _Context_, ( byte* ) "{" ) )//&& (!inLParenBlock) ) 
            {
                //CfrTil_Interpret_C_Block ( Boolean takesLParenAsBlock, Boolean semicolonWillAlsoEndBlock, Boolean beginBlockFlag )
                blocksParsed += CfrTil_Interpret_C_Block ( 0, 1, 1 ) ; //semicolonWillAlsoEndBlock for 'for' blocks
            }
            break ;
        }
        else if ( String_Equal ( ( char* ) token, "{" ) )
        {
            blocksParsed += CfrTil_Interpret_C_Block ( 0, 0, 1 ) ;
            break ;
        }
        else
        {
            //word = Interpreter_InterpretAToken ( interp, token, - 1 ) ;
            word = _Interpreter_TokenToWord ( interp, token ) ;
            if ( word )
            {
                _Interpreter_DoWord ( interp, word, - 1 ) ;
                if ( ( blocksParsed < 2 ) && ( word->CAttribute & LITERAL ) && ( ! Is_LValue ( word ) ) ) //GetState ( cntx, C_LHS ) )
                {
                    // this block is used in eg. interpret.cft
                    // setup for optimization if this literal constant is the loop conditional
                    BlockInfo * bi = ( BlockInfo* ) _Stack_Top ( _Compiler_->BlockStack ) ;
                    bi->LiteralWord = word ;
                    //bi->LiteralWord = bi->LogicCodeWord = word ;
                }
                else if ( word->CAttribute & COMBINATOR )
                {
                    if ( beginBlockFlag && semicolonWillAlsoEndBlock )
                    {
                        goto endblock ;
                    }
                }
            }
        }
    }
    return blocksParsed ;
}

void
CfrTil_InterpretNBlocks ( int64 blocks, Boolean takesLParenAsBlockFlag, Boolean alsoTakesSemicolonToEndBlock, Boolean beginBlock )
{
    int64 blocksParsed ;
    Boolean bb = 0 ;
    for ( blocksParsed = 0 ; blocksParsed < blocks ; )
    {
        blocksParsed += CfrTil_Interpret_C_Block ( takesLParenAsBlockFlag, alsoTakesSemicolonToEndBlock, beginBlock ) ;
    }
}

void
CfrTil_C_LeftParen ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    if ( ( ( ! CompileMode ) && ( ! GetState ( _Context_->Interpreter0, PREPROCESSOR_MODE ) ) ) ||
        ( ( CompileMode && ( ! GetState ( compiler, VARIABLE_FRAME ) ) ) || ( ReadLine_PeekNextNonWhitespaceChar ( _Context_->Lexer0->ReadLiner0 ) == '|' ) ) ) //( ! GetState ( _Context_, INFIX_MODE ) ) )
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
    Word * word0 = Compiler_WordList ( 0 ), *lhsWord = compiler->LHS_Word, *rword ;
    int64 tsrli = word0 ? word0->W_TokenStart_ReadLineIndex : 0 ; //, svOOState = GetState ( _CfrTil_, OPTIMIZE_ON ) ;
    int64 svscwi = word0 ? word0->W_SC_WordIndex : 0 ; //, svOOState = GetState ( _CfrTil_, OPTIMIZE_ON ) ;
    byte * svName, * token ;
    SetState ( compiler, C_INFIX_EQUAL, true ) ;
    d0 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : before pop 2 words" ) ) ;
    if ( opWord ) _CfrTil_WordList_PopWords ( 2 ) ;
    d0 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_C_Infix_Equal0p : before interpret until ',' or ';' :" ) ) ;
    //if ( GetState ( compiler, C_COMBINATOR_LPAREN ) ) token = _Interpret_Until_Token ( interp, ( byte* ) ")", 0 ) ;
    d0 ( if ( Is_DebugOn ) CfrTil_Using ( ) ) ;
    token = _Interpret_C_Until_EitherToken ( interp, ( byte* ) ";", ( byte* ) ",", ( byte* ) ")", ( byte* ) " \n\r\t" ) ;
    //List_InterpretLists ( _Compiler_->PostfixLists ) ;
    _CfrTil_AddTokenToHeadOfTokenList ( token ) ; // so the callee can check/use or use
    d0 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : after interpret until ';' :" ) ) ;
    if ( lhsWord )
    {
#if 0        
        if ( opWord )
        {
            _Interpreter_DoWord_Default ( interp, lhsWord, 0 ) ;
        }
        else
        {
            _CfrTil_WordList_PushWord ( lhsWord ) ;
            d0 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : after interpret until ';' :" ) ) ;
        }
#else
        SetState ( cntx, C_SYNTAX, false ) ; // we don't want to just set compiler->LHS_Word
        //_CfrTil_WordList_PushWord ( lhsWord ) ;
        _Interpreter_DoWord_Default ( interp, lhsWord, lhsWord->W_SC_WordIndex ) ;
        //_Compile_GetVarLitObj_LValue_To_Reg ( lhsWord, ACC ) ;
        //_Word_CompileAndRecord_PushReg ( lhsWord, ( lhsWord->CAttribute & REGISTER_VARIABLE ) ? lhsWord->RegToUse : ACC ) ;
        SetState ( cntx, C_SYNTAX, true ) ;
#endif        
        word0 = _CfrTil_->StoreWord ;
    }
    else
    {
        word0 = _CfrTil_->PokeWord ;
    }
    SetState ( _Debugger_, DEBUG_SHTL_OFF, false ) ; // we're going to temporarily adjust the name
    d0 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : after _CfrTil_WordLists_PushWord ( word ) ;" ) ) ;
    d0 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : before op word" ) ) ;
    if ( opWord ) rword = opWord ;
    else rword = word0 ; //_Interpreter_DoWord_Default ( interp, opWord ) ;
    rword->W_TokenStart_ReadLineIndex = tsrli ;
    rword->W_SC_WordIndex = svscwi ;
    svName = rword->Name ;
    rword->Name = "=" ;
    Word_Set_SCA ( rword ) ;
    d1 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : after interpret until ';' :" ) ) ;
    _Interpreter_DoWord_Default ( interp, rword, svscwi ) ;
    word0->Name = svName ;
    //_DEBUG_SHOW ( opWord ? opWord : word, 1 ) ;
    //SetState ( _Debugger_, DEBUG_SHTL_OFF, true ) ; // ?? : is this still needed (it was above, before) since we just temporarily adjusted the name
    if ( GetState ( compiler, C_COMBINATOR_LPAREN ) )
    {
        if ( word0->StackPushRegisterCode ) SetHere ( word0->StackPushRegisterCode ) ; // this is the usual after '=' in non C syntax; assuming optimizeOn
        BlockInfo_Setup_BI_tttn ( compiler, ZERO_TTT, NZ, 3 ) ; // must set logic flag for Compile_ReConfigureLogicInBlock in Block_Compile_WithLogicFlag
    }
    List_InterpretLists ( compiler->PostfixLists ) ;
    compiler->LHS_Word = 0 ;
    //Interpreter_InterpretAToken ( interp, token, - 1 ) ;

    if ( ! Compiling ) CfrTil_InitSourceCode ( _CfrTil_ ) ;
    SetState ( _Debugger_, DEBUG_SHTL_OFF, false ) ;
    SetState ( compiler, C_INFIX_EQUAL, false ) ;
    d0 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : just before return" ) ) ;
}

void
CfrTil_SetInNamespaceFromBackground ( )
{
    Context * cntx = _Context_ ;
    if ( cntx->Compiler0->C_FunctionBackgroundNamespace ) _CfrTil_Namespace_InNamespaceSet ( cntx->Compiler0->C_FunctionBackgroundNamespace ) ;
    else
        if ( cntx->Compiler0->C_BackgroundNamespace ) _CfrTil_Namespace_InNamespaceSet ( cntx->Compiler0->C_BackgroundNamespace ) ;
}

#if 0

int64
_Interpret_Do_CombinatorLeftParen ( )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    int64 svcm = GetState ( compiler, COMPILE_MODE ), svclps = GetState ( compiler, C_COMBINATOR_LPAREN ) ;
    int64 blocksParsed = 0, semiFlag = 0 ;
    byte * token ;
    SetState ( compiler, C_COMBINATOR_LPAREN, true ) ;
    while ( 1 )
    {
        token = _Lexer_ReadToken ( cntx->Lexer0, 0 ) ;
        while ( ( semiFlag ) && String_Equal ( ( char* ) token, ";" ) )
        {
            token = _Lexer_ReadToken ( cntx->Lexer0, 0 ) ;
        } // essential don't do two semi ';' in a row if they were on the list for some reason
        semiFlag = 0 ;

        if ( String_Equal ( ( char* ) token, ";" ) )
        {
            if ( blocksParsed ) _CfrTil_WordList_PushWord ( _Finder_FindWord_InOneNamespace ( _Finder_, Namespace_Find ( "Reserved" ), "}" ) ) ; // only useful for optimizing in a C 'for' combinator
            CfrTil_EndBlock ( ) ;
            CfrTil_BeginBlock ( ) ;
            blocksParsed ++ ;
            semiFlag = 1 ;
            continue ;
        }
        else if ( String_Equal ( ( char* ) token, ")" ) )
        {
            List_InterpretLists ( _Compiler_->PostfixLists ) ;
            CfrTil_EndBlock ( ) ;
            blocksParsed ++ ;
            break ;
        }
        else if ( String_Equal ( token, "{" ) )
        {
            List_InterpretLists ( _Compiler_->PostfixLists ) ;
            _CfrTil_AddTokenToHeadOfTokenList ( token ) ;
            blocksParsed ++ ;
            break ;
        }
        Word * word = Interpreter_InterpretAToken ( cntx->Interpreter0, token, - 1 ) ;
        //if ( ( blocksParsed == 0 ) && ( cntx->CurrentlyRunningWord->CAttribute & LITERAL ) && ( ! Is_LValue ( cntx->Interpreter0->w_Word ) ) ) //GetState ( cntx, C_LHS ) )
        //if ( ( blocksParsed == 0 ) && ( word && ( word->CAttribute & LITERAL ) ) && ( ! Is_LValue ( word ) ) ) //GetState ( cntx, C_LHS ) )
        if ( ( blocksParsed < 2 ) && ( word && ( word->CAttribute & LITERAL ) ) && ( ! Is_LValue ( word ) ) ) //GetState ( cntx, C_LHS ) )
        {
            // this block is used in eg. interpret.cft
            // setup for optimization if this literal constant is the loop conditional
            BlockInfo * bi = ( BlockInfo* ) _Stack_Top ( compiler->BlockStack ) ;
            bi->LiteralWord = word ;
        }
    }
    SetState ( compiler, COMPILE_MODE, svcm ) ;
    SetState ( compiler, C_COMBINATOR_LPAREN, svclps ) ;
    return blocksParsed ;
}

void
CfrTil_InterpretNBlocks ( int64 blocks, Boolean takesLParenAsBlockFlag, Boolean alsoTakesSemicolonToEndBlock, int8 blocksBegun )
{
    Context * cntx = _Context_ ;
    Interpreter * interp = cntx->Interpreter0 ;
    Word * word ;
    int64 blocksParsed ;
    byte * token ;
    Boolean leftBracketParsed = 0 ; // state controls
    for ( blocksParsed = 0 ; blocksParsed < blocks ; )
    {
        token = Lexer_ReadToken ( cntx->Lexer0 ) ;

        if ( String_Equal ( ( char* ) token, "}" ) )
        {
            leftBracketParsed = 0 ;
            goto endblock ;
        }
        else if ( String_Equal ( ( char* ) token, ";" ) )
        {
            List_InterpretLists ( _Compiler_->PostfixLists ) ;
            if ( ( alsoTakesSemicolonToEndBlock || blocksBegun )&& ( ! leftBracketParsed ) )
            {
endblock:
                CfrTil_EndBlock ( ) ;
                CfrTil_ClearTokenList ( ) ;
                blocksParsed ++ ;
                alsoTakesSemicolonToEndBlock = 0 ;
            }
            continue ;
        }
        else if ( String_Equal ( ( char* ) token, "(" ) && takesLParenAsBlockFlag )
        {
            CfrTil_BeginBlock ( ) ;
            int _blocksParsed = _Interpret_Do_CombinatorLeftParen ( ) ; // this could parse 3 blocks in a 'for' combinator
            List_InterpretLists ( _Compiler_->PostfixLists ) ;
            if ( _blocksParsed )
            {
                CfrTil_BeginBlock ( ) ;
                alsoTakesSemicolonToEndBlock = 1 ;
                blocksParsed += _blocksParsed ;
            }
            continue ;
        }
        else if ( String_Equal ( ( char* ) token, "{" ) )
        {
            if ( ! alsoTakesSemicolonToEndBlock )
            {
                CfrTil_BeginBlock ( ) ;
            }
            leftBracketParsed = 1 ;
            alsoTakesSemicolonToEndBlock = 0 ;
            continue ;
        }
        else
        {
            word = Interpreter_InterpretAToken ( interp, token, - 1 ) ;
            if ( ( word->CAttribute & COMBINATOR ) )
            {
                if ( blocksBegun )
                {
                    CfrTil_EndBlock ( ) ;
                    blocksParsed ++ ;
                }
                d0 ( if ( Is_DebugOn ) CfrTil_PrintDataStack ( ) ) ;
            }
        }
    }
}
#endif

