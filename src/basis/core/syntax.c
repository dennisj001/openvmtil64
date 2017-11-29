
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
_Interpret_Do_CombinatorLeftParen ( )
{
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    int64 svcm = GetState ( compiler, COMPILE_MODE ), svclps = GetState ( compiler, C_COMBINATOR_LPAREN ) ;
    int64 blocksParsed = 0, semiFlag = 0 ;
    byte * token ;

    //if ( ! GetState ( _Compiler_, C_COMBINATOR_PARSING ) ) 
    SetState ( compiler, C_COMBINATOR_LPAREN, true ) ;
    SetState ( compiler, PREFIX_PARSING, true ) ;
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
            //CfrTil_ClearTokenList ( ) ;
            blocksParsed ++ ;
            break ;
        }
        else if ( String_Equal ( token, "{" ) )
        {
            List_InterpretLists ( _Compiler_->PostfixLists ) ;
            CfrTil_EndBlock ( ) ;
            CfrTil_BeginBlock ( ) ;
            //SetState ( compiler, C_BLOCK_PARSING, true ) ;
            blocksParsed ++ ;
            break ;
        }
        Interpreter_InterpretAToken ( cntx->Interpreter0, token, - 1 ) ;
        if ( ( blocksParsed == 0 ) && ( cntx->CurrentlyRunningWord->CAttribute & LITERAL ) && ( ! Is_LValue ( cntx->Interpreter0->w_Word ) ) ) //GetState ( cntx, C_LHS ) )
        {
            // setup for optimization if this literal constant is the loop conditional
            BlockInfo * bi = ( BlockInfo* ) _Stack_Top ( compiler->BlockStack ) ;
            bi->LiteralWord = cntx->CurrentlyRunningWord ;
        }
    }
    //List_InterpretLists ( compiler->PostfixLists ) ;
    SetState ( compiler, COMPILE_MODE, svcm ) ;
    SetState ( compiler, C_COMBINATOR_LPAREN, svclps ) ;
    //SetState ( compiler, PREFIX_ARG_PARSING, false ) ;
    SetState ( compiler, PREFIX_PARSING, false ) ;

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
CfrTil_InterpretNBlocks ( int64 blocks, int64 takesLParenAsBlockFlag )
{
    Context * cntx = _Context_ ;
    Interpreter * interp = cntx->Interpreter0 ;
    Compiler *compiler = cntx->Compiler0 ;
    Word * word ;
    int64 blocksParsed = 0 ;
    byte * token ;
    byte lcbp = 0, lccp = 0 ;
    for ( blocksParsed = 0 ; blocksParsed < blocks ; )
    {
        token = Lexer_ReadToken ( cntx->Lexer0 ) ;

        if ( String_Equal ( ( char* ) token, ";" ) )
        {
            List_InterpretLists ( _Compiler_->PostfixLists ) ;
            if ( lccp && ( ! lcbp ) )
            {
                List_InterpretLists ( _Compiler_->PostfixLists ) ;
                CfrTil_EndBlock ( ) ;
                CfrTil_ClearTokenList ( ) ;
                blocksParsed ++ ;
                lccp = 0 ;
            }
            continue ;
        }
        else if ( String_Equal ( ( char* ) token, "(" ) && takesLParenAsBlockFlag )
        {
            CfrTil_BeginBlock ( ) ;
            int _blocksParsed = _Interpret_Do_CombinatorLeftParen ( ) ;
            List_InterpretLists ( _Compiler_->PostfixLists ) ;
            if ( _blocksParsed )
            {
                CfrTil_BeginBlock ( ) ;
                lccp = 1 ;
                blocksParsed += _blocksParsed ;
            }
            continue ;
        }
        else if ( String_Equal ( ( char* ) token, "{" ) )
        {
            if ( ! lccp ) CfrTil_BeginBlock ( ) ;
            lcbp = 1 ;
            continue ;
        }
        word = Interpreter_InterpretAToken ( interp, token, - 1 ) ;
        if ( word )
        {
            if ( ( word->Definition == ( block ) CfrTil_EndBlock ) || ( word->Definition == CfrTil_End_C_Block ) )
            {
                blocksParsed ++ ;
                lcbp = 0 ;
            }
        }
    }
}

void
_CfrTil_C_Infix_EqualOp ( Word * opWord )
{
    Context * cntx = _Context_ ;
    Interpreter * interp = cntx->Interpreter0 ;
    Compiler *compiler = cntx->Compiler0 ;
    Word * word = Compiler_WordList ( 0 ), *lhsWord = compiler->LHS_Word ;
    int64 scrli = word ? word->W_TokenStart_ReadLineIndex : 0 ; //, svOOState = GetState ( _CfrTil_, OPTIMIZE_ON ) ;
    byte * svName, * token ;
    SetState ( compiler, C_INFIX_EQUAL, true ) ;
    _CfrTil_WordList_PopWords ( 2 ) ;
    d0 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_C_Infix_Equal0p : before interpret until ',' or ';' :" ) ) ;
    //if ( GetState ( compiler, C_COMBINATOR_LPAREN ) ) token = _Interpret_Until_Token ( interp, ( byte* ) ")", 0 ) ;
    token = _Interpret_C_Until_EitherToken ( interp, ( byte* ) ";", ( byte* ) ",", ( byte* ) ")", ( byte* ) " \n\r\t" ) ;
    _CfrTil_AddTokenToHeadOfTokenList ( token ) ; // so the callee can check/use or use
    d0 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : after interpret until ';' :" ) ) ;
    if ( lhsWord )
    {
        if ( opWord )
        {
            _Interpreter_DoWord_Default ( interp, lhsWord ) ;
        }
        else
        {
            _CfrTil_WordList_PushWord ( lhsWord ) ;
            d0 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : after interpret until ';' :" ) ) ;
        }
        word = _CfrTil_->StoreWord ;
    }
    else
    {
        word = _CfrTil_->PokeWord ;
    }
    SetState ( _Debugger_, DEBUG_SHTL_OFF, false ) ; // we're going to temporarily adjust the name
    svName = word->Name ;
    word->Name = "=" ;
    d0 ( if ( Is_DebugModeOn ) Compiler_Show_WordList ( "\nCfrTil_C_Infix_EqualOp : after _CfrTil_WordLists_PushWord ( word ) ;" ) ) ;
    word->W_TokenStart_ReadLineIndex = scrli ;
    if ( opWord ) _Interpreter_DoWord_Default ( interp, opWord ) ;
    else _Interpreter_DoWord_Default ( interp, word ) ;
    word->Name = svName ;
    //_DEBUG_SHOW ( opWord ? opWord : word, 1 ) ;
    //SetState ( _Debugger_, DEBUG_SHTL_OFF, true ) ; // ?? : is this still needed (it was above, before) since we just temporarily adjusted the name
    if ( GetState ( compiler, C_COMBINATOR_LPAREN ) )
    {
        if ( word->StackPushRegisterCode ) SetHere ( word->StackPushRegisterCode ) ; // this is the usual after '=' in non C syntax; assuming optimizeOn
        _BlockInfo_Setup_BI_tttn ( compiler, ZERO_TTT, NZ, 3 ) ; // must set logic flag for Compile_ReConfigureLogicInBlock in Block_Compile_WithLogicFlag
    }
    List_InterpretLists ( compiler->PostfixLists ) ;
    compiler->LHS_Word = 0 ;
    //Interpreter_InterpretAToken ( interp, token, - 1 ) ;

    if ( ! Compiling ) CfrTil_InitSourceCode ( _CfrTil_ ) ;
    SetState ( _Debugger_, DEBUG_SHTL_OFF, false ) ;
    SetState ( compiler, C_INFIX_EQUAL, false ) ;
}

