#include "../../include/cfrtil64.h"

void 
_Block_Eval ( block blck )
{
    ( ( block ) blck ) ( ) ;
}

void
Block_Eval ( block blck )
{
    if ( blck )
    {
        ( ( block ) blck ) ( ) ;
    }
}

