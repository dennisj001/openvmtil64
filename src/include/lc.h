#define LO_IsQuoted( l0 ) (( l0->State & QUOTED ) || ( ( l0->State & QUASIQUOTED ) && (! ( l0->State & (UNQUOTED|UNQUOTE_SPLICE) ) ) ) ) //( ! ( l0->State & ( QUOTED | QUASIQUOTED ) )  || (l1->State & UNQUOTED) ) )
#define LO_Last( lo ) (ListObject*) dllist_Last ( (dllist*) lo->Lo_List )
#define LO_Previous( lo ) ( ListObject* ) dlnode_Previous ( ( dlnode* ) lo )
#define LO_Next( lo ) ( ListObject* ) dlnode_Next ( ( dlnode* ) lo )
#define LO_AddToTail( lo, lo1 ) dllist_AddNodeToTail ( (( ListObject * ) lo)->Lo_List, ( dlnode* ) (lo1) ) 
#define _LO_AddToTail( lo, lo1 ) dlnode_InsertThisBeforeANode ( (node*) lo1, ((node*)(lo))->tail ) ; 
#define _LO_AddToHead( lo, lo1 ) dlnode_InsertThisAfterANode ( (node*) lo1, ((node*)(lo))->head ) ; 
#define LO_AddToHead( lo, lo1 ) dllist_AddNodeToHead ( (( ListObject * ) lo)->Lo_List, ( dlnode* ) (lo1) ) 
#define LO_New( lType, object ) (ListObject *) _DataObject_New (T_LC_NEW, 0, 0, 0, 0, lType, 0, (int64) object, 0, 0 , -1)
#define LambdaArgs( proc ) proc->p[0]
#define LambdaProcedureBody( proc ) proc->p[1]
#define LambdaVals( proc ) proc->p[2]
#define LO_ReplaceNode( node, anode) dlnode_Replace ( (dlnode *) node, (dlnode *) anode ) 
#define LO_CopyTemp( l0 ) _LO_Copy ( l0, LISP_TEMP )
#define LO_Copy( l0 ) _LO_Copy ( l0, LISP )
#define LO_CopyOne( l0 ) _LO_AllocCopyOne ( l0, LISP_TEMP )
#define LO_Eval( lc, l0 ) _LO_Eval ( lc, l0, 0, 1 )
#define nil (_LC_ ? _LC_->Nil : 0)
#define LC_SaveStackPointer( lc ) { if ( lc ) lc->SaveStackPointer = (int64*) _Dsp_ ; }
#define LC_RestoreStackPointer( lc ) _LC_ResetStack ( lc ) //{ if ( lc && lc->SaveStackPointer ) Dsp = lc->SaveStackPointer ; }

#define _LO_PrintWithValue( l0, prefix, postfix ) _Printf ( (byte*) "%s%s%s", prefix, _LO_PrintListToString ( (ListObject *) l0 , 0, 0, 1 ), postfix ) 
#define LO_PrintWithValue( l0 ) _LO_PrintWithValue( l0, "",  "" ) 
#define _LO_PRINT_TO_STRING(l0) _LO_PrintListToString ( ( ListObject * ) l0, 0, 0, 0 )
#define _LO_PRINT_TO_STRING_WITH_VALUE(l0) _LO_PrintListToString ( ( ListObject * ) l0, 0, 0, 1 )
#define LC_Print( l0 ) LO_PrintWithValue ( l0 ) 
#define LC_snprintf2( buffer, format, value1, value2 ) snprintf ( ( char* ) buffer, BUFFER_SIZE, ((char*) (format)), value1, value2 ) 
#define LC_snprintf1( buffer, format, value ) snprintf ( ( char* ) buffer, BUFFER_SIZE, ((char*) (format)), value ) 
#define LC_sprintf_String( buffer, format, str ) LC_snprintf1 ( buffer, (format), ((char*) str) ) 
#define LC_sprintString( buffer, str ) LC_sprintf_String (buffer, " %s", (str) ) 
#define LC_sprintAString( buffer, str ) LC_sprintString (buffer, (str) ) 
#define LO_sprintName( buffer, l0 ) LC_sprintString ( buffer, l0->Lo_Name ) 
