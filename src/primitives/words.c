
#include "../include/cfrtil64.h"

void
_CfrTil_Colon ( Boolean initSC )
{
    CfrTil_RightBracket ( ) ;
    if ( initSC ) CfrTil_SourceCode_Init ( ) ;
    CfrTil_Token ( ) ;
    CfrTil_Word_New ( ) ;
    CfrTil_BeginBlock ( ) ;

    byte * token = Lexer_Peek_Next_NonDebugTokenWord ( _Lexer_, 0, 0 ) ;
    if ( ( String_Equal ( token, "(" ) ) && ( ! GetState ( _Context_->Interpreter0, PREPROCESSOR_DEFINE ) ) )
    {
        Lexer_ReadToken ( _Lexer_ ) ;
        CfrTil_LocalsAndStackVariablesBegin ( ) ;
    }
}

void
CfrTil_Colon ( )
{
    _CfrTil_Colon ( 1 ) ;
}

Word *
CfrTil_WordInitFinal ( )
{
    block b = ( block ) DataStack_Pop ( ) ;
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    Word_InitFinal ( word, ( byte* ) b ) ;
    return word ;
}

void
CfrTil_SemiColon ( )
{
    CfrTil_EndBlock ( ) ;
    CfrTil_WordInitFinal ( ) ;
}

void
AddressToWord ( )
{
    DataStack_Push ( ( int64 ) Finder_FindWordFromAddress_AnyNamespace ( _Context_->Finder0, ( byte* ) DataStack_Pop ( ) ) ) ;
}

void
Word_Definition ( )
{
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    DataStack_Push ( ( int64 ) word->Definition ) ;
}

void
Word_Value ( )
{
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    DataStack_Push ( ( int64 ) word->W_Value ) ;
}

void
Word_Xt_LValue ( )
{
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    DataStack_Push ( ( int64 ) & word->Definition ) ;
}

#if  0

void
Word_DefinitionStore ( )
{
    Word * word = ( Word * ) DataStack_Pop ( ) ;
    block b = ( block ) TOS ; // leave word on tos for anticipated further processing
    _Word_DefinitionStore ( word, b ) ;
}
#endif

void
Word_DefinitionEqual ( )
{
    block b = ( block ) DataStack_Pop ( ) ;
    Word * word = ( Word* ) TOS ; // leave word on tos for anticipated further processing
    _Word_DefinitionStore ( word, b ) ;
}

void
Word_CodeStart ( )
{
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    DataStack_Push ( ( int64 ) word->CodeStart ) ;
}

void
Word_CodeSize ( )
{
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    DataStack_Push ( ( int64 ) word->S_CodeSize ) ;
}

void
CfrTil_Word_Run ( )
{
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    Word_Run ( word ) ;
}

void
CfrTil_Word_Eval ( )
{
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    Word_Eval ( word ) ;
}

void
Word_Finish ( )
{
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    _Word_Finish ( word ) ;
}

// ?!? : nb. macros and _Word_Begin may need to be reworked

byte *
_Word_Begin ( )
{
    CfrTil_SourceCode_Init ( ) ;
    byte * name = Lexer_ReadToken ( _Context_->Lexer0 ) ;
    return name ;
}

void
Word_Add ( )
{
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    _Word_Add ( word, 1, 0 ) ;
}

// forth : "create"

void
CfrTil_Word_New ( )
{
    byte * name = ( byte* ) DataStack_Pop ( ) ;
    Word * word = Word_New ( name ) ;
    CfrTil_WordList_Init (word) ; //nb! so we need to use source code debug before creating a new word
    DataStack_Push ( ( int64 ) word ) ;
}

// ( token block -- word )
// postfix 'word' takes a token and a block

void
CfrTil_Word ( )
{
    block b = ( block ) DataStack_Pop ( ) ;
    byte * name = ( byte* ) DataStack_Pop ( ) ;
    DataObject_New (CFRTIL_WORD, 0, name, 0, 0, 0, 0, ( int64 ) b, 0, 0, 0, - 1 ) ;
}

void
CfrTil_Alias ( )
{
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    byte * name = ( byte* ) DataStack_Pop ( ) ;
    _CfrTil_Alias (word, name , 0) ;
}
#if 0

void
CfrTil_Eval_C_Rtl_ArgList ( ) // C : x86 : ABI = 32 : protocol : right to left arguments from a list pushed on the stack
{
    LC_CompileRun_C_ArgList ( ( Word * ) DataStack_Pop ( ) ) ;
}
#endif

void
CfrTil_TextMacro ( )
{
    _CfrTil_Macro ( TEXT_MACRO, ( byte* ) Do_TextMacro ) ;
}

void
CfrTil_StringMacro ( )
{
    _CfrTil_Macro ( STRING_MACRO, ( byte* ) Do_StringMacro ) ;
}

void
Word_Name ( )
{
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    DataStack_Push ( ( int64 ) word->Name ) ;
}

Location *
Location_New ( )
{
    ReadLiner * rl = _ReadLiner_ ;
    Location * loc = ( Location * ) Mem_Allocate ( sizeof ( Location ), ( CompileMode ? INTERNAL_OBJECT_MEM : OBJECT_MEM ) ) ;
    loc->Filename = rl->Filename ;
    loc->LineNumber = rl->LineNumber ;
    loc->CursorPosition = _Context_->Lexer0->CurrentReadIndex ; // rl->CursorPosition ;
    return loc ;
}

void
_Location_Printf ( Location * loc )
{
    if ( loc ) _Printf ( ( byte* ) "\nRun Time Location : %s %d.%d", loc->Filename, loc->LineNumber, loc->CursorPosition ) ;
}

void
CfrTil_Location_Printf ( )
{
    Location * loc = ( Location* ) DataStack_Pop ( ) ;
    _Location_Printf ( loc ) ;
}

void
Location_PushNew ( )
{
    Location * loc = Location_New ( ) ;
    _Compile_Stack_Push ( DSP, RAX, ( int64 ) loc ) ;
}

// related to forth does>
// do> does> <do

void
CfrTil_Do ( )
{
    //_Context_->CurrentlyRunningWord->CAttribute |= IMMEDIATE ;
    CfrTil_LeftBracket ( ) ; // interpret mode
}

void
CfrTil_Does ( )
{
    //_CfrTil_RightBracket ( ) ; // back to compile mode
    CfrTil_BeginBlock ( ) ;
    Interpret_C_Until_Token4 ( _Interpreter_, ( byte* ) "<do", ( byte* ) ";", ( byte* ) "}", ( byte* ) ",", 0, 0 ) ;
    CfrTil_EndBlock ( ) ;
    CfrTil_BlockRun ( ) ;
}

void
Word_Namespace ( )
{
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    DataStack_Push ( ( int64 ) _Word_Namespace ( word ) ) ;
}

void
CfrTil_Keyword ( void )
{
    Word * word = _CfrTil_->LastFinished_Word ;
    if ( word ) word->W_MorphismAttributes |= KEYWORD ;
}

void
CfrTil_Immediate ( void )
{
    Word * word = _CfrTil_->LastFinished_Word ;
    if ( word ) word->W_MorphismAttributes |= IMMEDIATE ;
}

void
CfrTil_Syntactic ( void )
{
    Word * word = _CfrTil_->LastFinished_Word ;
    if ( word ) word->W_ObjectAttributes |= SYNTACTIC ;
}

void
CfrTil_IsImmediate ( void )
{
#if 0    
    Word * word = ( Word* ) TOS ;
    TOS = ( word->CAttribute & IMMEDIATE ) ;
#else
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    DataStack_Push ( word->W_MorphismAttributes & IMMEDIATE ) ;
#endif    
}

void
CfrTil_Inline ( void )
{
    Word * word = _CfrTil_->LastFinished_Word ;
    if ( word ) word->W_MorphismAttributes |= INLINE ;
}

void
CfrTil_Set_TypeSignature ( void )
{
    byte * typeSignature = ( byte* ) DataStack_Pop ( ) ;
    Word * word = _CfrTil_->LastFinished_Word ; // nb! must be LastFinished_Word because the signature is a literal and it is the LastFinished_DObject
    if ( word ) Strncpy ( word->W_TypeSignatureString, typeSignature, 7 ) ;
}

void
CfrTil_Prefix ( void )
{
    Word * word = _CfrTil_->LastFinished_Word ;
    if ( word )
    {
        word->W_MorphismAttributes |= PREFIX ;
        word->W_TypeAttributes = WT_PREFIX ;
    }
}

void
CfrTil_NPrefix ( void )
{
    uint64 numberOfPrefixedArgs = DataStack_Pop ( ) ;
    Word * word = _CfrTil_->LastFinished_Word ;
    if ( word )
    {
        word->W_MorphismAttributes |= PREFIX ;
        word->W_TypeAttributes = WT_PREFIX ;
        word->WNumberOfPrefixedArgs = numberOfPrefixedArgs ;
    }
}

void
CfrTil_C_Prefix ( void )
{
    Word * word = _CfrTil_->LastFinished_Word ;
    if ( word )
    {
        word->W_MorphismAttributes |= C_PREFIX | C_PREFIX_RTL_ARGS ;
        word->W_TypeAttributes = WT_C_PREFIX_RTL_ARGS ;
    }
}

void
CfrTil_C_Return ( void )
{
    Word * word = _CfrTil_->LastFinished_Word ;
    if ( word )
    {
        word->W_MorphismAttributes |= C_RETURN | C_PREFIX_RTL_ARGS ;
        word->W_TypeAttributes = WT_C_PREFIX_RTL_ARGS ;
    }
}

void
CfrTil_Void_Return ( void )
{
    Word * word = _CfrTil_->LastFinished_Word ;
    if ( word )
    {
        word->W_MorphismAttributes &= ~ C_RETURN ;
        word->W_MorphismAttributes |= VOID_RETURN ;
        if ( GetState ( _Context_, C_SYNTAX ) )
        {
            word->W_MorphismAttributes |= C_PREFIX_RTL_ARGS ;
            word->W_TypeAttributes = WT_C_PREFIX_RTL_ARGS ;
        }
    }
}

void
CfrTil_RAX_Return ( void )
{
    Word * word = _CfrTil_->LastFinished_Word ;
    if ( word )
    {
        word->W_MorphismAttributes &= ~ C_RETURN ;
        word->W_MorphismAttributes |= RAX_RETURN ;
    }
}

void
CfrTil_DebugWord ( void )
{
    Word * word = _CfrTil_->LastFinished_Word ;
    if ( word ) word->W_MorphismAttributes |= DEBUG_WORD ;
}

void
Symbol_Print ( Symbol * symbol )
{
    _Printf ( ( byte* ) "%s", symbol->Name ) ;
}

void
Symbol_List_Print ( dllist * list )
{
    _Printf ( ( byte* ) "\nSymbol List : " ) ;
    dllist_Map ( list, ( MapFunction0 ) Symbol_Print ) ;
}

void
_PrintWord ( dlnode * node, int64 * n )
{
    Word * word = ( Word * ) node ;
    _Word_Print ( word ) ;
    ( *n ) ++ ;
}

void
_Words ( Symbol * symbol, MapFunction1 mf, int64 n )
{
    Namespace * ns = ( Namespace * ) symbol ;
    _Printf ( ( byte* ) "\n - %s :> ", ns->Name ) ;
    dllist_Map1 ( ns->Lo_List, mf, n ) ;
}

void
_DoWords ( Symbol * symbol, int64 * n )
{
    _Words ( symbol, ( MapFunction1 ) _PrintWord, ( int64 ) n ) ;
}

int64
_CfrTil_PrintWords ( int64 state )
{
    int64 n = 0 ;
    _CfrTil_NamespacesMap ( ( MapSymbolFunction2 ) _DoWords, state, ( int64 ) & n, 0 ) ;
    if ( _O_->Verbosity > 3 ) _Printf ( ( byte* ) "\nCfrTil : WordsAdded = %d : WordMaxCount = %d", _CfrTil_->WordsAdded, _CfrTil_->FindWordMaxCount ) ;
    return n ;
}

void
CfrTil_Words ( )
{
    _Printf ( ( byte* ) "\nWords :\n - <namespace> ':>' <word list>" ) ;
    int64 n = _CfrTil_PrintWords ( USING ) ;
    _Printf ( ( byte* ) "\n" INT_FRMT " words on the 'using' Namespaces List ::", n ) ;
    if ( _O_->Verbosity > 3 ) _Printf ( ( byte* ) "\nCfrTil : WordsAdded = %d : WordMaxCount = %d", _CfrTil_->WordsAdded, _CfrTil_->FindWordMaxCount ) ;
}

void
_Variable_Print ( Word * word )
{
    _Printf ( ( byte* ) c_ud ( " %s = %x ;" ), word->Name, word->W_Value ) ;
}

void
_PrintVariable ( dlnode * node, int64 * n )
{
    Word * word = ( Word * ) node ;
    if ( word->W_ObjectAttributes & NAMESPACE_VARIABLE )
    {
        _Variable_Print ( word ) ;
        ( *n ) ++ ;
    }
}

void
_Variables ( Symbol * symbol, MapFunction1 mf, int64 n )
{
    int64 pre_n = * ( int64* ) n ;
    Namespace * ns = ( Namespace * ) symbol ;
    _Printf ( ( byte* ) "\n - %s :> ", ns->Name ) ;
    dllist_Map1 ( ns->Lo_List, mf, n ) ;
    if ( *( int64* ) n == pre_n ) _Printf ( ( byte* ) "\r" ) ;
}

void
_PrintVariables ( Symbol * symbol, int64 * n )
{
    _Variables ( symbol, ( MapFunction1 ) _PrintVariable, ( int64 ) n ) ;
}

int64
_CfrTil_PrintVariables ( int64 nsStatus )
{
    int64 n = 0 ;
    _CfrTil_NamespacesMap ( ( MapSymbolFunction2 ) _PrintVariables, nsStatus, ( int64 ) & n, 0 ) ;
    return n ;
}

void
CfrTil_Variables ( )
{
    _Printf ( ( byte* ) "\nGlobal Variables :\n - <namespace> ':>' <variable '=' value ';'>*" ) ;
    int64 n = _CfrTil_PrintVariables ( USING ) ;
    _Printf ( ( byte* ) "\n" INT_FRMT " global variables on the 'using' Namespaces List", n ) ;
}

void
_CfrTil_NamespaceWords ( )
{
    int64 n = 0 ;
    Namespace * ns = ( Namespace * ) DataStack_Pop ( ) ;
    if ( ns )
    {
        _DoWords ( ( Symbol * ) ns, &n ) ;
        _Printf ( ( byte* ) "\n" INT_FRMT " words in %s namespace", n, ns->Name ) ;
    }
    else _Printf ( ( byte* ) "\nError : can't find that namespace" ) ;
}

void
CfrTil_NamespaceWords ( )
{
    byte * name = ( byte * ) DataStack_Pop ( ) ;
    Namespace * ns = _Namespace_Find ( name, 0, 0 ) ;
    DataStack_Push ( ( int64 ) ns ) ;
    _CfrTil_NamespaceWords ( ) ;
}

void
CfrTil_AllWords ( )
{
    _Printf ( ( byte* ) "\n - <namespace> ':>' <word list>" ) ;
    _Printf ( ( byte* ) "\n'using' Namespaces List ::" ) ;
    int64 n = _CfrTil_PrintWords ( USING ) ;
    _Printf ( ( byte* ) "\n" INT_FRMT " words on the Currently 'using' Namespaces List", n ) ;
    _Printf ( ( byte* ) "\n'notUsing' Namespaces List ::" ) ;
    int64 usingWords = _CfrTil_->FindWordCount ;
    int64 m = _CfrTil_PrintWords ( NOT_USING ) ;
    _Printf ( ( byte* ) "\n" INT_FRMT " words on the 'notUsing' List", m ) ;
    _Printf ( ( byte* ) "\n" INT_FRMT " total words", n + m ) ;
    int64 notUsingWords = _CfrTil_->FindWordCount ;
    _CfrTil_->FindWordCount = usingWords + notUsingWords ;
    CfrTil_WordAccounting ( ( byte* ) "CfrTil_AllWords" ) ;
}

