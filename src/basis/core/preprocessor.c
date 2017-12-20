
#include "../../include/cfrtil64.h"

/* preprocessor BNF :
 *  ppBlock      =:=     #if (elifBlock)* (elseBlock)? #endif
 *  elifBlock    =:=     #elif (ppBlock)*
 *  elseBlock    =:=     #else (ppBlock)*
 */
// "#if" stack pop is 'true' interpret until "#else" and this does nothing ; if stack pop 'false' skip to "#else" token skip those tokens and continue interpreting

int64
GetAccumulatedBlockStatus ( int listStart )
{
    Interpreter * interp = _Context_->Interpreter0 ;
    int64 status = 0, i, llen = List_Length ( interp->PreprocessorStackList ) ; 
    Ppibs status_i ;
    for ( i = listStart ; i <= (llen-1) ; i ++ ) // -1: 0 based list
    {
        status_i.int64_Ppibs = List_GetN ( interp->PreprocessorStackList, i ) ;
        status = status || ( status_i.IfBlockStatus || status_i.ElifStatus || status_i.ElseStatus ) ;
        if ( ! status ) break ;
    }
    return llen ? status : 1 ; // 1 : default status
}


int64
GetElxxStatus ( int64 cond, int64 type )
{
    Interpreter * interp = _Context_->Interpreter0 ;
    int64 llen = List_Length ( interp->PreprocessorStackList ) ;
    Ppibs top ;
    top.int64_Ppibs = List_Top ( interp->PreprocessorStackList ) ;
    Boolean status = false, accStatus = GetAccumulatedBlockStatus ( 1 ) ;
    if ( type == PP_ELIF )
    {
        if (llen > 1) 
        {
            if ( accStatus ) status = (! (top.IfBlockStatus || top.ElseStatus )) && cond ;
            else status = 0 ;
        }
        else status = (! (top.IfBlockStatus || top.ElseStatus )) && cond ;
        top.ElifStatus = status ;
        top.ElseStatus = 0 ; // normally elif can't come after else but we make reasonable (?) sense of it here
    }
    else if ( type == PP_ELSE )
    {
        //top.ElseStatus = 1 ;
        if (llen > 1) 
        {
            if ( accStatus ) status = (! (top.IfBlockStatus || top.ElifStatus ))  ;
            else status = 0 ;
        }
        else status = (! (top.IfBlockStatus || top.ElifStatus ))  ;
        top.ElseStatus = status ;
        top.ElifStatus = status ; // so total block status will be the 'else' status
     }
    List_SetTop ( interp->PreprocessorStackList, top.int64_Ppibs ) ;
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
    Interpreter * interp = _Context_->Interpreter0 ;
    Ppibs cstatus ;
    cstatus.int64_Ppibs = 0 ;
    Boolean accStatus, cond = _GetCondStatus ( ) ;
    accStatus = GetAccumulatedBlockStatus ( 0 ) ;
    cstatus.IfBlockStatus = cond && accStatus ; // 1 default is to do interpret
    List_Push ( interp->PreprocessorStackList, cstatus.int64_Ppibs, COMPILER_TEMP ) ;
    return cstatus.IfBlockStatus ;
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
GetEndifStatus ( )
{
    List_Pop ( _Context_->Interpreter0->PreprocessorStackList ) ;
    Boolean status = GetAccumulatedBlockStatus ( 0 ) ;
    return status ;
}

void
SkipPreprocessorCode ( )
{
    Context * cntx = _Context_ ;
    Lexer * lexer = cntx->Lexer0 ;
    byte * token ;
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
                        if ( GetIfStatus ( ) ) goto done ; // PP_INTERP
                    }
                    else if ( String_Equal ( token1, "else" ) )
                    {
                        if ( GetElseStatus ( ) ) goto done ;
                    }
                    else if ( String_Equal ( token1, "elif" ) )
                    {
                        if ( GetElifStatus ( ) ) goto done ;
                    }
                    else if ( String_Equal ( token1, "endif" ) )
                    {
                        if ( GetEndifStatus ( ) ) goto done ;
                    }
                    //else syntax error
                }
                else goto done ;
            }
        }
    }
    while ( token ) ;
done:
    Lexer_SourceCodeOn ( lexer ) ;
}

