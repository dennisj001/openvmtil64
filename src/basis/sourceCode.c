
#include "../include/cfrtil64.h"

void
SC_ShowDbgSourceCodeWord_Or_AtAddress (Word * scWord, byte * address)
{
    // ...source code source code TP source code source code ... EOL
    if ( ! Compiling )
    {
        if ( ! scWord ) scWord = Get_SourceCodeWord ( ) ;
        if ( scWord )
        {
            dllist * list = scWord->W_SC_WordList ? scWord->W_SC_WordList : _CfrTil_->Compiler_N_M_Node_WordList ; //&& ( scWord->W_SC_MemSpaceRandMarker == _Q_->MemorySpace0->TempObjectSpace->InitFreedRandMarker ) ) ? scWord->W_SC_WordList : 0 ; //_CfrTil_->CompilerWordList ;
            if ( list )
            {
                byte *sourceCode = scWord->W_SourceCode ? scWord->W_SourceCode : String_New ( _CfrTil_->SC_Buffer, TEMPORARY ) ;
                if ( ! String_Equal ( sourceCode, "" ) )
                {
                    int64 fixed = 0 ;
                    Word * word = DWL_Find ( list, 0, address, 0, 0, 0, 0 ) ;
                    if ( word ) //&& ( debugger->LastSourceCodeWord != word ) )
                    {
                        //debugger->LastSourceCodeWord = word ;
                        d0 ( Debugger_WordList_Show_All ( ) ) ;

                        if ( ( scWord->WAttribute & WT_C_SYNTAX ) && ( String_Equal ( word->Name, "store" ) || String_Equal ( word->Name, "poke" ) ) )
                        {
                            word->Name = ( byte* ) "=" ;
                            fixed = 1 ;
                        }

                        byte * buffer = SC_PrepareDbgSourceCodeString ( sourceCode, word ) ;
                        if ( buffer ) _Printf ( ( byte* ) "\n%s", buffer ) ;
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
        if ( ! word ) word = Get_SourceCodeWord ( ) ; //_CfrTil_->ScWord ;
        SC_ShowDbgSourceCodeWord_Or_AtAddress (word, address) ;
        return true ;
    }
    return false ;
}

Boolean
SC_IsWord_BlockOrCombinator ( Word * word )
{
    if ( word && ( ( word->Name[0] == '{' ) || ( word->Name[0] == '}' )
        || ( word->CAttribute & ( COMBINATOR ) ) || ( word->CAttribute2 & ( SYNTACTIC ) ) ) ) return true ;
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
            if ( ( ! aFoundWord->S_WordData ) || ( ! ( iuFlag & SCN_IN_USE_FOR_SOURCE_CODE ) ) ) continue ;
            scwi = dobject_Get_M_Slot ( ( dobject* ) anode, SCN_SC_WORD_INDEX ) ;
            naddress = aFoundWord->SourceCoding ;
            if ( iword && ( aFoundWord == iword ) ) return aFoundWord ;
            //if ( Compiling && ( ! GetState ( _Debugger_, DBG_DISASM_ACC ) ) && _Debugger_->w_Word
            //    && ( aFoundWord == _Debugger_->w_Word ) ) return aFoundWord ;
            //else
            {
                if ( ( _Q_->Verbosity > 3 ) ) DWL_ShowWord ( anode, i, 0, ( int64 ) "afound", fDiff ) ;
                if ( address && ( address == naddress ) )
                {
                    //if ( address == ( byte* ) 0x7ffff72fa09c ) _Printf ( ( byte* ) "" ) ;
                    numFound ++ ;
                    fDiff = abs ( scwi - lastScwi ) ;
                    aFoundWord->W_SC_Index = scwi ; // not sure exactly why this is necessary but it is important for now??
                    if ( ( _Q_->Verbosity > 2 ) ) DWL_ShowWord ( anode, i, 0, ( int64 ) "FOUND", fDiff ) ;
                    if ( ( aFoundWord->CAttribute & LITERAL ) && ( aFoundWord->Coding[1] == 0xb9 ) )
                    {
                        foundWord = aFoundWord ;
                        minDiffFound = fDiff ;
                    }
                    else if ( ( aFoundWord->CAttribute & CATEGORY_PLUS_PLUS_MINUS_MINUS ) && ( aFoundWord->Coding[1] == 0xff ) )
                    {
                        foundWord = aFoundWord ;
                        break ;
                    }
#if 1               
                    else if ( SC_IsWord_MatchCorrectConsideringBlockOrCombinator ( aFoundWord ) )
                    {
                        foundWord = aFoundWord ;
                        minDiffFound = fDiff ;
                    }
#endif                
                    else if ( ( fDiff < minDiffFound ) && SC_IsWord_MatchCorrectConsideringBlockOrCombinator ( aFoundWord ) )//|| SC_IsWord_MatchCorrectConsideringBlockOrCombinator ( foundWord ) || ( ! SC_IsWord_MatchCorrectConsideringBlockOrCombinator ( aFoundWord ) ) )
                    {
                        foundWord = aFoundWord ;
                        minDiffFound = fDiff ;
                    }
                    else if ( ! foundWord ) maybeFoundWord = aFoundWord ;
                    if ( takeFirstFind ) break ;
                }
            }
        }
        if ( ( ! foundWord ) && maybeFoundWord ) foundWord = maybeFoundWord ;
    }
    if ( ( ! newAddress ) && ( numFound ) )
    {
        if ( ( foundWord ) && ( _Q_->Verbosity > 2 ) )
        {
            //_Printf ( ( byte* ) "\nNumber Found = %d :: minDiffFound = %d : window = %d : Chosen word = \'%s\' : LastSourceCodeWord = \'%s\'", numFound, minDiffFound, fDiff, foundWord->Name, _Debugger_->LastSourceCodeWord ? _Debugger_->LastSourceCodeWord->Name : ( byte* ) "" ) ;
            _DWL_ShowWord_Print ( foundWord, 0, ( byte* ) "CHOSEN", foundWord->Coding, foundWord->SourceCoding, 0, foundWord->W_SC_Index, minDiffFound, 1 ) ; //_DWL_ShowWord ( foundWord, "CHOSEN", minDiffFound ) ;
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
        ( ! ( word->CAttribute & ( NAMESPACE | OBJECT_OPERATOR | OBJECT_FIELD ) ) ) || ( word->CAttribute & ( DOBJECT | NAMESPACE_VARIABLE ) ) ) ;
}

// too many showWord functions ??

void
_DWL_ShowWord_Print ( Word * word, int64 index, byte * prefix, byte * coding, byte * sourceCoding, byte * newSourceCoding,
    int64 scwi, int64 scwiDiff, Boolean iuFlag )
{
    if ( word )
    {
        int64 lastScwi = _Debugger_->LastSourceCodeWord ? _Debugger_->LastSourceCodeWord->W_SC_Index : 0 ;
        byte * name = String_ConvertToBackSlash ( word->Name ), *biuFlag = iuFlag ? ( byte* ) "true" : ( byte* ) "false" ;
        if ( newSourceCoding )
        {
            _Printf ( ( byte* ) "\n %s :: word = 0x%08x : \'%-12s\' : coding  = 0x%08x : oldCoding  = 0x%08x : newCoding = 0x%08x : lastScwi = %03d : scwi = %03d, inUse = %s",
                prefix, word, name, coding, sourceCoding, newSourceCoding, lastScwi, scwi, biuFlag ) ;
        }
        else if ( index )
        {
            _Printf ( ( byte* ) "\n WordList : index %3d : word = 0x%08x : \'%-12s\' : sourceCoding = 0x%08x : lastScwi = %03d : scwi = %03d, scwiDiff = %03d : inUse = %s",
                index, word, name, sourceCoding, lastScwi, scwi, scwiDiff, biuFlag ) ;
        }
        else //if ( scwiDiff )
        {
            _Printf ( ( byte* ) "\n %s :: \'%-12s\' : sourceCoding  = 0x%08x : lastScwi = %03d : scwi = %03d, scwiDiff = %03d : inUse = %s",
                prefix, name, sourceCoding, lastScwi, scwi, scwiDiff, biuFlag ) ;
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
            _DWL_ShowWord_Print ( word, index, ( byte* ) prefix, word->Coding, word->SourceCoding, 0, scwi, scwiDiff, iuFlag ) ;
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
Compiler_WordList_Show ( Word * word, byte * prefix, Boolean inUseOnlyFlag, Boolean showInDebugColors )
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
            sprintf ( ( char* ) buffer, "%sWord = %s = %lx :: list = %s : %s", prefix ? prefix : ( byte* ) "", ( char* ) word->Name, ( int64 ) word, 
                ( list == _CfrTil_->Compiler_N_M_Node_WordList ) ? "CfrTil WordList" : "source code word list for the word", inUseOnlyFlag ? "in use only" : "all" ) ;
        }
        SC_WordList_Show ( list, word, 0, inUseOnlyFlag, buffer ) ;
        if ( Is_DebugModeOn || showInDebugColors ) DefaultColors ;
    }
}

void
Compiler_SC_WordList_Show ( byte * prefix, Boolean inUseOnlyFlag, Boolean showInDebugColors )
{
    Word * scWord = Get_SourceCodeWord ( ) ;
    Compiler_WordList_Show ( scWord, prefix, inUseOnlyFlag, showInDebugColors ) ;
}

void
Debugger_WordList_Show_All ( Debugger * debugger )
{
    Compiler_SC_WordList_Show ( 0, 0, 0 ) ;
}

void
Debugger_WordList_Show_InUse ( Debugger * debugger )
{
    Compiler_SC_WordList_Show ( 0, 1, 0 ) ;
}

void
Debugger_ShowTypeWordStack ( Debugger * debugger )
{
    CfrTil_ShowTypeWordStack ( ) ;
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

void
CfrTil_SourceCode_InitEnd ( CfrTil * cfrtil )
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
        CfrTil_SourceCode_InitEnd ( cfrtil ) ;
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
    if ( force || ( GetState ( _CfrTil_, SOURCE_CODE_ON ) && ( ! ( GetState ( cfrtil, SOURCE_CODE_STARTED ) ) ) ) )
    {
        _CfrTil_InitSourceCode ( cfrtil ) ;
        _CfrTil_AddStringToSourceCode ( cfrtil, name ) ;
        _CfrTil_SC_ScratchPadIndex_Init ( cfrtil ) ;
    }
}

void
CfrTil_InitSourceCode_WithCurrentInputChar ( CfrTil * cfrtil, Boolean force )
{
    if ( force || ( GetState ( _CfrTil_, SOURCE_CODE_ON ) && ( ! ( GetState ( cfrtil, SOURCE_CODE_STARTED ) ) ) ) )
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
    _CfrTil_->ScWord = word ;
}

void
CfrTil_SetSourceCodeWord ( )
{
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    _CfrTil_SetSourceCodeWord ( word ) ;
}

void
_CfrTil_Finish_WordSourceCode ( CfrTil * cfrtil, Word * word )
{
    if ( ! word->W_SourceCode ) word->W_SourceCode = _CfrTil_GetSourceCode ( ) ;
    Lexer_SourceCodeOff ( _Lexer_ ) ;
    CfrTil_SourceCode_InitEnd ( cfrtil ) ;
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
CfrTil_FinishSourceCode ( CfrTil * cfrtil, Word * word )
{
    _CfrTil_Finish_WordSourceCode ( cfrtil, word ) ;
}

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
        if ( ! (scWord = GetState ( _Compiler_, ( COMPILE_MODE | ASM_MODE ) ) ?
            _Context_->CurrentWordBeingCompiled : _CfrTil_->LastFinished_Word ?
            _CfrTil_->LastFinished_Word : _CfrTil_->ScWord ? _CfrTil_->ScWord : _Compiler_->CurrentCreatedWord ))
        {
            if ( debugger && Is_DebugOn )
            {
                if ( debugger->LastEffectsWord ) scWord = debugger->LastEffectsWord ;
                else scWord = Word_GetFromCodeAddress ( debugger->DebugAddress ) ;
            }
        }
    }
    return (scWord && scWord->S_WordData ) ? scWord : 0 ;
}

// ...source code source code TP source code source code ... EOL

byte *
SC_PrepareDbgSourceCodeString ( byte * sc, Word * word ) // sc : source code ; scwi : source code word index
{
    byte * cc_line ;
    if ( sc && word )
    {
        byte *nvw, * token0 = word->Name, *token ;
        int64 scwi0, i, tw, slt, tp, lef, leftBorder, ts, rightBorder, ref, slsc, scwci, pad ; // ts : tokenStart ; tp : text point - where we want to start source code text to align with disassembly ; ref : right ellipsis flag
        token = String_ConvertToBackSlash ( token0 ) ;
        tw = Debugger_TerminalLineWidth ( _Debugger_ ) ;
        slt = Strlen ( token ) ;
        slsc = strlen ( ( char* ) sc ) ;
        scwi0 = word->W_SC_Index ;
        scwci = String_FindStrnCmpIndex ( sc, token, scwi0, slt, slt ) ; //( ( slsc - scwi0 ) > 30 ) ? 30 : ( slsc - scwi0 ) ) ;
        if ( scwci == - 1 ) return 0 ;
        d0 ( byte * scspp0 = & sc [ scwi0 ] ) ;
        d0 ( byte * scspp2 = & sc [ scwci ] ) ;
        nvw = Buffer_New_pbyte ( ( slsc > BUFFER_SIZE ) ? slsc : BUFFER_SIZE ) ;
        tp = 42 ;
        if ( ( slsc > tp ) && ( scwci > tp ) )
        {
            lef = 4 ;
            leftBorder = ts = tp ;
            rightBorder = tw - ( ts + slt ) ;
            ref = ( slsc - 4 ) > tw ? 4 : 0 ;
            Strncpy ( nvw, & sc [scwci - tp], tw - ( lef + ref ) ) ;
        }
        else
        {
            pad = tp - scwci ;
            if ( pad >= 4 ) lef = 4 ;
            else lef = 0 ;
            for ( i = 0 ; i < pad ; i ++ ) strcat ( ( char* ) nvw, " " ) ;
            leftBorder = ts = tp ;
            ref = ( slsc - 4 ) > tw ? 4 : 0 ;
            if ( ( ! ref ) && ( tw > slsc - 4 ) ) ref = 4 ;
            rightBorder = tw - ( tp + slt ) - ref ;
            Strncat ( nvw, sc, tw - ( lef + pad + ref ) ) ; // must Strncat because we might have done a strcat above based on the 'pad' variable
        }
        int64 svState = GetState ( _Debugger_, DEBUG_SHTL_OFF ) ;
        SetState ( _Debugger_, DEBUG_SHTL_OFF, false ) ;
        // |ilw...------ inputLine  -----|lef|--- leftBorder ---|---token---|---  rightBorder  ---|ref|------ inputLine -----...ilw| -- ilw : inputLine window
        // |ilw...------ inputLine  -----|lef|pad?|-------------|tp|---token---|---  rightBorder  ---|ref|------ inputLine -----...ilw| -- ilw : inputLine window
        //_String_HighlightTokenInputLine ( byte * nvw, int8 lef, int64 leftBorder, int64 tokenStart, byte *token, int64 rightBorder, int8 ref )
        cc_line = _String_HighlightTokenInputLine ( nvw, lef, leftBorder, ts, token, rightBorder, ref ) ; // nts : new token start is a index into b - the nwv buffer
        SetState ( _Debugger_, DEBUG_SHTL_OFF, svState ) ;
    }
    else cc_line = ( byte* ) "" ;
    return cc_line ;
}
