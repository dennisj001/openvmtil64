#include "../../include/cfrtil64.h"

inline void
_Block_Eval ( block blck )
{
    ( ( block ) blck ) ( ) ;
}

void
Block_Eval ( block blck )
{
    if ( blck )
    {
        _Block_Eval ( blck ) ;
    }
}

void
Dbg_Block_Eval ( block blck )
{
    if ( blck )
    {
        __DEBUG_SETUP( 0, 0, (byte*) blck, 1 ) ;
        _Block_Eval ( blck ) ;
    }
}

