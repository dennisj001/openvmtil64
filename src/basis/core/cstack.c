
#include "../../include/cfrtil64.h"

int64
_Stack_Overflow ( Stack * stack )
{
    return ( stack->StackPointer >= stack->StackMax ) ;
}

int64
_Stack_IsEmpty ( Stack * stack )
{
    return ( stack->StackPointer < stack->StackMin ) ;
}

void
_Stack_Push ( Stack * stack, int64 value )
{
    stack->StackPointer ++ ;
    *( stack->StackPointer ) = value ;
}

void
_Stack_Dup ( Stack * stack )
{
    _Stack_Push ( stack, *( stack->StackPointer ) ) ;
}

int64
__Stack_Pop ( Stack * stack )
{
    return *( stack->StackPointer -- ) ;
}

int64
_Stack_Pop ( Stack * stack )
{
    return __Stack_Pop ( stack ) ;
}

int64
Stack_Pop_WithExceptionFlag ( Stack * stack, int64 exceptionOnEmptyFlag )
{
    if ( _Stack_IsEmpty ( stack ) )
    {
        if ( exceptionOnEmptyFlag == 1 ) CfrTil_Exception ( STACK_UNDERFLOW, 0, QUIT ) ;
        else return 0 ;
    }
    return _Stack_Pop ( stack ) ;
}

int64
Stack_Pop_WithZeroOnEmpty ( Stack * stack )
{
    Stack_Pop_WithExceptionFlag ( stack, 0 ) ;
}

int64
Stack_Pop_WithExceptionOnEmpty ( Stack * stack )
{
    Stack_Pop_WithExceptionFlag ( stack, 1 ) ;
}

int64
Stack_Pop ( Stack * stack )
{
#if STACK_CHECK_ERROR
    return Stack_Pop_WithExceptionFlag ( stack, 1 ) ;
#else
    return _Stack_Pop ( stack ) ;
#endif    
}

int64
_Stack_PopOrTop ( Stack * stack )
{
    int64 sd = Stack_Depth ( stack ) ;
    if ( sd <= 0 ) CfrTil_Exception ( STACK_UNDERFLOW, 0, QUIT ) ;
    else if ( sd == 1 ) return Stack_Top ( stack ) ;
    else return __Stack_Pop ( stack ) ;
}

void
_Stack_DropN ( Stack * stack, int64 n )
{
    if ( n ) stack->StackPointer -= n ;
}

void
_Stack_Drop ( Stack * stack )
{
    stack->StackPointer -- ;
}

int64
Stack_Top ( Stack * stack )
{
    return *stack->StackPointer ;
}

int64
_Stack_Pick ( Stack * stack, int64 offset )
{
    return * ( stack->StackPointer - offset ) ;
}

int64
_Stack_PickFromBottom ( Stack * stack, int64 offset )
{
    return * ( stack->StackMin + offset ) ;
}

int64
_Stack_Bottom ( Stack * stack )
{
    return * ( stack->StackMin ) ;
}

void
_Stack_SetBottom ( Stack * stack, int64 value )
{
    *stack->StackMin = value ;
}

void
_Stack_SetTop ( Stack * stack, int64 value )
{
    *stack->StackPointer = value ;
}

void
Stack_SetTop ( Stack * stack, int64 value )
{
    if ( Stack_Depth ( stack ) ) *stack->StackPointer = value ;
}

inline int64
_Stack_N ( Stack * stack, int64 n )
{
    return *( stack->StackPointer - n ) ;
}

int64
_Stack_NOS ( Stack * stack )
{
    return _Stack_N ( stack, 1 ) ; //*( stack->StackPointer - 1 ) ;
}

void
Stack_Push ( Stack * stack, int64 value )
{
#if STACK_CHECK_ERROR
    if ( _Stack_Overflow ( stack ) )
    {
        AlertColors ;
        _Printf ( ( byte* ) "\nStack_Push : _Stack_Overflow - StackDepth = %d\n", Stack_Depth ( stack ) ) ;
        CfrTil_Exception ( STACK_OVERFLOW, 0, QUIT ) ;
    }
    _Stack_Push ( stack, value ) ;
#else
    _Stack_Push ( stack, value ) ;
#endif
}

void
Stack_Dup ( Stack * stack )
{
#if STACK_CHECK_ERROR
    if ( _Stack_Overflow ( stack ) ) CfrTil_Exception ( STACK_OVERFLOW, 0, QUIT ) ;
    _Stack_Dup ( stack ) ;
#else
    _Stack_Dup ( stack ) ;
#endif
}

int64
_Stack_IntegrityCheck ( Stack * stack )
{
    byte * errorString ;
    // first a simple integrity check of the stack info struct
    if ( ( stack->StackMin == & ( stack->StackData [ 0 ] ) ) &&
        ( stack->StackMax == & ( stack->StackData [ stack->StackSize - 1 ] ) ) && // -1 : zero based array
        ( stack->InitialTosPointer == & stack->StackData [ - 1 ] ) )
    {
        return true ;
    }
    if ( _Stack_Overflow ( stack ) ) CfrTil_Exception ( STACK_OVERFLOW, c_da ( errorString ), QUIT ) ; //errorString = "\nStack Integrity Error : Stack Overflow" ;
    else CfrTil_Exception ( STACK_UNDERFLOW, c_da ( errorString ), QUIT ) ; //errorString = "\nStack Integrity Error : Stack Underflow" ;
    return false ;
}

int64
_Stack_Depth ( Stack * stack )
{
    int64 depth = stack->StackPointer - stack->InitialTosPointer ; //+ 1 ; //1 :: zero based array - include the zero in depth 
    return ( depth ) ; //+ 1 ) ;// + 1 :: zero based array - include the zero in depth 
}

int64
Stack_Depth ( Stack * stack )
{
    // first a simple integrity check of the stack info struct
    if ( _Stack_IntegrityCheck ( stack ) )
    {
        return _Stack_Depth ( stack ) ;
    }
    return ( 0 ) ;
}

void
Stack_SetStackMax ( Stack * stack, int64 value )
{
    stack->StackData [ stack->StackSize - 1 ] = value ;
}

// Stack_Clear => Stack_Init

void
_Stack_Init ( Stack * stack, int64 slots )
{
    memset ( stack, 0, sizeof ( Stack ) + ( slots * sizeof (int64 ) ) ) ;
    stack->StackSize = slots ; // re-init size after memset cleared it
    stack->StackMin = & stack->StackData [ 0 ] ; // 
    stack->StackMax = & stack->StackData [ stack->StackSize - 1 ] ;

    stack->InitialTosPointer = & stack->StackData [ - 1 ] ; // first push goes to stack->StackData [ 0 ]
    stack->StackPointer = stack->InitialTosPointer ;
}

void
Stack_Delete ( Stack * stack )
{
    Mem_FreeItem ( &_Q_->PermanentMemList, ( byte* ) stack ) ;
}

void
Stack_Init ( Stack * stack )
{
    _Stack_Init ( stack, stack->StackSize ) ;
}

Stack *
Stack_New ( int64 slots, uint64 allocType )
{
    Stack * stack = ( Stack* ) Mem_Allocate ( sizeof ( Stack ) + ( slots * sizeof (int64 ) ), allocType ) ;
    _Stack_Init ( stack, slots ) ;
    return stack ;
}

Stack *
Stack_Copy ( Stack * stack, uint64 type )
{
    Stack * nstack = Stack_New ( stack->StackSize, type ) ;
    MemCpy ( nstack->StackData, stack->StackData, stack->StackSize * sizeof (int64 ) ) ;

    // ?? -> preserve relative stack pointer
    int64 depth = Stack_Depth ( stack ) ;
    //depth = stack->StackPointer - stack->InitialTosPointer ;
    nstack->StackPointer = nstack->InitialTosPointer + depth ;

    return nstack ;
}

#if 0
void
Stack_Print_AValue_WordName ( Stack * stack, int64 i, byte * stackName, byte * buffer )
{
    uint64 * stackPointer = stack->StackPointer ;
    Word * word = ( Word * ) ( stackPointer [ - i ] ) ;
    if ( word )
    {
        byte wname [ 128 ] ;
        sprintf ( ( char* ) buffer, "< %s.%s >", word->ContainingNamespace ? ( char* ) word->ContainingNamespace->Name : "<literal>", 
            c_gd ( _String_ConvertStringToBackSlash ( wname, word->Name, - 1 ) ) ) ;
        _Printf ( ( byte* ) "\n\t    %s   [ %3ld ] < " UINT_FRMT " > = " UINT_FRMT "\t%s", stackName, i, 
            ( uint64 ) & stackPointer [ - i ], stackPointer [ - i ], word ? ( char* ) buffer : "" ) ;
    }
}
#endif

void
Stack_Print_AValue ( uint64 * stackPointer, int64 i, byte * stackName, byte * buffer, Boolean isWordAlreadyFlag )
{
    Word * word ;
    byte * string = 0, tsb [32], *ts = 0;
    tsb[0] = 0 ;
    if ( isWordAlreadyFlag ) 
    {
        word = ( Word* ) ( stackPointer [ i ] ) ;
        ts = Word_TypeSignature ( word, tsb ) ;
    }
    else word = Word_GetFromCodeAddress ( ( byte* ) ( stackPointer [ i ] ) ) ;
    if ( word )
    {
        if ( IS_NON_MORPHISM_TYPE ( word ) ) sprintf ( ( char* ) buffer, "< word : %s.%s : value = 0x%016lx > : %s", 
            word->ContainingNamespace ? word->ContainingNamespace->Name : ( byte* ) "<literal>", c_gd ( String_ConvertToBackSlash ( word->Name )), 
            ( uint64 ) word->S_Value, ts ? c_gd (ts) : (byte*)"Undefined") ;
        else sprintf ( ( char* ) buffer, "< word : %s.%s : definition = 0x%016lx >", 
            word->ContainingNamespace ? word->ContainingNamespace->Name : ( byte* ) "<literal>", c_gd ( word->Name ), ( uint64 ) word->Definition ) ;
    }
    else string = String_CheckForAtAdddress ( ( byte* ) ( ( byte* ) ( stackPointer[i] ) ) ) ;
    _Printf ( ( byte* ) "\n\t    %s   [ %3ld ] < " UINT_FRMT " > = " UINT_FRMT "\t%s",
        stackName, i, ( uint64 ) & stackPointer [ i ], stackPointer [ i ], word ? buffer : string ? string : ( byte* ) "" ) ;
}

void
_Stack_PrintHeader ( Stack * stack, byte * name )
{
    int64 depth = Stack_Depth ( stack ) ;
    //if ( size )
    {
        uint64 * sp = stack->StackPointer ; // 0 based stack
        byte * location = c_gd ( Context_Location ( ) ) ;
        _Printf ( ( byte* ) "\n%s at : %s :\n%s depth =%4d : %s = Top = " UINT_FRMT ", InitialTos = " UINT_FRMT ", Size = " UINT_FRMT, name, location,
            name, depth, stack == _DataStack_ ? "Dsp (R14)" : _ReturnStack_ ? "CfrTilRsp (Rbx)" : "", ( int64 ) sp, ( int64 ) stack->InitialTosPointer, stack->StackMax - stack->StackMin + 1 ) ;
    }
}

void
_Stack_PrintValues ( byte * name, uint64 * stackPointer, int64 depth, Boolean isWordAlreadyFlag )
{
    if ( depth )
    {
        int64 i ;
        byte * buffer = Buffer_New_pbyte ( BUFFER_SIZE ) ;
        if ( depth >= 0 ) for ( i = 0 ; depth -- > 0 ; i -- ) Stack_Print_AValue ( stackPointer, i, name, buffer, isWordAlreadyFlag ) ;
        else CfrTil_Exception ( STACK_UNDERFLOW, 0, QUIT ) ;
    }
}

void
_Stack_Print ( Stack * stack, byte * name, int64 depth, Boolean isWordAlreadyFlag )
{
    _Stack_PrintHeader ( stack, name ) ;
    _Stack_PrintValues ( name, stack->StackPointer, depth, isWordAlreadyFlag ) ;
    if ( depth ) CfrTil_NewLine ( ) ;
}

void
Stack_Print ( Stack * stack, byte * name, Boolean isWordAlreadyFlag )
{
    _Stack_Print ( stack, name, Stack_Depth ( stack ), isWordAlreadyFlag ) ;
}

void
_PrintNStackWindow ( uint64 * reg, byte * name, byte * regName, int64 size )
{
    // Intel SoftwareDevelopersManual-253665.pdf section 6.2 : a push decrements ESP, a pop increments ESP
    // therefore TOS is in lower mem addresses, bottom of stack is in higher memory addresses
    byte * buffer = Buffer_New_pbyte ( BUFFER_SIZE ) ;
    int64 saveSize = size ;
    if ( reg )
    {
        _Printf ( ( byte* ) "\n%s   :%3i  : %s = " UINT_FRMT " : Top = " UINT_FRMT "", name, size, regName, ( uint64 ) reg, ( uint64 ) reg ) ;
        // print return stack in reverse of usual order first
        while ( size -- > 1 )
        {
            Stack_Print_AValue ( reg, size, name, buffer, 0 ) ;
        }
        _Stack_PrintValues ( ( byte* ) name, reg, saveSize, 0 ) ;
    }
}

void
_CfrTil_PrintNReturnStack ( int64 size, Boolean useExistingFlag )
{
    Debugger * debugger = _Debugger_ ;
    if ( useExistingFlag )
    {
        if ( GetState ( debugger, DBG_STEPPING ) && debugger->CopyRSP )
        {
            _PrintNStackWindow ( ( uint64* ) debugger->CopyRSP, ( byte * ) "ReturnStackCopy", ( byte * ) "RSCP", size ) ;
        }
        else if ( debugger->cs_Cpu->Rsp ) //debugger->DebugESP )
        {
            _PrintNStackWindow ( ( uint64* ) debugger->cs_Cpu->Rsp, ( byte * ) "Return Stack", ( byte * ) "Rsp (RSP)", size ) ;
            _Stack_PrintValues ( ( byte* ) "DebugStack ", debugger->ReturnStack->StackPointer, Stack_Depth ( debugger->ReturnStack ), 0 ) ;
        }
    }
    else
    {
        _CfrTil_WordName_Run ( ( byte* ) "getRsp" ) ;
        uint64 * rsp = ( uint64 * ) DataStack_Pop ( ) ;
        _PrintNStackWindow ( rsp, ( byte* ) "Return Stack", ( byte* ) "Rsp (RSP)", size ) ;
    }
}

void
_CfrTil_PrintNDataStack ( int64 size )
{
    _PrintNStackWindow ( _Dsp_, ( byte* ) "Data Stack", ( byte* ) "Dsp (DSP:R14)", size ) ;
}

