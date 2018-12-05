\ MIPS assembler
\
\ Instruction format: 
\
\   s t d <instr>       (R)
\   s t <instr>         (R*)
\   d <instr>           (Rd)
\   t imm d <instr>     (R/shift)
\   s imm t <instr>     (I)
\   imm t <instr>       (I*)
\   addr s t <instr>    (I/branch)
\   addr s <instr>      (I/branch*)
\   addr <instr>        (J)
\   s d <instr>         (jalr)
\   s <instr>           (jr)
\
\ # marks immediate
\ $ is a synonym for the current assembly location
\ ) is a synonym for "0 #"
\
\ conditions: >  <  =  <>  0<  0>  0=  0<>  <=  >=  u<  u>
\   • a condition takes either a single register argument (`0=`, `0<>`) 
\     or two arguments, of which one may be immediate.
\
\ conditionals: if  then  else  begin  while  repeat  until
\
\ pseudo instructions:
\
\ noop  move  clear  not  li  mul  rem  b
\
\ set the deferred words `asm@`, `asm!`, `asmhere!` and `ashmere` 
\ to customize target code addressing.


vocabulary assembler    also assembler definitions
base @  hex

: register  ( u | name -- ) <builds  ,  does>  @ 0 ;

0 register $0       0 register $zero
1 register $1       1 register $at
2 register $2       2 register $v0
3 register $3       3 register $v1
4 register $4       4 register $a0
5 register $5       5 register $a1
6 register $6       6 register $a2
7 register $7       7 register $a3
8 register $8       8 register $t0      8 register $a4
9 register $9       9 register $t1      9 register $a5
0a register $10     0a register $t2     0a register $a6
0b register $11     0b register $t3     0b register $a7
0c register $12     0c register $t4
0d register $13     0d register $t5
0e register $14     0e register $t6
0f register $15     0f register $t7
10 register $16     10 register $s0
11 register $17     11 register $s1
12 register $18     12 register $s2
13 register $19     13 register $s3
14 register $20     14 register $s4
15 register $21     15 register $s5
16 register $22     16 register $s6
17 register $23     17 register $s7
18 register $24     18 register $t8
19 register $25     19 register $t9
1a register $26     1a register $k0
1b register $27     1b register $k1
1c register $28     1c register $gp
1d register $29     1d register $sp
1e register $30     1e register $fp
1f register $31     1f register $ra

defer asm@       ' @ is asm@
defer asm!       ' ! is asm!
defer asmhere    ' here is asmhere
defer asmhere!   :noname h ! ; is asmhere!

: asm,  ( x -- ) asmhere asm!  1 cells asmhere + asmhere! ;
: rs  ( r 0 -- u ) abort" expected s register"  d# 21 lshift ;
: rt  ( r 0 -- u ) abort" expected t register"  d# 16 lshift ;
: rd  ( r 0 -- u ) abort" expected d register"  d# 11 lshift ;
: imm16  ( n 1 -- u ) 0= abort" expected 16-bit immediate"  ffff and ;
: off16  ( addr -- u ) asmhere cell+ 2 rshifta - ffff and ;

: shamt  ( n 1 -- u ) 
  0= abort" expected shift amount"  
  1f and  d# 6 lshift ;

: rop  ( s 0 t 0 d 0 a -- u ) @ -rot rd or -rot rt or -rot rs or ;
: r2op  ( s 0 t 0 a -- u ) @ -rot rt or -rot rs or ;
: rsop  ( t 0 imm 1 d 0 a -- u ) 
  @ -rot rd or -rot shamt or -rot rt or ;
: iop  ( s 0 imm 1 t 0 a -- u ) 
  @ -rot rt or -rot imm16 or -rot rs or ;
: ibop  ( addr s 1 t 0 a -- u ) 
  @ -rot rt or -rot rs or swap off16 or ;
: ib1op  ( addr s 1 a -- u ) @ -rot rs or swap off16 or ;
: jop  ( addr a -- u ) @  swap 2 rshift 3ffffff and or ;

: opr  ( op/fun | name -- ) <builds  ,  does>  rop asm, ;
: opr2  ( op/fun | name -- ) <builds  ,  does>  r2op asm, ;
: opi  ( op | name -- ) <builds  ,  does>  iop asm, ;
: opib  ( op | name -- ) <builds  ,  does>  ibop asm, ;
: opib1  ( op | name -- ) <builds  ,  does>  ib1op asm, ;
: opj  ( op | name -- ) <builds  ,  does>  jop asm, ;
: oprs  ( op | name -- ) <builds  ,  does>  rsop asm, ;

: #  ( n -- n 1 ) 1 ;
: $  ( -- a ) asmhere ;
: )  ( -- 0 1 ) 0 1 ;

\ instructions

10000000 opib beq           14000000 opib bne

04110000 opib1 bgez         04100000 opib1 bltzal
04110000 opib1 bgezal       1c000000 opib1 bgtz
18000000 opib1 blez         04000000 opib1 bltz

1a opr2 div     1b opr2 divu
18 opr2 mult    18 opr2 multu

08000000 opj j      0c000000 opj jal

80000000 opi lb     8c000000 opi lw         90000000 opi lbu
84000000 opi lh     94000000 opi lhu        ac000000 opi sw     
34000000 opi ori    a0000000 opi sb         38000000 opi xori
28000000 opi slti   2c000000 opi sltiu      a4000000 opi sh
20000000 opi addi   24000000 opi addiu      30000000 opi andi
88000000 opi lwl    98000000 opi lwr        a8000000 opi swl
b8000000 opi swr
e0000000 opi sc     c0000000 opi ll     \ mips II

25 opr or       26 opr xor      27 opr nor
04 opr sllv     2a opr slt      2b opr sltu     
06 opr srlv     22 opr sub      23 opr subu
20 opr add      21 opr addu     24 opr and 
07 opr srav             

0 oprs sll      03 oprs sra     02 oprs srl

: syscall  0c asm, ;        : break  0d asm, ;
: sync  0f asm, ;       \ mips II

also forth

: lui  ( imm 1 t 0 -- ) 
  rt -rot  imm16 or  3c000000  or asm, ;

: jr  ( s 0 -- )  rs 08 or asm, ;
: jalr  ( s 0 d 0 -- )  rd  rs or  09 or asm, ;
: mthi  ( s 0 -- ) rs 11 or asm, ;
: mtlo  ( s 0 -- ) rs 13 or asm, ;
: mfhi  ( d 0 -- ) rd 10 or asm, ;
: mflo  ( d 0 -- ) rd 12 or asm, ;


\ pseudo instructions

: nop  00000000 asm, ;     
: move  ( s 1 t 1 -- ) $0 2swap add ;
: clear  ( t 1 -- ) $0 $0 2rot add ;
: not  ( s 1 t 1 -- ) $0 2swap nor ;
: b  ( addr -- ) $0 $0 beq ;

: li  ( imm 1 d 0 -- ) 
  abort" expected d register"  >r
  0= abort" expected immediate"
  dup d# -32768 d# 32768 within 0=  if
    dup d# 16 rshift 1 r@ 0 lui
  then
  ffff and  r@ 0  rot 1  r> 0  ori ;

: mul  ( s 1 t 1 d 1 -- ) 2>r mult  2r> mflo ;
: rem  ( s 1 t 1 d 1 -- ) 2>r div  2r> mfhi ;


\ comparisons

variable condop

: conds  ( op | name -- )
  <builds  ,  does>  ( s 0 a -- ) @ -rot rs or  condop ! ;

: toreg  ( x f -- r 0 ) dup  if  $0 $at ori  $at  then ;

: condst  ( op | name -- )
  <builds  ,  does>  ( s sm t tm a -- ) 
  @ >r  toreg rt r> or  -rot toreg rs or  condop ! ;

10000000 conds 0<>      14000000 conds 0=
04010000 conds 0<       18000000 conds 0>

10000000 condst <>       14000000 condst =

: cmpst  ( s t sltx br -- )
  >r >r  toreg rt  -rot  toreg rs or  $at rd or  r> or asm,
  $at rs  $0 rt or  r> or  condop ! ;

: <=  ( s t -- ) 2swap 2a 14000000 cmpst ;
: >=  ( s t -- ) 2a 14000000 cmpst ;
: <  ( s t -- ) 2a 10000000 cmpst ;
: >  ( s t -- ) 2swap 2a 10000000 cmpst ;
: u<  ( s t -- ) 2b 10000000 cmpst ;
: u>  ( s t -- ) 2swap 2b 10000000 cmpst ;


\ control structures

: patch  ( from to -- )
  over - 2/ 2/ 1- ffff and  over asm@ or  swap asm! ;

: %if  ( -- a ) asmhere  condop @ asm,  nop ;
: if  %if ;
: then  ( a -- ) asmhere patch ;
: branch,  ( -- a ) asmhere  10000000 asm,  nop ;    \ beq $0 $0 ...
: else  ( a1 -- a2 ) branch,  swap asmhere patch ;
: begin  ( -- a ) asmhere ;
: again  ( a -- ) branch,  swap patch ;
: until  ( a -- ) %if  swap patch ;
: while  ( a1 -- a1 a2 ) %if ;

: repeat  ( a1 a2 -- ) 
  asmhere >r  swap off16 10000000 or asm,  nop  
  r> asmhere patch ;

previous

\ assuming: TOS = $2, SP = $29, RP = $30, AP = $28, W = $25

create (next)
  $28 ) $25 lw
  $28 4 # $28 addi
  $25 ) $3 lw   
  nop               \ LDS
  $3 jr
  nop

: next  (next) b  nop ;

previous  also forth definitions  also assembler

: code  ( | name -- ) 
  create  asmhere dup 1 cells - ! ( cfa → paramfield )
  also assembler ;

: end-code  previous ;

only forth definitions

base !
