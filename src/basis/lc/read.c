#include "../../include/cfrtil64.h"
const void * undefined_1 = ( void * ) - 1 ;
const void * undefined_2 = ( void * ) - 2 ;

//===================================================================================================================
//| _LO_Read 
//===================================================================================================================

ListObject *
_LO_Read_DoWord ( LambdaCalculus * lc, Word * word, int64 qidFlag, int64 scwi )
{
    Context *cntx = _Context_ ;
    Lexer *lexer = cntx->Lexer0 ;
    ListObject *l0 = 0 ;
    byte *token1 ;
    word->W_RL_Index = lexer->TokenStart_ReadLineIndex ;
    DEBUG_SETUP ( word ) ;
    if ( qidFlag ) SetState ( word, QID, true ) ;
    else SetState ( word, QID, false ) ;
    if ( ( word->LAttribute & ( T_LISP_READ_MACRO | T_LISP_IMMEDIATE ) ) && ( ! GetState ( _LC_, LC_READ_MACRO_OFF ) ) )
    {
        Word_Eval ( word ) ;
        if ( word->LAttribute & T_LISP_SPECIAL )
        {
            l0 = _DataObject_New ( T_LC_NEW, word, 0, word->CAttribute, word->CAttribute2,
                T_LISP_SYMBOL | word->LAttribute, 0, word->Lo_Value, 0, - 1, scwi ) ;
        }
    }
    else if ( word->LAttribute & T_LISP_TERMINATING_MACRO )
    {
        SetState ( lc, ( LC_READ ), false ) ; // let the value be pushed in this case because we need to pop it below
        Word_Eval ( word ) ;
        token1 = ( byte * ) DataStack_Pop ( ) ;
        SetState ( lc, ( LC_READ ), true ) ;
        l0 = _DataObject_New ( T_LC_LITERAL, 0, token1, LITERAL, word->CAttribute2, word->LAttribute, 0, 0, 0, - 1, scwi ) ;
    }
    else
    {
        if ( word->CAttribute & NAMESPACE_TYPE ) _DataObject_Run ( word ) ;
        l0 = _DataObject_New ( T_LC_NEW, word, 0, word->CAttribute, word->CAttribute2,
            ( T_LISP_SYMBOL | word->LAttribute ), 0, word->Lo_Value, 0, - 1, scwi ) ;
    }
    return l0 ;
}

ListObject *
_LO_Read_DoToken ( LambdaCalculus * lc, byte * token, int64 qidFlag, int64 scwi )
{
    Context *cntx = _Context_ ;
    Lexer *lexer = cntx->Lexer0 ;
    ListObject *l0 ;
    Word *word ;
    if ( qidFlag ) SetState ( cntx->Finder0, QID, true ) ;
    word = LC_FindWord ( token, 0 ) ;
    if ( qidFlag ) SetState ( cntx->Finder0, QID, false ) ;
    if ( word ) l0 = _LO_Read_DoWord ( lc, word, qidFlag, scwi ) ;
    else
    {
        Lexer_ParseObject ( lexer, token ) ;
        l0 = _DataObject_New ( T_LC_LITERAL, 0, token, 0, 0, 0, qidFlag, 0, 0, - 1, scwi ) ;
    }
    return l0 ;
}

ListObject *
LO_Read_DoToken ( LambdaCalculus * lc, byte * token, int64 qidFlag, int64 scwi )
{
    ListObject *l0 = 0 ;
    d1 ( if ( Is_DebugOn ) _Printf ( ( byte * ) "\n_LO_Read : \'%s\' scwi = %d", token, scwi ) ) ;
    if ( String_Equal ( ( char * ) token, ( byte * ) "/*" ) ) CfrTil_ParenthesisComment ( ) ;
    else if ( String_Equal ( ( char * ) token, ( byte * ) "//" ) ) CfrTil_CommentToEndOfLine ( ) ;
    else if ( String_Equal ( ( char * ) token, ( byte * ) "(" ) ) l0 = _LO_Read_DoLParen ( lc ) ;
    else if ( String_Equal ( ( char * ) token, ( byte * ) ")" ) )
    {
        lc->ParenLevel -- ;
        return ( ListObject * ) undefined_1 ; // break ;
    }
    else
    {
        l0 = _LO_Read_DoToken ( lc, token, qidFlag, scwi ) ;
    }
    return l0 ;
}

ListObject *
LO_Read_DoSplice ( LambdaCalculus * lc, ListObject * l0, ListObject * lnew )
{
    l0 = LO_Eval ( lc, LO_CopyTemp ( l0 ) ) ;
    if ( lnew )
    {
        LO_SpliceAtTail ( lnew, l0 ) ;
        l0 = 0 ;
    }
    return l0 ;
}

ListObject *
_LO_Read_DoLParen ( LambdaCalculus *lc )
{
    ListObject *l0 ; 
    Stack_Push ( lc->QuoteStateStack, lc->QuoteState ) ;
    lc->QuoteState = lc->ItemQuoteState ;
    lc->ParenLevel ++ ;
    l0 = _LO_Read ( lc ) ;
    SetState ( lc, LC_READ, true ) ;
    lc->QuoteState = Stack_Pop ( lc->QuoteStateStack ) ;
    return l0 ;
}

ListObject *
_LO_Read ( LambdaCalculus * lc )
{
    Context * cntx = _Context_ ;
    Lexer * lexer = cntx->Lexer0 ;
    ListObject *l0, *lnew ;
    byte * token ;
    int64 scwi ;
    if ( lc->ParenLevel ) // if ParenLevel == 0 we let LParen set up the list
    {
        l0 = LO_New ( LIST, 0 ) ;
        lnew = LO_New ( LIST_NODE, l0 ) ; //l0 ) ;
    }
    else lnew = 0 ; //LO_New ( LIST_NODE, 0 ) ; //l0 ) ; //0 ;
    if ( lnew ) lnew->State |= ( _LC_->ItemQuoteState | _LC_->QuoteState ) ;
    SetState ( lc, LC_READ, true ) ;
    d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 2, 0, ( byte* ) "\nEntering _LO_Read..." ) ) ;
    do
    {
next:
        token = _Lexer_ReadToken ( lexer, ( byte* ) " ,\n\r\t" ) ;
        scwi = lexer->SC_Index ;
        if ( Lexer_IsTokenQualifiedID ( lexer ) ) SetState ( cntx, CONTEXT_PARSING_QID, true ) ;
        else SetState ( cntx, CONTEXT_PARSING_QID, false ) ;
        int64 qidFlag = GetState ( cntx, CONTEXT_PARSING_QID ) ;
        if ( token )
        {
            l0 = LO_Read_DoToken ( lc, token, qidFlag, scwi ) ;
            if ( ( l0 == ( ListObject * ) - 1 ) ) break ;
            if ( ! l0 ) goto next ;
            l0->W_SC_Index = scwi ;
            if ( qidFlag ) SetState ( l0, QID, true ) ;
            l0->State |= ( _LC_->ItemQuoteState | _LC_->QuoteState ) ;
            if ( ( l0->State & SPLICE ) || ( ( l0->State & UNQUOTE_SPLICE ) && ( ! ( l0->State & QUOTED ) ) ) )
            {
                l0 = LO_Read_DoSplice ( lc, l0, lnew ) ;
                if ( l0 )
                {
                    lnew = l0 ;
                    break ;
                }
            }
            else if ( lnew )
            {
                LO_AddToTail ( lnew, l0 ) ;
            }
            else
            {
                lnew = l0 ;
                break ;
            }
        }
        else _SyntaxError ( "\n_LO_Read : Syntax error : no token?\n", QUIT ) ;
        _LC_->ItemQuoteState = 0 ;
    }
    while ( lc->ParenLevel ) ;
    SetState ( lc, LC_READ, false ) ;
    SetState ( cntx->Finder0, QID, false ) ;
    if ( ( ! lc->ParenLevel ) && ( ! GetState ( _Compiler_, LC_ARG_PARSING ) ) ) LC_FinishSourceCode ( ) ;
    return lnew ;
}
// remember a Word is a ListObject 

void
LC_QuoteQuasiQuoteRepl ( uint64 state, Boolean doReplFlag )
{
    Boolean replFlag = false ;
    LambdaCalculus * lc = _LC_ ;
    if ( ! lc ) 
    {
        replFlag = true ;
        lc = LC_New ( ) ;
    }
    lc->ItemQuoteState |= state ;
    if ( replFlag && doReplFlag )
    {
        byte nextChar = ReadLine_PeekNextNonWhitespaceChar ( _ReadLiner_ ) ;
        if ( ( nextChar == '(' ) ) LC_ReadEvalPrint ( ) ;
    }
}

void
LO_Quote ( )
{
    LC_QuoteQuasiQuoteRepl ( QUOTED, 1 ) ;
}

void
LO_QuasiQuote ( )
{
    LC_QuoteQuasiQuoteRepl ( QUASIQUOTED, 1 ) ;
}

void
LO_UnQuoteSplicing ( )
{
    //_LC_->ItemQuoteState |= UNQUOTE_SPLICE ;
    LC_QuoteQuasiQuoteRepl ( UNQUOTE_SPLICE, 1 ) ;
}

void
LO_Splice ( )
{
    //_LC_->ItemQuoteState |= SPLICE ;
    LC_QuoteQuasiQuoteRepl ( SPLICE, 1 ) ;
}

void
LO_UnQuote ( )
{
    //_LC_->ItemQuoteState |= UNQUOTED ;
    LC_QuoteQuasiQuoteRepl ( UNQUOTED, 1 ) ;
}

void
LO_SpliceAtTail ( ListObject * lnew, ListObject * l0 )
{
    if ( lnew )
    {
        for ( l0 = _LO_First ( l0 ) ; l0 ; l0 = _LO_Next ( l0 ) )
        {
            LO_AddToTail ( lnew, LO_CopyOne ( l0 ) ) ;
        }
    }
}



