#include "../../include/cfrtil64.h"
//===================================================================================================================
//| LO_Print
//===================================================================================================================

byte *
_LO_PrintOneToString ( ListObject * l0, byte * buffer, int64 in_a_LambdaFlag, int64 printValueFlag )
{
    byte * format ;
    byte * buffer2 ;
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
            if ( _AtCommandLine ( ) )
            {
                snprintf ( ( char* ) buffer, BUFFER_SIZE, " nil" ) ;
            }
        }
        else if ( l0->LAttribute == true )
        {
            if ( _AtCommandLine ( ) )
            {
                snprintf ( ( char* ) buffer, BUFFER_SIZE, " T" ) ;
            }
        }
            //else if ( l0->LAttribute & (T_STRING|T_RAW_STRING) )
        else if ( l0->LAttribute == T_RAW_STRING )
        {
            snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", ( char* ) l0->Lo_Value ) ;
        }
        else if ( l0->LAttribute & ( T_LISP_DEFINE | T_LISP_COMPILED_WORD ) && ( ! GetState ( _LC_, LC_DEFINE_MODE ) ) )
        {
            if ( LO_IsQuoted ( l0 ) ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
            else if ( l0->Lo_CfrTilWord && l0->Lo_CfrTilWord->W_SourceCode && ( ! GetState ( _LC_, LC_PRINT_ENTERED ) ) )
            {
                snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", ( char* ) l0->Lo_CfrTilWord->W_SourceCode ) ;
            }
            else
            {
                //LO_Print ( ( ListObject* ) l0->Lo_Value ) ;
                snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
            }
        }
        else if ( l0->LAttribute & T_LISP_SYMBOL )
        {
            if ( LO_IsQuoted ( l0 ) ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
            else if ( ( ! in_a_LambdaFlag ) && l0->Lo_CfrTilWord && ( l0->LAttribute & T_LAMBDA ) ) //&& ( ! ( l0->LType & T_LISP_SPECIAL ) ) ) // lambdaFlag == lambdaFlag : don't print internal lambda param/body
            {
                //SetState ( _LC_, LC_PRINT_ENTERED, true ) ;
                buffer2 = Buffer_New_pbyte ( BUFFER_SIZE ) ;
                snprintf ( ( char* ) buffer2, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
                if ( ! LO_strcat ( buffer, buffer2 ) ) return buffer ;
                _LO_PrintListToString ( ( ListObject * ) l0->Lo_LambdaFunctionParameters, buffer2, 1, printValueFlag ) ; // 1 : lambdaFlag = 1 
                if ( ! LO_strcat ( buffer, buffer2 ) ) return buffer ;
                _LO_PrintListToString ( ( ListObject * ) l0->Lo_LambdaFunctionBody, buffer2, 1, printValueFlag ) ; // 1 : lambdaFlag = 1 
                if ( ! LO_strcat ( buffer, buffer2 ) ) return buffer ;
            }
            else if ( printValueFlag ) //&& GetState ( _LC_, ( PRINT_VALUE ) ) )
            {
                if ( *l0->Lo_PtrToValue != ( uint64 ) nil )
                {
                    if ( ( ! *l0->Lo_PtrToValue ) && l0->Lo_CfrTilWord )
                    {
                        if ( _Q_->Verbosity > 2 ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s = 0x%016lx", l0->Lo_CfrTilWord->Lo_Name, ( int64 ) l0->Lo_CfrTilWord ) ;
                        else snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
                    }
                    else if ( l0->LAttribute & ( T_RAW_STRING | T_RAW_STRING ) )
                    {
                        snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", ( char* ) *l0->Lo_PtrToValue ) ;
                    }
                    else
                    {
                        //return _LO_Print ( ( ListObject * ) *l0->Lo_PtrToValue, buffer, 0, printValueFlag ) ;
                        snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
                    }
                }
                else
                {
                    if ( _Q_->Verbosity > 2 ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " nil: %s", l0->Lo_Name ) ;
                    else snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
                }
            }
            else snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
        }
        else if ( l0->LAttribute & T_STRING )
        {
            if ( l0->State & UNQUOTED ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", ( char* ) l0->Lo_String ) ;
            else snprintf ( ( char* ) buffer, BUFFER_SIZE, " \"%s\"", ( char* ) l0->Lo_String ) ;
        }
        else if ( l0->LAttribute & BLOCK )
        {
            snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s:#<BLOCK>:0x%016lx", l0->Lo_Name, ( uint64 ) l0->Lo_UInteger ) ;
        }
        else if ( l0->LAttribute & T_BIG_NUM )
        {
            //mpfr_printf ( " %*.*Rf\n", _Context_->System0->BigNum_Printf_Width, _Context_->System0->BigNum_Printf_Precision, *l0->Lo_PtrToValue ) ;
            _BigNum_FPrint ( ( mpfr_t * ) l0->W_Value ) ;
        }
        else if ( l0->LAttribute & T_INT )
        {
            if ( _Context_->System0->NumberBase == 16 ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " 0x%016lx", ( uint64 ) l0->Lo_UInteger ) ;
            else
            {
                format = ( ( ( int64 ) l0->Lo_Integer ) < 0 ) ? ( byte* ) " 0x%016lx" : ( byte* ) " %ld" ;
                snprintf ( ( char* ) buffer, BUFFER_SIZE, ( char* ) format, l0->Lo_Integer ) ;
            }
        }
        else if ( l0->LAttribute & LITERAL )
        {
            if ( Namespace_IsUsing ( "BigNum" ) )
            {
                //mpfr_printf ( " %*.*Rf\n", _Context_->System0->BigNum_Printf_Width, _Context_->System0->BigNum_Printf_Precision, *l0->Lo_PtrToValue ) ;
                _BigNum_FPrint ( ( mpfr_t * ) l0->W_Value ) ;
            }
            else
            {
                format = ( ( ( int64 ) l0->Lo_Integer ) < 0 ) ? ( byte* ) " 0x%016lx" : ( byte* ) " %ld" ;
                if ( ( l0->Lo_Integer < 0 ) || ( _Context_->System0->NumberBase == 16 ) ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " 0x%016lx", ( uint64 ) l0->Lo_UInteger ) ;
                else snprintf ( ( char* ) buffer, BUFFER_SIZE, ( char* ) format, l0->Lo_Integer ) ;
            }
        }
        else if ( l0->LAttribute & ( CPRIMITIVE | CFRTIL_WORD ) )
        {
            snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_Name ) ;
        }
        else if ( l0->LAttribute & ( T_HEAD | T_TAIL ) )
        {
            ; //break ;
        }
        else
        {
            if ( l0->Lo_CfrTilWord && l0->Lo_CfrTilWord->Lo_Name ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Lo_CfrTilWord->Lo_Name ) ;
            else if ( l0->Name ) snprintf ( ( char* ) buffer, BUFFER_SIZE, " %s", l0->Name ) ;
        }
    }
done:
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
            snprintf ( ( char* ) buffer2, BUFFER_SIZE, " (" ) ;
            if ( ! LO_strcat ( buffer, buffer2 ) ) goto done ; //return buffer ;
        }
        for ( l1 = _LO_First ( l0 ) ; l1 ; l1 = lnext )
        {
            lnext = _LO_Next ( l1 ) ; //
            if ( l1->LAttribute & ( LIST | LIST_NODE ) )
            {
                _LO_PrintListToString ( l1, buffer2, lambdaFlag, printValueFlag ) ;
                if ( ! LO_strcat ( buffer, buffer2 ) ) goto done ; //return buffer ;
            }
            else
            {
                _LO_PrintOneToString ( l1, buffer2, lambdaFlag, printValueFlag ) ;
                if ( ! LO_strcat ( buffer, buffer2 ) ) goto done ; //return buffer ;
            }
        }
        if ( l0->LAttribute & ( LIST | LIST_NODE ) ) snprintf ( ( char* ) buffer2, BUFFER_SIZE, " )" ) ;
        LO_strcat ( buffer, buffer2 ) ;
    }
done:
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

