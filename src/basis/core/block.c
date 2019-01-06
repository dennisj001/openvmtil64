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
        if ( ! sigsetjmp ( _Context_->JmpBuf0, 0 ) ) // from _Debugger_InterpreterLoop
        {
            ( ( block ) blck ) ( ) ;
            //_Block_Eval ( blck ) ;
        }
    }
}

