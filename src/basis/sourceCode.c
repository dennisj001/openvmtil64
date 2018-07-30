
#include "../include/cfrtil64.h"

/*
 * 
 * Compiler Word List has nodes (CWLNs) with 2 slots one for the *word and one for a pointer to a Source Code Node (SCN) which has source code index info.
 * CWLN : slot 0 word, slot 1 SCN
 * Source code nodes (SCNs) have three slots for the source code byte index, the code address, and a pointer to the word, they are on the _CfrTil_->DebugWordList.
 * SCN : slot 0 : SCN_WORD, slot 1 : SCN_WORD_SC_INDEX, slot 2 : address is SCN_WORD->Coding = word->Coding
 * So, they each have pointers to each other.
 * 
 */
Word *
DWL_Find ( dllist * list, Word * iword, byte * address, byte* name, int64 takeFirstFind, byte * newAddress, int64 fromFirstFlag ) // nb fromTop is from the end of the list because it is the top 'push'
{
    byte * naddress, iuFlag ;
    Word * nword, *aFoundWord = 0, *foundWord = 0 ;
    dlnode * anode = 0 ;
    int64 numFound = 0, i ;
    uint64 fwDiff = - 1, fDiff = 0, minDiffFound = 0, scwi ;
    //_Q_->Verbosity = 3 ;
    if ( list && ( iword || name || address ) )
    {
        for ( i = 0, anode = fromFirstFlag ? dllist_First ( list ) : dllist_Last ( list ) ; anode ;
            anode = fromFirstFlag ? dlnode_Next ( anode ) : dlnode_Previous ( anode ), i ++ )
        {
            nword = ( Word* ) dobject_Get_M_Slot ( anode, SCN_WORD ) ;
            naddress = nword->SourceCoding ;
            scwi = dobject_Get_M_Slot ( anode, SCN_SC_WORD_INDEX ) ; 
            iuFlag = dobject_Get_M_Slot ( anode, SCN_IN_USE_FLAG ) ;
            if ( ! iuFlag ) continue ;
            if ( iword && ( nword == iword ) ) return nword ;
            if ( Compiling && ( ! GetState ( _Debugger_, DBG_DISASM_ACC ) ) && _Debugger_->w_Word && ( nword == _Debugger_->w_Word ) ) return nword ;
            else if ( address && ( address == naddress ) && ( address == nword->Coding ) )
            {
                numFound ++ ;
                aFoundWord = nword ;
                if ( foundWord )
                {
                    // remember there are probably many words with this compiled at address because we don't remove when we rewrite code
                    fDiff = abs ( scwi - foundWord->W_SC_Index ) ;
                    if ( ( ( foundWord->CAttribute2 & BLOCK_DELIMITER ) || // prevent using a block delimiter when there is code starting or ending the block
                        ( ! ( aFoundWord->CAttribute2 & BLOCK_DELIMITER ) ) )
                        //&& ( scwi < foundWord->W_SC_Index ) 
                        )
                    {
#if 1
                        foundWord = aFoundWord ;
#else                  
                        if ( fDiff < fwDiff )
                        {
                            foundWord = aFoundWord ;
                            fwDiff = fDiff ;
                        }
                        else if ( ! fwDiff ) fwDiff = fDiff ;
#endif                        
                    }
                }
                else
                {
                    foundWord = aFoundWord ;
                    fwDiff = fDiff = scwi ;
                }
                if ( ( ! minDiffFound ) || ( fDiff < minDiffFound ) ) minDiffFound = fDiff ;
                if ( ( _Q_->Verbosity > 2 ) )
                {
                    d1 ( if ( Is_DebugModeOn ) DWL_ShowWord ( anode, i, 0, ( int64 ) "FOUND", fDiff ) ) ;
                    //d1 ( DWL_ShowWord ( anode, i, 0, ( int64 ) "FOUND", fDiff ) ) ;
                }
                if ( foundWord && takeFirstFind ) break ;
            }
        }
    }
    if ( ( ! newAddress ) && ( numFound ) )
    {
        if ( ( foundWord ) && ( _Q_->Verbosity > 2 ) )
        {
            _Printf ( ( byte* ) "\nNumber Found = %d :: minDiffFound = %d : window = %d : Choosen node = %s :", numFound, minDiffFound, fDiff, foundWord->Name ) ;
            _DWL_ShowWord_Print (foundWord, 0, "CHOSEN", foundWord->Coding, foundWord->SourceCoding, 0, minDiffFound, 1 ) ; //_DWL_ShowWord ( foundWord, "CHOSEN", minDiffFound ) ;
        }
        if ( address ) _Debugger_->LastSourceCodeAddress = address ;
        if ( foundWord ) _Debugger_->LastSourceCodeIndex = foundWord->W_SC_Index ;
        return foundWord ;
    }
    return 0 ;
}

// DWL - DebugWordList : _CfrTil_->DebugWordList 

void
_CfrTil_AdjustDbgSourceCodeAddress ( byte * address, byte * newAddress )
{
    dllist * list = _CfrTil_->CompilerWordList ;
    if ( list ) dllist_Map2 ( list, ( MapFunction2 ) SC_List_AdjustAddress, ( int64 ) address, ( int64 ) newAddress ) ;
}

void
CfrTil_WordList_PushWord ( Word * word )
{
    CompilerWordList_Push ( word, ( ! ( word->CAttribute & ( NAMESPACE | OBJECT_OPERATOR | OBJECT_FIELD ) ) ) || ( word->CAttribute & ( DOBJECT ) ) ) ; //_List_PushNew ( _CfrTil_->CompilerWordList, word ) ;
}

void
Word_SetCoding ( Word * word, byte * address, Boolean setCodingFlag )
{
    if ( setCodingFlag ) word->Coding = address ;
    word->SourceCoding = address ;
}

void
WordList_SetCoding ( int64 index, byte * address )
{
    Word * word = WordStack ( index ) ;
    Word_SetCoding ( word, address, 1 ) ;
}

void
SC_List_AdjustAddress ( dlnode * node, byte * address, byte * newAddress )
{
    Word * nword = ( Word* ) dobject_Get_M_Slot ( node, SCN_WORD ) ;
    //int64 scwi = dobject_Get_M_Slot ( node, SCN_SC_WORD_INDEX ) ; //nword->W_SC_WordIndex ;
    if ( ( nword->Coding == address ) ) //&& ( nword->W_SC_WordIndex != word->W_SC_WordIndex ) )
    {
        //dllist_Map1_FromEnd ( _CfrTil_->CompilerWordList, ( MapFunction1 ) SC_ListClearAddress, ( int64 ) address ) ;
        Word_SetCoding ( nword, newAddress, 1 ) ;
        d0 ( if ( Is_DebugModeOn ) _Printf ( ( byte* ) "\nnword %s with scwi %d :: cleared for word %s with scwi %d",
            nword->Name, nword->W_SC_Index, nword->Name, nword->W_SC_Index ) ) ;
        //if ( _Q_->Verbosity > 2 )
        {
            d0 ( if ( Is_DebugModeOn ) _DWL_ShowWord_Print (nword, 0, "CODING ADJUST", 0, address, newAddress, 0, 1 ) ) ;
        }
    }
}

void
SC_ListClearAddress ( dlnode * node, byte * address )
{
    Word * nword = ( Word* ) dobject_Get_M_Slot ( node, SCN_WORD ) ;
    //int64 scwi = dobject_Get_M_Slot ( node, SCN_SC_WORD_INDEX ) ; //nword->W_SC_WordIndex ;
    if ( ( nword->SourceCoding == address ) ) //&& ( nword->W_SC_WordIndex != word->W_SC_WordIndex ) )
    {
        Word_SetCoding ( nword, 0, 0 ) ;
        d0 ( if ( Is_DebugModeOn ) _Printf ( ( byte* ) "\nnword %s with scwi %d :: cleared for word %s with scwi %d",
            nword->Name, nword->W_SC_Index, nword->Name, nword->W_SC_Index ) ) ;
    }
}

void
_Word_Clear_PreviousUseOf_A_SCA ( Word * word, byte * coding )
{
    if ( Compiling && word )
    {
        dllist_Map1_FromEnd ( _CfrTil_->CompilerWordList, ( MapFunction1 ) SC_ListClearAddress, ( int64 ) coding ) ;
        Word_SetCoding ( word, coding, 1 ) ;
    }
}

void
Word_Clear_PreviousUseOf_A_SCA ( Word * word )
{
    _Word_Clear_PreviousUseOf_A_SCA ( word, word->Coding ) ;
}

void
_Word_SetCoding_And_ClearPreviousUseOf_A_SCA ( Word * word, byte * index, Boolean clearPreviousFlag )
{
    if ( Compiling && word )
    {
        if ( clearPreviousFlag ) _Word_Clear_PreviousUseOf_A_SCA ( word, index ) ; //dllist_Map1_FromEnd ( _CfrTil_->CompilerWordList, ( MapFunction1 ) SC_ListClearAddress, ( int64 ) Here ) ; //( int64 ) word, ( int64 ) Here ) ;
        else Word_SetCoding ( word, index, 1 ) ;
    }
}

void
Word_SetCodingHere_And_ClearPreviousUseOf_This_SCA ( Word * word, Boolean clearPreviousFlag )
{
    _Word_SetCoding_And_ClearPreviousUseOf_A_SCA ( word, Here, clearPreviousFlag ) ;
}

Word *
_CfrTil_WordList_TopWord ( )
{
    Word * word = 0 ;
    node * first = _dllist_First ( _CfrTil_->CompilerWordList ) ;
    if ( first ) word = ( Word* ) dobject_Get_M_Slot ( first, SCN_WORD ) ;
    return word ;
}

void
_CfrTil_WordList_PopWords ( int64 n )
{
    dllist * list = _CfrTil_->CompilerWordList ;
    dlnode * node, *nextNode ;
    if ( list )
    {
        for ( node = dllist_First ( ( dllist* ) list ) ; node && n ; node = nextNode, n -- )
        {
            nextNode = dlnode_Next ( node ) ;
            dobject * dobj = ( dobject * ) node ;
            if ( dobject_Get_M_Slot ( dobj, SCN_IN_USE_FLAG ) ) dobject_Set_M_Slot ( dobj, SCN_IN_USE_FLAG, 0 ) ;
        }
    }
}

void
CfrTil_WordLists_PopWord ( )
{
    _CfrTil_WordList_PopWords ( 1 ) ;
}

// too many showWord functions 

void
_DWL_ShowWord_Print (Word * word, int64 index, byte * prefix, byte * coding, byte * sourceCoding, byte * newSourceCoding, int64 scwiDiff, Boolean iuoFlag )
{
    if ( word )
    {
        int64 scwi = word->W_SC_Index ;
        byte * name = String_ConvertToBackSlash ( word->Name ), *iuFlag = iuoFlag ? "true" : "false" ;
        if ( newSourceCoding )
        {
            _Printf ( ( byte* ) "\n\t%s :: word = 0x%08x : \'%-28s\' : coding  = 0x%08x : oldCoding  = 0x%08x : newCoding = 0x%08x : scwi = %03d, inUse = %s",
                prefix, word, name, coding, sourceCoding, newSourceCoding, scwi, iuFlag ) ;
        }
        else if ( index )
        {
            _Printf ( "\n\tWordList : index %2d : word = 0x%08x : \'%-28s\' : coding  = 0x%08x : sourceCoding = 0x%08x : scwi = %03d : inUse = %s",
                index, word, name, coding, sourceCoding, scwi, iuFlag ) ;
        }
        else //if ( scwiDiff )
        {
            _Printf ( ( byte* ) "\n\t%s :: \'%-28s\' : coding  = 0x%08x : sourceCoding  = 0x%08x : scwi = %03d, scwiDiff = %03d : inUse = %s",
                prefix, name, coding, sourceCoding, scwi, scwiDiff, iuFlag ) ;
        }
    }
}

void
DWL_ShowWord ( dlnode * anode, int64 index, int64 inUseOnlyFlag, int64 prefix, int64 scwiDiff )
{
    if ( anode )
    {
        dobject * dobj = ( dobject * ) anode ;
        Word * word = ( Word* ) dobject_Get_M_Slot ( dobj, SCN_WORD ) ;
        int64 iuoFlag = dobject_Get_M_Slot ( dobj, SCN_IN_USE_FLAG ) ;
        if ( word && ( ( ! inUseOnlyFlag ) || ( inUseOnlyFlag && iuoFlag ) ) )
        {
            _DWL_ShowWord_Print (word, index, ( byte* ) prefix, word->Coding, word->SourceCoding, 0, scwiDiff, iuoFlag ) ;
        }
    }
}

void
SC_WordList_Show ( dllist * list, Word * scWord, Boolean fromFirstFlag, Boolean inUseOnlyFlag, byte * listName )
{
    if ( list )
    {
        if ( scWord ) _Printf ( "\n%s WordList : for word \'%s\' :", listName, scWord->Name ) ;
        dllist_Map4_FromFirstFlag_Indexed ( list, fromFirstFlag, DWL_ShowWord, inUseOnlyFlag, ( int64 ) "", 0 ) ;
    }
}

// too much/many shows ?? combine some

void
Compiler_SC_WordList_Show ( byte * prefix, int8 inUseOnlyFlag, Boolean showInDebugColors )
{
    Word * scWord = Get_SourceCodeWord ( ) ;
    dllist * list = Compiling ? _CfrTil_->CompilerWordList : scWord ? scWord->W_SC_WordList : _CfrTil_->CompilerWordList ;
    if ( Is_DebugModeOn || showInDebugColors ) NoticeColors ;
    if ( prefix ) _Printf ( "\n%s : %s", prefix, scWord->Name ) ;
    _Printf ( "\n%s", scWord->Name ) ;
    byte *buffer = Buffer_Data ( _CfrTil_->ScratchB1 ) ;
    sprintf ( buffer, ( byte* ) "%s : %s", ( list == _CfrTil_->CompilerWordList ) ? "CfrTil WordList" : "source code word list for the word",
        inUseOnlyFlag ? "in use only" : "all" ) ;
    SC_WordList_Show ( list, scWord, 0, inUseOnlyFlag, buffer ) ;
    if ( Is_DebugModeOn || showInDebugColors ) DefaultColors ;
}

void
DebugWordList_Show_All ( Debugger * debugger )
{
    Compiler_SC_WordList_Show ( 0, 0, 0 ) ;
}

void
DebugWordList_Show_InUse ( Debugger * debugger )
{
    Compiler_SC_WordList_Show ( 0, 1, 0 ) ;
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

#if 0

void
CfrTil_DbgSourceCode_Begin_C_Block ( )
{
    SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, true ) ;
    _SC_Global_On ;
}

void
CfrTil_DbgSourceCode_End_C_Block ( )
{
    CfrTil_End_C_Block ( ) ;
    CfrTil_DbgSourceCodeOff ( ) ;
}
#endif

void
CfrTil_DbgSourceCodeOff ( )
{
    //SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, false ) ;
}

void
CfrTil_DbgSourceCodeOn ( )
{
    SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, true ) ;
}

void
CfrTil_DbgSourceCodeOn_Global ( )
{
    SetState ( _CfrTil_, ( DEBUG_SOURCE_CODE_MODE | GLOBAL_SOURCE_CODE_MODE ), true ) ;
}

// debug source code functions (above)
//=================================================
// text source code functions (below)

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
    cfrtil->SC_Buffer [ 0 ] = 0 ;
    cfrtil->SC_Index = 0 ;
    SetState ( cfrtil, SOURCE_CODE_STARTED, false ) ;
}

void
CfrTil_SourceCode_InitStart ( CfrTil * cfrtil )
{
    CfrTil_SourceCode_InitEnd ( cfrtil ) ;
    SetState ( cfrtil, SOURCE_CODE_STARTED, true ) ;
}

void
_CfrTil_InitSourceCode ( CfrTil * cfrtil )
{
    CfrTil_SourceCode_InitStart ( cfrtil ) ;
    Lexer_SourceCodeOn ( _Context_->Lexer0 ) ;
}

void
CfrTil_InitSourceCode ( CfrTil * cfrtil )
{
    _CfrTil_InitSourceCode ( cfrtil ) ;
    _CfrTil_SC_ScratchPadIndex_Init ( cfrtil ) ;
}

void
_CfrTil_InitSourceCode_WithName ( CfrTil * cfrtil, byte * name )
{
    _CfrTil_InitSourceCode ( cfrtil ) ;
    _CfrTil_AddStringToSourceCode ( cfrtil, name ) ;
    _CfrTil_SC_ScratchPadIndex_Init ( cfrtil ) ;
}

void
CfrTil_InitSourceCode_WithCurrentInputChar ( CfrTil * cfrtil )
{
    Lexer * lexer = _Context_->Lexer0 ;
    _CfrTil_InitSourceCode ( cfrtil ) ;
    _Lexer_AppendCharToSourceCode ( lexer, lexer->TokenInputCharacter, 0 ) ;
}

void
CfrTil_SourceCode_Init ( )
{
    Word * word = _Interpreter_->w_Word ;
    _CfrTil_InitSourceCode_WithName ( _CfrTil_, word ? word->Name : 0 ) ;
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

byte *
_CfrTil_Finish_WordSourceCode ( CfrTil * cfrtil, Word * word )
{
    if ( ! word->W_SourceCode ) word->W_SourceCode = _CfrTil_GetSourceCode ( ) ;
    Lexer_SourceCodeOff ( _Lexer_ ) ;
    CfrTil_SourceCode_InitEnd ( cfrtil ) ;
}

byte *
CfrTil_FinishSourceCode ( CfrTil * cfrtil, Word * word )
{
    _CfrTil_Finish_WordSourceCode ( cfrtil, word ) ;
    CfrTil_WordList_RecycleInit ( cfrtil, word, 0, 0, 0 ) ;
}

void
_CfrTil_UnAppendFromSourceCode_NChars ( CfrTil * cfrtil, int64 nchars )
{
    int64 plen = Strlen ( ( CString ) cfrtil->SC_Buffer ) ;
    if ( plen >= nchars )
    {
        cfrtil->SC_Buffer [ Strlen ( ( CString ) cfrtil->SC_Buffer ) - nchars ] = 0 ;
    }
    _CfrTil_SC_ScratchPadIndex_Init ( cfrtil ) ;
}

void
_CfrTil_UnAppendTokenFromSourceCode ( CfrTil * cfrtil, byte * tkn )
{
    if ( GetState ( _Lexer_, ( ADD_TOKEN_TO_SOURCE | ADD_CHAR_TO_SOURCE ) ) )
    {
        _CfrTil_UnAppendFromSourceCode_NChars ( cfrtil, Strlen ( ( CString ) tkn ) + 1 ) ;
    }
}

void
_CfrTil_AppendCharToSourceCode ( CfrTil * cfrtil, byte c )
{

    cfrtil->SC_Buffer [ cfrtil->SC_Index ++ ] = c ;
    cfrtil->SC_Buffer [ cfrtil->SC_Index ] = 0 ;
}

void
CfrTil_AppendCharToSourceCode ( CfrTil * cfrtil, byte c, int64 convertToSpaceFlag )
{
    if ( cfrtil->SC_Index < ( SOURCE_CODE_BUFFER_SIZE - 1 ) )
    {
        if ( c == '"' )
        {
            if ( cfrtil->SC_QuoteMode ) cfrtil->SC_QuoteMode = 0 ;
            else cfrtil->SC_QuoteMode = 1 ;
            _CfrTil_AppendCharToSourceCode ( cfrtil, c ) ;
        }
        else if ( convertToSpaceFlag )
        {
            c = String_ConvertEscapeCharToSpace ( c ) ;
            if ( ! ( ( c == ' ' ) && ( cfrtil->SC_Buffer [ cfrtil->SC_Index - 1 ] == ' ' ) ) )
            {
                _CfrTil_AppendCharToSourceCode ( cfrtil, c ) ;
            }
        }
        else
        {
            _String_AppendConvertCharToBackSlashAtIndex ( cfrtil->SC_Buffer, c, &cfrtil->SC_Index, cfrtil->SC_QuoteMode ) ;
        }
    }
}

Word *
Get_SourceCodeWord ( )
{
    Word * scWord = _CfrTil_->ScWord ? _CfrTil_->ScWord : Compiling ? _CfrTil_->CurrentWordCompiling : _CfrTil_->LastFinished_DObject ;
    return scWord ;
}

// ...source code source code TP source code source code ... EOL

byte *
PrepareDbgSourceCodeString ( byte * sc, Word * word ) // sc : source code ; scwi : source code word index
{
    byte * cc_line = ( byte* ) "" ;
    if ( sc && word )
    {
        int64 scwi0 = word->W_SC_Index ;
        byte *nvw, * token0 = word->Name, *token1 ;
        int64 i, tp = 42, lef, leftBorder, ts, rightBorder, ref ; // tp : text point - where we want to start source code text to align with disassembly ; ref : right ellipsis flag
        token1 = String_ConvertToBackSlash ( token0 ) ;
        int64 tw = Debugger_TerminalLineWidth ( _Debugger_ ), slt0 = Strlen ( token0 ), slt1 = Strlen ( token1 ) ; // 3 : 0,1,2,3 ; ts : tokenStart
        int64 dl = slt1 - slt0 ;
        dl = dl > 0 ? dl : 0 ;
        int64 slsc = strlen ( sc ) ;
        int64 scwsi = String_FindStrnCmpIndex ( sc, token0, scwi0, slt0, slsc - scwi0 ) ; //20 ) ; //inc ) ;
        d0 ( byte * scspp0 = & sc [ scwi0 ] ) ;
        d0 ( byte * scspp2 = & sc [ scwsi ] ) ;
        nvw = ( char* ) Buffer_New_pbyte ( ( slsc > BUFFER_SIZE ) ? slsc : BUFFER_SIZE ) ;
        //if ( ( slsc > tp ) && ( scwsi + 4 ) > tp )
        if ( ( slsc > tp ) && ( scwsi > tp ) )
        {
            lef = 4 ;
            leftBorder = ts = tp ;
            rightBorder = tw - ( ts + slt0 ) ;
            ref = ( slsc - 4 ) > tw ? 4 : 0 ;
            Strncpy ( nvw, & sc [scwsi - tp], tw - ( lef + ref ) ) ;
        }
        else
        {
            int64 pad = tp - scwsi ;
            if ( pad >= 4 )
            {
                lef = 4 ;
            }
            else lef = 0 ;
            for ( i = 0 ; i < pad ; i ++ ) strcat ( nvw, " " ) ;
            leftBorder = ts = tp ;
            ref = ( slsc - 4 ) > tw ? 4 : 0 ;

            if ( ( ! ref ) && ( tw > slsc - 4 ) ) ref = 4 ;
            rightBorder = tw - ( tp + slt0 ) - ref ;
            Strncat ( nvw, sc, tw - ( lef + pad + ref ) ) ;
        }
        int64 svState = GetState ( _Debugger_, DEBUG_SHTL_OFF ) ;
        SetState ( _Debugger_, DEBUG_SHTL_OFF, false ) ;
        // |ilw...------ inputLine  -----|lef|--- leftBorder ---|---token---|---  rightBorder  ---|ref|------ inputLine -----...ilw| -- ilw : inputLine window
        // |ilw...------ inputLine  -----|lef|pad?|-------------|tp|---token---|---  rightBorder  ---|ref|------ inputLine -----...ilw| -- ilw : inputLine window
        cc_line = ( word ? _String_HighlightTokenInputLine ( nvw, lef, leftBorder, ts, token1, rightBorder, ref, dl ) : ( byte* ) "" ) ; // nts : new token start is a index into b - the nwv buffer
        SetState ( _Debugger_, DEBUG_SHTL_OFF, svState ) ;
    }
    return cc_line ;
}

void
_Debugger_ShowDbgSourceCodeAtAddress ( Debugger * debugger, byte * address )
{
    // ...source code source code TP source code source code ... EOL
    Word * scWord = Get_SourceCodeWord ( ) ;
    if ( scWord )
    {
        dllist * list = ( scWord->W_SC_WordList ) ; //&& ( scWord->W_SC_MemSpaceRandMarker == _Q_->MemorySpace0->TempObjectSpace->InitFreedRandMarker ) ) ? scWord->W_SC_WordList : 0 ; //_CfrTil_->CompilerWordList ;
        if ( list )
        {
            byte *sourceCode = scWord->W_SourceCode ? scWord->W_SourceCode : String_New ( _CfrTil_->SC_Buffer, TEMPORARY ) ;
            if ( ! String_Equal ( sourceCode, "" ) )
            {
                int64 fixed = 0 ;
                Word * word = DWL_Find ( list, 0, address, 0, 0, 0, 0 ) ;
                if ( word && ( debugger->LastSourceCodeWord != word ) )
                {
                    d0 ( DebugWordList_Show_All ( ) ) ;

                    if ( GetState ( scWord, W_C_SYNTAX ) && String_Equal ( word->Name, "store" ) )
                    {
                        word->Name = ( byte* ) "=" ;
                        fixed = 1 ;
                    }
                    byte * buffer = PrepareDbgSourceCodeString ( sourceCode, word ) ;
                    _Printf ( ( byte* ) "\n%s", buffer ) ;
                    debugger->LastSourceCodeWord = word ;
                    if ( fixed )
                    {
                        word->Name = ( byte* ) "store" ;
                    }
                }
            }
        }
    }
}



