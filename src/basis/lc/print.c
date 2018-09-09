#include "../../include/cfrtil64.h"
//===================================================================================================================
//| LO_Print
//===================================================================================================================

byte *
_LO_Print_Lambda_ToString ( LambdaCalculus * lc, ListObject * l0, int64 printValueFlag )
{
    lc->buffer [0] = 0 ;
    LC_sprintName ( lc->buffer, l0 ) ;
    LO_strcat ( lc->outBuffer, lc->buffer ) ;
    _LO_PrintListToString (lc, ( ListObject * ) l0->Lo_LambdaFunctionParameters, 1, printValueFlag) ; // 1 : lambdaFlag = 1 
    _LO_PrintListToString (lc, ( ListObject * ) l0->Lo_LambdaFunctionBody, 1, printValueFlag) ; // 1 : lambdaFlag = 1 
}

byte *
_LO_Print_NonLambdaSymbol_ToString ( LambdaCalculus * lc, ListObject * l0, int64 printValueFlag )
{
    lc->buffer [0] = 0 ;
    if ( printValueFlag )
    {
        if ( *l0->Lo_PtrToValue != ( uint64 ) nil )
        {
            if ( ( ! *l0->Lo_PtrToValue ) && l0->Lo_CfrTilWord )
            {
                if ( _Q_->Verbosity > 2 ) LC_snprintf2 ( lc->buffer, " %s = 0x%016lx", l0->Lo_CfrTilWord->Lo_Name, ( int64 ) l0->Lo_CfrTilWord ) ;
                else LC_sprintName ( lc->buffer, l0 ) ;
            }
            else if ( l0->LAttribute & ( T_RAW_STRING | T_RAW_STRING ) ) LC_sprintString ( lc->buffer, *l0->Lo_PtrToValue ) ;
            else LC_sprintName ( lc->buffer, l0 ) ;
        }
        else
        {
            if ( _Q_->Verbosity > 2 ) LC_sprintf_String ( lc->buffer, " nil: %s", l0->Lo_Name ) ;
            else LC_sprintName ( lc->buffer, l0 ) ;
        }
    }
    else LC_sprintName ( lc->buffer, l0 ) ;
    LO_strcat ( lc->outBuffer, lc->buffer ) ;
}

void
_LO_PrintOneToString ( LambdaCalculus * lc, ListObject * l0, int64 in_a_LambdaFlag, int64 printValueFlag )
{
    if ( l0 )
    {
        if ( l0->LAttribute & ( LIST | LIST_NODE ) )
        {
            _LO_PrintListToString (lc, l0, in_a_LambdaFlag, printValueFlag) ;
        }
        else if ( ( l0 == nil ) || ( l0->LAttribute == T_NIL ) )
        {
            if ( _AtCommandLine ( ) ) LC_sprintAString ( lc->buffer, " nil" ) ;
        }
        else if ( l0->LAttribute == true )
        {
            if ( _AtCommandLine ( ) ) LC_sprintAString ( lc->buffer, " true" ) ;
        }
        else if ( l0->LAttribute == T_RAW_STRING ) LC_sprintString ( lc->buffer, l0->Lo_Value ) ;
        else if ( l0->LAttribute & ( T_LISP_DEFINE | T_LISP_COMPILED_WORD ) && ( ! GetState ( lc, LC_DEFINE_MODE ) ) )
        {
            //if ( LO_IsQuoted ( l0 ) ) LC_sprintName ( lc->buffer, l0 ) ;
#if 0            
            else if ( l0->Lo_Value && ( ! GetState ( lc, LC_PRINT_ENTERED ) ) )
            {
                SetState ( lc, LC_PRINT_ENTERED, true ) ; // prevents recursion thru here
                _LO_PrintListToString (lc, l0, 0, printValueFlag , 0) ;
                return lc->buffer ;
            }
#endif            
            //else 
            LC_sprintName ( lc->buffer, l0 ) ;
        }
        else if ( l0->LAttribute & T_LISP_SYMBOL )
        {
            if ( LO_IsQuoted ( l0 ) ) LC_sprintName ( lc->buffer, l0 ) ;
            else if ( ( ! in_a_LambdaFlag ) && l0->Lo_CfrTilWord && ( l0->LAttribute & T_LAMBDA ) )
                _LO_Print_Lambda_ToString ( lc, l0, printValueFlag ) ;
            else _LO_Print_NonLambdaSymbol_ToString ( lc, l0, printValueFlag ) ;
        }
        else if ( l0->LAttribute & (T_STRING|T_LISP_SYMBOL) )
        {
            if ( l0->State & UNQUOTED ) LC_sprintString ( lc->buffer, l0->Lo_String ) ;
            else LC_sprintf_String ( lc->buffer, " \"%s\"", l0->Lo_String ) ;
        }
        else if ( l0->LAttribute & BLOCK ) LC_snprintf2 ( lc->buffer, " %s:#<BLOCK>:0x%016lx", l0->Lo_Name, ( uint64 ) l0->Lo_UInteger ) ;
        else if ( l0->LAttribute & T_BIG_NUM ) _BigNum_FPrint ( ( mpfr_t * ) l0->W_Value ) ;
        else if ( l0->LAttribute & T_INT )
        {
            if ( _Context_->System0->NumberBase == 16 ) LC_snprintf1 ( lc->buffer, " 0x%016lx", ( uint64 ) l0->Lo_UInteger ) ;
            else LC_snprintf1 ( lc->buffer, ( l0->Lo_Integer < 0 ) ? " 0x%016lx" : " %ld", l0->Lo_Integer ) ;
        }
        else if ( l0->LAttribute & LITERAL )
        {
            if ( Namespace_IsUsing ( "BigNum" ) ) _BigNum_FPrint ( ( mpfr_t * ) l0->W_Value ) ;
            else if ( ( l0->Lo_Integer < 0 ) || ( _Context_->System0->NumberBase == 16 ) )
                LC_snprintf1 ( lc->buffer, " 0x%016lx", ( uint64 ) l0->Lo_UInteger ) ;
            else LC_snprintf1 ( lc->buffer, ( ( l0->Lo_Integer < 0 ) ? " 0x%016lx" : " %ld" ), l0->Lo_Integer ) ;
        }
        else if ( l0->LAttribute & ( CPRIMITIVE | CFRTIL_WORD ) ) LC_sprintName ( lc->buffer, l0 ) ;
        else if ( l0->LAttribute & ( T_HEAD | T_TAIL ) ) ;
        else
        {
            if ( l0->Lo_CfrTilWord && l0->Lo_CfrTilWord->Lo_Name ) LC_sprintString ( lc->buffer, l0->Lo_CfrTilWord->Lo_Name ) ;
            else if ( l0->Name ) LC_sprintName ( lc->buffer, l0 ) ;
        }
    }
    LO_strcat ( lc->outBuffer, lc->buffer ) ;
}

void
_LO_PrintListToString (LambdaCalculus * lc, ListObject * l0, int64 lambdaFlag, int64 printValueFlag)
{
    ListObject * l1, *lnext ;
    if ( l0 )
    {
        if ( l0->LAttribute & ( LIST | LIST_NODE ) )
        {
            LC_sprintAString ( lc->buffer, "(" ) ;
            LO_strcat ( lc->outBuffer, lc->buffer ) ;
        }
        for ( l1 = _LO_First ( l0 ) ; l1 ; l1 = lnext )
        {
            lnext = _LO_Next ( l1 ) ;
            _LO_PrintOneToString ( lc, l1, lambdaFlag, printValueFlag ) ;
        }
        if ( l0->LAttribute & ( LIST | LIST_NODE ) )
        {
            LC_sprintAString ( lc->buffer, ")" ) ;
            LO_strcat ( lc->outBuffer, lc->buffer ) ;
        }
    }
}

byte *
LO_PrintListToString ( LambdaCalculus * lc, ListObject * l0, int64 lambdaFlag, int64 printValueFlag )
{
    Buffer_Init ( lc->PrintBuffer, 0 ) ;
    Buffer_Init ( lc->OutBuffer, 0 ) ;
    _LO_PrintListToString (lc, l0, lambdaFlag, printValueFlag) ;
    SetState ( lc, LC_PRINT_ENTERED, false ) ;
    return lc->outBuffer ;
}

void
_LO_Print ( ListObject * l0, byte * prefix, byte * postfix, Boolean valueFlag )
{
    LO_PrintListToString ( _LC_, ( ListObject * ) l0, 0, valueFlag ) ;
    _Printf ( ( byte* ) "%s%s%s", prefix, _LC_->outBuffer, postfix ) ;
}

void
_LO_PrintWithValue ( ListObject * l0, byte * prefix, byte * postfix )
{
    _LO_Print ( l0, prefix, postfix, 1 ) ;
}

void
LO_PrintWithValue ( ListObject * l0 )
{
    _LO_PrintWithValue ( l0, "", "" ) ;
}

void
LC_PrintWithValue ( )
{
    ListObject * l0 = ( ListObject * ) DataStack_Pop ( ) ;
    LO_PrintWithValue ( l0 ) ;
}

byte *
_LO_PRINT_TO_STRING ( ListObject * l0 )
{
    return LO_PrintListToString ( _LC_, ( ListObject * ) l0, 0, 0 ) ;
}

byte *
_LO_PRINT_TO_STRING_WITH_VALUE ( ListObject * l0 )
{
    return LO_PrintListToString ( _LC_, ( ListObject * ) l0, 0, 1 ) ;
}

void
LO_Print ( ListObject * l0 )
{
    DefaultColors ;
    _LO_Print ( l0, "", "", 1 ) ;
}

