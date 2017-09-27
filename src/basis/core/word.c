#include "../../include/cfrtil.h"

void
_Word_Run ( Word * word )
{
    if ( word )
    {
        word->W_InitialRuntimeDsp = Dsp ;
        _Context_->CurrentlyRunningWord = word ;
        _Block_Eval ( word->Definition ) ;
    }
}

void
Word_Run ( Word * word )
{
    if ( ! sigsetjmp ( _Context_->JmpBuf0, 0 ) )
    {
        _Word_Run ( word ) ;
    }
    else Dsp = _CfrTil_->SaveDsp ;
}

void
Word_Eval0 ( Word * word )
{
    if ( word )
    {
        word->Coding = Here ;
        if ( ( word->CAttribute & IMMEDIATE ) || ( ! CompileMode ) )
        {
            Word_Run ( word ) ;
        }
        else
        {
            _Word_Compile ( word ) ;
        }
    }
}

void
_Word_Eval_Debug ( Word * word )
{
    if ( word )
    {
        word->Coding = Here ;
        DEBUG_SETUP ( word ) ;
        if ( ! GetState ( word, STEPPED ) ) Word_Eval0 ( word ) ;
        DEBUG_SHOW ;
    }
}

void
_Word_Eval ( Word * word )
{
    if ( word )
    {
        if ( word->CAttribute & DEBUG_WORD ) DebugColors ;
        _Context_->CurrentlyRunningWord = word ;
        word->StackPushRegisterCode = 0 ; // nb. used! by the rewriting optInfo
        // keep track in the word itself where the machine code is to go, if this word is compiled or causes compiling code - used for optimization
        word->Coding = Here ;
        word->W_SC_WordIndex = _CfrTil_->SC_ScratchPadIndex ;
        if ( Is_DebugModeOn ) _Word_Eval_Debug ( word ) ;
        else Word_Eval0 ( word ) ;
        //if ( word->CAttribute & DEBUG_WORD ) DefaultColors ; // reset colors after a debug word //?? have debug word do this - cleanup its own mess !!
        _CfrTil_SetStackPointerFromDsp ( _CfrTil_ ) ;
    }
}

void
_Word_Interpret ( Word * word )
{
    _Interpreter_DoWord ( _Interpreter_, word, - 1 ) ;
}

void
_Word_Compile ( Word * word )
{
    if ( ! word->Definition )
    {
        CfrTil_SetupRecursiveCall ( ) ;
    }
    else if ( ( GetState ( _CfrTil_, INLINE_ON ) ) && ( word->CAttribute & INLINE ) && ( word->S_CodeSize ) )
    {
        _Compile_WordInline ( word ) ;
    }
    else
    {
        //if ( NamedByteArray_CheckAddress ( _Q_CodeSpace, word->CodeStart ) ) Compile_Call_With32BitDisp ( ( byte* ) word->Definition ) ;
        //else Compile_Call_ToAddressThruReg ( ( byte* ) word->Definition, R8 ) ;
        Compile_Call ( ( byte* ) word->Definition ) ;
    }
}

Namespace *
_Word_Namespace ( Word * word )
{
    if ( word->CAttribute & NAMESPACE ) return ( Namespace * ) word ;
    else return word->ContainingNamespace ;
}

Word *
_Word_Allocate ( uint64 allocType )
{
    Word * word ;
    if ( allocType & ( COMPILER_TEMP | LISP_TEMP ) ) allocType = TEMPORARY ;
    else allocType = DICTIONARY ;
    word = ( Word* ) OVT_CheckRecyclableAllocate ( _Q_->MemorySpace0->RecycledWordList, sizeof ( Word ) + sizeof ( WordData ) ) ;
    if ( ! word ) word = ( Word* ) Mem_Allocate ( sizeof ( Word ) + sizeof ( WordData ), allocType ) ;
    word->S_WordData = ( WordData * ) ( word + 1 ) ; // nb. "pointer arithmetic"
    return word ;
}

// deep copy from word0 to word

void
_Word_Copy ( Word * word, Word * word0 )
{
    WordData * swdata = word->S_WordData ;
    memcpy ( word, word0, sizeof ( Word ) + sizeof ( WordData ) ) ;
    word->S_WordData = swdata ; // restore the WordData pointer we overwrote by the above memcpy
    //memcpy ( word->S_WordData, word0->S_WordData, sizeof (WordData ) ) ;
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
    _DObject_Finish ( word ) ;
    CfrTil_Word_FinishSourceCode ( _CfrTil_, word ) ;
    //if ( IsSourceCodeOn ) 
    {
        word->W_SC_WordList = _Context_->WordList ; //_CfrTil_->DebugWordList ;
        _Context_->WordList = 0 ;
        //_CfrTil_->DebugWordList = 0 ;
    }
    Compiler_Init ( _Context_->Compiler0, 0 ) ; // not really necessary should always be handled by EndBlock ?? but this allows for some syntax errors with a '{' but no '}' ??
#if 0    
    if ( DBI )
    {
        d1 ( _Printf ( ( byte* ) "\n_Word_Finish :: word = %s :: location : %s :", word->Name, Context_Location ( ) ) ) ;
        d1 ( _CfrTil_Word_Disassemble ( word ) ) ;
    }
#endif    
}

void
_Word_DefinitionStore ( Word * word, block code )
{
    _DObject_ValueDefinition_Init ( word, ( int64 ) code, BLOCK, 0, 0 ) ;
}

void
_Word_InitFinal ( Word * word, byte * code )
{
    _Word_DefinitionStore ( word, ( block ) code ) ;
    if ( ! word->S_ContainingNamespace ) _Word_Add ( word, 1, 0 ) ; // don't re-add if it is a recursive word cf. CfrTil_BeginRecursiveWord
    _Word_Finish ( word ) ;
}

void
_Word_Add ( Word * word, int64 addToInNs, Namespace * addToNs )
{
    Namespace * ins = _CfrTil_Namespace_InNamespaceGet ( ), *ns ;
    if ( addToNs ) Namespace_DoAddWord ( addToNs, word ) ;
    else if ( addToInNs && ins )
    {
        if ( ! ( word->CAttribute & ( LITERAL ) ) )
        {
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
_Word_Create ( byte * name, uint64 ctype, uint64 ltype, uint64 allocType )
{
    Word * word = _Word_Allocate ( allocType ? allocType : DICTIONARY ) ;
    if ( allocType & ( EXISTING ) ) _Symbol_NameInit ( ( Symbol * ) word, name ) ;
    else _Symbol_Init_AllocName ( ( Symbol* ) word, name, STRING_MEM ) ;
    word->WAllocType = allocType ;
    word->CAttribute = ctype ;
    word->LAttribute = ltype ;
    if ( Is_NamespaceType ( word ) ) word->Lo_List = dllist_New ( ) ;
    return word ;
}

Word *
_Word_New ( byte * name, uint64 ctype, uint64 ltype, int8 addToInNs, Namespace * addToNs, uint64 allocType )
{
    CheckCodeSpaceForRoom ( ) ;
    ReadLiner * rl = _Context_->ReadLiner0 ;
    Word * word = _Word_Create ( name, ctype, ltype, allocType ) ; // CFRTIL_WORD : cfrTil compiled words as opposed to C compiled words
    _Context_->Compiler0->CurrentWord = word ;
    if ( rl->InputStringOriginal )
    {
        word->S_WordData->Filename = rl->Filename ;
        word->S_WordData->LineNumber = rl->LineNumber ;
        word->W_CursorPosition = rl->CursorPosition ;
    }
#if 0    
    if ( _IsSourceCodeOn && ( ! Compiling ) && ( ! GetState ( _Context_->Interpreter0, PREPROCESSOR_MODE ) ) )
    {
        CfrTil_SourceCode_SetDebugWordList ( word ) ;
    }
#endif    
    _CfrTil_->WordCreateCount ++ ;
    _Word_Add ( word, addToInNs, addToNs ) ;
    return word ;
}

Word *
Word_New ( byte * name )
{
    Word * word = _Word_New ( name, CFRTIL_WORD | WORD_CREATE, 0, 1, 0, DICTIONARY ) ;
    return word ;
}

void
Word_PrintOffset ( Word * word, int64 increment, int64 totalIncrement )
{
    Context * cntx = _Context_ ;
    if ( Is_DebugModeOn ) NoticeColors ;
    byte * name = String_ConvertToBackSlash ( word->Name ) ;
    if ( String_Equal ( "]", name ) )
    {
        _Printf ( ( byte* ) "\n\'%s\' = array end :: base object \'%s\' : increment = %d : total totalIncrement = %d", name,
            cntx->Interpreter0->BaseObject->Name, increment, totalIncrement ) ;
    }
    else
    {
        _Printf ( ( byte* ) "\n\'%s\' = object field :: type = %s : size = %d : base object \'%s\' : offset = %d : total offset = %d", name,
            word->ContainingNamespace ? word->ContainingNamespace->Name : ( byte* ) "",
            TypeNamespace_Get ( word ) ? ( int64 ) _CfrTil_VariableValueGet ( TypeNamespace_Get ( word )->Name, ( byte* ) "size" ) : 0,
            cntx->Interpreter0->BaseObject ? String_ConvertToBackSlash ( cntx->Interpreter0->BaseObject->Name ) : ( byte* ) "",
            word->Offset, cntx->Compiler0->AccumulatedOptimizeOffsetPointer ? *cntx->Compiler0->AccumulatedOptimizeOffsetPointer : - 1 ) ;
    }
    if ( Is_DebugModeOn ) DefaultColors ;
}

void
_Word_Location_Printf ( Word * word )
{
    if ( word ) _Printf ( ( byte* ) "\n%s.%s : %s %d.%d", word->ContainingNamespace->Name, word->Name, word->S_WordData->Filename, word->S_WordData->LineNumber, word->W_CursorPosition ) ;
}

byte *
_Word_SourceCodeLocation_pbyte ( Word * word )
{
    //Buffer * buffer = Buffer_New ( BUFFER_SIZE ) ;
    byte * b = Buffer_Data ( _CfrTil_->ScratchB2 ) ;
    if ( word ) sprintf ( ( char* ) b, "%s.%s : %s %ld.%ld", word->ContainingNamespace->Name, word->Name, word->S_WordData->Filename, word->S_WordData->LineNumber, word->W_CursorPosition ) ;
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
Word_Show ( Word * word )
{
    //if ( word ) _Printf ( ( byte* ) "\n%s.%s : %s %d.%d", word->ContainingNamespace->Name, word->Name ) ;
    if ( word ) _Printf ( ( byte* ) "\n%s", Word_Info ( word ) ) ;
}

void
_Word_Print ( Word * word )
{
    _Context_->WordCount ++ ;
    _Printf ( ( byte* ) c_ud ( " %s" ), word->Name ) ;
}

void
__Word_ShowSourceCode ( Word * word )
{
    if ( word && word->S_WordData && word->W_SourceCode ) //word->CAttribute & ( CPRIMITIVE | BLOCK ) )
    {
        Buffer *dstb = Buffer_NewLocked ( BUFFER_SIZE ) ;
        byte * dst = dstb->B_Data ;
        dst = _String_ConvertStringToBackSlash ( dst, word->W_SourceCode ) ;
        byte * name = c_gd ( word->Name ) ;
        byte *dest = c_gd ( String_FilterMultipleSpaces ( dst, TEMPORARY ) ) ;
        _Printf ( ( byte* ) "\nSourceCode for ""%s"" :> \n%s", name, dest ) ;
        Buffer_Unlock ( dstb ) ;
        Buffer_SetAsFree ( dstb, 0 ) ;
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
            Strncpy ( ( char* ) buffer, ( char* ) start, e - s + 1 ) ;
            buffer [ e - s + 1 ] = 0 ;
        }
    }
    return buffer ;
}

void
_Word_ShowSourceCode ( Word * word )
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
    _Block_Eval ( Finder_Word_FindUsing ( _Context_->Finder0, name, 0 )->Definition ) ;
}

// alias : postfix

Word *
_CfrTil_Alias ( Word * word, byte * name )
{
    Word * alias = _Word_New ( name, word->CAttribute | ALIAS, word->LAttribute, 1, 0, DICTIONARY ) ; // inherit type from original word
    while ( ( ! word->Definition ) && word->W_AliasOf ) word = word->W_AliasOf ;
    _Word_InitFinal ( alias, ( byte* ) word->Definition ) ;
    alias->S_CodeSize = word->S_CodeSize ;
    alias->W_AliasOf = word ;
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
    _DObject_New ( name, ( uint64 ) code, IMMEDIATE, 0, mtype, function, 0, 1, 0, DICTIONARY ) ;
}

Word *
Word_GetOriginalWord ( Word * word )
{
    Word * ow1, *ow0 ;
    for ( ow0 = word, ow1 = ow0->W_OriginalWord ; ow1 && ( ow1 != ow1->W_OriginalWord ) ; ow0 = ow1, ow1 = ow0->W_OriginalWord ) ;
    if ( ! ow0 ) ow0 = word ;
    return ow0 ;
}


