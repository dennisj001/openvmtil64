
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
            // else if ( ispunct ( * ( nc - 1 ) ) && ( ( * ( nc - 1 ) != ' ' ) ) ) return false ;
            else if ( ispunct ( * ( nc - 1 ) ) ) return false ;
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
    //_CfrTil_WordList_PopWords ( 1, 0 ) ; // pop the '('
    while ( 1 )
    {
        token = _Lexer_ReadToken ( cntx->Lexer0, 0 ) ;
        Interpreter_InterpretAToken ( cntx->Interpreter0, token, - 1 ) ;
        if ( String_Equal ( ( char* ) token, ")" ) ) break ;
    }
    SetState ( compiler, COMPILE_MODE, svcm ) ;
}

void
Interpret_C_Block_EndBlock ( Word * word, byte * actualToken )
{
    BlockInfo * bi = ( BlockInfo* ) _Stack_Top ( _Compiler_->BlockStack ) ;
    bi->LogicCodeWord = word ;
    if ( actualToken ) _CfrTil_->EndBlockWord->Name = actualToken ;
    _CfrTil_->EndBlockWord->W_TokenStart_ReadLineIndex = _Lexer_->TokenStart_ReadLineIndex ;
    _Interpreter_DoWord_Default ( _Interpreter_, _CfrTil_->EndBlockWord, _CfrTil_->SC_ScratchPadIndex ) ;
    _CfrTil_->EndBlockWord->Name = "}" ;
    //CfrTil_ClearTokenList ( ) ;
}

void
Interpret_C_Block_BeginBlock ( byte * actualToken )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    // ? source code adjustments ?
    if ( actualToken ) _CfrTil_->BeginBlockWord->Name = actualToken ;
    _CfrTil_->BeginBlockWord->W_TokenStart_ReadLineIndex = _Lexer_->TokenStart_ReadLineIndex ;
    _Interpreter_DoWord_Default ( _Interpreter_, _CfrTil_->BeginBlockWord, _CfrTil_->SC_ScratchPadIndex ) ;
    _CfrTil_->BeginBlockWord->Name = "{" ;
    compiler->BeginBlockFlag = false ;
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
            // interpret a (possible 'for') c parenthesis expression
            compiler->InLParenBlock = true ;
            Interpret_C_Block_BeginBlock ( "(" ) ;
            compiler->TakesLParenAsBlock = false ; // after the first block
        }
        else if ( String_Equal ( ( char* ) token, "{" ) )
        {
            Interpret_C_Block_BeginBlock ( "{" ) ;
            semicolonEndsThisBlock = false ;
        }
        else if ( String_Equal ( ( char* ) token, "}" ) )
        {
            //_CfrTil_->EndBlockWord->Name = "}" ;
            Interpret_C_Block_EndBlock ( word, "}" ) ;
            blocksParsed ++ ;
        }
        else if ( String_Equal ( ( char* ) token, ")" ) && compiler->InLParenBlock )
        {
            List_InterpretLists ( compiler->PostfixLists ) ;
            compiler->InLParenBlock = false ;
            compiler->TakesLParenAsBlock = false ;
            Interpret_C_Block_EndBlock ( word, ")" ) ;
            if ( ! _Context_StringEqual_PeekNextToken ( _Context_, ( byte* ) "{", 0 ) )
            {
                Interpret_C_Block_BeginBlock ( "{" ) ;
                semicolonEndsThisBlock = true ;
            }
            blocksParsed ++ ;
        }
        else if ( String_Equal ( ( char* ) token, ";" ) )
        {
            List_InterpretLists ( compiler->PostfixLists ) ;
            if ( semicolonEndsThisBlock )
            {
                //_CfrTil_->EndBlockWord->Name = ";" ;
                Interpret_C_Block_EndBlock ( word, ";" ) ;
                blocksParsed ++ ;
            }
            if ( compiler->InLParenBlock ) Interpret_C_Block_BeginBlock ( "{" ) ;
        }
        else if ( String_Equal ( ( char* ) token, "else" ) )
        {
            if ( takesAnElseFlag )
            {
                takesAnElseFlag = false ;
                if ( ! _Context_StringEqual_PeekNextToken ( _Context_, ( byte* ) "{", 0 ) )
                {
                    Interpret_C_Block_BeginBlock ( "{" ) ;
                    semicolonEndsThisBlock = true ;
                }
            }
            //else SyntaxError () ;
            continue ;
        }
        else
        {
            word = _Interpreter_TokenToWord ( interp, token ) ;
            if ( word )
            {
                _Interpreter_DoWord ( interp, word, - 1 ) ;
                if ( word->CAttribute & COMBINATOR )
                {
                    //Word * lastWord = Compiler_WordList ( 0 ) ;
                    if ( semicolonEndsThisBlock ) //&& ( _CfrTil_->EndBlockWord == lastWord ) ) //String_Equal ( lastWord->Name, ";" ) ) // ??
                    {
                        Interpret_C_Block_EndBlock ( word, ";" ) ;
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
    d0 ( if ( Is_DebugModeOn ) _Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : before pop 2 words", 0 ) ) ;
    if ( opWord ) _CfrTil_WordList_PopWords ( 1 ) ;
    d0 ( if ( Is_DebugModeOn ) _Compiler_Show_WordList ( "\nCfrTil_C_Infix_Equal0p : before interpret until ',' or ';' :", 0 ) ) ;
    d0 ( if ( Is_DebugOn ) CfrTil_Using ( ) ) ;
    token = _Interpret_C_Until_EitherToken ( interp, ( byte* ) ";", ( byte* ) ",", ( byte* ) ")", ( byte* ) " \n\r\t" ) ;
    d0 ( if ( Is_DebugModeOn ) _Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : after interpret until ';' :", 0 ) ) ;
    if ( lhsWord )
    {
        int64 svState = cntx->State ;
        SetState ( cntx, C_SYNTAX | INFIX_MODE, false ) ; // we don't want to just set compiler->LHS_Word
        _Interpreter_DoWord_Default ( interp, lhsWord, lhsWord->W_SC_WordIndex ) ;
        cntx->State = svState ;
        word0 = _CfrTil_->StoreWord ;
    }
    else
    {
        word0 = _CfrTil_->PokeWord ;
    }
    d0 ( if ( Is_DebugModeOn ) _Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : before op word", 0 ) ) ;
    if ( opWord ) rword = opWord ;
    else rword = word0 ; //_Interpreter_DoWord_Default ( interp, opWord ) ;
    rword->W_TokenStart_ReadLineIndex = tsrli ;
    rword->W_SC_WordIndex = svscwi ;
    svName = rword->Name ;
    rword->Name = "=" ;
    _Interpreter_DoWord_Default ( interp, rword, svscwi ) ;
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
    d0 ( if ( Is_DebugModeOn ) _Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : just before return", 0 ) ) ;
    //if ( ! GetState ( cntx, C_SYNTAX ) ) 
    _CfrTil_PushToken_OnTokenList ( token ) ; // so the callee can check use or use
}

void
CfrTil_SetInNamespaceFromBackground ( )
{
    Context * cntx = _Context_ ;
    if ( cntx->Compiler0->C_FunctionBackgroundNamespace ) _CfrTil_Namespace_InNamespaceSet ( cntx->Compiler0->C_FunctionBackgroundNamespace ) ;
    else
        if ( cntx->Compiler0->C_BackgroundNamespace ) _CfrTil_Namespace_InNamespaceSet ( cntx->Compiler0->C_BackgroundNamespace ) ;
}

