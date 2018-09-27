// see readme.txt for a text description
// TODO : types, database, garbage collection : integration
typedef char Boolean ;
typedef unsigned char byte ;
typedef byte uint8 ;
typedef short int16 ;
typedef unsigned short uint16 ;
typedef int int32 ;
typedef unsigned int uint32 ;
typedef long int64 ;
typedef unsigned long uint64 ;

typedef char * CString ;
typedef byte CharSet ;
typedef Boolean boolean ;
typedef void (* VoidFunction ) (void) ;
typedef void (*vFunction_1_Arg ) ( int64 ) ;
typedef void (*vFunction_1_UArg ) ( uint64 ) ;
typedef void (*vFunction_2_Arg ) ( int64, int64 ) ;
typedef int64( *cFunction_0_Arg ) ( ) ;
typedef int64( *cFunction_1_Arg ) ( int64 ) ;
typedef int64( *cFunction_2_Arg ) ( int64, int64 ) ;
typedef VoidFunction block ; // code block
typedef byte AsciiCharSet [ 256 ] ;

typedef byte * function, * object, * type, * slot ;
typedef struct
{
    struct
    {
        uint64 T_CAttribute ;
        uint64 T_CAttribute2 ;
        uint64 T_LAttribute ;
        uint64 T_WordAttribute ;
        uint64 T_WAllocationType ;
    } ;
    union
    {
        uint64 T_NumberOfSlots ;
        uint64 T_NumberOfBytes ;
        uint64 T_Size ;
        uint64 T_ChunkSize ; // remember MemChunk is prepended at memory allocation time
    } ;
} AttributeInfo, AttributeInfo, TypeInfo, TI ;
typedef struct
{
    union
    {
        AttributeInfo O_Attributes ;
        type O_type ; // for future dynamic types and dynamic objects 
    } ;
    union
    {
        slot * O_slots ; // number of slots should be in T_NumberOfSlots
        object * O_object ; // size should be in T_Size
    } ;
} Object, Tuple ;
#define Tp_NodeAfter O_slots [0] ;
#define Tp_NodeBefore O_slots [1] ;
#define Tp_SymbolName O_slots [2] ;

typedef object * ( *primop ) ( object * ) ;
typedef Object * ( *Primop ) ( Object * ) ;
typedef struct _dlnode
{
    struct
    {
        struct _dlnode * n_After ;
        struct _dlnode * n_Before ;
    } ;
} dlnode, node ;
typedef struct _dllist
{
    struct
    {
        dlnode * n_After ;
        dlnode * n_Before ;
    } ;
    node * n_CurrentNode ;
} dllist ;
#define after_ptr n_After
#define before_ptr n_Before
#define head after_ptr
#define tail before_ptr
enum types
{
    BOOL, BYTE, INTEGER, STRING, BIGNUM, FLOAT, POINTER, XCODE, WORD, WORD_LOCATION, ARROW, PRODUCT
} ;
typedef struct _dobject
{
    struct
    {
        dlnode * do_After ;
        dlnode * do_Before ;
    } ;
    struct
    {
        int32 do_Type ;
        int16 do_Size ;
        Boolean do_Slots ;
        Boolean do_InUseFlag ;
    } ;
    union
    {
        byte * do_bData ;
        int64 * do_iData ;
    } ;
} dobject ; // size 4 x 64 bits
typedef struct
{
    struct
    {
        dlnode * n_After ;
        dlnode * n_Before ;
    } ;
    union
    {
        node * n_CurrentNode ;
        struct
        {
            int32 n_Type ;
            int16 n_Size ;
            Boolean n_Slots ;
            Boolean n_InUseFlag ;
        } ;
        byte * n_unmap ;
    } ;
} _DLNode, _Node, _listNode, _List ; // size : 3 x 64 bits
typedef struct
{
    union
    {
        struct
        {
            struct
            {
                dlnode * n_After ;
                dlnode * n_Before ;
            } ;
            union
            {
                struct
                {
                    int32 n_Type ;
                    int16 n_Size ;
                    Boolean n_Slots ;
                    Boolean n_InUseFlag ;
                } ;
                node * n_CurrentNode ;
                byte * n_unmap ;
            } ;
        } ; //_DLNode, _Node, _listNode, _List ;
        struct
        {
            struct
            {
                dlnode * do_After ;
                dlnode * do_Before ;
            } ;
            union
            {
                struct
                {
                    int32 do_Type ;
                    int16 do_Size ;
                    Boolean do_Slots ;
                    Boolean do_InUseFlag ;
                } ;
                byte * do_bData ;
                int64 * do_iData ;
            } ;
        } ;
        _DLNode n_DLNode ;
        dobject n_dobject ;
    } ;
    union
    {
        AttributeInfo n_Attributes ;
        type n_type ; // for future dynamic types and dynamic objects 
    } ;
} DLNode, Node, listNode, list ;

#define afterNode n_After 
#define beforeNode n_Before 
#define n_Car afterNode 
#define n_Cdr beforeNode
typedef void ( *MapFunction0 ) ( dlnode * ) ;
typedef int64( *MapFunction1 ) ( dlnode *, int64 ) ;
typedef int64( *MapFunction2 ) ( dlnode *, int64, int64 ) ;
//typedef void ( *MapFunction2 ) ( dlnode *, int64, int64 ) ;
typedef void ( *MapFunction2_64 ) ( dlnode *, uint64, int64 ) ;
typedef int64( *MapFunction3 ) ( dlnode *, int64, int64, int64 ) ;
typedef void ( *MapFunction4 ) ( dlnode *, int64, int64, int64, int64 ) ;
typedef void ( *MapFunction5 ) ( dlnode *, int64, int64, int64, int64, int64 ) ;
typedef
Boolean( *BoolMapFunction_1 ) ( dlnode * ) ;
typedef struct _Identifier // _Symbol
{
    DLNode S_Node ;
    union
    {
        int64 Slots ; // number of slots in Object
        int64 ObjectSize ; // number of slots in Object
    } ;
    byte * S_Name ;
    uint64 State ;
    union
    {
        uint64 S_Value ;
        byte * S_BytePtr ;
        byte * S_Object ;
    } ;
    dllist * S_SymbolList ;
    uint64 S_DObjectValue ; // nb! DynamicObject value can not be a union with S_SymbolList
    uint64 * S_PtrToValue ; // because we copy words with Compiler_PushCheckAndCopyDuplicates and we want the original value
    union // leave this here so we can add a ListObject to a namespace
    {
        struct _Identifier * S_ContainingNamespace ;
        struct _Identifier * S_ClassFieldTypeNamespace ;
        struct _Identifier * S_ContainingList ;
        struct _Identifier * S_Prototype ;
    } ;
    union
    {
        uint64 S_Value2 ;
        dlnode * S_Node2 ;
        byte * S_pb_Data2 ;
    } ;
    union
    {
        uint64 S_Value3 ;
        dlnode * S_Node3 ;
        byte * S_pb_Data3 ;
    } ;

    block Definition ;
    dllist * DebugWordList ;
    struct _Identifier * CfrTilWord ;
    struct _WordData * S_WordData ;
} Identifier, ID, Word, Namespace, List, Vocabulary, Class, DynamicObject, DObject, ListObject, Symbol, MemChunk, HistoryStringNode, Buffer ;
#define S_Car S_Node.n_Car
#define S_Cdr S_Node.n_Cdr
#define S_After S_Cdr
#define S_Before S_Car
#define S_CurrentNode n_CurrentNode
//#define S_AAttribute S_Node.n_Attributes.T_AAttribute // Allocation type Attribute
#define S_CAttribute S_Node.n_Attributes.T_CAttribute
#define S_CAttribute2 S_Node.n_Attributes.T_CAttribute2
#define S_CAttribute0 S_Node.n_Attributes.T_CAttribute0
#define S_WAttribute S_Node.n_Attributes.T_WordAttribute
#define S_WAllocType S_Node.n_Attributes.T_WAllocationType
#define S_LAttribute S_Node.n_Attributes.T_LAttribute
#define S_Size S_Node.n_Attributes.T_Size
#define S_ChunkSize S_Node.n_Attributes.T_ChunkSize
#define S_NumberOfSlots S_Size
#define S_Pointer W_Value
#define S_String W_Value
#define S_unmap S_Node.n_unmap
#define S_CodeSize Size // used by Debugger, Finder
#define S_MacroLength Size // used by Debugger, Finder

#define Head S_Car
#define Tail S_Cdr
#define Size S_Size 
#define Name S_Name
#define CAttribute S_CAttribute
#define CAttribute2 S_CAttribute2
#define LAttribute S_LAttribute
#define WAttribute S_WAttribute
#define WAllocType S_WAllocType
#define CProp S_CAttribute
#define CProp2 S_CAttribute2
#define LProp S_LAttribute
#define WProp S_WAttribute
#define Data S_pb_Data2
#define InUseFlag S_Node.n_InUseFlag

#define Lo_CAttribute CAttribute
#define Lo_LAttribute LAttribute
#define Lo_CProp CAttribute
#define Lo_LProp LAttribute
#define Lo_Name Name
#define Lo_Car S_Car
#define Lo_Cdr S_Cdr
#define Lo_Size ObjectSize
#define Lo_Head Lo_Car
#define Lo_Tail Lo_Cdr
#define Lo_NumberOfSlots Slots
#define Lo_CfrTilWord CfrTilWord 
#define Lo_List S_SymbolList 
#define Lo_Value S_Value
#define Lo_PtrToValue S_PtrToValue 
#define Lo_Object Lo_Value
#define Lo_UInteger Lo_Value
#define Lo_Integer Lo_Value
#define Lo_String Lo_Value
#define Lo_LambdaFunctionParameters S_WordData->LambdaArgs
#define Lo_LambdaFunctionBody S_WordData->LambdaBody

#define W_List S_SymbolList 
#define W_Value S_Value
#define W_Object S_Object
#define W_Value2 S_Value2
#define W_Value3 S_Value3
#define W_BytePtr S_BytePtr
#define W_PtrToValue S_PtrToValue
#define W_DObjectValue S_DObjectValue

// Buffer
#define B_CAttribute S_CAttribute
#define B_Size S_Size
#define B_Data S_pb_Data2

typedef int64( *cMapFunction_1 ) ( Symbol * ) ;
typedef ListObject* ( *ListFunction0 )( ) ;
typedef ListObject* ( *ListFunction )( ListObject* ) ;
typedef ListObject * ( *LispFunction2 ) ( ListObject*, ListObject* ) ;
typedef ListObject * ( *LispFunction3 ) ( ListObject*, ListObject*, ListObject* ) ;
typedef int64( *MapFunction_Word_PtrInt ) ( ListObject *, Word *, int64 * ) ;
typedef int64( *MapFunction ) ( Symbol * ) ;
typedef int64( *MapFunction_1 ) ( Symbol *, int64 ) ;
typedef int64( *MapFunction_Word ) ( Symbol *, Word * ) ;
typedef
int64( *MapFunction_2 ) ( Symbol *, int64, int64 ) ;
typedef void ( *MapSymbolFunction ) ( Symbol * ) ;
typedef void ( *MapSymbolFunction2 ) ( Symbol *, int64, int64 ) ;
typedef Word* ( *MapNodeFunction ) ( dlnode * node ) ;
typedef struct location
{
    byte * Filename ;
    int32 LineNumber ;
    int32 CursorPosition ;
    Word * LocationWord ;
    byte * LocationAddress ;
} Location ;
typedef struct _WordData
{
    uint64 RunType ;
    Namespace * TypeNamespace ;
    byte * CodeStart ; // set at Word allocation 
    byte * Coding ; // nb : !! this field is set by the Interpreter and modified by the Compiler in some cases so we also need (!) CodeStart both are needed !!  
    byte * Filename ; // ?? should be made a part of a accumulated string table ??
    int64 LineNumber ;
    int64 CursorPosition ;
    int64 StartCharRlIndex ;
    int64 SC_WordIndex ;
    int64 NumberOfArgs ;
    int64 NumberOfLocals ;
    uint64 * InitialRuntimeDsp ;

    byte * ObjectCode ; // used by objects/class words
    byte * StackPushRegisterCode ; // used by the optInfo
    Word * AliasOf, *OriginalWord ;
    int64 Offset ; // used by ClassField
    struct
    {
        Boolean RegToUse ;
        Boolean Opt_Rm ;
        Boolean Opt_Reg ; //?? do we need something here
        Boolean SrcReg ;
        Boolean DstReg ;
        Boolean RegFlags ; // future uses available here !!
        uint8 OpInsnGroup ;
        uint8 OpInsnCode ;
    } ;
    union
    {
        dllist * LocalNamespaces ;
        Location * OurLocation ;
    } ;
    union
    {
        int64 * WD_ArrayDimensions ;
        byte *WD_SourceCode ; // arrays don't have source code
    } ;
    int64 WD_ArrayNumberOfDimensions ;
    union
    {
        ListObject * LambdaBody ;
        int64 AccumulatedOffset ; // used by Do_Object 
    } ;
    union
    {
        ListObject * LambdaArgs ;
        int64 Index ; // used by Variable and LocalWord
        byte * LogicTestCode ;
    } ;
    dllist * SourceCodeWordList ;
    byte * SourceCoding ; //
    int64 SourceCodeMemSpaceRandMarker ;
} WordData ; // try to put all compiler related data here so in the future we can maybe delete WordData at runtime

// to keep using existing code without rewriting ...
#define CodeStart S_WordData->CodeStart // set at Word allocation 
#define Coding S_WordData->Coding // nb : !! this field is set by the Interpreter and modified by the Compiler in some cases so we also need (!) CodeStart both are needed !!  
#define SourceCoding S_WordData->SourceCoding // nb : !! this field is set by the Interpreter and modified by the Compiler in some cases so we also need (!) CodeStart both are needed !!  
#define Offset S_WordData->Offset // used by ClassField
#define W_NumberOfArgs S_WordData->NumberOfArgs 
#define W_NumberOfLocals S_WordData->NumberOfLocals 
#define W_InitialRuntimeDsp S_WordData->InitialRuntimeDsp 
#define TtnReference S_WordData->TtnReference // used by Logic Words
#define RunType S_WordData->RunType // number of slots in Object
#define PtrObject S_WordData->WD_PtrObject 
#define AccumulatedOffset S_WordData->AccumulatedOffset // used by Do_Object
#define Index S_WordData->Index // used by Variable and LocalWord
#define NestedObjects S_WordData->NestedObjects // used by Variable and LocalWord
#define ObjectCode S_WordData->Coding // used by objects/class words
#define W_OurLocation S_WordData->OurLocation
#define StackPushRegisterCode S_WordData->StackPushRegisterCode // used by Optimize
#define W_SourceCode S_WordData->WD_SourceCode 
#define W_TokenEnd_ReadLineIndex S_WordData->CursorPosition 
#define W_CursorPosition S_WordData->CursorPosition 
#define W_RL_Index S_WordData->StartCharRlIndex
#define S_FunctionTypesArray S_WordData->FunctionTypesArray
#define RegToUse S_WordData->RegToUse
#define Opt_Rm S_WordData->Opt_Rm
#define Opt_Reg S_WordData->Opt_Reg
#define RmReg S_WordData->RmReg
#define RegFlags S_WordData->RegFlags
#define ArrayDimensions S_WordData->WD_ArrayDimensions
#define ArrayNumberOfDimensions S_WordData->WD_ArrayNumberOfDimensions
#define W_AliasOf S_WordData->AliasOf
#define TypeNamespace S_WordData->TypeNamespace 
#define Lo_ListProc S_WordData->ListProc
#define Lo_ListFirst S_WordData->ListFirst
#define ContainingNamespace S_ContainingNamespace
#define ClassFieldTypeNamespace S_ClassFieldTypeNamespace
#define ContainingList S_ContainingList
#define Prototype S_Prototype
#define W_SearchNumber W_Value2
#define W_FoundMarker W_Value3
#define W_OriginalWord S_WordData->OriginalWord
#define W_SC_Index S_WordData->SC_WordIndex 
#define W_SC_WordList S_WordData->SourceCodeWordList 
#define W_SC_MemSpaceRandMarker S_WordData->SourceCodeMemSpaceRandMarker
#define W_OpInsnCode S_WordData->OpInsnCode 
#define W_OpInsnGroup S_WordData->OpInsnGroup
typedef struct
{
    Symbol P_Symbol ;
    slot P_Attributes ;
} Attribute ;

struct NamedByteArray ;
typedef struct
{
    MemChunk BA_MemChunk ;
    Symbol BA_Symbol ;
    struct NamedByteArray * OurNBA ;
    int64 BA_DataSize, MemRemaining ;
    byte * StartIndex ;
    byte * EndIndex ;
    byte * bp_Last ;
    byte * BA_Data ;
} ByteArray ;
#define BA_AllocSize BA_MemChunk.S_Size
#define BA_CAttribute BA_MemChunk.S_CAttribute
#define BA_AAttribute BA_MemChunk.S_WAllocType
typedef struct NamedByteArray
{
    MemChunk NBA_MemChunk ;
    Symbol NBA_Symbol ;
    ByteArray *ba_CurrentByteArray ;
    int64 NBA_DataSize, TotalAllocSize ;
    int64 MemInitial ;
    int64 MemAllocated ;
    int64 MemRemaining ;
    int64 NumberOfByteArrays, CheckTimes, InitFreedRandMarker ;
    dllist NBA_BaList ;
    dlnode NBA_ML_HeadNode ;
    dlnode NBA_ML_TailNode ;
} NamedByteArray, NBA ;
#define NBA_AAttribute NBA_Symbol.S_WAllocType
#define NBA_Chunk_Size NBA_Symbol.S_ChunkSize
#define NBA_Name NBA_Symbol.S_Name
typedef struct
{
    Symbol CN_Symbol ;
    block CaseBlock ;
} CaseNode ;
#define CN_CaseValue CN_Symbol.S_pb_Data2
typedef struct
{
    Symbol GI_Symbol ;
    byte * pb_LabelName ;
    byte * CompileAtAddress ;
    byte * LabeledAddress ;
    byte * pb_JmpOffsetPointer ;
} GotoInfo ;
#define GI_CAttribute GI_Symbol.S_CAttribute
typedef struct
{
    Symbol BI_Symbol ;
    uint64 State ;
    byte *LocalFrameStart, *AfterLocalFrame ;
    byte * AfterRspSave ;
    byte *bp_First ;
    byte *bp_Last ;
    byte *JumpOffset ;
    byte *JccLogicCode, *LogicTestCode ;
    byte *CombinatorStartsAt, *CombinatorEndsAt ;
    byte *OriginalActualCodeStart ;
    byte * CopiedFrom, *CopiedToStart, *CopiedToEnd, *CopiedToLogicJccCode, *ActualCopiedToJccCode ;
    int64 CopiedSize ;
    Boolean SetccTtt, JccTtt ;
    Boolean SetccNegFlag, JccNegFlag ;
    Word * LogicCodeWord ;
    Namespace * LocalsNamespace ;
} BlockInfo ;
typedef struct
{
    uint64 State ;
    int64 OutputLineCharacterNumber ;
} PrintStateInfo ;
typedef struct
{
    int64 State ;
    union
    {
        struct
        {
            uint64 * Rax ;
            uint64 * Rcx ;
            uint64 * Rdx ;
            uint64 * Rbx ;
            uint64 * Rsp ;
            uint64 * Rbp ;
            uint64 * Rsi ;
            uint64 * Rdi ;
            uint64 * R8d ;
            uint64 * R9d ;
            uint64 * R10d ;
            uint64 * R11d ;
            uint64 * R12d ;
            uint64 * R13d ;
            uint64 * R14d ;
            uint64 * R15d ;
            uint64 * RFlags ;
            uint64 * Rip ;
        } ;
        uint64 * Registers [ 18 ] ;
    } ;
} Cpu ;
typedef struct
{
    int64 StackSize ;
    uint64 *StackPointer ;
    uint64 *StackMin ;
    uint64 *StackMax ;
    uint64 *InitialTosPointer ;
    uint64 StackData [] ;
} Stack ;
typedef struct TCI
{
    uint64 State ;
    int64 TokenFirstChar, TokenLastChar, EndDottedPos, DotSeparator, TokenLength, FoundCount, MaxFoundCount ;
    int64 FoundWrapCount, WordCount, WordWrapCount, LastWordWrapCount, FoundMarker, StartFlag, ShownWrap ;
    byte *SearchToken, * PreviousIdentifier, *Identifier ;
    Word * TrialWord, * OriginalWord, *RunWord, *OriginalRunWord, *NextWord, *ObjectExtWord ;
    Namespace * OriginalContainingNamespace, * MarkNamespace ;
} TabCompletionInfo, TCI ;

struct ReadLiner ;
typedef
byte( *ReadLiner_KeyFunction ) (struct ReadLiner *) ;
typedef struct ReadLiner
{
    uint64 State ;
    ReadLiner_KeyFunction Key ; //byte(*Key)( struct ReadLiner * );
    FILE *InputFile ;
    FILE *OutputFile ;
    byte *Filename ;

    int64 InputKeyedCharacter ;
    byte LastCheckedInputKeyedCharacter ;
    int64 FileCharacterNumber ;
    int64 LineNumber ;
    int64 OutputLineCharacterNumber ; // set by _CfrTil_Key
    int64 ReadIndex ;
    int64 EndPosition ; // index where the next input character is put
    int64 MaxEndPosition ; // index where the next input character is put
    int64 CursorPosition ; //
    int64 EscapeModeFlag ;
    byte * DebugPrompt ;
    byte * DebugAltPrompt ;
    byte * NormalPrompt ;
    byte * AltPrompt ;
    byte * Prompt ;
    HistoryStringNode * HistoryNode ;
    TabCompletionInfo * TabCompletionInfo0 ;
    byte InputLine [ BUFFER_SIZE ] ;
    byte * InputLineString ;
    byte * InputStringOriginal ;
    byte * InputStringCurrent ;
    int64 InputStringIndex, InputStringLength ;
    int64 LineStartFileIndex ;
    Stack * TciNamespaceStack ;
} ReadLiner ;
typedef void ( * ReadLineFunction ) ( ReadLiner * ) ;
typedef struct
{
    uint64 State ;
    Word *FoundWord ;
    Namespace * QualifyingNamespace ;
} Finder ;

struct Interpreter ;
typedef struct Lexer
{
    uint64 State ;
    byte *OriginalToken ;
    union
    {
        int64 Literal ;
        byte * LiteralString ;
    } ;
    uint64 TokenType ;
    Word * TokenWord ;
    byte TokenInputByte ;
    byte CurrentTokenDelimiter ;
    int64 TokenStart_ReadLineIndex, TokenEnd_ReadLineIndex, Token_Length, SC_Index ; //Tsrli = TokenStart_ReadLineIndex
    byte * TokenDelimiters ;
    byte * DelimiterCharSet ;
    byte * BasicTokenDelimiters ;
    byte * BasicDelimiterCharSet ;
    byte * TokenDelimitersAndDot ;
    byte * DelimiterOrDotCharSet, *Filename ;
    int64 CurrentReadIndex, TokenWriteIndex, LineNumber ;
    Symbol * NextPeekListItem ;
    struct Interpreter * OurInterpreter ;
    ReadLiner * ReadLiner0 ;
    byte( *NextChar ) ( ReadLiner * rl ) ;
    byte * TokenBuffer ;
} Lexer ;

#if NEW_CPU_PIPELINE_STATE    
typedef struct
{
    union
    {
        uint64 uint64_CPState ;
        struct
        {
            uint8 State ;
            uint8 FirstArgReg ;
            uint8 SecondArgReg ;
        } ;
    } ;

} CpuPipelineState ;
#endif
typedef struct
{
    DLNode dln_Node ;
    union
    {
        uint64 State ;
        struct
        {
            uint8 State_ACC ;
            uint8 State_OREG ;
            uint8 State_OREG2 ;
        } ;
    } ;
    int64 OptimizeFlag ;
    int64 Optimize_Dest_RegOrMem ;
    int64 Optimize_Mod ;
    int64 Optimize_Reg ;
    int64 Optimize_Rm ;
    int64 Optimize_Disp ;
    int64 Optimize_Imm ;
    int64 Optimize_ImmSize ;
    int64 Optimize_SrcReg ;
    int64 Optimize_DstReg ;
    int64 UseReg ;
    union
    {
        struct
        {
            Word *O_zero, * O_one, *O_two, *O_three, *O_four, *O_five, *O_six, *O_seven ;
        } ;
        Word * COIW [8] ; // CompileOptimizeInfo Word array
    } ;
#if NEW_CPU_PIPELINE_STATE    
    CpuPipelineState CPState ;
#endif   
    // ArgXLocation    
#define ASSUMED_LOC_LITERAL     ( (uint64) 1 << 0 )
#define ASSUMED_STACK_0         ( (uint64) 1 << 1 )
#define ASSUMED_STACK_1         ( (uint64) 1 << 2 )
#define ASSUMED_STACK_2         ( (uint64) 1 << 3 )
#define ASSUMED_STACK_3         ( (uint64) 1 << 4 )
#define ASSUMED_LOC_ACC         ( (uint64) 1 << 5 )
#define ASSUMED_LOC_OREG        ( (uint64) 1 << 6 )
#define ASSUMED_LOC_OREG2       ( (uint64) 1 << 7 )
#define IDEAL_LOC_LITERAL       ( (uint64) 1 << 8 )
#define IDEAL_STACK_0           ( (uint64) 1 << 9 )
#define IDEAL_STACK_1           ( (uint64) 1 << 10 )
#define IDEAL_STACK_2           ( (uint64) 1 << 11 )
#define IDEAL_STACK_3           ( (uint64) 1 << 12 )
#define IDEAL_LOC_ACC           ( (uint64) 1 << 13 )
#define IDEAL_LOC_OREG          ( (uint64) 1 << 14 )
#define IDEAL_LOC_OREG2         ( (uint64) 1 << 15 )
#define LOC_STACK_0             ( 1 << 4 )
#define LOC_STACK_1             ( 1 << 5 )
#define LOC_ACC                 ( 1 << 6 )
#define LOC_OREG                ( 1 << 7 )
#define REG_ON_BIT              ( 0x10 ) // decimal 16, beyond the 15 regs
    int64 rtrn, NumberOfArgs ;
    uint16 ControlFlags ;
    Word *opWord, *wordn, *wordm, *wordArg1, *wordArg2, *xBetweenArg1AndArg2, *wordArg0_ForOpEqual ;
    dlnode * node, *nodem, *wordNode, *nextNode, *wordArg2Node, *wordArg1Node ;
    Boolean rvalue, wordArg1_rvalue, wordArg2_rvalue, wordArg1_literal, wordArg2_literal ;
    Boolean wordOp, wordArg1_Op, wordArg2_Op ;
    // CompileOptimizeInfo State values
#define ACC_1L                   ( (uint64) 1 << 1 )              
#define ACC_1R                   ( (uint64) 1 << 2 )              
#define ACC_2L                   ( (uint64) 1 << 3 )              
#define ACC_2R                   ( (uint64) 1 << 4 )              
#define OREG_1L                  ( (uint64) 1 << 5 )              
#define OREG_1R                  ( (uint64) 1 << 6 )              
#define OREG_2L                  ( (uint64) 1 << 7 )              
#define OREG_2R                  ( (uint64) 1 << 8 )              
#define OREG2_1L                 ( (uint64) 1 << 9 )              
#define OREG2_1R                 ( (uint64) 1 << 10 )              
#define OREG2_2L                 ( (uint64) 1 << 11 )              
#define OREG2_2R                 ( (uint64) 1 << 12 )  
#define OP_RESULT_ACC            ( (uint64) 1 << 13 )  
#define OP_RESULT_OREG           ( (uint64) 1 << 14 )  
#define OP_RESULT_OREG2          ( (uint64) 1 << 15 )
    // CompileOptimizeInfo StateRegValues ;  
#define ARG1_L                   ( 1 << 0 )
#define ARG1_R                   ( 1 << 1 )
#define ARG2_L                   ( 1 << 2 )
#define ARG2_R                   ( 1 << 3 )
#define OP_RESULT                ( 1 << 4 )
} CompileOptimizeInfo, COI ;
typedef struct
{
    uint64 State ;
    byte *IfZElseOffset ;
    byte *ContinuePoint ; // used by 'continue'
    byte * BreakPoint ;
    byte * StartPoint ;
    int64 NumberOfLocals ;
    int64 NumberOfArgs ;
    int64 NumberOfRegisterLocals ;
    int64 NumberOfRegisterArgs ;
    int64 NumberOfRegisterVariables ;
    int64 LocalsFrameSize ;
    int64 SaveCompileMode, SaveOptimizeState ; //, SaveScratchPadIndex ;
    int64 ParenLevel ;
    int64 GlobalParenLevel, OptimizeForcedReturn ;
    int64 ArrayEnds ;
    byte * InitHere, *NextBlockStart ;
    int64 * AccumulatedOptimizeOffsetPointer ;
    Boolean InLParenBlock, SemicolonEndsThisBlock, TakesLParenAsBlock, BeginBlockFlag ;
    int32 * AccumulatedOffsetPointer ;
    int64 * FrameSizeCellOffset, BlocksBegun ;
    byte * RspSaveOffset ;
    byte * RspRestoreOffset ;
    Word * ReturnVariableWord ;
    Word * CurrentWord, *CurrentCreatedWord ;
    Word * LHS_Word ;
    Namespace *C_BackgroundNamespace, *C_FunctionBackgroundNamespace, *LocalsNamespace ; //, ** FunctionTypesArray ;
    dllist * GotoList ;
    dllist * CurrentSwitchList ;
    dllist * RegisterParameterList ;
    CompileOptimizeInfo * OptInfo ;
    dllist *PostfixLists ;
    Stack * CombinatorInfoStack ;
    Stack * PointerToOffset ;
    Stack * LocalsCompilingNamespacesStack ;
    Stack * CombinatorBlockInfoStack ;
    Stack * BlockStack ;
    Stack * NamespacesStack ;
    Stack * InfixOperatorStack ;
    dllist * OptimizeInfoList ;
} Compiler ;
typedef struct Interpreter
{
    uint64 State ;
    ReadLiner * ReadLiner0 ;
    Finder * Finder0 ;
    Lexer * Lexer0 ;
    Compiler * Compiler0 ;
    byte * Token ;
    Word *w_Word, *LastWord ;
    Word * BaseObject ;
    Word *CurrentObjectNamespace, *ThisNamespace ;
    int64 WordType ;
    dllist * InterpList ;
} Interpreter ;

struct _Debugger ;
typedef void (* DebuggerFunction ) (struct _Debugger *) ;
typedef struct _Debugger
{
    uint64 State ;
    uint64 * SaveDsp, *SaveEdi, *SaveRsp ;
    uint64 * WordDsp ;
    int64 SaveTOS ;
    int64 SaveStackDepth ;
    int64 Key ;
    int64 SaveKey ;
    int64 TokenStart_ReadLineIndex, Esi, Edi ;
    Word * w_Word, *EntryWord, *LastShowWord, *LastEffectsWord, *NextEvalWord ;
    Word *LocalsNamespace, *LastSetupWord, *SteppedWord, *CurrentlyRunningWord, *LastSourceCodeWord ;
    byte * Token ;
    block SaveCpuState ;
    block RestoreCpuState ;
    block getRsp ;
    byte * PreHere, *StartHere, *LastDisStart, *ShowLine, * Filename ;
    Stack *ReturnStack ;
    Cpu * cs_Cpu ;
    byte* DebugAddress, *CopyRSP, *CopyRBP, *LastSourceCodeAddress ;
    uint64 * DebugRSP, *DebugRBP, *DebugRSI, *DebugRDI, * LastRsp ; //, *SavedIncomingESP, *SavedIncomingEBP ; //, SavedRunningESP, SavedRunningEBP;
    int64 LastSourceCodeIndex, TerminalLineWidth, ReadIndex ;
    ByteArray * StepInstructionBA ;
    byte CharacterTable [ 128 ] ;
    DebuggerFunction CharacterFunctionTable [ 36 ] ;
    ud_t * Udis ;
    Stack * LocalsNamespacesStack ;
    dllist * DebugWordList ;
    uint64 LevelBitNamespaceMap ;
    sigjmp_buf JmpBuf0 ;
} Debugger ;
typedef struct
{
    uint64 State ;
    int64 NumberBase ;
    long BigNum_Printf_Precision ;
    long BigNum_Printf_Width ;
    int64 ExceptionFlag ;
    int64 IncludeFileStackNumber ;
    struct timespec Timers [ 8 ] ;
} System ;
typedef struct
{
    DLNode C_Node ;
    uint64 State ;
    int64 NsCount, WordCount ;
    ReadLiner *ReadLiner0 ;
    Lexer *Lexer0 ;
    Finder * Finder0 ;
    Interpreter * Interpreter0 ;
    Compiler *Compiler0 ;
    System * System0 ;
    Stack * ContextDataStack ;
    byte * Location ;
    Word * CurrentlyRunningWord, *CurrentEvalWord, *NlsWord, *SC_CurrentCombinator, *SourceCodeWord, *CurrentDisassemblyWord ;
    block CurrentlyRunningWordDefinition ;
    dllist * PreprocessorStackList ;
    NBA * ContextNba ;
    sigjmp_buf JmpBuf0 ;
} Context ;
typedef void (* ContextFunction_2 ) ( Context * cntx, byte* arg1, int64 arg2 ) ;
typedef void (* ContextFunction_1 ) ( Context * cntx, byte* arg ) ;
typedef void (* ContextFunction ) ( Context * cntx ) ;
typedef void (* LexerFunction ) ( Lexer * ) ;
typedef struct _CombinatorInfo
{
    union
    {
        int64 CI_i32_Info ;
        struct
        {
            unsigned BlockLevel : 16 ;
            unsigned ParenLevel : 16 ;
        } ;
    } ;
} CombinatorInfo ;

struct _CfrTil ;
typedef struct _LambdaCalculus
{
    uint64 State ;
    int64 DontCopyFlag, Loop, ParenLevel ;
    Namespace *LispNamespace, *LispInternalNamespace ;
    ListObject *lFunction, *lArgs, * Nil, *True ;
    ListObject *CurrentLambdaFunction, *LastInterpretedWord ; //, *ListFirst;
    ByteArray * SavedCodeSpace ;
    uint64 ItemQuoteState, QuoteState ;
    struct _CfrTil * OurCfrTil ;
    Stack * QuoteStateStack ;
    int64 * SaveStackPointer ;
    byte * LC_SourceCode ;
    Buffer *OutBuffer, *PrintBuffer ;
    byte * buffer, *outBuffer ;
} LambdaCalculus ;
typedef struct
{
    union
    {
        struct
        {
            unsigned CharFunctionTableIndex : 16 ;
            unsigned CharType : 16 ;
        } ;
        int64 CharInfo ;
    } ;
} CharacterType ;
typedef struct _StringTokenInfo
{
    uint64 State ;
    int64 StartIndex, EndIndex ;
    byte * In, *Out, *Delimiters, *SMNamespace ;
    CharSet * CharSet0 ;
} StringTokenInfo, StrTokInfo ;
// StrTokInfo State constants
#define STI_INITIALIZED     ( 1 << 0 )
typedef struct _CfrTil
{
    uint64 State ;
    Stack *ReturnStack, * DataStack ;
    Namespace * Namespaces ;
    Context * Context0 ;
    Stack * ContextDataStack ;
    Debugger * Debugger0 ;
    Stack * ObjectStack, *DebugStateStack ;
    Namespace * InNamespace, *LispNamespace ; //, *CfrTilWordCreateTemp ;
    LambdaCalculus * LC ;
    FILE * LogFILE ;
    int64 LogFlag, WordsAdded, FindWordCount, FindWordMaxCount, WordCreateCount, DObjectCreateCount ;
    uint64 * SaveDsp ;
    Cpu * cs_Cpu ;
    Cpu * cs_Cpu2 ;
    block CurrentBlock, SaveCpuState, SaveCpu2State, RestoreCpuState, RestoreCpu2State, CallCfrTilWord, CallCurrentBlock, RestoreSelectedCpuState, SaveSelectedCpuState ; //, SyncDspToEsi, SyncEsiToDsp ;
    block Set_DspReg_FromDataStackPointer, Set_DataStackPointer_FromDspReg ; //, PeekReg, PokeReg ;
    block PopDspToR8AndCall, CallReg_TestRSP, Call_ToAddressThruR8_TestAlignRSP ; //adjustRSPAndCall, adjustRSP ;
    ByteArray * PeekPokeByteArray ;
    Word * LastFinished_DObject, * LastFinished_Word, *StoreWord, *PokeWord, *ScoOcCrw, * CurrentWordCompiling ;
    Word *ScWord, *DebugWordListWord, *EndBlockWord, *BeginBlockWord, *InfixNamespace ;
    byte ReadLine_CharacterTable [ 256 ] ;
    ReadLineFunction ReadLine_FunctionTable [ 24 ] ;
    CharacterType LexerCharacterTypeTable [ 256 ] ;
    LexerFunction LexerCharacterFunctionTable [ 24 ] ;
    Buffer *StringB, * TokenB, *OriginalInputLineB, *InputLineB, *SourceCodeBuffer, *StringInsertB, *StringInsertB2, *StringInsertB3, *StringInsertB4, *StringInsertB5, *StrCatBuffer ;
    Buffer *TabCompletionBuf, * LC_PrintB, * LC_DefineB, *DebugB, *DebugB1, *DebugB2, *DebugB3, *ScratchB1, *ScratchB2, *ScratchB3, *StringMacroB ; // token buffer, tab completion backup, source code scratch pad, 
    StrTokInfo Sti ;
    byte * OriginalInputLine ;
    byte * TokenBuffer ;
    byte * SC_Buffer ; // nb : keep this here -- if we add this field to Lexer it just makes the lexer bigger and we want the smallest lexer possible
    int64 SC_Index, SC_QuoteMode ; // SC_Index == SC_Buffer Index ;
    dllist *TokenList, * CompilerWordList ;
    sigjmp_buf JmpBuf0 ;
} CfrTil ;
typedef struct
{
    MemChunk MS_MemChunk ;
    // static buffers
    // short term memory
    NamedByteArray * SessionObjectsSpace ; // until reset
    //NamedByteArray * SessionCodeSpace ; // until reset
    NamedByteArray * TempObjectSpace ; // lasts for one line
    NamedByteArray * CompilerTempObjectSpace ; // lasts for compile of one word
    NamedByteArray * ContextSpace ;
    NamedByteArray * LispTempSpace ;
    // quasi long term
    NamedByteArray * BufferSpace ;
    NamedByteArray * CfrTilInternalSpace ;
    // long term memory
    NamedByteArray * CodeSpace ;
    NamedByteArray * ObjectSpace ;
    NamedByteArray * LispSpace ;
    NamedByteArray * DictionarySpace ;
    NamedByteArray * HistorySpace ;
    NamedByteArray * OpenVmTilSpace ;
    NamedByteArray * StringSpace ;
    dllist NBAs ;
    dlnode NBAsHeadNode ;
    dlnode NBAsTailNode ;
    dllist * BufferList ;
    dllist * RecycledWordList ;
    dllist * RecycledOptInfoList ;
    int64 RecycledWordCount ;
} MemorySpace ;
typedef struct
{
    int64 Red, Green, Blue ;
} RgbColor ;
typedef struct
{
    RgbColor rgbc_Fg ;
    RgbColor rgbc_Bg ;
} RgbColors ;
typedef struct
{
    int64 Fg ;
    int64 Bg ;
} IntColors ;
typedef struct
{
    union
    {
        RgbColors rgbcs_RgbColors ;
        IntColors ics_IntColors ;
    } ;
} Colors ;
typedef struct
{
    NamedByteArray * HistorySpaceNBA ;
    dlnode _StringList_HeadNode, _StringList_TailNode ;
    dllist _StringList, * StringList ;
} HistorySpace ;
typedef struct
{
    uint64 State ;
    CfrTil * OVT_CfrTil ;
    Context * OVT_Context ;
    Interpreter * OVT_Interpreter ;
    HistorySpace OVT_HistorySpace ;
    LambdaCalculus * OVT_LC ;
    ByteArray * CodeByteArray ; // a variable

    PrintStateInfo *psi_PrintStateInfo ;
    int64 SignalExceptionsHandled ;

    byte *InitString ;
    byte *StartupString ;
    byte *StartupFilename ;
    byte *ErrorFilename ;
    byte *VersionString ;
    byte *ExceptionMessage ;
    byte *ExceptionSpecialMessage ;
    byte * ExceptionToken ;
    Word * ExceptionWord ;
    int64 RestartCondition ;
    int64 Signal ;

    int64 Argc ;
    char ** Argv ;
    void * SigAddress ;
    byte * SigLocation ;
    Colors *Current, Default, Alert, Debug, Notice, User ;
    int64 Console ;

    dllist PermanentMemList ;
    dlnode PML_HeadNode ;
    dlnode PML_TailNode ;
    MemorySpace * MemorySpace0 ;
    int64 PermanentMemListRemainingAccounted, TotalNbaAccountedMemRemaining, TotalNbaAccountedMemAllocated, TotalMemSizeTarget ;
    int64 Mmap_RemainingMemoryAllocated, OVT_InitialUnAccountedMemory, RunTimeAllocation, TotalMemFreed, TotalMemAllocated, NumberOfByteArrays ;

    // variables accessible from cfrTil
    int64 Verbosity ;
    int64 StartIncludeTries ;
    int64 StartedTimes, Restarts, InitSessionCoreTimes, SigSegvs, AllocationRequestLacks ;

    int64 DictionarySize ;
    int64 LispTempSize ;
    int64 MachineCodeSize ;
    int64 ObjectsSize ;
    int64 LispSize ;
    int64 ContextSize ;
    int64 TempObjectsSize ;
    int64 CompilerTempObjectsSize ;
    int64 SessionObjectsSize ;
    //int64 SessionCodeSize ;
    int64 DataStackSize ;
    int64 HistorySize ;
    int64 OpenVmTilSize ;
    int64 CfrTilSize ;
    int64 BufferSpaceSize ;
    int64 StringSpaceSize ;

    int64 Thrown ;
    sigjmp_buf JmpBuf0 ;
} OpenVmTil ;

// note : this puts these namespaces on the search list such that last, in the above list, will be searched first
typedef struct
{
    const char * ccp_Name ;
    uint8 OpInsnCodeGroup ;
    uint8 OpInsnCode ;
    block blk_Definition ;
    uint64 ui64_CAttribute ;
    uint64 ui64_CAttribute2 ;
    uint64 ui64_LAttribute ;
    const char *NameSpace ;
    const char * SuperNamespace ;
} CPrimitive ;
typedef struct
{
    const char * ccp_Name ;
    uint64 ui64_CAttribute ;
    uint64 ui64_CAttribute2 ;
    block blk_CallHook ;
    byte * Function ;
    int64 i32_FunctionArg ;
    const char *NameSpace ;
    const char * SuperNamespace ;
} MachineCodePrimitive ;
typedef struct ppibs
{
    union
    {
        int64 int64_Ppibs ; // for ease of initializing and conversion
        struct
        {
            unsigned IfBlockStatus : 1 ; // status of whether we should do an ifBlock or not
            unsigned ElifStatus : 1 ; // remembers when we have done an elif in a block; only one can be done in a block in the C syntax definition whick we emulate
            unsigned ElseStatus : 1 ; // remembers when we have done an elif in a block; only one can be done in a block in the C syntax definition whick we emulate
            unsigned DoItStatus : 1 ; // controls whether we do nested if block
        } ;
    } ;
    byte * Filename ;
    int64 LineNumber ;
}
PreProcessorIfBlockStatus, Ppibs ;

