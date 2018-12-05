\ RISC-V assembler
\
\ Instruction format:
\
\ rd rs1 rs2 <instr>    R-type
\ rd rs1 imm <instr>    I-type
\ rs2 rs1 a <instr>     S-type
\ rs1 rs2 imm <instr>   SB-type
\ rd a <instr>          jal
\ rd imm <instr>        li
\ <instr>               ecall ebreak fence.i
\ pred succ <instr>     fence
\ a <instr>             j
\ rd rs1 a <instr>      jalr
\ rd rs <instr>         mv
\
\ rounding mode suffixes: rne rtz rdn rup rmm
\ aq/rl suffixes: aq rl
\
\ conditionals: <> = >= <= > < u> u< 0= 0<>

vocabulary assembler    also assembler definitions
base @

: register  ( u | name -- ) <builds  ,  does>  @ 0 ;

\ note: assumes host is little-endian
defer asm@       ' @ is asm@
defer asm!       ' ! is asm!
defer asmhere    ' here is asmhere
defer asmhere!   :noname h ! ; is asmhere!
: asm,  ( x -- ) asmhere asm!  1 cells asmhere + asmhere! ;

0 register x0       1 register x1       2 register x2
3 register x3       4 register x4       5 register x5
6 register x6       7 register x7       8 register x8
9 register x9       10 register x10     11 register x11
12 register x12     13 register x13     14 register x14
15 register x15     16 register x16     17 register x17
18 register x18     19 register x19     20 register x20
21 register x21     22 register x22     23 register x23
24 register x24     25 register x25     26 register x26
27 register x27     28 register x28     29 register x29
30 register x30     31 register x31

0 register f0       1 register f1       2 register f2
3 register f3       4 register f4       5 register f5
6 register f6       7 register f7       8 register f8
9 register f9       10 register f10     11 register f11
12 register f12     13 register f13     14 register f14
15 register f15     16 register f16     17 register f17
18 register f18     19 register f19     20 register f20
21 register f21     22 register f22     23 register f23
24 register f24     25 register f25     26 register f26
27 register f27     28 register f28     29 register f29
30 register f30     31 register f31

1 register ra       2 register sp       3 register gp
4 register tp       5 register t0       6 register t1
7 register t2       8 register s0       8 register fp
9 register s1       10 register a0      11 register a1
12 register a2      13 register a3      14 register a4
15 register a5      16 register a6      17 register a7
18 register s2      19 register s3      20 register s4
21 register s5      22 register s6      23 register s7
24 register s8      25 register s9      26 register s10
27 register s11     28 register t3      29 register t4
30 register t5      31 register t6

: +reg  ( 0 -- ) abort" expected register" ;
: +imm  ( 1 -- ) 0= abort" expected immediate" ;
: rs1  ( r 0 -- u ) +reg  15 lshift ;
: rs2  ( r 0 -- u ) +reg  20 lshift ;
: rs3  ( r 0 -- u ) +reg  27 lshift ;
: rd  ( r 0 -- u ) +reg  7 lshift ;
: immi  ( x 1 -- u ) +imm  20 lshift ;
: imms  ( x 1 -- u ) 
  +imm  dup h# 1f and 7 lshift  swap 20 lshift or ;
: immu  ( x 1 -- u ) +imm  12 lshift ;
: zimm  ( x 1 -- u ) +imm  h# 1f and  15 lshift  ;
: sboff  ( x -- u )
  \ ____ ____ ____ ____ ___A BCCC CCCD DDD_
  \ ACCC CCCX XXXX YYYY YZZZ DDDD BOOO OOOO
  dup h# 1000 and 19 lshift         \ A
  over h# 3e0 and 20 lshift or      \ C
  over h# 1e and 7 lshift or        \ D
  swap h# 800 and 4 rshift or ;     \ B
: ujoff  ( x -- u )
  \ ____ ____ ___A BBBB BBBB CDDD DDDD DDD_
  \ ADDD DDDD DDDC BBBB BBBB XXXX XOOO OOOO
  dup h# 100000 and 11 lshift       \ A
  over h# 7fe and 20 lshift or      \ D
  over h# 800 and 9 lshift or       \ C
  swap h# ff000 and or ;            \ B

: rtype  ( op | name -- )
  <builds  ,  does>  ( rd 0 rs1 0 rs2 0 -- )
  @ >r  rs2 -rot  rs1 or  -rot rd or  r> or asm, ;
: rtype2  ( op | name -- )
  <builds  ,  does>  ( rd 0 rs1 0 -- )
  @ >r  rs1 -rot  rd or  r> or asm, ;
: r4type  ( op | name -- )
  <builds  ,  does>  ( rd 0 rs1 0 rs2 0 rs3 -- )
  @ >r  rs3 -rot  rs2 or -rot  rs1 or  -rot rd or  
  r> or asm, ;
: itype  ( op | name -- )
  <builds  ,  does>  ( rd 0 rs1 0 x 1 -- )
  @ >r  immi -rot  rs1 or  -rot rd or  r> or asm, ;
: stype  ( op | name -- )
  <builds  ,  does>  ( rs2 0 rs1 0 x 1 -- )
  @ >r  imms -rot  rs1 or  -rot rs2 or  r> or asm, ;
: utype  ( op | name -- )
  <builds  ,  does>  ( rd 0 x 1 -- )
  @ >r  immu -rot  rd or  r> or asm, ;
: sbtype  ( op | name -- )
  <builds  ,  does>  ( rs1 0 rs2 0 a -- ) 
  @ >r  asmhere swap - sboff -rot  rs2 or -rot  rs1 or 
  r> or asm, ;
: csrtype  ( op | name -- )
  <builds  ,  does>  ( csr rd 0 rs1 0 -- )
  @ >r  rs1 -rot  rd or  swap 20 lshift  or  r> or asm, ;
: csritype  ( op | name -- )
  <builds  ,  does>  ( csr rd 0 x 1 -- )
  @ >r  zimm -rot  rd or  swap 20 lshift or  r> or asm, ;

hex
37 utype lui        17 utype auipc
0003 itype lb       1003 itype lh
2003 itype lw       4003 itype lbu      5003 itype lhu
0013 itype addi     2013 itype slti     3013 itype sltiu
4013 itype xori     6013 itype ori      7013 itype andi
1013 itype slli     5013 itype srli     40005013 itype srai
2007 itype flw      3007 itype fld
0063 sbtype beq     1063 sbtype bne     4063 sbtype blt
5063 sbtype bge     6063 sbtype bltu    7063 sbtype bgeu
0023 stype sb       1023 stype sh       2023 stype sw
2027 stype fsw      3927 stype fsd
00000033 rtype add      40000033 rtype sub
00001033 rtype sll      00002033 rtype slt  
00003033 rtype sltu     00004033 rtype xor
00005033 rtype srl      40005033 rtype sra
02000033 rtype mul      02001033 rtype mulh
02002033 rtype mulhsu   02003033 rtype mulhu
02004033 rtype div      02005033 rtype divu
02006033 rtype rem      02007033 rtype remu
1800202f rtype sc.w     1c00202f rtype sc.w.aq
1a00202f rtype sc.w.rl  1e99292f rtype sc.w.aq.rl
0800202f rtype amoswap.w    0000202f rtype amoadd.w
2000202f rtype amoxor.w     6000202f rtype amoand.w
4000202f rtype amoor.w      8000202f rtype amomin.w
a000202f rtype amomax.w     c000202f rtype amominu.w
e000202f rtype amomaxu.w    
00000053 rtype fadd.s       08000053 rtype fsub.s 
10000053 rtype fmul.s       18000053 rtype fdiv.s 
58000053 rtype2 fsqrt.s     20000053 rtype fsgnj.s 
20001053 rtype fsgnjn.s     20002053 rtype fsgnjx.s 
28000053 rtype fmin.s       28001053 rtype fmax.s
c0000053 rtype2 fcvt.w.s    e0000053 rtype2 fmv.x.s 
a0002053 rtype feq.s        a0001053 rtype flt.s 
a0000053 rtype fle.s        e0001053 rtype2 fclass.s
d0000053 rtype2 fcvt.s.w    f0000053 rtype2 fmv.s.x
02000053 rtype fadd.d       0a000053 rtype fsub.d 
12000053 rtype fmul.d       1a000053 rtype fdiv.d 
5a000053 rtype2 fsqrt.d     22000053 rtype fsgnj.d 
22001053 rtype fsgnjn.d     22002053 rtype fsgnjx.d 
2a000053 rtype fmin.d       2a001053 rtype fmax.d
c2000053 rtype2 fcvt.w.d    d2000053 rtype fcvt.d.w
00000043 r4type fmadd.s     00000047 r4type fmsub.s 
0000004b r4type fnmsub.s    0000004f r4type fnmadd.s 
02000043 r4type fmadd.d     02000047 r4type fmsub.d 
0200004b r4type fnmsub.d    0200004f r4type fnmadd.d 

1073 csrtype csrrw      2073 csrtype csrrs 
3073 csrtype csrrc
507e csritype csrrwi    6073 csritype csrrsi 
7073 csritype csrrci

: jal  ( rd 0 a -- ) asmhere - ujoff -rot  rd or  6f or asm, ;
: jalr  ( rd 0 rs1 0 a -- )
  >r rs1  -rot rd or  r> asmhere - 1 immi or  0067 or asm, ;
: fcvt.wu.s  ( rd 0 rs1 0 -- ) rs1 -rot  rd or  c0100053 or asm, ;
: fcvt.s.wu  ( rd 0 rs1 0 -- ) rs1 -rot  rd or  d0100053 or asm, ;
: fcvt.wu.d  ( rd 0 rs1 0 -- ) rs1 -rot  rd or  c2100053 or asm, ;
: fcvt.d.wu  ( rd 0 rs1 0 -- ) rs1 -rot  rd or  c2100053 or asm, ;
: fence  ( pred succ -- )
  d# 20 lshift  swap 24 lshift or  0f or asm, ;
: fence.i  100f asm, ;
: lr.w  ( rd 0 rs1 0 -- ) rs1 -rot  rd or 1000202f or asm, ;
: lr.w.aq  ( rd 0 rs1 0 -- ) rs1 -rot  rd or 1400202f or asm, ;
: lr.w.rl  ( rd 0 rs1 0 -- ) rs1 -rot  rd or 1200202f or asm, ;
: lr.w.aq.rl  ( rd 0 rs1 0 -- ) rs1 -rot  rd or 1600202f or asm, ;
: csrr  ( csr rd 1 -- ) x0 2swap csrrs ;
: csrw  ( csr rs 1 -- ) x0 csrrw ;
: csrwi  ( csr x 1 -- ) x0 csrrwi ;
: ecall  00000073 asm, ;        : ebreak  001000073 asm, ;
: #  ( n -- n 1 ) 1 ;
: )  ( r 0 -- r 0 0 1 ) 0 1 ;
: $  ( -- a ) asmhere ;
: mv  ( rd 0 rs 0 -- ) 0 # addi ;
: subi  ( rd 0 rs 0 x 1 -- ) swap negate swap addi ;
: not  ( rd 0 rs 0 -- ) -1 # xori ;
: nop  x0 x0 0 # addi ;
: li  ( rd 0 imm 1 -- )
  +imm  dup d# -2048 d# 2047 within 0=  if
    >r 2dup  r@ d# 12 rshift # lui  2dup r> # ori 
  else  x0 rot # addi  then ;
: suffix  ( u -- ) asmhere 1 cells - dup asm@ rot or swap asm! ;
: rm  ( rm -- ) d# 12 lshift suffix ;
: rne  0 rm ;       : rtz  1 rm ;       : rdn  2 rm ;
: rup  3 rm ;       : rmm  4 rm ;
: aq/rl  ( u -- ) d# 25 lshift suffix ;
: aq  2 aq/rl ;     : rl  1 aq/rl ;
: beqz  ( rs 0 a -- ) x0 rot beq ;
: bnez  ( rs 0 a -- ) x0 rot bne ;
: blez  ( rs 0 a -- ) >r x0 2swap r> bge ;
: bgez  ( rs 0 a -- ) x0 rot bge ;
: bltz  ( rs 0 a -- ) x0 rot blt ;
: bgtz  ( rs 0 a -- ) >r x0 2swap r> blt ;
: j  ( a -- ) x0 rot jal ;
: jr  ( r 0 -- ) x0 2swap asmhere jalr ;      
: ret  x0 x1 0 jalr ;
: neg  x0 2swap sub ;       : seqz  1 # sltiu ;
: snez  x0 2swap sltu ;     : sltz  x0 slt ;
: sgtz  x0 2swap slt ;      : fmv.s  2dup fsgnj.s ;
: fabs.s  2dup fsgnjx.s ;   : fneg.s  2dup fsgnjn.s ;
: fmv.d  2dup fsgnj.d ;     : fabs.d  2dup fsgnjx.d ;
: fneg.d  2dup fsgnjn.d ;

\ comparisons

also forth

variable condop

: toreg  ( x f -- r 0 ) dup  if  x5 2swap li  x5  then ;
: condargs  ( rs1 0 rs2 0 op -- )
  >r  toreg rs2  -rot toreg rs1 or  r> or condop ! ;
: cond  ( op | name -- )
  <builds  ,  does>  ( rs1 0 rs2 0 a -- ) @ condargs ;
: conds ( op | name -- )
  <builds  ,  does>  ( rs1 0 rs2 0 a -- ) @ >r 2swap r> condargs ;

0063 cond <>    1063 cond =     4063 conds <=
4063 cond >=    5063 cond <     5063 conds >
7063 cond u<    7063 conds u>

: 0=  ( x f -- ) x0 1063 condargs ;
: 0<>  ( x f -- ) x0 0063 condargs ;

\ control structures

: patch  ( from to -- ) over - sboff  over asm@ or  swap asm! ;
: %if  ( -- a ) asmhere  condop @ asm, ;
: if  %if ;
: then  ( a -- ) asmhere patch ;
: branch,  ( -- a ) asmhere  63 asm, ;  \ beq x0, x0, ...
: else  ( a1 -- a2 ) branch,  swap asmhere patch ;
: begin  ( -- a ) asmhere ;
: again  ( a -- ) branch,  swap patch ;
: until  ( a -- ) %if  swap patch ;
: while  ( a1 -- a1 a2 ) %if ;

: repeat  ( a1 a2 -- ) 
  asmhere >r  swap sboff 63 or asm,  r> asmhere patch ;

previous

\ because we need `or` above
00006033 rtype or       00007033 rtype and

\ assuming: TOS = x10, SP = x2, RP = x3, AP = x18, W = x19
\ x5: temporary, also used in conditionals

create (next)
  x19 x18 ) lw
  x18 x18 4 # addi
  x5 x19 ) lw
  x5 jr

: next  (next) j ;

previous  also forth definitions  also assembler

: code  ( | name -- ) 
  create  asmhere dup 1 cells - ! ( cfa → paramfield )
  also assembler ;

: end-code  previous ;

only forth definitions
base !
