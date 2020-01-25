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
    Context * cntx = _Context_ ;
    Debugger * debugger = _Debugger_ ;
    if ( ! Is_DebugOn )
    {
        if ( _Q_->Verbosity > 1 ) _Printf ( ( byte* ) "\nCfrTil_DebugOn : at %s", Context_Location ( ) ) ;
        debugger->DebugRSP = 0 ;
        Debugger_On ( debugger ) ;
    }
    byte * nextToken = Lexer_Peek_Next_NonDebugTokenWord ( cntx->Lexer0, 0, 0 ) ;
    debugger->EntryWord = Finder_Word_FindUsing ( cntx->Interpreter0->Finder0, nextToken, 0 ) ;
    _Context_->SourceCodeWord = debugger->EntryWord ;
}

void
CfrTil_DebugOff ( )
{
    Debugger_Off ( _Debugger_, 1 ) ;
}

void
DebugRuntimeBreakpoint ( )
{
    Debugger * debugger = _Debugger_ ;
    //if ( ( ! CompileMode ) )
    {
        if ( ! GetState ( debugger, ( DBG_BRK_INIT ) ) ) //|DBG_CONTINUE_MODE ) ) )
        {
            if ( GetState ( debugger, DBG_INTERPRET_LOOP_DONE ) )
            {
                SetState ( debugger, ( DBG_BRK_INIT | DBG_RUNTIME_BREAKPOINT ), true ) ;
                if ( ! GetState ( debugger, ( DBG_STEPPING | DBG_AUTO_MODE ) ) )
                {
                    Debugger_On ( debugger ) ;
                    Debugger_SetupStepping ( debugger ) ;
                    SetState_TrueFalse ( debugger, DBG_RUNTIME | DBG_ACTIVE | DBG_RUNTIME_BREAKPOINT | DEBUG_SHTL_OFF,
                        DBG_INTERPRET_LOOP_DONE | DBG_PRE_DONE | DBG_CONTINUE | DBG_NEWLINE | DBG_PROMPT | DBG_INFO | DBG_MENU ) ;
                }
            }
        }
        else
        {
            debugger->DebugAddress += 3 ; // 3 : sizeof call rax insn :: skip the call else we would recurse to here
            if ( GetState ( debugger, ( DBG_CONTINUE_MODE ) ) ) SetState ( debugger, ( DBG_BRK_INIT | DBG_RUNTIME_BREAKPOINT ), true ) ;
        }
        SetState ( _Debugger_, ( DBG_AUTO_MODE | DBG_AUTO_MODE_ONCE | DBG_CONTINUE_MODE ), false ) ;
        Debugger_InterpreterLoop ( debugger ) ;
        SetState ( debugger, DBG_BRK_INIT | DBG_RUNTIME_BREAKPOINT | DEBUG_SHTL_OFF, false ) ;
    }
}

void
CfrTil_DebugRuntimeBreakpoint ( )
{
    if ( ( ! CompileMode ) ) DebugRuntimeBreakpoint ( ) ;
}

void
CfrTil_DebugRuntimeBreakpoint_IsDebugShowOn ( )
{
    if ( Is_DebugShowOn ) DebugRuntimeBreakpoint ( ) ;
}

void
CfrTil_DebugRuntimeBreakpoint_IsDebugOn ( )
{
    if ( Is_DebugOn ) DebugRuntimeBreakpoint ( ) ;
}

void
_DEBUG_SETUP ( Word * word, byte * token, byte * address, Boolean force )
{
    Debugger_PreSetup ( _Debugger_, word, token, address, force ) ;
}
