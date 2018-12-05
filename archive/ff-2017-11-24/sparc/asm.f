\ sparc assembler
\
\ Instruction format: 
\
\   s1 s2 d <instr>
\   addr <branch> [,a]
\
\ s1 = register
\ s2 = register | immediate
\ d = register
\
\ • s1 + d are reversed for "st..." operations
\ • wry + rdy have only 2 arguments
\
\ # marks immediate
\ ) can be used in place of s2 as an alternative to "0 #"
\ $ is a synonym for `here`
\ %lo / %hi extract parts from val and convert to imm. argument
\
\ conditions: >  u>  <  u<  =  <>  cc?  cs?  0<  0>  0=  0<>  <=  >=
\ conditionals: if  then  else  begin  while  repeat  until
\
\ synthetic instructions:
\
\   <imm> <reg> set
\   <imm> <reg> inc     (dec, inccc, deccc)
\   <s> <ref> btst      (bclr, bset, btog)
\   <reg> clr           (not, neg)
\   <s> <reg> mov
\   <reg> <s> cmp       (jmp)
\   <s> tst
\   ret                 (retl, nop)
\
\ set the deferred words `asm@`, `asm!`, `asmhere!` and `ashmere` 
\ to customize target code addressing.


vocabulary assembler    also assembler definitions
base @  hex

: register  ( u | name -- ) <builds  ,  does>  @ 0 ;

0 register %r0
1 register %r1
2 register %r2
3 register %r3
4 register %r4
5 register %r5
6 register %r6
7 register %r7
8 register %r8
9 register %r9
0a register %r10
0b register %r11
0c register %r12
0d register %r13
0e register %r14
0f register %r15
10 register %r16
11 register %r17
12 register %r18
13 register %r19
14 register %r20
15 register %r21
16 register %r22
17 register %r23
18 register %r24
19 register %r25
1a register %r26
1b register %r27
1c register %r28
1d register %r29
1e register %r30
1f register %r31

0 register %f0
1 register %f1
2 register %f2
3 register %f3
4 register %f4
5 register %f5
6 register %f6
7 register %f7
8 register %f8
9 register %f9
0a register %f10
0b register %f11
0c register %f12
0d register %f13
0e register %f14
0f register %f15
10 register %f16
11 register %f17
12 register %f18
13 register %f19
14 register %f20
15 register %f21
16 register %f22
17 register %f23
18 register %f24
19 register %f25
1a register %f26
1b register %f27
1c register %f28
1d register %f29
1e register %f30
1f register %f31

0 register %g0
1 register %g1
2 register %g2
3 register %g3
4 register %g4
5 register %g5
6 register %g6
7 register %g7

8 register %o0
9 register %o1
0a register %o2
0b register %o3
0c register %o4
0d register %o5
0e register %o6
0f register %o7

10 register %l0
11 register %l1
12 register %l2
13 register %l3
14 register %l4
15 register %l5
16 register %l6
17 register %l7

18 register %i0
19 register %i1
1a register %i2
1b register %i3
1c register %i4
1d register %i5
1e register %i6
1f register %i7

%i6 drop register %fp   %o6 drop register %sp

\ note: assumes host is big-endian
defer asm@       ' @ is asm@
defer asm!       ' ! is asm!
defer asmhere    ' here is asmhere
defer asmhere!   :noname h ! ; is asmhere!

: asm,  ( x -- ) asmhere asm!  1 cells asmhere + asmhere! ;
: rs2  ( r 0 -- u ) abort" expected source register" ;
: rs2/simm13  ( r/i f -- u ) if  1fff and 2000 or  then ;
: rd  ( r 0 -- u ) abort" expected destination register"  d# 25 lshift ;
: rs1  ( r 0 -- u ) abort" expected source register"  d# 14 lshift ;

: op3  ( s1 ts1 s2 ts2 d td a -- u )
  @ d# 19 lshift  -rot rd or  -rot rs2/simm13 or  -rot rs1 or ;

: opa  ( op3 | name -- )
  <builds  ,  does>  ( s1 ts1 s2 ts2 d td a -- )
  op3  c0000000 or asm, ;

: opar  ( op3 | name -- )
  <builds  ,  does>  ( d1 td1 d2 td2 s ts a -- )
  >r  2rot  r>  op3  c0000000 or asm, ;

: sethi  ( i 1 r 0 -- )
  dup abort" expected register"  rd
  -rot 0= abort" expected immediate"  3fffff and or
  01000000 or asm, ;

: nop  01000000 asm, ;

: opb  ( op3 | name -- )
  <builds  ,  does>  ( s1 ts1 s2 ts2 d td a -- )
  op3  80000000 or asm, ;

: disp22  ( addr -- u ) asmhere cell+ 2 rshifta - 3fffff and ;

: bop  ( addr cond u1 -- u2)  
  swap d# 25 lshift or  swap disp22  or asm, ;

: opc  ( cond | name -- )
  <builds  ,  does>  ( addr a -- ) @ 800000 bop ;

: ,a  asmhere 1 cells - dup @ 20000000 or swap ! ;

: opd  ( cond | name -- )
  <builds  ,  does>  ( addr a -- ) @ 1800000 bop ;

: ope  ( cond | name --)
  <builds  ,  does>  ( addr a -- ) @ 1c00000 bop ;

: disp30  ( addr -- u ) asmhere cell+ - 3fffffff and ;
: call  ( addr -- ) disp30  40000000 or asm, ;

: rs2/imm7  ( r/i f -- u ) if  7f and 2000 or  then ;

: opg  ( cond | name -- )
  <builds  ,  does>  ( s1 ts1 s2 ts2 a -- )
  @ d# 25 lshift  81d00000 or  -rot rs2/imm7 or  -rot rs1 or asm, ;

: rdy  ( s ts d td -- )
  rd  28 d# 18 lshift or  -rot rs1 or asm, ;

variable wryop  30 wryop !
: wry  ( s1 ts1 s2 ts2 -- )
  %g0 wryop op3  80000000 or asm, ;

: flush  ( s1 ts1 s2 ts2 d td -- ) 3b 0 0 opb asm, ;
: stbar  9143e000 asm, ;

: oph  ( op | name -- )
  <builds  ,  does>  ( r1 0 r2 0 a -- )
  @ 5 lshift 81a00000 or  -rot rs2 or  rs1 or asm, ;

: #  ( n -- n 1 ) 1 ;
: )  ( r 0 -- r 0 0 1 ) 0 1 ;
: $  ( -- a ) asmhere ;
: %lo  ( n -- u 1 ) 3ff and 1 ;
: %hi  ( n -- u 1 ) d# 10 rshift 1 ;

\ <op> r1 x2 r3
9 opa ldsb      0a opa ldsh     1 opa ldub      2 opa lduh
0 opa ld        3 opa ldd
20 opa ldf      23 opa lddf     21 opa ldfsr
e0 opa ldc      33 opa lddc     31 opa ldcsr
0d opa ldstub   
0f opa swap

\ <op> r1 r2 x3  (r1 is src)
5 opar stb       6 opar sth       4 opar st        7 opar std
24 opar stf      27 opar stdf     25 opar stfsr
34 opar src      37 opar stdc     35 opar stcsr

\ <op> r1 x2 r3
1 opb and       11 opb andcc    5 opb andn      15 opb andncc
2 opb or        12 opb orcc     6 opb orn       16 opb orncc
3 opb xor       13 opb xorcc    7 opb xnor      17 opb xnorcc
25 opb sll      26 opb srl      27 opb sra
0 opb add       10 opb addcc    8 opb addx      18 opb addxcc
20 opb taddcc   22 opb taddcctv
4 opb sub       14 opb subcc    0c opb subx     1c opb subxcc
21 opb tsubcc   23 opb tsubcctv
24 opb mulscc
0a opb umul     0b opb smul     1a opb umulcc   1b opb smulcc
0e opb udiv     0f opb sdiv     1e opb udivcc   1f opb sdivcc
3c opb save     3d opb restore  38 opb jmpl

\ <op> addr
8 opc ba        0 opc bn        9 opc bne       1 opc be
0a opc bg       2 opc ble       0b opc bge      3 opc bl
0c opc bgu      4 opc bleu      0d opc bcc      5 opc bcs       
0e opc bpos     6 opc bneg      0f opc bvc      7 opc bvs

8 opd fba       0 opd fbn       7 opd fbu       6 opd fbg
5 opd fbug      4 opd fbl       3 opd fbul      2 opd fblg
1 opd fbne      9 opd fbe       0a opd fbeu     0b opd fbge
0c opd fbuge    0d opd fble     0e opd fbule    0f opd fbo

8 ope cba       0 ope cbn       7 ope cb3       6 ope cb2
5 ope cb23      4 ope cb1       3 ope cb13      2 ope cb12
1 ope cb123     9 ope cb0       0a ope cb03     0b ope cb02
0c ope cb023    0d ope cb01     0e ope cb013    0f ope cb012

\ <op> r1 x2
8 opg ta        0 opg tn        9 opg tne       1 opg te
0a opg tg       2 opg tle       0b opg tge      3 opg tl
0c opg tgu      4 opg tleu      0d opg tcc      5 opg tcs
0e opg tpos     6 opg tneg      0f opg tvc      7 opg tvs

\ <op> r1 r2
c4 oph fitos    c8 oph fitod    ca oph fitoq
d1 oph fstoi    d2 oph fdtoi    d3 oph fqtoi
c9 oph fstod    0cd oph fstoq   c6 oph fdtos    0ce oph fdtoq
c7 oph fqtos    0cb oph fqtod
1 oph fmovs     5 oph fnegs     9 oph fabss
29 oph fsqrts   2a oph fsqrtd   2b oph fsqrtq
41 oph fadds    42 oph faddd    43 oph faddq    45 oph fsubs
46 oph fsubd    47 opg fsubq
49 opg fmuls    4a oph fmuld    4b oph fmulq    69 opg fsmuls
6e oph fdmulq   3d oph fdivs    4e oph fdivd    4f oph fdivq
51 oph fcmps    52 oph fcmpd    53 oph fcmpq    55 opg fcmpes
56 oph fcmped   57 oph fcmpeq

\ synthetic instructions

\ <op> r1 x2
: cmp  %g0 subcc ;      : jmp  %g0 jmpl ;

\ tst x1
: tst  %g0 2swap %g0 orcc ;     

\ <op>
: ret  %i7 8 # %g0 jmpl ;
: retl  %o0 8 # %g0 jmpl ;      

\ <op> r1
: not  %g0 2over xnor ;
: neg  %g0 2swap 2dup sub ;

\ <op> imm # reg
: inc  2swap 2over add ;        : inccc  2swap 2over addcc ;
: dec  2swap 2over sub ;        : deccc  2swap 2over subcc ;

\ <op> x1 r2
: btst  2swap %g0 andcc ;       : bset  2swap 2over or ;
: bclr  2swap 2over andn ;      : btog  2swap 2over xor ;
: mov  %g0 2rot 2rot or ;

\ clr r1
: clr  %g0 %g0 2rot or ;

: %or  or ;  \ used below

also forth

\ comparisons

\ set

: set  ( n 1 r 0 -- )
  2swap 0= abort" expected immediate"
  dup 1fff and 0=  if  %hi 1 2swap  sethi  exit  then
  dup d# -4096 d# 4096 within  if  
    >r  %g0  2swap  r> 1  2swap %or  exit  then \ XXX correct for <0?
  dup >r %hi 2over sethi  r> %lo 2over  %or ;

variable cond

: >  2 cond ! ;     : u>  40 cond ! ;   : <  0b cond ! ;
: u<  0d cond ! ;   : =  9 cond ! ;     : <>  1 cond ! ;
: cc?  5 cond ! ;   : cs?  0d cond ! ;  : 0<  0e cond ! ;
: 0>  6 cond ! ;    : 0=  9 cond ! ;    : 0<>  1 cond ! ;
: <=  0a cond ! ;   : >=  3 cond ! ;

\ control structures

: patch  ( from to -- )
  over - 2/ 2/ 3fffff and  over asm@ or  swap asm! ;

: %if  ( -- a ) asmhere  cond @ d# 25 lshift  800000 or asm,  nop ;
: if  %if ;
: then  ( a -- ) asmhere patch ;
: branch,  ( -- a ) asmhere  10800000 asm,  nop ;
: else  ( a1 -- a2 ) branch,  swap asmhere patch ;
: begin  ( -- a ) asmhere ;
: again  ( a -- ) branch,  swap patch ;
: until  ( a -- ) %if  swap patch ;
: while  ( a1 -- a1 a2 ) %if ;

: repeat  ( a1 a2 -- ) 
  asmhere >r  swap ba  nop  r> asmhere patch ;

previous

\ next

create (next)
  %g4 ) %g5 ld 
  4 # %g4 inc
  %g5 ) %l1 ld 
  %l1 ) jmp
  nop

: next  (next) ba  nop ;

previous  also forth definitions  also assembler

: code  ( | name -- ) 
  create  asmhere dup 1 cells - ! ( cfa → paramfield )
  also assembler ;

: end-code  previous ;

previous previous
base !
