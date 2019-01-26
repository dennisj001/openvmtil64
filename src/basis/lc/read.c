#include "../../include/cfrtil64.h"

//===================================================================================================================
//| _LO_Read 
//===================================================================================================================

ListObject *
_LO_Read ( LambdaCalculus * lc )
{
    Context * cntx = _Context_ ;
    Lexer * lexer = cntx->Lexer0 ;
    ListObject *l0, *lnew ;
    byte * token ;
    int64 qidFlag ;
    if ( lc->ParenLevel ) // if ParenLevel == 0 we let LParen set up the list
    {
        lnew = LO_New ( LIST, 0 ) ;
        lnew->State = lc->QuoteState ;
    }
    else lnew = 0 ;
    SetState ( lc, LC_READ, true ) ;
    d0 ( if ( Is_DebugModeOn ) LO_Debug_ExtraShow ( 0, 2, 0, ( byte* ) "\nEntering _LO_Read..." ) ) ;
    do
    {
        //if ( Is_DebugModeOn ) CfrTil_PrintDataStack ( ) ;
        token = _Lexer_ReadToken ( lexer, ( byte* ) " ,\n\r\t" ) ;
        //scwi = lexer->SC_Index ;
        if ( Lexer_IsTokenQualifiedID ( lexer ) ) SetState ( cntx, CONTEXT_PARSING_QID, true ) ;
        else SetState ( cntx, CONTEXT_PARSING_QID, false ) ;
        qidFlag = GetState ( cntx, CONTEXT_PARSING_QID ) ;
        if ( token )
        {
            if ( String_Equal ( ( char * ) token, ( byte * ) ")" ) )
            {
                lc->ParenLevel -- ;
                break ;
            }
            else if ( l0 = LO_Read_DoToken ( lc, token, qidFlag, lexer->TokenStart_ReadLineIndex, lexer->SC_Index ) )
            {
                if ( lnew )
                {
                    if ( ( l0->State & SPLICE ) || ( ( l0->State & UNQUOTE_SPLICE ) &&
                        ( ! ( l0->State & QUOTED ) ) ) ) LO_SpliceAtTail ( lnew, LO_Eval ( lc, l0 ) ) ;
                    else LO_AddToTail ( lnew, l0 ) ;
                }
                else lnew = l0 ;
            }
        }
        else _SyntaxError ( ( byte* ) "\n_LO_Read : Syntax error : no token?\n", QUIT ) ;
        //if ( Is_DebugModeOn ) CfrTil_PrintDataStack ( ) ;
    }
    while ( lc->ParenLevel ) ;
    SetState ( lc, LC_READ, false ) ;
    SetState ( cntx->Finder0, QID, false ) ;
    if ( ( ! lc->ParenLevel ) && ( ! GetState ( _Compiler_, LC_ARG_PARSING ) ) ) LC_FinishSourceCode ( ) ;
    return lnew ;
}

ListObject *
_LO_Read_DoWord ( LambdaCalculus * lc, Word * word, int64 qidFlag, int64 tsrli, int64 scwi )
{
    ListObject *l0 = 0 ;
    byte *token1 ;
    //Word_SetTsrliScwi( word, tsrli, scwi ) ;
    SetState ( word, QID, qidFlag ) ;
    if ( ( word->LAttribute & ( T_LISP_READ_MACRO | T_LISP_IMMEDIATE ) ) && ( ! GetState ( _LC_, LC_READ_MACRO_OFF ) ) )
    {
        Word_Eval ( word ) ;
        if ( word->LAttribute & T_LISP_SPECIAL )
        {
            l0 = DataObject_New ( T_LC_NEW, word, 0, word->CAttribute, word->CAttribute2,
                T_LISP_SYMBOL | word->LAttribute, 0, word->Lo_Value, 0, tsrli, scwi ) ;
        }
    }
    else if ( word->LAttribute & T_LISP_TERMINATING_MACRO )
    {
        SetState ( lc, ( LC_READ ), false ) ; // let the value be pushed in this case because we need to pop it below
        Word_Eval ( word ) ;
        token1 = ( byte * ) DataStack_Pop ( ) ;
        SetState ( lc, ( LC_READ ), true ) ;
        l0 = DataObject_New ( T_LC_LITERAL, 0, token1, LITERAL, word->CAttribute2, word->LAttribute, 0, 0, 0, tsrli, scwi ) ;
    }
    else
    {
        if ( ( word->CAttribute2 & STRUCT ) || Lexer_IsTokenForwardDotted ( _Context_->Lexer0 ) )
        {
            Set_CompileMode ( true ) ;
            Object_Run ( word ) ;
            Set_CompileMode ( false ) ;
        }
        l0 = DataObject_New ( T_LC_NEW, word, 0, word->CAttribute, word->CAttribute2,
            ( T_LISP_SYMBOL | word->LAttribute ), 0, word->Lo_Value, 0, tsrli, scwi ) ;
    }
    return l0 ;
}

ListObject *
_LO_Read_DoToken ( LambdaCalculus * lc, byte * token, int64 qidFlag, int64 tsrli, int64 scwi )
{
    Context *cntx = _Context_ ;
    Lexer *lexer = cntx->Lexer0 ;
    ListObject *l0 = 0 ;
    Word *word ;
    //if ( Is_DebugModeOn ) CfrTil_PrintDataStack ( ) ;
    if ( qidFlag ) SetState ( cntx->Finder0, QID, true ) ;
    word = LC_FindWord ( token, 0 ) ;
    if ( qidFlag ) SetState ( cntx->Finder0, QID, false ) ;
    if ( word ) l0 = _LO_Read_DoWord ( lc, word, qidFlag, tsrli, scwi ) ;
    else
    {
        Lexer_ParseObject ( lexer, token ) ;
        l0 = DataObject_New ( T_LC_LITERAL, 0, token, 0, 0, 0, qidFlag, 0, 0, tsrli, scwi ) ;
    }
    if ( l0 )
    {
        l0->State |= ( lc->ItemQuoteState | lc->QuoteState ) ;
        lc->ItemQuoteState = 0 ;
    }
    //if ( Is_DebugModeOn ) CfrTil_PrintDataStack ( ) ;
    return l0 ;
}

ListObject *
_LO_Read_DoLParen ( LambdaCalculus * lc )
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
LO_Read_DoToken ( LambdaCalculus * lc, byte * token, int64 qidFlag, int64 tsrli, int64 scwi )
{
    ListObject *l0 = 0 ;
    //if ( Is_DebugOn ) _Printf ( ( byte * ) "\n_LO_Read : \'%s\' scwi = %d", token, scwi ) ;
    if ( String_Equal ( ( char * ) token, ( byte * ) "(" ) ) l0 = _LO_Read_DoLParen ( lc ) ;
    else if ( String_Equal ( ( char * ) token, ( byte * ) "/*" ) ) CfrTil_ParenthesisComment ( ) ;
    else if ( String_Equal ( ( char * ) token, ( byte * ) "//" ) ) CfrTil_CommentToEndOfLine ( ) ;
    else l0 = _LO_Read_DoToken ( lc, token, qidFlag, tsrli, scwi ) ;
    return l0 ;
}

// remember a Word is a ListObject 

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
    LC_QuoteQuasiQuoteRepl ( UNQUOTE_SPLICE, 1 ) ;
}

void
LO_Splice ( )
{
    LC_QuoteQuasiQuoteRepl ( SPLICE, 1 ) ;
}

void
LO_UnQuote ( )
{
    LC_QuoteQuasiQuoteRepl ( UNQUOTED, 1 ) ;
}

void
LO_SpliceAtTail ( ListObject * lnew, ListObject * l0 )
{
    ListObject * l1, *lnext ;
    if ( lnew )
    {
        for ( l1 = _LO_First ( l0 ) ; l1 ; l1 = lnext )
        {
            lnext = _LO_Next ( l1 ) ;
            LO_AddToTail ( lnew, LO_CopyOne ( l1 ) ) ; // nb. LO_CopyOne is necessary here
        }
    }
}



