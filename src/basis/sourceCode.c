
#include "../include/cfrtil64.h"

void
SC_ShowDbgSourceCodeWord_Or_AtAddress ( Word * scWord0, byte * address )
{
    // ...source code source code TP source code source code ... EOL
    if ( ! Compiling )
    {
        Word * scWord ;
        if ( ! scWord0 ) scWord = Get_SourceCodeWord ( ) ;
        else scWord = scWord0 ;
        if ( scWord )
        {
            dllist * list = scWord->W_SC_WordList ? scWord->W_SC_WordList : _CfrTil_->Compiler_N_M_Node_WordList ; //&& ( scWord->W_SC_MemSpaceRandMarker == _O_->MemorySpace0->TempObjectSpace->InitFreedRandMarker ) ) ? scWord->W_SC_WordList : 0 ; //_CfrTil_->CompilerWordList ;
            if ( list )
            {
                byte *sourceCode = scWord->W_SourceCode ; //? scWord->W_SourceCode : String_New ( _CfrTil_->SC_Buffer, TEMPORARY ) ;
                if ( ! String_Equal ( sourceCode, "" ) )
                {
                    int64 fixed = 0 ;
                    //if ( Is_DebugOn ) SC_WordList_Show ( list, scWord, 0, 0, 0 ) ;
                    Word * word = DWL_Find ( list, 0, address, 0, 0, 0, 0 ) ;
                    if ( word )
                    {
                        if ( ( scWord->W_TypeAttributes & WT_C_SYNTAX ) && ( String_Equal ( word->Name, "store" ) || String_Equal ( word->Name, "poke" ) ) )
                        {
                            word->Name = ( byte* ) "=" ;
                            fixed = 1 ;
                        }

                        byte * buffer = DBG_PrepareSourceCodeString (word, sourceCode, 0, 1 ) ;
                        if ( buffer && buffer[0] ) _Printf ( ( byte* ) "\n%s", buffer ) ;
                        if ( fixed ) word->Name = ( byte* ) "store" ;
                        if ( _Debugger_ ) _Debugger_->LastSourceCodeWord = word ;
                    }
                }
            }
        }
    }
}

Boolean
SC_ShowSourceCode_In_Word_At_Address ( Word * word, byte * address )
{
    if ( GetState ( _CfrTil_, GLOBAL_SOURCE_CODE_MODE ) ) //DEBUG_SOURCE_CODE_MODE ) ) // ( _Context_->CurrentlyRunningWord ) && _Context_->CurrentlyRunningWord->W_SC_WordList ) )
    {
        if ( ! word ) word = Get_SourceCodeWord ( ) ;
        SC_ShowDbgSourceCodeWord_Or_AtAddress ( word, address ) ;
        return true ;
    }
    return false ;
}

Boolean
SC_IsWord_BlockOrCombinator ( Word * word )
{
    if ( word && ( ( word->Name[0] == '{' ) || ( word->Name[0] == '}' )
        || ( word->W_MorphismAttributes & ( COMBINATOR | SYNTACTIC ) ) ) ) return true ;
    return false ;
}

Boolean
SC_IsWord_MatchCorrectConsideringBlockOrCombinator ( Word * word )
{
    if ( word )
    {
        if ( SC_IsWord_BlockOrCombinator ( word ) )
        {
            if ( word->SourceCoding [0] == 0xe9 ) return true ; // 0xe9 jmp ins 
            else return false ;
        }
        else return true ;
    }
    return false ;
}

/*
 * 
 * Compiler Word List has nodes (CWLNs) with 2 slots one for the *word and one for a pointer to a Source Code Node (SCN) which has source code index info.
 * CWLN : slot 0 word, slot 1 SCN
 * Source code nodes (SCNs) have three slots for the source code byte index, the code address, and a pointer to the word, they are on the _CfrTil_->DebugWordList.
 * SCN : slot 0 : SCN_T_WORD, slot 1 : SCN_T_WORD_SC_INDEX, slot 2 : address is SCN_T_WORD->Coding = word->Coding
 * So, they each have pointers to each other.
 * 
 */
Word *
DWL_Find ( dllist * list, Word * iword, byte * address, byte* name, int64 takeFirstFind, byte * newAddress, int64 fromFirstFlag ) // nb fromTop is from the end of the list because it is the top 'push'
{
    byte * naddress ;
    Word *aFoundWord = 0, *foundWord = 0, *maybeFoundWord = 0 ;
    dlnode * anode = 0 ;
    int64 numFound = 0, i, iuFlag ;
    int64 fDiff = 0, minDiffFound = 0, scwi, lastScwi = _Debugger_->LastScwi ? _Debugger_->LastScwi : 0 ;
    if ( list && ( iword || name || address ) )
    {
        for ( i = 0, anode = ( fromFirstFlag ? dllist_First ( list ) : dllist_Last ( list ) ) ; anode ;
            anode = ( fromFirstFlag ? dlnode_Next ( anode ) : dlnode_Previous ( anode ) ), i ++ )
        {
            aFoundWord = ( Word* ) dobject_Get_M_Slot ( ( dobject* ) anode, SCN_T_WORD ) ;
            iuFlag = dobject_Get_M_Slot ( ( dobject* ) anode, SCN_IN_USE_FLAG ) ;
            //if ( ( ! aFoundWord->S_WordData ) || ( ! ( iuFlag & SCN_IN_USE_FOR_SOURCE_CODE ) ) ) continue ;
            if ( ( ! aFoundWord->S_WordData ) || ( ! ( iuFlag ) ) ) continue ;
            scwi = dobject_Get_M_Slot ( ( dobject* ) anode, SCN_SC_WORD_INDEX ) ;
            naddress = aFoundWord->SourceCoding ;
            if ( iword && ( aFoundWord == iword ) ) return aFoundWord ;
            if ( ( _O_->Verbosity > 3 ) ) DWL_ShowWord ( anode, i, 0, ( int64 ) "afound", fDiff ) ;
            if ( address && ( address == naddress ) )
            {
                numFound ++ ;
                fDiff = abs ( scwi - lastScwi ) ;
                aFoundWord->W_SC_Index = scwi ; // not sure exactly why this is necessary but it is important for now??
                if ( ( _O_->Verbosity > 2 ) ) DWL_ShowWord ( anode, i, 0, ( int64 ) "FOUND", fDiff ) ;
                if ( ( aFoundWord->W_ObjectAttributes & LITERAL ) && ( aFoundWord->Coding[1] == 0xb9 ) )
                {
                    foundWord = aFoundWord ;
                    minDiffFound = fDiff ;
                }
                else if ( ( aFoundWord->W_MorphismAttributes & CATEGORY_PLUS_PLUS_MINUS_MINUS ) && ( aFoundWord->Coding[1] == 0xff ) )
                {
                    foundWord = aFoundWord ;
                    break ;
                }
                else if ( SC_IsWord_MatchCorrectConsideringBlockOrCombinator ( aFoundWord ) )
                {
                    foundWord = aFoundWord ;
                    minDiffFound = fDiff ;
                }
                else if ( ( fDiff < minDiffFound ) && SC_IsWord_MatchCorrectConsideringBlockOrCombinator ( aFoundWord ) )//|| SC_IsWord_MatchCorrectConsideringBlockOrCombinator ( foundWord ) || ( ! SC_IsWord_MatchCorrectConsideringBlockOrCombinator ( aFoundWord ) ) )
                {
                    foundWord = aFoundWord ;
                    minDiffFound = fDiff ;
                }
                else if ( ! foundWord ) maybeFoundWord = aFoundWord ;
                if ( takeFirstFind ) break ;
            }
        }
        if ( ( ! foundWord ) && maybeFoundWord ) foundWord = maybeFoundWord ;
    }
    if ( ( ! newAddress ) && ( numFound ) )
    {
        if ( ( foundWord ) && ( _O_->Verbosity > 2 ) )
        {
            //_Printf ( ( byte* ) "\nNumber Found = %d :: minDiffFound = %d : window = %d : Chosen word = \'%s\' : LastSourceCodeWord = \'%s\'", numFound, minDiffFound, fDiff, foundWord->Name, _Debugger_->LastSourceCodeWord ? _Debugger_->LastSourceCodeWord->Name : ( byte* ) "" ) ;
            _DWL_ShowWord_Print ( foundWord, 0, ( byte* ) "CHOSEN", foundWord->Coding, foundWord->SourceCoding, 0, foundWord->W_SC_Index, 1 ) ; //_DWL_ShowWord ( foundWord, "CHOSEN", minDiffFound ) ;
        }
        if ( address ) _Debugger_->LastSourceCodeAddress = address ;
        if ( foundWord ) _Debugger_->LastScwi = foundWord->W_SC_Index ;
        return foundWord ;
    }
    return 0 ;
}

Boolean
SC_List_AdjustAddress ( dlnode * node, byte * address, byte * newAddress )
{
    Word * nword = ( Word* ) dobject_Get_M_Slot ( ( dobject* ) node, SCN_T_WORD ) ;
    if ( nword->S_WordData && ( nword->Coding == address ) )
    {
        Word_SetCoding ( nword, newAddress ) ;
        if ( nword->SourceCoding ) Word_SetSourceCoding ( nword, newAddress ) ;
        dobject_Set_M_Slot ( ( dobject* ) node, SCN_IN_USE_FLAG, SCN_IN_USE_FLAG_ALL ) ; // reset after CfrTil_AdjustDbgSourceCode_InUseFalse
        return true ;
    }
    return false ;
}

void
CfrTil_AdjustDbgSourceCodeAddress ( byte * address, byte * newAddress )
{
    dllist * list = _CfrTil_->Compiler_N_M_Node_WordList ;
    if ( list ) dllist_Map2 ( list, ( MapFunction2 ) SC_List_AdjustAddress, ( int64 ) address, ( int64 ) newAddress ) ;
}

#if 0

void
SC_List_Set_NotInUseForSC ( dlnode * node, byte * address )
{
    Word * word = ( Word* ) dobject_Get_M_Slot ( ( dobject* ) node, SCN_T_WORD ) ;
    if ( word->SourceCoding >= address ) dobject_Set_M_Slot ( ( dobject* ) node, SCN_IN_USE_FLAG, SCN_IN_USE_FOR_OPTIMIZATION ) ;
}

void
CfrTil_AdjustDbgSourceCode_ScInUseFalse ( byte * address )
{
    dllist * list = _CfrTil_->Compiler_N_M_Node_WordList ;
    if ( list ) dllist_Map1 ( list, ( MapFunction1 ) SC_List_Set_NotInUseForSC, ( int64 ) address ) ;
}
#endif

void
CheckRecycleWord ( Node * node )
{
    Word *w = ( Word* ) dobject_Get_M_Slot ( ( dobject* ) node, SCN_T_WORD ) ;
    _CheckRecycleWord ( w ) ;
}

void
DLList_Recycle_WordList ( dllist * list )
{
    dllist_Map ( list, ( MapFunction0 ) CheckRecycleWord ) ;
}

void
DLList_RecycleInit_WordList ( Word * word )
{
    dllist_Map ( word->W_SC_WordList, ( MapFunction0 ) CheckRecycleWord ) ;
    List_Init ( word->W_SC_WordList ) ;
}

void
_CfrTil_RecycleInit_Compiler_N_M_Node_WordList ( )
{
    if ( ( ! GetState ( _CfrTil_, ( RT_DEBUG_ON | DEBUG_SOURCE_CODE_MODE | GLOBAL_SOURCE_CODE_MODE ) ) ) )
    {
        DLList_Recycle_WordList ( _CfrTil_->Compiler_N_M_Node_WordList ) ;
    }
    List_Init ( _CfrTil_->Compiler_N_M_Node_WordList ) ;
}

void
CfrTil_WordList_Init ( Word * word )
{
    _CfrTil_RecycleInit_Compiler_N_M_Node_WordList ( ) ;
    if ( word )
    {
        if ( ! GetState ( _Compiler_, LISP_MODE ) ) word->W_SC_Index = 0 ; // before pushWord !
        CfrTil_WordList_PushWord ( word ) ; // for source code
    }
}

inline void
Word_SetSourceCoding ( Word * word, byte * address )
{
    word->SourceCoding = address ;
}

inline void
Word_SetCoding ( Word * word, byte * address )
{
    word->Coding = address ;
}

void
WordList_SetSourceCoding ( int64 index, byte * address )
{
    Word * word = WordStack ( index ) ;
    Word_SetSourceCoding ( word, address ) ;
}

void
Word_SetCodingAndSourceCoding ( Word * word, byte * address )
{
    Word_SetCoding ( word, address ) ;
    Word_SetSourceCoding ( word, address ) ;
}

void
WordList_SetCoding ( int64 index, byte * address )
{
    Word * word = WordStack ( index ) ;
    Word_SetCodingAndSourceCoding ( word, address ) ;
}

void
SC_ListClearAddress ( dlnode * node, byte * address )
{
    Word * nword = ( Word* ) dobject_Get_M_Slot ( ( dobject* ) node, SCN_T_WORD ) ;
    if ( nword->S_WordData && ( nword->SourceCoding == address ) ) //&& ( nword->W_SC_WordIndex != word->W_SC_WordIndex ) )
    {
        Word_SetSourceCoding ( nword, 0 ) ;
        d0 ( if ( Is_DebugModeOn ) _Printf ( ( byte* ) "\nnword %s with scwi %d :: cleared for word %s with scwi %d",
            nword->Name, nword->W_SC_Index, nword->Name, nword->W_SC_Index ) ) ;
    }
}

void
Compiler_Word_SetCoding_And_ClearPreviousUseOf_A_SCA ( Word * word, byte * coding, Boolean clearPreviousFlag )
{
    if ( Compiling && word )
    {
        if ( clearPreviousFlag ) dllist_Map1_FromEnd ( _CfrTil_->Compiler_N_M_Node_WordList, ( MapFunction1 ) SC_ListClearAddress, ( int64 ) coding ) ; //dllist_Map1_FromEnd ( _CfrTil_->CompilerWordList, ( MapFunction1 ) SC_ListClearAddress, ( int64 ) Here ) ; //( int64 ) word, ( int64 ) Here ) ;
        Word_SetCodingAndSourceCoding ( word, coding ) ;
    }
}

void
Compiler_SCA_Word_SetCodingHere_And_ClearPreviousUse ( Word * word, Boolean clearPreviousFlag )
{
    Compiler_Word_SetCoding_And_ClearPreviousUseOf_A_SCA ( word, Here, clearPreviousFlag ) ;
}

Word *
_CfrTil_WordList_TopWord ( )
{
    Word * word = 0 ;
    node * first = _dllist_First ( _CfrTil_->Compiler_N_M_Node_WordList ) ;
    if ( first ) word = ( Word* ) dobject_Get_M_Slot ( ( dobject* ) first, SCN_T_WORD ) ;
    return word ;
}

Word *
_CfrTil_WordList_PopWords ( int64 n )
{
    dllist * list = _CfrTil_->Compiler_N_M_Node_WordList ;
    dlnode * node, *nextNode ;
    Word * wordn = 0 ;
    if ( list )
    {
        for ( node = dllist_First ( ( dllist* ) list ) ; node && n ; node = nextNode, n -- )
        {
            nextNode = dlnode_Next ( node ) ;
            dobject * dobj = ( dobject * ) node ;
            wordn = ( Word* ) dobject_Get_M_Slot ( ( dobject* ) dobj, SCN_T_WORD ) ;
            if ( dobject_Get_M_Slot ( dobj, SCN_IN_USE_FLAG ) ) dobject_Set_M_Slot ( dobj, SCN_IN_USE_FLAG, 0 ) ;
        }
    }
    return wordn ;
}

Word *
CfrTil_WordLists_PopWord ( )
{
    Word * word = _CfrTil_WordList_PopWords ( 1 ) ;
    return word ;
}

void
CfrTil_WordList_Push ( Word * word, Boolean inUseFlag )
{
    _List_PushNew_ForWordList ( _CfrTil_->Compiler_N_M_Node_WordList, word, inUseFlag ) ;
}

void
_CfrTil_WordList_PushWord ( Word * word, int64 inUseFlag )
{
    CfrTil_WordList_Push ( word, inUseFlag ? SCN_IN_USE_FLAG_ALL : 0 ) ;
}

void
CfrTil_WordList_PushWord ( Word * word )
{
    _CfrTil_WordList_PushWord ( word,
#if 0 // old        
        ( ! ( word->CAttribute & ( NAMESPACE | OBJECT_OPERATOR | OBJECT_FIELD ) ) ) || ( word->CAttribute & ( DOBJECT | NAMESPACE_VARIABLE ) ) ) ;
#elif 0 // new        
        ( ! ( word->W_MorphismAttributes & ( OBJECT_OPERATOR ) )
        || ( word->W_ObjectAttributes & ( DOBJECT | NAMESPACE | OBJECT_FIELD | NAMESPACE_VARIABLE ) ) ) ) ;
#elif 1 // working ??    
        ( ( word->W_ObjectAttributes & ( DOBJECT | NAMESPACE_VARIABLE ) ) || ( ! ( ( word->W_MorphismAttributes & ( OBJECT_OPERATOR ) )
        || ( word->W_ObjectAttributes & ( NAMESPACE | OBJECT_FIELD ) ) ) ) ) ) ;
#endif    
}

// too many showWord functions ??

void
_DWL_ShowWord_Print ( Word * word, int64 index, byte * prefix, byte * coding, byte * sourceCoding, byte * newSourceCoding,
    int64 scwi, Boolean iuFlag )
{
    if ( word )
    {
        //int64 lastScwi = _Debugger_->LastSourceCodeWord ? _Debugger_->LastSourceCodeWord->W_SC_Index : 0 ;
        byte * name = String_ConvertToBackSlash ( word->Name ), *biuFlag = iuFlag ? ( byte* ) "true" : ( byte* ) "false" ;
        if ( newSourceCoding )
        {
            _Printf ( ( byte* ) "\n %s :: word = 0x%08x : \'%-12s\' : coding  = 0x%08x : oldCoding  = 0x%08x : newCoding = 0x%08x : scwi = %03d, inUse = %s",
                prefix, word, name, coding, sourceCoding, newSourceCoding, scwi, biuFlag ) ;
        }
        else if ( index )
        {
            _Printf ( ( byte* ) "\n WordList : index %3d : word = 0x%08x : \'%-12s\' : sourceCoding = 0x%08x : scwi = %03d : inUse = %s",
                index, word, name, sourceCoding, scwi, biuFlag ) ;
        }
        else //if ( scwiDiff )
        {
            _Printf ( ( byte* ) "\n %s :: \'%-12s\' : sourceCoding  = 0x%08x : scwi = %03d : inUse = %s",
                prefix, name, sourceCoding, scwi, biuFlag ) ;
        }
    }
}

void
DWL_ShowWord ( dlnode * anode, int64 index, int64 inUseOnlyFlag, int64 prefix, int64 scwiDiff )
{
    if ( anode )
    {
        Word * word = ( Word* ) dobject_Get_M_Slot ( ( dobject * ) anode, SCN_T_WORD ) ;
        int64 scwi = dobject_Get_M_Slot ( ( dobject* ) anode, SCN_SC_WORD_INDEX ) ;
        int64 iuFlag = dobject_Get_M_Slot ( ( dobject * ) anode, SCN_IN_USE_FLAG ) ;
        if ( word && ( ( ! inUseOnlyFlag ) || ( inUseOnlyFlag && iuFlag ) ) )
        {
            _DWL_ShowWord_Print ( word, index, ( byte* ) prefix, word->Coding, word->SourceCoding, 0, scwi, iuFlag ) ;
        }
    }
}

void
SC_WordList_Show ( dllist * list, Word * scWord, Boolean fromFirstFlag, Boolean inUseOnlyFlag, byte * listName )
{
    if ( scWord ) _Printf ( ( byte* ) "\n%s WordList : for word \'%s\' :", listName, scWord->Name ) ;
    if ( list ) dllist_Map4_FromFirstFlag_Indexed ( list, fromFirstFlag, DWL_ShowWord, inUseOnlyFlag, ( int64 ) "", 0 ) ;
}

// too much/many shows ?? combine some

void
CfrTil_WordList_Show ( Word * word, byte * prefix, Boolean inUseOnlyFlag, Boolean showInDebugColors )
{
    //dllist * list = Compiling ? _CfrTil_->Compiler_N_M_Node_WordList : ( word && word->W_SC_WordList ) ? word->W_SC_WordList : _CfrTil_->Compiler_N_M_Node_WordList ;
    dllist * list = ( word && word->W_SC_WordList ) ? word->W_SC_WordList : _CfrTil_->Compiler_N_M_Node_WordList ;
    byte *buffer = Buffer_Data ( _CfrTil_->ScratchB1 ) ;
    buffer[0] = 0 ;
    if ( list )
    {
        if ( Is_DebugModeOn || showInDebugColors ) NoticeColors ;
        if ( word )
        {
            sprintf ( ( char* ) buffer, "%sWord = %s = %lx :: list = %s %lx : %s", prefix ? prefix : ( byte* ) "", ( char* ) word->Name, ( int64 ) word,
                ( list == _CfrTil_->Compiler_N_M_Node_WordList ) ? "CfrTil WordList" : "source code word list = ", ( int64 ) list, inUseOnlyFlag ? "in use only" : "all" ) ;
        }
        SC_WordList_Show ( list, word, 0, inUseOnlyFlag, buffer ) ;
        if ( Is_DebugModeOn || showInDebugColors ) DefaultColors ;
    }
}

void
_CfrTil_SC_WordList_Show ( byte * prefix, Boolean inUseOnlyFlag, Boolean showInDebugColors )
{
    Word * scWord = Get_SourceCodeWord ( ) ;
    CfrTil_WordList_Show ( scWord, prefix, inUseOnlyFlag, showInDebugColors ) ;
}

void
CfrTil_SC_WordList_Show ( )
{
    _CfrTil_SC_WordList_Show ( 0, 0, 0 ) ;
}

void
CfrTil_DbgSourceCodeOff ( )
{
    SetState ( _CfrTil_, GLOBAL_SOURCE_CODE_MODE, false ) ;
}

void
CfrTil_DbgSourceCodeOn ( )
{
    SetState ( _CfrTil_, GLOBAL_SOURCE_CODE_MODE, true ) ;
}

void
CfrTil_DbgSourceCodeOn_Global ( )
{
    SetState ( _CfrTil_, ( DEBUG_SOURCE_CODE_MODE | GLOBAL_SOURCE_CODE_MODE ), true ) ;
}

void
CfrTil_DbgSourceCodeOff_Global ( )
{
    SetState ( _CfrTil_, ( DEBUG_SOURCE_CODE_MODE | GLOBAL_SOURCE_CODE_MODE ), false ) ;
}

// debug source code functions (above)
//=================================================
// text source code functions (below)

void
_CfrTil_AddStringToSourceCode ( CfrTil * cfrtil, byte * str )
{
    if ( str )
    {
        strcat ( ( char* ) cfrtil->SC_Buffer, ( char* ) str ) ;
        strcat ( ( CString ) cfrtil->SC_Buffer, ( CString ) " " ) ;
    }
}

void
CfrTil_AddStringToSourceCode ( CfrTil * cfrtil, byte * str )
{
    _CfrTil_AddStringToSourceCode ( cfrtil, str ) ;
    cfrtil->SC_Index += ( Strlen ( ( char* ) str ) + 1 ) ; // 1 : add " " (above)
}

void
_CfrTil_SC_ScratchPadIndex_Init ( CfrTil * cfrtil )
{
    cfrtil->SC_Index = Strlen ( ( char* ) _CfrTil_->SC_Buffer ) ;
}

// don't be confused by SourceCode_Init is different from InitSourceCode
void
_CfrTil_SourceCode_Init ( CfrTil * cfrtil )
{
    if ( GetState ( _CfrTil_, SOURCE_CODE_ON ) )
    {
        cfrtil->SC_Buffer [ 0 ] = 0 ;
        cfrtil->SC_Index = 0 ;
        SetState ( cfrtil, SOURCE_CODE_STARTED, false ) ;
    }
}

void
CfrTil_SourceCode_InitStart ( CfrTil * cfrtil )
{
    if ( GetState ( _CfrTil_, SOURCE_CODE_ON ) )
    {
        _CfrTil_SourceCode_Init ( cfrtil ) ;
        cfrtil->SCI.SciFileIndexScStart = _ReadLiner_->FileCharacterNumber ;
        SetState ( cfrtil, SOURCE_CODE_STARTED, true ) ;
    }
}

void
_CfrTil_InitSourceCode ( CfrTil * cfrtil )
{
    if ( GetState ( _CfrTil_, SOURCE_CODE_ON ) )
    {
        CfrTil_SourceCode_InitStart ( cfrtil ) ;
        Lexer_SourceCodeOn ( _Context_->Lexer0 ) ;
    }
}

void
CfrTil_InitSourceCode ( CfrTil * cfrtil )
{
    if ( GetState ( _CfrTil_, SOURCE_CODE_ON ) )
    {
        _CfrTil_InitSourceCode ( cfrtil ) ;
        _CfrTil_SC_ScratchPadIndex_Init ( cfrtil ) ;
    }
}

void
CfrTil_InitSourceCode_WithName ( CfrTil * cfrtil, byte * name, Boolean force )
{
    if ( force || ( GetState ( _CfrTil_, SOURCE_CODE_ON ) && ( ( ! Compiling ) || ( ! ( GetState ( cfrtil, SOURCE_CODE_STARTED ) ) ) ) ) )
    {
        _CfrTil_InitSourceCode ( cfrtil ) ;
        _CfrTil_AddStringToSourceCode ( cfrtil, name ) ;
        _CfrTil_SC_ScratchPadIndex_Init ( cfrtil ) ;
    }
}

void
CfrTil_InitSourceCode_WithCurrentInputChar ( CfrTil * cfrtil, Boolean force )
{
    if ( force || ( GetState ( _CfrTil_, SOURCE_CODE_ON ) && ( ( ! Compiling ) || ( ! ( GetState ( cfrtil, SOURCE_CODE_STARTED ) ) ) ) ) )
    {
        Lexer * lexer = _Context_->Lexer0 ;
        _CfrTil_InitSourceCode ( cfrtil ) ;
        _Lexer_AppendCharToSourceCode ( lexer, lexer->TokenInputByte, 0 ) ;
    }
}

void
CfrTil_SourceCode_Init ( )
{
    Word * word = _Interpreter_->w_Word ;
    CfrTil_InitSourceCode_WithName ( _CfrTil_, word ? word->Name : 0, 1 ) ;
}

void
CfrTil_Lexer_SourceCodeOn ( )
{
    Lexer_SourceCodeOn ( _Context_->Lexer0 ) ;
}

byte *
_CfrTil_GetSourceCode ( )
{
    byte * sc = String_New_SourceCode ( _CfrTil_->SC_Buffer ) ;
    return sc ;
}

void
_CfrTil_SetSourceCodeWord ( Word * word )
{
    _CfrTil_->SCI.SciWord = word ; //SC_Word = word ;
}

void
CfrTil_SetSourceCodeWord ( )
{
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    _CfrTil_SetSourceCodeWord ( word ) ;
}

void
CfrTil_Finish_WordSourceCode ( CfrTil * cfrtil, Word * word )
{
    if ( ! word->W_SourceCode ) word->W_SourceCode = _CfrTil_GetSourceCode ( ) ;
    Lexer_SourceCodeOff ( _Lexer_ ) ;
    //cfrtil->SCI.SciFileIndexScEnd = _ReadLiner_->FileCharacterNumber ;
    word->SC_FileIndex_Start = cfrtil->SCI.SciFileIndexScStart ;
    word->SC_FileIndex_End = cfrtil->SCI.SciFileIndexScEnd ;
    _CfrTil_SourceCode_Init ( cfrtil ) ;
}

void
SCN_Set_NotInUse ( dlnode * node )
{
    dobject_Set_M_Slot ( ( dobject* ) node, SCN_IN_USE_FLAG, 0 ) ;
}

void
SCN_Set_NotInUseForOptimization ( dlnode * node )
{
    dobject_Set_M_Slot ( ( dobject* ) node, SCN_IN_USE_FLAG, SCN_IN_USE_FOR_SOURCE_CODE ) ;
}
// the logic needs to be reworked with recycling in these functions

void
_CfrTil_UnAppendFromSourceCode_NChars ( CfrTil * cfrtil, int64 nchars )
{
    int64 plen = Strlen ( ( CString ) cfrtil->SC_Buffer ) ;
    if ( plen >= nchars ) cfrtil->SC_Buffer [ Strlen ( ( CString ) cfrtil->SC_Buffer ) - nchars ] = 0 ;
    _CfrTil_SC_ScratchPadIndex_Init ( cfrtil ) ;
}

void
_CfrTil_UnAppendTokenFromSourceCode ( CfrTil * cfrtil, byte * tkn )
{
    if ( GetState ( _Lexer_, ( ADD_TOKEN_TO_SOURCE | ADD_CHAR_TO_SOURCE ) ) ) _CfrTil_UnAppendFromSourceCode_NChars ( cfrtil, Strlen ( ( CString ) tkn ) + 1 ) ;
}

void
_CfrTil_AppendCharToSourceCode ( CfrTil * cfrtil, byte c )
{
    cfrtil->SC_Buffer [ cfrtil->SC_Index ++ ] = c ;
    cfrtil->SC_Buffer [ cfrtil->SC_Index ] = 0 ;
}

void
CfrTil_AppendCharToSourceCode ( CfrTil * cfrtil, byte c )
{
    if ( cfrtil->SC_Index < ( SOURCE_CODE_BUFFER_SIZE - 1 ) )
    {
        if ( c == '"' )
        {
            if ( cfrtil->SC_QuoteMode ) cfrtil->SC_QuoteMode = 0 ;
            else cfrtil->SC_QuoteMode = 1 ;
            _CfrTil_AppendCharToSourceCode ( cfrtil, c ) ;
        }
        else _String_AppendConvertCharToBackSlash ( cfrtil->SC_Buffer, c, &cfrtil->SC_Index, true ) ;
    }
}

Word *
Get_SourceCodeWord ( )
{
    Debugger * debugger = _Debugger_ ;
    Word * scWord ;
    if ( ! ( scWord = _Context_->CurrentDisassemblyWord ) )
    {
        if ( GetState ( debugger, DBG_STEPPING ) ) scWord = debugger->w_Word ;
        if ( ( ! scWord ) && ( ! ( scWord = GetState ( _Compiler_, ( COMPILE_MODE | ASM_MODE ) ) ?
            _Context_->CurrentWordBeingCompiled : _CfrTil_->LastFinished_Word ?
            _CfrTil_->LastFinished_Word : _CfrTil_->SC_Word ? _CfrTil_->SC_Word : _Compiler_->Current_Word_Create ) ) )
        {
            if ( debugger && Is_DebugOn )
            {
                if ( debugger->LastPostShowWord ) scWord = debugger->LastPostShowWord ;
                else scWord = Word_GetFromCodeAddress ( debugger->DebugAddress ) ;
            }
        }
    }
    return (scWord && scWord->S_WordData ) ? scWord : 0 ;
}

#if 0

void
CfrTil_SourceCodeCompileOn_Colon ( )
{
    CfrTil_DbgSourceCodeOn ( ) ;
    CfrTil_SourceCode_Init ( ) ;
    //CfrTil_WordList_RecycleInit ( _CfrTil_ ) 
    if ( ! GetState ( _Context_, C_SYNTAX ) ) _CfrTil_Colon ( 0 ) ;
}

void
CfrTil_SourceCodeCompileOff_SemiColon ( )
{
    CfrTil_DbgSourceCodeOff ( ) ;
    if ( ! GetState ( _Context_, C_SYNTAX ) ) CfrTil_SemiColon ( ) ;
}

void
CfrTil_DbgSourceCodeBeginBlock ( )
{
    SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, true ) ;
    _SC_Global_On ;
    if ( ! GetState ( _Context_, C_SYNTAX ) ) CfrTil_BeginBlock ( ) ;
}

void
CfrTil_DbgSourceCodeEndBlock ( )
{
    if ( ! GetState ( _Context_, C_SYNTAX ) ) CfrTil_EndBlock ( ) ;
    CfrTil_DbgSourceCodeOff ( ) ;
}

#endif

