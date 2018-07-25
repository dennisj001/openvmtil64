
#include "../../include/cfrtil64.h"

int64
_CheckArrayDimensionForVariables_And_UpdateCompilerState ( )
{
    if ( _Readline_CheckArrayDimensionForVariables ( _Context_->ReadLiner0 ) ) return true ;
    else return false ;
}

// ?!?
// offset is calculated using this formula :
// d1 + d2*(D1) + d3*(D2*D1) + d4*(D3*D2*D1) ...
// where d1, d2, d3, ... are the dimension variables and D1, D2, D3, ... are the Dimension sizes
// ?!? this formula needs a correctness proof but it has been working ?!?

/*
 * This is pretty compilicated so comments are necessary ...
 * What must be dealt with in ArrayBegin :
 * CompileMode or not; Variables in array dimensions or not => 4 combinations
 *      - each dimension produces an offset which is added to any previous AccumulatedOffset (in R8) which is finally added to the object reference pointer
 * so ...
 *  varaibleFlag = _CheckArrayDimensionForVariables_And_UpdateCompilerState ( )
 * so ... 
 *      generally if a dimension has variables it must be compiled
 *          if no variables then calculate the dimension's offset and increment AccumulatedOffset
 *  if ( variableFlag )
 *  {
 *      Compile the 
 *      ( if ( ! variableFlag ) SetHere at exit to startHere and use AccumulatedOffset mechanism ( AccumulatedOffsetFlag ? ) )
 *  }
 *  else
 *  {
 *      // just interpret it with :
 *      // assume accumulated offset is TOS and keep it there
 *      _DataStack_SetTop ( _DataStack_GetTop ( ) + increment ) ; 
 *  }
 *  set compileMode to necessary state ( saveCompileMode || variableFlag )
 *  rem if we are incoming CompileMode and no variables then we want to interpret - set compileMode false
 *      - so no matter what if ( ! variableFlag ) set compile mode off
 *  Interpret ( token ) 
 *  if ( ! variableFlag ) reset compileMode to incoming state
 *  if ( CompileMode && ( ! variableFlag ) )
 *  {
 *      SetHere ( start ) ;
 *      SetCurrentAccumulatedOffset ( totalIncrement ) ;
 *  }
 */

void
Compile_ArrayDimensionOffset ( Word * word, int64 dimSize, int64 objSize )
{
    if ( word->W_Value ) // if ! zero else 
    {
        // assume arrayIndex has just been pushed to TOS
        if ( word->StackPushRegisterCode )
        {
            SetHere ( word->StackPushRegisterCode ) ;
            //_Compile_IMULI ( int64 mod, int64 reg, int64 rm, int64 sib, int64 disp, int64 imm, int64 size )
            Compile_IMULI ( REG, ACC, ACC, 0, 0, dimSize * objSize ) ;
            //Compile_ADD( toRegOrMem, mod, reg, rm, sib, disp, isize ) 
            Compile_ADD ( MEM, MEM, ACC, DSP, 0, 0, CELL ) ;
        }
        else
        {
            //_Compile_IMULI ( int64 mod, int64 reg, int64 rm, int64 sib, int64 disp, int64 imm, int64 size )
            Compile_IMULI ( MEM, ACC, DSP, 0, 0, dimSize * objSize ) ;
            _Compile_Stack_DropN ( DSP, 1 ) ; // drop the array index
            //Compile_ADD( toRegOrMem, mod, reg, rm, sib, disp, isize ) 
            Compile_ADD ( MEM, MEM, ACC, DSP, 0, 0, CELL ) ;
        }
    }
    else SetHere ( word->Coding ) ; // is 0 don't compile anything for that word
}

// v.0.775.840

int64
Do_NextArrayWordToken ( Word * word, byte * token, Word * arrayBaseObject, int64 objSize, int64 saveCompileMode, int64 *variableFlag )
{
    Context * cntx = _Context_ ;
    Interpreter * interp = cntx->Interpreter0 ;
    Word * baseObject = interp->BaseObject ;
    Compiler *compiler = cntx->Compiler0 ;
    int64 arrayIndex, increment, value ;
    if ( token [0] == '[' ) // '[' == an "array begin"
    {
        *variableFlag = _CheckArrayDimensionForVariables_And_UpdateCompilerState ( ) ;
        return 0 ;
    }
    else if ( token [0] == ']' ) // ']' == an "array end"
    {
        int64 dimNumber = compiler->ArrayEnds, dimSize = 1 ;
        while ( -- dimNumber >= 0 ) // -- : zero based ns->ArrayDimensions
        {
            dimSize *= arrayBaseObject->ArrayDimensions [ dimNumber ] ; // the parser created and populated this array in _CfrTil_Parse_ClassStructure 
        }
        compiler->ArrayEnds ++ ;
        
        if ( *variableFlag ) Compile_ArrayDimensionOffset ( cntx->CurrentlyRunningWord, dimSize, objSize ) ;
        else
        {
            // 'little endian' arrays (to maybe coin a term) : first index refers to lowest addresses
            // d1 + d2*(D1) + d3*(D2*D1) + d4*(D3*D2*D1) ...
            arrayIndex = DataStack_Pop ( ) ;
            increment = arrayIndex * dimSize * objSize ; // keep a running total of 
            Compiler_IncrementCurrentAccumulatedOffset ( compiler, increment ) ;
            if ( ! CompileMode ) _DataStack_SetTop ( _DataStack_GetTop ( ) + increment ) ; // after each dimension : in the end we have one lvalue remaining on the stack
        }
        
        if ( ! _Context_StringEqual_PeekNextToken (cntx, ( byte* ) "[" , 0) ) return 1 ; // breaks the calling function
        if ( Is_DebugModeOn ) Word_PrintOffset ( word, increment, baseObject->AccumulatedOffset ) ;
        return 0 ;
    }
    if ( *variableFlag )
    {
        Set_CompileMode ( true ) ;
    }
    else Set_CompileMode ( false ) ; //SetState ( compiler, COMPILE_MODE, false ) ;
    if ( word )
    {
        _Interpreter_DoWord (interp, word, - 1 , -1) ;
    }
    else Interpreter_InterpretAToken ( interp, token, - 1 ) ;
    Set_CompileMode ( saveCompileMode ) ;
    SetState ( compiler, COMPILE_MODE, saveCompileMode ) ;
    return 0 ;
}

void
CfrTil_ArrayBegin ( void )
{
    Context * cntx = _Context_ ;
    Interpreter * interp = cntx->Interpreter0 ;
    Word * baseObject = interp->BaseObject ;
    if ( baseObject )
    {
        Word * arrayBaseObject = 0 ;
        Word * word = 0 ; // word is used in DEBUG_*
        Compiler *compiler = cntx->Compiler0 ;
        Lexer * lexer = cntx->Lexer0 ;
        byte * token = lexer->OriginalToken ;
        int64 objSize = 0, increment = 0, variableFlag ;
        int64 saveCompileMode = GetState ( compiler, COMPILE_MODE ) ; //, svOpState = GetState ( _CfrTil_, OPTIMIZE_ON ) ;
        baseObject->CAttribute2 |= ARRAY_TYPE ;
        CfrTil_OptimizeOn ( ) ; // internal to arrays optimize must be on

        arrayBaseObject = interp->LastWord ;
        if ( ! arrayBaseObject->ArrayDimensions ) CfrTil_Exception ( ARRAY_DIMENSION_ERROR, 0, QUIT ) ;
        if ( interp->CurrentObjectNamespace ) objSize = interp->CurrentObjectNamespace->Size ; //_CfrTil_VariableValueGet ( cntx->Interpreter0->CurrentClassField, ( byte* ) "size" ) ; 
        if ( ! objSize )
        {
            CfrTil_Exception ( OBJECT_SIZE_ERROR, 0, QUIT ) ;
        }
        variableFlag = _CheckArrayDimensionForVariables_And_UpdateCompilerState ( ) ;
        _WordList_Pop ( _CfrTil_->CompilerWordList, 0 ) ; // pop the initial '['
        do
        {
            token = Lexer_ReadToken ( lexer ) ;
            word = Finder_Word_FindUsing ( cntx->Finder0, token, 0 ) ;
            if ( word && ( ! GetState ( cntx->Compiler0, LC_ARG_PARSING ) ) ) word->W_RL_Index = cntx->Lexer0->TokenStart_ReadLineIndex ;
            DEBUG_SETUP ( word ) ;
            if ( Do_NextArrayWordToken ( word, token, interp->BaseObject = arrayBaseObject, objSize, saveCompileMode, &variableFlag ) ) break ;
            DEBUG_SHOW ;
        }
        while ( 1 ) ;
        if ( Is_DebugModeOn ) Word_PrintOffset ( word, increment, baseObject->AccumulatedOffset ) ;
        compiler->ArrayEnds = 0 ; // reset for next array word in the current word being compiled
        if ( CompileMode )
        {
            if ( ! variableFlag )
            {
                SetHere ( baseObject->Coding ) ;
                _Debugger_->StartHere = Here ; // for Debugger_DisassembleAccumulated
                _Debugger_->EntryWord = baseObject ; // for Debugger_DisassembleAccumulated
                _Compile_GetVarLitObj_LValue_To_Reg ( baseObject, ACC ) ;
                _Word_CompileAndRecord_PushReg ( baseObject, ACC ) ;
            }
            else
            {
                //svOpState = GetState ( _CfrTil_, OPTIMIZE_ON ) ;
                CfrTil_OptimizeOff ( ) ; //SetState ( baseObject, OPTIMIZE_OFF, true ) ;
            }
        }
        if ( ( ! Lexer_IsTokenForwardDotted ( cntx->Lexer0 ) ) && ( ! GetState ( cntx->Compiler0, LC_ARG_PARSING ) ) ) cntx->Interpreter0->BaseObject = 0 ;
        DEBUG_SHOW ;
        _dllist_RemoveNodes_UntilWord ( dllist_First ( ( dllist* ) _CfrTil_->CompilerWordList ), baseObject ) ;
        SetState ( compiler, COMPILE_MODE, saveCompileMode ) ;
        //SetState ( _CfrTil_, OPTIMIZE_ON, svOpState ) ;
        //CfrTil_OptimizeOn ( ) ;
    }
    //CfrTil_ArrayEnd () ;
}

void
CfrTil_ArrayEnd ( void )
{
    //SetState ( _Context_->Interpreter0->BaseObject, OPTIMIZE_OFF, false ) ; // possibly set in ArrayBegin
    CfrTil_OptimizeOn ( ) ;
}

