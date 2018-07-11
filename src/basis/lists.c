
#include "../include/cfrtil64.h"

void
_List_PrintNames ( dllist * list, int64 count, int64 flag )
{
    dlnode * node, *nextNode ;
    Word * nodeWord, *beforeNode, *afterNode ;
    byte * thisName, *beforeName, *afterName, *bt = Buffer_New_pbyte ( 64 ), *ba = Buffer_New_pbyte ( 64 ), *bb = Buffer_New_pbyte ( 64 ) ;
    for ( node = dllist_First ( ( dllist* ) list ) ; node && count -- ; node = nextNode )
    {
        nextNode = dlnode_Next ( node ) ;
        nodeWord = ( node->afterNode && node->afterNode->afterNode ? ( Word* ) dobject_Get_M_Slot ( node, 0 ) : 0 ) ;
        if ( ! nodeWord ) break ;
        thisName = nodeWord ? sconvbs ( bt, nodeWord->Name ) : ( byte* ) " ", node ;
        if ( flag )
        {
            beforeNode = ( node->beforeNode == list->afterNode ? 0 : ( Word * ) dobject_Get_M_Slot ( node->beforeNode, SCN_WORD ) ) ;
            afterNode = ( node->afterNode == list->afterNode ? 0 : ( Word* ) dobject_Get_M_Slot ( node->afterNode, SCN_WORD ) ) ;
            afterName = afterNode ? sconvbs ( ba, afterNode->Name ) : ( byte* ) " ", node->afterNode ;
            beforeName = beforeNode ? sconvbs ( bb, ( beforeNode )->Name ) : ( byte* ) " ", node->beforeNode ;
            _Printf ( ( byte* ) "\n\tName : %s 0x%08x \t\tBefore : %s 0x%08x : \t\tAfter : %s 0x%08x,",
                thisName, node, beforeName, node->beforeNode, afterName, node->afterNode ) ;
        }
        else _Printf ( ( byte* ) "\n\tName : %s", thisName ) ;
    }
}

void
_List_Show_N_Word_Names ( dllist * list, uint64 n, int64 showBeforeAfterFlag, int64 dbgFlag )
{
    if ( dbgFlag ) NoticeColors ;
    _List_PrintNames ( list, n, showBeforeAfterFlag ) ;
    if ( dbgFlag ) DefaultColors ;
}

