#include "../../include/cfrtil64.h"
//===================================================================================================================
//| LO_Print
//===================================================================================================================

byte *
_LO_Print_Lambda_ToString ( ListObject * l0, byte * buffer, int64 printValueFlag )
{
    byte * buffer2 ;
    SetState ( _LC_, LC_PRINT_ENTERED, true ) ;
    buffer2 = Buffer_New_pbyte ( BUFFER_SIZE ) ;
    LO_sprintName ( buffer2, l0 ) ;
    if ( ! LO_strcat ( buffer, buffer2 ) ) return buffer ;
    _LO_PrintListToString ( ( ListObject * ) l0->Lo_LambdaFunctionParameters, buffer2, 1, printValueFlag ) ; // 1 : lambdaFlag = 1 
    if ( ! LO_strcat ( buffer, buffer2 ) ) return buffer ;
    _LO_PrintListToString ( ( ListObject * ) l0->Lo_LambdaFunctionBody, buffer2, 1, printValueFlag ) ; // 1 : lambdaFlag = 1 
    if ( ! LO_strcat ( buffer, buffer2 ) ) return buffer ;
}

byte *
_LO_Print_NonLambdaSymbol_ToString ( ListObject * l0, byte * buffer, int64 printValueFlag )
{
    if ( printValueFlag )
    {
        if ( *l0->Lo_PtrToValue != ( uint64 ) nil )
        {
            if ( ( ! *l0->Lo_PtrToValue ) && l0->Lo_CfrTilWord )
            {
                if ( _Q_->Verbosity > 2 ) LC_snprintf2 ( buffer, " %s = 0x%016lx", l0->Lo_CfrTilWord->Lo_Name, ( int64 ) l0->Lo_CfrTilWord ) ;
                else LO_sprintName ( buffer, l0 ) ;
            }
            else if ( l0->LAttribute & ( T_RAW_STRING | T_RAW_STRING ) ) LC_sprintString ( buffer, *l0->Lo_PtrToValue ) ;
            else LO_sprintName ( buffer, l0 ) ;
        }
        else
        {
            if ( _Q_->Verbosity > 2 ) LC_sprintf_String ( buffer, " nil: %s", l0->Lo_Name ) ;
            else LO_sprintName ( buffer, l0 ) ;
        }
    }
    else LO_sprintName ( buffer, l0 ) ;
}

byte *
_LO_PrintOneToString ( ListObject * l0, byte * buffer, int64 in_a_LambdaFlag, int64 printValueFlag )
{
    if ( ! buffer )
    {
        buffer = _CfrTil_->LispPrintBuffer ;
        buffer [0] = 0 ;
    }
    if ( l0 )
    {
        if ( l0->LAttribute & ( LIST | LIST_NODE ) )
        {
            byte * buffer2 = Buffer_New_pbyte ( BUFFER_SIZE ) ;
            _LO_PrintListToString ( l0, buffer2, in_a_LambdaFlag, printValueFlag ) ;
            if ( ! LO_strcat ( buffer, buffer2 ) ) return buffer ;
        }
        else if ( ( l0 == nil ) || ( l0->LAttribute == T_NIL ) )
        {
            if ( _AtCommandLine ( ) ) LC_sprintAString ( buffer, " nil" ) ;
        }
        else if ( l0->LAttribute == true )
        {
            if ( _AtCommandLine ( ) ) LC_sprintAString ( buffer, " T" ) ;
        }
        else if ( l0->LAttribute == T_RAW_STRING ) LC_sprintString ( buffer, l0->Lo_Value ) ;
        else if ( l0->LAttribute & ( T_LISP_DEFINE | T_LISP_COMPILED_WORD ) && ( ! GetState ( _LC_, LC_DEFINE_MODE ) ) )
        {
            if ( LO_IsQuoted ( l0 ) ) LO_sprintName ( buffer, l0 ) ;
            else if ( l0->Lo_CfrTilWord && l0->Lo_CfrTilWord->W_SourceCode && ( ! GetState ( _LC_, LC_PRINT_ENTERED ) ) )
            {
                LC_sprintString ( buffer, l0->Lo_CfrTilWord->W_SourceCode ) ;
            }
            else LO_sprintName ( buffer, l0 ) ;
        }
        else if ( l0->LAttribute & T_LISP_SYMBOL )
        {
            if ( LO_IsQuoted ( l0 ) ) LO_sprintName ( buffer, l0 ) ;
            else if ( ( ! in_a_LambdaFlag ) && l0->Lo_CfrTilWord && ( l0->LAttribute & T_LAMBDA ) )
                return _LO_Print_Lambda_ToString ( l0, buffer, printValueFlag ) ;
            else return _LO_Print_NonLambdaSymbol_ToString ( l0, buffer, printValueFlag ) ;
        }
        else if ( l0->LAttribute & T_STRING )
        {
            if ( l0->State & UNQUOTED ) LC_sprintString ( buffer, l0->Lo_String ) ;
            else LC_sprintf_String ( buffer, " \"%s\"", l0->Lo_String ) ;
        }
        else if ( l0->LAttribute & BLOCK ) LC_snprintf2 ( buffer, " %s:#<BLOCK>:0x%016lx", l0->Lo_Name, ( uint64 ) l0->Lo_UInteger ) ;
        else if ( l0->LAttribute & T_BIG_NUM ) _BigNum_FPrint ( ( mpfr_t * ) l0->W_Value ) ;
        else if ( l0->LAttribute & T_INT )
        {
            if ( _Context_->System0->NumberBase == 16 ) LC_snprintf1 ( buffer, " 0x%016lx", ( uint64 ) l0->Lo_UInteger ) ;
            else LC_snprintf1 ( buffer, ( l0->Lo_Integer < 0 ) ? " 0x%016lx" : " %ld", l0->Lo_Integer ) ;
        }
        else if ( l0->LAttribute & LITERAL )
        {
            if ( Namespace_IsUsing ( "BigNum" ) ) _BigNum_FPrint ( ( mpfr_t * ) l0->W_Value ) ;
            else if ( ( l0->Lo_Integer < 0 ) || ( _Context_->System0->NumberBase == 16 ) ) 
                LC_snprintf1 ( buffer, " 0x%016lx", ( uint64 ) l0->Lo_UInteger ) ; 
            else LC_snprintf1 ( buffer, (( l0->Lo_Integer < 0 ) ? " 0x%016lx" : " %ld"), l0->Lo_Integer ) ;
        }
        else if ( l0->LAttribute & ( CPRIMITIVE | CFRTIL_WORD ) ) LO_sprintName ( buffer, l0 ) ;
        else if ( l0->LAttribute & ( T_HEAD | T_TAIL ) ) ;
        else
        {
            if ( l0->Lo_CfrTilWord && l0->Lo_CfrTilWord->Lo_Name ) LC_sprintString ( buffer, l0->Lo_CfrTilWord->Lo_Name ) ;
            else if ( l0->Name ) LO_sprintName ( buffer, l0 ) ;
        }
    }
    if ( _LC_ ) SetState ( _LC_, LC_PRINT_ENTERED, true ) ;
    return buffer ;
}

byte *
_LO_PrintListToString ( ListObject * l0, byte * buffer, int64 lambdaFlag, int64 printValueFlag )
{
    byte * buffer2 = Buffer_New_pbyte ( BUFFER_SIZE ) ;
    ListObject * l1, *lnext ;
    if ( ! buffer )
    {
        buffer = _CfrTil_->LispPrintBuffer ;
        buffer [0] = 0 ;
    }
    if ( l0 )
    {
        if ( l0->LAttribute & ( LIST | LIST_NODE ) )
        {
            LC_sprintAString ( buffer2, " (" ) ; //snprintf ( ( char* ) buffer2, BUFFER_SIZE, " (" ) ;
            if ( ! LO_strcat ( buffer, buffer2 ) ) return buffer ;
        }
        for ( l1 = _LO_First ( l0 ) ; l1 ; l1 = lnext )
        {
            lnext = _LO_Next ( l1 ) ;
            if ( l1->LAttribute & ( LIST | LIST_NODE ) )
            {
                _LO_PrintListToString ( l1, buffer2, lambdaFlag, printValueFlag ) ;
                if ( ! LO_strcat ( buffer, buffer2 ) ) return buffer ;
            }
            else
            {
                _LO_PrintOneToString ( l1, buffer2, lambdaFlag, printValueFlag ) ;
                if ( ! LO_strcat ( buffer, buffer2 ) ) return buffer ;
            }
        }
        if ( l0->LAttribute & ( LIST | LIST_NODE ) ) LC_sprintAString ( buffer2, " )" ) ; //snprintf ( ( char* ) buffer2, BUFFER_SIZE, " )" ) ;
        LO_strcat ( buffer, buffer2 ) ;
    }
    return buffer ;
}

void
LO_Print ( ListObject * l0 )
{

    DefaultColors ;
    SetState ( _LC_, ( LC_PRINT_VALUE ), true ) ;
    _Printf ( ( byte* ) "%s", _LO_PRINT_TO_STRING ( l0 ) ) ;
    SetState ( _LC_, LC_PRINT_VALUE, false ) ;
}

