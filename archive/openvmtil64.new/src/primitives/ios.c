
#include "../include/cfrtil64.h"

void
Fflush ( )
{
    fflush ( stdout ) ;
}

void
CfrTil_Kbhit ( void )
{
    DataStack_Push ( ( int64 ) kbhit ( ) ) ;
}

void
_CfrTil_PrintString ( byte * string ) //  '."'
{
    _Printf ( ( byte* ) string ) ;
}

void
CfrTil_PrintString ( )
{
    _CfrTil_PrintString ( ( byte* ) DataStack_Pop ( ) ) ;
}

void
CfrTil_NewLine ( )
{
    //ConserveNewlines ;
    //int64 sstate = GetState ( _Q_->psi_PrintStateInfo, PSI_NEWLINE ) ;
    //AllowNewlines ;
    _Printf ( ( byte* ) "\n" ) ;
    //_Q_->psi_PrintStateInfo->State = sstate ;
}

void
CfrTil_CarriageReturn ( )
{
    _Printf ( ( byte* ) "\r" ) ;
}

void
CfrTil_SPACE ( ) // '.'
{
    _CfrTil_PrintString ( ( byte* ) " " ) ;
}

void
CfrTil_TAB ( ) // '.'
{
    _CfrTil_PrintString ( ( byte* ) "\t" ) ;
}

void
_ConvertToBinary ( uint64 n, byte* buffer, int16 size )
{
    uint64 i ; // 8 - bits/byte ; 4 - spacing
    byte * ptr ;
    for ( i = 0, ptr = & buffer [ size - 2 ] ; i < ( CELL_SIZE * 8 ) ; ptr -- )
    {
        if ( n & ( ( ( uint64 ) 1 ) << i ) )
        {
            *ptr = '1' ;
        }
        else
        {
            *ptr = '0' ;
        }
        i ++ ;
        if ( ! ( i % 4 ) ) ptr -- ;
        if ( ! ( i % 8 ) ) ptr -- ;
        if ( ! ( i % 16 ) ) ptr -- ;
        if ( ! ( i % 32 ) ) ptr -- ;
    }
}

byte *
_Print_Binary ( uint64 n )
{
    byte *ptr ;
    if ( n )
    {
        int16 i, size = 128 ;
        byte *buffer = Buffer_New_pbyte ( size ) ; //[ size ] ; // 8 - bits/byte ; 4 - spacing
        //buffer [ size - 1 ] = 0 ;
        for ( i = 0 ; i < size ; i ++ ) buffer [ i ] = ' ' ; // fill buffer with spaces
        _ConvertToBinary ( n, buffer, size ) ;
        for ( ptr = & buffer[0], i = 0 ; i < size ; ptr ++ )
        {
            if ( ( *ptr == 0 ) ) break ;
            if ( ( * ptr == '1' ) )
            {
                // go back to 8 bit boundary
                while ( *-- ptr != ' ' ) ;
                // go back to 16 bit boundary
                while ( *-- ptr != ' ' ) ;
                ptr += 2 ;
                break ;
            }
        }
        return ptr ;
    }
    else return ( byte* ) "" ;
}

void
Print_Binary ( uint64 n )
{
    _Printf ( ( byte* ) "\n %s", _Print_Binary ( n ) ) ;
}

void
PrintfInt ( int64 n )
{
    byte * buffer = Buffer_Data ( _CfrTil_->ScratchB1 ) ;
    if ( _Context_->System0->NumberBase == 10 ) sprintf ( ( char* ) buffer, INT_FRMT, n ) ;
    else if ( _Context_->System0->NumberBase == 2 )
    {
        Print_Binary ( n ) ; //, 4, 46 ) ;
        return ;
    }
    else /* if ( _Context->System0->NumberBase == 16 ) */ sprintf ( ( char* ) buffer, UINT_FRMT_0x016, n ) ; // hex
    // ?? any and all other number bases ??
    _Printf ( ( byte* ) buffer ) ;
}

void
CfrTil_PrintInt ( )
{
    PrintfInt ( DataStack_Pop ( ) ) ;
}

void
CfrTil_HexPrintInt ( )
{
    int64 svb = _Context_->System0->NumberBase ;
    _Context_->System0->NumberBase = 16 ;
    PrintfInt ( DataStack_Pop ( ) ) ;
    _Context_->System0->NumberBase = svb ;
}

void
CfrTil_Emit ( )
{
    int64 c = DataStack_Pop ( ) ;
    if ( ( c >= 0 ) && ( c < 256 ) ) _Printf ( ( byte* ) "%c", c ) ;
    else Emit ( c ) ; //_Printf ( ( byte* ) "%c", ( ( CString ) c )[0] ) ;
}

void
CfrTil_Key ( )
{
#if 0    
    ReadLine_Key ( _Context_->ReadLiner0 ) ;
    DataStack_Push ( _Context_->ReadLiner0->InputKeyedCharacter ) ;
#else
    DataStack_Push ( Key ( ) ) ;

#endif    
}

void
CfrTil_LogOn ( )
{
    _CfrTil_->LogFlag = true ;
    if ( ! _CfrTil_->LogFILE ) _CfrTil_->LogFILE = fopen ( ( char* ) "cfrtil.log", "w" ) ;

}

void
CfrTil_LogAppend ( )
{
    byte * logFilename = ( byte* ) DataStack_Pop ( ) ;
    _CfrTil_->LogFILE = fopen ( ( char* ) logFilename, "a" ) ;
    CfrTil_LogOn ( ) ;
}

void
CfrTil_LogWrite ( )
{
    byte * logFilename = ( byte* ) DataStack_Pop ( ) ;
    _CfrTil_->LogFILE = fopen ( ( char* ) logFilename, "w" ) ;
    CfrTil_LogOn ( ) ;
}

void
CfrTil_LogOff ( )
{
    CfrTil * cfrtil = _CfrTil_ ;
    if ( cfrtil )
    {
        fflush ( cfrtil->LogFILE ) ;
        if ( cfrtil->LogFILE ) fclose ( cfrtil->LogFILE ) ; // ? not needed  ?
        cfrtil->LogFlag = false ;
        cfrtil->LogFILE = 0 ;
    }
}

