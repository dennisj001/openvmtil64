
#include "../include/cfrtil64.h"

/*
 * cfrTil namespaces basic understandings :
 * 0. to allow for ordered search thru lists in use ...
 * 1. Namespaces are also linked on the _Context->System0->Namespaces list with status of USING or NOT_USING
 *      and are moved the front or back of that list if status is set to USING with the 'Symbol node'
 *      This list is ordered so we can set an order to our search thru the namespaces in use. 
 *      The first word found within the ordered USING list will be used.
 */

void
Do_Namespace_WithStatus_2 ( dlnode * node, MapFunction2 nsf, int64 nsStateFlag, int64 one, int64 two )
{
    Namespace * ns = ( Namespace * ) node ;
    if ( ns->State == nsStateFlag )
    {
        nsf ( node, one, two ) ;
    }
}

void
_CfrTil_TreeMap ( MapSymbolFunction2 msf2, uint64 state, int64 one, int64 two )
{
    Tree_Map_Namespaces_State_2Args ( _CfrTil_->Namespaces->Lo_List, state, msf2, one, two ) ;
}

void
_CfrTil_NamespacesMap ( MapSymbolFunction2 msf2, uint64 state, int64 one, int64 two )
{
    Tree_Map_Namespaces_State_2Args ( _CfrTil_->Namespaces->Lo_List, state, msf2, one, two ) ;
}

// list/print namespaces

void
_CfrTil_ForAllNamespaces ( MapSymbolFunction2 msf2 )
{
    _Printf ( ( byte* ) "\nusing :" ) ;
    _CfrTil_NamespacesMap ( msf2, USING, 1, 1 ) ;
    _Printf ( ( byte* ) "\nnotUsing :" ) ;
    int64 usingWords = _CfrTil_->FindWordCount ;
    _CfrTil_NamespacesMap ( msf2, NOT_USING, 1, 1 ) ;
    int64 notUsingWords = _CfrTil_->FindWordCount ;
    _CfrTil_->FindWordCount = usingWords + notUsingWords ;
    CfrTil_WordAccounting ( ( byte* ) "_CfrTil_ForAllNamespaces" ) ;
}

void
Namespace_PrettyPrint ( Namespace* ns, int64 indentFlag, int64 indentLevel )
{
    if ( indentFlag )
    {
        _Printf ( ( byte* ) "\n" ) ;
        while ( indentLevel -- ) _Printf ( ( byte* ) "\t" ) ;
    }
    if ( ns->State & NOT_USING ) _Printf ( ( byte* ) " - %s", c_gd ( ns->Name ) ) ;
    else _Printf ( ( byte* ) " - %s", ns->Name ) ;
    _Context_->NsCount ++ ;
}

void
CfrTil_Namespace_New ( )
{
    Namespace * ns = Namespace_FindOrNew_SetUsing ( ( byte* ) DataStack_Pop ( ), _CfrTil_Namespace_InNamespaceGet ( ), 1 ) ;
    Namespace_DoNamespace ( ns, 0 ) ;

}

void
_CfrTil_Namespace_NotUsing ( byte * name )
{
    Namespace * ns = Namespace_Find ( name ) ;
    if ( ns )
    {
        _Namespace_RemoveFromUsingList ( ns ) ;
        _Namespace_ResetFromInNamespace ( ns ) ;
    }
}

void
CfrTil_Namespace_NotUsing ( )
{
    byte * name = ( byte* ) DataStack_Pop ( ) ;
    _CfrTil_Namespace_NotUsing ( name ) ;
}

void
CfrTil_Namespace_UsingFirst ( )
{
    Namespace * ns = Namespace_Find ( ( byte* ) DataStack_Pop ( ) ) ;
    if ( ns ) _Namespace_AddToUsingList ( ns ) ;
}

void
CfrTil_Namespace_UsingLast ( )
{
    _Namespace_SetAs_UsingLast ( ( byte* ) DataStack_Pop ( ) ) ;
}

void
CfrTil_Namespace_SetStateAs_Using ( )
{
    byte * token = ( byte* ) DataStack_Pop ( ) ;
    Namespace * ns = Namespace_Find ( token ) ;
    _Namespace_SetState_AsUsing ( ns ) ;
}

void
CfrTil_Namespace_SetStateAs_NotUsing ( )
{
    byte * token = ( byte* ) DataStack_Pop ( ) ;
    Namespace * ns = Namespace_Find ( token ) ;
    _Namespace_SetStateAs_NotUsing ( ns ) ;
}

// "in"

void
CfrTil_PrintInNamespace ( )
{
    _Printf ( ( byte* ) "\nCurrent Namespace Being Compiled : %s\n",
        _CfrTil_Namespace_InNamespaceGet ( )->Name ) ;
}

// list/print namespaces

void
CfrTil_Namespaces ( )
{
    _Printf ( ( byte* ) "\nAll Namespaces : \n<list> ':' '-' <namespace>" ) ;
    _CfrTil_ForAllNamespaces ( ( MapSymbolFunction2 ) Symbol_NamespacePrettyPrint ) ;
    _Printf ( ( byte* ) "\n" ) ;
}

int64
Word_RemoveIfStringContainsName ( Symbol * symbol, byte * name )
{
    if ( strstr ( ( CString ) symbol->Name, ( CString ) name ) )
    {
        dlnode_Remove ( (dlnode*) symbol ) ;
        Word_Recycle ( (Word *) symbol ) ;
    }
    return 0 ;
}

void
_CfrTil_Namespaces_PurgeWordIfContainsName ( byte * name )
{
    Tree_Map_State_OneArg ( USING | NOT_USING, ( MapFunction_1 ) Word_RemoveIfStringContainsName, ( int64 ) name ) ;
}

void
CfrTil_Namespaces_PurgeWordIfContainsName ( )
{
   byte * name = ( byte* ) DataStack_Pop ( ) ;
   _CfrTil_Namespaces_PurgeWordIfContainsName ( name ) ;
}


int64
Word_RemoveIfStringEqualExactName ( Symbol * symbol, byte * name )
{
    if ( String_Equal ( symbol->Name, name ) )
    {
        dlnode_Remove ( (dlnode*) symbol ) ;
        Word_Recycle ( (Word *) symbol ) ;
    }
    return 0 ;
}

void
_CfrTil_Namespaces_PurgeWordExactName ( byte * name )
{
    Tree_Map_State_OneArg ( USING | NOT_USING, ( MapFunction_1 ) Word_RemoveIfStringEqualExactName, ( int64 ) name ) ;
}

void
CfrTil_Namespaces_PurgeWordExactName ( )
{
   byte * name = ( byte* ) DataStack_Pop ( ) ;
   _CfrTil_Namespaces_PurgeWordExactName ( name ) ;
}

void
Symbol_SetNonTREED ( Symbol * symbol, int64 one, int64 two )
{
    Namespace * ns = ( Namespace * ) symbol ;
    ns->State &= ~ TREED ;
}

void
Symbol_Namespaces_PrintTraverse ( Symbol * symbol, int64 containingNamespace, int64 indentLevel )
{
    Namespace * ns = ( Namespace * ) symbol ;
    if ( ns->ContainingNamespace == ( Namespace* ) containingNamespace )
    {
        if ( ! ( ns->State & TREED ) )
        {
            ns->State |= TREED ;
            Namespace_PrettyPrint ( ns, 1, indentLevel ) ;
            _Namespace_MapAny_2Args ( ( MapSymbolFunction2 ) Symbol_Namespaces_PrintTraverse, ( int64 ) ns, indentLevel + 1 ) ;
        }
    }
}

void
Symbol_Namespaces_PrintTraverseWithWords ( Symbol * symbol, int64 containingNamespace, int64 indentLevel )
{
    Namespace * ns = ( Namespace * ) symbol ;
    if ( ns->ContainingNamespace == ( Namespace* ) containingNamespace )
    {
        if ( ! ( ns->State & TREED ) )
        {
            ns->State |= TREED ;
            Namespace_PrettyPrint ( ns, 1, indentLevel ) ;
            dllist_Map1 ( ns->Lo_List, ( MapFunction1 ) _Word_Print, 0 ) ;
            _Namespace_MapAny_2Args ( ( MapSymbolFunction2 ) Symbol_Namespaces_PrintTraverseWithWords, ( int64 ) ns, indentLevel + 1 ) ;
        }
    }
}

void
CfrTil_Namespaces_PrettyPrintTree ( )
{
    _Context_->NsCount = 0 ;
    _Context_->WordCount = 0 ;
    //SetState ( _O_->psi_PrintStateInfo, PSI_PROMPT, false ) ;
    _Printf ( ( byte* ) "\nNamespaceTree - All Namespaces : %s%s%s", c_ud ( "using" ), " : ", c_gd ( "not using" ) ) ;
    _Namespace_MapAny_2Args ( ( MapSymbolFunction2 ) Symbol_SetNonTREED, 0, 0 ) ;
    _Namespace_MapAny_2Args ( ( MapSymbolFunction2 ) Symbol_Namespaces_PrintTraverse, ( int64 ) _CfrTil_->Namespaces, 1 ) ;
    _Printf ( ( byte* ) "\nTotal namespaces = %d :: Total words = %d\n", _Context_->NsCount, _Context_->WordCount ) ;
}

void
CfrTil_Namespaces_PrettyPrintTreeWithWords ( )
{
    _Context_->NsCount = 0 ;
    _Context_->WordCount = 0 ;
    //SetState ( _O_->psi_PrintStateInfo, PSI_PROMPT, false ) ;
    _Printf ( ( byte* ) "%s%s%s%s%s%s%s", "\nNamespaceTree - All Namespaces : ", "using", " : ", c_gd ( "not using" ), " :: ", "with", c_ud ( " : words" ) ) ;
    _Namespace_MapAny_2Args ( ( MapSymbolFunction2 ) Symbol_SetNonTREED, 0, 0 ) ;
    _Namespace_MapAny_2Args ( ( MapSymbolFunction2 ) Symbol_Namespaces_PrintTraverseWithWords, ( int64 ) _CfrTil_->Namespaces, 1 ) ;
    _Printf ( ( byte* ) "\nTotal namespaces = %d :: Total words = %d\n", _Context_->NsCount, _Context_->WordCount ) ;
}

void
_Namespace_Symbol_Print ( Symbol * symbol, int64 printFlag, int64 str )
{
    char buffer [128] ;
    Namespace * ns = ( Namespace * ) symbol ;
    sprintf ( buffer, "%s ", ns->Name ) ;
    if ( printFlag )
    {
        _Printf ( ( byte* ) "%s", buffer ) ;
    }
    else strcat ( ( char* ) str, buffer ) ;
}

// prints all the namespaces on the SearchList
// 'using'

byte *
_CfrTil_UsingToString ( )
{
    byte * b = Buffer_Data ( _CfrTil_->ScratchB1 ) ;
    strcpy ( ( char* ) b, "" ) ;
    Tree_Map_Namespaces_State_2Args ( _CfrTil_->Namespaces->Lo_List, USING, ( MapSymbolFunction2 ) _Namespace_Symbol_Print, 0, ( int64 ) b ) ;
    b = String_New ( ( byte* ) b, TEMPORARY ) ;
    return b ;
}

void
CfrTil_Using ( )
{
    _Printf ( ( byte* ) "\nUsing Namespaces :> " ) ;
    Tree_Map_Namespaces_State_2Args ( _CfrTil_->Namespaces->Lo_List, USING, ( MapSymbolFunction2 ) _Namespace_Symbol_Print, 1, 0 ) ;
    _Printf ( ( byte* ) "\n" ) ;
}

// this namespace is will be taken out of the system

void
_Namespace_RemoveFromUsingListAndClear ( Namespace * ns )
{
    if ( ns )
    {
        if ( ns == _CfrTil_->InNamespace ) _CfrTil_->InNamespace = 0 ; //( Namespace* ) dlnode_Next ( ( dlnode* ) ns ) ; //dllist_First ( (dllist*) _O_->CfrTil->Namespaces->Lo_List ) ;
        if ( ns == _Context_->Finder0->QualifyingNamespace ) Finder_SetQualifyingNamespace ( _Context_->Finder0, 0 ) ;
        _Namespace_Clear ( ns ) ;
        dlnode_Remove ( ( dlnode* ) ns ) ;
        Word_Recycle ( ns ) ;
    }
}

void
_CfrTil_RemoveNamespaceFromUsingListAndClear ( byte * name )
{
    _Namespace_RemoveFromUsingListAndClear ( Namespace_Find ( name ) ) ;
}

//keep the stack intack just remove the namespace from the Namespaces list and set them as not using

void
Namespace_RemoveNamespacesStack ( Stack * stack )
{
    if ( stack )
    {
        int64 n = Stack_Depth ( stack ) ;
        while ( n > 0 )
        {
            Namespace * ns = ( Namespace* ) _Stack_Pop ( stack ) ; 
            if ( ns )
            {
                if ( ns == _CfrTil_->InNamespace ) _CfrTil_->InNamespace = 0 ;
                if ( _Finder_ && ( ns == _Finder_->QualifyingNamespace ) ) Finder_SetQualifyingNamespace ( _Context_->Finder0, 0 ) ;
                _Namespace_SetState ( ns, NOT_USING ) ;
                dlnode_Remove ( ( dlnode* ) ns ) ;
            }
            n -- ;
        }
    }
}

void
Namespace_RemoveAndClearNamespacesStack ( Stack * stack )
{
    if ( stack )
    {
        int64 n ;
        for ( n = Stack_Depth ( stack ) ; n ; n -- )
        {
            Namespace * ns = ( Namespace* ) Stack_Pop ( stack ) ;
            if ( ns ) _Namespace_RemoveFromUsingListAndClear ( ns ) ;
        }
        Stack_Init ( stack ) ;
    }
}

#if 0
void
Namespace_NamespacesStack_PrintWords ( Stack * stack )
{
    if ( stack )
    {
        int64 n ;
        for ( n = Stack_Depth ( stack ) ; n > 0 ; n -- )
        {
            Namespace * ns = stack->StackPointer [n] ; //( Namespace* ) Stack_Pop ( stack ) ;
            //if ( ns ) _Namespace_RemoveFromUsingListAndClear ( ns ) ;
            n -- ;
        }
    }
}
#endif

