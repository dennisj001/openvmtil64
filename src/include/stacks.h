
/* ------------------------------------------------------
 *     a Locals Stack Frame on the DataStack - referenced by DSP
 * ------------------------------------------------------
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *     upper memory adresses
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *      "local variable" slot 3     fp [ etc ]
 *      "local variable" slot 2     fp [ 2 or 3 ]  2 or 3 depending on whether there is a return value
 *      "local variable" slot 1     fp [ 1 or 2 ]  1 or 2 depending on whether there is a return value
 * ---------------------------
 *      return value slot         # fp [ 1 ] #   optional
 *      saved fp                    fp [ 0 ]    <-- new fp - FP
 * ---------------------------
 *      "stack variables"           fp [ -1 ]   --- already on the "locals function" incoming stack
 *      "stack variables"           fp [ -2 ]   --- already on the "locals function" incoming stack
 *      "stack variables"           fp [ -etc ] --- already on the "locals function" incoming stack
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *     lower memory addresses  on DataStack - referenced by DSP
 *                                  fp = FP = Fp
 *                                  sp = DSP = Dsp
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

//#define ParameterVarOffset( word ) ( - ( _Context_->Compiler0->NumberOfArgs - word->Index + 1 ) )
//#define ParameterVarOffset( word ) ( - ( _Context_->Compiler0->NumberOfArgs - word->Index ) )
#define LocalVarOffset( word ) ( word->Index )
#define LocalParameterVarOffset( word ) ( (word->CAttribute & LOCAL_VARIABLE) ? (LocalVarOffset ( word )) : (ParameterVarOffset ( word )) )
#define LocalVarIndex_Disp( i ) ( ( i ) * CELL)
#define LocalVarIndex_WordDisp( word ) ( (word->CAttribute & LOCAL_VARIABLE) ? (LocalVarOffset ( word ) * CELL_SIZE) : (ParameterVarOffset ( word ) * CELL_SIZE) )
//#define IsFrameNecessary( compiler ) ( compiler->NumberOfLocals || compiler->NumberOfStackVariables )
//#define ReturnSlotOffset( bi ) ( FrameSize (bi) - 1 )


#define _Compile_DataStack_Push( obj ) _Compile_Stack_Push( DSP, obj )
#define _Compile_Move_LocalNRm_To_Reg( reg, n ) _Compile_Move_StackNRm_To_Reg ( reg, FP, n )
#define _Compile_Move_LocalN_To_Reg( reg, n ) _Compile_Move_StackN_To_Reg ( reg, FP, n )
#define _Compile_Move_Reg_To_LocalN( n, reg ) _Compile_Move_Reg_To_StackN ( FP, n, reg )
#define Compile_LocalStack_Drop( )   _Compile_Stack_Drop ( FP )
#define Compile_LocalStack_Push( obj ) _Compile_Stack_Push ( FP, obj )
#define Compile_Move_LocalStackTop_To_R8( ) _Compile_Move_LocalN_To_Reg ( ACC, 0 )



