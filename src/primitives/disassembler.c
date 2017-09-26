
#include "../include/cfrtil.h"

void
_CfrTil_Word_Disassemble ( Word * word )
{
    byte * start ;
    if ( word && word->Definition )
    {
        start = word->CodeStart ;
        int64 size = _Debugger_Disassemble ( _Debugger_, start, word->S_CodeSize ? word->S_CodeSize : 128, 1 ) ;
        if ( ( ! word->S_CodeSize ) && ( size > 0 ) )
        {
            word->S_CodeSize = size ;
            _Printf ( "\n_CfrTil_Word_Disassemble : word - \'%s\' :: codeSize = %d", word->Name, size ) ;
        }
    }
}

void
_Word_Disassemble ( Word * word )
{
    if ( word )
    {
        _Printf ( ( byte* ) "\nWord :: %s.%s : definition = 0x%08lx : disassembly at %s :", word->ContainingNamespace ? word->ContainingNamespace->Name : ( byte* ) "", c_gd ( word->Name ), ( uint64 ) word->Definition, Context_Location ( ) ) ;
        _CfrTil_Word_Disassemble ( word ) ;
        //_Printf ( ( byte* ) "\n" ) ;
    }
    else
    {
        _Printf ( ( byte* ) "\nWordDisassemble : word = 0x%lx", word ) ;
    }
}

void
CfrTil_Word_Disassemble ( )
{
    Word * word = ( Word* ) _DataStack_Pop ( ) ;
    _Word_Disassemble ( word ) ;
}

void
Debugger_WDis ( Debugger * debugger )
{
    //_Printf ( ( byte* ) "\n" ) ;
    Word * word = debugger->w_Word ;
    if ( ! word ) word = _Interpreter_->w_Word ;
    _Word_Disassemble ( word ) ;
}

void
CfrTil_Disassemble ( )
{
    uint64 number = _DataStack_Pop ( ) ;
    byte * address = ( byte* ) _DataStack_Pop ( ) ;
    _Debugger_Disassemble ( _Debugger_, address, number, 0 ) ;
    //_Printf ( ( byte* ) "\n" ) ;
}


