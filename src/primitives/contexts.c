
#include "../include/cfrtil64.h"

void
CFT_Contex_New_RunWord ( )
{
    Word * word = ( Word * ) DataStack_Pop ( ) ;
    _CFT_Contex_NewRun_Void ( _CFT_, word ) ;
}

