
#include "../../include/cfrtil64.h"
//LambdaCalculus * _LC_ ;
// --------------------------------------------------------
// LC  : an abstract core of a prefix language related to Lambda Calculus with list objects
//       (it seems neither lisp nor scheme as they exist meet my more abstract intent so it's "Lambda Calculus")
// LO  : ListObject
// nb. : a Word is a ListObject is a Namespace is a DObject 
//     : a ListObject is a Word is a Namespace is a DObject 
// ---------------------------------------------------------

// lisp type lists can maybe be thought of as not rpn - not reverse polish notation, 
// not postfix but prefix - cambridge polish/prefix notation blocks

// sections  
// _LO_Eval
// _LO_Apply 
// _LO_Read 
// _LO_Print
// _LO_SpecialFunctions
// LO_Repl
// LO_...misc : _L0_New _L0_Copy
// LC_x

//===================================================================================================================
//| LO_Eval
//===================================================================================================================
// #define EVAL(x)         (isNum(x)? x : isSym(x)? val(x) : evList(x)) // picolisp

// for calling 'C' functions such as printf or other system functions
// where the arguments are pushed first from the end of the list like 'C' arguments

// subst : lisp 1.5
// set the value of the lambda parameters to the function call values - a beta reduction in the lambda calculus 

//
// nb. we must not use the word as the ListObject because it is on its own namespace list
// so we create a new ListObject with a pointer to the word for its values/properties

// can we just use the 'word' instead of this

#if 0

void
Lexer_DoReplMacro ( Lexer * lexer )
{
    //ReadLine_UnGetChar ( lexer->ReadLiner0 ) ; // let the repl re-get the char 
    Lexer_FinishTokenHere ( lexer ) ;
    LC_ReadEvalPrint ( ) ;
    SetState ( lexer, LEXER_RETURN_NULL_TOKEN, true ) ;
}

void
Lexer_CheckMacroRepl ( Lexer * lexer )
{
    byte nextChar = ReadLine_PeekNextNonWhitespaceChar ( lexer->ReadLiner0 ) ;
    if ( ( nextChar == '(' ) ) //|| ( nextChar == ',' ) )
    {
        Lexer_DoReplMacro ( lexer ) ;
    }
}
#endif

//===================================================================================================================
//| LO Misc : _LO_FindWord _LO_New _LO_Copy
//===================================================================================================================

ListObject *
_LO_New_RawStringOrLiteral ( Lexer * lexer, byte * token, int64 qidFlag )
{
    if ( GetState ( lexer, KNOWN_OBJECT ) )
    {
        uint64 ctokenType = qidFlag ? OBJECT : lexer->TokenType | LITERAL ;
        Word * word = _DObject_New ( lexer->OriginalToken, lexer->Literal, ( ctokenType | IMMEDIATE | LITERAL ), 0, ctokenType, ctokenType,
            ( byte* ) _DataObject_Run, 0, 0, 0, LISP ) ;
        word->W_RL_Index = lexer->TokenStart_ReadLineIndex ;
        if ( ( ! qidFlag ) && ( lexer->TokenType & ( T_RAW_STRING ) ) )
        {
            // nb. we don't want to do this block with literals it slows down the eval and is wrong
            word->LAttribute |= ( T_LISP_SYMBOL | T_RAW_STRING ) ;
            //_Namespace_DoAddWord ( _LC_->LispInternalNamespace, word, 0 ) ; // nb. here not in _DObject_New :: only for ( ! qidFlag ) && ( lexer->TokenType & T_RAW_STRING ) 
            word->Lo_Value = ( int64 ) word->Lo_Name ;
        }
        word->Lo_CfrTilWord = word ;
        if ( qidFlag ) word->CAttribute &= ~ T_LISP_SYMBOL ;
        return word ;
    }
    else
    {
        _Printf ( ( byte* ) "\n%s ?\n", ( char* ) token ) ;
        CfrTil_Exception ( NOT_A_KNOWN_OBJECT, 0, QUIT ) ;
        return 0 ;
    }
}

ListObject *
_LO_New ( uint64 ltype, uint64 ctype, uint64 ctype2, byte * name, byte * value, Word * word, uint64 allocType, int64 rl_Index, int64 scwi )
{
    //_DObject_New ( byte * name, uint64 value, uint64 ctype, uint64 ltype, uint64 ftype, byte * function, int64 arg, int64 addToInNs, Namespace * addToNs, uint64 allocType )
    ListObject * l0 = _DObject_New ( word ? word->Name : name ? name : ( byte* ) "", ( uint64 ) value, ctype, ctype2, ltype,
        ( ltype & T_LISP_SYMBOL ) ? word ? word->RunType : 0 : 0, 0, 0, 0, 0, LISP ) ;
    if ( ltype & LIST ) _LO_ListInit ( l0, allocType ) ;
    else if ( ltype & LIST_NODE ) l0->S_SymbolList = ( dllist* ) value ;
    if ( word )
    {
        l0->Lo_CfrTilWord = word ;
        word->Lo_CfrTilWord = word ;
        l0->W_RL_Index = rl_Index ;
        l0->W_SourceCode = word->W_SourceCode ;
        l0->W_SC_Index = word->W_SC_Index = ( scwi != - 1 ) ? scwi : _Lexer_->SC_Index ;
    }
    return l0 ;
}

ListObject *
_LO_First ( ListObject * l0 )
{
    if ( l0 && ( ! ( l0->LAttribute & ( T_NIL ) ) ) )
    {
        if ( l0->LAttribute & ( LIST | LIST_NODE ) ) return ( ListObject* ) dllist_First ( ( dllist* ) ( dllist * ) l0->Lo_List ) ;
        else return l0 ;
    }
    return 0 ;
}

ListObject *
_LO_Last ( ListObject * l0 )
{
    if ( l0 )
    {
        if ( l0->LAttribute & ( LIST | LIST_NODE ) ) return ( ListObject* ) dllist_Last ( ( dllist * ) l0->Lo_List ) ;
        else return l0 ;
    }
    return 0 ;
}

ListObject *
_LO_Next ( ListObject * l0 )
{
    return ( ListObject* ) dlnode_Next ( ( dlnode* ) l0 ) ;
}

Word *
LC_FindWord ( byte * name, ListObject * locals )
{
    Word * word = 0 ;
    if ( GetState ( _Compiler_, LC_ARG_PARSING ) ) word = Finder_Word_FindUsing ( _Context_->Finder0, name, 0 ) ;
    else
    {
        if ( locals ) word = _Finder_FindWord_InOneNamespace ( _Finder_, locals, name ) ;
        if ( ! word )
        {
            //word = _Finder_FindWord_InOneNamespace ( _Finder_, _LC_->LispTemporariesNamespace, name ) ;
            //if ( ! word )
            //{
            word = _Finder_FindWord_InOneNamespace ( _Finder_, _LC_->LispInternalNamespace, name ) ;
            if ( ! word )
            {
                word = _Finder_FindWord_InOneNamespace ( _Finder_, _LC_->LispNamespace, name ) ; // prefer Lisp namespace
                if ( ! word )
                {
                    word = Finder_Word_FindUsing ( _Context_->Finder0, name, 0 ) ;
                }
            }
            //}
        }
    }
    return word ;
}

Boolean
LO_strcat ( byte * buffer, byte * buffer2 )
{
    if ( Strlen ( ( char* ) buffer2 ) + Strlen ( ( char* ) buffer ) >= BUFFER_SIZE )
    {
        Error ( "", "LambdaCalculus : LO_strcat : buffer overflow.", QUIT ) ;
    }
    else strncat ( ( char* ) buffer, ( char* ) buffer2, BUFFER_SIZE ) ;
    buffer2 [0] = 0 ;
    return true ;
}

ListObject *
_LO_CopyOne ( ListObject * l0, uint64 allocType )
{
    ListObject * l1 = 0 ;
    if ( l0 )
    {
        l1 = ( ListObject * ) _object_Allocate ( sizeof ( ListObject ), allocType ) ; //Mem_Allocate ( ( sizeof (ListObject ) + ((slots-1) * CELL), AllocType ) ;
        MemCpy ( l1, l0, sizeof ( ListObject ) ) ;
        // nb. since we are coping the car/cdr are the same as the original so we must clear them else when try to add to the list and remove first it will try to remove from a wrong list so ...
        l1->Lo_Car = 0 ;
        l1->Lo_Cdr = 0 ;
    }
    return l1 ;
}

void
_LO_ListInit ( ListObject * l0, uint64 allocType )
{
    l0->Lo_List = _dllist_New ( allocType ) ; //( dllist* ) l0 ;
    l0->LAttribute |= LIST ; // a LIST_NODE needs to be initialized also to be also a LIST
}

ListObject *
LO_ListNode_New ( uint64 allocType )
{
    ListObject * l0 = LO_New ( LIST, 0 ) ;
    _LO_ListInit ( l0, allocType ) ;
    return l0 ;
}

// copy a whole list or a single node

ListObject *
_LO_Copy ( ListObject * l0, uint64 allocType )
{
    ListObject * lnew = 0, *l1, *lnext, *lcopy ;
    if ( l0 )
    {
        if ( l0->LAttribute & ( LIST | LIST_NODE ) ) lnew = LO_ListNode_New ( allocType ) ;
        for ( l1 = _LO_First ( l0 ) ; l1 ; l1 = lnext )
        {
            lnext = _LO_Next ( l1 ) ;
            lcopy = _LO_CopyOne ( l1, allocType ) ;
            if ( lnew ) LO_AddToTail ( lnew, lcopy ) ;
            else return lcopy ;
        }
    }
    return lnew ;
}

//===================================================================================================================
//| LO_Repl
//===================================================================================================================

void
LC_EvalPrint ( LambdaCalculus * lc, ListObject * l0 )
{
    ListObject * l1 ;
    l1 = LO_Eval ( lc, l0 ) ;
    LO_Print ( l1 ) ;
    CfrTil_NewLine ( ) ;
    SetState ( lc, LC_PRINT_ENTERED, false ) ;
    SetBuffersUnused ( 1 ) ;
    _LC_->ParenLevel = 0 ;
    Compiler_Init ( _Context_->Compiler0, 0 ) ; // we could be compiling a cfrTil word as in oldLisp.cft
}

ListObject *
_LC_Read_ListObject ( LambdaCalculus * lc, int64 parenLevel )
{
    lc->ParenLevel = parenLevel ;
    ListObject * l0 = _LO_Read ( lc ) ;
    return l0 ;
}

void
_LC_ReadEvalPrint_ListObject ( int64 parenLevel, int64 continueFlag )
{
    LambdaCalculus * lc = _LC_ ;
    Lexer * lexer = _Context_->Lexer0 ;
    Compiler * compiler = _Context_->Compiler0 ;
    if ( lc && parenLevel ) lc->QuoteState = lc->ItemQuoteState ;
    else lc = LC_Init_Runtime ( ) ;
    LC_LispNamespaceOn ( ) ;
    byte *svDelimiters = lexer->TokenDelimiters ;
    SetState ( compiler, LISP_MODE, true ) ;
    compiler->InitHere = Here ;
    if ( ! parenLevel ) CfrTil_InitSourceCode ( _CfrTil_ ) ;
    else CfrTil_InitSourceCode_WithCurrentInputChar ( _CfrTil_ ) ;
    ListObject * l0 = _LC_Read_ListObject ( lc, parenLevel ) ; //0 ) ;
    d0 ( if ( Is_DebugOn ) LO_PrintWithValue ( l0 ) ) ;
    LC_EvalPrint ( lc, l0 ) ;
    if ( ! continueFlag )
    {
        Lexer_SetTokenDelimiters ( lexer, svDelimiters, 0 ) ;
    }
    SetState ( compiler, LISP_MODE, false ) ;
}

void
LC_ReadEvalPrint_ListObject ( )
{
    _LC_ReadEvalPrint_ListObject ( 0, 1 ) ;
}

void
LC_ReadEvalPrint_AfterAFirstLParen ( )
{
    _LC_ReadEvalPrint_ListObject ( 1, 0 ) ;
    SetState ( _CfrTil_, SOURCE_CODE_STARTED, false ) ;
}

void
LC_ReadEvalPrint ( )
{
    _LC_ReadEvalPrint_ListObject ( 0, 0 ) ;
}

void
LC_ReadInitFile ( byte * filename )
{
    _CfrTil_ContextNew_IncludeFile ( filename ) ;
}

void
LO_Repl ( )
{
    Compiler * compiler = _Context_->Compiler0 ;
    SetState ( compiler, LISP_MODE, true ) ;
    _Printf ( ( byte* ) "\ncfrTil lisp : (type 'exit' or 'bye' to exit)\n including init file :: './namespaces/compiler/lcinit.cft'\n" ) ;
    LC_ReadInitFile ( ( byte* ) "./namespaces/compiler/lcinit.cft" ) ;
    _Repl ( ( block ) LC_ReadEvalPrint_ListObject ) ;

}

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

//===================================================================================================================
//| LC_ : lambda calculus
//===================================================================================================================

void
LC_Read ( )
{
    LambdaCalculus * lc = LC_Init_Runtime ( ) ;
    ListObject * l0 = _LC_Read_ListObject ( lc, 1 ) ;
    DataStack_Push ( ( int64 ) l0 ) ;
}

void
LC_Eval ( )
{
    LambdaCalculus * lc = LC_Init_Runtime ( ) ;
    LC_LispNamespaceOn ( ) ;
    ListObject * l0 = ( ListObject * ) DataStack_Pop ( ), *l1 ;
    l1 = LO_Eval ( lc, l0 ) ;
    DataStack_Push ( ( int64 ) l1 ) ;
}

void
LC_DupList ( )
{
    LC_Init_Runtime ( ) ;
    ListObject * l0 = ( ListObject * ) TOS, *l1 ;
    l1 = LO_CopyOne ( l0 ) ;
    DataStack_Push ( ( int64 ) l1 ) ;
}

void
_LC_SaveDsp ( LambdaCalculus * lc )
{
    if ( lc ) lc->SaveStackPointer = _Dsp_ ;
}

void
_LC_ResetStack ( LambdaCalculus * lc )
{
    if ( lc && ( lc->SaveStackPointer ) ) _Dsp_ = lc->SaveStackPointer ;
}

void
LC_RestoreStack ( )
{
    _LC_ResetStack ( _LC_ ) ;
}

void
LC_SaveStack ( )
{
    _LC_SaveDsp ( _LC_ ) ;
}

void
LC_FinishSourceCode ( )
{
    _LC_->LC_SourceCode = _CfrTil_GetSourceCode ( ) ;
}

void
_LC_ClearInternalNamespace ( LambdaCalculus * lc )
{
    if ( lc )
    {
        _Namespace_Clear ( lc->LispInternalNamespace ) ;
    }
}

void
LC_ClearInternalNamespace ( )
{
    _LC_ClearInternalNamespace ( _LC_ ) ;
}

void
LC_LispNamespaceOff ( )
{
    Namespace_SetAsNotUsing ( ( byte* ) "Lisp" ) ;
    CfrTil_TurnOffQualifyingNamespace ( ) ;
}

void
LC_LispNamespaceOn ( )
{
    Namespace_ActivateAsPrimary ( ( byte* ) "Lisp" ) ;
}

LambdaCalculus *
_LC_Init_Runtime ( LambdaCalculus * lc )
{
    _Stack_Init ( lc->QuoteStateStack, 256 ) ;
    lc->SavedCodeSpace = 0 ;
    lc->CurrentLambdaFunction = 0 ;
    _LC_SaveDsp ( lc ) ;
    lc->ParenLevel = 0 ;
    lc->QuoteState = 0 ;
    lc->ItemQuoteState = 0 ;
    return lc ;
}

LambdaCalculus *
LC_Init_Runtime ( )
{
    LambdaCalculus * lc = _LC_ ;
    if ( ! lc ) lc = LC_New ( ) ;
    else _LC_Init_Runtime ( lc ) ;
    return lc ;
}

LambdaCalculus *
_LC_Init ( LambdaCalculus * lc )
{
    if ( lc )
    {
        lc->LispNamespace = Namespace_Find ( ( byte* ) "Lisp" ) ;
        lc->LispInternalNamespace = Namespace_FindOrNew_SetUsing ( ( byte* ) "LispInternal", 0, 1 ) ;
        _LC_Init_Runtime ( lc ) ;
        lc->OurCfrTil = _CfrTil_ ;
        int64 svds = GetState ( _CfrTil_, _DEBUG_SHOW_ ) ;
        int64 svsco = IsSourceCodeOn ;
        DebugShow_Off ;
        CfrTil_DbgSourceCodeOff ( ) ;
        lc->Nil = _DataObject_New ( T_LC_NEW, 0, ( byte* ) "nil", 0, 0, T_NIL, 0, 0, 0, 0, - 1 ) ;
        lc->True = _DataObject_New ( T_LC_NEW, 0, ( byte* ) "true", 0, 0, 0, 0, ( uint64 ) true, 0, 0, - 1 ) ;
        lc->buffer = Buffer_Data ( lc->PrintBuffer ) ;
        lc->outBuffer = Buffer_Data ( lc->OutBuffer ) ;
        SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, svsco ) ;
        SetState ( _CfrTil_, _DEBUG_SHOW_, svds ) ;
    }
    return lc ;
}

void
LC_Delete ( LambdaCalculus * lc )
{
    if ( lc )
    {
        LC_ClearInternalNamespace ( ) ;
        OVT_MemListFree_LispTemp ( ) ;
        OVT_MemListFree_LispSpace ( ) ;
    }
}

LambdaCalculus *
_LC_Create ( )
{
    LambdaCalculus * lc = ( LambdaCalculus * ) Mem_Allocate ( sizeof (LambdaCalculus ), LISP ) ;
    lc->QuoteStateStack = Stack_New ( 256, LISP ) ; // LISP_TEMP : is recycled by OVT_FreeTempMem in _CfrTil_Init_SessionCore called by _CfrTil_Interpret
    lc->PrintBuffer = Buffer_NewLocked ( BUFFER_SIZE ) ;
    lc->OutBuffer = Buffer_NewLocked ( BUFFER_SIZE ) ;
    return lc ;
}

LambdaCalculus *
LC_New ( )
{
    LambdaCalculus * lc = _LC_Create ( ) ;
    _LC_ = lc ;
    lc = _LC_Init ( lc ) ;
    return lc ;
}

LambdaCalculus *
LC_Reset ( )
{
    LC_Delete ( _LC_ ) ;
    LC_New ( ) ;
}

LambdaCalculus *
LC_Init ( )
{
    LambdaCalculus * lc ;
    if ( _LC_ ) lc = _LC_Init_Runtime ( _LC_ ) ;
    else lc = LC_New ( ) ;
    return lc ;
}

