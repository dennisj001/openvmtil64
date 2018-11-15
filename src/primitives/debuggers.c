#include "../include/cfrtil64.h"

void
CfrTil_Debug_AtAddress ( )
{
    byte * address ;
    address = ( byte* ) DataStack_Pop ( ) ;
    _CfrTil_Debug_AtAddress ( address ) ;
}

void
_CfrTil_Debugger_Locals_Show ( )
{
    Debugger_Locals_Show ( _Debugger_ ) ;
    //Pause ( ) ;
}

void
CfrTil_Debugger_Locals_Show ( )
{
    if ( GetState ( _Debugger_, DBG_AUTO_MODE ) ) _CfrTil_Debugger_Locals_Show ( ) ;
}

void
_CfrTil_DebugInfo ( )
{
    Debugger_ShowInfo ( _Debugger_, ( byte* ) "\ninfo", 0 ) ;
}

// put this '<dbg>' into cfrtil code for a runtime break into the debugger

void
CfrTil_DebugInfo ( )
{
    if ( _Q_->Verbosity )
    {
        _CfrTil_DebugInfo ( ) ;
        Debugger_Source ( _Debugger_ ) ;
    }
}

void
CfrTil_DebugOn ( )
{
    if ( _Q_->Verbosity > 1 ) _Printf ( "\nCfrTil_DebugOn : at %s", Context_Location ( ) ) ;
    Context * cntx = _Context_ ;
    Debugger * debugger = _Debugger_ ;
    debugger->DebugRSP = 0 ;
    Debugger_On ( debugger ) ;
    byte * nextToken = Lexer_PeekNextNonDebugTokenWord ( cntx->Lexer0, 0 ) ;
    debugger->EntryWord = Finder_Word_FindUsing ( cntx->Interpreter0->Finder0, nextToken, 0 ) ;
    debugger->StartHere = Here ;
    _Context_->SourceCodeWord = debugger->EntryWord ;
}

void
CfrTil_DebugOff ( )
{
    Debugger_Off ( _Debugger_, 1 ) ;
}

void
_CfrTil_DebugRuntimeBreakpoint ( )
{
    Debugger * debugger = _Debugger_ ;
    if ( ( ! CompileMode ) )
    {
        if ( ! GetState ( debugger, ( DBG_BRK_INIT ) ) )
        {
            if ( GetState ( debugger, DBG_INTERPRET_LOOP_DONE ) )//|| GetState ( debugger, DBG_CONTINUE_MODE|DBG_AUTO_MODE ) )
            {
                // getRsp and debugger->SaveCpuState ( ) has been called by _Compile_Debug1 which calls this function
                SetState ( debugger, ( DBG_BRK_INIT | DBG_RUNTIME_BREAKPOINT ), true ) ;
                if ( ! GetState ( debugger, ( DBG_STEPPING | DBG_AUTO_MODE ) ) )
                {
                    Debugger_On ( debugger ) ;
                    debugger->StartHere = Here ;
                    Debugger_SetupStepping ( debugger ) ;
                    SetState_TrueFalse ( debugger, DBG_RUNTIME | DBG_RESTORE_REGS | DBG_ACTIVE | DBG_RUNTIME_BREAKPOINT | DEBUG_SHTL_OFF,
                        DBG_INTERPRET_LOOP_DONE | DBG_PRE_DONE | DBG_CONTINUE | DBG_NEWLINE | DBG_PROMPT | DBG_INFO | DBG_MENU ) ;
                }
            }
        }
        else
        {
            debugger->DebugAddress += 3 ; // 3 : sizeof call rax insn
            SetState ( _Debugger_, ( DBG_AUTO_MODE | DBG_AUTO_MODE_ONCE ), false ) ;
        }
        if ( ! sigsetjmp ( _Context_->JmpBuf0, 0 ) ) // used by CfrTil_DebugRuntimeBreakpoint
        {
            _Debugger_InterpreterLoop ( debugger ) ;
        }
        SetState ( debugger, DBG_BRK_INIT | DBG_RUNTIME_BREAKPOINT | DEBUG_SHTL_OFF, false ) ;
    }
}

void
CfrTil_DebugRuntimeBreakpoint ( )
{
    _CfrTil_DebugRuntimeBreakpoint ( ) ;
}

void
CfrTil_DebugRuntimeBreakpoint_dso ( )
{
    if ( Is_DebugShowOn ) _CfrTil_DebugRuntimeBreakpoint ( ) ;
}
