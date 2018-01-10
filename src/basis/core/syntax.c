
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
    //CfrTil_WordList_PopNode ( ) ; // drop the '(' 
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
    BlockInfo * bi ;
    Word * word ;
    int64 blocksParsed ;
    byte * token ;
    Boolean leftBracketParsed = 0 ; //bb ; // state controls

    if ( beginBlockFlag )
    {
        // ? source code adjustments ?
        if ( takesLParenAsBlock ) _CfrTil_->BeginBlockWord->Name = "(" ;
        _CfrTil_->BeginBlockWord->W_TokenStart_ReadLineIndex = _Lexer_->TokenStart_ReadLineIndex ;
        _Interpreter_DoWord_Default ( interp, _CfrTil_->BeginBlockWord, _CfrTil_->SC_ScratchPadIndex ) ;
        _CfrTil_->BeginBlockWord->Name = "{" ;
    }
    for ( blocksParsed = 0 ; token = Lexer_ReadToken ( cntx->Lexer0 ) ; )
    {
        if ( String_Equal ( ( char* ) token, "}" ) )
        {
            leftBracketParsed = 0 ;
            semicolonWillAlsoEndBlock = false ;
            _CfrTil_->EndBlockWord->Name = "}" ;
            goto endblock ;
        }
        else if ( String_Equal ( ( char* ) token, ")" ) && takesLParenAsBlock && compiler->InLParenBlock )
        {
            compiler->InLParenBlock = false ;
            _CfrTil_->EndBlockWord->Name = ")" ;
            goto endblock ;
        }
        else if ( String_Equal ( ( char* ) token, ";" ) )
        {
            List_InterpretLists ( compiler->PostfixLists ) ;
            if ( semicolonWillAlsoEndBlock )
            {
                _CfrTil_->EndBlockWord->Name = ";" ;
endblock:
                bi = ( BlockInfo* ) _Stack_Top ( _Compiler_->BlockStack ) ;
                bi->LogicCodeWord = word ;
                _CfrTil_->EndBlockWord->W_TokenStart_ReadLineIndex = _Lexer_->TokenStart_ReadLineIndex ;
                _Interpreter_DoWord_Default ( interp, _CfrTil_->EndBlockWord, _CfrTil_->SC_ScratchPadIndex ) ;
                _CfrTil_->EndBlockWord->Name = "}" ;
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
            word = _Interpreter_TokenToWord ( interp, token ) ;
            if ( word )
            {
                _Interpreter_DoWord ( interp, word, - 1 ) ;
                if ( word->CAttribute & COMBINATOR )
                {
                    if ( beginBlockFlag && semicolonWillAlsoEndBlock )
                    {
                        goto endblock ;
                    }
                    //else return ++blocksParsed ;
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
    int64 tsrli = word0 ? word0->W_TokenStart_ReadLineIndex : 0 ;
    int64 svscwi = word0 ? word0->W_SC_WordIndex : 0 ; 
    byte * svName, * token ;
    SetState ( compiler, C_INFIX_EQUAL, true ) ;
    d1 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : before pop 2 words" ) ) ;
    if ( opWord ) _CfrTil_WordList_PopWords ( 2, 0 ) ;
    d1 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_C_Infix_Equal0p : before interpret until ',' or ';' :" ) ) ;
    d0 ( if ( Is_DebugOn ) CfrTil_Using ( ) ) ;
    token = _Interpret_C_Until_EitherToken ( interp, ( byte* ) ";", ( byte* ) ",", ( byte* ) ")", ( byte* ) " \n\r\t" ) ;
    d1 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : after interpret until ';' :" ) ) ;
    if ( lhsWord )
    {
        SetState ( cntx, C_SYNTAX, false ) ; // we don't want to just set compiler->LHS_Word
        _Interpreter_DoWord_Default ( interp, lhsWord, lhsWord->W_SC_WordIndex ) ;
        SetState ( cntx, C_SYNTAX, true ) ;
        word0 = _CfrTil_->StoreWord ;
    }
    else
    {
        word0 = _CfrTil_->PokeWord ;
    }
    //SetState ( _Debugger_, DEBUG_SHTL_OFF, false ) ; // we're going to temporarily adjust the name
    d1 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : before op word" ) ) ;
    if ( opWord ) rword = opWord ;
    else rword = word0 ; //_Interpreter_DoWord_Default ( interp, opWord ) ;
    rword->W_TokenStart_ReadLineIndex = tsrli ;
    rword->W_SC_WordIndex = svscwi ;
    svName = rword->Name ;
    rword->Name = "=" ;
    //Word_Set_SCA ( rword ) ;
    //int64 soo = GetState ( _CfrTil_, OPTIMIZE_ON ) ;
    //SetState ( _CfrTil_, OPTIMIZE_ON, false ) ;
    _Interpreter_DoWord_Default ( interp, rword, svscwi ) ;
    //SetState ( _CfrTil_, OPTIMIZE_ON, soo ) ;
    rword->Name = svName ;
    if ( GetState ( compiler, C_COMBINATOR_LPAREN ) )
    {
        if ( word0->StackPushRegisterCode ) SetHere ( word0->StackPushRegisterCode ) ; // this is the usual after '=' in non C syntax; assuming optimizeOn
        BlockInfo_Setup_BI_tttn ( compiler, ZERO_TTT, NZ, 3 ) ; // must set logic flag for Compile_ReConfigureLogicInBlock in Block_Compile_WithLogicFlag
    }
    List_InterpretLists ( compiler->PostfixLists ) ;
    compiler->LHS_Word = 0 ;
    if ( ! Compiling ) CfrTil_InitSourceCode ( _CfrTil_ ) ;
    SetState ( _Debugger_, DEBUG_SHTL_OFF, false ) ;
    SetState ( compiler, C_INFIX_EQUAL, false ) ;
    d1 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : just before return" ) ) ;
    _CfrTil_AddTokenToHeadOfTokenList ( token ) ; // so the callee can check/use or use
}

void
CfrTil_SetInNamespaceFromBackground ( )
{
    Context * cntx = _Context_ ;
    if ( cntx->Compiler0->C_FunctionBackgroundNamespace ) _CfrTil_Namespace_InNamespaceSet ( cntx->Compiler0->C_FunctionBackgroundNamespace ) ;
    else
        if ( cntx->Compiler0->C_BackgroundNamespace ) _CfrTil_Namespace_InNamespaceSet ( cntx->Compiler0->C_BackgroundNamespace ) ;
}

