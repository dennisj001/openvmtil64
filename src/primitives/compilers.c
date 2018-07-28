#include "../include/cfrtil64.h"

void
CfrTil_Here ( )
{
    DataStack_Push ( ( int64 ) Here ) ;
}

void
CfrTil_Code ( )
{
    DataStack_Push ( ( int64 ) _Q_CodeByteArray ) ;
}

#if 0

void
CfrTil_Rsp ( )
{
    DataStack_Push ( ( int64 ) & _Rsp_ ) ;
}
#endif

void
CompileCall ( )
{
    Compile_Call_TestRSP ( ( byte* ) DataStack_Pop ( ) ) ;
}

void
CompileACfrTilWord ( )
{
    _Word_Compile ( ( Word* ) DataStack_Pop ( ) ) ;
}

void
CompileInt64 ( )
{

    union
    {
        int64 q0 [2 ] ;
        int64 q ;
    } li ;
    li.q0[1] = DataStack_Pop ( ) ;
    li.q0[0] = DataStack_Pop ( ) ; // little endian - low order bits should be pushed first
    _Compile_Int64 ( li.q ) ;

}

void
CompileInt32 ( )
{
    int64 l = DataStack_Pop ( ) ;
    _Compile_Int32 ( l ) ;

}

void
CompileInt16 ( )
{
    int64 w = DataStack_Pop ( ) ;
    _Compile_Int16 ( ( short ) w ) ;

}

void
CompileByte ( )
{
    int64 b = DataStack_Pop ( ) ;
    _Compile_Int8 ( b ) ;
}

void
CompileN ( )
{
    int64 size = DataStack_Pop ( ) ;
    byte * data = ( byte* ) DataStack_Pop ( ) ;
    _CompileN ( data, size ) ;
}

GotoInfo *
_GotoInfo_Allocate ( )
{
    GotoInfo * gi = ( GotoInfo * ) Mem_Allocate ( sizeof ( GotoInfo ), COMPILER_TEMP ) ;
    return gi ;
}

void
GotoInfo_Remove ( dlnode * node )
{
    GotoInfo * gi = ( GotoInfo* ) node ;
    dlnode_Remove ( ( dlnode * ) gi ) ;
}

GotoInfo *
GotoInfo_Init ( GotoInfo * gotoInfo, byte * lname, uint64 type )
{
    gotoInfo->pb_LabelName = lname ;
    gotoInfo->pb_JmpOffsetPointer = Here - INT32_SIZE ; // after the jmp/call opcode
    gotoInfo->GI_CAttribute = type ;
    gotoInfo->CompileAtAddress = Here - 5 ; // 5 : size of jmp/call insn
    return gotoInfo ;
}

GotoInfo *
GotoInfo_New ( byte * lname, uint64 type )
{
    GotoInfo * gotoInfo = ( GotoInfo * ) _GotoInfo_Allocate ( ) ;
    GotoInfo_Init ( gotoInfo, lname, type ) ;
    dllist_AddNodeToHead ( _Context_->Compiler0->GotoList, ( dlnode* ) gotoInfo ) ;
    return gotoInfo ;
}

void
_CfrTil_CompileCallGoto ( byte * name, uint64 type )
{
    if ( type == GI_RECURSE )
    {
        _Compile_UninitializedCall ( ) ;
    }
    else _Compile_UninitializedJump ( ) ;
    GotoInfo_New ( name, type ) ;
}

void
_CfrTil_Goto ( byte * name )
{
    _CfrTil_CompileCallGoto ( name, GI_GOTO ) ;
}

void
_CfrTil_GotoLabel ( byte * name )
{
    _CfrTil_CompileCallGoto ( name, GI_GOTO_LABEL ) ;
}

void
CfrTil_Goto ( )
{
    _CfrTil_Goto ( ( byte * ) DataStack_Pop ( ) ) ;
}

void
CfrTil_Goto_Prefix ( )
{
    byte * gotoToken = Lexer_ReadToken ( _Context_->Lexer0 ) ;
    _CfrTil_Goto ( gotoToken ) ;
}

void
CfrTil_Label ( )
{
    _CfrTil_Label ( ( byte* ) DataStack_Pop ( ) ) ;
}

void
CfrTil_Label_Prefix ( )
{
    byte * labelToken = Lexer_ReadToken ( _Context_->Lexer0 ) ;
    _CfrTil_Label ( labelToken ) ;
}

// 'return' is a prefix word now C_SYNTAX or not

void
CfrTil_Return ( )
{
    //if ( GetState ( _Context_, C_SYNTAX ) )
    {
        byte * token = Lexer_PeekNextNonDebugTokenWord ( _Lexer_, 0 ) ;
        Word * word = Finder_Word_FindUsing ( _Finder_, token, 0 ) ;
        if ( word && ( word->CAttribute & ( NAMESPACE_VARIABLE | LOCAL_VARIABLE | PARAMETER_VARIABLE ) ) )
        {
            _Compiler_->ReturnVariableWord = word ;
            //if ( word->CAttribute & REGISTER_VARIABLE ) 
            Lexer_ReadToken ( _Context_->Lexer0 ) ; // don't compile anything let end block or locals deal with the return
        }
        else
        {
            if ( ! _Readline_Is_AtEndOfBlock ( _Context_->ReadLiner0 ) )
            {
                _CfrTil_CompileCallGoto ( 0, GI_RETURN ) ;
            }
        }
    }
#if 0    
    else if ( ! _Readline_Is_AtEndOfBlock ( _Context_->ReadLiner0 ) )
    {
        _CfrTil_CompileCallGoto ( 0, GI_RETURN ) ;
    }
#endif    
}

void
CfrTil_Continue ( )
{
    _CfrTil_CompileCallGoto ( 0, GI_CONTINUE ) ;
}

void
CfrTil_Break ( )
{
    _CfrTil_CompileCallGoto ( 0, GI_BREAK ) ;
}

void
CfrTil_SetupRecursiveCall ( )
{
    _CfrTil_CompileCallGoto ( 0, GI_RECURSE ) ;
}

#if 0

void
CfrTil_Tail ( )
{
    _Printf ( ( byte* ) "\nTailCall not implemented yet. Fix me!\n" ) ;
    return ;
    _CfrTil_CompileCallGoto ( GI_TAIL_CALL ) ;
}
#endif

void
CfrTil_Literal ( )
{
    int64 value = DataStack_Pop ( ) ;
    //Word * word = _DataObject_New ( LITERAL, 0, 0, LITERAL, 0, 0, ( uint64 ) _DataStack_Pop ( ), 0 ) ;
    ByteArray * svcs = _Q_CodeByteArray ;
    //Compiler_SetCompilingSpace_MakeSureOfRoom ( "TempObjectSpace" ) ; 
    _NBA_SetCompilingSpace_MakeSureOfRoom ( _Q_->MemorySpace0->TempObjectSpace, 4 * K ) ;
    Word * word = _DataObject_New ( LITERAL, 0, "<a literal>", LITERAL | CONSTANT, 0, 0, 0, value, 0, - 1, - 1 ) ;
    Set_CompilerSpace ( svcs ) ;
    _Interpreter_DoWord ( _Context_->Interpreter0, word, - 1, - 1 ) ;
}

void
CfrTil_Constant ( )
{
    int64 value = DataStack_Pop ( ) ;
    byte * name = ( byte* ) DataStack_Pop ( ) ;
    Word * word = _DataObject_New ( CONSTANT, 0, name, LITERAL | CONSTANT, 0, 0, 0, value, 0, - 1, - 1 ) ;
    byte *buffer = Buffer_Data ( _CfrTil_->ScratchB1 ) ;
    sprintf ( buffer, ( byte* ) "\'%s %ld const // (hypothetical)", ( char* ) name, value ) ;
    word->W_SourceCode = String_New_SourceCode ( buffer ) ;


}

void
CfrTil_Variable ( )
{
    byte * name = ( byte* ) DataStack_Pop ( ) ;
    _DataObject_New ( NAMESPACE_VARIABLE, 0, name, NAMESPACE_VARIABLE, 0, 0, 0, 0, 0, - 1, - 1 ) ;
}

// "{|" - exit the Compiler start interpreting
// named after the forth word '[' 

void
CfrTil_LeftBracket ( )
{
    Compiler * compiler = _Compiler_ ;
    SetState ( compiler, COMPILE_MODE, false ) ;
    if ( compiler->SaveOptimizeState ) CfrTil_OptimizeOn ( ) ;
}

// "|}" - enter the Compiler
// named following the forth word ']'

void
CfrTil_RightBracket ( )
{
    Compiler * compiler = _Compiler_ ;
    SetState ( compiler, COMPILE_MODE, true ) ;
    compiler->SaveOptimizeState = GetState ( _CfrTil_, OPTIMIZE_ON ) ;
}

void
CfrTil_CompileMode ( )
{
    DataStack_Push ( GetState ( _Context_->Compiler0, COMPILE_MODE ) ) ;
}

