
#include "../include/cfrtil64.h"

void
CfrTil_Contex_New_RunWord ( )
{
    Word * word = ( Word * ) DataStack_Pop ( ) ;
    _CfrTil_Contex_NewRun_Void ( _CfrTil_, word ) ;
}

