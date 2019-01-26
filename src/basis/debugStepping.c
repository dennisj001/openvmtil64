
#include "../include/cfrtil64.h"

void
_Debugger_StepOneInstruction ( Debugger * debugger )
{
    //Set_DebuggerDspReg_FromDspReg ( ) ;
    debugger->SaveTOS = TOS ;
    debugger->PreHere = Here ;
    debugger->SaveStackDepth = DataStack_Depth ( ) ;
    ( ( VoidFunction ) debugger->StepInstructionBA->BA_Data ) ( ) ;
    Set_DataStackPointers_FromDebuggerDspReg ( ) ;
}

// Debugger_CompileOneInstruction ::
// this function should not affect the C registers at all 
// we save them before we call our stuff and restore them after

byte *
Debugger_CompileOneInstruction ( Debugger * debugger, byte * jcAddress, Boolean showFlag )
{
    ByteArray * svcs = _Q_CodeByteArray ;
    _ByteArray_Init ( debugger->StepInstructionBA ) ; // we are only compiling one insn here so clear our BA before each use
    Set_CompilerSpace ( debugger->StepInstructionBA ) ; // now compile to this space

    _Compile_Save_C_CpuState ( _CfrTil_, showFlag ) ; //&& ( _Q_->Verbosity >= 3 ) ) ; // save our c compiler cpu register state

    _Compile_Restore_Debugger_CpuState ( debugger, showFlag ) ; //&& ( _Q_->Verbosity >= 3 ) ) ; // restore our runtime state before the current insn

    byte * nextInsn = _Debugger_CompileOneInstruction ( debugger, jcAddress ) ; // the single current stepping insn

    _Compile_Save_Debugger_CpuState ( debugger, showFlag ) ; //showRegsFlag ) ; //&& ( _Q_->Verbosity >= 3 ) ) ; // save our runtime state after the instruction : which we will restore before the next insn

    _Compile_Restore_C_CpuState ( _CfrTil_, showFlag ) ; //&& ( _Q_->Verbosity >= 3 ) ) ; // save our c compiler cpu register state

    _Compile_Return ( ) ;

    Set_CompilerSpace ( svcs ) ; // restore compiler space pointer before "do it" in case "do it" calls the compiler

    return nextInsn ;
}

void
_Debugger_CompileAndStepOneInstruction ( Debugger * debugger, byte * jcAddress )
{
    Boolean showExtraFlag = false ;
    byte * svHere = Here ; // save 
    byte * nextInsn = Debugger_CompileOneInstruction ( debugger, jcAddress, showExtraFlag ) ; // compile the insn here
    _Debugger_StepOneInstruction ( debugger ) ;
    if ( showExtraFlag ) Debug_ExtraShow ( Here - svHere, showExtraFlag ) ;
    if ( GetState ( debugger, DBG_AUTO_MODE ) ) //&& ( ! GetState ( debugger, DBG_CONTINUE_MODE ) ) ) 
    {
        SetState ( debugger, DBG_SHOW_STACK_CHANGE, false ) ;
        Debugger_UdisOneInstruction ( debugger, debugger->DebugAddress, ( byte* ) "\r", ( byte* ) "" ) ;
        if ( Compiling ) _Debugger_DisassembleWrittenCode ( debugger ) ;
    }
    else _Debugger_ShowEffects ( debugger, debugger->w_Word, GetState ( debugger, DBG_STEPPING ), showExtraFlag ) ;
    DebugColors ;
    debugger->DebugAddress = nextInsn ;
}

byte *
_Debugger_CompileOneInstruction ( Debugger * debugger, byte * jcAddress )
{
    byte * newDebugAddress ;
    int64 size ;
    Word * word = 0 ;
    size = Debugger_Udis_GetInstructionSize ( debugger ) ;
    if ( jcAddress ) // jump or call address
    {
        word = Word_UnAlias ( Word_GetFromCodeAddress ( jcAddress ) ) ;
        if ( word ) //&& ( word != debugger->w_Word ) )
        {
            debugger->w_Word = word ;
            debugger->Token = word->Name ;
            //if ( * debugger->DebugAddress == CALLI32 ) _Word_ShowSourceCode ( word ) ;
            _Context_->SourceCodeWord = word ;
        }

        if ( ( debugger->Key == 'I' ) ) // force Into a subroution
        {
            _Printf ( ( byte* ) "\nforce calling (I)nto a subroutine : %s : .... :> %s ", word ? ( char* ) c_gd ( word->Name ) : "", Context_Location ( ) ) ;
            goto into ;
        }
        else if ( ( ! word ) || ( ! Debugger_CanWeStep ( debugger, word ) ) )//( jcAddress < ( byte* ) svcs->BA_Data ) || ( jcAddress > ( byte* ) svcs->bp_Last ) )
        {
            _Printf ( ( byte* ) "\ncalling thru - a non-native (C) subroutine : %s : .... :> %s ", word ? ( char* ) c_gd ( word->Name ) : "", Context_Location ( ) ) ;
            Compile_Call_X84_ABI_RSP_ADJUST ( jcAddress ) ; // this will call jcAddress subroutine and return to our code to be compiled next
            // so that newDebugAddress, below, will be our next stepping insn
            newDebugAddress = debugger->DebugAddress + size ;
        }
        else if ( ( debugger->Key == 'h' ) || ( debugger->Key == 'o' ) )// step 't(h)ru'/(o)ver the native code like a non-native subroutine
        {
            _Printf ( ( byte* ) "\ncalling t(h)ru - a subroutine : %s : .... :> %s ", word ? ( char* ) c_gd ( word->Name ) : "", Context_Location ( ) ) ;
            Compile_Call_X84_ABI_RSP_ADJUST ( jcAddress ) ;
            newDebugAddress = debugger->DebugAddress + size ;
        }
        else if ( debugger->Key == 'u' ) // step o(u)t of the native code like a non-native subroutine
        {
            _Printf ( ( byte* ) "\nstepping thru and 'o(u)t' of a \"native\" subroutine : %s : .... :> %s ", word ? ( char* ) c_gd ( word->Name ) : "", Context_Location ( ) ) ;
            Compile_Call_X84_ABI_RSP_ADJUST ( jcAddress ) ;
            if ( Stack_Depth ( debugger->ReturnStack ) ) newDebugAddress = ( byte* ) _Stack_Pop ( debugger->ReturnStack ) ;
            else newDebugAddress = 0 ;
        }
        else // step into the the jmp/call insn
        {
into:
            while ( word->CAttribute & ( ALIAS ) ) word = word->W_AliasOf ;
            if ( ( * debugger->DebugAddress == CALLI32 ) || ( ( ( * ( uint16* ) debugger->DebugAddress ) == 0xff49 ) && ( *( debugger->DebugAddress + 2 ) == 0xd1 ) ) )
            {
                _Printf ( ( byte* ) "\nstepping into a cfrtil compiled function : %s : .... :> %s ", word ? ( char* ) c_gd ( word->Name ) : "", Context_Location ( ) ) ;
                _Stack_Push ( debugger->ReturnStack, ( int64 ) ( debugger->DebugAddress + size ) ) ; // the return address
                // push the return address this time around; next time code at newDebugAddress will be processed
                // when ret is the insn Debugger_StepOneInstruction will handle it 
                if ( _Q_->Verbosity > 1 )
                {
                    _Word_ShowSourceCode ( word ) ;
                    Stack_Print ( debugger->ReturnStack, ( byte* ) "debugger->ReturnStack ", 0 ) ;
                }
            }
            // for either jmp/call/jcc ...
            newDebugAddress = jcAddress ;
        }
    }
    else if ( debugger->Key == 'u' ) // step o(u)t of the native code like a non-native subroutine
    {
        _Printf ( ( byte* ) "\nstepping thru and out of a \"native\" subroutine : %s : .... :> %s ", word ? ( char* ) c_gd ( word->Name ) : "", Context_Location ( ) ) ;
        debugger->Key = 's' ;
        SetState ( debugger, DBG_CONTINUE_MODE | DBG_AUTO_MODE, true ) ;
        goto doDefault ;
    }
    else
    {
doDefault:
        newDebugAddress = debugger->DebugAddress + size ;
        if ( ! GetState ( debugger, DBG_JCC_INSN ) )
        {
            ByteArray_AppendCopy ( debugger->StepInstructionBA, size, debugger->DebugAddress ) ;
        }
    }
done:
    return newDebugAddress ;
}

void
Debugger_CompileAndStepOneInstruction ( Debugger * debugger )
{
    if ( debugger->DebugAddress )
    {
        byte *jcAddress = 0, *adr ;
        Word * word ;
        int64 d ;
        if ( * debugger->DebugAddress == _RET )
        {
            if ( Stack_Depth ( debugger->ReturnStack ) )
            {
                debugger->DebugAddress = ( byte* ) Stack_Pop ( debugger->ReturnStack ) ;
                if ( _Q_->Verbosity > 1 ) Stack_Print ( debugger->ReturnStack, ( byte* ) "debugger->ReturnStack ", 0 ) ;
                Debugger_GetWordFromAddress ( debugger ) ;
            }
            else
            {
                SetState ( debugger, DBG_STACK_OLD, true ) ;
                debugger->CopyRSP = 0 ;
                if ( GetState ( debugger, DBG_BRK_INIT ) ) SetState_TrueFalse ( debugger, DBG_INTERPRET_LOOP_DONE | DBG_STEPPED, DBG_ACTIVE | DBG_BRK_INIT | DBG_STEPPING ) ;
                else SetState_TrueFalse ( debugger, DBG_INTERPRET_LOOP_DONE | DBG_STEPPED, DBG_ACTIVE | DBG_STEPPING ) ;
                if ( debugger->w_Word ) SetState ( debugger->w_Word, STEPPED, true ) ;
                debugger->DebugAddress = 0 ;
                SetState ( debugger->cs_Cpu, CPU_SAVED, false ) ;
            }
            goto end ; // don't actually step a ret insn
        }
        else if ( ( * debugger->DebugAddress == JMPI32 ) || ( * debugger->DebugAddress == CALLI32 ) )
        {
            jcAddress = JumpCallInstructionAddress ( debugger->DebugAddress ) ;
doJmpCall:
            word = Word_UnAlias ( Word_GetFromCodeAddress ( jcAddress ) ) ;
            if ( word && ( word->CAttribute & ( DEBUG_WORD ) ) &&
                ( word->CAttribute2 & ( RT_STEPPING_DEBUG ) ) )
            {
                if ( ! GetState ( debugger, DBG_CONTINUE_MODE ) )
                {
                    SetState ( debugger, DBG_AUTO_MODE, false ) ;
                    // we are already stepping here and now so skip
                    _Printf ( ( byte* ) "\nskipping over a rt breakpoint debug word : %s : at 0x%-8x", ( char* ) c_gd ( word->Name ), debugger->DebugAddress ) ;
                    debugger->DebugAddress += 3 ; // 3 : sizeof call reg insn
                    goto end ; // skip it
                }
            }
        }
        else if ( ( ( ( * ( uint16* ) debugger->DebugAddress ) == 0xff49 ) && ( *( debugger->DebugAddress + 2 ) == 0xd1 ) ) )
        {
            jcAddress = JumpCallInstructionAddress_X64ABI ( debugger->DebugAddress ) ;
            goto doJmpCall ;
        }
        else if ( ( * debugger->DebugAddress == CALL_JMP_MOD_RM ) && ( _RM ( debugger->DebugAddress ) == 16 ) ) // inc/dec are also opcode == 0xff
        {
            //-----------------------------------------------------------------------
            //   modRm byte ( bits )  mod 0 : no disp ; mod 1 : 1 byte disp : mod 2 : 4 byte disp ; mod 3 : just reg value
            //    mod     reg      rm
            //   7 - 6   5 - 3   2 - 0
            //-----------------------------------------------------------------------
            byte * address = debugger->DebugAddress ;
            byte modRm = * ( byte* ) ( address + 1 ) ; // 1 : 1 byte opCode
            if ( modRm & 32 ) SyntaxError ( 1 ) ; // we only currently compile call reg code 2/3, << 3 ; not jmp; jmp reg code == 4/5 : reg code 100/101 ; inc/dec 0/1 : << 3
            int64 mod = modRm & 192 ; // 192 : CALL_JMP_MOD_RM : RM not inc/dec
            if ( mod == 192 ) jcAddress = ( byte* ) _Debugger_->cs_Cpu->Rax ;
            // else it could be inc/dec
        }
        else if ( adr = debugger->DebugAddress, ( ( * adr == 0x0f ) && ( ( * ( adr + 1 ) >> 4 ) == 0x8 ) ) ||
            ( adr = debugger->DebugAddress + 1, ( * adr == 0x0f ) && ( ( * ( adr + 1 ) >> 4 ) == 0x8 ) ) ) // jcc 
        {
            SetState ( debugger, DBG_JCC_INSN, true ) ;
            jcAddress = Debugger_DoJcc ( debugger, 2 ) ;
            _Debugger_CompileAndStepOneInstruction ( debugger, jcAddress ) ;
            SetState ( debugger, DBG_JCC_INSN, false ) ;
            goto end ;
        }
        else if ( ( ( ( byte* ) debugger->DebugAddress )[0] >> 4 ) == 7 )
        {
            SetState ( debugger, DBG_JCC_INSN, true ) ;
            jcAddress = Debugger_DoJcc ( debugger, 1 ) ;
            _Debugger_CompileAndStepOneInstruction ( debugger, jcAddress ) ;
            SetState ( debugger, DBG_JCC_INSN, false ) ;
            goto end ;
        }
        _Debugger_CompileAndStepOneInstruction ( debugger, jcAddress ) ;
end:
        if ( debugger->DebugAddress )
        {
            // keep eip - instruction pointer - up to date ..
            debugger->cs_Cpu->Rip = ( uint64 * ) debugger->DebugAddress ;
        }
    }
}

// simply : copy the current insn to a ByteArray buffer along with
// prefix and postfix instructions that restore and
// save the cpu state; then run that ByteArray code buffer

void
Debugger_PreStartStepping ( Debugger * debugger )
{
    Word * word = debugger->w_Word ;
    if ( word )
    {
        debugger->WordDsp = _Dsp_ ; // by 'eval' we stop debugger->Stepping and //continue thru this word as if we hadn't stepped
        Debugger_CanWeStep ( debugger, word ) ;
        // we would at least need to save/restore our registers to step thru native c code
        if ( ! GetState ( debugger, DBG_CAN_STEP ) )
        {
            _Printf ( ( byte* ) "\nStepping turned off for this word : %s%s%s%s : debugger->DebugAddress = 0x%016lx : (e)valuating",
                c_ud ( word->S_ContainingNamespace ? word->S_ContainingNamespace->Name : ( byte* ) "<literal> " ),
                word->S_ContainingNamespace ? ( byte* ) "." : ( byte* ) "", c_gu ( word->Name ),
                GetState ( debugger, DBG_AUTO_MODE ) ? " : automode turned off" : "",
                debugger->DebugAddress ) ;
            debugger->DebugAddress = 0 ;
            _Debugger_Eval ( debugger, 0 ) ;
            SetState ( _Debugger_, DBG_AUTO_MODE, false ) ; //if ( GetState ( debugger, DBG_AUTO_MODE ) )
            return ;
        }
        else
        {
            Debugger_SetupStepping ( debugger ) ;
            SetState ( debugger, DBG_NEWLINE | DBG_PROMPT | DBG_INFO, false ) ;
        }
    }
    else SetState_TrueFalse ( debugger, DBG_NEWLINE, DBG_STEPPING ) ;
    return ;
}

void
Debugger_Step ( Debugger * debugger )
{
    if ( ! GetState ( debugger, DBG_STEPPING ) ) Debugger_PreStartStepping ( debugger ) ;
    else
    {
        Debugger_CompileAndStepOneInstruction ( debugger ) ;
        Debugger_AfterStep ( debugger ) ;
    }
}

void
Debugger_AfterStep ( Debugger * debugger )
{
    debugger->LastRsp = debugger->cs_Cpu->Rsp ;
    if ( ( int64 ) debugger->DebugAddress ) // set by StepOneInstruction
    {
        debugger->SteppedWord = debugger->w_Word ;
        SetState_TrueFalse ( debugger, DBG_STEPPING, ( DBG_INFO | DBG_MENU | DBG_PROMPT ) ) ;
    }
    else SetState_TrueFalse ( debugger, DBG_PRE_DONE | DBG_STEPPED | DBG_NEWLINE | DBG_PROMPT | DBG_INFO, DBG_STEPPING ) ;
}

void
_Debugger_SetupStepping ( Debugger * debugger, Word * word, byte * address, byte * name )
{
    _Printf ( ( byte* ) "\nSetting up stepping : location = %s : debugger->word = \'%s\' : ...", c_gd ( _Context_Location ( _Context_ ) ), word ? word->Name : ( name ? name : ( byte* ) "" ) ) ;
    if ( word )
    {
        _CfrTil_Source ( debugger->w_Word, 0 ) ;
        if ( ( ! address ) || ( ! GetState ( debugger, ( DBG_BRK_INIT|DBG_SETUP_ADDRESS ) ) ) ) address = ( byte* ) word->Definition ;
    }
    SetState_TrueFalse ( debugger, DBG_STEPPING, DBG_NEWLINE | DBG_PROMPT | DBG_INFO | DBG_MENU ) ;
    debugger->DebugAddress = address ;
    debugger->w_Word = word ;

    SetState ( debugger->cs_Cpu, CPU_SAVED, false ) ;
    SetState ( _CfrTil_->cs_Cpu, CPU_SAVED, false ) ;
    _Debugger_CpuState_CheckSave ( debugger ) ;
    _CfrTil_CpuState_CheckSave ( ) ;
    debugger->LevelBitNamespaceMap = 0 ;
    SetState ( debugger, DBG_START_STEPPING, true ) ;
    _Debugger_->LastSourceCodeWord = 0 ;
    CfrTil_NewLine ( ) ;
}

void
Debugger_SetupStepping ( Debugger * debugger )
{
    _Debugger_SetupStepping ( debugger, debugger->w_Word, debugger->DebugAddress, 0 ) ;
}

int64
_Debugger_SetupReturnStackCopy ( Debugger * debugger, int64 size, Boolean showFlag )
{
    if ( _Q_->Verbosity > 3 ) _CfrTil_PrintNReturnStack ( 4, 1 ) ;
    uint64 * rsp = ( uint64* ) debugger->cs_Cpu->Rsp ; //debugger->DebugESP [- 1] ; //debugger->cs_Cpu->Rsp [1] ; //debugger->cs_Cpu->Rsp ;
    if ( rsp )
    {
        uint64 rsc, rsc0 ;
        int64 pushedWindow = 64 ;
        if ( ! debugger->CopyRSP )
        {
            rsc0 = ( uint64 ) Mem_Allocate ( size, COMPILER_TEMP ) ;
            rsc = ( rsc0 + 0xf ) & ( uint64 ) 0xfffffffffffffff0 ; // 16 byte alignment
            debugger->CopyRSP = ( byte* ) rsc + size - pushedWindow ;
            if ( showFlag ) ( _PrintNStackWindow ( ( uint64* ) debugger->CopyRSP, ( byte* ) "ReturnStackCopy", ( byte* ) "RSCP", 4 ) ) ;
        }
        else rsc = ( uint64 ) ( debugger->CopyRSP - size + pushedWindow ) ;
        MemCpy ( ( byte* ) rsc, ( ( byte* ) rsp ) - size + pushedWindow, size ) ; // pushedWindow (32) : account for useful current stack
        if ( showFlag ) ( _PrintNStackWindow ( ( uint64* ) rsp, ( byte* ) "ReturnStack", ( byte* ) "RSP", 4 ) ) ; //pushedWindow ) ) ;
        if ( showFlag ) ( _PrintNStackWindow ( ( uint64* ) debugger->CopyRSP, ( byte* ) "ReturnStackCopy", ( byte* ) "RSCP", 4 ) ) ; //pushedWindow ) ) ;
        debugger->cs_Cpu->Rsp = ( uint64* ) debugger->CopyRSP ;
        SetState ( debugger, DBG_STACK_OLD, false ) ;
        return true ;
    }

    else return false ;
}

void
Debugger_PrintReturnStackWindow ( )
{
    _PrintNStackWindow ( ( uint64* ) _Debugger_->cs_Cpu->Rsp, ( byte* ) "Debugger ReturnStack (RSP)", ( byte* ) "RSP", 4 ) ;
}

// restore the 'internal running cfrTil' cpu state which was saved after the last instruction : debugger->cs_CpuState is the 'internal running cfrTil' cpu state

void
Debugger_SetupReturnStackCopy ( Debugger * debugger, int64 showFlag ) // restore the running cfrTil cpu state
{
    // restore the 'internal running cfrTil' cpu state which was saved after the last instruction : debugger->cs_CpuState is the 'internal running cfrTil' cpu state
    // we don't have to worry so much about the compiler 'spoiling' our insn with restore 
    int64 stackSetupFlag = 0 ;
    if ( ( ! debugger->CopyRSP ) || GetState ( debugger, DBG_STACK_OLD ) )
        stackSetupFlag = _Debugger_SetupReturnStackCopy ( debugger, 8 * K, showFlag ) ;
    if ( showFlag ) Compile_Call_TestRSP ( ( byte* ) _Debugger_CpuState_Show ) ; // also dis insn
}

void
_Compile_Restore_Debugger_CpuState ( Debugger * debugger, int64 showFlag ) // restore the running cfrTil cpu state
{
    // restore the 'internal running cfrTil' cpu state which was saved after the last instruction : debugger->cs_CpuState is the 'internal running cfrTil' cpu state
    // we don't have to worry so much about the compiler 'spoiling' our insn with restore 
    Debugger_SetupReturnStackCopy ( debugger, showFlag ) ; // restore the running cfrTil cpu state
    _Compile_CpuState_Restore ( debugger->cs_Cpu, 1 ) ;
    if ( showFlag ) Compile_Call_TestRSP ( ( byte* ) _Debugger_CpuState_Show ) ; // also dis insn
}

void
_Compile_Restore_C_CpuState ( CfrTil * cfrtil, int64 showFlag )
{
    _Compile_CpuState_Restore ( cfrtil->cs_Cpu, 1 ) ;
    if ( showFlag ) Compile_Call_TestRSP ( ( byte* ) CfrTil_CpuState_Show ) ;
}

// restore the 'internal running cfrTil' cpu state which was saved after the last instruction : debugger->cs_CpuState is the 'internal running cfrTil' cpu state

void
_Compile_Save_C_CpuState ( CfrTil * cfrtil, int64 showFlag )
{
    Compile_CpuState_Save ( cfrtil->cs_Cpu ) ;
    if ( showFlag ) Compile_Call_TestRSP ( ( byte* ) _CfrTil_CpuState_CheckSave ) ;
}

void
_Compile_Save_Debugger_CpuState ( Debugger * debugger, int64 showFlag )
{
    Compile_CpuState_Save ( debugger->cs_Cpu ) ;
    if ( showFlag ) Compile_Call_TestRSP ( ( byte* ) CfrTil_Debugger_UdisOneInsn ) ;
    if ( ( _Q_->Verbosity > 3 ) && ( debugger->cs_Cpu->Rsp != debugger->LastRsp ) ) Debugger_PrintReturnStackWindow ( ) ;
    if ( showFlag ) Compile_Call_TestRSP ( ( byte* ) CfrTil_Debugger_CheckSaveCpuStateShow ) ;
}

void
Debugger_Stepping_Off ( Debugger * debugger )
{
    if ( Debugger_IsStepping ( debugger ) )
    {
        Debugger_SetStepping ( debugger, false ) ;
        debugger->DebugAddress = 0 ;
    }
}

Word *
Debugger_GetWordFromAddress ( Debugger * debugger )
{
    Word * word = 0 ;
    if ( debugger->DebugAddress ) word = Word_GetFromCodeAddress ( debugger->DebugAddress ) ;
    if ( ( ! word ) && debugger->Token ) word = Finder_FindWord_UsedNamespaces ( _Finder_, debugger->Token ) ;
    if ( word ) debugger->w_Word = word = Word_UnAlias ( word ) ;
    return word ;
}

byte *
Debugger_DoJcc ( Debugger * debugger, int64 numOfBytes )
{
    byte * jcAddress = ( numOfBytes == 2 ) ? JccInstructionAddress_2Byte ( debugger->DebugAddress ) : JccInstructionAddress_1Byte ( debugger->DebugAddress ) ;
    int64 tttn, ttt, n ;
    tttn = ( numOfBytes == 2 ) ? ( debugger->DebugAddress[1] & 0xf ) : ( debugger->DebugAddress[0] & 0xf ) ;
    ttt = ( tttn & 0xe ) >> 1 ;
    n = tttn & 1 ;

    // cf. Intel Software Developers Manual v1. (253665), Appendix B
    // ?? nb. some of this may not be (thoroughly) tested as of 11-14-2011 -- but no known problems after months of usual testing ??
    // setting jcAddress to 0 means we don't branch and just continue with the next instruction
    if ( ttt == TTT_BELOW ) // ttt 001
    {
        if ( ( n == 0 ) && ! ( ( uint64 ) debugger->cs_Cpu->RFlags & CARRY_FLAG ) ) jcAddress = 0 ;
        else if ( ( n == 1 ) && ( ( uint64 ) debugger->cs_Cpu->RFlags & CARRY_FLAG ) ) jcAddress = 0 ;
    }
    else if ( ttt == TTT_ZERO ) // ttt 010
    {
        if ( ( n == 0 ) && ! ( ( uint64 ) debugger->cs_Cpu->RFlags & ZERO_FLAG ) ) jcAddress = 0 ;
        else if ( ( n == 1 ) && ( ( uint64 ) debugger->cs_Cpu->RFlags & ZERO_FLAG ) ) jcAddress = 0 ;
    }
    else if ( ttt == TTT_BE ) // ttt 011 :  below or equal
        // the below code needs to be rewritten :: re. '|' and '^' :: TODO ??
    {
        if ( ( n == 0 ) && ! ( ( ( uint64 ) debugger->cs_Cpu->RFlags & CARRY_FLAG ) | ( ( uint64 ) debugger->cs_Cpu->RFlags & ZERO_FLAG ) ) )
        {
            jcAddress = 0 ;
        }
        else if ( ( n == 1 ) && ( ( ( uint64 ) debugger->cs_Cpu->RFlags & CARRY_FLAG ) | ( ( uint64 ) debugger->cs_Cpu->RFlags & ZERO_FLAG ) ) )
        {
            jcAddress = 0 ;
        }
    }
    else if ( ttt == TTT_LESS ) // ttt 110
    {
        if ( ( n == 0 ) && ! ( ( ( uint64 ) debugger->cs_Cpu->RFlags & SIGN_FLAG ) ^ ( ( uint64 ) debugger->cs_Cpu->RFlags & OVERFLOW_FLAG ) ) )
        {
            jcAddress = 0 ;
        }
        else if ( ( n == 1 ) && ( ( ( uint64 ) debugger->cs_Cpu->RFlags & SIGN_FLAG )
            ^ ( ( uint64 ) debugger->cs_Cpu->RFlags & OVERFLOW_FLAG ) ) )
        {
            jcAddress = 0 ;
        }
    }
    else if ( ttt == TTT_LE ) // ttt 111
    {
        if ( ( n == 0 ) &&
            ! ( ( ( ( uint64 ) debugger->cs_Cpu->RFlags & SIGN_FLAG )
            ^ ( ( uint64 ) debugger->cs_Cpu->RFlags & OVERFLOW_FLAG ) ) | ( ( uint64 ) debugger->cs_Cpu->RFlags & ZERO_FLAG ) ) )
        {
            jcAddress = 0 ;
        }
        if ( ( n == 1 ) &&
            ( ( ( ( uint64 ) debugger->cs_Cpu->RFlags & SIGN_FLAG )
            ^ ( ( uint64 ) debugger->cs_Cpu->RFlags & OVERFLOW_FLAG ) ) | ( ( uint64 ) debugger->cs_Cpu->RFlags & ZERO_FLAG ) ) )
        {

            jcAddress = 0 ;
        }
    }
    return jcAddress ;
}

int64
Debugger_CanWeStep ( Debugger * debugger, Word * word )
{
    int64 result = true ;
    if ( ( ! debugger->DebugAddress ) || ( ! GetState ( debugger, DBG_SETUP_ADDRESS ) ) )
    {
        if ( ( ! word ) || ( ! word->CodeStart ) ) result = false ;
        else if ( ( word && ( word->CAttribute & ( CPRIMITIVE | DLSYM_WORD ) ) ) || ( ! NamedByteArray_CheckAddress ( _Q_CodeSpace, word->CodeStart ) ) ) result = false ;
    }
    SetState ( debugger, DBG_CAN_STEP, result ) ;
    return result ;
}

void
Debug_ExtraShow ( int64 size, Boolean force )
{
    Debugger * debugger = _Debugger_ ;
    if ( force || ( _Q_->Verbosity > 3 ) )
    {
        if ( force || ( _Q_->Verbosity > 4 ) )
        {
            _Printf ( ( byte* ) "\n\ndebugger->SaveCpuState" ) ;
            _Debugger_Disassemble ( debugger, ( byte* ) debugger->SaveCpuState, 1000, 1 ) ; //137, 1 ) ;
            _Printf ( ( byte* ) "\n\ndebugger->RestoreCpuState" ) ;
            _Debugger_Disassemble ( debugger, ( byte* ) debugger->RestoreCpuState, 1000, 2 ) ; //100, 0 ) ;
        }
        _Printf ( ( byte* ) "\n\ndebugger->StepInstructionBA->BA_Data" ) ;
        _Debugger_Disassemble ( debugger, ( byte* ) debugger->StepInstructionBA->BA_Data, size, 0 ) ;
    }
}

