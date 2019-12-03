#include "../../include/cfrtil64.h"
// lexer.c has been strongly influenced by the ideas in the lisp reader algorithm 
// "http://www.ai.mit.edu/projects/iiip/doc/CommonLISP/HyperSpec/Body/sec_2-2.html"
// although it doesn't fully conform to them yet the intention is to be eventually somewhat of a superset of them
/*
//    !, ", #, $, %, &, ', (, ), *, +, ,, -, ., /, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, :, ;, <, =, >, ?,
// @, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, [, \, ], ^, _,
// `, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, {, |, }, ~,
 */


#define TokenBuffer_AppendPoint( lexer ) &lexer->TokenBuffer [ lexer->TokenWriteIndex ]
#define _AppendCharacterToTokenBuffer( lex, character ) lexer->TokenBuffer [ lex->TokenWriteIndex ] = character
//#define SourceCode_AppendPoint &_CfrTil_->SC_ScratchPad [ Strlen ( ( CString ) _CfrTil_->SC_ScratchPad ) ]

Word *
Lexer_ObjectToken_New ( Lexer * lexer, byte * token, int64 tsrli, int64 scwi ) //, int64 parseFlag )
{
    Word * word = 0 ;
    byte * token2 ;
    if ( token )
    {
        Lexer_ParseObject ( lexer, token ) ;
        if ( lexer->TokenType & T_RAW_STRING )
        {
            Context * cntx = _Context_ ;
            Compiler * compiler = cntx->Compiler0 ;
            if ( GetState ( _Q_, AUTO_VAR ) && ( ! GetState ( compiler, ( DOING_A_PREFIX_WORD | DOING_BEFORE_A_PREFIX_WORD ) ) ) )// make it a 'variable' 
            {
                if ( Compiling && GetState ( cntx, C_SYNTAX ) )
                {
                    //if ( ! _Compiler_->AutoVarTypeNamespace ) 
                    _Namespace_ActivateAsPrimary ( compiler->LocalsNamespace ) ;
                    word = DataObject_New ( LOCAL_VARIABLE, 0, token, LOCAL_VARIABLE, 0, 0, 0, 0, DICTIONARY, tsrli, scwi ) ;
                    token2 = Lexer_Peek_Next_NonDebugTokenWord ( lexer, 1, 0 ) ;
                    if ( ! String_Equal ( token2, "=" ) ) return lexer->TokenWord = 0 ; // don't interpret this word
                }
                else word = DataObject_New ( NAMESPACE_VARIABLE, 0, token, NAMESPACE_VARIABLE, 0, 0, 0, 0, 0, tsrli, scwi ) ;
                word->CAttribute2 |= ( RAW_STRING ) ;
            }
            else
            {
                _Q_->ExceptionToken = token ;
                byte *buffer = Buffer_Data ( _CfrTil_->ScratchB1 ) ;
                sprintf ( ( char* ) buffer, "%s ?\n", ( char* ) token ) ;
                CfrTil_Exception ( NOT_A_KNOWN_OBJECT, buffer, QUIT ) ;
            }
        }
        else word = DataObject_New ( LITERAL, 0, token, lexer->TokenType, 0, 0, 0, lexer->Literal, 0, tsrli, scwi ) ;
        Word_SetTypeNamespace ( word, lexer->TokenType ) ;
        // this ... is done in Word_Create 
        //Lexer_Set_ScIndex_RlIndex ( lexer, word, lexer->TokenStart_ReadLineIndex, lexer->SC_Index ) ;
        lexer->TokenWord = word ;
        DEBUG_SHOW ;
    }
    return word ;
}

void
Lexer_Set_ScIndex_RlIndex ( Lexer * lexer, Word * word, int64 tsrli, int64 scwi )
{
    if ( word )
    {
        word->W_RL_Index = ( tsrli != - 1 ) ? tsrli : lexer->TokenStart_ReadLineIndex ;
        word->W_SC_Index = ( scwi != - 1 ) ? scwi : lexer->SC_Index ;
    }
}

byte *
_Lexer_LexNextToken_WithDelimiters ( Lexer * lexer, byte * delimiters, Boolean checkListFlag, Boolean peekFlag, int reAddPeeked, uint64 state )
{
    ReadLiner * rl = lexer->ReadLiner0 ;
    byte inChar ;
    if ( ( ! checkListFlag ) || ( ! ( lexer->OriginalToken = Lexer_GetTokenNameFromTokenList ( lexer, peekFlag ) ) ) ) // ( ! checkListFlag ) : allows us to peek multiple tokens ahead if we     {
    {
        Lexer_Init ( lexer, delimiters, lexer->State, CONTEXT ) ;
        lexer->State |= state ;
        lexer->SC_Index = _CfrTil_->SC_Index ;
        while ( ( ! Lexer_CheckIfDone ( lexer, LEXER_DONE ) ) )
        {
            inChar = lexer->NextChar ( lexer->ReadLiner0 ) ;
            Lexer_DoChar ( lexer, inChar ) ;
        }
        lexer->CurrentTokenDelimiter = lexer->TokenInputByte ;
        if ( lexer->TokenWriteIndex && ( ! GetState ( lexer, LEXER_RETURN_NULL_TOKEN ) ) )
        {
            _AppendCharacterToTokenBuffer ( lexer, 0 ) ; // null terminate TokenBuffer
            lexer->OriginalToken = String_New ( lexer->TokenBuffer, SESSION ) ; // not TEMPORARY or strings on the stack are deleted at each newline after startup
        }
        else lexer->OriginalToken = ( byte * ) 0 ; // why not goto restartToken ? -- to allow user to hit newline and get response
        lexer->Token_Length = Strlen ( ( char* ) lexer->OriginalToken ) ;
        lexer->TokenEnd_ReadLineIndex = lexer->TokenStart_ReadLineIndex + lexer->Token_Length ;
        lexer->TokenStart_FileIndex = rl->LineStartFileIndex + lexer->TokenStart_ReadLineIndex ; //- lexer->Token_Length ;
        if ( peekFlag && reAddPeeked ) CfrTil_PushToken_OnTokenList ( lexer->OriginalToken ) ;
        lexer->LastLexedChar = inChar ;
    }
    lexer->LastToken = lexer->OriginalToken ;
    return lexer->OriginalToken ;
}

void
Lexer_Init ( Lexer * lexer, byte * delimiters, uint64 state, uint64 allocType )
{
    lexer->TokenBuffer = _CfrTil_->TokenBuffer ;
    Mem_Clear ( lexer->TokenBuffer, BUFFER_SIZE ) ;
    lexer->OriginalToken = 0 ;
    lexer->Literal = 0 ;
    lexer->SC_Index = _CfrTil_->SC_Index ;
    if ( delimiters ) Lexer_SetTokenDelimiters ( lexer, delimiters, allocType ) ;
    else
    {
        //if ( ! _Context_->DefaultDelimiterCharSet ) // ?? 
        Context_SetDefaultTokenDelimiters ( _Context_, ( byte* ) " \n\r\t", CONTEXT ) ;
        lexer->DelimiterCharSet = _Context_->DefaultDelimiterCharSet ;
        lexer->TokenDelimiters = _Context_->DefaultTokenDelimiters ;
    }        
    lexer->State = state & ( ~ LEXER_RETURN_NULL_TOKEN ) ;
    SetState ( lexer, KNOWN_OBJECT | LEXER_DONE | END_OF_FILE | END_OF_STRING | LEXER_END_OF_LINE | LEXER_ALLOW_DOT, false ) ;
    lexer->TokenDelimitersAndDot = ( byte* ) " .\n\r\t" ;
    lexer->DelimiterOrDotCharSet = CharSet_New ( lexer->TokenDelimitersAndDot, allocType ) ;
    lexer->TokenStart_ReadLineIndex = - 1 ;
    lexer->Filename = lexer->ReadLiner0->Filename ;
    lexer->LineNumber = lexer->ReadLiner0->LineNumber ;
    lexer->SC_Index = 0 ;
    Lexer_RestartToken ( lexer ) ;
}

#if 0

byte
Lexer_NextNonDelimiterChar ( Lexer * lexer )
{
    return _String_NextNonDelimiterChar ( _ReadLine_pb_NextChar ( lexer->ReadLiner0 ), lexer->DelimiterCharSet ) ;
}
#else

byte
Lexer_NextNonDelimiterChar ( Lexer * lexer )
{
    //return _String_NextNonDelimiterChar ( &lexer->ReadLiner0->InputLine [lexer->TokenEnd_ReadLineIndex - 1], lexer->DelimiterCharSet ) ;
    //return _String_NextNonDelimiterChar ( &_ReadLiner_->InputLine [lexer->TokenEnd_ReadLineIndex - 1], lexer->DelimiterCharSet ) ;
    return _String_NextNonDelimiterChar ( _ReadLine_pb_NextChar ( lexer->ReadLiner0 ) - 1, lexer->DelimiterCharSet ) ;
}
#endif
//----------------------------------------------------------------------------------------|
//              get from/ add to head  |              | get from head      add to tail    |      
// TokenList Tail <--> TokenList Head  |<interpreter> | PeekList Head <--> PeekList Tail  |
// token token token token token token | currentToken | token token token token token ... |
//----------------------------------------------------------------------------------------|

void
_CfrTil_AddTokenToTailOfTokenList ( byte * token )
{
    if ( token ) dllist_AddNodeToTail ( _Lexer_->TokenList, ( dlnode* ) Lexer_Token_New ( token ) ) ;
    //if ( Is_DebugOn ) Symbol_List_Print ( _CfrTil_->TokenList ) ;
}

void
CfrTil_PushToken_OnTokenList ( byte * token )
{
    if ( token ) dllist_AddNodeToHead ( _Lexer_->TokenList, ( dlnode* ) Lexer_Token_New ( token ) ) ;
    //if ( Is_DebugOn ) Symbol_List_Print ( _CfrTil_->TokenList ) ;
}

#if 0

void
Lexer_ClearTokenList ( Lexer * lexer )
{
    _dllist_Init ( lexer->TokenList ) ;
}
#endif

Symbol *
Lexer_GetTokenFromTokenList ( Lexer * lexer, Boolean peekFlag )
{
    Symbol * tknSym ;
    if ( ! ( peekFlag && ( tknSym = lexer->NextPeekListItem ) ) ) tknSym = ( Symbol* ) _dllist_First ( ( dllist* ) lexer->TokenList ) ;
    if ( tknSym )
    {
        if ( peekFlag ) lexer->NextPeekListItem = ( Symbol* ) dlnode_Next ( ( dlnode * ) tknSym ) ;
        else
        {
            lexer->NextPeekListItem = 0 ;
            dlnode_Remove ( ( dlnode* ) tknSym ) ;
        }
        lexer->TokenStart_ReadLineIndex = tknSym->S_Value ;
        lexer->TokenEnd_ReadLineIndex = tknSym->S_Value2 ;
        lexer->LineNumber = tknSym->S_Value3 ;
        lexer->OriginalToken = tknSym->S_Name ;
        return tknSym ;
    }
    return 0 ;
}

byte *
Lexer_GetTokenNameFromTokenList ( Lexer * lexer, Boolean peekFlag )
{
    Symbol * tknSym = Lexer_GetTokenFromTokenList ( lexer, peekFlag ) ;
    if ( tknSym ) return tknSym->S_Name ;
    return 0 ;
}

Symbol *
Lexer_Token_New ( byte * token )
{
    Symbol * tknSym = _Symbol_New ( token, SESSION ) ;
    tknSym->S_Value = _Context_->Lexer0->TokenStart_ReadLineIndex ;
    tknSym->S_Value2 = _Context_->Lexer0->TokenEnd_ReadLineIndex ;
    tknSym->S_Value3 = _Context_->Lexer0->LineNumber ;
    return tknSym ;
}

int64
_Lexer_ConsiderDebugAndCommentTokens ( byte * token, int64 evalFlag )
{
    Word * word = Finder_Word_FindUsing ( _Finder_, token, 1 ) ;
    int64 tsrli = - 1, scwi = - 1 ;
    Word_SetTsrliScwi ( word, tsrli, scwi ) ;
    if ( word && ( word->LAttribute & W_COMMENT ) )
    {
        Word_Eval ( word ) ;
        return true ;
    }
#if 0  // this needs to be re-considered
    else if ( word && ( word->CAttribute & DEBUG_WORD ) )
    {
        if ( evalFlag ) Word_Eval ( word ) ;
        return true ;
    }
#endif    
    return false ;
}

byte *
_Lexer_Next_NonDebugOrCommentTokenWord ( Lexer * lexer, byte * delimiters, Boolean evalFlag, Boolean peekFlag )
{
    byte * token ;
    Boolean debugOrComment ;
    do
    {
        token = _Lexer_LexNextToken_WithDelimiters ( lexer, delimiters, 1, peekFlag, 0, 0 ) ; // ?? the logic here ??
        debugOrComment = _Lexer_ConsiderDebugAndCommentTokens ( token, evalFlag ) ;
    }
    while ( debugOrComment ) ;
    return token ;
}

Boolean
Lexer_IsNextWordLeftParen ( Lexer * lexer )
{
    // with this any postfix word that is not a keyword or a c rtl arg word can now be used prefix with parentheses 
    byte c = Lexer_NextNonDelimiterChar ( lexer ) ;
    if ( ( c == '(' ) ) return true ;
    else return false ;
}

Boolean
Lexer_IsWordPrefixing ( Lexer * lexer, Word * word )
{
    if ( GetState ( _Context_, LC_INTERPRET ) ) return true ;
    else if ( ( GetState ( _Context_, PREFIX_MODE ) ) &&
        ( ! ( word->CAttribute & ( CATEGORY_OP_OPEQUAL | CATEGORY_OP_EQUAL | KEYWORD ) ) ) && ( ! ( word->WAttribute & WT_C_PREFIX_RTL_ARGS ) ) )
    {
        return Lexer_IsNextWordLeftParen ( _Lexer_ ) ;
    }
    return false ;
}

byte *
Lexer_Peek_Next_NonDebugTokenWord ( Lexer * lexer, Boolean evalFlag, Boolean svReadIndexFlag )
{
    ReadLiner * rl = _ReadLiner_ ;
    int64 svReadIndex = rl->ReadIndex ;
    //int64 svInterpState = lexer->OurInterpreter ? lexer->OurInterpreter->State : 0 ;
    byte * token = _Lexer_Next_NonDebugOrCommentTokenWord ( lexer, 0, evalFlag, 0 ) ; // 0 : peekFlag off because we are reAdding it below
    CfrTil_PushToken_OnTokenList ( token ) ; // TODO ; list should instead be a stack
    if ( svReadIndexFlag ) rl->ReadIndex = svReadIndex ;
    //if (lexer->OurInterpreter) lexer->OurInterpreter->State = svInterpState ;
    return token ;
}

void
Lexer_DoChar ( Lexer * lexer, byte c )
{
    lexer->TokenInputByte = c ;
    _Lexer_DoChar ( lexer, c ) ;
    lexer->CurrentReadIndex = lexer->ReadLiner0->ReadIndex ;
}

void
Lexer_DoNextChar ( Lexer * lexer )
{
    Lexer_DoChar ( lexer, lexer->NextChar ( lexer->ReadLiner0 ) ) ;
}

void
Lexer_LexNextToken_WithDelimiters ( Lexer * lexer, byte * delimiters )
{
    _Lexer_LexNextToken_WithDelimiters ( lexer, delimiters, 1, 0, 1, 0 ) ;
}

byte *
_Lexer_ReadToken ( Lexer * lexer, byte * delimiters )
{
    Lexer_LexNextToken_WithDelimiters ( lexer, delimiters ) ;
    return lexer->OriginalToken ;
}

byte *
Lexer_ReadToken ( Lexer * lexer )
{
    _Lexer_ReadToken ( lexer, 0 ) ;
    return lexer->OriginalToken ;
}

void
_Lexer_AppendByteToTokenBuffer ( Lexer * lexer, byte c )
{
    ReadLiner * rl = lexer->ReadLiner0 ;
    if ( lexer->TokenStart_ReadLineIndex == - 1 ) // -1 : Lexer_Init marker
    {
        lexer->TokenStart_ReadLineIndex = rl->ReadIndex - 1 ; // -1 : ReadIndex has already been incremented for the next char so this char is -1
    }
    lexer->TokenBuffer [ lexer->TokenWriteIndex ++ ] = c ;
    lexer->TokenBuffer [ lexer->TokenWriteIndex ] = 0 ;
}

void
Lexer_AppendByteToTokenBuffer ( Lexer * lexer )
{
    _Lexer_AppendByteToTokenBuffer ( lexer, lexer->TokenInputByte ) ;
}

void
Lexer_Append_ConvertedCharacterToTokenBuffer ( Lexer * lexer )
{
    _String_AppendConvertCharToBackSlash ( TokenBuffer_AppendPoint ( lexer ), lexer->TokenInputByte, 0, false ) ;
    _Lexer_AppendCharToSourceCode ( lexer, lexer->TokenInputByte, 0 ) ;
    lexer->TokenWriteIndex ++ ;
}

void
Lexer_AppendCharacterToTokenBuffer ( Lexer * lexer )
{
    Lexer_AppendByteToTokenBuffer ( lexer ) ;
    _Lexer_AppendCharToSourceCode ( lexer, lexer->TokenInputByte, 0 ) ;
}

byte
Lexer_UnAppendCharacterToTokenBuffer ( Lexer * lexer )
{
    return lexer->TokenBuffer [ -- lexer->TokenWriteIndex ] ;
}

byte
Lexer_LastChar ( Lexer * lexer )
{
    return lexer->TokenBuffer [ lexer->TokenWriteIndex - 1 ] ;
}

void
Lexer_SetTokenDelimiters ( Lexer * lexer, byte * delimiters, uint64 allocType )
{
    if ( lexer->DelimiterCharSet ) CharSet_Init ( lexer->DelimiterCharSet, 128, delimiters ) ;
    else lexer->DelimiterCharSet = CharSet_New ( delimiters, allocType ) ;
    lexer->TokenDelimiters = delimiters ;
}

Lexer *
Lexer_New ( uint64 allocType )
{
    Lexer * lexer = ( Lexer * ) Mem_Allocate ( sizeof (Lexer ), allocType ) ;
    lexer->ReadLiner0 = ReadLine_New ( allocType ) ;
    lexer->TokenList = _dllist_New ( allocType ) ;
    Lexer_Init ( lexer, 0, 0, allocType ) ;
    lexer->NextChar = _Lexer_NextChar ;

    return lexer ;
}

void
_Lexer_Copy ( Lexer * lexer, Lexer * lexer0, uint64 allocType )
{
    MemCpy ( lexer, lexer0, sizeof (Lexer ) ) ;
    Lexer_Init ( lexer, 0, 0, allocType ) ;
    ReadLiner * rl = ReadLine_Copy ( lexer0->ReadLiner0, allocType ) ;
    lexer->ReadLiner0 = rl ;
    lexer->NextChar = _Lexer_NextChar ;
}

Lexer *
Lexer_Copy ( Lexer * lexer0, uint64 allocType )
{
    Lexer * lexer = ( Lexer * ) Mem_Allocate ( sizeof (Lexer ), allocType ) ;
    _Lexer_Copy ( lexer, lexer0, allocType ) ;
    return lexer ;
}

void
Lexer_RestartToken ( Lexer * lexer )
{
    lexer->TokenWriteIndex = 0 ;
}

// special case here is quoted Strings - "String literals"
// use lexer->ReadLinePosition = 0 to cause a new Token read
// or lexer->Token_ReadLineIndex = BUFFER_SIZE

void
Lexer_SourceCodeOn ( Lexer * lexer )
{
    SetState ( lexer, ( ADD_TOKEN_TO_SOURCE | ADD_CHAR_TO_SOURCE ), true ) ;
}

void
Lexer_SourceCodeOff ( Lexer * lexer )
{
    SetState ( lexer, ( ADD_TOKEN_TO_SOURCE | ADD_CHAR_TO_SOURCE ), false ) ;
}

void
_Lexer_AppendCharToSourceCode ( Lexer * lexer, byte c, int64 convert )
{
    if ( GetState ( _CfrTil_, SOURCE_CODE_ON ) && GetState ( lexer, ADD_CHAR_TO_SOURCE ) )
    {
        CfrTil_AppendCharToSourceCode ( _CfrTil_, c ) ;
    }
}

void
Lexer_DoDelimiter ( Lexer * lexer )
{
    _Lexer_AppendCharToSourceCode ( lexer, lexer->TokenInputByte, 0 ) ;
    // must have at least one non-delimiter to make a token
    // else keep going we just have multiple delimiters ( maybe just spaces ) in a row
    if ( lexer->TokenWriteIndex )
    {
        SetState ( lexer, LEXER_DONE, true ) ;
        return ;
    }
    else
    {
        Lexer_RestartToken ( lexer ) ; //prevent null token which complicates lexers
        return ;
    }
}

Boolean
Lexer_IsCurrentInputCharADelimiter ( Lexer * lexer )
{

    return ( Boolean ) _Lexer_IsCharDelimiter ( lexer, lexer->TokenInputByte ) ;
}

void
Lexer_Default ( Lexer * lexer )
{
    if ( Lexer_IsCurrentInputCharADelimiter ( lexer ) ) //_IsChar_Delimiter ( lexer->TokenDelimiters, lexer->TokenInputCharacter ) )
    {
        _Lexer_AppendCharToSourceCode ( lexer, lexer->TokenInputByte, 0 ) ;
        // must have at least one non-delimiter to make a token
        // else keep going we just have multiple delimiters ( maybe just spaces ) in a row
        if ( lexer->TokenWriteIndex )
        {
            SetState ( lexer, LEXER_DONE, true ) ;
            return ;
        }
        else
        {
            lexer->CurrentReadIndex ++ ;
            Lexer_RestartToken ( lexer ) ; //prevent null token which complicates lexers
            return ;
        }
    }
    Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
}

void
Lexer_MakeItTheNextToken ( Lexer * lexer )
{
    ReadLine_UnGetChar ( lexer->ReadLiner0 ) ; // allow to read '.' as next token
    //_CfrTil_UnAppendFromSourceCode ( 1 ) ;
    SetState ( lexer, LEXER_DONE, true ) ;
}

void
TerminatingMacro ( Lexer * lexer )
{
#if 0
    if ( Lexer_LastChar ( lexer ) == 't' )
    {
        Lexer_Default ( lexer ) ;
        Lexer_FinishTokenHere ( lexer ) ;
        return ;
    }
    if ( ( ReadLine_PeekNextChar ( lexer->ReadLiner0 ) == 't' ) && ( lexer->TokenInputByte == ')' ) )
    {
        Lexer_Default ( lexer ) ;
        return ;
    }
#endif    
    if ( ( ! lexer->TokenWriteIndex ) || ( Lexer_LastChar ( lexer ) == '_' ) ) Lexer_Default ( lexer ) ; // allow for "_(" token 
    else ReadLine_UnGetChar ( lexer->ReadLiner0 ) ; // so NextChar will have this TokenInputCharacter for the next token
    Lexer_FinishTokenHere ( lexer ) ; // after appending the terminating macro char
    return ;
}

void
NonTerminatingMacro ( Lexer * lexer )
{
    ReadLiner * rl = lexer->ReadLiner0 ;
    Lexer_Default ( lexer ) ;
    if ( lexer->TokenWriteIndex == 1 )
    {
        byte chr = ReadLine_PeekNextChar ( rl ) ;
        if ( ( chr == 'd' ) && ( _ReadLine_PeekOffsetChar ( rl, 1 ) == 'e' ) ) Lexer_FinishTokenHere ( lexer ) ;
        else if ( chr == '$' )
        {
            do
            {
                _ReadLine_GetNextChar ( rl ) ;
                Lexer_Default ( lexer ) ;
                chr = ReadLine_PeekNextChar ( rl ) ; //_ReadLine_PeekIndexedChar ( rl, 1 ) ;
            }
            while ( chr == '$' ) ;
            Lexer_FinishTokenHere ( lexer ) ;
        }
        else if ( ( chr != 'x' ) && ( chr != 'X' ) && ( chr != 'b' ) && ( chr != 'o' ) && ( chr != 'd' ) ) Lexer_FinishTokenHere ( lexer ) ; // x/X : check for hexidecimal marker
        return ;
    }
}

int64
_Lexer_MacroChar_NamespaceCheck ( Lexer * lexer, byte * nameSpace )
{
    byte buffer [2] ;
    buffer [0] = lexer->TokenInputByte ;
    buffer [1] = 0 ;

    return _CfrTil_IsContainingNamespace ( buffer, nameSpace ) ;
}

void
Lexer_FinishTokenHere ( Lexer * lexer )
{
    _AppendCharacterToTokenBuffer ( lexer, 0 ) ;
    SetState ( lexer, LEXER_DONE, true ) ;
    return ;
}

void
SingleEscape ( Lexer * lexer )
{
    lexer->TokenInputByte = ReadLine_NextChar ( lexer->ReadLiner0 ) ;
    Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
}

void
_BackSlash ( Lexer * lexer, int64 flag )
{
    ReadLiner * rl = lexer->ReadLiner0 ;
    byte nextChar = ReadLine_PeekNextChar ( rl ), lastChar = rl->InputLine [ rl->ReadIndex - 2 ] ;
    int64 i ;
    if ( nextChar == 'n' )
    {
        _ReadLine_GetNextChar ( lexer->ReadLiner0 ) ;
        lexer->TokenInputByte = '\n' ;
        Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
    }
    else if ( nextChar == 'r' )
    {
        _ReadLine_GetNextChar ( lexer->ReadLiner0 ) ;
        lexer->TokenInputByte = '\r' ;
        Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
    }
    else if ( nextChar == 't' )
    {
        _ReadLine_GetNextChar ( lexer->ReadLiner0 ) ;
        lexer->TokenInputByte = '\t' ;
        Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
    }
    else if ( lastChar == '/' ) // current lisp lambda abbreviation "/\"
    {
        Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
    }
    else if ( nextChar == ' ' && GetState ( _Context_->Interpreter0, PREPROCESSOR_DEFINE ) )
    {
        i = ReadLiner_PeekSkipSpaces ( rl ) ;
        if ( _ReadLine_PeekOffsetChar ( rl, i ) == '\n' ) ; // do nothing - don't append the newline 
    }
    else if ( nextChar == '\n' && GetState ( _Context_->Interpreter0, PREPROCESSOR_DEFINE ) ) _ReadLine_GetNextChar ( lexer->ReadLiner0 ) ; // ignore the newline
    else if ( flag )
    {
        //Lexer_AppendCharacterToTokenBuffer ( lexer ) ; // the backslash
        _Lexer_AppendCharToSourceCode ( lexer, lexer->TokenInputByte, 0 ) ; // the backslash 
        _Lexer_AppendByteToTokenBuffer ( lexer, nextChar ) ; // the escaped char eg. '"'
        _Lexer_AppendCharToSourceCode ( lexer, nextChar, 0 ) ;
        _ReadLine_GetNextChar ( lexer->ReadLiner0 ) ;
    }
    else if ( ! flag ) SingleEscape ( lexer ) ; //Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
}

void
BackSlash ( Lexer * lexer )
{
    _BackSlash ( lexer, 1 ) ;
}

void
_MultipleEscape ( Lexer * lexer )
{
    byte multipleEscapeChar = lexer->TokenInputByte ;
    while ( 1 )
    {
        lexer->TokenInputByte = ReadLine_NextChar ( lexer->ReadLiner0 ) ;

        if ( lexer->TokenInputByte == multipleEscapeChar ) break ;
        Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
    }
    SetState ( lexer, LEXER_DONE, true ) ;
}

// '"'

void
DoubleQuote ( Lexer * lexer )
{

    TerminatingMacro ( lexer ) ;
}


// '->' for pointers within a string and without surrounding spaces 

void
Minus ( Lexer * lexer ) // '-':
{
    byte nextChar ;
    if ( lexer->TokenWriteIndex )
    {
        nextChar = ReadLine_PeekNextChar ( lexer->ReadLiner0 ) ;
        if ( ( nextChar == '-' ) || ( nextChar == '>' ) )
        {
            ReadLine_UnGetChar ( lexer->ReadLiner0 ) ; // allow to read '--' as next token
            SetState ( lexer, LEXER_DONE, true ) ;

            return ;
        }
    }
    Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
}

void
Plus ( Lexer * lexer ) // '+':
{
    byte nextChar ;
    if ( lexer->TokenWriteIndex )
    {
        nextChar = ReadLine_PeekNextChar ( lexer->ReadLiner0 ) ;
        if ( nextChar == '+' ) 
        {
            ReadLine_UnGetChar ( lexer->ReadLiner0 ) ; // allow to read '++' as next token
            SetState ( lexer, LEXER_DONE, true ) ;

            return ;
        }
    }
    Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
}

void
ForwardSlash ( Lexer * lexer ) // '/':
{
    Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
    byte nextChar = ReadLine_PeekNextChar ( lexer->ReadLiner0 ) ;
    if ( ( nextChar == '/' ) || ( nextChar == '*' ) )
    {

        lexer->TokenInputByte = ReadLine_NextChar ( lexer->ReadLiner0 ) ;
        Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
        SetState ( lexer, LEXER_DONE, true ) ;
    }
}

void
Star ( Lexer * lexer ) // '*':
{
    byte nextChar = ReadLine_PeekNextChar ( lexer->ReadLiner0 ) ;
    if ( ( nextChar == '/' ) )
    {
        if ( ! lexer->TokenWriteIndex )
        {
            Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
            lexer->TokenInputByte = ReadLine_NextChar ( lexer->ReadLiner0 ) ;
            Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
            SetState ( lexer, LEXER_DONE, true ) ;
        }
        else
        {
            ReadLine_UnGetChar ( lexer->ReadLiner0 ) ;
            SetState ( lexer, LEXER_DONE, true ) ;
        }
    }
    else
    {

        Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
    }
}

void
AddressOf ( Lexer * lexer ) // ';':
{
    //if ( GetState ( _Context_, C_SYNTAX ) && ( ReadLine_PeekNextChar ( lexer->ReadLiner ) != '&' ) ) TerminatingMacro ( lexer ) ;
    //if ( ( CharTable_IsCharType ( ReadLine_PeekNextChar ( lexer->ReadLiner ), CHAR_ALPHA ) && ( ReadLine_LastChar ( lexer->ReadLiner ) != '&' ) ) ) TerminatingMacro ( lexer ) ;
    //if ( GetState ( _Context_, C_SYNTAX ) && 
    if ( CharTable_IsCharType ( ReadLine_PeekNextChar ( lexer->ReadLiner0 ), CHAR_ALPHA ) ) TerminatingMacro ( lexer ) ;
    else Lexer_Default ( lexer ) ;
}

void
AtFetch ( Lexer * lexer ) // ';':
{
    Lexer_Default ( lexer ) ;

    if ( _LC_ && GetState ( _LC_, LC_READ ) ) Lexer_FinishTokenHere ( lexer ) ;
}

void
Semi ( Lexer * lexer ) // ';':
{
    if ( GetState ( _Context_, C_SYNTAX ) && lexer->TokenWriteIndex )
    {
        Lexer_MakeItTheNextToken ( lexer ) ;
        return ;
    }
    else Lexer_Default ( lexer ) ;
}

void
GreaterThan ( Lexer * lexer ) // '>':
{
    if ( lexer->TokenWriteIndex )
    {
        if ( Lexer_LastChar ( lexer ) == '-' )
        {
            Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
            SetState ( lexer, LEXER_DONE, true ) ;

            return ;
        }
    }
    Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
}

// package the dot to be lexed as a token

void
Dot ( Lexer * lexer ) //  '.':
{
    if ( ( Lexer_LastChar ( lexer ) != '/' ) && ( ! GetState ( lexer, LEXER_ALLOW_DOT ) ) ) //allow for lisp special char sequence "/." as a substitution for lambda
    {
        int64 i ;
        if ( ( ! GetState ( lexer, PARSING_STRING ) ) ) //&& ( ! GetState ( _Context_, CONTEXT_PARSING_QUALIFIED_ID ) ) ) // if we are not parsing a String ?
        {
            if ( lexer->TokenWriteIndex )
            {
                for ( i = lexer->TokenWriteIndex - 1 ; i >= 0 ; i -- ) // go back into previous chars read, check if it is a number
                {
                    if ( ! isdigit ( lexer->TokenBuffer [ i ] ) )
                    {
                        ReadLine_UnGetChar ( lexer->ReadLiner0 ) ; // allow to read '.' as next token
                        break ;
                    }
                }
            }
            else if ( ! isdigit ( ReadLine_PeekNextChar ( lexer->ReadLiner0 ) ) ) Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
            SetState ( lexer, LEXER_DONE, true ) ;
            return ;
        }
    }
    Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
}

void
Comma ( Lexer * lexer )
{
    if ( GetState ( _Context_, C_SYNTAX | INFIX_MODE ) && lexer->TokenWriteIndex )
    {
        Lexer_MakeItTheNextToken ( lexer ) ;
        return ;
    }
    else if ( ! GetState ( _Context_->Compiler0, LC_ARG_PARSING ) )
    {
        if ( _Lexer_MacroChar_NamespaceCheck ( lexer, ( byte* ) "Lisp" ) )
        {
            if ( _LC_ )
            {
                byte nextChar = ReadLine_PeekNextNonWhitespaceChar ( lexer->ReadLiner0 ) ;
                if ( nextChar == '@' )
                {
                    Lexer_AppendCharacterToTokenBuffer ( lexer ) ; // the comma
                    byte chr = _ReadLine_GetNextChar ( lexer->ReadLiner0 ) ; // the '@'
                    lexer->TokenInputByte = chr ;
                }
                Lexer_AppendCharacterToTokenBuffer ( lexer ) ;
                Lexer_FinishTokenHere ( lexer ) ;

                return ;
            }
        }
    }
    Lexer_Default ( lexer ) ;
}

void
CarriageReturn ( Lexer * lexer )
{
    NewLine ( lexer ) ;
}

void
NewLine ( Lexer * lexer )
{
    if ( AtCommandLine ( lexer->ReadLiner0 ) ) //( ! IS_INCLUDING_FILES ) || GetState ( _Debugger_, DBG_COMMAND_LINE ) )
    {
        SetState ( lexer, LEXER_DONE | LEXER_END_OF_LINE, true ) ;
    }
    else
    {
        SetState ( lexer, LEXER_END_OF_LINE, true ) ;
        Lexer_Default ( lexer ) ;
    }
}

void
_EOF ( Lexer * lexer ) // case eof:
{
    SetState ( lexer, LEXER_DONE | END_OF_FILE, true ) ;
    //SetState ( _Interpreter_, END_OF_FILE, true ) ;
}

void
_Zero ( Lexer * lexer ) // case 0
{
    SetState ( lexer, LEXER_DONE | END_OF_STRING | END_OF_FILE, true ) ;
    //SetState ( _Interpreter_, END_OF_STRING, true ) ;
}

int64
Lexer_CheckIfDone ( Lexer * lexer, int64 flags )
{
    return lexer->State & flags ;
}

// the non-string lexer char input function

byte
_Lexer_NextChar ( ReadLiner * rl )
{
    return ReadLine_NextChar ( rl ) ;
}

void
Lexer_SetInputFunction ( Lexer * lexer, byte ( *lipf ) ( ReadLiner * ) )
{
    lexer->NextChar = lipf ;
}

void
_Lexer_DoChar ( Lexer * lexer, byte c )
{
    _CfrTil_->LexerCharacterFunctionTable [ _CfrTil_->LexerCharacterTypeTable [ c ].CharInfo ] ( lexer ) ;
}

Boolean
Lexer_IsTokenQualifiedID ( Lexer * lexer )
{
    if ( Lexer_IsTokenReverseDotted ( lexer ) ) return true ;
    else return Lexer_IsTokenForwardDotted ( lexer ) ;
}

void
CfrTil_LexerTables_Setup ( CfrTil * cfrtl )
{
    int64 i ;
    for ( i = 0 ; i < 256 ; i ++ ) cfrtl->LexerCharacterTypeTable [ i ].CharInfo = 0 ;
    cfrtl->LexerCharacterTypeTable [ 0 ].CharFunctionTableIndex = 1 ;
    cfrtl->LexerCharacterTypeTable [ '-' ].CharFunctionTableIndex = 2 ;
    cfrtl->LexerCharacterTypeTable [ '>' ].CharFunctionTableIndex = 3 ;
    cfrtl->LexerCharacterTypeTable [ '.' ].CharFunctionTableIndex = 4 ;
    cfrtl->LexerCharacterTypeTable [ '"' ].CharFunctionTableIndex = 5 ;
    cfrtl->LexerCharacterTypeTable [ '\n' ].CharFunctionTableIndex = 6 ;
    cfrtl->LexerCharacterTypeTable [ '\\' ].CharFunctionTableIndex = 7 ;
    cfrtl->LexerCharacterTypeTable [ eof ].CharFunctionTableIndex = 8 ;
    cfrtl->LexerCharacterTypeTable [ '\r' ].CharFunctionTableIndex = 9 ;
    cfrtl->LexerCharacterTypeTable [ ',' ].CharFunctionTableIndex = 10 ;

    //cfrtl->LexerCharacterTypeTable [ '{' ].CharFunctionTableIndex = 11 ; 
    //cfrtl->LexerCharacterTypeTable [ '}' ].CharFunctionTableIndex = 11 ;
    cfrtl->LexerCharacterTypeTable [ '[' ].CharFunctionTableIndex = 11 ;
    cfrtl->LexerCharacterTypeTable [ ']' ].CharFunctionTableIndex = 11 ;
    cfrtl->LexerCharacterTypeTable [ '`' ].CharFunctionTableIndex = 11 ;
    cfrtl->LexerCharacterTypeTable [ '(' ].CharFunctionTableIndex = 11 ;
    cfrtl->LexerCharacterTypeTable [ ')' ].CharFunctionTableIndex = 11 ;
    cfrtl->LexerCharacterTypeTable [ '\'' ].CharFunctionTableIndex = 11 ;
    //cfrtl->LexerCharacterTypeTable [ '%' ].CharFunctionTableIndex = 11 ;
    //cfrtl->LexerCharacterTypeTable [ '&' ].CharFunctionTableIndex = 11 ;
    //cfrtl->LexerCharacterTypeTable [ ',' ].CharFunctionTableIndex = 11 ;

    cfrtl->LexerCharacterTypeTable [ '$' ].CharFunctionTableIndex = 12 ;
    cfrtl->LexerCharacterTypeTable [ '#' ].CharFunctionTableIndex = 12 ;

    cfrtl->LexerCharacterTypeTable [ '/' ].CharFunctionTableIndex = 14 ;
    cfrtl->LexerCharacterTypeTable [ ';' ].CharFunctionTableIndex = 15 ;
    cfrtl->LexerCharacterTypeTable [ '&' ].CharFunctionTableIndex = 16 ;
    cfrtl->LexerCharacterTypeTable [ '@' ].CharFunctionTableIndex = 17 ;
    cfrtl->LexerCharacterTypeTable [ '*' ].CharFunctionTableIndex = 18 ;
    cfrtl->LexerCharacterTypeTable [ '+' ].CharFunctionTableIndex = 19 ;

    cfrtl->LexerCharacterFunctionTable [ 0 ] = Lexer_Default ;
    cfrtl->LexerCharacterFunctionTable [ 1 ] = _Zero ;
    cfrtl->LexerCharacterFunctionTable [ 2 ] = Minus ;
    cfrtl->LexerCharacterFunctionTable [ 3 ] = GreaterThan ;
    cfrtl->LexerCharacterFunctionTable [ 4 ] = Dot ;
    cfrtl->LexerCharacterFunctionTable [ 5 ] = DoubleQuote ;
    cfrtl->LexerCharacterFunctionTable [ 6 ] = NewLine ;
    cfrtl->LexerCharacterFunctionTable [ 7 ] = BackSlash ;
    cfrtl->LexerCharacterFunctionTable [ 8 ] = _EOF ;
    cfrtl->LexerCharacterFunctionTable [ 9 ] = CarriageReturn ;
    cfrtl->LexerCharacterFunctionTable [ 10 ] = Comma ;

    cfrtl->LexerCharacterFunctionTable [ 11 ] = TerminatingMacro ;
    cfrtl->LexerCharacterFunctionTable [ 12 ] = NonTerminatingMacro ;
    //cfrtl->LexerCharacterFunctionTable [ 13 ] = SingleEscape ;
    cfrtl->LexerCharacterFunctionTable [ 14 ] = ForwardSlash ;
    cfrtl->LexerCharacterFunctionTable [ 15 ] = Semi ;
    cfrtl->LexerCharacterFunctionTable [ 16 ] = AddressOf ;
    cfrtl->LexerCharacterFunctionTable [ 17 ] = AtFetch ;
    cfrtl->LexerCharacterFunctionTable [ 18 ] = Star ;
    cfrtl->LexerCharacterFunctionTable [ 19 ] = Plus ;
}

int64
Lexer_ConvertLineIndexToFileIndex ( Lexer * lexer, int64 index )
{
    return lexer->TokenStart_FileIndex = lexer->ReadLiner0->LineStartFileIndex + index ; //- lexer->Token_Length ;
}

