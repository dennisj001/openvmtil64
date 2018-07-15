
#include "../include/cfrtil64.h"

ud_t *
Debugger_UdisInit ( Debugger * debugger )
{
    if ( ! debugger->Udis ) debugger->Udis = ( ud_t* ) Mem_Allocate ( sizeof (ud_t ), CFRTIL ) ;
    return _Udis_Init ( debugger->Udis ) ;
}

int64
Debugger_Udis_GetInstructionSize ( Debugger * debugger )
{
    return _Udis_GetInstructionSize ( debugger->Udis, debugger->DebugAddress ) ;
}

Boolean
Debugger_ShowSourceCodeAtAddress ( Debugger * debugger, byte * address )
{
    if ( GetState ( _CfrTil_, GLOBAL_SOURCE_CODE_MODE ) ) //DEBUG_SOURCE_CODE_MODE ) ) // ( _Context_->CurrentlyRunningWord ) && _Context_->CurrentlyRunningWord->W_SC_WordList ) )
    {
        _Debugger_ShowDbgSourceCodeAtAddress ( debugger, address ) ;
        return true ;
    }
    return false ;
}

int64
Debugger_UdisOneInstruction ( Debugger * debugger, byte * address, byte * prefix, byte * postfix )
{
    return _Debugger_Udis_OneInstruction ( debugger, address, prefix, postfix ) ;
}

int64
_Debugger_Disassemble ( Debugger * debugger, byte* address, int64 number, int64 cflag )
{
    int64 size = _Udis_Disassemble ( Debugger_UdisInit ( debugger ), address, ( ( number > ( 3 * K ) ) ? ( 3 * K ) : number ), cflag ) ;
    debugger->LastDisStart = address ;
    return size ;
}

void
Debugger_Dis ( Debugger * debugger )
{
    Debugger_GetWordFromAddress ( debugger ) ;
    Word * word = debugger->w_Word ;
    if ( ( word ) && ( word->S_CodeSize ) )
    {
        _Printf ( ( byte* ) "\nDisassembly of : %s.%s", c_ud ( word->ContainingNamespace ? word->ContainingNamespace->Name : ( byte* ) "" ), c_gd ( word->Name ) ) ;
        int64 codeSize = word->S_CodeSize ;
        SetState ( debugger, DBG_DISASM_ACC, true ) ;
        _Debugger_Disassemble ( debugger, ( byte* ) word->CodeStart, codeSize ? codeSize : 64, ( word->CAttribute & ( CPRIMITIVE | DLSYM_WORD | DEBUG_WORD ) ? 1 : 0 ) ) ;
        SetState ( debugger, DBG_DISASM_ACC, false ) ;
#if 0        
        if ( debugger->DebugAddress )
        {
            _Printf ( ( byte* ) "\nNext instruction ..." ) ;
            Debugger_UdisOneInstruction ( debugger, debugger->DebugAddress, ( byte* ) "\n", ( byte* ) "" ) ; // the next instruction
        }
#endif        
    }
    else
    {
        //word = _Context_->CurrentlyRunningWord ;
        if ( word ) _Printf ( ( byte* ) "\nDisassembly of : %s.%s : has no code size! Disassembling accumulated ...", c_ud ( word->ContainingNamespace ? word->ContainingNamespace->Name : ( byte* ) "" ), c_gd ( word->Name ) ) ;
        Debugger_DisassembleAccumulated ( debugger ) ;
        //SetState ( debugger, DBG_DISASM_ACC, false ) ;
        //Debugger_DisassembleTotalAccumulated ( debugger ) ;
    }
}

// a function of PreHere, OptimizedCodeAffected FirstDisAddress

void
_Debugger_DisassembleWrittenCode ( Debugger * debugger )
{
    Word * word = debugger->w_Word ;
    int64 codeSize = debugger->PreHere ? Here - debugger->PreHere : 0 ;
    if ( word && ( codeSize > 0 ) )
    {
        NamedByteArray * nba = Get_CompilerSpace ( )->OurNBA ;
        byte * csName = nba ? ( byte * ) c_gd ( nba->NBA_Name ) : ( byte* ) "" ;
        _Printf ( ( byte* ) "\nCode compiled to %s for word :> %s <: %4d bytes : at %s", csName, c_gd ( String_CB ( word->Name ) ), codeSize, Context_Location ( ) ) ;
        _Debugger_Disassemble ( debugger, ( codeSize > 0 ) ? debugger->PreHere : Here, codeSize, ( word->CAttribute & ( CPRIMITIVE | DLSYM_WORD | DEBUG_WORD ) ? 1 : 0 ) ) ;
    }
}

// this needs work -- some of these options are not necessary ?! or useful at all

void
Debugger_DisassembleAccumulated ( Debugger * debugger )
{
    int64 size = Here - debugger->StartHere ;
    if ( debugger->EntryWord ) _Printf ( ( byte * ) "\nDisassembling %d bytes of code accumulated since start with word \'%s\' at : 0x%016lx ...",
        size, ( char* ) debugger->EntryWord->Name, debugger->StartHere ) ;
    SetState ( debugger, DBG_DISASM_ACC, true ) ;
    if ( size > 0 ) _Debugger_Disassemble ( debugger, debugger->StartHere, size, 0 ) ;
    SetState ( debugger, DBG_DISASM_ACC, false ) ;
}

void
Debugger_DisassembleTotalAccumulated ( Debugger * debugger )
{
    byte * address = _Context_->Compiler0->InitHere ;
    if ( ! ( Here - address ) )
    {
        address = ( byte* ) _CfrTil_->LastFinishedWord->Definition ;
    }
    int64 size = Here - address ;
    int64 svState = GetState ( _CfrTil_, GLOBAL_SOURCE_CODE_MODE ) ;
    SetState ( _CfrTil_, GLOBAL_SOURCE_CODE_MODE, true ) ;
    SetState ( debugger, DBG_DISASM_ACC, true ) ;
    //debugger->LastSourceCodeWord = 0 ;
    _Printf ( ( byte* ) "\nDisassembling the current word : \'%s\' : %4d bytes : total accumulated code ...", _Context_->Compiler0->CurrentWordCompiling ? _Context_->Compiler0->CurrentWordCompiling->Name : ( byte* ) "", size ) ;
    _Debugger_Disassemble ( debugger, address, size, ! Compiling ) ;
    SetState ( _CfrTil_, GLOBAL_SOURCE_CODE_MODE, svState ) ;
    SetState ( debugger, DBG_DISASM_ACC, false ) ;
}

