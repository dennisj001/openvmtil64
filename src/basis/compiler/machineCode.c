#include "../../include/cfrtil64.h"

// Intel notes - cf. InstructionSet-A-M-253666.pdf - section 2.1; InstructionSet-N-Z-253667.pdf section B.1/B.2 :
// b prefix = binary code
// -----------------------------------------------------------------------
// instuction format ( in bytes )
// prefixes  opcode  modRm     sib     disp   immediate
//  0 - 4    1 - 3   0 - 1    0 - 1    0,1,4    0,1,4      -- number of bytes
// optional          ------------optional--------------
//   REX Prefix 
//   0100 WRSB  W = 64 bit operand, R = reg ext. flag bit, S = sib ext, B = r/m reg ext flag bit
//   0x40 
// -----------------------------------------------------------------------
//   modRm byte ( bits ) :: mod 0 : no disp ;; mod 1 : 1 byte disp : mod 2 : 4 byte disp ;; mod 3 : reg value :: sections 2.1.3/2.1.5, Table 2-2
//   the mod field is a semantic function on the r/m field determining its meaning either as the reg value itself or the value at the [reg] as an addr + offset
//   Intel InstructionSet-N-Z-253667.pdf section 2.1.5
//    mod     reg     r/m  
//   7 - 6   5 - 3   2 - 0 
//    0-3              4 - b100 => sib, instead of reg ESP   : mod bit determines size of displacement 
// *if* insn has a mod/rm byte then ::
// #define RM( insnAddr )  (*( (byte*) insnAddr + 1) & 7 )   // binary : 00000111
// #define REG( insnAddr ) (*( (byte*) insnAddr + 1) & 56 )  // binary : 00111000 
// #define MOD( insnAddr ) (*( (byte*) insnAddr + 1) & 192 ) // binary : 11000000 
// -----------------------------------------------------------------------
//  reg/rm codes :
//  EAX 0, ECX 1, EDX 2, EBX 3, ESP 4, EBP 5, ESI 6, EDI 7
// -----------------------------------------------------------------------
//  bit positions encoding :  ...|7|6|5|4|3|2|1|0|  but nb. intel is little endian
// -----------------------------------------------------------------------
//  opCode direction bit 'd' is bit position 1 : 1 => rm/sib to reg ; 0 => reg to rm/sib -- for some instructions
//  sign extend bit 's' is bit position 1 for some instructions
//  operand size bit 'w' is bit position 0 for some instructions
// -----------------------------------------------------------------------
//       sib byte ( bits ) with rm 4 - b100 - ESP
//    scale  index   base
//    7 - 6  5 - 3  2 - 0
//    scale 0 : [index * 1 + base]
//    scale 1 : [index * 2 + base]
//    scale 2 : [index * 4 + base]
//    scale 1 : [index * 4 + base]
// -----------------------------------------------------------------------
// intel syntax : opcode dst, src
// att syntax   : opcode src, dst

// note : x86-32 instruction format : || prefixes : 0-4 bytes | opCode : 1-3 bytes | mod : 0 - 1 byte | sib : 0 - 1 byte | disp : 0-4 bytes | immediate : 0-4 bytes ||
// note : intex syntax  : instruction dst, src - cfrTil uses this order convention
//        att   syntax  : instruction src, dst
// note : rm : reg memory - the register which contains the memory address in mod instructions

// cfrTil uses intel syntax convention

// ----------------------------------
// | intel addressing ideas summary |
// ----------------------------------
// remember : the intel cpus can not reference to memory operands in one instruction so the modr/m byte selects with the mod and rm field an operand to use
// with the reg field value (generally)
// the mod field ( 2 bits ) contols whether the r/m field reg refers to a direct reg or indirect + disp values (disp values are in the displacement field)
// mod 0 is for register indirect -- no displacement the register is interpreted as an address; it refers to a value in a memory address with no disp
// mod 1 is for register indirect -- 8 bit disp the register is interpreted as an address; it refers to a value in a memory address with 8 bit disp
// mod 2 is for register indirect -- 32 bit disp the register is interpreted as an address; it refers to a value in a memory address with 32 bit disp
// mod 3 is for register direct   -- using the direct register value -- not as an address 
// the reg field of the modr/m byte generally refers to to register to use with the mod modified r/m field -- intel can't address two memory fields in any instruction
// --------------------------------------
#define TURN_DBI_OFF 0
#if TURN_DBI_OFF
#define dbion DBI_ON 
#define dbioff DBI_OFF 
#undef DBI_ON
#undef DBI_OFF
#define DBI_ON
#define DBI_OFF
#endif
#if 1

int8
RegOrder ( int8 n )
{
    int8 regOrder [] = { RDI, RSI, RDX, RCX, ACC, OP_REG } ;
    return regOrder [n] ;
}
#endif

int8
CalculateModRegardingDisplacement ( int64 mod, int64 disp )
{
    // mod reg r/m bits :
    //  00 000 000
    if ( mod != REG )
    {
        if ( disp == 0 ) mod = 0 ;
        else if ( disp <= 0xff ) mod = 1 ;
        else mod = 2 ;
    }
    return mod ;
}

int8
CalculateModRmByte ( int64 mod, int8 reg, int8 rm, int8 sib, int64 disp )
{
    int8 modRm ;
    mod = CalculateModRegardingDisplacement ( mod, disp ) ;
    if ( ( mod < 3 ) && ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) )
        //if ( ( mod < 3 ) && ( ( ( rm == 4 ) && ( sib == 0 ) ) || ( ( rm == 5 ) && ( disp == 0 ) ) ) )
    {
        // cf. InstructionSet-A-M-253666.pdf Table 2-2
        CfrTil_Exception (MACHINE_CODE_ERROR, 0, 1 ) ;
    }
    if ( sib )
    {
        rm = 4 ; // from intel mod tables
        reg = 0 ;
    }
    modRm = ( mod << 6 ) + ( ( reg & 0x7 ) << 3 ) + ( rm & 0x7 ) ; // only use 3 bits of reg/rm
    //modRm = ( mod << 6 ) + ( ( reg ) << 3 ) + ( rm ) ; // only use 3 bits of reg/rm
    return modRm ;
}

//-----------------------------------------------------------------------
//   modRm byte ( bits )  mod 0 : no disp ; mod 1 : 1 byte disp : mod 2 : 4 byte disp ; mod 3 : just reg value
//    mod     reg      rm
//   7 - 6   5 - 3   2 - 0
//-----------------------------------------------------------------------
//  reg/rm values :
//  EAX 0, ECX 1, EDX 2, ECX 3, ESP 4, EBP 5, ESI 6, EDI 7
//-----------------------------------------------------------------------


// some checks of the internal consistency of the instruction bits

int64
CalculateSib ( int64 scale, int64 indexReg, int64 baseReg )
{
    //  scale index base bits  : scale 1 = *2, 2 = *4, 3 = *8 ; index and base refer to registers
    //  00    000   000
    //if (( indexReg > 0x7 ) || ( baseReg > 0x7 ) ) Exception ( MACHINE_CODE_ERROR, ABORT ) ;
    int8 sib = ( scale << 6 ) | ( ( indexReg & 0x7 ) << 3 ) | ( baseReg & 0x7 ) ;
    return sib ;
}

byte
_CalculateRex ( int8 reg, int8 rm, int8 sib, int64 operandSize )
{
    //  0100    WRXB
    int8 rex = 0 ;
    if ( operandSize > INT32_SIZE )
    {
        //rex += 8 ; // 1 << 3 ;
        byte rex = 0x48 ;
        if ( reg > 0x7 ) rex += 4 ; // (1 << 2) ;
        if ( sib > 0x7 ) rex += 2 ; // 1 << 1 ; // needs to be fixed!! respecting sib first
        if ( rm > 0x7 ) rex += 1 ;
    }
    return rex ;
}
// instruction letter codes : I - immediate data ; 32 : 32 bit , 8 : 8 bit ; EAX, DSP : registers
// we could have a mod of 0 so the modRmImmDispFlag is necessary
// operandSize : specific size of immediate data - BYTE or WORD
// SIB : scale, index, base addressing byte

void
_Compile_ImmDispData ( int64 immDisp, int64 immSize, int8 forceFlag )
{
    // the opcode probably is all that needs to be adjusted for this to not be necessary    
    // to not compile an imm when imm is a parameter, set isize == 0 and imm == 0
    if ( immSize > 0 )
    {
        if ( immSize == BYTE )
            _Compile_Int8 ( ( byte ) immDisp ) ;
        else if ( immSize == 4 )
            _Compile_Int32 ( immDisp ) ;
        else if ( immSize == CELL )
            _Compile_Cell ( immDisp ) ;
    }
    else // with operandSize == 0 let the compiler use the minimal size ; nb. can't be imm == 0
    {
        if ( immDisp >= 0x100000000 )
            _Compile_Int64 ( immDisp ) ;
        else if ( immDisp >= 0x100 )
            _Compile_Int32 ( immDisp ) ;
        else if ( immDisp || forceFlag )
            _Compile_Int8 ( ( byte ) immDisp ) ;
    }
}

// Intel - InstructionSet-A-M-253666.pdf - section 2.1 :
//-----------------------------------------------------------------------
// instuction format ( number of bytes )
// prefixes  opcode  modRm   sib       disp    immediate
//  0 - 4    1 - 3   0 - 1  0 - 1    0,1,2,4    0,1,2,4      -- number of bytes
//-----------------------------------------------------------------------
//   modRm byte ( bits )  mod 0 : no disp ; mod 1 : 1 byte disp : mod 2 : 4 byte disp ; mod 3 : just reg value
//    mod     reg      rm
//   7 - 6   5 - 3   2 - 0 
//-----------------------------------------------------------------------
//  reg/rm values :
//  EAX 0, ECX 1, EDX 2, ECX 3, ESP 4, EBP 5, ESI 6, EDI 7
//-----------------------------------------------------------------------
//       sib byte ( bits )
//    scale  index   base
//    7 - 6  5 - 3  2 - 0
//-----------------------------------------------------------------------

void
Compile_Int8 ( int64 opCode )
{
    //d0 ( byte * here = Here ) ;
    _Compile_Int8 ( ( byte ) opCode ) ;
    //D0 ( Debugger_UdisOneInstruction ( _Debugger_, here, ( byte* ) "", ( byte* ) "" ) ; ) ;
}

int8
_Calculate_Rex_With_Sib ( int8 reg, int8 scale, int8 index, int8 base, int8 rex_w_flag )
{
    int8 rex = ( ( rex_w_flag ? 8 : 0 ) | ( ( reg > 7 ) ? 4 : 0 ) | ( ( index > 7 ) ? 2 : 0 ) | ( ( base > 7 ) ? 1 : 0 ) ) ;
    if ( rex ) rex |= 0x40 ;
    return rex ;
}

int8
Calculate_Rex ( int8 reg, int8 rm, int8 rex_w_flag )
{
#if 1   
    int8 rex = ( ( rex_w_flag ? 8 : 0 ) | ( ( reg > 7 ) ? 4 : 0 ) | ( ( rm > 7 ) ? 1 : 0 ) ) ;
    if ( rex ) rex |= 0x40 ;
    return rex ;
#else    
    return _Calculate_Rex_With_Sib ( reg, 0, 0, 0, rex_w_flag ) ;
#endif    

}

// controlFlags : bits ::  4      3       2     1      0         
//                       rex    imm    disp   sib    modRm      
//                      rex=16 imm=8, disp=4 sib=2  mod/Rm=1
//                      REX_B  IMM_B  DISP_B SIB_B   MODRM_B

void
Compile_CalcWrite_Instruction_X64 ( int8 rex, int8 opCode, int8 mod, int8 reg, int8 rm, int16 controlFlags, int8 sib, int64 disp, int8 dispSize, int64 imm, int8 immSize )
{
    rex = Calculate_Rex ( reg, rm, ( immSize == 8 ) || ( controlFlags & REX_B ) ) ;
    int8 modRm = CalculateModRmByte ( mod, reg, rm, sib, disp ) ;
    _Compile_Write_Instruction_X64 ( rex, opCode, modRm, controlFlags, sib, disp, dispSize, imm, immSize ) ;
}

void
_Compile_Write_Instruction_X64 ( int8 rex, int16 opCode, int8 modRm, int16 controlFlags, int8 sib, int64 disp, int8 dispSize, int64 imm, int8 immSize )
#if 1
{
    d1 ( byte * here = Here ) ;
    //if ( controlFlags & REX_B ) rex |= 0x40 ;
    if ( rex ) _Compile_Int8 ( rex ) ;
    if ( opCode > 0xff ) _Compile_Int16 ( ( int16 ) opCode ) ;
    else _Compile_Int8 ( ( byte ) opCode ) ;
    if ( ( controlFlags & MODRM_B ) ) _Compile_Int8 ( modRm ) ;
    if ( sib && ( controlFlags & SIB_B ) ) _Compile_Int8 ( sib ) ;
    if ( disp || ( controlFlags & DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, 0 ) ;
    if ( imm || ( controlFlags & IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlags & IMM_B ) ) ;
    if ( DBI ) //Is_DebugOn ) //
    {
        //d1 ( Word * currentWord = Compiling ? _Compiler_->CurrentWord : _Interpreter_->w_Word ) ;
        //d1 ( Word * currentWord = _Interpreter_->w_Word ) ;
        //d1 ( _Printf ( ( byte* ) "\n_Compile_InstructionX64 :: CurrentWord = %s :: location : %s :",
        //    currentWord ? ( currentWord->Name ? String_ConvertToBackSlash ( currentWord->Name ) : ( byte* ) "" ) : ( byte* ) "", Context_Location ( ) ) ) ;
        d1 ( Debugger_UdisOneInstruction ( _Debugger_, here, ( byte* ) "", ( byte* ) "" ) ; ) ;
        d0 ( _Debugger_Disassemble ( _Debugger_, ( byte* ) here, Here - here, 1 ) ) ;
    }
}
#else
{
    d1 ( byte * here = Here ) ;
    if ( rex ) _Compile_Int8 ( rex ) ;
    if ( opCode > 0xff ) _Compile_Int16 ( ( int16 ) opCode ) ;
    else _Compile_Int8 ( ( byte ) opCode ) ;
    if ( controlFlags & MODRM_B ) _Compile_Int8 ( modRm ) ;
    if ( sib || ( controlFlags & SIB_B ) ) _Compile_Int8 ( sib ) ;
    //if ( (controlFlags & DISP_B) ) _Compile_ImmDispData ( disp, dispSize, 0 ) ;
    if ( disp || ( controlFlags & DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, 0 ) ;
    if ( ( controlFlags & IMM_B ) ) _Compile_ImmDispData ( imm, immSize, 1 ) ;
    //if ( imm || (controlFlags & IMM_B) ) _Compile_ImmDispData ( imm, immSize, 1 ) ;
    if ( DBI ) //Is_DebugOn ) //
    {
        //d1 ( Word * currentWord = Compiling ? _Compiler_->CurrentWord : _Interpreter_->w_Word ) ;
        d1 ( Word * currentWord = _Interpreter_->w_Word ) ;
        d1 ( _Printf ( ( byte* ) "\n_Compile_InstructionX64 :: CurrentWord = %s :: location : %s :",
            currentWord ? ( currentWord->Name ? String_ConvertToBackSlash ( currentWord->Name ) : ( byte* ) "" ) : ( byte* ) "", Context_Location ( ) ) ) ;
        d1 ( Debugger_UdisOneInstruction ( _Debugger_, here, ( byte* ) "", ( byte* ) "" ) ; ) ;
    }
}
#endif

#define NEW_MOVE 0
#if NEW_MOVE

void
Compile_InstructionX64 ( int8 rex, int8 opCode, int8 mod, int8 reg, int8 rm, int16 controlFlags, int8 scale, int8 index, int8 base, int64 disp, int8 dispSize, int64 imm, int8 immSize )
{
    //if ( ! ( controlFlags & SIB_B ) ) rex = Calculate_Rex ( reg, rm, ( immSize == 8 ) || ( controlFlags & REX_B ) ) ;
    if ( ! rex ) rex = Calculate_Rex ( reg, rm, ( immSize == 8 ) || ( controlFlags & REX_B ) ) ;
    //int8 modRm = CalculateModRmByte ( mod, reg, rm, sib, disp ) ;
    //_Compile_Instruction_X64 ( rex, opCode, modRm, controlFlags, sib, disp, dispSize, imm, immSize ) ;
}

void
Compile_InstructionX64_NoSib ( int8 rex, int8 opCode, int8 mod, int8 reg, int8 rm, int16 controlFlags, int64 disp, int8 dispSize, int64 imm, int8 immSize )
{
    //if ( ! ( controlFlags & SIB_B ) ) rex = Calculate_Rex ( reg, rm, ( immSize == 8 ) || ( controlFlags & REX_B ) ) ;
    if ( ! rex ) rex = Calculate_Rex ( reg, rm, ( immSize == 8 ) || ( controlFlags & REX_B ) ) ;
    //int8 modRm = CalculateModRmByte ( mod, reg, rm, sib, disp ) ;
    //_Compile_Instruction_X64 ( rex, opCode, modRm, controlFlags, sib, disp, dispSize, imm, immSize ) ;
}
#endif
// load reg with effective address of [ mod rm sib disp ]

void
_Compile_LEA ( int8 reg, int8 rm, int8 sib, int64 disp )
{
    // _Compile_InstructionX86 ( opCode, mod, reg, rm, modRmImmDispFlag, sib, disp, imm, immSize )
    Compile_CalcWrite_Instruction_X64 ( 0, 0x8d, MEM, reg, rm, REX_B | MODRM_B | DISP_B, sib, disp, 0, 0, 0 ) ;
}

// opCode group 1 - 0x80-0x83 : ADD OR ADC SBB AND SUB XOR CMP : but not with immediate data
// s and w bits of the x86 opCode : w seems to refer to word and is still used probably for historic and traditional reasons
// note : the opReg - operand register parameter is always used for the rm field of the resulting machine code
// These are all operating on a memory operand
// for use of immediate data with this group use _Compile_Group1_Immediate

void
_Compile_X_Group1 ( int8 code, int8 toRegOrMem, int8 mod, int8 reg, int8 rm, int8 sib, int64 disp, int8 osize )
{
    int64 opCode = code << 3 ;
    if ( osize > BYTE ) opCode |= 1 ;
    if ( toRegOrMem == REG ) opCode |= 2 ;
    // we need to be able to set the size so we can know how big the instruction will be in eg. CompileVariable
    // otherwise it could be optimally deduced but let caller control by keeping operandSize parameter
    // some times we need cell_t where bytes would work
    // _Compile_InstructionX86 ( opCode, mod, reg, rm, modRmImmDispFlag, sib, disp, imm, immSize )
    Compile_CalcWrite_Instruction_X64 ( 0, opCode, mod, reg, rm, DISP_B | REX_B | MODRM_B, sib, disp, 0, 0, osize ) ;
}

// opCode group 1 - 0x80-0x83 : ADD OR ADC SBB AND_OPCODE SUB XOR CMP : with immediate data
// this is for immediate operands operating on REG direction
// mod := REG | MEM
// rm is operand register
// ?!? shouldn't we just combine this with _Compile_Group1 (above) ?!?

void
_Compile_X_Group1_Immediate ( int8 code, int8 mod, int8 rm, int64 disp, int64 imm, int8 iSize )
{
    // 0x80 is the base opCode for this group of instructions but 0x80 is an alias for 0x82
    // we always sign extend so opCodes 0x80 and 0x82 are not being used
    // #x80 is the base opCode for this group of instructions 
    // 1000 00sw 
    int64 opCode = 0x80 ;
    if ( ( iSize == CELL ) )
    {
        ;
    }
    if ( ( iSize > BYTE ) || ( imm >= 0x100 ) )
    {
        opCode |= 1 ;
    }
    else if ( ( iSize <= BYTE ) || ( imm < 0x100 ) ) opCode |= 3 ;
    // we need to be able to set the size so we can know how big the instruction will be in eg. CompileVariable
    // otherwise it could be optimally deduced but let caller control by keeping operandSize parameter
    // some times we need cell_t where bytes would work
    //_Compile_InstructionX86 ( int8 opCode, int8 mod, int8 reg, int8 rm, int8 controlFlags, int8 sib, int64 disp, int8 dispSize, int64 imm, int8 immSize )
    //DBI_ON ;
    Compile_CalcWrite_Instruction_X64 ( 0, opCode, mod, code, rm, REX_B | MODRM_B | IMM_B | DISP_B, 0, disp, 0, imm, iSize ) ;
    //DBI_OFF ;
    //_Compile_InstructionX86 ( opCode, mod, code, rm, IMM_B, 0, disp, imm, 0, iSize ) ;
}

void
_Compile_Op_Group1_Reg_To_Reg ( int64 code, int8 dstReg, int64 srcReg )
{
    _Compile_X_Group1 ( code, 2, REG, srcReg, dstReg, 0, 0, CELL ) ;
}

// opCode group 1 - 0x80-0x83 : ADD OR ADC SBB AND_OPCODE SUB XOR CMP
// to reg ( toRm == 0 ) is default
// toRm flag is like a mod field but is coded as part of opCode
// toRm flag = 0 => ( dst is reg, src is rm ) is default - reg  - like mod 3
// toRm flag = 1 => ( dst is rm, src is reg )             [reg] - like mod 0 // check this ??


// TEST XCHG

void
_Compile_Op_Special_Reg_To_Reg ( int64 code, int8 rm, int8 reg ) // toRm = 0 => ( dst is reg, src is rm ) is default
{
    int64 opCode ;
    if ( code == TEST_R_TO_R )
        opCode = 0x85 ;
    else if ( code == XCHG_R_TO_R )
        opCode = 0x87 ;
    else
        CfrTil_Exception (MACHINE_CODE_ERROR, 0, ABORT ) ;
    // _Compile_InstructionX86 ( opCode, mod, reg, rm, modRmImmDispFlag, sib, disp, imm, immSize )
    Compile_CalcWrite_Instruction_X64 ( 0, opCode, 3, reg, rm, REX_B | MODRM_B, 0, 0, 0, 0, 0 ) ;
}

// Group2 : 0pcodes C0-C3/D0-D3
// ROL RLR RCL RCR SHL SHR SAL SAR
// mod := REG | MEM

void
_Compile_Group2 ( int64 mod, int8 regOpCode, int8 rm, int8 sib, int64 disp, int64 imm )
{
    //cell opCode = 0xc1 ; // rm32 imm8
    // _Compile_InstructionX86 ( opCode, mod, reg, rm, modRmImmDispFlag, sib, disp, imm, immSize )
    Compile_CalcWrite_Instruction_X64 ( 0, 0xc1, mod, regOpCode, rm, REX_B | MODRM_B, sib, disp, 0, imm, BYTE ) ;
}

void
_Compile_Group2_CL ( int64 mod, int8 regOpCode, int8 rm, int8 sib, int64 disp )
{
    // _Compile_InstructionX86 ( opCode, mod, reg, rm, modRmImmDispFlag, sib, disp, imm, immSize )
    Compile_CalcWrite_Instruction_X64 ( 0, 0xd3, mod, regOpCode, rm, REX_B | MODRM_B | ( disp ? DISP_B : 0 ), sib, disp, 0, 0, 0 ) ;
}

// some Group 3 code is UNTESTED
// opCodes TEST NOT NEG MUL DIV IMUL IDIV // group 3 - F6-F7
// s and w bits of the x86 opCode : w seems to refer to word and is still used probably for historic and traditional reasons
// note : the opReg - operand register parameter is always used for the rm field of the resulting machine code
// operating with either a direct register, or indirect memory operand on a immediate operand
// mod := RegOrMem - direction is REG or MEM
// 'size' is operand size

void
_Compile_Group3 ( int64 code, int64 mod, int8 rm, int8 controlFlags, int8 sib, int64 disp, int64 imm, int64 size )
{
    // _Compile_InstructionX86 ( opCode, mod, reg, rm, modRmImmDispFlag, sib, disp, imm, immSize )
    Compile_CalcWrite_Instruction_X64 ( 0, 0xf7, mod, code, rm, REX_W_B | MODRM_B | controlFlags, sib, disp, 0, imm, size ) ;
}

// mul reg with imm to rm

void
_Compile_IMULI ( int64 mod, int8 reg, int8 rm, int8 sib, int64 disp, int64 imm, int64 size )
{
    int64 opCode = 0x69 ;
    if ( imm < 256 )
    {
        opCode |= 2 ;
        size = 0 ;
    }
    // _Compile_InstructionX86 ( opCode, mod, reg, rm, modRmImmDispFlag, sib, disp, imm, immSize )
    Compile_CalcWrite_Instruction_X64 ( 0, opCode, mod, reg, rm, REX_B | MODRM_B | IMM_B, sib, disp, 0, imm, size ) ; //size ) ;
}

void
_Compile_IMUL ( int64 mod, int8 reg, int8 rm, int8 controlFlags, int8 sib, int64 disp )
{
    int8 rex = Calculate_Rex ( reg, rm, 0 ) ;
    //if ( rex ) _Compile_Int8 ( rex ) ;
    //_Compile_Int8 ( 0x0f ) ;
    int8 modRm = CalculateModRmByte ( mod, reg, rm, sib, disp ) ;
    // _Compile_InstructionX86 ( opCode, mod, reg, rm, modRmImmDispFlag, sib, disp, imm, immSize )
    //_Compile_InstructionX86 ( 0xaf, mod, reg, rm, REX_B | MODRM_B, sib, disp, 0, 0, 0 ) ;
    //_Compile_InstructionX64 ( int8 rex, int8 opCode, int8 modRm, int64 controlFlags, int8 sib, int64 disp, int8 dispSize, int64 imm, int8 immSize ) ;
    _Compile_Write_Instruction_X64 ( rex, 0x0faf, modRm, controlFlags, sib, disp, 0, 0, 0 ) ;
}

void
_Compile_Test ( int64 mod, int8 reg, int8 rm, int8 controlFlags, int64 disp, int64 imm )
{
    // _Compile_InstructionX86 ( opCode, mod, reg, rm, modRmImmDispFlag, sib, disp, imm, immSize )
    Compile_CalcWrite_Instruction_X64 ( 0, 0xf7, mod, reg, rm, REX_B | MODRM_B | controlFlags, 0, disp, 0, imm, 0 ) ; //??
}

// inc/dec/push/pop

void
_Compile_Group5 ( int64 code, int64 mod, int8 rm, int8 sib, int64 disp, int64 size )
{
    // _Compile_InstructionX86 ( opCode, mod, reg, rm, modRmImmDispFlag, sib, disp, imm, immSize )
    Compile_CalcWrite_Instruction_X64 ( 0, 0xff, mod, code, rm, REX_B | MODRM_B | DISP_B, sib, disp, size, 0, 0 ) ;
}

// intel syntax : opcode dst, src
// mov reg to mem or mem to reg
// note the order of the operands match intel syntax with dst always before src

void
_Compile_Move_Reg_To_Rm ( int8 dstRmReg, int8 srcReg, int64 rmRegDisp )
{
    _Compile_Move ( 0, MEM, srcReg, dstRmReg, 0, rmRegDisp ) ;
}

// intel syntax : opcode dst, src
// mov reg to mem or mem to reg
// note the order of the operands match intel syntax with dst always before src

void
_Compile_Move_Rm_To_Reg ( int8 dstReg, int8 srcRmReg, int64 disp )
{
    _Compile_Move ( 0, REG, dstReg, srcRmReg, 0, disp ) ;
}

// intel syntax : opcode dst, src
// mov reg to mem or mem to reg
// note the order of the operands match intel syntax with dst always before src

void
_Compile_Move_Reg_To_Reg ( int8 dstReg, int64 srcReg )
{
    // _Compile_InstructionX86 ( opCode, mod, reg, rm, modRmImmDispFlag, sib, disp, imm, immSize )
    Compile_CalcWrite_Instruction_X64 ( 0, 0x8b, 3, dstReg, srcReg, REX_B | MODRM_B, 0, 0, 0, 0, 0 ) ;
}

// direction : MEM or REG
// reg : is address in case of MEMORY else it is the register (reg) value

void
_Compile_MoveImm ( int8 direction, int8 rm, int8 controlFlags, int8 sib, int64 disp, int64 imm, int8 immSize )
{
    int8 opCode = 0xc6, reg = 0, mod = direction ;
    if ( ( immSize == 8 ) || ( imm > 0xffffffff ) )
    {
        if ( direction == MEM )
        {
            // there is no x64 instruction to move imm64 to mem directly
            int8 thruReg = THRU_REG ;
            _Compile_MoveImm_To_Reg ( thruReg, imm, immSize ) ; // thruReg : R8D : needs to be a parameter
            _Compile_Move_Reg_To_Rm ( rm, thruReg, disp ) ;
        }
        else
        {
            int8 rex = 0x48 + ( rm > 7 ) ; //( ( rm >= 8 ) ? rm - 8 : rm ) ; ;
            int8 opCode = 0xb8 + ( rm & 7 ) ; //( ( rm >= 8 ) ? rm - 8 : rm ) ;
            //_Compile_InstructionX64 ( rex, opCode, modRm, controlFlags, sib, disp, imm, operandSize ) ;
            _Compile_Write_Instruction_X64 ( rex, opCode, 0, IMM_B, 0, 0, 0, imm, immSize ) ;
        }
    }
    else
    {
        if ( immSize > BYTE ) opCode |= 1 ;
        if ( direction == REG ) mod = 3 ;
        else
        {
            if ( disp == 0 ) mod = 0 ;
            else if ( disp >= 0x100 ) mod = 2 ;
            else mod = 1 ;
        }
        Compile_CalcWrite_Instruction_X64 ( 0, opCode, mod, reg, rm, controlFlags, sib, disp, 0, imm, immSize ) ;
    }
}

void
_Compile_MoveImm_To_Reg ( int8 reg, int64 imm, int8 immSize )
{
#if 1    
    _Compile_MoveImm ( REG, reg, IMM_B | REX_B | MODRM_B, 0, 0, imm, immSize ) ;
#else    
    Compile_Move ( TO_REG, 0, 0, reg, 0, IMM_B | REX_B | MODRM_B, 0, 0, imm, immSize ) ;
#endif        
}

// _Compile_MoveImm_To_Mem ( int8 reg, int64 imm, int8 iSize )

void
_Compile_MoveImm_To_Mem ( int8 rm, int64 imm, int8 immSize )
{
#if 1   
    _Compile_MoveImm ( MEM, rm, IMM_B | REX_B | MODRM_B, 0, 0, imm, immSize ) ;
#else    
    //Compile_Move ( int8 dst, int8 rex, int8 mod, int8 reg, int8 rm, int16 controlFlags, int64 disp, int8 dispSize, int64 imm, int8 immSize )
    //DBI_ON ;
    Compile_Move ( TO_MEM, 0, 0, 0, rm, IMM_B | REX_B | MODRM_B, 0, 0, imm, immSize ) ;
    //DBI_OFF ;
#endif    

}

void
_Compile_MoveMemValue_To_Reg ( int8 reg, byte * address, int8 iSize )
{
    _Compile_MoveImm_To_Reg ( reg, ( int64 ) address, iSize ) ;
    _Compile_Move_Rm_To_Reg ( reg, reg, 0 ) ;
}

void
_Compile_MoveMemValue_ToReg_ThruReg ( int8 reg, byte * address, int8 iSize, int8 thruReg )
{
    _Compile_MoveImm_To_Reg ( thruReg, ( int64 ) address, iSize ) ;
    _Compile_Move_Rm_To_Reg ( reg, thruReg, 0 ) ;
}

void
_Compile_MoveImm_ToReg_ThruReg ( int8 reg, uint64 value, int8 iSize, int8 thruReg )
{
    _Compile_MoveImm_To_Reg ( thruReg, value, iSize ) ;
    _Compile_Move_Reg_To_Reg ( reg, thruReg ) ;
}

void
_Compile_MoveReg_ToAddress_ThruReg ( int8 reg, byte * address, int8 thruReg )
{
    _Compile_MoveImm_To_Reg ( thruReg, ( int64 ) address, CELL_SIZE ) ;
    _Compile_Move_Reg_To_Rm ( thruReg, reg, 0 ) ;
}

// the basic move instruction
// mov reg to mem or mem to reg ( but not reg to reg or move immediate )
// note this function uses the bit order of operands in the mod byte : (mod) reg r/m
// not the intel syntax as with _CompileMoveRegToMem _CompileMoveMemToReg
// the 'rmReg' parameter must always refer to a memory location; 'reg' refers to the register, either to or from which we move mem

// controlFlags : bits ::  3       2     1      0         D D - - I D S M
//                       imm    disp   sib    modRm      mod               (mod) only in move insn
//                     imm=8, disp=4 sib=2  mod/Rm=1

void
_Compile_Move ( int8 rex, int8 mod, int8 reg, int8 rm, int8 sib, int64 disp )
{
    int64 opCode = 0x89 ;
    if ( mod == REG ) opCode |= 2 ; // 0x8b ; // 0x89 |= 2 ; // d : direction bit = 'bit 1'
    if ( ! disp ) mod = 0 ;
    else if ( disp <= 0xff ) mod = 1 ;
    else if ( disp >= 0x100 ) mod = 2 ;
    Compile_CalcWrite_Instruction_X64 ( rex, opCode, mod, reg, rm, REX_B | MODRM_B | ( disp ? DISP_B : 0 ) | ( sib ? SIB_B : 0 ), sib, disp, 0, 0, 0 ) ;
}

#if 0 //NEW_MOVE
// REX : 0100 WRXB

void
Compile_Move ( int8 dst, int8 rex, int8 mod, int8 reg, int8 rm, int16 controlFlags, int64 disp, int8 dispSize, int64 imm, int8 immSize )
{
    int8 opCode ;
#if 0    
    if ( imm || immSize )
    {
        if ( dst == MEM )
        {
            // there is no x64 instruction to move imm64 to mem directly
            int8 thruReg = THRU_REG ;
            _Compile_MoveImm_To_Reg ( thruReg, imm, immSize ) ; // thruReg : R11D : needs to be a parameter
            _Compile_Move_Reg_To_Rm ( rm, thruReg, disp ) ;
        }
        else
        {
            opCode = 0xc6 ;
            if ( immSize & ( DOUBLE | QUAD ) ) opCode |= 1 ;
            if ( immSize & QUAD ) rex |= 0x40 ;
            int8 rex = 0x48 + ( rm > 7 ) ; //( ( rm >= 8 ) ? rm - 8 : rm ) ; ;
            int8 opCode = 0xb8 + ( rm & 7 ) ; //( ( rm >= 8 ) ? rm - 8 : rm ) ;
            //_Compile_InstructionX64 ( rex, opCode, modRm, controlFlags, sib, disp, imm, operandSize ) ;
            _Compile_Write_Instruction_X64 ( rex, opCode, 0, IMM_B, 0, 0, 0, imm, immSize ) ;
        }
    }
#else
    if ( imm || immSize )
    {
        if ( ( immSize == 8 ) || ( imm > 0xffffffff ) )
        {
            if ( dst == TO_MEM )
            {
                // there is no x64 instruction to move imm64 to mem directly
                int8 thruReg = THRU_REG ;
                _Compile_MoveImm_To_Reg ( thruReg, imm, immSize ) ; // thruReg : R11D : needs to be a parameter
                _Compile_Move_Reg_To_Rm ( rm, thruReg, disp ) ;
            }
            else
            {
                int8 rex = 0x48 + ( rm > 7 ) ; //( ( rm >= 8 ) ? rm - 8 : rm ) ; ;
                int8 opCode = 0xb8 + ( rm & 7 ) ; //( ( rm >= 8 ) ? rm - 8 : rm ) ;
                //_Compile_InstructionX64 ( rex, opCode, modRm, controlFlags, sib, disp, imm, operandSize ) ;
                _Compile_Write_Instruction_X64 ( rex, opCode, 0, IMM_B, 0, 0, 0, imm, immSize ) ;
            }
            return ;
        }
        opCode = 0xc6 ;
        if ( immSize & ( DOUBLE | QUAD ) ) opCode |= 1 ;
        if ( immSize & QUAD ) rex |= 0x40 ;
    }
#endif
    else // from reg/mem to reg/mem
    {
        opCode = 0x88 ;
        if ( dst == TO_REG ) opCode |= 2 ;
        if ( controlFlags & ( DOUBLE_B | QUAD_B ) ) opCode |= 1 ;
        if ( ! disp ) mod = 0 ;
        else if ( disp <= 0xff ) mod = 1 ;
        else if ( disp >= 0x100 ) mod = 2 ;
        if ( dst == TO_REG ) mod = 3 ;
    }
    //_Compile_InstructionX86 ( rex, opCode, mod, reg, rm, REX_B | MODRM_B | ( disp ? DISP_B : 0 ) | ( sib ? SIB_B : 0 ), sib, disp, dispSize, imm, immSize ) ;
    //Compile_InstructionX64_NoSib ( rex, opCode, mod, reg, rm, controlFlags, disp, dispSize, imm, immSize ) ;
    //_Compile_InstructionX64 ( rex, opCode, modRm, controlFlags, sib, disp, dispSize, imm, immSize ) ;
    Compile_CalcWrite_Instruction_X64 ( rex, opCode, mod, reg, rm, controlFlags, 0, disp, dispSize, imm, immSize ) ;
}

#endif

void
Compile_Move_WithSib ( int8 rex, int8 mod, int8 reg, int8 rm, int8 controlFlags, int8 scale, int8 index, int8 base )
{
    rex = _Calculate_Rex_With_Sib ( reg, controlFlags & ( SCALE_8 | SCALE_4 | SCALE_1 ), index, base, controlFlags & ( REX_W_B ) ) ;
    _Compile_Move ( rex, mod, reg, rm, CalculateSib ( scale, index, base ), 0 ) ; // move ACC, [DSP + ACC * 4 ] ; but remember eax is now a negative number
}

byte *
Calculate_Address_FromOffset_ForCallOrJump ( byte * address )
{
    byte * iaddress = 0 ;
    int64 offset ;
    if ( ( * address == JMPI32 ) || ( * address == CALLI32 ) )
    {
        offset = * ( ( int32 * ) ( address + 1 ) ) ;
        iaddress = address + offset + 1 + INT32_SIZE ;
    }
    else if ( ( ( * address == 0x0f ) && ( ( * ( address + 1 ) >> 4 ) == 0x8 ) ) )
    {
        offset = * ( ( int32 * ) ( address + 2 ) ) ;
        iaddress = address + offset + 2 + INT32_SIZE ;
    }
    else if ( ( ( * ( uint16* ) address ) == 0xff48 ) && ( *( address + 2 ) == 0xd0 ) )
    {
        iaddress = ( byte* ) ( * ( ( uint64* ) ( address - CELL ) ) ) ; // 3 : sizeof x64 call insn 
    }
    return iaddress ;
}


// compileAtAddress is the address of the offset to be compiled
// for compileAtAddress of the disp : where the space has *already* been allocated
// call 32BitOffset ; <- intel call instruction format
// endOfCallingInstructionAddress + disp = jmpToAddr
// endOfCallingInstructionAddress = compileAtAddress + 4 ; for ! 32 bit disp only !
// 		-> disp = jmpToAddr - compileAtAddress - 4

int32
_CalculateOffsetForCallOrJump ( byte * compileAtAddress, byte * jmpToAddr, int8 offsetSize )
{
    //int32 offset = ( jmpToAddr - ( compileAtAddress + 4 ) ) ; // 4 sizeof offset //call/jmp insn x66 mode //sizeof (int64 ) ) ; // we have to go back the instruction size to get to the start of the insn 
    int32 offset = ( jmpToAddr - ( compileAtAddress + offsetSize ) ) ; // operandSize sizeof offset //call/jmp insn x64/x86 mode //sizeof (cell) ) ; // we have to go back the instruction size to get to the start of the insn 
    //int32 offset = ( jmpToAddr - ( compileAtAddress + CELL_SIZE ) ) ; // operandSize sizeof offset //call/jmp insn x64/x86 mode //sizeof (cell) ) ; // we have to go back the instruction size to get to the start of the insn 
    return offset ;
}

void
_SetOffsetForCallOrJump ( byte * compileAtAddress, byte * jmpToAddr )
{
    int32 offset = _CalculateOffsetForCallOrJump ( compileAtAddress, jmpToAddr, INT32_SIZE ) ;
    * ( ( int32* ) compileAtAddress ) = offset ;
}

void
_Compile_JumpToAddress ( byte * jmpToAddr ) // runtime
{
#if 1
    if ( jmpToAddr != ( Here + 5 ) ) // optimization : don't need to jump to the next instruction
    {
        int32 disp = _CalculateOffsetForCallOrJump ( Here + 1, jmpToAddr, INT32_SIZE ) ;
        // _Compile_InstructionX86 ( opCode, mod, reg, rm, modRmImmDispFlag, sib, disp, imm, immSize )
        Compile_CalcWrite_Instruction_X64 ( 0, 0xe9, 0, 0, 0, DISP_B, 0, disp, INT32_SIZE, 0, 0 ) ; // with jmp instruction : disp is compiled an immediate offset
    }
#else
    _Compile_MoveImm_To_R8 ( jumpToAddr ) ;
    _Compile_Group5 ( JMP, 0, 0, 0, 0 ) ;
#endif
}

void
_Compile_JumpToReg ( int8 reg ) // runtime
{
    _Compile_Group5 ( JMP, 0, reg, 0, 0, 0 ) ;
}

void
_Compile_UninitializedJumpEqualZero ( )
{
    Compile_JCC ( Z, ZERO_TTT, 0 ) ;
}

void
_Compile_UninitializedJmpOrCall ( int8 jmpOrCall ) // runtime
{
    Compile_CalcWrite_Instruction_X64 ( 0, jmpOrCall, 0, 0, 0, DISP_B, 0, 0, INT32_SIZE, 0, 0 ) ;
}

void
_Compile_JumpWithOffset ( int64 disp ) // runtime
{
    Compile_CalcWrite_Instruction_X64 ( 0, JMPI32, 0, 0, 0, DISP_B, 0, disp, INT32_SIZE, 0, 0 ) ;
}

void
_Compile_UninitializedCall ( ) // runtime
{
    _Compile_UninitializedJmpOrCall ( CALLI32 ) ;
}

void
_Compile_UninitializedJump ( ) // runtime
{
    _Compile_UninitializedJmpOrCall ( JMPI32 ) ;
}

// JE, JNE, ... see machineCode.h

void
_Compile_JCC ( int64 negFlag, int64 ttt, uint64 disp )
{
#define dbgON_10 1
#if dbgON_10    
    d1 ( byte * here = Here ) ;
#endif    
    _Compile_Int8 ( 0xf ) ; // little endian ordering
    _Compile_Int8 ( 0x8 << 4 | ttt << 1 | negFlag ) ; // little endian ordering
    _Compile_Int32 ( disp ) ;
#if dbgON_10    
    if ( DBI )
    {
        d1 ( _Printf ( ( byte* ) "\n_Compile_JCC :" ) ) ;
        d1 ( Debugger_UdisOneInstruction ( _Debugger_, here, ( byte* ) "", ( byte* ) "" ) ; ) ;
    } ;
#endif    
}

void
Compile_JCC ( int64 negFlag, int64 ttt, byte * jmpToAddr )
{
    uint64 disp ;
    if ( jmpToAddr )
    {
        disp = _CalculateOffsetForCallOrJump ( Here + 2, jmpToAddr, INT32_SIZE ) ;
    }
    else disp = 0 ; // allow this function to be used to have a delayed compile of the actual address
    _Compile_JCC ( negFlag, ttt, disp ) ;
}

void
_Compile_CallThruMem ( int8 reg )
{
    _Compile_Group5 ( CALL, MEM, reg, 0, 0, 0 ) ;
}

void
_Compile_CallThruReg ( int8 reg )
{
    _Compile_Group5 ( CALL, REG, reg, 0, 0, 0 ) ;
}

void
Compile_Call_ToAddressThruReg ( byte * address, int8 reg )
{
    _Compile_MoveImm_To_Reg ( reg, ( int64 ) address, CELL ) ;
    _Compile_CallThruReg ( reg ) ;
}

void
_Compile_Call_ThruReg ( byte * callAddr, int8 reg )
{
    Compile_Call_ToAddressThruReg ( callAddr, reg ) ; // x64
}

void
_Compile_Call ( byte * callAddr )
{
    _Compile_Call_ThruReg ( callAddr, ACC ) ;
}

void
Compile_Call ( byte * callAddr )
{
#if 0    
    Word * word = Word_GetFromCodeAddress ( callAddr ) ;
    if ( word && ( ! ( word->CAttribute & CPRIMITIVE ) ) )
    {
        _Compile_Call_CfrTilWord ( callAddr ) ;
    }
    else
#endif
    {
        //DBI_ON ;
        _Compile_Call_ThruReg ( callAddr, ACC ) ;
        //DBI_OFF ;
    }
}

void
_Compile_Call_NoOptimize ( byte * callAddr )
{
    Compile_Call ( callAddr ) ;
}

void
_Compile_PushReg ( int8 reg )
{
    // only EAX ECX EDX EBX : 0 - 4
#define dbgON_5 0
#if dbgON_5    
    d1 ( byte * here = Here ) ;
#endif   
    if ( reg > 7 ) _Compile_Int8 ( 0x40 + ( ( reg > 7 ) ? 1 : 0 ) ) ;
    _Compile_Int8 ( 0x50 + ( reg & 0x7 ) ) ;
#if dbgON_5     
    d1 ( _Printf ( ( byte* ) "\n_Compile_PushReg :" ) ) ;
    d1 ( Debugger_UdisOneInstruction ( _Debugger_, here, ( byte* ) "", ( byte* ) "" ) ; ) ;
#endif
}

// pop from the C esp based stack with the 'pop' instruction

void
_Compile_PopToReg ( int8 reg )
{
    // only EAX ECX EDX EBX : 0 - 4
#if 0    
    _Compile_Int8 ( 0x58 + reg ) ;
#else
#define dbgON_7 0
#if dbgON_7    
    d1 ( byte * here = Here ) ;
#endif    
    if ( reg > 7 ) _Compile_Int8 ( 0x40 + ( ( reg > 7 ) ? 1 : 0 ) ) ;
    _Compile_Int8 ( 0x58 + ( reg & 0x7 ) ) ;
#if dbgON_7     
    d1 ( _Printf ( ( byte* ) "\n_Compile_PopToReg :" ) ) ;
    d1 ( Debugger_UdisOneInstruction ( _Debugger_, here, ( byte* ) "", ( byte* ) "" ) ; ) ;
#endif
#endif    
}

void
_Compile_PopFD ( )
{
    //Compile_Int8 ( 0x48 ) ;
#define dbgON_8 0   
#if dbgON_8     
    d1 ( byte * here = Here ) ;
#endif    
    //Compile_Int8 ( 0x40 ) ;
    _Compile_Int8 ( 0x9d ) ;
#if dbgON_8     
    d1 ( _Printf ( ( byte* ) "\n_Compile_PopFD :" ) ) ;
    d1 ( Debugger_UdisOneInstruction ( _Debugger_, here, ( byte* ) "", ( byte* ) "" ) ; ) ;
#endif
}

void
_Compile_PushFD ( )
{
    //Compile_Int8 ( 0x48 ) ;
#define dbgON_9 0   
#if dbgON_9     
    d1 ( byte * here = Here ) ;
#endif    
    //Compile_Int8 ( 0x40 ) ;
    _Compile_Int8 ( 0x9c ) ;
#if dbgON_9     
    d1 ( _Printf ( ( byte* ) "\n_Compile_PushFD :" ) ) ;
    d1 ( Debugger_UdisOneInstruction ( _Debugger_, here, ( byte* ) "", ( byte* ) "" ) ; ) ;
#endif
}

void
_Compile_INT80 ( )
{
    _Compile_Int8 ( 0xcd ) ;
    _Compile_Int8 ( 0x80 ) ;
}

void
_Compile_Noop ( )
{
    _Compile_Int8 ( 0x90 ) ;
}

// Zero eXtend from byte to cell

void
_Compile_MOVZX_REG ( int8 reg )
{
#define dbgON_12 1
#if dbgON_12    
    d1 ( byte * here = Here ) ;
#endif    
    //Compile_Int8 ( ( byte ) 0x40 ) ;
    int8 rex = Calculate_Rex ( reg, reg, 1 ) ; //( immSize == 8 ) || ( controlFlags & REX_B ) ) ;
    _Compile_Int8 ( rex ) ;
    _Compile_Int8 ( ( byte ) 0x0f ) ;
    _Compile_Int8 ( 0xb6 ) ;
    _Compile_Int8 ( CalculateModRmByte ( REG, reg, reg, 0, 0 ) ) ;
#if dbgON_12    
    d1 ( if ( DBI )
    {
        d1 ( _Printf ( ( byte* ) "\n_Compile_MOVZX_REG :" ) ) ;
            d1 ( Debugger_UdisOneInstruction ( _Debugger_, here, ( byte* ) "", ( byte* ) "" ) ; ) ;
    } ) ;
#endif    
}

// inc/dec only ( not call or push which are also group 5 - cf : sandpile.org )

void
Compile_X_Group5 ( Compiler * compiler, int64 op )
{
    int64 optFlag = CheckOptimize ( compiler, 3 ) ;
    //Word *one = Compiler_WordStack ( - 1 ) ; // assumes two values ( n m ) on the DSP stack 
    Word *one = Compiler_WordList ( 1 ) ; // assumes two values ( n m ) on the DSP stack 
    if ( optFlag & OPTIMIZE_DONE ) return ;
    else if ( optFlag )
    {
        if ( compiler->optInfo->OptimizeFlag & OPTIMIZE_IMM )
        {
            _Compile_MoveImm_To_Reg ( ACC, compiler->optInfo->Optimize_Imm, CELL ) ;
            compiler->optInfo->Optimize_Mod = REG ;
            compiler->optInfo->Optimize_Rm = ACC ;
        }
        _Compile_Group5 ( op, compiler->optInfo->Optimize_Mod, compiler->optInfo->Optimize_Rm, 0, compiler->optInfo->Optimize_Disp, 0 ) ;
    }
    else if ( one && one->CAttribute & ( PARAMETER_VARIABLE | LOCAL_VARIABLE | NAMESPACE_VARIABLE ) ) // *( ( cell* ) ( TOS ) ) += 1 ;
    {
        SetHere ( one->Coding ) ;
        _Compile_GetVarLitObj_RValue_To_Reg ( one, ACC ) ;
        //_Compile_Group5 ( int64 code, int64 mod, int8 rm, int8 sib, int64 disp, int64 size )
        _Compile_Group5 ( op, REG, ACC, 0, 0, CELL_SIZE ) ;
        // ++ == += :: -- == -= so :
        _Compile_SetVarLitObj_With_Reg ( one, ACC, OP_REG ) ;
    }
    else
    {
        // assume rvalue on stack
        //DBI_ON ;
        _Compile_Group5 ( op, MEM, DSP, 0, 0, 0 ) ;
    }
    _BlockInfo_Setup_BI_tttn ( _Context_->Compiler0, ZERO_TTT, NZ, 3 ) ; // ?? // not less than 0 == greater than 0
    //DBI_OFF ;
}

// X variable op compile for group 1 opCodes : +/-/and/or/xor - ia32 

void
_Compile_optInfo_X_Group1 ( Compiler * compiler, int64 op )
{
    Set_SCA ( 0 ) ;
    if ( compiler->optInfo->OptimizeFlag & OPTIMIZE_IMM )
    {
        // Compile_SUBI( mod, operandReg, offset, immediateData, size )
        _Compile_X_Group1_Immediate ( op, compiler->optInfo->Optimize_Mod,
            compiler->optInfo->Optimize_Rm, compiler->optInfo->Optimize_Disp,
            compiler->optInfo->Optimize_Imm, 0 ) ;
    }
    else
    {
        // _Compile_Group1 ( int64 code, int64 toRegOrMem, int64 mod, int8 reg, int8 rm, int8 sib, int64 disp, int64 osize )
        _Compile_X_Group1 ( op, compiler->optInfo->Optimize_Dest_RegOrMem, compiler->optInfo->Optimize_Mod,
            compiler->optInfo->Optimize_Reg, compiler->optInfo->Optimize_Rm, 0,
            compiler->optInfo->Optimize_Disp, CELL_SIZE ) ;
    }
}

// subtract second operand from first and store result in first

// X variable op compile for group 1 opCodes : +/-/and/or/xor - ia32 

void
Compile_X_Group1 ( Compiler * compiler, int64 op, int64 ttt, int64 n )
{
    int64 optFlag = CheckOptimize ( compiler, 5 ) ;
    if ( optFlag == OPTIMIZE_DONE ) return ;
    else if ( optFlag )
    {
        //DBI ;
        _Compile_optInfo_X_Group1 ( compiler, op ) ;
        _BlockInfo_Setup_BI_tttn ( _Context_->Compiler0, ttt, n, 3 ) ; // not less than 0 == greater than 0
        if ( compiler->optInfo->Optimize_Rm != DSP ) // if the result is to a reg and not tos
        {
            //_Compile_Move_Reg_To_StackN ( DSP, 0, compiler->optInfo->Optimize_Reg ) ;
            _Word_CompileAndRecord_PushReg ( Compiler_WordList ( 0 ), compiler->optInfo->Optimize_Reg ) ; //compiler->optInfo->Optimize_Rm ) ; // 0 : ?!? should be the exact variable 
        }
        //else Compile_SUBI ( REG, DSP, 0, CELL, 0 ) ;
        //DBI_OFF ;
    }
    else
    {
        Compile_Pop_To_Acc ( DSP ) ;
        //_Compile_X_Group1 ( int64 code, int64 toRegOrMem, int64 mod, int8 reg, int8 rm, int8 sib, int64 disp, int64 osize )
        _Compile_X_Group1 ( op, MEM, MEM, ACC, DSP, 0, 0, CELL_SIZE ) ; // result is on TOS
        _BlockInfo_Setup_BI_tttn ( _Context_->Compiler0, ttt, n, 3 ) ; // not less than 0 == greater than 0
        //_Word_CompileAndRecord_PushR8 ( Compiler_WordList ( 0 ) ) ;
    }
}

// first part of "combinator tookit"

void
_Compile_Jcc ( int64 bindex, int64 overwriteFlag, int64 nz, int64 ttt )
{
    BlockInfo *bi = ( BlockInfo * ) _Stack_Pick ( _Context_->Compiler0->CombinatorBlockInfoStack, bindex ) ; // -1 : remember - stack is zero based ; stack[0] is top
    if ( Compile_CheckReConfigureLogicInBlock ( bi, overwriteFlag ) )
    {
        //_Compile_TEST_Reg_To_Reg ( R8, R8 ) ;
        Compile_JCC ( ! bi->NegFlag, bi->Ttt, 0 ) ; // we do need to store and get this logic set by various conditions by the compiler : _Compile_SET_tttn_REG
    }
    else
    {
        Compile_GetLogicFromTOS ( bi ) ; // after cmp we test our condition with setcc. if cc is true a 1 will be sign extended in R8 and pushed on the stack 
        // then in the non optimized|inline case we cmp the TOS with 0. If ZERO (zf is 1) we know the test was false (for IF), if N(ot) ZERO we know it was true 
        // (for IF). So, in the non optimized|inline case if ZERO we jmp if N(ot) ZERO we continue. In the optimized|inline case we check result of first cmp; if jcc sees
        // not true (with IF that means jcc N(ot) ZERO) we jmp and if true (with IF that means jcc ZERO) we continue. 
        // nb. without optimize|inline there is another cmp in Compile_GetLogicFromTOS which reverse the polarity of the logic 
        // ?? an open question ?? i assume it works the same in all cases we are using - exceptions ?? 
        // so adjust ...
        Compile_JCC ( Z, ttt, 0 ) ;
    }
}
#if TURN_DBI_OFF
#undef DBI_ON
#undef DBI_OFF
#define DBI_ON dbion
#define DBI_OFF dbioff
#endif


#if 0

void
Compile_SetRegWithValue ( )
{
    DBI_ON ;
    _Compile_MoveImm ( REG, OP_REG, IMM_B | REX_B | MODRM_B | DISP_B, 0, 0, ( uint64 ) & _CfrTil_->ReturnStack->StackPointer, CELL ) ;
    _Compile_Move_Rm_To_Reg ( CFT_RSP, OP_REG, 0 ) ; //runtime _CfrTil_->ReturnStack->StackPointer to OREG
    //_Compile_Move_Reg_To_Reg ( CFT_RSP, OREG ) ; 
    _Compile_Stack_PopToReg ( DSP, ACC ) ; // TOS is word->Definition 
    _Compile_Stack_Push ( CFT_RSP, ( uint64 ) Here + 20 ) ; // 5: sizeof (jmp 32)
    _Compile_Group5 ( JMP, REG, ACC, 0, 0, 0 ) ;
    _Compile_Move_Reg_To_Rm ( OP_REG, CFT_RSP, 0 ) ;
    DBI_OFF ;
}

uint64 BlockCallAddress ;

void
_Compile_MoveToR8AndCall ( )
{
    _Compile_GetRValue_FromLValue_ToReg ( ACC, ( byte* ) & BlockCallAddress ) ;
    _Compile_CallThruReg ( ACC ) ;
}

void
_Compile_ModRmSibDisplacement ( int8 modRm, int8 modRmImmDispFlag, int8 sib, int64 disp )
{
    if ( modRmImmDispFlag /* & MOD_RM_BIT */ )
        _Compile_Int8 ( modRm ) ;
    if ( sib )
        _Compile_Int8 ( sib ) ; // sib = sib_modRmImmDispFlag if sib_modRmImmDispFlag > 1
    if ( modRmImmDispFlag /* & DISP_BIT */ && disp )
    {
        _Compile_Displacement ( modRm, disp ) ;
    }
    //else if ( disp )
    //    _Compile_Int32 ( disp ) ;
}
int64 *_Dsp_ ;

void
_Compile_Sync_EsiToDsp ( int8 thruReg )
{
    _Compile_Set_CAddress_WithRegValue_ThruReg ( ( byte* ) & _Dsp_, R14, thruReg ) ; // esp //this won't be accurate for the runtime because it is called from C 
}

void
_Compile_Sync_DspToEsi ( )
{
    _Compile_GetRValue_FromLValue_ToReg ( R14, ( byte* ) & _Dsp_ ) ;
}

void
_Compile_PopAD ( )
{
    _Compile_Int8 ( 0x61 ) ;
}

void
_Compile_PushAD ( )
{
    _Compile_Int8 ( 0x60 ) ;
}

void
_Compile_Sahf ( )
{
    _Compile_Int8 ( 0x9e ) ;
}

void
_Compile_Lahf ( )
{
    _Compile_Int8 ( 0x9f ) ;
}

void
_Compile_IRET ( )
{
    _Compile_Int8 ( 0xcf ) ;
}

void
_Compile_INT3 ( )
{
    _Compile_Int8 ( 0xcc ) ;
}

void
_Compile_JmpCall_Using_RStack ( byte * jmpToAddr )
{
    // push rstack here + 5 so RET can jmp back 
    _Compile_MoveImm_To_Reg ( ACC, &Rsp, CELL ) ; // the lvalue of Rsp
    Compile_ADDI ( MEM, ACC, 0, CELL, BYTE ) ; // add 4 to Rsp
    Compile_ADDI ( REG, ACC, 0, CELL, BYTE ) ; // 
    //_Compile_Move_Reg_To_Reg ( int8 dstReg, int64 srcReg ) ;
    _Compile_MoveImm_To_Reg ( OP_REG, Here + x, CELL ) ; // x : number of bytes to the first byte after the jmp instruction
    _Compile_Move_Reg_To_Rm ( ACC, OP_REG, 0 ) ;
    _Compile_JumpToAddress ( byte * jmpToAddr ) ;
}

void
_Compile_Return_Using_RStack ( )
{
    // pop rstack to R8
    //_Compile_JumpToReg ( R8 ) ;
}

void
Compile_Call ( byte * address )
{
#if 1    
    Compile_Call ( address ) ;
#else
    //_Compile_Call ( (int64) address ) ;
    //_Compile_UninitializedCall ( ) ; // runtime
    //SetHere ( Here - 8 ) ;
    //_Compile_Cell ( (int64) address ) ;
    Compile_CalcWrite_Instruction_X64 ( 0, CALLI32, 0, 0, 0, 0, 0, 0, CELL, callOffset, 0 ) ;
#endif    
}

void
_Compile_Move_FromAtMem_ToMem ( int64 dstAddress, int64 srcAddress ) // thruReg == R8
{
    _Compile_Move_AddressValue_To_R8 ( srcAddress ) ;
    _Compile_Move_Rm_To_Reg ( ACC, ACC, 0 ) ;
    _Compile_Move_R8_To_MemoryAddress ( dstAddress ) ;
}

void
_Compile_Call_WithOffset ( int64 offset )
{
#if 0    
    uint64 size ;
    if ( offset < ( ( uint64 ) 1 << 31 ) ) size = DISP_SIZE ;
    else size = CELL ;
    Compile_CalcWrite_Instruction_X64 ( 0, CALLI32, 0, 0, 0, 0, 0, 0, size, offset, 0 ) ;
#else
    ///if ( NamedByteArray_CheckAddress ( _Q_CodeSpace, address ) )
    if ( offset < ( ( uint64 ) 1 << 31 ) ) //NamedByteArray_CheckAddress ( _Q_CodeSpace, address ) )
        //Compile_Call_With32BitDisp ( address ) ;
        Compile_CalcWrite_Instruction_X64 ( 0, CALLI32, 0, 0, 0, 0, 0, 0, DISP_SIZE, offset, 0 ) ;
    else
        Compile_Call_ToAddressThruReg ( address, ACC ) ;
    //_Compile_InstructionX86 ( CALLI32, 0, 0, 0, 0, 0, 0, offset, CELL ) ;
#endif    
}

void
_Compile_Move_AddressValue_To_R8 ( int64 address )
{
    // _Compile_InstructionX86 ( opCode, mod, reg, rm, modRmImmDispFlag, sib, disp, imm, immSize )
    Compile_CalcWrite_Instruction_X64 ( 0, 0xa1, 0, 0, 0, REX_B, 0, address, 0, 0, 0 ) ;
}

void
_Compile_Move_R8_To_MemoryAddress ( int64 address )
{
    // _Compile_InstructionX86 ( opCode, mod, reg, rm, modRmImmDispFlag, sib, disp, imm, immSize )
    Compile_CalcWrite_Instruction_X64 ( 0, 0xa3, 0, 0, 0, REX_B, 0, address, 0, 0, 0 ) ;
}

void
Compile_RspPop_DspPush ( )
{
    _Compile_PopToReg ( ACC ) ; // intel pop is pop esp
    Compile_DataStack_PushR8 ( ) ; // no such op
}
#endif
