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

