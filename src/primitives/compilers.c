#include "../include/cfrtil64.h"

void
CfrTil_Here ( )
{
    DataStack_Push ( ( int64 ) Here ) ;
}

void
CfrTil_Code ( )
{
    DataStack_Push ( ( int64 ) _O_CodeByteArray ) ;
}

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
    _Compile_Int64 ( DataStack_Pop ( ) ) ;
}

void
Compile_Int32 ( )
{
    int64 l = DataStack_Pop ( ) ;
    _Compile_Int32 ( l ) ;
}

void
Compile_Int16 ( )
{
    int64 w = DataStack_Pop ( ) ;
    _Compile_Int16 ( ( short ) w ) ;
}

void
Compile_Int8 ( )
{
    int64 b = DataStack_Pop ( ) ;
    _Compile_Int8 ( b ) ;
}

void
Compile_N_Bytes ( )
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
    else Compile_UninitializedJump ( ) ;
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
    Compiler_WordStack_SCHCPUSCA ( 0, 0 ) ;
    byte * token = Lexer_Peek_Next_NonDebugTokenWord ( _Lexer_, 0, 0 ) ;
    Word * word = Finder_Word_FindUsing ( _Finder_, token, 0 ) ;
    int64 tsrli = - 1, scwi = - 1 ;
    Word_SetTsrliScwi ( word, tsrli, scwi ) ;
    if ( word && ( word->W_ObjectAttributes & ( NAMESPACE_VARIABLE | LOCAL_VARIABLE | PARAMETER_VARIABLE ) ) )
    {
        Lexer_ReadToken ( _Lexer_ ) ;
        CfrTil_WordList_PushWord ( word ) ;
        _Compiler_->ReturnVariableWord = word ;
        if ( GetState ( _CfrTil_, TYPECHECK_ON ) )
        {
            Word * cwbc = _Context_->CurrentWordBeingCompiled ;
            if ( ( word->W_ObjectAttributes & LOCAL_VARIABLE ) && cwbc )
            {
                cwbc->W_TypeSignatureString [_Compiler_->NumberOfArgs] = '.' ;
                int8 swtsCodeSize = Tsi_ConvertTypeSigCodeToSize ( Tsi_Convert_Word_TypeAttributeToTypeLetterCode ( word ) ) ;
                int8 cwbctsCodeSize = Tsi_ConvertTypeSigCodeToSize ( cwbc->W_TypeSignatureString [_Compiler_->NumberOfArgs + 1] ) ;
                if ( swtsCodeSize > cwbctsCodeSize )
                    cwbc->W_TypeSignatureString [_Compiler_->NumberOfArgs + 1] = Tsi_Convert_Word_TypeAttributeToTypeLetterCode ( word ) ;
            }
        }
        //Lexer_ReadToken ( _Context_->Lexer0 ) ; // don't compile anything let end block or locals deal with the return
    }
    else
    {
        if ( ! _Readline_Is_AtEndOfBlock ( _Context_->ReadLiner0 ) )
        {
            //WordStack_SCHCPUSCA ( 0, 1 ) ;
            _CfrTil_CompileCallGoto ( 0, GI_RETURN ) ;
        }
    }
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

void
CfrTil_Literal ( )
{
    int64 value = DataStack_Pop ( ) ;
    ByteArray * svcs = _O_CodeByteArray ;
    _NBA_SetCompilingSpace_MakeSureOfRoom ( _O_->MemorySpace0->TempObjectSpace, 4 * K ) ;
    Word * word = DataObject_New (LITERAL, 0, ( byte* ) "<literal>", 0, LITERAL | CONSTANT, 0, 0, value, 0, 0, - 1, - 1 ) ;
    Set_CompilerSpace ( svcs ) ;
    Interpreter_DoWord ( _Context_->Interpreter0, word, - 1, - 1 ) ;
}

void
CfrTil_Constant ( )
{
    Word *tword = 0, *cword ;
    int64 value = DataStack_Pop ( ) ;
    tword = CfrTil_TypeStack_Pop ( ) ;
    byte * name = ( byte* ) DataStack_Pop ( ) ;
    cword = DataObject_New (CONSTANT, 0, name, 0, CONSTANT, 0, 0, value, 0, 0, - 1, - 1 ) ;
    if ( tword ) cword->W_ObjectAttributes |= tword->W_ObjectAttributes ;
    CfrTil_Finish_WordSourceCode ( _CfrTil_, cword ) ;
}

void
CfrTil_Variable ( )
{
    byte * name = ( byte* ) DataStack_Pop ( ) ;
    Word * word = DataObject_New (NAMESPACE_VARIABLE, 0, name, 0, NAMESPACE_VARIABLE, 0, 0, 0, 0, 0, - 1, - 1 ) ;
    if ( ! Compiling ) CfrTil_Finish_WordSourceCode ( _CfrTil_, word ) ;
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
_CfrTil_RightBracket ( )
{
    Compiler * compiler = _Compiler_ ;
    SetState ( compiler, COMPILE_MODE, true ) ;
    compiler->SaveOptimizeState = GetState ( _CfrTil_, OPTIMIZE_ON ) ;
}

void
CfrTil_RightBracket ( )
{
    if ( ! Compiling ) Compiler_Init (_Compiler_, 0) ;
    _CfrTil_RightBracket ( ) ;
}

void
CfrTil_AsmModeOn ( )
{
    SetState ( _Context_->Compiler0, ASM_MODE, true ) ;
}

void
CfrTil_AsmModeOff ( )
{
    SetState ( _Context_->Compiler0, ASM_MODE, false ) ;
}

void
CfrTil_CompileMode ( )
{
    DataStack_Push ( GetState ( _Context_->Compiler0, COMPILE_MODE ) ) ;
}

void
CfrTil_FinishWordDebugInfo ( )
{
    _CfrTil_FinishWordDebugInfo ( 0 ) ;
}
