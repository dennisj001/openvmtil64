
#include "../include/cfrtil64.h"

void
Debugger_Menu ( Debugger * debugger )
{
    _Printf ( ( byte* )
        "\nDebug Menu at : \n%s :\n(m)enu, so(U)rce, dum(p), (e)val, (d)is, dis(a)ccum, dis(A)ccum, (r)egisters, (l)ocals, (v)ariables, (I)nfo, (W)dis, s(h)ow"
        "\n(R)eturnStack, sto(P), (S)tate, (c)ontinue, (s)tep, (o)ver, (i)nto, o(u)t, t(h)ru, s(t)ack, auto(z), (V)erbosity, (q)uit, a(B)ort"
        "\nusi(N)g, s(H)ow DebugWordList, sh(O)w CompilerWordList, L - GotoList_Print, y - TypeStackPrint, w - wdiss"
        "\n'\\n' - escape, , '\\\' - <esc> - escape, ' ' - <space> - continue", c_gd ( Context_Location ( ) ) ) ;
    SetState ( debugger, DBG_MENU, false ) ;
}

void
_Debugger_Locals_ShowALocal ( Cpu * cpu, Word * localsWord, Word * scWord ) // use a debugger buffer instead ??
{
    Word * word2 = 0 ;
    byte * buffer = Buffer_Data_Cleared ( _CfrTil_->DebugB ) ; // nvw : new view window
    uint64 * fp = cpu->CPU_FP ; //? ( uint64* ) ((* cpu->CPU_FP)? ( uint64* ) (* cpu->CPU_FP) : (cpu->CPU_FP)) : 0 ;
    //if ( fp > ( uint64* ) 0x7f000000 )
    {
        if ( Compiling ) scWord = _CfrTil_->ScWord ;
        int64 localVarFlag = ( localsWord->W_ObjectAttributes & LOCAL_VARIABLE ) ; // nb! not a Boolean with '='
        int64 varOffset = _LocalOrParameterVar_Offset ( localsWord, scWord->W_NumberOfNonRegisterArgs, 
            IsFrameNecessary ( scWord->W_NumberOfNonRegisterLocals, scWord->W_NumberOfNonRegisterArgs ) ) ;
        byte * address = ( byte* ) ( uint64 ) ( fp ? fp [ varOffset ] : 0 ) ; 

        byte * stringValue = String_CheckForAtAdddress ( address ) ;
        if ( address && ( ! stringValue ) ) word2 = Word_GetFromCodeAddress ( ( byte* ) ( address ) ) ;
        if ( word2 ) sprintf ( ( char* ) buffer, "< %s.%s >", word2->ContainingNamespace->Name, c_u ( word2->Name ) ) ;

        if ( localsWord->W_ObjectAttributes & REGISTER_VARIABLE )
        {
            char * registerNames [ 16 ] = { ( char* ) "RAX", ( char* ) "RCX", ( char* ) "RDX", ( char* ) "RBX",
                ( char* ) "RBP", ( char* ) "RSP", ( char* ) "RSI", ( char* ) "RDI", ( char* ) "R8", ( char* ) "R9",
                ( char* ) "R10", ( char* ) "R11", ( char* ) "R12", ( char* ) "R13", ( char* ) "R14", ( char* ) "R15" } ;
            _Printf ( ( byte* ) "\n%-018s : index = [%3s:%d   ]  : <register  location> = 0x%016lx : %16s.%-16s : %s",
                "Register Variable", registerNames [ localsWord->RegToUse ], localsWord->RegToUse, cpu->Registers [ localsWord->RegToUse ],
                localsWord->S_ContainingNamespace->Name, c_u ( localsWord->Name ), word2 ? buffer : stringValue ? stringValue : ( byte* ) "" ) ;
        }
        else _Printf ( ( byte* ) "\n%-018s : index = [r15%s0x%02x]  : <0x%016lx> = 0x%016lx : %16s.%-16s : %s",
            localVarFlag ? "LocalVariable" : "Parameter Variable", localVarFlag ? "+" : "-", Abs ( varOffset * CELL ),
            fp + varOffset, ( uint64 ) ( fp ? fp [ varOffset ] : 0 ), localsWord->S_ContainingNamespace->Name,
            c_u ( localsWord->Name ), word2 ? buffer : stringValue ? stringValue : ( byte* ) "" ) ;
    }
}

void
_Debugger_Locals_Show_Loop ( Cpu * cpu, Stack * stack, Word * scWord )
{
    int64 n, i ;
    Word * localsWord ;
    if ( stack )
    {
        _Word_ShowSourceCode ( scWord ) ;
        if ( ! Compiling )
        {
            int64 * fp = ( int64* ) cpu->CPU_FP, * dsp = ( int64* ) cpu->CPU_DSP ;
            if ( ( ( uint64 ) fp < 0x7f0000000 ) ) fp = dsp ;
            _Printf ( ( byte* ) "\n%s.%s.%s : \nFrame Pointer = R15 = <0x%016lx> = 0x%016lx : Stack Pointer = R14 <0x%016lx> = 0x%016lx",
                scWord->ContainingNamespace ? c_gd ( scWord->ContainingNamespace->Name ) : ( byte* ) "", c_gd ( scWord->Name ), c_gd ( "locals" ),
                ( uint64 ) fp, fp ? *fp : 0, ( uint64 ) dsp, dsp ? *dsp : 0 ) ;
        }
        //Namespace_NamespacesStack_PrintWords ( stack ) ;
        for ( i = 0, n = Stack_Depth ( stack ) ; i < n ; i ++ )
        {
            Namespace * ns = ( Namespace* ) _Stack_N ( stack, i ) ; //Stack_Pop ( stack ) ;
            //_Namespace_PrintWords ( ns ) ;
            dlnode * node, *prevNode ;
            for ( node = dllist_Last ( ns->W_List ) ; node ; node = prevNode )
            {
                prevNode = dlnode_Previous ( node ) ;
                localsWord = ( Word * ) node ;
                _Debugger_Locals_ShowALocal ( cpu, localsWord, scWord ) ;
            }
        }
    }
}

void
Debugger_Locals_Show ( Debugger * debugger )
{
    Word * scWord = Compiling ? _Context_->CurrentWordBeingCompiled : debugger->w_Word ? debugger->w_Word : 
        ( debugger->DebugAddress ? Word_UnAlias ( Word_GetFromCodeAddress ( debugger->DebugAddress ) ) : _Context_->CurrentlyRunningWord ) ;
    if ( scWord && (scWord->W_NumberOfVariables || _Context_->Compiler0->NumberOfVariables ) )
        _Debugger_Locals_Show_Loop ( debugger->cs_Cpu, scWord->NamespaceStack ? scWord->NamespaceStack : _Compiler_->LocalsCompilingNamespacesStack, scWord ) ;
}

int64
Debugger_TerminalLineWidth ( Debugger * debugger )
{
    int64 tw = GetTerminalWidth ( ) ;
    if ( tw > debugger->TerminalLineWidth ) debugger->TerminalLineWidth = tw ;

    return debugger->TerminalLineWidth ;
}

void
Debugger_ShowStackChange ( Debugger * debugger, Word * word, byte * insert, byte * achange, Boolean stepFlag )
{
    int64 sl, i = 0, tw ;
    char *name, *location, *b, *b2 = ( char* ) Buffer_Data_Cleared ( _CfrTil_->DebugB2 ) ;
    b = ( char* ) Buffer_Data_Cleared ( _CfrTil_->DebugB1 ) ;
    if ( stepFlag ) sprintf ( ( char* ) b2, "0x%016lx", ( uint64 ) debugger->DebugAddress ) ;
    location = stepFlag ? ( char* ) c_gd ( b2 ) : ( char* ) Context_Location ( ) ;
    name = word ? ( char* ) c_gd ( String_ConvertToBackSlash ( word->Name ) ) : ( char* ) "" ;
start:

    if ( GetState ( debugger, DBG_STEPPING ) ) sprintf ( ( char* ) b, "\nStack : %s at %s :> %s <: %s", insert, location, ( char* ) c_gd ( name ), ( char* ) achange ) ;
    else sprintf ( ( char* ) b, "\nStack : %s at %s :> %s <: %s", insert, ( char* ) location, name, ( char* ) achange ) ;
    if ( ( sl = strlen ( ( char* ) b ) ) > 220 ) //183 ) //GetTerminalWidth ( ) ) //_Debugger_->TerminalLineWidth ) //220 ) 
    {
        location = ( char* ) "..." ;
        if ( ++ i > 1 ) name = ( char* ) "" ;
        if ( i > 2 ) insert = ( byte* ) "" ;
        if ( i > 3 ) achange = ( byte* ) "" ;
        if ( i > 4 ) goto done ;
        else goto start ;
    }
done:
    _Printf ( ( byte* ) "%s", b ) ;
    if ( _Q_->Verbosity > 3 ) _Debugger_PrintDataStack ( 2 ) ; //Stack ( ) ;
}

void
_Debugger_ShowEffects ( Debugger * debugger, Word * word, Boolean stepFlag, Boolean force )
{
    debugger->w_Word = Word_UnAlias ( word ) ;
    uint64* dsp = GetState ( debugger, DBG_STEPPING ) ? (_Dsp_ = debugger->cs_Cpu->R14d) : _Dsp_ ;
    if ( ! dsp ) CfrTil_Exception ( STACK_ERROR, 0, QUIT ) ;
    //if ( Is_DebugOn && ( force || ( ( stepFlag ) || ( word ) && ( word != debugger->LastShowWord ) || ( debugger->SC_Index != _Lexer_->SC_Index ) ) ) )
    if ( Is_DebugOn && ( force || ( stepFlag ) || ( word ) && ( word != debugger->LastShowWord ) || (debugger->PreHere && ( Here > debugger->PreHere )) ) ) //|| ( debugger->SC_Index && ( debugger->SC_Index != _Lexer_->SC_Index ) ) )
    {
        DebugColors ;
        if ( word && ( word->W_ObjectAttributes & OBJECT_FIELD ) && ( ! ( word->W_MorphismAttributes & DOT ) ) )
        {
            if ( ( ! String_Equal ( ( char* ) word->Name, "[" ) ) && ( ! String_Equal ( ( char* ) word->Name, "]" ) ) ) // this block is repeated in arrays.c : make it into a function - TODO
            {
                Word_PrintOffset ( word, 0, 0 ) ;
            }
        }
        _Debugger_DisassembleWrittenCode ( debugger ) ;
        const char * insert ;
        uint64 change ; int64 depthChange ;
        if ( Debugger_IsStepping ( debugger ) )
        {
            change = dsp - debugger->SaveDsp ;
            debugger->SaveDsp = dsp ;
        }
        else
        {
            change = debugger->WordDsp ? (dsp - debugger->WordDsp) : 0 ;
            debugger->WordDsp = dsp ;
        }
        //if ( GetState ( debugger, DBG_STEPPING ) ) Set_DataStackPointers_FromDebuggerDspReg ( ) ;        
        depthChange = DataStack_Depth ( ) - debugger->SaveStackDepth ;
        if ( word && ( debugger->WordDsp && ( GetState ( debugger, DBG_SHOW_STACK_CHANGE ) ) || ( change ) || ( debugger->SaveTOS != TOS ) || ( depthChange ) ) )
        {
            byte * name, pb_change [ 256 ] ;
            char * b = ( char* ) Buffer_Data ( _CfrTil_->DebugB ), *op ;
            char * c = ( char* ) Buffer_Data ( _CfrTil_->DebugB2 ) ;
            pb_change [ 0 ] = 0 ;

            if ( GetState ( debugger, DBG_SHOW_STACK_CHANGE ) ) SetState ( debugger, DBG_SHOW_STACK_CHANGE, false ) ;
            if ( depthChange > 0 ) sprintf ( ( char* ) pb_change, "%ld %s%s", depthChange, ( depthChange > 1 ) ? "cells" : "cell", " pushed. " ) ;
            else if ( depthChange ) sprintf ( ( char* ) pb_change, "%ld %s%s", - depthChange, ( depthChange < - 1 ) ? "cells" : "cell", " popped. " ) ;
            if ( dsp && ( debugger->SaveTOS != TOS ) ) op = ( char* ) "changed" ;
            else op = ( char* ) "set" ;
            sprintf ( ( char* ) c, ( char* ) "0x%016lx", ( uint64 ) TOS ) ;
            sprintf ( ( char* ) b, ( char* ) "TOS %s to %s.", op, c_gd ( c ) ) ;
            strcat ( ( char* ) pb_change, ( char* ) b ) ; // strcat ( (char*) _change, cc ( ( char* ) c, &_Q_->Default ) ) ;
            name = word->Name ;
            if ( name ) name = String_ConvertToBackSlash ( name ) ;
            char * achange = ( char* ) pb_change ;
            if ( stepFlag )
            {
                Word * word = Word_GetFromCodeAddress ( debugger->DebugAddress ) ;
                if ( ( word ) && ( ( byte* ) word->Definition == debugger->DebugAddress ) )
                {
                    insert = "function call" ;
                    if ( achange [0] ) Debugger_ShowStackChange ( debugger, word, ( byte* ) insert, ( byte* ) achange, stepFlag ) ;
                }
                else
                {
                    if ( ( ( * debugger->DebugAddress ) != 0x83 ) && ( ( * debugger->DebugAddress ) != 0x81 ) )// add esi
                    {
                        insert = "instruction" ;
                        if ( achange [0] ) Debugger_ShowStackChange ( debugger, word, ( byte* ) insert, ( byte* ) achange, stepFlag ) ;
                    }
                    else SetState ( debugger, DBG_SHOW_STACK_CHANGE, true ) ;
                }
            }
            else
            {
                if ( word ) insert = "word" ;
                else insert = "token" ;
                if ( achange [0] ) Debugger_ShowStackChange ( debugger, word, ( byte* ) insert, ( byte* ) achange, stepFlag ) ;
            }
            if ( GetState ( _Context_->Lexer0, KNOWN_OBJECT ) )
            {
                if ( dsp > debugger->SaveDsp ) _Printf ( ( byte* ) "\nLiteral :> 0x%016lx <: was pushed onto the stack ...", TOS ) ;
                else if ( dsp < debugger->SaveDsp ) _Printf ( ( byte* ) "\n%s popped %d value off the stack.", insert, ( debugger->SaveDsp - dsp ) ) ;
                DefaultColors ;
            }
            if ( ( ! ( achange [0] ) ) && ( ( change > 1 ) || ( change < - 1 ) || ( _Q_->Verbosity > 1 ) ) ) _Debugger_PrintDataStack ( change + 1 ) ;
        }
        DebugColors ;
        debugger->LastEffectsWord = word ;
        //debugger->LastShowWord = debugger->w_Word ;
        Set_DataStackPointer_FromDspReg ( ) ;
    }
    debugger->SC_Index = _Lexer_->SC_Index ;
    //debugger->PreHere = Here ;
    debugger->ShowLine = 0 ;
}

void
Debugger_ShowEffects ( Debugger * debugger, Boolean stepFlag, Boolean forceFlag )
{
    _Debugger_ShowEffects ( debugger, debugger->w_Word, stepFlag, forceFlag ) ;
}

// hopefully this can also be used by SC_PrepareDbgSourceCodeString

byte *
_PrepareDbgSourceCodeString ( Word * word, byte * il, int64 tvw )
{
    byte * cc_line, *token, *subsToken ;
    byte * nvw = Buffer_Data_Cleared ( _CfrTil_->DebugB ) ; // nvw : new view window
    Boolean ins = GetState ( _Debugger_, DBG_OUTPUT_INSERTION ) ;
    Boolean subs = GetState ( _Debugger_, DBG_OUTPUT_SUBSTITUTION ) ;
    int64 slil, slt, totalBorder, idealBorder, leftBorder, rightBorder, lef, ref, nws, ots, nts, slNvw, wrli, inc ;
    // NB!! : remember the highlighting formatting characters don't add any additional *visible length* to the output line
    // ots : original token start (index into the source code), nws : new window start ; tvw: targetViewWidth ; nts : new token start
    // lef : left ellipsis flag, ref : right ellipsis flag
    token = String_ConvertToBackSlash ( word->Name ) ;
    if ( subs )
    {
        subsToken = _Debugger_->SubstitutedWord->Name ;
        if ( String_Equal ( subsToken, subsToken ) ) subs = 0 ;
        else token = subsToken ;
    }
    slt = Strlen ( token ) ;
    wrli = word->W_RL_Index ;
    slil = Strlen ( String_RemoveEndWhitespace ( il ) ) ;
    inc = slil - wrli ;
    ots = String_FindStrnCmpIndex ( il, word->Name, wrli, strlen ( ( char* ) word->Name ), slt ) ; //(( inc > 30 ) ? 30 : inc) ) ; //20 ) ;// adjust from wrli which is 
    totalBorder = ( tvw - slt ) ; // the borders allow us to slide token within the window of tvw
    // try to get nts relatively the same as ots
    idealBorder = ( totalBorder / 2 ) ;
    leftBorder = rightBorder = idealBorder ; // tentatively set leftBorder/rightBorder as ideally equal
    nws = ots - idealBorder - ( ins ? ( slt / 2 ) + 1 : ( subs ? ( ( strlen ( ( char* ) subsToken ) ) / 2 ) : 0 ) ) ;
    nts = idealBorder ;
    if ( nws < 0 )
    {
        nws = 0 ;
        nts = leftBorder = ots ;
        rightBorder = totalBorder - leftBorder ;
    }
    else if ( ( ots + slt + idealBorder ) > slil )
    {
        nws = slil - tvw ;
        rightBorder = slil - ( ots + slt ) ; // keep all on right beyond token - the cutoff is on the left side
        if ( nws < 0 )
        {
            nws = 0 ;
            rightBorder += ( tvw - slil ) ;
        }
        leftBorder = totalBorder - rightBorder ;
        nts = leftBorder ; //+ (ins ? (slt/2 + 1) : 0 ) ;
    }
    //else { the defaults above }
    if ( ins )
    {
        Strncpy ( nvw, &il[nws], ots ) ;
        strcat ( ( char* ) nvw, ( char* ) token ) ;
        strcat ( ( char* ) nvw, " " ) ;
        strcat ( ( char* ) nvw, ( char* ) &il[ots] ) ;
    }
    if ( subs )
    {
        Strncpy ( nvw, &il[nws], ots ) ;
        strcat ( ( char* ) nvw, ( char* ) subsToken ) ;
        strcat ( ( char* ) nvw, " " ) ;
        strcat ( ( char* ) nvw, ( char* ) &il[ots + strlen ( ( char* ) subsToken ) ] ) ; // 2 : '=' + ' ' :: assuming subs is only done with an '=' in _CfrTil_C_Infix_EqualOp
    }
    else Strncpy ( nvw, &il[nws], tvw ) ; // copy the the new view window to buffer nvw
    slNvw = Strlen ( nvw ) ;
    if ( slNvw > ( tvw + 8 ) ) // is there a need for ellipsis
    {
        if ( ( ots - leftBorder ) < 4 ) lef = 0, ref = 1 ;
        else lef = ref = 1 ;
    }
    else if ( slNvw > ( tvw + 4 ) ) // is there a need for one ellipsis
    {
        if ( ( ots - leftBorder ) < 4 ) lef = 0, ref = 1 ;
        else lef = 1, ref = 0 ; // choose lef as preferable
    }
    else lef = ref = 0 ;
    cc_line = _String_HighlightTokenInputLine ( nvw, lef, leftBorder, nts, token, rightBorder, ref ) ;
    String_RemoveEndWhitespace ( cc_line ) ;
    return cc_line ;
}

// NB!! : remember the highlighting formatting characters don't add any additional *visible length* to the output line
// ots : original token start (index into the source code), nws : new window start ; tvw: targetViewWidth ; nts : new token start
// lef : left ellipsis flag, ref : right ellipsis flag

byte *
Debugger_PrepareDbgSourceCodeString ( Debugger * debugger, Word * word, int64 twAlreayUsed )
{
    byte * cc_line ;
    if ( word )
    {
        ReadLiner * rl = _Context_->ReadLiner0 ;
        byte * il = Buffer_Data_Cleared ( _CfrTil_->StringInsertB4 ) ; //nb! dont tamper with the input line. eg. removing its newline will affect other code which depends on newline
        strcpy ( il, rl->InputLineString ) ;
        if ( String_Equal ( "init", word->Name ) ) 
        {
            String_RemoveEndWhitespace ( ( byte* ) il ) ;
            strcat ( il, " -> " ) ;
            strcat ( il, c_n (word->Name) ) ;
            strcat ( il, " ( )" ) ;
            return il ;
        }
        int64 fel, tw, tvw ;
        fel = 32 - 1 ; //fe : formatingEstimate length : 2 formats with 8/12 chars on each sude - 32/48 :: 1 : a litte leave way
        tw = Debugger_TerminalLineWidth ( debugger ) ; // 139 ; //139 : nice width :: Debugger_TerminalLineWidth ( debugger ) ; 
        tvw = tw - ( twAlreayUsed - fel ) ; //subtract the formatting chars which don't add to visible length
        cc_line = _PrepareDbgSourceCodeString ( word, il, tvw ) ;
    }
    else cc_line = ( byte* ) "" ; // nts : new token start is a index into b - the nwv buffer
    return cc_line ;
}

void
_Debugger_ShowInfo ( Debugger * debugger, byte * prompt, int64 signal, int64 force )
{
    if ( force || ( ! debugger->LastShowWord ) || ( debugger->w_Word != debugger->LastShowWord ) )
    {
        Context * cntx = _Context_ ;
        byte *location ;
        byte signalAscii [ 128 ] ;
        ReadLiner * rl = cntx->ReadLiner0 ;
        char * compileOrInterpret = ( char* ) ( CompileMode ? "[c] " : "[i] " ), buffer [32], *cc_line ;

        DebugColors ;
        if ( ! ( cntx && cntx->Lexer0 ) ) Throw ( ( byte* ) "\n_CfrTil_ShowInfo:", ( byte* ) "\nNo token at _CfrTil_ShowInfo\n", QUIT ) ;
        if ( rl->Filename ) location = rl->Filename ;
        else location = ( byte* ) "<command line>" ;
        if ( ( location == debugger->Filename ) && ( GetState ( debugger, DBG_FILENAME_LOCATION_SHOWN ) ) ) location = ( byte * ) "..." ;
        SetState ( debugger, DBG_FILENAME_LOCATION_SHOWN, true ) ;
        //Word * word = debugger->w_Word ; 
        Word * word = debugger->w_Word ? debugger->w_Word : _Context_->CurrentlyRunningWord ? _Context_->CurrentlyRunningWord : _Context_->CurrentTokenWord ;
        byte * token0 = word ? word->Name : debugger->Token, *token1 ;
        if ( ( signal == 11 ) || _Q_->SigAddress )
        {
            sprintf ( ( char* ) signalAscii, ( char * ) "Error : signal " INT_FRMT ":: attempting address : \n" UINT_FRMT, signal, ( uint64 ) _Q_->SigAddress ) ;
            debugger->DebugAddress = ( byte* ) _Q_->SigAddress ;
        }
        else if ( signal ) sprintf ( ( char* ) signalAscii, ( char * ) "Error : signal " INT_FRMT " ", signal ) ;

        if ( token0 )
        {
            byte * obuffer = Buffer_Data_Cleared ( _CfrTil_->DebugB1 ) ;
            token1 = String_ConvertToBackSlash ( token0 ) ;
            token0 = token1 ;
            char * cc_Token = ( char* ) cc ( token0, &_Q_->Notice ) ;
            char * cc_location = ( char* ) cc ( location, &_Q_->Debug ) ;
next:
            DebugColors ;
            prompt = prompt ? prompt : ( byte* ) "" ;
            strcpy ( ( char* ) buffer, ( char* ) prompt ) ; //, BUFFER_SIZE ) ;
            strcat ( buffer, compileOrInterpret ) ; //, BUFFER_SIZE ) ;
            prompt = ( byte* ) buffer ;
            if ( word )
            {
                if ( word->W_MorphismAttributes & CPRIMITIVE )
                {
                    sprintf ( ( char* ) obuffer, "\n%s%s:: %s : %03ld.%03ld : %s :> %s <: cprimitive :> ", // <:: " INT_FRMT "." INT_FRMT " ",
                        prompt, signal ? ( char* ) signalAscii : " ", cc_location, rl->LineNumber, rl->ReadIndex,
                        word->ContainingNamespace ? ( char* ) word->ContainingNamespace->Name : "<literal>",
                        cc_Token ) ;
                }
                else
                {
                    sprintf ( ( char* ) obuffer, "\n%s%s:: %s : %03ld.%03ld : %s :> %s <: 0x%016lx :> ", // <:: " INT_FRMT "." INT_FRMT " ",
                        prompt, signal ? ( char* ) signalAscii : " ", cc_location, rl->LineNumber, rl->ReadIndex,
                        word->ContainingNamespace ? ( char* ) word->ContainingNamespace->Name : ( char* ) "<literal>",
                        ( char* ) cc_Token, ( uint64 ) word ) ;
                }
                cc_line = ( char* ) Debugger_PrepareDbgSourceCodeString ( debugger, word, ( int64 ) Strlen ( obuffer ) ) ;
                Strncat ( obuffer, cc_line, BUFFER_SIZE ) ;
                _Printf ( ( byte* ) "%s", obuffer ) ;
            }
            else
            {
                _Printf ( ( byte* ) "\n%s%s:: %s : %03ld.%03ld : %s :> %s <::> ", // <:: " INT_FRMT "." INT_FRMT " ",
                    prompt, signal ? signalAscii : ( byte* ) " ", cc_location, rl->LineNumber, rl->ReadIndex,
                    "<literal>", cc_Token ) ; //, _Q_->StartedTimes, _Q_->SignalExceptionsHandled ) ;
            }
        }
        else
        {
            cc_line = ( char* ) Buffer_Data ( _CfrTil_->DebugB ) ;
            strcpy ( cc_line, ( char* ) rl->InputLine ) ;
            String_RemoveEndWhitespace ( ( byte* ) cc_line ) ;
            _Printf ( ( byte* ) "\n%s %s:: %s : %03d.%03d :> %s", // <:: " INT_FRMT "." INT_FRMT,
                prompt, signal ? signalAscii : ( byte* ) "", location, rl->LineNumber, rl->ReadIndex,
                cc_line ) ;
        }
        DefaultColors ;
        if ( ! String_Equal ( "...", location ) ) debugger->Filename = location ;
    }
    else SetState ( _Debugger_, DBG_AUTO_MODE_ONCE, true ) ;
}

void
Debugger_ShowInfo ( Debugger * debugger, byte * prompt, int64 signal )
{
    Context * cntx = _Context_ ;
    int64 sif = 0 ;
    if ( ( GetState ( debugger, DBG_INFO ) ) || GetState ( debugger, DBG_STEPPING ) )
    {
        _Debugger_ShowInfo ( debugger, prompt, signal, 1 ) ;
        sif = 1 ;
    }
    if ( ! ( cntx && cntx->Lexer0 ) )
    {
        _Printf ( ( byte* ) "\nSignal Error : signal = %d\n", signal ) ;
        return ;
    }
    if ( ! GetState ( _Debugger_, DBG_ACTIVE ) )
    {
        debugger->Token = cntx->Lexer0->OriginalToken ;
        Debugger_FindUsing ( debugger ) ;
    }
    else if ( debugger->w_Word ) debugger->Token = debugger->w_Word->Name ;
    //if ( ( signal != SIGSEGV ) && GetState ( debugger, DBG_STEPPING ) )
    if ( ( _Q_->SigSegvs < 2 ) && GetState ( debugger, DBG_STEPPING ) )
    {
        _Printf ( ( byte* ) "\nDebug Stepping Address : 0x%016lx", ( uint64 ) debugger->DebugAddress ) ;
        Debugger_UdisOneInstruction ( debugger, debugger->DebugAddress, ( byte* ) "", ( byte* ) "" ) ; // the next instruction
    }
    if ( ( ! sif ) && ( ! GetState ( debugger, DBG_STEPPING ) ) && ( GetState ( debugger, DBG_INFO ) ) ) _Debugger_ShowInfo ( debugger, prompt, signal, 1 ) ;
    if ( prompt == _Q_->ExceptionMessage ) _Q_->ExceptionMessage = 0 ;
}

void
CfrTil_ShowInfo ( Word * word, byte * prompt, int64 signal )
{
    _Debugger_->w_Word = Word_UnAlias ( word ) ;
    _Debugger_ShowInfo ( _Debugger_, prompt, signal, 1 ) ;
}

void
Debugger_ShowState ( Debugger * debugger, byte * prompt )
{
    ReadLiner * rl = _Context_->ReadLiner0 ;
    Word * word = debugger->w_Word ;
    int64 cflag = 0 ;
    if ( word && ( word->W_ObjectAttributes & CONSTANT ) ) cflag = 1 ;
    DebugColors ;
    byte * token = debugger->Token ;
    token = String_ConvertToBackSlash ( token ) ;
    if ( word )
    {
        _Printf ( ( byte* ) ( cflag ? "\n%s :: %03d.%03d : %s : <constant> : %s%s%s " : word->ContainingNamespace ? "\n%s :: %03d.%03d : %s : <word> : %s%s%s " : "\n%s :: %03d.%03d : %s : <word?> : %s%s%s " ),
            prompt, rl->LineNumber, rl->ReadIndex, Debugger_GetStateString ( debugger ),
            // _Q_->CfrTil->Namespaces doesn't have a ContainingNamespace
            word->ContainingNamespace ? word->ContainingNamespace->Name : ( byte* ) "",
            word->ContainingNamespace ? ( byte* ) "." : ( byte* ) "", // the dot between
            c_gd ( word->Name ) ) ;
    }
    else if ( token )
    {
        _Printf ( ( byte* ) ( cflag ? "\n%s :: %03d.%03d : %s : <constant> :> %s " : "\n%s :: %03d.%03d : %s : <literal> :> %s " ),
            prompt, rl->LineNumber, rl->ReadIndex, Debugger_GetStateString ( debugger ), c_gd ( token ) ) ;
    }
    else _Printf ( ( byte* ) "\n%s :: %03d.%03d : %s : ", prompt, rl->LineNumber, rl->ReadIndex, Debugger_GetStateString ( debugger ) ) ;
    if ( ! debugger->Key )
    {
        if ( word ) _CfrTil_Source ( word, 0 ) ;

        if ( GetState ( debugger, DBG_STEPPING ) )
            Debugger_UdisOneInstruction ( debugger, debugger->DebugAddress, ( byte* ) "\r", ( byte* ) "" ) ; // current insn
    }
}

void
Debugger_ConsiderAndShowWord ( Debugger * debugger )
{
    Word * word = debugger->w_Word ;
    SetState ( debugger, DBG_CAN_STEP, false ) ; // debugger->State flag = false ;
    if ( word ) // then it wasn't a literal
    {
        byte * name = c_gd ( word->Name ) ;
        if ( ( word->W_MorphismAttributes & ( CPRIMITIVE | DLSYM_WORD ) ) && ( ! ( CompileMode ) ) )
        {
            if ( word->ContainingNamespace ) _Printf ( ( byte* ) "\ncprimitive :> %s.%s <:> 0x%08x <: => evaluating ...", word->ContainingNamespace->Name, name, ( uint64 ) word->Definition ) ;
        }
        else
        {
            SetState ( debugger, DBG_CAN_STEP, true ) ;
            if ( GetState ( debugger, DBG_INTERNAL ) )
            {
                Debugger_Info ( debugger ) ;
            }
            else if ( word->W_ObjectAttributes & NAMESPACE_VARIABLE )
            {
                _Printf ( ( byte* ) "\nVariable :> %s.%s <: => evaluating ... :> ", word->ContainingNamespace->Name, name ) ;
                SetState ( debugger, DBG_CAN_STEP, false ) ;
            }
            else if ( word->W_ObjectAttributes & TEXT_MACRO )
            {
                _Printf ( ( byte* ) "\nMacro :> %s.%s <: => evaluating ... :> ", word->ContainingNamespace->Name, name ) ;
                SetState ( debugger, DBG_CAN_STEP, false ) ;
            }
            else if ( word->W_MorphismAttributes & IMMEDIATE )
            {
                _Printf ( ( byte* ) "\nImmediate word :> %s.%s <:> 0x%08x <: => evaluating ...",
                    word->ContainingNamespace->Name, name, ( uint64 ) word->Definition ) ;
            }
            else if ( CompileMode )
            {
                _Printf ( ( byte* ) "\nCompileMode :> %s.%s : %s <: not a macro => compiling ...",
                    word->ContainingNamespace->Name, name, Debugger_GetStateString ( debugger ) ) ;
            }
            else
            {
                _Printf ( ( byte* ) "\nCompiled word :> %s.%s <:> 0x%08x <: => evaluating ...",
                    word->ContainingNamespace->Name, name, ( uint64 ) word->Definition ) ;
            }
            Word_ShowSourceCode ( word ) ;
            DefaultColors ;
        }
    }
    else
    {
        if ( debugger->Token )
        {
            Lexer_ParseObject ( _Context_->Lexer0, debugger->Token ) ;
            if ( ( GetState ( _Context_->Lexer0, KNOWN_OBJECT ) ) )
            {
                if ( CompileMode )
                {
                    _Printf ( ( byte* ) "\nCompileMode :> %s <: literal stack push will be compiled ...", _Context_->Lexer0->OriginalToken ) ;
                }

                else _Printf ( ( byte* ) "\nLiteral :> %s <: will be pushed onto the stack ...", _Context_->Lexer0->OriginalToken ) ;
            }
        }
    }
}

void
_Debugger_DoNewlinePrompt ( Debugger * debugger )
{

    _Printf ( ( byte* ) "\n%s=> ", GetState ( debugger, DBG_RUNTIME ) ? ( byte* ) "<dbg>" : ( byte* ) "dbg" ) ; //, (char*) ReadLine_GetPrompt ( _Context_->ReadLiner0 ) ) ;
    Debugger_SetNewLine ( debugger, false ) ;
}

void
_Debugger_DoState ( Debugger * debugger )
{
    if ( GetState ( debugger, DBG_RETURN ) )
    {
        _Printf ( ( byte* ) "\r" ) ;
        SetState ( debugger, DBG_RETURN, false ) ;
    }
    if ( GetState ( debugger, DBG_MENU ) )
    {
        Debugger_Menu ( debugger ) ;
        SetState ( debugger, DBG_FILENAME_LOCATION_SHOWN, false ) ;
    }
    if ( GetState ( debugger, DBG_INFO ) ) Debugger_ShowInfo ( debugger, GetState ( debugger, DBG_RUNTIME ) ? ( byte* ) "<dbg>" : ( byte* ) "dbg", 0 ) ;
    else if ( GetState ( debugger, DBG_PROMPT ) ) Debugger_ShowState ( debugger, GetState ( debugger, DBG_RUNTIME ) ? ( byte* ) "<dbg>" : ( byte* ) "dbg" ) ;

    //if ( GetState ( debugger, DBG_NEWLINE ) && ( ! GetState ( debugger, DBG_INFO ) ) ) _Debugger_DoNewlinePrompt ( debugger ) ;
    else if ( GetState ( debugger, DBG_STEPPING | DBG_CONTINUE_MODE ) ) //&& ( ! GetState ( debugger, DBG_INFO ) ) )
    {
        if ( GetState ( debugger, DBG_START_STEPPING ) ) _Printf ( ( byte* ) "\n ... Next stepping instruction ..." ) ;
        SetState ( debugger, DBG_START_STEPPING, false ) ;
        debugger->cs_Cpu->Rip = ( uint64 * ) debugger->DebugAddress ;
        Debugger_UdisOneInstruction ( debugger, debugger->DebugAddress, ( byte* ) "\r", ( byte* ) "" ) ;
    }
    //debugger->PreHere = Here ;
}

void
LO_Debug_ExtraShow ( int64 showStackFlag, int64 verbosity, int64 wordList, byte *format, ... )
{
    if ( GetState ( _CfrTil_, DEBUG_MODE ) )
    {
        if ( _Q_->Verbosity > verbosity )
        {
            va_list args ;
            va_start ( args, ( char* ) format ) ;
            char * out = ( char* ) Buffer_Data ( _CfrTil_->DebugB ) ;
            vsprintf ( ( char* ) out, ( char* ) format, args ) ;
            va_end ( args ) ;
            DebugColors ;
            if ( wordList ) _CfrTil_SC_WordList_Show ( ( byte* ) out, 0, 0 ) ;
            else
            {
                printf ( "%s", out ) ;
                fflush ( stdout ) ;
            }

            if ( showStackFlag && _Q_->Verbosity > verbosity ) Stack ( ) ;
            DefaultColors ;
        }
    }
}

