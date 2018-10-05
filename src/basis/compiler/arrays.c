
#include "../../include/cfrtil64.h"

int64
_CheckArrayDimensionForVariables_And_UpdateCompilerState ( )
{
    if ( _Readline_CheckArrayDimensionForVariables ( _Context_->ReadLiner0 ) ) return true ;
    else return false ;
}

// offset is calculated using this formula :
// d1 + d2*(D1) + d3*(D2*D1) + d4*(D3*D2*D1) ...
// where d1, d2, d3, ... are the dimension variables and D1, D2, D3, ... are the Dimension sizes

/*
 * nb. CURRENTLY USING 'LITTLE ENDIAN ARRAYS'
 * d1 + d2*(D1) + d3*(D2*D1) + d4*(D3*D2*D1) ...
 * where d1, d2, d3, ... are the dimension variables and D1, D2, D3, ... are the Dimension sizes :: eg. :: declared as : array [D1][D2][D3]... ; in use as : array [d1][d2][d3]...

 *  * This is pretty compilicated so comments are necessary ...
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

 * nb. CURRENTLY USING 'LITTLE ENDIAN ARRAYS'
 * d1 + d2*(D1) + d3*(D2*D1) + d4*(D3*D2*D1) ...
 * where d1, d2, d3, ... are the dimension variables and D1, D2, D3, ... are the Dimension sizes :: eg. :: declared as : array [D1][D2][D3]... ; in use as : array [d1][d2][d3]...
 * versions > 0.854.312 : 20180920
 * could switch from little endian arrays to big endian arrays where first, left to right variable refers to
 * the largest Dimension, etc. So offset from array pointer is (for a four dimensional array) : d4*(D3*D2*D1) + d3*(D2*D1) d2*(D1) + d1 
 * where d1, d2, d3, ... are the dimension variables and D1, D2, D3, ... are the Dimension sizes
 * for an array a[3][3][3] with 27 total positions a[2][0][0] would refer to 2*3*3 = 18th position ; a[2][0][1] 19th; 
 * a[2][1][1] (2*3*3) + (1*3) + 1 = 22 ; a[2][2][1] (2*3*3) + (2*3) + 1 = 25 ; a[2][2][2] (2*3*3) + (2*3) + 2 = 26 + 0 indexed item = 27 ; 
 * remember 0 indexed arrays 
 * so total is 27.
 */

void
Compile_ArrayDimensionOffset ( Word * word, int64 dimSize, int64 objSize )
{
    //if ( word && word->W_Value ) // if ! zero else 
    if ( word && ( ( word->CAttribute & LITERAL ) ? word->W_Value : 1 ) ) // if ! zero else 
    {
        _Word_SCH_CPUSCA ( word, 1 ) ;
        int64 size = dimSize * objSize ;
        // assume arrayIndex has just been pushed to TOS
        // nb. if size is zero this complete processing of an array dimension adding its amount to the pointer-offset on the stack
        if ( word->StackPushRegisterCode )
        {
            SetHere ( word->StackPushRegisterCode, 1 ) ;
            //_Compile_IMULI ( int64 mod, int64 reg, int64 rm, int64 sib, int64 disp, int64 imm, int64 size )
            if ( size > 1 ) Compile_IMULI ( REG, ACC, ACC, 0, 0, size ) ;
            //Compile_ADD( toRegOrMem, mod, reg, rm, sib, disp, isize ) 
            Compile_ADD ( MEM, MEM, ACC, DSP, 0, 0, CELL ) ;
        }
        else
        {
            if ( size > 1 ) Compile_IMULI ( MEM, ACC, DSP, 0, 0, size ) ;
            _Compile_Stack_DropN ( DSP, 1 ) ; // drop the array index
            Compile_ADD ( MEM, MEM, ACC, DSP, 0, 0, CELL ) ;
        }
    }
    else SetHere ( word->Coding, 1 ) ;
}

int64
CalculateArrayDimensionSize ( Word * arrayBaseObject, int64 dimNumber )
{
#define BIG_ENDIAN_ARRAYS 1 
#define LITTLE_ENDIAN_ARRAYS (! BIG_ENDIAN_ARRAYS)
#if LITTLE_ENDIAN_ARRAYS   
    /*
     * nb. CURRENTLY USING 'LITTLE ENDIAN ARRAYS'
     * d1 + d2*(D1) + d3*(D2*D1) + d4*(D3*D2*D1) ...
     * where d1, d2, d3, ... are the dimension variables and D1, D2, D3, ... are the Dimension sizes :: eg. :: declared as : array [D1][D2][D3]... ; 
     * in use as : array [d1][d2][d3]...
     */
    int64 dimSize ;
    // nb. this method produces a 'little endian array' where the earlier dimensions are smaller and increasing with dimNumber
    //while ( ( -- dimNumber ) >= 0 ) // -- : zero based ns->ArrayDimensions
    for ( dimSize = 1 ; dimNumber > 0 ; dimNumber -- )
    {
        dimSize *= arrayBaseObject->ArrayDimensions [ dimNumber ] ; // the parser created and populated this array in _CfrTil_Parse_ClassStructure 
    }
#else
    /*
     * the switch from little endian arrays to big endian arrays where first, left to right variable refers to
     * the largest Dimension, etc. So offset from array pointer is (for a four dimensional array) : d4*(D3*D2*D1) + d3*(D2*D1) d2*(D1) + d1 
     * where d1, d2, d3, ... are the dimension variables and D1, D2, D3, ... are the Dimension sizes
     * for an array a[3][3][3] with 27 total positions a[2][0][0] would refer to 2*3*3 = 18th position ; a[2][0][1] 19th; 
     * a[2][1][1] (2*3*3) + (1*3) + 1 = 22 ; a[2][2][1] (2*3*3) + (2*3) + 1 = 25 ; a[2][2][2] (2*3*3) + (2*3) + 2 = 26 + 0 indexed item = 27 ; 
     * remember 0 indexed arrays 
     * so total is 27.
     */
    // D0, D1, D2, ... Dn : d0, d1, d2 ... dn => dn*(1*D(n-1)*D1*D2*..D(n-1)) 
    int64 dimSize ;
    for ( dimSize = 1 ; dimNumber < ( arrayBaseObject->ArrayNumberOfDimensions - 1 ) ; dimNumber ++ )
    {
        dimSize *= arrayBaseObject->ArrayDimensions [ dimNumber ] ; // the parser created and populated this array in _CfrTil_Parse_ClassStructure 
    }
#endif    
    return dimSize ;
}
// v.0.775.840

int64
Do_NextArrayToken ( byte * token, Word * arrayBaseObject, int64 objSize, Boolean saveCompileMode, Boolean *variableFlag )
{
    Context * cntx = _Context_ ;
    Interpreter * interp = cntx->Interpreter0 ;
    Word * baseObject = interp->BaseObject ;
    Compiler *compiler = cntx->Compiler0 ;
    int64 arrayIndex, increment ;
    Word * word = Finder_Word_FindUsing ( cntx->Finder0, token, 0 ) ;
#if 1    
    if ( word )
    {
        //if ( ! GetState ( cntx->Compiler0, LC_ARG_PARSING ) ) 
        word->W_RL_Index = _Lexer_->TokenStart_ReadLineIndex ;
        word->W_SC_Index = _Lexer_->SC_Index ;
        _Word_SCH_CPUSCA ( word, 1 ) ;
    }
#endif    
    SetState ( compiler, ARRAY_MODE, true ) ;
    if ( token [0] == '[' ) // '[' == an "array begin"
    {
        //once we have a variable any place in an array reference the flag must remain until the end of the array 
        if ( ! ( *variableFlag ) ) *variableFlag = _CheckArrayDimensionForVariables_And_UpdateCompilerState ( ) ;
        return 0 ;
    }
    else if ( token [0] == ']' ) // ']' == an "array end"
    {
        int64 dimNumber = compiler->ArrayEnds ; // dimNumber is used as an array index so it is also zero base indexed
        int64 dimSize = CalculateArrayDimensionSize ( arrayBaseObject, dimNumber ) ; // dimNumber is used as an array index so it is also zero base indexed
        compiler->ArrayEnds ++ ; // after, because arrayBaseObject->ArrayDimensions is a zero based array

        //if ( Is_DebugModeOn ) _Printf ( "\ndimSize = %d", dimSize ) ;
        DEBUG_SETUP ( word ) ;
        if ( *variableFlag ) Compile_ArrayDimensionOffset ( cntx->CurrentlyRunningWord, dimSize, objSize ) ;
        else
        {
            // 'little endian' arrays (to maybe coin a term) : first index refers to lowest addresses
            // d1 + d2*(D1) + d3*(D2*D1) + d4*(D3*D2*D1) ... : D1, D2 ... dimension sizes
            arrayIndex = DataStack_Pop ( ) ;
            if ( arrayIndex >= arrayBaseObject->ArrayDimensions [ dimNumber ] ) Error ( "Array index out of bounds.", "", ABORT ) ;
            increment = arrayIndex * dimSize * objSize ; // keep a running total of 
            if ( CompileMode ) Compiler_IncrementCurrentAccumulatedOffset ( compiler, increment ) ;
            //if ( ! CompileMode ) 
            else _DataStack_SetTop ( _DataStack_GetTop ( ) + increment ) ; // after each dimension : in the end we have one lvalue remaining on the stack
            if ( Is_DebugModeOn ) Word_PrintOffset ( word, increment, baseObject->AccumulatedOffset ) ;
        }
        DEBUG_SHOW ;
        if ( ! _Context_StringEqual_PeekNextToken ( cntx, ( byte* ) "[", 0 ) ) return 1 ; // breaks the calling function
        return 0 ;
    }
    if ( *variableFlag ) Set_CompileMode ( true ) ;
    else Set_CompileMode ( false ) ;
    if ( word ) _Interpreter_DoWord ( interp, word, -1, -1 ) ; //word->W_RL_Index, word->W_SC_Index ) ;
    else Interpreter_InterpretAToken ( interp, token, - 1 ) ;
    Set_CompileMode ( saveCompileMode ) ;
    SetState ( compiler, COMPILE_MODE, saveCompileMode ) ;
    return 0 ;
}

void
Arrays_DoArrayArgs_NonLisp ( Lexer * lexer, byte * token, Word * arrayBaseObject, int64 objSize, Boolean saveCompileMode, Boolean *variableFlag )
{
    int64 result ;
    do
    {
        token = Lexer_ReadToken ( lexer ) ;
        result = Do_NextArrayToken ( token, arrayBaseObject, objSize, saveCompileMode, variableFlag ) ;
    }
    while ( ! result ) ;
}

int64
_CfrTil_ArrayBegin ( Boolean lispMode, Word **pl1, int64 i )
{
    Context * cntx = _Context_ ;
    Compiler *compiler = cntx->Compiler0 ;
    Interpreter * interp = cntx->Interpreter0 ;
    Lexer * lexer = cntx->Lexer0 ;
    Word * baseObject = interp->BaseObject, *l1, * arrayBaseObject ;
    Boolean saveCompileMode = GetState ( compiler, COMPILE_MODE ), svOpState = GetState ( _CfrTil_, OPTIMIZE_ON ) ;
    int64 objSize = 0 ;
    Boolean variableFlag = 0 ;
    byte * token ;
    if ( lispMode )
    {
        l1 = * pl1 ;
        arrayBaseObject = ( ( Word * ) ( LO_Previous ( l1 ) ) )->Lo_CfrTilWord ;
        token = l1->Name ;
    }
    else
    {
        arrayBaseObject = interp->LastWord ;
        token = lexer->OriginalToken ;
    }
    if ( arrayBaseObject )
    {
        CfrTil_OptimizeOn ( ) ; // internal to arrays optimize must be on

        if ( ! arrayBaseObject->ArrayDimensions ) CfrTil_Exception ( ARRAY_DIMENSION_ERROR, 0, QUIT ) ;
        if ( interp->CurrentObjectNamespace ) objSize = interp->CurrentObjectNamespace->ObjectSize ; //_CfrTil_VariableValueGet ( cntx->Interpreter0->CurrentClassField, ( byte* ) "size" ) ; 
        if ( ! objSize ) CfrTil_Exception ( OBJECT_SIZE_ERROR, 0, QUIT ) ;
        variableFlag = _CheckArrayDimensionForVariables_And_UpdateCompilerState ( ) ;
        //_WordList_Pop ( _CfrTil_->CompilerWordList ) ; // pop the initial '['
        //DEBUG_SETUP ( baseObject ) ;
        if ( lispMode ) Arrays_DoArrayArgs_Lisp ( pl1, l1, arrayBaseObject, objSize, saveCompileMode, &variableFlag ) ;
        else Arrays_DoArrayArgs_NonLisp ( lexer, token, arrayBaseObject, objSize, saveCompileMode, &variableFlag ) ;
        _CfrTil_WordList_PushWord ( _CfrTil_->RightBracket, 1 ) ; // for the optimizer
        if ( CompileMode ) // update the baseObject offset 
        {
            if ( ! variableFlag )
            {
                CfrTil_OptimizeOn ( ) ;
                SetHere ( baseObject->Coding, 1 ) ;
                _Debugger_->StartHere = Here ; // for Debugger_DisassembleAccumulated
                _Debugger_->EntryWord = baseObject ; // for Debugger_DisassembleAccumulated
                _Compile_GetVarLitObj_LValue_To_Reg ( baseObject, ACC ) ;
                if ( lispMode )
                {
                    Compile_Move_Reg_To_Reg ( RegOrder ( i ++ ), ACC ) ;
                    _Debugger_->PreHere = baseObject->Coding ;
                }
                else _Word_CompileAndRecord_PushReg ( baseObject, ACC ) ;
            }
            else CfrTil_OptimizeOff ( ) ; // can't really be optimized any more anyway and optimize is turned back on after an =/store anyway
            _DEBUG_SHOW ( baseObject, 1 ) ;
            compiler->ArrayEnds = 0 ; // reset for next array word in the current word being compiled
        }
        if ( lispMode ) interp->BaseObject = 0 ;
        else
        {
            if ( ( ! Lexer_IsTokenForwardDotted ( cntx->Lexer0 ) ) && ( ! GetState ( cntx->Compiler0, LC_ARG_PARSING ) ) ) interp->BaseObject = 0 ;
            if ( ! ( GetState ( cntx, C_SYNTAX | INFIX_MODE ) || GetState ( compiler, LC_ARG_PARSING ) ) )
                _dllist_RemoveNodes_UntilWord ( dllist_First ( ( dllist* ) _CfrTil_->CompilerWordList ), baseObject ) ;
            SetState ( compiler, COMPILE_MODE, saveCompileMode ) ;
            //SetState ( compiler, ARRAY_MODE, false ) ;
        }
    }
    if ( ! variableFlag ) SetState ( _CfrTil_, OPTIMIZE_ON, svOpState ) ;
    return i ;
}

void
CfrTil_ArrayBegin ( )
{
    _CfrTil_ArrayBegin ( 0, 0, 0 ) ;
}

void
CfrTil_ArrayEnd ( void )
{
    //noop
}

void
CfrTil_ArrayModeOff ( void )
{
    if ( GetState ( _Compiler_, ARRAY_MODE ) )
    {
        SetState ( _Compiler_, ARRAY_MODE, false ) ;
        CfrTil_OptimizeOn ( ) ;
    }
}

