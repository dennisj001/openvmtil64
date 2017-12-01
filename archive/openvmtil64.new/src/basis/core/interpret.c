
#include "../../include/cfrtil64.h"

Word *
Interpreter_InterpretAToken ( Interpreter * interp, byte * token, int64 tokenStartReadLineIndex )
{
    Word * word = 0 ;
    if ( token )
    {
        word = _Interpreter_TokenToWord ( interp, token ) ;
        _Interpreter_DoWord ( interp, word, tokenStartReadLineIndex ) ;
    }
    else SetState ( _Context_->Lexer0, LEXER_END_OF_LINE, true ) ;
    return word ;
}

void
Interpreter_InterpretNextToken ( Interpreter * interp )
{
    byte * token = Lexer_ReadToken ( interp->Lexer0 ) ;
    Interpreter_InterpretAToken ( interp, token, - 1 ) ;
}

Word *
_Interpreter_DoWord_Default ( Interpreter * interp, Word * word )
{
    word = Compiler_CopyDuplicatesAndPush ( word ) ;
    interp->w_Word = word ;
    Word_Eval ( word ) ;
    if ( IS_MORPHISM_TYPE ( word ) )
        SetState ( _Context_, ADDRESS_OF_MODE, false ) ;
    return word ; //let callee know about actual word evaled here after Compiler_CopyDuplicatesAndPush
}

// four types of words related to syntax
// 1. regular rpn - reverse polish notation
// 2. regular polish, prefix notation where the function precedes the arguments - lisp
// 3. infix which takes one following 'arg' and then becomes regular rpn
// 4. C arg lists which are left to right but are evaluated right to left, ie. to righmost operand goes on the stack first and so on such that topmost is the left operand
// we just rearrange the functions and args such that they all become regular rpn - forth like

void
_Interpreter_DoWord ( Interpreter * interp, Word * word, int64 tokenStartReadLineIndex )
{
    if ( word )
    {
        Context * cntx = _Context_ ;
        word->W_TokenStart_ReadLineIndex = ( tokenStartReadLineIndex <= 0 ) ? _Lexer_->TokenStart_ReadLineIndex : tokenStartReadLineIndex ;
        word->W_SC_ScratchPadIndex = _CfrTil_->SC_ScratchPadIndex ;
        //DEBUG_SETUP ( word ) ;
        interp->w_Word = word ;
        if ( ( word->WAttribute == WT_INFIXABLE ) && ( GetState ( cntx, INFIX_MODE ) ) ) // nb. Interpreter must be in INFIX_MODE because it is effective for more than one word
        {
            DEBUG_SETUP ( word ) ;
            Finder_SetNamedQualifyingNamespace ( cntx->Finder0, ( byte* ) "Infix" ) ;
            Interpreter_InterpretNextToken ( interp ) ;
            // then continue and interpret this 'word' - just one out of lexical order
            _Interpreter_DoWord_Default ( interp, word ) ;
        }
        else if ( ( word->WAttribute == WT_PREFIX ) || _Interpreter_IsWordPrefixing ( interp, word ) ) // with this almost any rpn function can be used prefix with a following '(' :: this checks for that condition
        {
            DEBUG_SETUP ( word ) ;
            SetState ( cntx->Compiler0, DOING_A_PREFIX_WORD, true ) ;
            _Interpret_PrefixFunction_Until_RParen ( interp, word ) ;
            SetState ( cntx->Compiler0, DOING_A_PREFIX_WORD, false ) ;
        }
        else if ( word->WAttribute == WT_C_PREFIX_RTL_ARGS )
        {
            DEBUG_SETUP ( word ) ;
            LC_CompileRun_C_ArgList ( word ) ;
        }
        else _Interpreter_DoWord_Default ( interp, word ) ; //  case WT_POSTFIX: case WT_INFIXABLE: // cf. also _Interpreter_SetupFor_MorphismWord
        if ( ! ( word->CAttribute & DEBUG_WORD ) ) interp->LastWord = word ;
        //DEBUG_SHOW ;
    }
}

// interpret with find after parse for known objects
// !! this version eliminates the possiblity of numbers being used as words !!
// objects and morphismsm - terms from category theory

Word *
_Interpreter_NewWord ( Interpreter * interp, byte * token )
{
    if ( token )
    {
        Word * word = Lexer_ObjectToken_New ( interp->Lexer0, token ) ;
        if ( word )
        {
            if ( ( interp->Lexer0->TokenType & T_RAW_STRING ) && ( GetState ( _Q_, AUTO_VAR ) ) ) // this logic needs to be simplified with Lexer_ObjectToken_New
            {
                if ( Compiling && GetState ( _Context_, C_SYNTAX ) )
                {
                    byte * token2 = Lexer_PeekNextNonDebugTokenWord ( _Lexer_, 1 ) ;
                    if ( ! String_Equal ( token2, "=" ) ) return 0 ; // it was already 'interpreted' by Lexer_ObjectToken_New
                }
            }
            word->W_SC_ScratchPadIndex = _CfrTil_->SC_ScratchPadIndex ;
            return interp->w_Word = word ;
        }
    }
}

Word *
_Interpreter_TokenToWord ( Interpreter * interp, byte * token )
{
    Word * word = 0 ;
    if ( token )
    {
        interp->Token = token ;
        word = Finder_Word_FindUsing ( interp->Finder0, token, 0 ) ;
        if ( ! word )
        {
            word = _Interpreter_NewWord ( interp, token ) ;
        }
    }
    return interp->w_Word = word ;
}

Word *
Interpreter_ReadNextTokenToWord ( Interpreter * interp )
{
    Word * word = 0 ;
    byte * token ;
    if ( token = Lexer_ReadToken ( interp->Lexer0 ) )
    {
        word = _Interpreter_TokenToWord ( interp, token ) ;
    }
    else SetState ( _Context_->Lexer0, LEXER_END_OF_LINE, true ) ;
    return word ;
}

Boolean
_Interpreter_IsWordPrefixing ( Interpreter * interp, Word * word )
{
    if ( ( GetState ( _Context_, PREFIX_MODE ) ) && ( ! _Q_->OVT_LC ) ) //_Namespace_IsUsing ( _CfrTil_->LispNamespace ) ) )
    {
        // with this any postfix word that is not a keyword or a c rtl arg word can now be used prefix with parentheses 
        byte c = Lexer_NextNonDelimiterChar ( interp->Lexer0 ) ;
        if ( ( c == '(' ) && ( ! ( word->CAttribute & KEYWORD ) ) && ( ! ( word->WAttribute & WT_C_PREFIX_RTL_ARGS ) ) )
        {
            return true ;
        }
    }
    return false ;
}


#if 0

void
IsIt_C_LeftParen ( Word * word )
{
    if ( String_Equal ( word->Name, "(" ) && String_Equal ( word->S_ContainingNamespace->Name, "C" ) )
    {
        _Printf ( "\nCompiler_CopyDuplicatesAndPush : \'%s.%s\' : %s\n", word->S_ContainingNamespace->Name, word->Name, Context_Location ( ) ) ;
        Pause ( ) ;
    }
}

void
Find_C_LeftParen ( )
{
    Word * word = Finder_FindWord_InOneNamespace ( _Finder_, Namespace_Find ( "C" ), "(" ) ;
    if ( word )
    {
        //if (String_Equal ( word->Name, "(" ) && String_Equal ( word->S_ContainingNamespace->Name, "C" ) )
        {
            //_Printf ( "\nFind_C_LeftParen : \'%s.%s\' : %s\n", word->S_ContainingNamespace->Name, word->Name, Context_Location ( ) ) ;
            //Pause ( ) ;
        }
    }
    else
    {
        _Printf ( "\nFind_C_LeftParen : can't find it at : %s\n", Context_Location ( ) ) ;
        Pause ( ) ;
    }
}
#endif

Word *
_Compiler_CopyDuplicatesAndPush ( Compiler * compiler, Word * word )
{
    Word *wordi, * word0 ;
    int64 i, depth, wrli = word->W_TokenStart_ReadLineIndex ; //, scwi = word->W_SC_WordIndex ;
    //byte *coding = word->Coding ;
    dllist * list = compiler->WordList ;
    // we sometimes refer to more than one field of the same object, eg. 'this' in a block
    // each reference may be to a different labeled field each with a different offset so we must 
    // create copies of the multiply referenced word to hold the referenced offsets for the optInfo
    // 'word' is the 'baseObject' word. If it is already on the Object word Stack certain optimizations can be made.
    // we also need to prevent a null StackPushRegisterCode for operator words used more than once in an optimization
    depth = List_Depth ( list ) ;
    word0 = word ; // we always push and return word1
    word0->W_OriginalWord = word0 ;
    word0->S_CAttribute &= ( ~ RECYCLABLE_COPY ) ;

    for ( i = 0 ; i < depth ; i ++ )
    {
        wordi = ( Word* ) ( Compiler_WordList ( i ) ) ;
        if ( word == wordi )
        {
            word0 = Word_Copy ( word, DICTIONARY ) ; //COMPILER_TEMP ) ; //WORD_COPY_MEM ) ; // especially for "this" so we can use a different Code & AccumulatedOffsetPointer not the existing 
            word0->W_OriginalWord = Word_GetOriginalWord ( word ) ;
            _dlnode_Init ( ( dlnode * ) word0 ) ; // necessary!
            word0->S_CAttribute |= ( uint64 ) RECYCLABLE_COPY ;
            word0->W_TokenStart_ReadLineIndex = wrli ;
            word0->StackPushRegisterCode = 0 ;
            d0 ( IsIt_C_LeftParen ( word ) ) ;
            break ;
        }
    }
    _CfrTil_WordList_PushWord ( word0 ) ;
    d0 ( Word * sqWord = _CfrTil_WordList_TopWord ( ) ) ;
    d0 ( _Printf ( ( byte* ) "\n_Compiler_CopyDuplicatesAndPush : %s", sqWord->Name ) ) ;

    return word0 ;
}
