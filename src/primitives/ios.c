
#include "../include/csl.h"

void
Fflush ( )
{
    fflush ( stdout ) ;
}

void
CSL_Kbhit ( void )
{
    DataStack_Push ( ( int64 ) kbhit ( ) ) ;
}

void
CSL_PrintString ( )
{
    _CSL_PrintString ( ( byte* ) DataStack_Pop ( ) ) ;
}

void
CSL_NewLine ( )
{
    _CSL_PrintChar ( '\n' ) ;
    ReadLiner_SetLastChar ( '\n' ) ;
}

void
CSL_CarriageReturn ( )
{
    _CSL_PrintChar ( '\r' ) ;
}

void
CSL_SPACE ( ) // '.'
{
    _CSL_PrintChar ( ' ' ) ;
}

void
CSL_TAB ( ) // '.'
{
    _CSL_PrintChar ( '\t' ) ;
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
    byte * buffer = Buffer_Data ( _CSL_->ScratchB1 ) ;
    if ( _Context_->System0->NumberBase == 10 ) sprintf ( ( char* ) buffer, INT_FRMT, n ) ;
    else if ( _Context_->System0->NumberBase == 2 )
    {
        Print_Binary ( n ) ; 
        return ;
    }
    else /* if ( _Context->System0->NumberBase == 16 ) */ sprintf ( ( char* ) buffer, UINT_FRMT_0x016, n ) ; // hex
    // ?? any and all other number bases ??
    _Printf ( ( byte* ) buffer ) ;
}

void
CSL_PrintInt ( )
{
    PrintfInt ( DataStack_Pop ( ) ) ;
}

void
CSL_HexPrintInt ( )
{
    int64 svb = _Context_->System0->NumberBase ;
    _Context_->System0->NumberBase = 16 ;
    PrintfInt ( DataStack_Pop ( ) ) ;
    _Context_->System0->NumberBase = svb ;
}

void
CSL_Emit ( )
{
    int64 c = DataStack_Pop ( ) ;
    if ( ( c >= 0 ) && ( c < 256 ) ) _CSL_PrintChar ( c ) ;
    else _CSL_PrintChar ( c ) ; //_Printf ( ( byte* ) "%c", ( ( CString ) c )[0] ) ;
}

void
CSL_Key ( )
{
#if 0    
    ReadLine_Get_Key ( _Context_->ReadLiner0 ) ;
    DataStack_Push ( _Context_->ReadLiner0->InputKeyedCharacter ) ;
#else
    DataStack_Push ( Key ( ) ) ;
#endif    
}

void
CSL_LogOn ( )
{
    _CSL_->LogFlag = true ;
    if ( ! _CSL_->LogFILE ) _CSL_->LogFILE = fopen ( ( char* ) "csl.log", "w" ) ;
}

void
CSL_LogAppend ( )
{
    byte * logFilename = ( byte* ) DataStack_Pop ( ) ;
    _CSL_->LogFILE = fopen ( ( char* ) logFilename, "a" ) ;
    CSL_LogOn ( ) ;
}

void
CSL_LogWrite ( )
{
    byte * logFilename = ( byte* ) DataStack_Pop ( ) ;
    _CSL_->LogFILE = fopen ( ( char* ) logFilename, "w" ) ;
    CSL_LogOn ( ) ;
}

void
CSL_LogOff ( )
{
    CSL * csl = _CSL_ ;
    if ( csl )
    {
        fflush ( csl->LogFILE ) ;
        if ( csl->LogFILE ) fclose ( csl->LogFILE ) ; // ? not needed  ?
        csl->LogFlag = false ;
        csl->LogFILE = 0 ;
    }
}

