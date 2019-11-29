#include "../../include/cfrtil64.h"

void
Word_Run ( Word * word )
{
    if ( word )
    {
        word->StackPushRegisterCode = 0 ; // nb. used! by the rewriting optInfo
        // keep track in the word itself where the machine code is to go, if this word is compiled or causes compiling code - used for optimization
        Word_SetCodingAndSourceCoding ( word, Here ) ; // if we change it later (eg. in lambda calculus) we must change it there because the rest of the compiler depends on this
        _Context_->CurrentlyRunningWord = word ;
        DEBUG_SETUP ( word ) ;
        if ( ! GetState ( word, STEPPED ) ) // set by the debuggger
        {
            if ( ! sigsetjmp ( _Context_->JmpBuf0, 0 ) ) // longjmp from _Debugger_InterpreterLoop
            {
                Block_Eval ( word->Definition ) ;
            }
            else Set_DataStackPointers_FromDebuggerDspReg ( ) ;
        }
        SetState ( word, STEPPED, false ) ;
        _DEBUG_SHOW ( word, 0 ) ;
        if ( IS_MORPHISM_TYPE ( word ) ) SetState ( _Context_, ADDRESS_OF_MODE, false ) ;
        //_Context_->CurrentlyRunningWord = 0 ;
        _Context_->LastRunWord = word ;
    }
}

void
Word_Eval ( Word * word )
{
    if ( word )
    {
        _Context_->CurrentEvalWord = word ;
        CfrTil_Typecheck ( word ) ;
        if ( ( word->CAttribute & IMMEDIATE ) || ( ! CompileMode ) ) Word_Run ( word ) ;
        else _Word_Compile ( word ) ;
        _Context_->CurrentEvalWord = 0 ;
        _Context_->LastEvalWord = word ;
    }
}

void
_Word_Interpret ( Word * word )
{
    Interpreter_DoWord ( _Interpreter_, word, word->W_RL_Index, word->W_SC_Index ) ;
}

void
_Word_Compile ( Word * word )
{
    Compiler_SCA_Word_SetCodingHere_And_ClearPreviousUse ( word, 0 ) ;
    if ( ! word->Definition ) CfrTil_SetupRecursiveCall ( ) ;
    else if ( ( GetState ( _CfrTil_, INLINE_ON ) ) && ( word->CAttribute & INLINE ) && ( word->S_CodeSize ) ) _Compile_WordInline ( word ) ;
    else Compile_CallWord_Check_X84_ABI_RSP_ADJUST ( word ) ;
}

Namespace *
_Word_Namespace ( Word * word )
{
    if ( word->CAttribute & NAMESPACE ) return ( Namespace * ) word ;
    else return word->ContainingNamespace ;
}

// deep copy from word0 to word

void
_Word_Copy ( Word * word, Word * word0 )
{
    WordData * swdata = word->S_WordData ;
    MemCpy ( word, word0, sizeof ( Word ) + sizeof ( WordData ) ) ;
    word->S_WordData = swdata ; // restore the WordData pointer we overwrote by the above MemCpy
}

Word *
Word_Copy ( Word * word0, uint64 allocType )
{
    Word * word = _Word_Allocate ( allocType ) ;
    _Word_Copy ( word, word0 ) ;
    word->WAllocType = allocType ;
    return word ;
}

void
_Word_Finish ( Word * word )
{
    DObject_Finish ( word ) ;
    CfrTil_FinishSourceCode ( _CfrTil_, word ) ;
    _CfrTil_->LastFinished_Word = word ;
    CfrTil_TypeStackReset ( ) ;
}

void
_Word_DefinitionStore ( Word * word, block code )
{
    _DObject_ValueDefinition_Init ( word, ( int64 ) code, BLOCK, 0, 0 ) ;
}

void
Word_InitFinal ( Word * word, byte * code )
{
    _Word_DefinitionStore ( word, ( block ) code ) ;
    if ( ! word->S_ContainingNamespace ) _Word_Add ( word, 1, 0 ) ; // don't re-add if it is a recursive word cf. CfrTil_BeginRecursiveWord
    _Word_Finish ( word ) ;
}

void
_Word_Add ( Word * word, int64 addToInNs, Namespace * addToNs )
{
    Namespace * ins = 0, *ns ;
    if ( addToNs ) Namespace_DoAddWord ( addToNs, word ) ;
    else if ( addToInNs ) //&& ins )
    {
        if ( ! ( word->CAttribute & ( LITERAL ) ) )
        {
            //Namespace * ins = _CfrTil_Namespace_InNamespaceGet ( ) ;
            Namespace * ins = _CfrTil_InNamespace ( ) ; //_CfrTil_Namespace_InNamespaceGet ( ) ;
            Namespace_DoAddWord ( ins, word ) ;
        }
    }
    if ( _Q_->Verbosity > 3 )
    {
        ns = addToNs ? addToNs : ins ;
        if ( ns )
        {
            if ( word->CAttribute & BLOCK ) _Printf ( ( byte* ) "\nnew Word :: %s.%s", ns->Name, word->Name ) ;
            else _Printf ( ( byte* ) "\nnew DObject :: %s.%s", ns->Name, word->Name ) ;
        }
    }
}

Word *
_Word_Allocate ( uint64 allocType )
{
    Word * word = 0 ;
    int64 size = ( sizeof ( Word ) + sizeof ( WordData ) ) ;
    word = ( Word* ) OVT_CheckRecycleableAllocate ( _Q_->MemorySpace0->RecycledWordList, size ) ;
    if ( word ) _Q_->MemorySpace0->RecycledWordCount ++ ;
    else word = ( Word* ) Mem_Allocate ( size, allocType ) ;
    ( ( DLNode* ) word )->n_Size = size ;
    word->S_WordData = ( WordData * ) ( word + 1 ) ; // nb. "pointer arithmetic"
    return word ;
}

Word *
_Word_Create ( byte * name, uint64 ctype, uint64 ctype2, uint64 ltype, uint64 allocType )
{
    Word * word = _Word_Allocate ( allocType ? allocType : DICTIONARY ) ;
    //if ( word == (Word*) 0x7ffff5990e88) _Printf ((byte*)"") ;
    if ( allocType & ( EXISTING ) ) _Symbol_NameInit ( ( Symbol * ) word, name ) ;
    else _Symbol_Init_AllocName ( ( Symbol* ) word, name, STRING_MEM ) ;
    word->WAllocType = allocType ;
    word->CAttribute = ctype ;
    word->CAttribute2 = ctype2 ;
    word->LAttribute = ltype ;
    if ( Is_NamespaceType ( word ) ) word->Lo_List = dllist_New ( ) ;
    _Compiler_->CurrentCreatedWord = word ;
    _CfrTil_->WordCreateCount ++ ;
    Lexer_Set_ScIndex_RlIndex ( _Lexer_, word, - 1, - 1 ) ; // default values
    return word ;
}

void
Word_SetLocation ( Word * word )
{
    ReadLiner * rl = _Context_->ReadLiner0 ;
    if ( rl->InputStringOriginal )
    {
        word->S_WordData->Filename = rl->Filename ;
        word->S_WordData->LineNumber = rl->LineNumber ;
        word->W_CursorPosition = rl->CursorPosition ;
    }
}

Word *
_Word_New ( byte * name, uint64 ctype, uint64 ctype2, uint64 ltype, Boolean addToInNs, Namespace * addToNs, uint64 allocType )
{
    Word * word = _Word_Create ( name, ctype, ctype2, ltype, allocType ) ; // CFRTIL_WORD : cfrTil compiled words as opposed to C compiled words
    _Compiler_->CurrentWord = word ;
    Word_SetLocation ( word ) ;
    _Word_Add ( word, addToInNs, addToNs ) ; // add to the head of the list
    //CfrTil_WordList_PushWord ( word ) ;
    //Compiler_Word_SCH_CPUSCA ( word, 0 ) ;
    return word ;
}

Word *
Word_New ( byte * name )
{
    Word * word = _Word_New ( name, CFRTIL_WORD | WORD_CREATE, 0, 0, 1, 0, DICTIONARY ) ;
    return word ;
}

void
Word_PrintOffset ( Word * word, int64 offset, int64 totalOffset )
{
    Context * cntx = _Context_ ;
    if ( Is_DebugModeOn ) NoticeColors ;
    byte * name = String_ConvertToBackSlash ( word->Name ) ;
    if ( String_Equal ( "]", name ) && cntx->Interpreter0->BaseObject )
    {
        _Printf ( ( byte* ) "\n\'%s\' = array end :: base object \'%s\' = 0x%lx : offset = 0x%lx : total offset = 0x%lx => address = 0x%lx",
            name, cntx->Interpreter0->BaseObject->Name, cntx->Interpreter0->BaseObject->W_Value, offset, totalOffset, ( ( byte* ) cntx->Interpreter0->BaseObject->W_PtrToValue ) + totalOffset ) ;
    }
    else
    {
        totalOffset = cntx->Compiler0->AccumulatedOptimizeOffsetPointer ? *cntx->Compiler0->AccumulatedOptimizeOffsetPointer : - 1 ;
        _Printf ( ( byte* ) "\n\'%s\' = object field :: type = %s : size = 0x%lx : base object \'%s\' = 0x%lx : offset = 0x%lx : total offset = 0x%lx : address = 0x%lx",
            name, cntx->Interpreter0->BaseObject ? cntx->Interpreter0->BaseObject->Name : ( byte* ) "",
            TypeNamespace_Get ( word ) ? ( int64 ) _CfrTil_VariableValueGet ( TypeNamespace_Get ( word )->Name, ( byte* ) "size" ) : 0,
            cntx->Interpreter0->BaseObject ? String_ConvertToBackSlash ( cntx->Interpreter0->BaseObject->Name ) : ( byte* ) "",
            cntx->Interpreter0->BaseObject ? cntx->Interpreter0->BaseObject->W_Value : 0,
            word->Offset, totalOffset, cntx->Interpreter0->BaseObject ? ( ( ( byte* ) cntx->Interpreter0->BaseObject->W_Value ) + totalOffset ) : ( byte* ) - 1 ) ;
    }
    if ( Is_DebugModeOn ) DefaultColors ;
}

byte *
_Word_SourceCodeLocation_pbyte ( Word * word )
{
    byte * b = Buffer_Data ( _CfrTil_->ScratchB2 ) ;
    if ( word ) sprintf ( ( char* ) b, "%s.%s : %s %ld.%ld", word->ContainingNamespace->Name, word->Name, word->S_WordData->Filename, word->S_WordData->LineNumber, word->W_TokenEnd_ReadLineIndex ) ;
    return String_New ( b, TEMPORARY ) ;
}

void
Word_PrintName ( Word * word )
{
    if ( word ) _Printf ( ( byte* ) "%s ", word->Name ) ;
}

byte*
Word_Info ( Word * word )
{
    byte * buffer = 0 ;
    if ( word ) //&& word->ContainingNamespace )
    {
        buffer = Buffer_New_pbyte ( BUFFER_SIZE ) ;
        sprintf ( ( char * ) buffer, "%s.%s", ( char* ) word->ContainingNamespace ? ( char* ) word->ContainingNamespace->Name : "<literal>", ( char * ) word->Name ) ;
    }
    return buffer ;
}

void
Word_Print ( Word * word )
{
    if ( word ) _Printf ( ( byte* ) "\n%s", Word_Info ( word ) ) ;
}

void
_Word_Print ( Word * word )
{
    _Context_->WordCount ++ ;
    _Printf ( ( byte* ) c_ud ( " %s" ), word->Name ) ;
}

void
Word_N_M_Node_Print ( dlnode * node )
{
    Word * word = ( Word* ) dobject_Get_M_Slot ( ( dobject* ) node, SCN_T_WORD ) ;
    _Word_Print ( word ) ;
}

void
_Word_ShowSourceCode ( Word * word )
{
    if ( word && word->S_WordData ) //&& word->W_SourceCode ) //word->CAttribute & ( CPRIMITIVE | BLOCK ) )
    {
        byte * sc, * name, *scd ;
        if ( ! ( word->CAttribute & CPRIMITIVE ) )
        {
            Buffer *dstb = Buffer_NewLocked ( BUFFER_SIZE ) ;
            sc = dstb->B_Data ;
            sc = _String_ConvertStringToBackSlash ( sc, word->W_SourceCode ? word->W_SourceCode : String_New ( _CfrTil_->SC_Buffer, TEMPORARY ), - 1 ) ;
            scd = c_gd ( String_FilterMultipleSpaces ( sc, TEMPORARY ) ) ;
            Buffer_Unlock ( dstb ) ;
            Buffer_SetAsFree ( dstb, 0 ) ;
        }
        else scd = ( byte* ) "C Primitive" ;
        name = c_gd ( word->Name ) ;
        _Printf ( ( byte* ) "\nSourceCode for %s.%s :> \n%s", word->S_ContainingNamespace ? word->S_ContainingNamespace->Name : ( byte* ) "", name, scd ) ;
    }
}

byte *
Word_GetLocalsSourceCodeString ( Word * word, byte * buffer )
{
    byte * start, * sc = word->W_SourceCode ;
    int64 s, e ;
    // find and reconstruct locals source code in a buffer and parse it with the regular locals parse code
    for ( s = 0 ; sc [ s ] && sc [ s ] != '(' ; s ++ ) ;
    if ( sc [ s ] )
    {
        start = & sc [ s + 1 ] ; // right after '(' is how _CfrTil_Parse_LocalsAndStackVariables is set up
        for ( e = s ; sc [ e ] && sc [ e ] != ')' ; e ++ ) ; // end = & sc [ e ] ;
        if ( sc [ e ] )
        {
            Strncpy ( buffer, start, e - s + 1 ) ;
            buffer [ e - s + 1 ] = 0 ;
        }
    }
    return buffer ;
}

void
Word_ShowSourceCode ( Word * word )
{
    _CfrTil_Source ( word, 0 ) ;
}

Word *
Word_GetFromCodeAddress ( byte * address )
{
    return Finder_FindWordFromAddress_AnyNamespace ( _Context_->Finder0, address ) ;
}

Word *
Word_GetFromCodeAddress_NoAlias ( byte * address )
{
    return Finder_FindWordFromAddress_AnyNamespace_NoAlias ( _Context_->Finder0, address ) ;
}

void
_CfrTil_WordName_Run ( byte * name )
{
    Block_Eval ( Finder_Word_FindUsing ( _Context_->Finder0, name, 0 )->Definition ) ;
}

// alias : postfix

Word *
_CfrTil_Alias ( Word * word, byte * name )
{
    Word * alias = 0 ;
    if ( word && word->Definition )
    {
        alias = _Word_New ( name, word->CAttribute | ALIAS, word->CAttribute2, word->LAttribute, 1, 0, DICTIONARY ) ; // inherit type from original word
        word = Word_UnAlias ( word ) ;
        Word_InitFinal ( alias, ( byte* ) word->Definition ) ;
        alias->S_CodeSize = word->S_CodeSize ;
        alias->W_AliasOf = word ;
        Strncpy ( alias->W_TypeSignatureString, word->W_TypeSignatureString, 7 ) ;
    }
    else Exception ( USEAGE_ERROR, ABORT ) ;
    return alias ;
}

void
Do_TextMacro ( )
{
    Interpreter * interp = _Context_->Interpreter0 ;
    ReadLiner * rl = _Context_->ReadLiner0 ;
    ReadLiner_InsertTextMacro ( rl, interp->w_Word ) ;
    SetState ( interp, END_OF_LINE | END_OF_FILE | END_OF_STRING | DONE, false ) ; // reset a possible read newline
}

void
Do_StringMacro ( )
{
    Interpreter * interp = _Context_->Interpreter0 ;
    ReadLiner * rl = _Context_->ReadLiner0 ;
    String_InsertDataIntoStringSlot ( rl->InputLine, rl->ReadIndex, rl->ReadIndex, _String_UnBox ( ( byte* ) interp->w_Word->W_Value ) ) ; // size in bytes
    SetState ( interp, END_OF_LINE | END_OF_FILE | END_OF_STRING | DONE, false ) ; // reset a possible read newline
}

void
_CfrTil_Macro ( int64 mtype, byte * function )
{
    byte * name = _Word_Begin ( ), *macroString ;
    macroString = Parse_Macro ( mtype ) ;
    byte * code = String_New ( macroString, STRING_MEM ) ;
    //_DObject_New ( byte * name, uint64 value, uint64 ctype, uint64 ltype, uint64 ftype, byte * function, int64 arg, int64 addToInNs, Namespace * addToNs, uint64 allocType )
    _DObject_New ( name, ( uint64 ) code, IMMEDIATE, 0, 0, mtype, function, 0, 1, 0, DICTIONARY ) ;
}

Word *
Word_GetOriginalWord ( Word * word )
{
    Word * ow1, *ow0 ;
    for ( ow0 = word, ow1 = ow0->W_WordListOriginalWord ; ow1 && ( ow1 != ow1->W_WordListOriginalWord ) ; ow0 = ow1, ow1 = ow0->W_WordListOriginalWord ) ;
    if ( ! ow0 ) ow0 = word ;
    return ow0 ;
}

Word *
Word_UnAlias ( Word * word )
{
    if ( word ) while ( word->W_AliasOf ) word = word->W_AliasOf ;
    return word ;
}


