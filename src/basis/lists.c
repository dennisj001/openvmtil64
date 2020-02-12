
#include "../include/cfrtil64.h"

void
_Interpret_ListNode ( dlnode * node )
{
    Word * word = ( Word * ) dobject_Get_M_Slot ( (dobject*) node, SCN_T_WORD ) ;
    _Word_Interpret ( word ) ;
}

void
List_Interpret ( dllist * list )
{
    dllist_Map ( list, _Interpret_ListNode ) ;
    List_Init ( list ) ;
}

// list : a list of lists of postfix operations needing to be interpreted

void
List_InterpretLists ( dllist * list )
{
    Compiler * compiler = _Compiler_ ;
    if ( ! ( GetState ( compiler, INFIX_LIST_INTERPRET ) ) ) // prevent recursive call here
    {
        int64 svs = GetState ( compiler, C_INFIX_EQUAL ) ;
        SetState ( compiler, C_INFIX_EQUAL, false ) ;
        SetState ( compiler, INFIX_LIST_INTERPRET, true ) ;
        dlnode * node, *nextNode ;
        for ( node = dllist_First ( ( dllist* ) list ) ; node ; node = nextNode )
        {
            // get nextNode before map function (mf) in case mf changes list by a Remove of current node
            // problem could arise if mf removes Next node
            nextNode = dlnode_Next ( node ) ;
            dllist * list = ( dllist * ) dobject_Get_M_Slot ( (dobject*) node, SCN_T_WORD ) ;
            List_Interpret ( list ) ;
            dlnode_Remove ( node ) ;
        }
        List_Init ( list ) ;
        SetState ( compiler, INFIX_LIST_INTERPRET, false ) ;
        SetState ( compiler, C_INFIX_EQUAL, svs ) ;
    }
}

// list : a list of lists of postfix operations needing to be interpreted

void
List_CheckInterpretLists_OnVariable ( dllist * list, byte * token )
{
    if ( list )
    {
        dlnode * node, *nextNode ;
        for ( node = dllist_First ( ( dllist* ) list ) ; node ; node = nextNode )
        {
            // get nextNode before map function (mf) in case mf changes list by a Remove of current node
            // problem could arise if mf removes Next node
            nextNode = dlnode_Next ( node ) ;
            dllist * plist = ( dllist * ) dobject_Get_M_Slot ( (dobject*) node, SCN_T_WORD ) ; // plist created in CFT_IncDec
            Word * word = ( Word * ) List_Top_Value ( plist ) ;
            byte *checkPostfixToken = word ? word->Name : 0 ;
            if ( checkPostfixToken && String_Equal ( checkPostfixToken, token ) )
            {
                List_Interpret ( plist ) ;
                dlnode_Remove ( node ) ;
            }
        }
        //List_Init ( list ) ;
    }
}

void
_List_PrintNames ( dllist * list, int64 count, int64 flag )
{
    dlnode * node, *nextNode ;
    Word * nodeWord, *beforeNode, *afterNode ;
    byte * thisName, *beforeName, *afterName, *bt = Buffer_New_pbyte ( 64 ), *ba = Buffer_New_pbyte ( 64 ), *bb = Buffer_New_pbyte ( 64 ) ;
    for ( node = dllist_First ( ( dllist* ) list ) ; node && count -- ; node = nextNode )
    {
        nextNode = dlnode_Next ( node ) ;
        if ( flag )
        {
            nodeWord = ( node->afterNode && node->afterNode->afterNode ? ( Word* ) dobject_Get_M_Slot ( (dobject*) node, 0 ) : 0 ) ;
            if ( ! nodeWord ) break ;
            thisName = nodeWord ? sconvbs ( bt, nodeWord->Name ) : ( byte* ) " ", node ;
            beforeNode = ( node->beforeNode == list->afterNode ? 0 : ( Word * ) dobject_Get_M_Slot ( (dobject*) node->beforeNode, SCN_T_WORD ) ) ;
            afterNode = ( node->afterNode == list->afterNode ? 0 : ( Word* ) dobject_Get_M_Slot ( (dobject*) node->afterNode, SCN_T_WORD ) ) ;
            afterName = afterNode ? sconvbs ( ba, afterNode->Name ) : ( byte* ) " ", node->afterNode ;
            beforeName = beforeNode ? sconvbs ( bb, ( beforeNode )->Name ) : ( byte* ) " ", node->beforeNode ;
            _Printf ( ( byte* ) "\n\tName : %s 0x%08x \t\tBefore : %s 0x%08x : \t\tAfter : %s 0x%08x,",
                thisName, node, beforeName, node->beforeNode, afterName, node->afterNode ) ;
        }
        else _Printf ( ( byte* ) "\n\tName : %s", ( ( Word* ) ( node ) )->Name ) ; //thisName ) ;
    }
}

void
_List_Show_N_Word_Names ( dllist * list, uint64 n, int64 showBeforeAfterFlag, int64 dbgFlag )
{
    if ( dbgFlag ) NoticeColors ;
    _List_PrintNames ( list, n, showBeforeAfterFlag ) ;
    if ( dbgFlag ) DefaultColors ;
}
