#include "../../include/cfrtil64.h"

inline void 
Eval ( block blck )
{
    ( ( block ) blck ) ( ) ;
}

void
Block_Eval ( block blck )
{
    if ( blck )
    {
        ( ( block ) blck ) ( ) ;
        //_Block_Eval ( blck ) ;
    }
}

