
#include "../../include/cfrtil64.h"

void
CfrTil_PreProcessor ( )
{
    Interpreter * interp = _Context_->Interpreter0 ;
    if ( ! Compiling ) _CfrTil_InitSourceCode_WithName ( _CfrTil_, _Lexer_->OriginalToken ) ;
    Finder_SetNamedQualifyingNamespace ( _Finder_, ( byte* ) "PreProcessor" ) ;
    SetState ( interp, PREPROCESSOR_MODE, true ) ;
    _Interpret_ToEndOfLine ( interp ) ;
    SetState ( interp, PREPROCESSOR_MODE, false ) ;
}

Ppibs *
Ppibs_Init ( Ppibs * ppibs )
{
    memset ( ppibs, 0, sizeof (Ppibs ) ) ;
    return ppibs ;
}

Ppibs *
Ppibs_New ( )
{
    Ppibs * ppibs = ( Ppibs * ) Mem_Allocate ( sizeof (Ppibs ), CONTEXT ) ;
    //Ppibs_Init ( ppibs ) ;
    return ppibs ;
}
#if DEBUG_SAVE_DONT_DELETE
#define dbg( x ) x
void
Ppibs_Print ( Ppibs * ppibs, byte * prefix )
{
    int64 depth = List_Length ( _Context_->PreprocessorStackList ) ;
    _Printf ( ( byte* ) "\n\nInputLineString = %s", _ReadLiner_->InputLineString ) ;
    _Printf ( ( byte* ) "\n%s : Ppibs = 0x%016lx : depth = %d : Filename = %s : Line = %d", prefix, ppibs, depth, ppibs->Filename, ppibs->LineNumber ) ;
    _Printf ( ( byte* ) "\nIfBlockStatus = %d", ppibs->IfBlockStatus ) ;
    _Printf ( ( byte* ) "\nElifStatus = %d", ppibs->ElifStatus ) ;
    _Printf ( ( byte* ) "\nElseStatus = %d", ppibs->ElseStatus ) ;
    //Pause () ;
}
#else 
#define dbg( x )
#endif
/* preprocessor BNF :
 *  ppBlock      =:=     #if (elifBlock)* (elseBlock)? #endif
 *  elifBlock    =:=     #elif (ppBlock)*
 *  elseBlock    =:=     #else (ppBlock)*
 */
// "#if" stack pop is 'true' interpret until "#else" and this does nothing ; if stack pop 'false' skip to "#else" token skip those tokens and continue interpreting

Boolean
GetAccumulatedBlockStatus ( int listStartIndex )
{
    int64 status = 0, i, llen = List_Length ( _Context_->PreprocessorStackList ) ;
    if ( llen )
    {
        Ppibs *ppibSstatus ;
        for ( i = listStartIndex ; i <= ( llen - 1 ) ; i ++ ) // -1: 0 based list
        {
            ppibSstatus = ( Ppibs * ) List_GetN ( _Context_->PreprocessorStackList, i ) ;
            status = status || ( ppibSstatus->IfBlockStatus || ppibSstatus->ElifStatus || ppibSstatus->ElseStatus ) ;
            if ( ! status ) break ;
        }
    }
    return llen ? status : 1 ; // 1 : default status
}

int64
GetElxxStatus ( int64 cond, int64 type )
{
    int64 llen = List_Length ( _Context_->PreprocessorStackList ) ;
    Ppibs *top = ( Ppibs * ) List_Top ( _Context_->PreprocessorStackList ) ;
    Boolean status = false, accStatus = GetAccumulatedBlockStatus ( 1 ) ; // 1 ??
    if ( type == PP_ELIF )
    {
        if ( ( top->ElseStatus || top->ElifStatus ) ) status = 0 ; // no 'elif 1' after an 'elif 1' or and 'else' in the same block
        else
        {
            if ( llen > 1 )
            {
                if ( accStatus ) status = ( ! ( top->IfBlockStatus || top->ElseStatus ) ) && cond ;
                else status = 0 ;
            }
            else status = ( ! ( top->IfBlockStatus || top->ElseStatus ) ) && cond ;
        }
        top->ElifStatus = status ;
        top->ElseStatus = 0 ; // normally elif can't come after else but we make reasonable (?) sense of it here
    }
    else if ( type == PP_ELSE )
    {
#if 1        
        if ( llen > 1 )
        {
            if ( accStatus ) status = ( ! ( top->IfBlockStatus || top->ElifStatus ) ) ;
            else status = 0 ;
        }
        else status = ( ! ( top->IfBlockStatus || top->ElifStatus ) ) ;
        top->ElseStatus = status ;
        top->ElifStatus = 0 ; //status ; // so total block status will be the 'else' status
#else        
        if ( llen ) current.int64_Ppibs = List_GetN ( _Context_->PreprocessorStackList, llen - 1 ) ; // -1: 0 based list
        else SyntaxError ( 1 ) ;
        status = ( ! ( current.IfBlockStatus || current.ElifStatus ) ) ;
        current.ElseStatus = status ;
        current.ElifStatus = 0 ; //status ; // so total block status will be the 'else' status
        List_SetN ( _Context_->PreprocessorStackList, ( llen - 1 ), current.int64_Ppibs ) ;
#endif        
    }
    List_SetTop ( _Context_->PreprocessorStackList, ( int64 ) top ) ;
    dbg ( Ppibs_Print ( top, ( byte* ) ( ( type == PP_ELSE ) ? "Else : ElxxStatus: top of PreprocessorStackList" : "Elif : ElxxStatus" ) ) ) ;
    return status ;
}

Boolean
_GetCondStatus ( )
{
    Context * cntx = _Context_ ;
    Boolean status, svcm = GetState ( cntx->Compiler0, COMPILE_MODE ), svcs = GetState ( cntx, C_SYNTAX ) ;
    SetState ( cntx->Compiler0, COMPILE_MODE, false ) ;
    SetState ( cntx, C_SYNTAX, false ) ;
    _Interpret_ToEndOfLine ( cntx->Interpreter0 ) ;
    SetState ( cntx->Compiler0, COMPILE_MODE, svcm ) ;
    SetState ( cntx, C_SYNTAX, svcs ) ;
    status = DataStack_Pop ( ) ;
    if ( status > 0 ) status = 1 ;
    return status ;
}

Boolean
GetIfStatus ( )
{
    Ppibs * cstatus = Ppibs_New ( ) ;
    Boolean accStatus, cond ;
    accStatus = GetAccumulatedBlockStatus ( 0 ) ;
    cond = _GetCondStatus ( ) ;
    cstatus->IfBlockStatus = cond && accStatus ; // 1 default is to do interpret
    cstatus->Filename = _ReadLiner_->Filename ;
    cstatus->LineNumber = _ReadLiner_->LineNumber ;
    List_Push ( _Context_->PreprocessorStackList, ( int64 ) cstatus, TEMPORARY ) ;
    dbg ( Ppibs_Print ( cstatus, ( byte* ) "IfStatus" ) ) ;
    return cstatus->IfBlockStatus ;
}

Boolean
GetElifStatus ( )
{
    int64 cond = _GetCondStatus ( ) ;
    return GetElxxStatus ( cond, PP_ELIF ) ;
}

Boolean
GetElseStatus ( )
{
    return GetElxxStatus ( 0, PP_ELSE ) ;
}

Boolean
_GetEndifStatus ( )
{
    Boolean status = GetAccumulatedBlockStatus ( 0 ) ;
    return status ;
}

Boolean
GetEndifStatus ( )
{
    List_Pop ( _Context_->PreprocessorStackList ) ;
    Boolean status = _GetEndifStatus ( ) ;
    return status ;
}

void
SkipPreprocessorCode ( Boolean toEndifFlag )
{
    Context * cntx = _Context_ ;
    Lexer * lexer = cntx->Lexer0 ;
    byte * token ;
    int64 ifCount = 0, endifStatus = 0 ; //toEndifFlag ? 1 : 0 ;
    Lexer_SourceCodeOff ( lexer ) ;
    do
    {
        int64 inChar = ReadLine_PeekNextChar ( cntx->ReadLiner0 ) ;
        if ( ( inChar == - 1 ) || ( inChar == eof ) )
        {
            SetState ( lexer, LEXER_END_OF_LINE, true ) ;
            goto done ;
        }
        token = Lexer_ReadToken ( lexer ) ;
        if ( token )
        {
            if ( String_Equal ( token, "//" ) )
            {
                CfrTil_CommentToEndOfLine ( ) ;
                Lexer_SourceCodeOff ( lexer ) ;
            }
            else if ( String_Equal ( token, "/*" ) )
            {
                CfrTil_ParenthesisComment ( ) ;
                Lexer_SourceCodeOff ( lexer ) ;
            }
            else if ( String_Equal ( token, "#" ) )
            {
                byte * token1 = Lexer_ReadToken ( lexer ) ;
                if ( token1 )
                {
                    if ( String_Equal ( token1, "if" ) )
                    {
                        if ( toEndifFlag ) ifCount ++ ;
                        else if ( GetIfStatus ( ) ) goto done ; // PP_INTERP
                    }
                    else if ( String_Equal ( token1, "else" ) )
                    {
                        if ( toEndifFlag ) continue ;
                        else if ( GetElseStatus ( ) ) goto done ;
                    }
                    else if ( String_Equal ( token1, "elif" ) )
                    {
                        if ( toEndifFlag ) continue ;
                        else if ( GetElifStatus ( ) ) goto done ;
                    }
                    else if ( String_Equal ( token1, "endif" ) )
                    {
                        if ( toEndifFlag )
                        {
                            if ( -- ifCount <= 0 )
                            {
#if DEBUG_SAVE_DONT_DELETE
                                endifStatus = _GetEndifStatus ( ) ;
                                if ( ! endifStatus )
                                {
                                    Ppibs *top = ( Ppibs * ) List_GetN ( _Context_->PreprocessorStackList, 0 ) ;
                                    byte *buffer = Buffer_Data ( _CfrTil_->ScratchB1 ) ;
                                    sprintf ( buffer, ( byte* ) "top : endifStatus = %ld : ifCount = %ld", endifStatus, ifCount ) ;
                                    dbg ( Ppibs_Print ( top, buffer ) ) ;
                                    Ppibs *first = ( Ppibs * ) List_GetN ( _Context_->PreprocessorStackList, 1 ) ;
                                    sprintf ( buffer, ( byte* ) "first : endifStatus = %ld : ifCount = %ld", endifStatus, ifCount ) ;
                                    dbg ( Ppibs_Print ( first, buffer ) ) ;
                                }
#endif                                    
                                goto done ;
                            }
                        }
                        else if ( toEndifFlag || GetEndifStatus ( ) ) goto done ;
                    }
                    else _SyntaxError ( "Stray '#' in code!", 1 ) ;
                }
                else goto done ;
            }
        }
    }
    while ( token ) ;
done:
    Lexer_SourceCodeOn ( lexer ) ;
}

void
CfrTil_If_ConditionalInterpret ( )
{
    if ( ! GetIfStatus ( ) ) SkipPreprocessorCode ( 0 ) ;
}

void
CfrTil_Elif_ConditionalInterpret ( )
{
    if ( ! GetElifStatus ( ) ) SkipPreprocessorCode ( 0 ) ;
}

void
CfrTil_Else_ConditionalInterpret ( )
{
    if ( ! GetElseStatus ( ) ) SkipPreprocessorCode ( 1 ) ;
}

void
CfrTil_Endif_ConditionalInterpret ( )
{
    if ( ! GetEndifStatus ( ) ) SkipPreprocessorCode ( 0 ) ;
}

