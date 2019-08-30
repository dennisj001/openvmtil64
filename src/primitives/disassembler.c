
#include "../include/cfrtil64.h"

void
Word_Disassemble ( Word * word )
{
    byte * start ;
    if ( word && word->Definition )
    {
        start = word->CodeStart ;
        if ( word->CAttribute & ( CPRIMITIVE ) ) start += 4 ; //4: account for new intel insn used by gcc : endbr64 f3 0f 1e fa
        _Context_->CurrentDisassemblyWord = word ;
        _Debugger_->LastSourceCodeWord = 0 ;
        int64 size = _Debugger_Disassemble ( _Debugger_, start, word->S_CodeSize ? word->S_CodeSize : 128, ( word->CAttribute & ( CPRIMITIVE | DLSYM_WORD | DEBUG_WORD ) ? 1 : 0 ) ) ;
        _Debugger_->LastSourceCodeWord = 0 ;
        if ( ( ! word->S_CodeSize ) && ( size > 0 ) ) word->S_CodeSize = size ;
        _Printf ( ( byte* ) "\nWord_Disassemble : word - \'%s\' :: codeSize = %d", word->Name, size ) ;
    }
}

void
_CfrTil_Word_Disassemble ( Word * word )
{
    if ( word )
    {
        _Printf ( ( byte* ) "\nWord :: %s.%s : definition = 0x%016lx : disassembly at %s :", word->ContainingNamespace ? word->ContainingNamespace->Name : ( byte* ) "", c_gd ( word->Name ), ( uint64 ) word->Definition, Context_Location ( ) ) ;
        Word_Disassemble ( word ) ;
        //_Printf ( ( byte* ) "\n" ) ;
    }
    else
    {
        _Printf ( ( byte* ) "\nWordDisassemble : word = 0x%016lx", word ) ;
    }
}

void
CfrTil_Word_Disassemble ( )
{
    Word * word = ( Word* ) DataStack_Pop ( ) ;
    _CfrTil_Word_Disassemble ( word ) ;
}

void
Debugger_WDis ( Debugger * debugger )
{
    //_Printf ( ( byte* ) "\n" ) ;
    Word * word = debugger->w_Word ;
    if ( ! word ) word = _Interpreter_->w_Word ;
    _CfrTil_Word_Disassemble ( word ) ;
}

void
CfrTil_Disassemble ( )
{
    uint64 number = DataStack_Pop ( ) ;
    byte * address = ( byte* ) DataStack_Pop ( ) ;
    _Debugger_Disassemble ( _Debugger_, address, number, 0 ) ;
    //_Printf ( ( byte* ) "\n" ) ;
}


