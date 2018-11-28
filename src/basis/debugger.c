
#include "../include/cfrtil64.h"

void
_Debugger_InterpreterLoop ( Debugger * debugger )
{
    do
    {
        _Debugger_DoState ( debugger ) ;
        if ( ! GetState ( _Debugger_, DBG_AUTO_MODE | DBG_AUTO_MODE_ONCE ) )
        {
            debugger->Key = Key ( ) ;
            if ( debugger->Key != 'z' ) debugger->SaveKey = debugger->Key ;
        }
        SetState ( _Debugger_, DBG_AUTO_MODE_ONCE, false ) ;
        debugger->CharacterFunctionTable [ debugger->CharacterTable [ debugger->Key ] ] ( debugger ) ;
    }
    while ( GetState ( debugger, DBG_STEPPING ) || ( ! GetState ( debugger, DBG_INTERPRET_LOOP_DONE ) ) ||
        ( ( GetState ( debugger, DBG_AUTO_MODE ) ) && ( ! ( GetState ( debugger, DBG_EVAL_AUTO_MODE ) ) ) ) ) ;
    SetState ( debugger, DBG_STACK_OLD, true ) ;
    if ( GetState ( debugger, DBG_STEPPED ) )
    {
        Set_DataStackPointers_FromDebuggerDspReg ( ) ;
        if ( debugger->w_Word ) SetState ( debugger->w_Word, STEPPED, true ) ;
        if ( ! Stack_Depth ( debugger->ReturnStack ) )
        {
            Debugger_Off ( debugger, 1 ) ;
            SetState ( _Context_->CurrentEvalWord, STEPPED, true ) ;
            siglongjmp ( _Context_->JmpBuf0, 1 ) ; //in Word_Run
        }
        else if ( ( ! debugger->w_Word ) || GetState ( debugger->w_Word, STEPPED ) ) SetState ( _Context_->CurrentEvalWord, STEPPED, true ) ;
    }
}

Boolean
_Debugger_PreSetup ( Debugger * debugger, Word * word, byte * token, Boolean forceFlag )
{
    if ( ( Is_DebugModeOn && Is_DebugShowOn ) || forceFlag )
    {
        if ( forceFlag || GetState ( debugger, DBG_EVAL_AUTO_MODE ) || ( ! GetState ( debugger, DBG_AUTO_MODE | DBG_STEPPING ) ) )
        {
            if ( ! word ) word = Context_CurrentWord () ;
            if ( word && ( ! word->W_WordListOriginalWord ) ) word->W_WordListOriginalWord = word ;
            if ( ( ! debugger->LastSetupWord ) || ( ( debugger->LastSetupWord != word ) && ( word && ( ! String_Equal ( debugger->LastSetupWord->Name, word->Name ) ) ) ) )
            {
                debugger->w_Word = word ;
                if ( ( word && word->Name[0] ) || token )
                {
                    if ( ! sigsetjmp ( _Context_->JmpBuf0, 0 ) ) // used by CfrTil_DebugRuntimeBreakpoint
                    {
                        if ( forceFlag ) debugger->LastShowWord = 0 ;
                        SetState ( debugger, DBG_COMPILE_MODE, CompileMode ) ;
                        SetState_TrueFalse ( debugger, DBG_ACTIVE | DBG_INFO | DBG_PROMPT, DBG_INTERPRET_LOOP_DONE | DBG_PRE_DONE | DBG_CONTINUE | DBG_STEPPING | DBG_STEPPED ) ;
                        if ( word ) debugger->TokenStart_ReadLineIndex = word->W_RL_Index ;
                        debugger->SaveDsp = _Dsp_ ;
                        if ( ! debugger->StartHere ) debugger->StartHere = Here ;
                        debugger->WordDsp = _Dsp_ ;
                        debugger->SaveTOS = TOS ;
                        debugger->Token = word->Name ? word->Name : token ;
                        debugger->PreHere = Here ;
                        _Namespace_FreeNamespacesStack ( debugger->LocalsNamespacesStack ) ;

                        DebugColors ;
                        _Debugger_InterpreterLoop ( debugger ) ; // core of this function
                        DefaultColors ;

                        debugger->ReadIndex = _ReadLiner_->ReadIndex ;
                        debugger->DebugAddress = 0 ;
                        SetState ( debugger, DBG_MENU, false ) ;
                        debugger->LastSetupWord = word ;
                    }
                    else
                    {
                        Set_DataStackPointers_FromDebuggerDspReg ( ) ; // back from _CfrTil_DebugRuntimeBreakpoint
                        return true ; // true == done
                    }
                }
            }
        }
    }
    return false ;
}

void
Debugger_On ( Debugger * debugger )
{
    _Debugger_Init ( debugger, 0, 0 ) ;
    SetState_TrueFalse ( _Debugger_, DBG_MENU | DBG_INFO, DBG_STEPPING | DBG_AUTO_MODE | DBG_PRE_DONE | DBG_INTERPRET_LOOP_DONE ) ;
    debugger->LastSetupWord = 0 ;
    debugger->LastSourceCodeIndex = 0 ;
    debugger->PreHere = 0 ;
    if ( ! Is_DebugModeOn ) debugger->StartHere = Here ;
    DebugOn ;
    DebugShow_On ;
}

void
_Debugger_Off ( Debugger * debugger )
{
    if ( debugger )
    {
        Stack_Init ( debugger->ReturnStack ) ;
        debugger->StartHere = 0 ;
        debugger->PreHere = 0 ;
        debugger->DebugAddress = 0 ;
        SetState ( debugger->cs_Cpu, CPU_SAVED, false ) ;
        debugger->w_Word = 0 ;
        SetState ( debugger, DBG_STACK_OLD, true ) ;
        debugger->CopyRSP = 0 ;
        SetState ( _Debugger_, DBG_BRK_INIT | DBG_ACTIVE | DBG_STEPPING | DBG_PRE_DONE | DBG_AUTO_MODE | DBG_EVAL_AUTO_MODE, false ) ;
    }
}

void
Debugger_Off ( Debugger * debugger, int64 debugOffFlag )
{
    _Debugger_Off ( debugger ) ;
    if ( debugOffFlag ) DebugOff ;
}

byte *
Debugger_GetDbgAddressFromRsp ( Debugger * debugger )
{
    Word * word, *lastWord = 0, *currentlyRunning = Word_UnAlias ( _Context_->CurrentlyRunningWord ) ;
    byte * addr, *retAddr ;
    int64 i, d ;
    dllist * retStackList = List_New ( COMPILER_TEMP ) ;
    //if ( Is_DebugOn ) _Q_->Verbosity = 2 ;
    if ( _Q_->Verbosity > 1 ) CfrTil_PrintReturnStack ( ) ;
    for ( i = 1 ; i < 255 ; i ++ ) // Rsp[1] is current // 255 sizeof ReturnStack
    {
        addr = ( ( byte* ) debugger->cs_Cpu->Rsp[i] ) ;
        word = Word_UnAlias ( Word_GetFromCodeAddress ( addr ) ) ;
        if ( word )
        {
            _List_PushNew_1Value ( retStackList, COMPILER_TEMP, 0, debugger->cs_Cpu->Rsp[i] ) ;
            if ( word == currentlyRunning )
            {
                //_List_PushNew_1Value ( retStackList, COMPILER_TEMP, 0, 0 ) ; // end marker
                break ;
            }
        }
    }
    d = List_Depth ( retStackList ) ;
    if ( d > 1 )
    {
        Stack_Init ( debugger->ReturnStack ) ;
        for ( i = 0 ; i < d ; i ++ )
        {
            retAddr = ( byte * ) List_Pop_1Value ( retStackList ) ; //List_Pop ( retStackList ) ;
            if ( retAddr )
            {
                word = Word_UnAlias ( Word_GetFromCodeAddress ( retAddr ) ) ;
                if ( word && ( word == lastWord ) ) continue ;
                lastWord = word ;
            }
            Stack_Push ( debugger->ReturnStack, ( uint64 ) retAddr ) ;
        }
        if ( _Q_->Verbosity > 1 ) Stack_Print ( debugger->ReturnStack, ( byte* ) "debugger->ReturnStack ", 0 ) ;
        debugger->DebugAddress = ( byte* ) Stack_Top ( debugger->ReturnStack ) ;
    }
    else debugger->DebugAddress = ( byte* ) debugger->cs_Cpu->Rsp[1] ;
    debugger->w_Word = Word_UnAlias ( Word_GetFromCodeAddress ( debugger->DebugAddress ) ) ; // 21 : code size back to <dbg>
    return debugger->DebugAddress ;
}

void
_Debugger_Init ( Debugger * debugger, Word * word, byte * address )
{
    DebugColors ;
    Debugger_UdisInit ( debugger ) ;
    debugger->SaveDsp = _Dsp_ ;
    debugger->SaveTOS = TOS ;
    debugger->Key = 0 ;
    Stack_Init ( debugger->ReturnStack ) ;

    if ( address ) debugger->DebugAddress = address ;
    if ( ! GetState ( debugger, DBG_BRK_INIT ) ) debugger->State = DBG_MENU | DBG_INFO | DBG_PROMPT ;
    else if ( debugger->DebugAddress ) debugger->w_Word = word = Word_GetFromCodeAddress ( debugger->DebugAddress ) ;
    if ( GetState ( debugger, DBG_BRK_INIT ) && debugger->cs_Cpu->Rsp )
    {
        // remember : _Compile_CpuState_Save ( _Debugger_->cs_Cpu ) ; is called thru _Compile_Debug : <dbg>/<dso>
        debugger->DebugAddress = Debugger_GetDbgAddressFromRsp ( debugger ) ; //( byte* ) debugger->cs_Cpu->Rsp[1] ;
        if ( debugger->DebugAddress && ( ! debugger->w_Word ) )
        {
            byte * da ;
#if 0            
            debugger->w_Word = word = Word_GetFromCodeAddress ( debugger->DebugAddress ) ;
#endif            
            byte * offsetAddress = Calculate_Address_FromOffset_ForCallOrJump ( debugger->DebugAddress ) ;
            if ( ! debugger->w_Word )
            {
                da = debugger->DebugAddress ;
                debugger->w_Word = word = Word_GetFromCodeAddress ( offsetAddress ) ;
            }
            if ( _Q_->Verbosity > 3 )
            {
                if ( ! word )
                {
                    AlertColors ;
                    _CfrTil_PrintNReturnStack ( 8, 1 ) ;
                    debugger->w_Word = _Context_->CurrentlyRunningWord ;
                    debugger->DebugAddress = debugger->w_Word->CodeStart ; //Definition ; //CodeAddress ;
                    _Printf ( ( byte* ) "\n\n%s : Can't find a word at this address : 0x%016lx : or it offset adress : 0x%016lx :  "
                        "\nUsing _Context_->CurrentlyRunningWord : \'%s\' : address = 0x%016lx : debugger->DebugESP [1] = 0x%016lx",
                        Context_Location ( ), da, offsetAddress, debugger->w_Word->Name, debugger->DebugAddress, debugger->DebugRSP ? debugger->DebugRSP [1] : 0 ) ; //but here is some disassembly at the considered \"EIP address\" : \n" ) ;
                    DebugColors ;
                }
                _CfrTil_PrintNReturnStack ( 4, 1 ) ;
            }
        }
    }
    if ( word && ( ! GetState ( debugger, DBG_INTERPRET_LOOP_DONE ) ) || ( ! ( debugger->w_Word ) ) ) debugger->w_Word = word ;
    if ( debugger->w_Word ) debugger->Token = debugger->w_Word->Name ;
    else
    {
        debugger->w_Word = _Context_->CurrentlyRunningWord ;
        if ( _Context_->CurrentlyRunningWord ) debugger->Token = _Context_->CurrentlyRunningWord->Name ;
    }
    debugger->CopyRSP = 0 ;
    SetState ( debugger, ( DBG_STACK_OLD ), true ) ;
    SetState ( debugger, DBG_STEPPING, false ) ;
}

byte *
Debugger_GetStateString ( Debugger * debugger )
{
    byte * buffer = Buffer_Data ( _CfrTil_->DebugB ) ;
    sprintf ( ( char* ) buffer, "%s : %s : %s",
        GetState ( debugger, DBG_STEPPING ) ? "Stepping" : ( CompileMode ? ( char* ) "Compiling" : ( char* ) "Interpreting" ),
        ( GetState ( _CfrTil_, INLINE_ON ) ? ( char* ) "InlineOn" : ( char* ) "InlineOff" ),
        ( GetState ( _CfrTil_, OPTIMIZE_ON ) ? ( char* ) "OptimizeOn" : ( char* ) "OptimizeOff" )
        ) ;
    buffer = String_New ( ( byte* ) buffer, TEMPORARY ) ;

    return buffer ;
}

void
Debugger_NextToken ( Debugger * debugger )
{
    if ( ReadLine_IsThereNextChar ( _Context_->ReadLiner0 ) ) debugger->Token = Lexer_ReadToken ( _Context_->Lexer0 ) ;

    else debugger->Token = 0 ;
}

void
Debugger_CurrentToken ( Debugger * debugger )
{
    debugger->Token = _Context_->Lexer0->OriginalToken ;
}

void
Debugger_Parse ( Debugger * debugger )
{
    Lexer_ParseObject ( _Context_->Lexer0, _Context_->Lexer0->OriginalToken ) ;
}

void
_Debugger_FindAny ( Debugger * debugger )
{

    if ( debugger->Token ) debugger->w_Word = _CfrTil_FindInAnyNamespace ( debugger->Token ) ;
}

void
Debugger_FindAny ( Debugger * debugger )
{
    _Debugger_FindAny ( debugger ) ;
    if ( debugger->w_Word ) _Printf ( ( byte* ) ( byte* ) "\nFound Word :: %s.%s\n", debugger->w_Word->S_ContainingNamespace->Name, debugger->w_Word->Name ) ;

    else _Printf ( ( byte* ) ( byte* ) "\nToken not found : %s\n", debugger->Token ) ;
}

void
Debugger_GotoList_Print ( Debugger * debugger )
{
    Compiler_GotoList_Print ( ) ;
}

void
Debugger_Print_LispDefinesNamespace ( Debugger * debugger )
{
    LC_Print_LispDefinesNamespace ( ) ;
}

void
Debugger_FindUsing ( Debugger * debugger )
{
    if ( debugger->Token ) debugger->w_Word = Finder_Word_FindUsing ( _Context_->Finder0, debugger->Token, 0 ) ;
}

void
_Debugger_PrintDataStack ( int64 depth )
{
    //Set_DataStackPointer_FromDspReg ( ) ;
    _Stack_Print ( _DataStack_, ( byte* ) "DataStack", depth, 0 ) ;
    //if (depth < Stack_Depth (_DataStack_) ) _Printf ( ( byte* ) "\t\t    ........." ) ;
}

void
Debugger_Variables ( Debugger * debugger )
{
    CfrTil_Variables ( ) ;
}

void
Debugger_Using ( Debugger * debugger )
{
    CfrTil_Using ( ) ;
}
// by 'eval' we stop debugger->Stepping and //continue thru this word as if we hadn't stepped

void
_Debugger_Eval ( Debugger * debugger, Boolean continueFlag )
{
    debugger->SaveStackDepth = DataStack_Depth ( ) ;
    debugger->WordDsp = _Dsp_ ;
    if ( continueFlag && Debugger_IsStepping ( debugger ) ) Debugger_Continue ( debugger ) ;
    SetState_TrueFalse ( debugger, DBG_INTERPRET_LOOP_DONE | DBG_EVAL_AUTO_MODE, DBG_STEPPING ) ;
    if ( GetState ( debugger, DBG_AUTO_MODE ) ) SetState ( debugger, DBG_EVAL_AUTO_MODE, true ) ;
    debugger->PreHere = Here ;
}

void
Debugger_Eval ( Debugger * debugger )
{
    _Debugger_Eval ( debugger, 1 ) ;
}

void
Debugger_SetupNextToken ( Debugger * debugger )
{
    Debugger_NextToken ( debugger ) ;
    Debugger_FindUsing ( debugger ) ;
}

void
Debugger_Info ( Debugger * debugger )
{
    if ( GetState ( debugger, DBG_STEPPING ) ) Debugger_Step ( debugger ) ;
    else SetState ( debugger, DBG_INFO, true ) ;
}

void
Debugger_DoMenu ( Debugger * debugger )
{
    SetState ( debugger, DBG_MENU | DBG_PROMPT | DBG_NEWLINE, true ) ;
}

void
Debugger_Stack ( Debugger * debugger )
{
    if ( GetState ( debugger, DBG_STEPPING ) || GetState ( debugger->cs_Cpu, CPU_SAVED ) )
    {
        Set_DataStackPointers_FromDebuggerDspReg ( ) ;
        _Debugger_PrintDataStack ( Stack_Depth ( _DataStack_ ) ) ; // stack has been adjusted 
        _Printf ( ( byte* ) "\n" ) ;
        SetState ( debugger, DBG_INFO, true ) ;
    }
    else _Debugger_PrintDataStack ( Stack_Depth ( _DataStack_ ) ) ;
}

void
Debugger_ReturnStack ( Debugger * debugger )
{
    CfrTil_PrintReturnStack ( ) ;
}

void
Debugger_Source ( Debugger * debugger )
{
    Word * scWord = Compiling ? _CfrTil_->CurrentWordBeingCompiled : GetState ( debugger, DBG_STEPPING ) ?
        Word_UnAlias ( Debugger_GetWordFromAddress ( debugger ) ) : _Context_->CurrentlyRunningWord ;
    _CfrTil_Source ( scWord, 0 ) ; //debugger->w_Word ? debugger->w_Word : _CfrTil_->DebugWordListWord, 0 ) ;
    SetState ( debugger, DBG_INFO, true ) ;
}

void
_Debugger_CpuState_Show ( )
{
    _CpuState_Show ( _Debugger_->cs_Cpu ) ;
}

void
_Debugger_CpuState_CheckSave ( Debugger * debugger )
{
    if ( ! GetState ( debugger->cs_Cpu, CPU_SAVED ) )
    {
        debugger->SaveCpuState ( ) ;
        SetState ( debugger->cs_Cpu, CPU_SAVED, true ) ;
    }
}

void
Debugger_CpuState_CheckSaveShow ( Debugger * debugger )
{
    _Debugger_CpuState_CheckSave ( debugger ) ;
    _Debugger_CpuState_Show ( ) ;
}

void
Debugger_Registers ( Debugger * debugger )
{
    Debugger_CpuState_CheckSaveShow ( debugger ) ;
}

void
Debugger_CfrTilRegisters ( Debugger * debugger )
{
    _CfrTil_CpuState_CheckSave ( ) ;
    CfrTil_CpuState_Show ( ) ;
}

void
Debugger_Continue ( Debugger * debugger )
{
    if ( GetState ( debugger, DBG_RUNTIME_BREAKPOINT ) || ( GetState ( debugger, DBG_STEPPING ) && debugger->DebugAddress ) )
    {
        debugger->Key = debugger->SaveKey ;
        // continue stepping thru
        SetState ( debugger, ( DBG_AUTO_MODE | DBG_CONTINUE_MODE ), true ) ;
        while ( debugger->DebugAddress )
        {
            if ( GetState ( debugger, ( DBG_AUTO_MODE | DBG_CONTINUE_MODE ) ) ) Debugger_Step ( debugger ) ;
            else return ;
        }
        SetState_TrueFalse ( debugger, DBG_STEPPED, DBG_STEPPING ) ;
        SetState ( debugger, DBG_INTERPRET_LOOP_DONE, true ) ;
        SetState ( debugger, DBG_AUTO_MODE | DBG_CONTINUE_MODE, false ) ;
    }
    else if ( debugger->w_Word )
    {
        Debugger_Eval ( debugger ) ;
        Debugger_Off ( debugger, 1 ) ;
    }
}

void
Debugger_Quit ( Debugger * debugger )
{

    _Printf ( ( byte* ) "\nDebugger_Quit.\n" ) ;
    Debugger_Off ( debugger, 1 ) ;
    _Throw ( QUIT ) ;
}

void
Debugger_Abort ( Debugger * debugger )
{

    _Printf ( ( byte* ) "\nDebugger_Abort.\n" ) ;
    Debugger_Off ( debugger, 1 ) ;
    _Throw ( ABORT ) ;
}

void
Debugger_Stop ( Debugger * debugger )
{
    _Printf ( ( byte* ) "\nDebugger_Stop.\n" ) ;
    Debugger_Off ( debugger, 1 ) ;
    _Throw ( STOP ) ;
}

void
Debugger_InterpretLine_WithStartString ( byte * str )
{
    _CfrTil_Contex_NewRun_1 ( _CfrTil_, ( ContextFunction_1 ) CfrTil_InterpretPromptedLine, str ) ; // can't clone cause we may be in a file and we want input from stdin
}

void
Debugger_InterpretLine ( )
{
    Debugger_InterpretLine_WithStartString ( "" ) ;
}

void
Debugger_Escape ( Debugger * debugger )
{
    uint64 saveSystemState = _Context_->System0->State ;
    uint64 saveDebuggerState = debugger->State, svScState = GetState ( _CfrTil_, SOURCE_CODE_ON ) ;
    SetState ( _CfrTil_, SOURCE_CODE_ON, false ) ;
    SetState ( _Context_->System0, ADD_READLINE_TO_HISTORY, true ) ;
    SetState_TrueFalse ( debugger, DBG_COMMAND_LINE | DBG_ESCAPED, DBG_ACTIVE ) ;
    _Debugger_ = Debugger_Copy ( debugger, TEMPORARY ) ;
    DefaultColors ;
    DebugOff ;
    int64 svcm = Get_CompileMode ( ) ;
    Set_CompileMode ( false ) ;
    byte * lexerTokenBuffer = _Buffer_New_pbyte ( BUFFER_SIZE, N_UNLOCKED ) ;
    strcpy ( lexerTokenBuffer, _CfrTil_->TokenBuffer ) ;

    Debugger_InterpretLine ( ) ;

    strcpy ( _CfrTil_->TokenBuffer, lexerTokenBuffer ) ;
    Set_CompileMode ( svcm ) ;
    DebugOn ;
    DebugColors ;
    _Debugger_ = debugger ;
    SetState ( _Context_->System0, ADD_READLINE_TO_HISTORY, saveSystemState ) ; // reset state 
    debugger->State = saveDebuggerState ;
    _Context_->System0->State = saveSystemState ;
    SetState_TrueFalse ( debugger, DBG_ACTIVE | DBG_INFO, DBG_STEPPED | DBG_AUTO_MODE | DBG_AUTO_MODE_ONCE | DBG_INTERPRET_LOOP_DONE | DBG_COMMAND_LINE | DBG_ESCAPED ) ;
    SetState ( _CfrTil_, SOURCE_CODE_ON, svScState ) ;
    if ( GetState ( debugger, DBG_STEPPING ) ) SetState ( debugger, DBG_START_STEPPING, true ) ;
}

void
Debugger_AutoMode ( Debugger * debugger )
{
    if ( ! GetState ( debugger, DBG_AUTO_MODE ) )
    {
        if ( ( debugger->SaveKey == 's' ) || ( debugger->SaveKey == 'o' ) || ( debugger->SaveKey == 'i' ) || ( debugger->SaveKey == 'e' ) || ( debugger->SaveKey == 'c' ) ) // not everything makes sense here
        {
            AlertColors ;
            if ( debugger->SaveKey == 'c' )
            {
                _Printf ( ( byte* ) "\nContinuing : automatically repeating key \'e\' ..." ) ;
                debugger->SaveKey = 'e' ;
            }
            else _Printf ( ( byte* ) "\nDebugger :: Starting AutoMode : automatically repeating key :: \'%c\' ...", debugger->SaveKey ) ;
            DefaultColors ;
            SetState ( debugger, DBG_AUTO_MODE, true ) ;
        }
        else _Printf ( ( byte* ) "\nDebugger :: AutoMode : does not support repeating key :: \'%c\' ...", debugger->SaveKey ) ;
    }
    debugger->Key = debugger->SaveKey ;

    if ( GetState ( debugger, DBG_STEPPING ) ) Debugger_Continue ( debugger ) ;
}

void
Debugger_OptimizeToggle ( Debugger * debugger )
{
    if ( GetState ( _CfrTil_, OPTIMIZE_ON ) ) SetState ( _CfrTil_, OPTIMIZE_ON, false ) ;

    else SetState ( _CfrTil_, OPTIMIZE_ON, true ) ;
    _CfrTil_SystemState_Print ( 0 ) ;
}

void
Debugger_CodePointerUpdate ( Debugger * debugger )
{
    if ( debugger->w_Word && ( ! debugger->DebugAddress ) )
    {

        debugger->DebugAddress = ( byte* ) debugger->w_Word->Definition ;
        _Printf ( ( byte* ) "\ncodePointer = 0x%08x", ( int64 ) debugger->DebugAddress ) ;
    }
}

void
Debugger_Dump ( Debugger * debugger )
{
    if ( ! debugger->w_Word )
    {
        if ( debugger->DebugAddress ) __CfrTil_Dump ( ( byte * ) debugger->DebugAddress, ( uint64 ) ( Here - ( int64 ) debugger->DebugAddress ), 8 ) ;
    }

    else __CfrTil_Dump ( ( byte * ) debugger->w_Word->CodeStart, ( uint64 ) debugger->w_Word->S_CodeSize, 8 ) ;
    SetState ( debugger, DBG_INFO, true ) ;
}

void
Debugger_Default ( Debugger * debugger )
{
    if ( isgraph ( debugger->Key ) )
    {
        _Printf ( ( byte* ) "\ndbg :> %c <: is not an assigned key code", debugger->Key ) ;
    }
    else
    {
        _Printf ( ( byte* ) "\ndbg :> <%d> <: is not an assigned key code", debugger->Key ) ;
    }
}

void
_Debugger_State ( Debugger * debugger )
{
    byte * buf = Buffer_Data ( _CfrTil_->DebugB2 ) ;
    _CfrTil_GetSystemState_String0 ( buf ) ;
    _Printf ( ( byte* ) buf ) ;
}

void
_Debugger_Copy ( Debugger * debugger, Debugger * debugger0 )
{
    MemCpy ( debugger, debugger0, sizeof (Debugger ) ) ;
}

Debugger *
Debugger_Copy ( Debugger * debugger0, uint64 type )
{
    Debugger * debugger = ( Debugger * ) Mem_Allocate ( sizeof (Debugger ), type ) ;
    _Debugger_Copy ( debugger, debugger0 ) ;
    return debugger ;
}

void
Debugger_Delete ( Debugger * debugger )
{
    Mem_FreeItem ( &_Q_->PermanentMemList, ( byte* ) debugger ) ;
}

Debugger *
_Debugger_New ( uint64 type )
{
    Debugger * debugger = ( Debugger * ) Mem_Allocate ( sizeof (Debugger ), type ) ;
    debugger->cs_Cpu = CpuState_New ( type ) ;
    debugger->StepInstructionBA = ByteArray_AllocateNew ( 8 * K, type ) ; //Debugger_ByteArray_AllocateNew ( 8 * K, type ) ;
    debugger->ReturnStack = Stack_New ( 256, type ) ;
    //debugger->LocalsNamespacesStack = Stack_New ( 32, type ) ;

    Debugger_TableSetup ( debugger ) ;
    SetState ( debugger, DBG_INTERPRET_LOOP_DONE, true ) ;
    SetState ( debugger, DBG_STEPPING, false ) ;
    Debugger_UdisInit ( debugger ) ;
    debugger->TerminalLineWidth = 120 ; // (tw > 145) ? tw : 145 ;

    return debugger ;
}

// nb! : not test for a while

void
_CfrTil_Debug_AtAddress ( byte * address )
{
    if ( ! GetState ( _Debugger_, DBG_ACTIVE ) )
    {
        _Debugger_Init ( _Debugger_, 0, address ) ;
    }
    else
    {
        _CfrTil_DebugContinue ( 1 ) ;
    }
}

void
_CfrTil_DebugContinue ( int64 autoFlagOff )
{
    if ( GetState ( _Debugger_, DBG_AUTO_MODE ) )
    {
        if ( autoFlagOff ) SetState ( _Debugger_, DBG_AUTO_MODE, false ) ;
    }
}

void
Debugger_TableSetup ( Debugger * debugger )
{
    int64 i ;
    for ( i = 0 ; i < 128 ; i ++ ) debugger->CharacterTable [ i ] = 0 ;
    debugger->CharacterTable [ 0 ] = 0 ;
    debugger->CharacterTable [ 'o' ] = 1 ;
    debugger->CharacterTable [ 'i' ] = 1 ;
    debugger->CharacterTable [ 'u' ] = 1 ;
    debugger->CharacterTable [ 's' ] = 1 ;
    debugger->CharacterTable [ 'h' ] = 1 ;
    debugger->CharacterTable [ 'e' ] = 2 ;
    debugger->CharacterTable [ 'w' ] = 3 ;
    debugger->CharacterTable [ 'd' ] = 4 ;
    debugger->CharacterTable [ 'I' ] = 5 ;
    debugger->CharacterTable [ 'm' ] = 6 ;
    //debugger->CharacterTable [ 'T' ] = 7 ;
    debugger->CharacterTable [ 't' ] = 7 ;
    debugger->CharacterTable [ 'Z' ] = 8 ;
    debugger->CharacterTable [ 'U' ] = 9 ;
    //debugger->CharacterTable [ 'V' ] = 8 ;
    debugger->CharacterTable [ 'r' ] = 10 ;
    debugger->CharacterTable [ 'g' ] = 10 ;
    debugger->CharacterTable [ 'c' ] = 11 ;
    debugger->CharacterTable [ ' ' ] = 11 ;
    debugger->CharacterTable [ 'q' ] = 12 ;
    debugger->CharacterTable [ 'f' ] = 14 ;
    debugger->CharacterTable [ '\\'] = 15 ;
    debugger->CharacterTable [ '\n' ] = 15 ;
    debugger->CharacterTable [ 27 ] = 15 ;
    debugger->CharacterTable [ 'G' ] = 16 ;
    debugger->CharacterTable [ 'n' ] = 17 ;
    debugger->CharacterTable [ 'p' ] = 18 ;
    debugger->CharacterTable [ 'a' ] = 20 ;
    debugger->CharacterTable [ 'z' ] = 21 ;
    debugger->CharacterTable [ 'w' ] = 22 ;
    debugger->CharacterTable [ 'B' ] = 23 ;
    debugger->CharacterTable [ 'P' ] = 24 ;
    debugger->CharacterTable [ 'l' ] = 25 ;
    debugger->CharacterTable [ 'v' ] = 26 ;
    debugger->CharacterTable [ 'S' ] = 27 ;
    debugger->CharacterTable [ 'A' ] = 28 ;
    debugger->CharacterTable [ 'N' ] = 29 ;
    debugger->CharacterTable [ 'R' ] = 30 ;
    debugger->CharacterTable [ 'H' ] = 31 ;
    debugger->CharacterTable [ 'O' ] = 32 ;
    debugger->CharacterTable [ 'Q' ] = 33 ;
    debugger->CharacterTable [ 'L' ] = 34 ;
    debugger->CharacterTable [ 'X' ] = 35 ;
    debugger->CharacterTable [ 'T' ] = 36 ;

    // debugger : system related
    debugger->CharacterFunctionTable [ 0 ] = Debugger_Default ;
    debugger->CharacterFunctionTable [ 1 ] = Debugger_Step ;
    debugger->CharacterFunctionTable [ 2 ] = Debugger_Eval ;

    // debugger internal
    debugger->CharacterFunctionTable [ 4 ] = Debugger_Dis ;
    debugger->CharacterFunctionTable [ 5 ] = Debugger_Info ;
    debugger->CharacterFunctionTable [ 6 ] = Debugger_DoMenu ;
    debugger->CharacterFunctionTable [ 7 ] = Debugger_Stack ;
    //debugger->CharacterFunctionTable [ 8 ] = Debugger_DWL_ShowList ;
    debugger->CharacterFunctionTable [ 9 ] = Debugger_Source ;
    debugger->CharacterFunctionTable [ 10 ] = Debugger_Registers ;
    debugger->CharacterFunctionTable [ 11 ] = Debugger_Continue ;
    debugger->CharacterFunctionTable [ 12 ] = Debugger_Quit ;
    debugger->CharacterFunctionTable [ 13 ] = Debugger_Parse ;
    debugger->CharacterFunctionTable [ 14 ] = Debugger_FindAny ;
    debugger->CharacterFunctionTable [ 15 ] = Debugger_Escape ;
    debugger->CharacterFunctionTable [ 16 ] = Debugger_OptimizeToggle ;
    debugger->CharacterFunctionTable [ 17 ] = Debugger_CodePointerUpdate ;
    debugger->CharacterFunctionTable [ 18 ] = Debugger_Dump ;
    //debugger->CharacterFunctionTable [ 19 ] = Debugger_ConsiderAndShowWord ; // fix me
    debugger->CharacterFunctionTable [ 20 ] = Debugger_DisassembleAccumulated ;
    debugger->CharacterFunctionTable [ 21 ] = Debugger_AutoMode ;
    debugger->CharacterFunctionTable [ 22 ] = Debugger_WDis ;
    debugger->CharacterFunctionTable [ 23 ] = Debugger_Abort ;
    debugger->CharacterFunctionTable [ 24 ] = Debugger_Stop ;
    debugger->CharacterFunctionTable [ 25 ] = Debugger_Locals_Show ;
    debugger->CharacterFunctionTable [ 26 ] = Debugger_Variables ;
    debugger->CharacterFunctionTable [ 27 ] = _Debugger_State ;
    debugger->CharacterFunctionTable [ 28 ] = Debugger_DisassembleTotalAccumulated ;
    debugger->CharacterFunctionTable [ 29 ] = Debugger_Using ;
    debugger->CharacterFunctionTable [ 30 ] = Debugger_ReturnStack ;
    debugger->CharacterFunctionTable [ 31 ] = DebugWordList_Show_All ;
    debugger->CharacterFunctionTable [ 32 ] = DebugWordList_Show_InUse ;
    debugger->CharacterFunctionTable [ 33 ] = Debugger_CfrTilRegisters ;
    debugger->CharacterFunctionTable [ 34 ] = Debugger_GotoList_Print ;
    debugger->CharacterFunctionTable [ 35 ] = Debugger_Print_LispDefinesNamespace ;
    debugger->CharacterFunctionTable [ 36 ] = Debugger_ShowTypeWordStack ;
}


