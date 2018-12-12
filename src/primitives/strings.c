
#include "../include/cfrtil64.h"

void
MultipleEscape ( )
{
    _MultipleEscape ( _Context_->Lexer0 ) ;
}

void
CfrTil_Strlen ( )
{
    DataStack_Push ( (int64) Strlen ( (char*) DataStack_Pop ( ) ) ) ;
}

void
CfrTil_Strcmp ( )
{
    DataStack_Push ( (int64) Strcmp ( (byte*) DataStack_Pop ( ), (byte*) DataStack_Pop ( ) ) ) ;
}

void
CfrTil_Stricmp ( )
{
    DataStack_Push ( (int64) Stricmp ( (byte*) DataStack_Pop ( ), (byte*) DataStack_Pop ( ) ) ) ;
}

//char * strcat ( char * destination, const char * source );
void
CfrTil_StrCat ( )
{
    //Buffer * b = Buffer_New ( BUFFER_SIZE ) ;  
    byte * buffer = Buffer_Data ( _CfrTil_->StrCatBuffer );  byte *str ;
    char * src = (char*) DataStack_Pop ( ) ;
    char * dst = (char*) DataStack_Pop ( ) ;
    strcpy ( (char*) buffer, dst ) ;
    if (src) strcat ( (char *) buffer, src ) ; 
    str = String_New ( buffer, TEMPORARY ) ; //String_New ( (byte*) buffer, DICTIONARY ) ;
    DataStack_Push ( (int64) str ) ;
    //Buffer_SetAsUnused ( b ) ; ;
}

void
CfrTil_StrCpy ( )
{
    // !! nb. this cant really work !! what do we want here ??
    DataStack_Push ( (int64) strcpy ( (char*) DataStack_Pop ( ), (char*) DataStack_Pop ( ) ) ) ;
}

void
String_GetStringToEndOfLine ( )
{
    DataStack_Push ( (int64) _String_Get_ReadlineString_ToEndOfLine ( ) ) ;
}
