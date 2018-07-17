
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
const int64 SC_WINDOW = 50 ;
const int64 SCWI_MAX_DIFF = 60 ;
const int64 SCWI_MIN_DIFF = 2 ;

Word *
DWL_Find ( dllist * list, Word * iword, byte * address, byte* name, int64 fromFirstFlag, int64 takeFirstFind, byte * newAddress ) // nb fromTop is from the end of the list because it is the top 'push'
{
    byte * naddress, iuFlag ;
    Word * nword, *aFoundWord = 0, *foundWord = 0 ;
    dlnode * anode = 0 ; 
    int64 numFound = 0 ;
    uint64 fwDiff = - 1, fDiff = 0, minDiffFound = 0, scwi ;

    if ( list && ( iword || name || address ) )
    {
        for ( anode = fromFirstFlag ? dllist_First ( list ) : dllist_Last ( list ) ; anode ;
            anode = fromFirstFlag ? dlnode_Next ( anode ) : dlnode_Previous ( anode ) )
        {
            nword = ( Word* ) dobject_Get_M_Slot ( anode, SCN_WORD ) ;
            naddress = nword->Coding ;
            scwi = dobject_Get_M_Slot ( anode, SCN_SC_WORD_INDEX ) ; //nword->W_SC_WordIndex ;
            iuFlag = dobject_Get_M_Slot ( anode, SCN_IN_USE_FLAG ) ;
            if ( ! iuFlag ) continue ;
            if ( iword && ( nword == iword ) ) return nword ;
            if ( Compiling && ( ! GetState ( _Debugger_, DBG_DISASM_ACC ) ) && _Debugger_->w_Word && ( nword == _Debugger_->w_Word ) ) return nword ;
            else if ( address && ( address == naddress ) )
            {
                numFound ++ ;
                aFoundWord = nword ;
                if ( newAddress )
                {
                    if ( ! foundWord )
                    {
                        nword->Coding = newAddress ;
                        if ( _Q_->Verbosity > 2 )
                        {
                            _DWL_ShowWord_Print ( nword, 0, "CODING ADJUST", address, newAddress, 0, iuFlag ) ;
                        }
                        foundWord = aFoundWord ;
                    }
                    continue ;
                }
                if ( foundWord )
                {
                    // remember there are probably many words with this compiled at address because we don't remove when we rewrite code
                    fDiff = abs ( scwi - foundWord->W_SC_WordIndex ) ;
                    //if ( ( fDiff < SC_WINDOW ) || ( scwi < foundWord->W_SC_WordIndex ) )
                    if ( ( scwi < foundWord->W_SC_WordIndex ) )
                    {
                        foundWord = aFoundWord ;
                        if ( fDiff < fwDiff )
                        {
                            foundWord = aFoundWord ;
                            fwDiff = fDiff ;
                        }
                        else if ( ! fwDiff ) fwDiff = fDiff ;
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
                    _DWL_ShowWord ( anode, "FOUND", fDiff ) ;
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
            _DWL_ShowWord_Print ( foundWord, 0, "CHOSEN", foundWord->Coding, 0, minDiffFound, 1 ) ; //_DWL_ShowWord ( foundWord, "CHOSEN", minDiffFound ) ;
        }
        if ( address ) _Debugger_->LastSourceCodeAddress = address ;
        if ( foundWord ) _Debugger_->LastSourceCodeIndex = foundWord->W_SC_WordIndex ;
        return foundWord ;
    }
    return 0 ;
}

void
_DWL_ShowList ( dllist * list, int8 fromFirst )
{
    if ( list )
    {
        dlnode * node = 0 ;
        for ( node = fromFirst ? dllist_First ( ( dllist* ) list ) : dllist_Last ( ( dllist* ) list ) ; node ;
            node = fromFirst ? dlnode_Next ( node ) : dlnode_Previous ( node ) )
        {
            _DWL_ShowWord ( node, "List", 0 ) ;
        }
    }
}

void
DWL_ShowList ( Word * scWord, int8 fromFirst )
{
    dllist * list = scWord->W_SC_WordList ? scWord->W_SC_WordList : _Compiler_->WordList ;
    if ( list )
    {
        dlnode * node = 0 ;
        for ( node = fromFirst ? dllist_First ( ( dllist* ) list ) : dllist_Last ( ( dllist* ) list ) ; node ;
            node = fromFirst ? dlnode_Next ( node ) : dlnode_Previous ( node ) )
        {
            _DWL_ShowWord ( node, "List", 0 ) ;
        }
    }
}

void
_Debugger_ShowDbgSourceCodeAtAddress ( Debugger * debugger, byte * address )
{
    // ...source code source code TP source code source code ... EOL
    //Word * scWord = Compiling ? _Compiler_->CurrentWordCompiling : _Context_->SourceCodeWord ? _Context_->SourceCodeWord : _Context_->CurrentlyRunningWord ;
    Word * scWord = Compiling ? _Compiler_->CurrentWordCompiling : GetState ( debugger, DBG_STEPPING ) ? Debugger_GetWordFromAddress ( debugger ) : _Context_->CurrentDisassemblyWord ;
    if ( scWord )
    {
        dllist * list = (scWord->W_SC_WordList && (scWord->W_SC_MemSpaceRandMarker == _Q_->MemorySpace0->TempObjectSpace->InitFreedRandMarker)) ? scWord->W_SC_WordList : 0 ; //_Compiler_->WordList ;
        if ( list )
        {
            byte *sourceCode = scWord->W_SourceCode ? scWord->W_SourceCode : String_New ( _CfrTil_->SC_ScratchPad, TEMPORARY ) ;
            if ( ! String_Equal ( sourceCode, "" ) )
            {
                int64 fixed = 0 ;
                Word * word = DWL_Find ( list, 0, address, 0, 1, 0, 0 ) ;
                if ( word && ( debugger->LastSourceCodeWord != word ) )
                {
                    d0 ( DebugWordList_ShowAll ( ) ) ;
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
    SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, false ) ;
}

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
    SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, false ) ;
}

void
CfrTil_DbgSourceCodeOff ( )
{
    SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, false ) ;
}

void
CfrTil_DbgSourceCodeOn ( )
{
    SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, true ) ;
}

// ...source code source code TP source code source code ... EOL

byte *
PrepareDbgSourceCodeString ( byte * sc, Word * word ) // sc : source code ; scwi : source code word index
{
    byte * cc_line = ( byte* ) "" ;
    if ( sc && word )
    {
        int64 scwi0 = word->W_SC_WordIndex ;
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

// DWL - DebugWordList : _CfrTil_->DebugWordList 

void
_CfrTil_AdjustDbgSourceCodeAddress ( byte * address, byte * newAddress )
{
    dllist * list = _Compiler_->WordList ;
    if ( IsSourceCodeOn && list )
    {
        //DWL_Find ( dllist * list, Word * iword, byte * address, byte* name, int64 fromFirstFlag, int64 takeFirstFind, byte * newAddress ) // nb fromTop is from the end of the list because it is the top 'push'
        DWL_Find ( list, 0, address, 0, 1, 0, newAddress ) ; // nb. fromFirst is from the top of a stack that was pushed
    }
}

void
CfrTil_WordList_PushWord ( Word * word )
{
    CompilerWordList_Push ( word, ( ! ( word->CAttribute & ( NAMESPACE|OBJECT_OPERATOR|OBJECT_FIELD ) ) ) || ( word->CAttribute & ( DOBJECT )) ) ; //_List_PushNew ( _Compiler_->WordList, word ) ;
}

Word *
_CfrTil_WordList_TopWord ( )
{
    Word * word = 0 ;
    node * first = _dllist_First ( _Compiler_->WordList ) ;
    if ( first ) word = ( Word* ) dobject_Get_M_Slot ( first, SCN_WORD ) ;
    return word ;
}

void
Word_Set_SCA ( Word * word0 )
{
    if ( word0 ) word0->Coding = Here ;
}

void
_CfrTil_WordList_PopWords (int64 n)
{
    Compiler * compiler = _Compiler_ ;
    dllist * list = compiler->WordList ;
    dlnode * node, *nextNode ;
    if ( list )
    {
        for ( node = dllist_First ( ( dllist* ) list ) ; node && n ; node = nextNode )
        {
            nextNode = dlnode_Next ( node ) ;
            dobject * dobj = ( dobject * ) node ;
            if ( dobject_Get_M_Slot ( dobj, SCN_IN_USE_FLAG ) )
            {
                dobject_Set_M_Slot ( dobj, SCN_IN_USE_FLAG, 0 ) ;
            }
            n -- ;
        }
    }
    //if ( initFlag ) CompileOptInfo_Init ( compiler ) ;
}

void
CfrTil_WordLists_PopWord ( )
{
    _CfrTil_WordList_PopWords (1) ;
}

// too many showWord functions 

void
_DWL_ShowWord_Print ( Word * word, int64 index, byte * prefix, byte * coding, byte * newCoding, int64 scwiDiff, Boolean iuoFlag )
{
    int64 scwi = word->W_SC_WordIndex ;
    byte * name = String_ConvertToBackSlash ( word->Name ), *iuFlag = iuoFlag ? "true" : "false" ;
    if ( newCoding )
    {
        _Printf ( ( byte* ) "\n\t%s :: word = 0x%08x : \'%-28s\' : oldCoding  = 0x%08x : newCoding = 0x%08x : scwi = %03d, inUse = %s",
            prefix, word, name, coding, newCoding, scwi, iuFlag ) ;
    }
    else if ( index )
    {
        _Printf ( "\n\tWordList : index %2d : word = 0x%08x : \'%-28s\' : coding = 0x%08x : scwi = %03d : inUse = %s",
            index, word, name, coding, scwi, iuFlag ) ;
    }
    else //if ( scwiDiff )
    {
        _Printf ( ( byte* ) "\n\t%s :: \'%-28s\' : coding  = 0x%08x : scwi = %03d, scwiDiff = %03d : inUse = %s",
            prefix, name, coding, scwi, scwiDiff, iuFlag ) ;
    }
#if 0    
    else
    {
        _Printf ( ( byte* ) "\n\t%s :: \'%-28s\' : coding  = 0x%08x : scwi = %03d, inUse = %s",
            prefix, name, coding, scwi, iuFlag ) ;
    }
#endif    
}

void
_DWL_ShowWord ( dlnode * anode, byte * prefix, int64 scwiDiff )
{
    if ( anode )
    {
        dobject * dobj = ( dobject * ) anode ;
        //int64 scwi = dobject_Get_M_Slot ( dobj, SCN_SC_WORD_INDEX ) ;
        Word * word = ( Word* ) dobject_Get_M_Slot ( dobj, SCN_WORD ) ;
        int64 iuoFlag = dobject_Get_M_Slot ( dobj, SCN_IN_USE_FLAG ) ;
        //_Printf ( ( byte* ) "\n\tDWL_ShowWord :: %s :: word :: = 0x%016lx : word Name = \'%-12s\'\t : Coding  = 0x%08x : W_SC_WordIndex = %d, scwiDiff = %d",
        //    prefix, word, String_ConvertToBackSlash ( word->Name ), word->Coding, word->W_SC_WordIndex, scwiDiff ) ;
        _DWL_ShowWord_Print ( word, 0, prefix, word->Coding, 0, scwiDiff, iuoFlag ) ;
    }
}

int64
DWL_ShowWord ( dlnode * anode, int64 index, int64 inUseOnlyFlag )
{
    if ( anode )
    {
        dobject * dobj = ( dobject * ) anode ;
        Word * word = ( Word* ) dobject_Get_M_Slot ( dobj, SCN_WORD ) ;
        int64 iuoFlag = dobject_Get_M_Slot ( dobj, SCN_IN_USE_FLAG ) ;
        if ( word && Compiling && ( ( ! inUseOnlyFlag ) || ( inUseOnlyFlag && iuoFlag ) ) )
        {
            _DWL_ShowWord_Print ( word, index, "WordList", word->Coding, 0, 0, iuoFlag ) ;
        }
    }
    return 0 ;
}

void
SC_WordList_Show ( dllist * list, Word * scWord, Boolean inUseOnlyFlag, byte * listName )
{
    if ( list )
    {
        if ( scWord ) _Printf ( "\n%s WordList : for word \'%s\' :", listName, scWord->Name ) ;
        dllist_Map_Indexed ( list, ( int64 ) inUseOnlyFlag, 0, DWL_ShowWord ) ;
    }
}

void
DebugWordList_ShowAll ( Debugger * debugger )
{
    Word * scWord = Compiling ? _Compiler_->CurrentWordCompiling : GetState ( debugger, DBG_STEPPING ) ? Debugger_GetWordFromAddress ( debugger ) : _Context_->CurrentlyRunningWord ;
    dllist * list = scWord->W_SC_WordList ? scWord->W_SC_WordList : _Compiler_->WordList ;
    SC_WordList_Show ( list, scWord, 0, list == scWord->W_SC_WordList ? "SourceCode" : "Compiler" ) ;
}

void
_Compiler_Show_WordList (byte * prefix, int8 inUseFlag)
{

    Word * scWord = Compiling ? _Compiler_->CurrentWordCompiling : GetState ( _Debugger_, DBG_STEPPING ) ? Debugger_GetWordFromAddress ( _Debugger_ ) : _Context_->CurrentlyRunningWord ;
    if ( Is_DebugModeOn ) NoticeColors ;
    _Printf ( "\n%s", prefix ) ;
    SC_WordList_Show ( _Context_->Compiler0->WordList, scWord, inUseFlag, "Compiler" ) ;
    if ( Is_DebugModeOn ) DefaultColors ;
}

void
Compiler_Show_WordList (byte * prefix)
{
    _Compiler_Show_WordList (prefix, 0) ;
}

void
Debugger_Show_InUse_CompilerWordList ( Debugger * debugger )
{
    byte * prefix = debugger->w_Word->Name ;
    _Compiler_Show_WordList (prefix, 1) ;
}

void
_CfrTil_DbgSourceCodeCompileOn ( )
{
    SetState ( _CfrTil_, ( DEBUG_SOURCE_CODE_MODE | GLOBAL_SOURCE_CODE_MODE ), true ) ;
}

void
_CfrTil_DbgSourceCodeCompileOff ( )
{
    SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, false ) ;
}

// debug source code functions (above)
//=================================================
// text source code functions (below)

void
CfrTil_SourceCodeCompileOn ( )
{
    _CfrTil_DbgSourceCodeCompileOn ( ) ;
    CfrTil_SourceCode_Init ( ) ;
    if ( ! GetState ( _Context_, C_SYNTAX ) ) _CfrTil_Colon ( ) ;
}

void
CfrTil_SourceCodeCompileOff ( )
{
    _CfrTil_DbgSourceCodeCompileOff ( ) ;
    if ( ! GetState ( _Context_, C_SYNTAX ) ) CfrTil_SemiColon ( ) ;
}

void
_CfrTil_AddStringToSourceCode ( CfrTil * cfrtil, byte * str )
{
    if ( str )
    {
        strcat ( ( char* ) cfrtil->SC_ScratchPad, ( char* ) str ) ;
        strcat ( ( CString ) cfrtil->SC_ScratchPad, ( CString ) " " ) ;
    }
}

void
CfrTil_AddStringToSourceCode ( CfrTil * cfrtil, byte * str )
{
    _CfrTil_AddStringToSourceCode ( cfrtil, str ) ;
    cfrtil->SC_ScratchPadIndex += ( Strlen ( ( char* ) str ) + 1 ) ; // 1 : add " " (above)
}

void
_CfrTil_SC_ScratchPadIndex_Init ( CfrTil * cfrtil )
{
    cfrtil->SC_ScratchPadIndex = Strlen ( ( char* ) _CfrTil_->SC_ScratchPad ) ;
}

void
SourceCode_Init ( CfrTil * cfrtil )
{
    cfrtil->SC_ScratchPad [ 0 ] = 0 ;
    cfrtil->SC_ScratchPadIndex = 0 ;
    List_Init ( _Compiler_->WordList ) ;
}

void
_CfrTil_SourceCode_Init ( CfrTil * cfrtil )
{
    SourceCode_Init ( cfrtil ) ;
    SetState ( cfrtil, SOURCE_CODE_INITIALIZED, true ) ;
}

void
_CfrTil_InitSourceCode ( CfrTil * cfrtil )
{
    Lexer_SourceCodeOn ( _Context_->Lexer0 ) ;
    _CfrTil_SourceCode_Init ( cfrtil ) ;
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
_CfrTil_FinishSourceCode ( CfrTil * cfrtil )
{
    byte *sourceCode = String_New ( cfrtil->SC_ScratchPad, STRING_MEM ) ;
    Lexer_SourceCodeOff ( _Context_->Lexer0 ) ;
    SourceCode_Init ( cfrtil ) ;
    SetState ( cfrtil, SOURCE_CODE_INITIALIZED, false ) ;
    return sourceCode ;
}

void
CfrTil_Word_FinishSourceCode ( CfrTil * cfrtil, Word * word )
{
    word->W_SourceCode = _CfrTil_FinishSourceCode ( cfrtil ) ;
}

void
_CfrTil_UnAppendFromSourceCode ( CfrTil * cfrtil, int64 nchars )
{
    int64 plen = Strlen ( ( CString ) cfrtil->SC_ScratchPad ) ;
    if ( plen >= nchars )
    {
        cfrtil->SC_ScratchPad [ Strlen ( ( CString ) cfrtil->SC_ScratchPad ) - nchars ] = 0 ;
    }
    _CfrTil_SC_ScratchPadIndex_Init ( cfrtil ) ;
}

void
_CfrTil_UnAppendTokenFromSourceCode ( CfrTil * cfrtil, byte * tkn )
{
    if ( GetState ( _Lexer_, ( ADD_TOKEN_TO_SOURCE | ADD_CHAR_TO_SOURCE ) ) )
    {
        _CfrTil_UnAppendFromSourceCode ( cfrtil, Strlen ( ( CString ) tkn ) + 1 ) ;
    }
}

void
_CfrTil_AppendCharToSourceCode ( CfrTil * cfrtil, byte c )
{

    cfrtil->SC_ScratchPad [ cfrtil->SC_ScratchPadIndex ++ ] = c ;
    cfrtil->SC_ScratchPad [ cfrtil->SC_ScratchPadIndex ] = 0 ;
}

void
CfrTil_AppendCharToSourceCode ( CfrTil * cfrtil, byte c, int64 convertToSpaceFlag )
{
    if ( cfrtil->SC_ScratchPadIndex < ( SOURCE_CODE_BUFFER_SIZE - 1 ) )
    {
        if ( c == '"' )
        {
            if ( cfrtil->SC_QuoteMode ) cfrtil->SC_QuoteMode = 0 ;
            else cfrtil->SC_QuoteMode = 1 ;
            _CfrTil_AppendCharToSourceCode ( cfrtil, c ) ;
        }
#if 1        
        else if ( convertToSpaceFlag )
        {
            c = String_ConvertEscapeCharToSpace ( c ) ;
            if ( ! ( ( c == ' ' ) && ( cfrtil->SC_ScratchPad [ cfrtil->SC_ScratchPadIndex - 1 ] == ' ' ) ) )
            {
                _CfrTil_AppendCharToSourceCode ( cfrtil, c ) ;
            }
        }
#endif        
        else
        {
            _String_AppendConvertCharToBackSlashAtIndex ( cfrtil->SC_ScratchPad, c, &cfrtil->SC_ScratchPadIndex, cfrtil->SC_QuoteMode ) ;
        }
    }
}

