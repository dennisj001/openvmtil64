#include "../include/cfrtil64.h"

// all except namespaces and number base
// this is called by the main interpreter _CfrTil_Interpret

void
CfrTil_RuntimeInit ( CfrTil * cfrTil, int64 cntxDelFlag )
{
    CfrTil_LogOff ( ) ;
    cfrTil->SC_QuoteMode = 0 ;
    cfrTil->ScWord = 0 ;
    cfrTil->InitSessionCoreTimes ++ ;
    if ( cntxDelFlag )
    {
        int64 i, stackDepth = Stack_Depth ( cfrTil->ContextDataStack ) ;
        for ( i = 0 ; i < stackDepth ; i ++ ) CfrTil_Context_PopDelete ( cfrTil ) ;
    }
    SetState_TrueFalse ( cfrTil, CFRTIL_RUN, DEBUG_MODE ) ;
    SetState ( cfrTil->Debugger0, DBG_ACTIVE, false ) ;
    DebugOff ;
    SetBuffersUnused ( 1 ) ;
    d0 ( Buffer_PrintBuffers ( ) ) ;
    DefaultColors ;
    CfrTil_CheckInitDataStack ( ) ;
    _CfrTil_TypeStackReset ( ) ;
    _CfrTil_RecycleInit_Compiler_N_M_Node_WordList ( 0 ) ;
    CfrTil_UnsetQualifyingNamespace ( ) ;
}

void
OVT_RuntimeInit ()
{
    OVT_FreeTempMem ( ) ;
    OVT_MemList_DeleteNBAMemory ( ( byte* ) "ObjectSpace", 1 ) ; // 1 : re-init
}

void
_CfrTil_Init_SessionCore ( CfrTil * cfrTil, Boolean cntxDelFlag, Boolean promptFlag )
{
    Context * cntx = cfrTil->Context0 ;
    _System_Init ( cntx->System0 ) ;
    ReadLine_Init ( cntx->ReadLiner0, _CfrTil_Key ) ;
    Lexer_Init ( cntx->Lexer0, 0, 0, CONTEXT ) ;
    Finder_Init ( cntx->Finder0 ) ;
    Compiler_Init ( cntx->Compiler0, 0, 0 ) ;
    Interpreter_Init ( cntx->Interpreter0 ) ;
    LC_Init_Runtime ( ) ;
    if ( ! _LC_ ) LC_LispNamespacesOff ( ) ;
    CfrTil_RuntimeInit ( cfrTil, cntxDelFlag ) ;
    OVT_RuntimeInit ( ) ;
    OVT_StartupMessage ( promptFlag ) ;
    _OVT_Ok ( promptFlag ) ;
}

void
CfrTil_SessionInit ( )
{
    _CfrTil_Init_SessionCore ( _CfrTil_, 0, 1 ) ;
}

void
CfrTil_ResetAll_Init ( CfrTil * cfrTil )
{
    byte * startDirectory = ( byte* ) "namespaces" ;
    if ( ! GetState ( _Q_, OVT_IN_USEFUL_DIRECTORY ) ) startDirectory = ( byte* ) "/usr/local/lib/cfrTil64/namespaces" ;
    DataObject_New ( NAMESPACE_VARIABLE, 0, ( byte* ) "_startDirectory_", NAMESPACE_VARIABLE, 0, 0, 0, ( int64 ) startDirectory, 0, 0, - 1 ) ;
    if ( ( _Q_->RestartCondition >= RESET_ALL ) )
    {
        _Q_->StartIncludeTries = 0 ;
        _CfrTil_Init_SessionCore ( cfrTil, 1, 0 ) ;
        _CfrTil_Namespace_NotUsing ( ( byte* ) "BigNum" ) ;
        _CfrTil_Namespace_NotUsing ( ( byte* ) "Lisp" ) ;
        if ( _Q_->StartupFilename )
        {
            _Q_->Verbosity = 0 ;
            _CfrTil_ContextNew_IncludeFile ( ( byte* ) "./namespaces/sinit.cft" ) ;
            _CfrTil_ContextNew_IncludeFile ( _Q_->StartupFilename ) ;
        }
        else
        {
            if ( ! _Q_->StartIncludeTries ++ )
            {
                _CfrTil_ContextNew_InterpretString ( cfrTil, _Q_->InitString ) ;
                _CfrTil_ContextNew_InterpretString ( cfrTil, _Q_->StartupString ) ;
            }
            else if ( _Q_->StartIncludeTries < 3 )
            {
                AlertColors ;
                _CfrTil_ContextNew_IncludeFile ( ( byte* ) "./namespaces/init.cft" ) ;
                if ( _Q_->ErrorFilename )
                {
                    if ( strcmp ( ( char* ) _Q_->ErrorFilename, "Debug Context" ) )
                    {
                        _Printf ( ( byte* ) "\nError : \"%s\" include error!\n", _Q_->SigLocation ? _Q_->SigLocation : _Q_->ErrorFilename ) ;
                    }
                }
                DefaultColors ;
            }
        }
    }
    if ( _Q_->Verbosity > 3 )
    {
        _Printf ( ( byte* ) " \nInternal Namespaces have been initialized.  " ) ;
        OVT_ShowMemoryAllocated ( ) ;
    }
    //if ( ( _Q_->InitSessionCoreTimes == 1 ) || ( ! _Q_->Verbosity ) ) _Q_->Verbosity = 1 ;
}

void
_CfrTil_InitialAddWordToNamespace ( Word * word, byte * containingNamespaceName, byte * superNamespaceName )
// this is only called at startup where we want to add the namespace to the RootNamespace
{
    Namespace *ns, *sns = _CfrTil_->Namespaces ;
    if ( superNamespaceName )
    {
        sns = Namespace_FindOrNew_SetUsing ( superNamespaceName, sns, 1 ) ;
        sns->State |= USING ;
    }
    ns = Namespace_FindOrNew_SetUsing ( containingNamespaceName, sns, 1 ) ; // find new namespace or create anew
    Namespace_DoAddWord ( ns, word ) ; // add word to new namespace
}

void
_CfrTil_CPrimitiveNewAdd ( const char * name, byte * pb_TypeSignature, uint64 opInsnGroup, uint64 opInsCode, block b, uint64 ctype, uint64 ctype2, uint64 ltype, const char *nameSpace, const char * superNamespace )
{
    Word * word = _Word_New ( ( byte* ) name, CPRIMITIVE | ctype, ctype2, ltype, 1, 0, DICTIONARY ) ;
    _DObject_ValueDefinition_Init ( word, ( int64 ) b, BLOCK, 0, 0 ) ;
    _CfrTil_InitialAddWordToNamespace ( word, ( byte* ) nameSpace, ( byte* ) superNamespace ) ;
    if ( ctype & INFIXABLE ) word->WAttribute = WT_INFIXABLE ;
    else if ( ctype & PREFIX ) word->WAttribute = WT_PREFIX ;
    else if ( ctype & C_PREFIX_RTL_ARGS ) word->WAttribute = WT_C_PREFIX_RTL_ARGS ;
    else word->WAttribute = WT_POSTFIX ;
    word->CAttribute2 = ctype2 ;
    word->W_OpInsnCode = opInsCode ;
    word->W_OpInsnGroup = opInsnGroup ;
    if ( pb_TypeSignature ) strncpy ( ( char* ) &word->W_TypeSignatureString, ( char* ) pb_TypeSignature, 8 ) ;
}

void
CfrTil_AddCPrimitives ( )
{
    int64 i ;
    for ( i = 0 ; CPrimitives [ i ].ccp_Name ; i ++ )
    {
        CPrimitive p = CPrimitives [ i ] ;
        _CfrTil_CPrimitiveNewAdd ( p.ccp_Name, ( byte* ) p.pb_TypeSignature, p.OpInsnCodeGroup, p.OpInsnCode, p.blk_Definition, p.ui64_CAttribute, p.ui64_CAttribute2, p.ui64_LAttribute, ( char* ) p.NameSpace, ( char* ) p.SuperNamespace ) ;
    }
    //_CfrTil_CPrimitiveNewAdd ( p.ccp_Name, p.blk_Definition, p.ui64_CAttribute, p.ui64_CAttribute2, p.ui64_LAttribute, ( char* ) p.NameSpace, ( char* ) p.SuperNamespace ) ;
}

