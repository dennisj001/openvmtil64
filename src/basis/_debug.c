
#include "../include/cfrtil64.h"

// we have the address of a jcc insn 
// get the address it jccs to

byte *
JccInstructionAddress_2Byte ( byte * address )
{
    int32 offset = * ( int32* ) ( address + 2 ) ; // 2 : 2 byte opCode
    byte * jcAddress = address + offset + 6 ; // 6 : sizeof 0f jcc insn - 0x0f8x - includes 2 byte opCode
    return jcAddress ;
}

byte *
JccInstructionAddress_1Byte ( byte * address )
{
    int32 offset = ( int32 ) * ( byte* ) ( address + 1 ) ; // 1 : 1 byte opCode
    byte * jcAddress = address + offset + 2 ; // 2 : sizeof 0f jcc insn - 0x7x - includes 1 byte opCode
    return jcAddress ;
}

// we have the address of a jmp/call insn 
// get the address it jmp/calls to

byte *
JumpCallInstructionAddress ( byte * address )
{
    // calculate jmp or call address
    int32 offset = * ( int32* ) ( address + 1 ) ; // 1 : 1 byte opCode
    byte * jcAddress = address + offset + 5 ; // 5 : sizeof jmp insn - includes 1 byte opcode
    return jcAddress ;
}

void
_CfrTil_ACharacterDump ( char aChar )
{
    if ( isprint ( aChar ) )
    {
        _Printf ( ( byte* ) "%c", aChar ) ;
    }
    else _Printf ( ( byte* ) "." ) ;
}

void
CfrTil_CharacterDump ( byte * address, int64 number )
{
    int64 i ;
    for ( i = 0 ; i < number ; i ++ )
    {

        _CfrTil_ACharacterDump ( address [ i ] ) ;
    }
    _Printf ( ( byte* ) " " ) ;
}

void
_CfrTil_AByteDump ( byte aByte )
{

    _Printf ( ( byte* ) "%02x ", aByte ) ;
}

void
CfrTil_NByteDump ( byte * address, int64 number )
{
    int64 i ;
    for ( i = 0 ; i < number ; i ++ )
    {

        _CfrTil_AByteDump ( address [ i ] ) ;
    }
    _Printf ( ( byte* ) " " ) ;
}

byte *
GetPostfix ( byte * address, byte* postfix, byte * buffer )
{
    byte * iaddress = 0, *str ;
    Word * word = 0, *dbgWord = _Debugger_->w_Word ;
    char * prePostfix = ( char* ) "  \t" ;
    if ( iaddress = Calculate_Address_FromOffset_ForCallOrJump ( address ) )
    {
        if ( dbgWord && ( Is_NamespaceType ( dbgWord ) ) )
        {
            word = Finder_FindWordFromAddress_InOneNamespace ( _Finder_, dbgWord->S_ContainingNamespace, iaddress ) ;
        }
        if ( ! word ) word = Word_GetFromCodeAddress ( iaddress ) ;
        if ( word )
        {
            byte * name = ( byte* ) c_gd ( word->Name ) ; //, &_Q_->Default ) ;
            if ( ( byte* ) word->CodeStart == iaddress )
            {
                snprintf ( ( char* ) buffer, 128, "%s< %s.%s >%s", prePostfix, word->ContainingNamespace->Name, name, postfix ) ;
            }
            else
            {
                snprintf ( ( char* ) buffer, 128, "%s< %s.%s+%ld >%s", prePostfix,
                    word->ContainingNamespace ? word->ContainingNamespace->Name : ( byte* ) "", name, iaddress - ( byte* ) word->CodeStart, postfix ) ;
            }
        }
        else snprintf ( ( char* ) buffer, 128, "%s< %s >", prePostfix, ( char * ) "C compiler code" ) ;
        postfix = buffer ;
    }
    else
    {
        str = String_CheckForAtAdddress ( *( ( byte ** ) ( address + 2 ) ) ) ;
        if ( str )
        {
            snprintf ( ( char* ) buffer, 128, "%s%s", prePostfix, str ) ;
            postfix = buffer ;
        }
    }
    return postfix ;
}

void
Compile_Debug_GetRSP ( ) // where we want the acquired pointer
{
    _Compile_PushReg ( ACC ) ;
    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & _Debugger_->DebugRSP, RSP, ACC ) ; // esp 
    _Compile_PopToReg ( ACC ) ;
    _Compile_Stack_PushReg ( DSP, ACC ) ;
}

void
_Compile_DebugRuntimeBreakpoint ( ) // where we want the acquired pointer
{
    Compile_CpuState_Save ( _Debugger_->cs_Cpu ) ;
    Compile_Call_TestRSP ( ( byte* ) CfrTil_DebugRuntimeBreakpoint ) ;
}

#if 0
uint64
GetRsp ( )
{
    _CfrTil_->SaveSelectedCpuState ( ) ;
    return (uint64) _CfrTil_->cs_Cpu->Rsp ;
}

uint64
_GetTestRsp ()
{
    uint64 rsp = GetRsp ( ) ;
    return rsp ;
    //if ( rsp & ( uint64 ) 0x8 ) return rsp ;
    //else return 0 ;
}

void
_GetTestRsp_ ( byte * src )
{
    uint64 rsp = _GetTestRsp () ;
    if ( rsp & 0x8 )
        _Printf ( ( byte* ) "\n%s : %s : rsp = %llx", src, Context_Location (), rsp ) ;
}

void
GetTestRsp_Word ()
{
    _GetTestRsp_ ( (byte*) "Word" ) ;
}

void
GetTestRsp_Block ()
{
    _GetTestRsp_ ( (byte*) "Block" ) ;
}

void
Compile_PopDspToR8AndCall ( )
{
    // from x64.cft
    //Compile_Stack_Pop_R8D ( ) ;
    //_Compile_CALL_Reg ( R8D ) ;
    _Compile_Stack_PopToReg ( DSP, R8 ) ;
    _Compile_Call_ThruReg ( R8 ) ;
}

void
_Compile_Pause ( )
{
    _Compile_Debug_getRsp ( ( int64* ) & _Debugger_->DebugESP ) ;
    Compile_Call ( ( byte* ) _Debugger_->SaveCpuState ) ;
    Compile_Call ( ( byte* ) _CfrTil_->SaveCpuState ) ;
    Compile_Call ( ( byte* ) OpenVmTil_Pause ) ;
}
#endif