
#include "../include/cfrtil.h"

/*
 * 
 * Compiler Word List has nodes (CWLNs) with 2 slots one for the *word and one for a pointer to a Source Code Node (SCN) which has source code index info.
 * CWLN : slot 0 word, slot 1 SCN
 * Source code nodes (SCNs) have three slots for the source code byte index, the code address, and a pointer to the word, they are on the _CfrTil_->DebugWordList.
 * SCN : slot 0 : SCN_SC_CADDRESS, slot 1 : SCN_WORD_SC_INDEX, slot 2 : SCN_SC_WORD
 * So, they each have pointers to each other.
 * 
 */
const int64 SC_WINDOW = 60 ;
const int64 SCWI_MAX_DIFF = 60 ;
const int64 SCWI_MIN_DIFF = 2 ;

Word *
DWL_Find ( dllist * list, Word * iword, byte * address, byte* name, int64 fromFirst, int64 takeFirstFind, byte * newAddress )
{
    byte * naddress ;
    Word * nword, *aFoundWord = 0, *foundWord = 0 ;
    dlnode * node = 0 ;
    int64 numFound = 0 ;
    uint64 wdiff = SC_WINDOW, fDiff, minDiffFound = 0, scwi ; //, scwi0 = - 1 ;

    if ( list && ( iword || name || address ) )
    {
        for ( node = fromFirst ? dllist_First ( ( dllist* ) list ) : dllist_Last ( ( dllist* ) list ) ; node ;
            node = fromFirst ? dlnode_Next ( node ) : dlnode_Previous ( node ) )
        {
            nword = ( Word* ) dobject_Get_M_Slot ( node, 0 ) ;
            naddress = nword->Coding ; //( byte* ) dobject_Get_M_Slot ( node, SCN_SC_CADDRESS ) ;
            scwi = nword->W_SC_WordIndex ; //dobject_Get_M_Slot ( ( dobject * ) node, SCN_WORD_SC_INDEX ) ;
            if ( iword && ( nword == iword ) ) return nword ;
            if ( Compiling && ( ! GetState ( _Debugger_, DBG_DISASM_ACC ) ) )
            {
                if ( _Debugger_->w_Word && ( nword == _Debugger_->w_Word ) ) return nword ;
            }

            else
#if 0                
                && ( scwi == _CfrTil_->SC_ScratchPadIndex ) )
                {
                    if ( address == naddress ) return nword ;
                    else aFoundWord = nword ;
                }
#endif                
            if ( address == naddress )
            {
                numFound ++ ;
                aFoundWord = nword ;
                if ( newAddress )
                {
                    //dobject_Set_M_Slot ( ( dobject * ) node, SCN_WORD_SC_INDEX, scwi ) ;
                    //dobject_Set_M_Slot ( ( dobject * ) node, SCN_SC_CADDRESS, newAddress ) ;
                    nword->Coding = newAddress ;
                    if ( _Q_->Verbosity > 2 )
                    {
                        _Printf ( "\nDWL_Find : DebugWordListWord = %s : ADDRESS ADJUST : word = 0x%8x : word->Name = \'%-12s\' : address = 0x%8x : scwi = %4d : newAddress = 0x%8x", _CfrTil_->DebugWordListWord->Name, nword, nword->Name, address, scwi, newAddress ) ;
                    }
                    continue ;
                }
                //afoundNode = DWL_Check_SCWI ( node, address, scwi, nword, &maybeFoundNode, &fDiff ) ;
                fDiff = abs ( scwi - _Debugger_->LastSourceCodeIndex ) ;
                if ( ! minDiffFound ) minDiffFound = fDiff ;
                if ( aFoundWord && ( fDiff <= minDiffFound ) )
                {
                    minDiffFound = fDiff ;
                    foundWord = aFoundWord ;
                }
                if ( ( _Q_->Verbosity > 2 ) ) //&& afoundNode )
                {
                    DWL_ShowWord ( foundWord ? foundWord : aFoundWord, "FOUND", fDiff ) ;
                }
                if ( foundWord && takeFirstFind ) break ;
            }
        }
    }
    //if ( ( ! foundWord ) && maybeFoundNode ) foundNode = maybeFoundNode ;
    if ( ( ! newAddress ) && ( _Q_->Verbosity > 2 ) && ( numFound ) )
    {
        _Printf ( ( byte* ) "\nNumber Found = %d :: minDiffFound = %d : window = %d : Choosen node = 0x%8x :", numFound, minDiffFound, wdiff, foundWord ) ;
        if ( foundWord ) DWL_ShowWord ( foundWord, "CHOSEN", minDiffFound ) ;
    }
    if ( address ) _Debugger_->LastSourceCodeAddress = address ;
    return foundWord ;
}

void
_Debugger_ShowSourceCodeAtAddress ( Debugger * debugger, byte * address )
{
    // ...source code source code TP source code source code ... EOL
    Word * scWord = Compiling ? _Compiler_->CurrentWordCompiling : _Context_->CurrentlyRunningWord ;
    dllist * list = scWord->W_SC_WordList ? scWord->W_SC_WordList : _Compiler_->WordList ;
    if ( scWord && list )
    {
        byte *sourceCode = scWord->W_SourceCode ? scWord->W_SourceCode : String_New ( _CfrTil_->SC_ScratchPad, TEMPORARY ) ;
        if ( ! String_Equal ( sourceCode, "" ) )
        {
            int64 scwi, fixed = 0 ;
            Word * word = DWL_Find ( list, 0, address, 0, 0, 0, 0 ) ;
            //Word * word = DWL_Find ( list, 0, address, 0, 1, 0, 0 ) ;
            if ( word && ( debugger->LastSourceCodeWord != word ) )
            {
                d0 ( _List_ShowWord_SCWI_Address ( list ) ) ;
                //word = ( Word* ) dobject_Get_M_Slot ( dobj, SCN_SC_WORD ) ;
                if ( GetState ( scWord, W_C_SYNTAX ) && String_Equal ( word->Name, "store" ) )
                {
                    word->Name = ( byte* ) "=" ;
                    fixed = 1 ;
                }
                scwi = word->W_SC_WordIndex ; //dobject_Get_M_Slot ( dobj, SCN_WORD_SC_INDEX ) ;
                byte * buffer = PrepareSourceCodeString ( sourceCode, word, scwi ) ;
                _Printf ( ( byte* ) "\n%s", buffer ) ;
                debugger->LastSourceCodeIndex = scwi ;
                debugger->LastSourceCodeWord = word ;
                if ( fixed )
                {
                    word->Name = ( byte* ) "store" ;
                }
            }
        }
    }
}

void
CfrTil_SourceCodeBeginBlock ( )
{
    SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, true ) ;
    _SC_Global_On ;
    if ( ! GetState ( _Context_, C_SYNTAX ) ) CfrTil_BeginBlock ( ) ;
}

void
CfrTil_SourceCodeEndBlock ( )
{
    if ( ! GetState ( _Context_, C_SYNTAX ) ) CfrTil_EndBlock ( ) ;
    SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, false ) ;
}

void
CfrTil_SourceCode_Begin_C_Block ( )
{
    SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, true ) ;
    _SC_Global_On ;
    Word * word = _Context_->Compiler0->CurrentWordCompiling ;
    //CfrTil_SourceCode_SetDebugWordList ( word ) ;
}

void
CfrTil_SourceCode_End_C_Block ( )
{
    CfrTil_End_C_Block ( ) ;
    SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, false ) ;
}

void
CfrTil_SourceCodeOff ( )
{
    SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, false ) ;
    //SetState ( _CfrTil_, GLOBAL_SOURCE_CODE_MODE, false ) ;
    Compiler_WordList_RecycleInit ( _Compiler_ ) ;
}

// ...source code source code TP source code source code ... EOL

byte *
PrepareSourceCodeString ( byte * sc, Word * word, int64 scwi0 ) // sc : source code ; scwi : source code word index
{
    byte * cc_line = ( byte* ) "" ;
    if ( sc )
    {
        byte *nvw, * token0 = word->Name, *token1 ;
        int64 i, tp = 42, lef, leftBorder, ts, rightBorder, ref ; // tp : text point - where we want to start source code text to align with disassembly ; ref : right ellipsis flag
        token1 = String_ConvertToBackSlash ( token0 ) ;
        int64 tw = Debugger_TerminalLineWidth ( _Debugger_ ), slt0 = Strlen ( token0 ), slt1 = Strlen ( token1 ) ; // 3 : 0,1,2,3 ; ts : tokenStart
        int64 dl = slt1 - slt0 ;
        dl = dl > 0 ? dl : 0 ;
        int64 scwsi = String_FindStrnCmpIndex ( sc, token0, scwi0, slt0, 20 ) ; //inc ) ;
        d0 ( byte * scspp0 = & sc [ scwi0 ] ) ;
        d0 ( byte * scspp2 = & sc [ scwsi ] ) ;
        int64 slsc = strlen ( sc ) ;
        nvw = ( char* ) Buffer_New_pbyte ( ( slsc > BUFFER_SIZE ) ? slsc : BUFFER_SIZE ) ;
        if ( ( slsc > tp ) && ( scwsi + 4 ) > tp )
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
_CfrTil_AdjustSourceCodeAddress ( byte * address, byte * newAddress )
{
    dllist * list ; //= _Debugger_->w_Word->W_SC_WordList ? _Debugger_->w_Word->W_SC_WordList : _CfrTil_->DebugWordList ;

    if ( IsSourceCodeOn && ( list = _Compiler_->WordList ) )
    {
        DWL_Find ( list, 0, address, 0, 0, 0, newAddress ) ;
    }
}

void
_CfrTil_WordList_PushWord ( Word * word )
{

    dobject * dobj = 0 ;
    //if ( _IsSourceCodeOn ) dobj = DebugWordList_PushWord ( word ) ;
    CompilerWordList_Push ( word ) ; // _dllist_Push_M_Slot_Node ( _Compiler_->WordList, WORD, COMPILER_TEMP, 2, ((int64) word), ((int64) dnode) )
    d0 ( Word * sqWord = _CfrTil_WordList_TopWord ( ) ) ;
    d0 ( _Printf ( ( byte* ) "\n_Compiler_CopyDuplicatesAndPush : %s", sqWord->Name ) ) ;
}

Word *
_CfrTil_WordList_TopWord ( )
{
    Word * word = 0 ;
    node * first = _dllist_First ( _Compiler_->WordList ) ;
    if ( first ) word = ( Word* ) dobject_Get_M_Slot ( first, CWLN_WORD ) ;
    return word ;
}

node *
CfrTil_WordList_PopNode ( )
{
    node * first = _dllist_First ( _Compiler_->WordList ) ;
    if ( first ) dlnode_Remove ( first ) ;
    return first ;
}

/*
 * Compiler Word List : has nodes (CWLNs) with 2 slots one for the *word and one for a pointer to a Source Code Node (SCN) which has source code index info.
 * CWLN : slot 0 word, slot 1 SCN
 * _CfrTil_->DebugWordList : has Source code nodes (SCNs) have three slots for source code byte index, the code address, and a pointer to the word, they are on the _CfrTil_->DebugWordList.
 * SCN : slot 0 : SCN_SC_CADDRESS, slot 1 : SCN_WORD_SC_INDEX, slot 2 : SCN_SC_WORD
 * So, they each have pointers to each other.
 * 
 */
void
_CfrTil_WordList_PopWords ( int64 n )
{
    while ( n -- )
    {
        CfrTil_WordList_PopNode ( ) ;
        //CfrTil_DebugWordList_Pop ( ) ;
    }
}

void
CfrTil_WordLists_PopWord ( )
{
    _CfrTil_WordList_PopWords ( 1 ) ;
}

void
DWL_ShowWord ( Word * word, byte * insert, int64 scwiDiff )
{
    if ( word )
    {
        //Word * word = ( Word* ) dobject_Get_M_Slot ( node, SCN_SC_WORD ) ;
        int64 sc_index = word->W_SC_WordIndex ; //dobject_Get_M_Slot ( node, SCN_WORD_SC_INDEX ) ;
        byte * address = word->Coding ; //( byte* ) dobject_Get_M_Slot ( node, SCN_SC_CADDRESS ) ;
        _Printf ( ( byte* ) "\n\tDWL_ShowWord :: %s :: word :: = 0x%016lx : word Name = \'%-12s\'\t : at address  = 0x%08x : with sc_index = %d, scwiDiff = %d",
            insert, word, word->Name, address, sc_index, scwiDiff ) ;
        d0 (

        else _Printf ( ( byte* ) "\nDWL_ShowWord : word = 0x%08x : word Name = \'%-12s\'\t : at address  = 0x%016lx : with index = %d", node, word->Name, address, sc_index ) ) ;
    }
}

void
DebugWordList_Show ( )
{
    Word * scWord = Compiling ? _Compiler_->CurrentWordCompiling : _Context_->CurrentlyRunningWord ;
    dllist * list = scWord->W_SC_WordList ? scWord->W_SC_WordList : _Compiler_->WordList ;
    if ( Is_DebugModeOn && list ) //= _CfrTil_->DebugWordList ) ) //GetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE ) )
    {
        //if ( _CfrTil_->DebugWordListWord ) 
        _Printf ( "\nSourceCode WordList : for word = %s", scWord->Name ) ;
        int64 index ;
        dlnode * node, *nextNode ;
        for ( index = 0, node = dllist_First ( ( dllist* ) list ) ; node ; node = nextNode, index ++ )
        {

            nextNode = dlnode_Next ( node ) ;
            dobject * dobj = ( dobject * ) node ;
            byte * address = ( byte* ) dobject_Get_M_Slot ( dobj, SCN_SC_CADDRESS ) ; // notice : we are setting the slot in the obj that was in the SCN_SC_WORD_INDEX slot (1) of the 
            int64 scwi = dobject_Get_M_Slot ( dobj, SCN_WORD_SC_INDEX ) ;
            Word * word = ( Word * ) dobject_Get_M_Slot ( dobj, SCN_SC_WORD ) ;
            _Printf ( "\nSourceCode WordList : name %s : index %2d : word = 0x%016lx : \'%-12s\' : address = 0x%016lx : scwi = %3d", _CfrTil_->DebugWordListWord->Name, index, word, word->Name, address, scwi ) ;
        }
        //_Pause ( ) ;
    }
}

void
CfrTil_Lexer_SourceCodeOn ( )
{
    Lexer_SourceCodeOn ( _Context_->Lexer0 ) ;
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
__CfrTil_SourceCode_Init ( CfrTil * cfrtil )
{
    cfrtil->SC_ScratchPad [ 0 ] = 0 ;
    cfrtil->SC_ScratchPadIndex = 0 ;
}

void
_CfrTil_SourceCode_Init ( CfrTil * cfrtil )
{
    cfrtil->SC_ScratchPad [ 0 ] = 0 ;
    cfrtil->SC_ScratchPadIndex = 0 ;
    SetState ( cfrtil, SOURCE_CODE_INITIALIZED, true ) ;
}

void
_CfrTil_InitSourceCode ( CfrTil * cfrtil )
{
    //if ( force || ( ! GetState ( _CfrTil_, SOURCE_CODE_INITIALIZED ) ) ) {
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
_CfrTil_DebugSourceCodeCompileOn ( )
{
    SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, true ) ;
    SetState ( _CfrTil_, GLOBAL_SOURCE_CODE_MODE, true ) ;
}

void
_CfrTil_DebugSourceCodeCompileOff ( )
{
    SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, false ) ;
}

void
CfrTil_SourceCodeCompileOn ( )
{
    _CfrTil_DebugSourceCodeCompileOn ( ) ;
    CfrTil_SourceCode_Init ( ) ;
    if ( ! GetState ( _Context_, C_SYNTAX ) ) CfrTil_Colon ( ) ;
}

byte *
_CfrTil_FinishSourceCode ( CfrTil * cfrtil )
{
    // keep a LambdaCalculus LO_Define0 created SourceCode value
    //if ( ! word->SourceCode ) word->SourceCode = String_New ( cfrtil->SC_ScratchPad, STRING_MEM ) ;
    byte *sourceCode = String_New ( cfrtil->SC_ScratchPad, STRING_MEM ) ;
    Lexer_SourceCodeOff ( _Context_->Lexer0 ) ;
    __CfrTil_SourceCode_Init ( cfrtil ) ;
    SetState ( cfrtil, SOURCE_CODE_INITIALIZED, false ) ;

    return sourceCode ;
}

void
CfrTil_Word_FinishSourceCode ( CfrTil * cfrtil, Word * word )
{
    // keep a LambdaCalculus LO_Define0 created SourceCode value
    //if ( ! word->SourceCode ) word->SourceCode = String_New ( cfrtil->SC_ScratchPad, STRING_MEM ) ;
    //Lexer_SourceCodeOff ( _Context_->Lexer0 ) ;
    //__CfrTil_SourceCode_Init ( cfrtil ) ;
    //SetState ( cfrtil, SOURCE_CODE_INITIALIZED, false ) ;

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

void
Word_Set_SCA ( Word *word0 )
{
    dllist * list = _Compiler_->WordList ;
    Word * word1 ;
    if ( word1 = DWL_Find ( list, 0, Here, 0, 0, 1, 0 ) )
    {
        //dobject_Set_M_Slot ( dobj, SCN_WORD_SC_INDEX, scindex ) ;
        word1->Coding = 0 ;
    }
    if ( word0 ) word0->Coding = Here ;
}
#if 0

dobject *
DebugWordList_PushWord ( Word * word0 )
{
    dobject * dobj = 0 ;
    char * opTypeString ;
    Word * word = Word_GetOriginalWord ( word0 ) ; // copied words are recycled

    if ( word && IsSourceCodeOn && _CfrTil_->DebugWordList )
    {
        int64 scindex ; //index for the end of the word
        scindex = ( GetState ( _Compiler_, ( LC_ARG_PARSING | DOING_A_PREFIX_WORD ) ) || ( word->CAttribute & COMBINATOR ) ) ?
            ( word->W_SC_ScratchPadIndex ? word->W_SC_ScratchPadIndex : _CfrTil_->SC_ScratchPadIndex ) : _CfrTil_->SC_ScratchPadIndex ;
        if ( dobj = ( dobject * ) DWL_Find ( word0, 0, 0, 0, 1, 0 ) )
        {
            //dobject_Set_M_Slot ( dobj, SCN_WORD_SC_INDEX, scindex ) ;
            dobject_Set_M_Slot ( dobj, SCN_SC_CADDRESS, Here ) ;
            opTypeString = "ADJUSTED_ADDRESS" ;
        }
        else
        {
            dobj = Node_New_ForDebugWordList ( TEMPORARY, scindex, word ) ; // _dobject_New_M_Slot_Node ( TEMPORARY, WORD_LOCATION, 3, 0, scindex, word ) 
            dobject_Set_M_Slot ( ( dobject* ) dobj, SCN_SC_CADDRESS, Here ) ;
            _dllist_AddNodeToHead ( _CfrTil_->DebugWordList, ( dlnode* ) dobj ) ;
            word->State |= W_SOURCE_CODE_MODE ;
            d0 ( if ( String_Equal ( word->Name, "power" ) ) _Printf ( "\nPush : Got it! : %s\n", word->Name ) ) ;
            opTypeString = "PUSHED" ;
        }
        if ( _Q_->Verbosity > 2 ) _Printf ( ( byte* ) "\n\tDebugWordList_PushWord %s :: %s :: word = 0x%08x : word->Name = \'%-10s\' : code address  = 0x%08x : sc_index = %4d",
            _CfrTil_->DebugWordListWord->Name, opTypeString, word, word->Name, Here, scindex ) ;
    }
    return dobj ;
}

void
_DWL_CheckPush_Word ( Word * word )
{
    if ( word && IsSourceCodeOn && ( GetState ( _CfrTil_, SC_FORCE_PUSH ) || ( _CfrTil_->ScoOcCrw != word ) ) )
    {
        if ( ! ( word->LAttribute & ( W_COMMENT | W_PREPROCESSOR ) ) )
        {

            _CfrTil_->ScoOcCrw = word ;
            DebugWordList_PushWord ( _CfrTil_->ScoOcCrw ) ;
        }
        SC_SetForcePush ( false ) ; // one shot only flag
    }
}

void
SC_DWL_PushCWL_Index ( int64 index )
{

    _DWL_CheckPush_Word ( Compiler_WordList ( index ) ) ;
}

void
CfrTil_SourceCode_SetDebugWordList ( Word * word )
{
    if ( ( ! word->DebugWordList ) || ( ! _CfrTil_->DebugWordList ) && ( ! Compiling ) )
    {
        word->DebugWordList = _dllist_New ( TEMPORARY ) ;
        _CfrTil_->DebugWordList = word->DebugWordList ;
        _CfrTil_->DebugWordListWord = word ;
    }
}

void
Debugger_SetDebugWordList ( Debugger * debugger )
{
    if ( debugger->w_Word && debugger->w_Word->W_SourceCode && debugger->w_Word->DebugWordList )
    {
        _CfrTil_->DebugWordListWord = debugger->w_Word ;
        debugger->DebugWordList = debugger->w_Word->DebugWordList ;
        //_CfrTil_->DebugWordList = debugger->DebugWordList ;
    }
}

void
CfrTil_DebugWordList_Pop ( )
{
    if ( _CfrTil_->DebugWordList )
    {
        node * first = _dllist_First ( _CfrTil_->DebugWordList ) ;

        if ( first ) dlnode_Remove ( first ) ;
    }
}

node *
DWL_Check_SCWI ( dlnode * node, byte * address, int64 scwi, Word * wordn, dlnode ** maybeFoundNode, int64 * diff1 )
{
    dlnode *foundNode = 0 ;
    int64 scwiDiff ;
    if ( ! _Debugger_->LastSourceCodeIndex ) _Debugger_->LastSourceCodeIndex = scwi ;
    scwiDiff = abs ( scwi - _Debugger_->LastSourceCodeIndex ) ;
    if ( ( scwiDiff < SCWI_MAX_DIFF ) ) foundNode = node ;
    else if ( GetState ( _CfrTil_->DebugWordListWord, W_C_SYNTAX ) && ( wordn->CAttribute & COMBINATOR ) )
    {
        foundNode = node ;
    }
#if 0    
    else if ( ! foundNode )
    {
        if ( _Debugger_->LastSourceCodeAddress < address )
        {
            if ( scwiDiff < SC_WINDOW ) *maybeFoundNode = node ;
        }
        else foundNode = node ;
    }
#endif    
    if ( ( _Q_->Verbosity > 3 ) && foundNode )
    {
        DWL_ShowWord ( foundNode, "FOUND", scwiDiff ) ;
    }
    *diff1 = scwiDiff ;
    return foundNode ;
}
//#if 0

dlnode *
DWL_Find ( Word * word, byte * address, byte* name, int64 fromFirst, int64 takeFirstFind, byte * newAddress )
{
    byte * naddress ;
    Word * nword ;
    dllist * list = _CfrTil_->DebugWordList ; // must use _CfrTil_ because _CfrTil_AdjustSourceCodeAddress must be use DWL_Find
    dlnode * node = 0, *foundNode = 0, *afoundNode, *maybeFoundNode = 0 ;
    int64 numFound = 0 ;
    uint64 wdiff = SC_WINDOW, fDiff, minDiffFound = SCWI_MAX_DIFF, scwi, fscwi = - 1 ; //, scwi0 = - 1 ;

    if ( list && ( word || name || address ) )
    {
        for ( node = fromFirst ? dllist_First ( ( dllist* ) list ) : dllist_Last ( ( dllist* ) list ) ; node ;
            node = fromFirst ? dlnode_Next ( node ) : dlnode_Previous ( node ) )
        {
            naddress = ( byte* ) dobject_Get_M_Slot ( node, SCN_SC_CADDRESS ) ;
            nword = ( Word* ) dobject_Get_M_Slot ( node, SCN_SC_WORD ) ;
            if ( word && ( nword == word ) ) return node ;
            if ( address == naddress )
            {
                numFound ++ ;
                scwi = dobject_Get_M_Slot ( ( dobject * ) node, SCN_WORD_SC_INDEX ) ;
                if ( newAddress )
                {
                    dobject_Set_M_Slot ( ( dobject * ) node, SCN_WORD_SC_INDEX, scwi ) ;
                    dobject_Set_M_Slot ( ( dobject * ) node, SCN_SC_CADDRESS, newAddress ) ;
                    if ( _Q_->Verbosity > 2 )
                    {
                        _Printf ( "\nDWL_Find : DebugWordListWord = %s : ADDRESS ADJUST : word = 0x%8x : word->Name = \'%-12s\' : address = 0x%8x : scwi = %4d : newAddress = 0x%8x", _CfrTil_->DebugWordListWord->Name, nword, nword->Name, address, scwi, newAddress ) ;
                    }
                    continue ;
                }
                afoundNode = DWL_Check_SCWI ( node, address, scwi, nword, &maybeFoundNode, &fDiff ) ;
                if ( afoundNode && ( fDiff <= minDiffFound ) )
                {
                    minDiffFound = fDiff ;
                    foundNode = afoundNode ;
                }
                if ( ( _Q_->Verbosity > 2 ) ) //&& afoundNode )
                {
                    DWL_ShowWord ( node, "FOUND", fDiff ) ;
                }
                if ( foundNode && takeFirstFind ) break ;
            }
        }
    }
    if ( ( ! foundNode ) && maybeFoundNode ) foundNode = maybeFoundNode ;
    if ( ( ! newAddress ) && ( _Q_->Verbosity > 2 ) && ( numFound ) )
    {
        _Printf ( ( byte* ) "\nNumber Found = %d :: minDiffFound = %d : window = %d : Choosen node = 0x%8x :", numFound, minDiffFound, wdiff, foundNode ) ;
        if ( foundNode ) DWL_ShowWord ( foundNode, "CHOSEN", minDiffFound ) ;
    }
    if ( address ) _Debugger_->LastSourceCodeAddress = address ;
    return foundNode ;
}
#else



#endif






