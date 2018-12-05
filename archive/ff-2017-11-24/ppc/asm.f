\ PPC assembler
\
\ Instruction format:
\
\   rT rA rB <instr>
\   rT rA <imm> <instr>
\   rT rA <instr>
\   rA rS rB <instr>
\   rS rA rB <instr>
\   rA rS <imm> <instr>
\   <addr> <instr>
\   BO BI <addr> <instr>
\   BIF <addr> <instr>
\   BO BI <instr>
\   BIF <addr> <instr>
\   crT L rA rB <instr>
\   crT rA rB <instr>
\   rA rS <instr>
\   bT bA bB <instr>
\   bT bA <instr>
\   rA rB <instr>
\   <instr>
\   rT rB <instr>
\   rT rA rB rC <instr>
\   rT rA rC <instr>
\   crT crS <instr>
\   rT <instr>
\   rT SPR/TBR <instr>
\   crMASK rS <instr>
\   bit <instr>
\   frMASK rB <instr>
\   SPR rS <instr>
\   rA rS n mB mE <instr>
\   rA rS n nB sh <instr>
\   rA rS n nB <instr>
\   rA rS rB mB mE <instr>
\   TO rA rB <instr>
\   TO rA <imm> <instr>
\
\ conditionals: = <> > < >= <= so? ns?

vocabulary assembler    also assembler definitions
base @

: register  ( u | name -- ) <builds  ,  does>  @ 0 ;

\ note: assumes host is big-endian
defer asm@       ' @ is asm@
defer asm!       ' ! is asm!
defer asmhere    ' here is asmhere
defer asmhere!   :noname h ! ; is asmhere!

: asm,  ( x -- ) asmhere asm!  1 cells asmhere + asmhere! ;

0 register r0       1 register r1       2 register r2
3 register r3       4 register r4       5 register r5
6 register r6       7 register r7       8 register r8
9 register r9       10 register r10     11 register r11
12 register r12     13 register r13     14 register r14
15 register r15     16 register r16     17 register r17
18 register r18     19 register r19     20 register r20
21 register r21     22 register r22     23 register r23
24 register r24     25 register r25     26 register r26
27 register r27     28 register r28     29 register r29
30 register r30     31 register r31

0 register fr0       1 register fr1       2 register fr2
3 register fr3       4 register fr4       5 register fr5
6 register fr6       7 register fr7       8 register fr8
9 register fr9       10 register fr10     11 register fr11
12 register fr12     13 register fr13     14 register fr14
15 register fr15     16 register fr16     17 register fr17
18 register fr18     19 register fr19     20 register fr20
21 register fr21     22 register fr22     23 register fr23
24 register fr24     25 register fr25     26 register fr26
27 register fr27     28 register fr28     29 register fr29
30 register fr30     31 register fr31

0 constant crf0     1 constant crf1     2 constant crf2
3 constant crf3     4 constant crf4     5 constant crf5
6 constant crf6     7 constant crf7

: +imm  ( 1 -- ) 0= abort" expected immediate" ;
: rC  ( u 0 -- u ) abort" expected register"  6 lshift ;
: rB  ( u 0 -- u ) abort" expected register"  11 lshift ;
: rA  ( u 0 -- u ) abort" expected register"  16 lshift ;
: rT  ( u 0 -- u ) abort" expected register"  21 lshift ;
: SI  ( x 1 -- u ) +imm h# ffff and ;
: BO  ( bo -- u ) 21 lshift ;       : BI  ( bi -- u ) 16 lshift ;
: BIF  ( bi -- u ) 18 lshift ;
: absBD  ( addr -- u ) h# fffc and ;
: absLI  ( addr -- u ) h# 03fffffc and ;
: relLI  ( addr -- u ) asmhere swap - absLI ;
: relBD  ( addr -- u ) asmhere swap - absBD ;
: crT  ( u1 -- u2 ) 23 lshift ;     : crS  ( u1 -- u2 ) 18 lshift ;
: LF  ( l -- u ) 21 lshift ;
: bT  ( u1 -- u2 ) 21 lshift ;      : bA  ( u1 -- u2 ) 16 lshift ;
: bB  ( u1 -- u2 ) 11 lshift ;

: SPR  ( SPR -- u ) 
  dup h# 1f and 16 lshift  swap h# 3e0 and 11 lshift or 
  h# 1ff800 and ;

: TAB  ( code | name -- )
  <builds  ,  does>  @ >r  rB -rot  rA or -rot  rT or  r> or asm, ;

: TAC  ( code | name -- )
  <builds  ,  does>  @ >r  rC -rot  rA or -rot  rT or  r> or asm, ;

: TABC  ( code | name -- )
  <builds  ,  does>  @ >r  rC -rot  rB -rot  rA or -rot  rT or  
  r> or asm, ;

: TACB  ( code | name -- )
  <builds  ,  does>  @ >r  rB -rot  rC -rot  rA or -rot  rT or  
  r> or asm, ;

: ASB  ( code | name -- )
  <builds  ,  does>  @ >r  rB -rot  rT or -rot  rA or  r> or asm, ;

: TASI  ( code | name -- )
  <builds  ,  does>  @ >r  SI -rot  rA or -rot  rT or  r> or asm, ;

: ASUI  ( code | name -- )
  <builds  ,  does>  @ >r  SI -rot  rT or -rot  rA or  r> or asm, ;

: TA  ( code | name -- )
  <builds  ,  does>  @ >r  rA -rot  rT or  r> or asm, ;

: AB  ( code | name -- )
  <builds  ,  does>  @ >r  rB -rot  rA or  r> or asm, ;

: LI  ( rel? code | name -- )
  <builds  , ,  does>  @+ >r  @  if  relLI  then  r> or asm, ;

: BOBIBD  ( rel? bo bi code | name -- )
  <builds  , , , ,  does>  @+ >r  @+ BI >r  @+ BO >r
  @  if  relBD  else  absBD  then  r> or  r> or  >r or asm, ;

: BOBIFBD  ( rel? bo code | name -- )
  <builds  , , ,  does>  @+ >r  @+ BO >r
  @  if  relBD  else  absBD  then  r> or  r> or  swap BIF or asm, ;

: BOBI  ( bo bi code | name -- )
  <builds  , , ,  does>  @+ >r  @+ BI >r  @ BO r> or r> or asm, ;

: BOBIF  ( bo code | name -- )
  <builds  , ,  does>  @+ >r  @ BO r> or swap BIF or asm, ;

: cTLAB  ( code | name -- )
  <builds  ,  does>  @ >r  rB -rot  rA or  swap LF or  swap crT or  
  r> or asm, ;

: cTAB  ( code | name -- )
  <builds  ,  does>  @ >r  rB -rot  rA or  swap crT or  r> or asm, ;

: cTLASI  ( code | name -- )
  <builds  ,  does>  @ >r  SI -rot  rA or  swap LF or  swap crT or  
  r> or asm, ;

: bTAB  ( code | name -- )
  <builds  ,  does>  @ >r  bB swap  bA or swap  bT or r> or asm, ; 

: AS  ( code | name ) 
  <builds  ,  does>  @ >r  rT -rot  rA or  r> or asm, ;

: TB  ( code | name -- )
  <builds  ,  does>  @ >r  rB -rot  rT or  r> or asm, ;

: cTcS  ( code | name -- )
  <builds  ,  does>  @ >r  crS swap crT or  r> or asm, ;

: ASnBE  ( code | name -- )
  <builds  ,  does>  @ >r  1 lshift  swap 6 lshift or
  swap 11 lshift or  -rot rT or  -rot rA or  r> or asm, ;

: ASBBE  ( code | name -- )
  <builds  ,  does>  @ >r  1 lshift  swap 6 lshift or
  -rot rB or  -rot rT or  -rot rA or  r> or asm, ;

: cT  ( code | name -- ) <builds  ,  does>  @ >r  crT  r> or asm, ;
: RT  ( code | name -- ) <builds  ,  does>  @ >r  rT  r> or asm, ;
: BT  ( code | name -- ) <builds  ,  does>  @ >r  bT  r> or asm, ;

: #  ( n -- n 1 ) 1 ;
: )  ( r 0 -- r 0 0 1 ) 0 1 ;
: $  ( -- a ) asmhere ;

hex

7c000214 TAB add      7c000215 TAB add.
7c000614 TAB addo     7c000615 TAB addo.
7c000014 TAB addc     7c000015 TAB addc.
7c000414 TAB addco    7c000415 TAB addco.
7c000114 TAB adde     7c000115 TAB adde.
7c000514 TAB addeo    7c000515 TAB addeo.
7c0003d6 TAB divw     7c0003d7 TAB divw.
7c0007d6 TAB divwo    7c0007d7 TAB divwo.
7c000396 TAB divwu    7c000397 TAB divwu.
7c000796 TAB divwuo   7c000797 TAB divwuo.
7c00026c TAB eciwx    7c00036c TAB ecowx
fc00002a TAB fadd     fc00002b TAB fadd.
ec00002a TAB fadds    ec00002b TAB fadds.
fc000024 TAB fdiv     fc000024 TAB fdiv.
ec000024 TAB fdivs    ec000024 TAB fdivs.
fc000028 TAB fsub     fc000029 TAB fsub.
ec000028 TAB fsubs    ec000029 TAB fsubs.
7c0000ee TAB lbzux    7c0000ae TAB lbzx
7c0004ee TAB lfdux    7c0004ae TAB lfdx
7c00046e TAB lfsux    7c00042e TAB lfsx
7c0002ee TAB lhaux    7c0002ae TAB lhax
7c00062c TAB lhbrx    7c00026e TAB lhzux
7c00022e TAB lhzx     7c00042a TAB lswx
7c000028 TAB lwarx    7c00042c TAB lwbrx
7c00006e TAB lwzux    7c00002e TAB lwzx
7c000092 TAB mulhw    7c000093 TAB mulhw.
7c000016 TAB mulhwu   7c000017 TAB mulhwu.
7c0001d6 TAB mullw    7c0001d7 TAB mullw.
7c0005d6 TAB mullwo   7c0005d7 TAB mullwo.
7c0001ee TAB stbux    7c0001ae TAB stbx
7c0005ee TAB stfdux   7c0005ae TAB stfdx
7c00056e TAB stfsux   7c00052e TAB stfsx
7c00072c TAB sthbrx   7c00036e TAB sthux
7c00032e TAB sthx     7c00052a TAB stswx
7c00052c TAB stwbrx   7c00012d TAB stwcx.
7c00016e TAB stwux    7c00012e TAB stwx
7c000050 TAB subf     7c000051 TAB subf.
7c000450 TAB subfo    7c000451 TAB subfo.
7c000010 TAB subfc    7c000011 TAB subfc.
7c000410 TAB subfco   7c000411 TAB subfco.
7c000110 TAB subfe    7c000111 TAB subfe.
7c000510 TAB subfeo   7c000511 TAB subfeo.

\ unimplemented: stfiwx

38000000 TASI addi    30000000 TASI addic
34000000 TASI addic.  3c000000 TASI addis
88000000 TASI lbz     8c000000 TASI lbzu
c8000000 TASI lfd     cc000000 TASI lfdu
c0000000 TASI lfs     c4000000 TASI lfsu
a8000000 TASI lha     ac000000 TASI lhau
a0000000 TASI lhz     a4000000 TASI lhzu
b8000000 TASI lmw     80000000 TASI lwz
84000000 TASI lwzu    1c000000 TASI mulli
98000000 TASI stb     9c000000 TASI stbu
d8000000 TASI stfd    dc000000 TASI stfdu
d0000000 TASI stfs    d4000000 TASI stfsu
b0000000 TASI sth     b4000000 TASI sthu
bc000000 TASI stmw    90000000 TASI stw
94000000 TASI stwu    40000000 TASI subfic

: sub  ( rT 0 rB 0 rA 0 -- ) 2swap subf ;
: sub.  ( rT 0 rB 0 rA 0 -- ) 2swap subf. ;
: subi  ( rT 0 rA 0 x 1 -- ) swap negate swap addi ;

7c0001d4 TA addme     7c0001d5 TA addme.
7c0004d4 TA addmeo    7c0004d5 TA addmeo.
7c000194 TA addze     7c000195 TA addze.
7c000494 TA addzeo    7c000495 TA addzeo.
7c0000d0 TA neg       7c0000d1 TA neg.
7c0004d0 TA nego      7c0004d1 TA nego.
7c0001b0 TA subfme    7c0001b1 TA subfme.
7c0004b0 TA subfmeo   7c0004b0 TA subfmeo.
7c000190 TA subfze    7c000191 TA subfze.
7c000490 TA subfzeo   7c000490 TA subfzeo.

7c000078 ASB andc     7c000079 ASB andc.
7c000238 ASB eqv      7c000239 ASB eqv.
7c0003b8 ASB nand     7c0003b9 ASB nand.
7c0000f8 ASB nor      7c0000f9 ASB nor.
7c000338 ASB orc      7c000339 ASB orc.
7c000030 ASB slw      7c000031 ASB slw.
7c000630 ASB sraw     7c000631 ASB sraw.
7c000430 ASB srw      7c000431 ASB srw.
7c000278 ASB xor      7c000279 ASB xor.

70000000 ASUI andi.   74000000 ASUI andis.
60000000 ASUI ori     64000000 ASUI oris
7c000670 ASUI srawi   7c000671 ASUI srawi.
68000000 ASUI xori    6c000000 ASUI xoris

: li  ( rT 0 x 1 -- ) 
  +imm  dup >r d# -32768 d# 32768 within 0=  if
    2dup  r0  r@ d# 16 rshifta 1 addis  2dup
  else  r0  then  r> 1  addi ;

true 48000000 LI b    false 48000002 LI ba
true 48000001 LI bl   false 48000003 LI bla

: bc  ( bo bi addr -- ) 
  >r  BI  swap BO or  40000000 or  r> relBD or asm, ;

: bca  ( bo bi addr -- ) 
  >r  BI  swap BO or  40000002 or  r> BD or asm, ;

: bcl  ( bo bi addr -- ) 
  >r  BI  swap BO or  40000001 or  r> relBD or asm, ;

: bcla  ( bo bi addr -- ) 
  >r  BI  swap BO or  40000003 or  r> BD or asm, ;

true 10 0 40000000 BOBIBD bdnz      true 10 0 40000001 BOBIBD bdnzl
false 10 0 40000000 BOBIBD bdnza    false 10 0 40000001 BOBIBD bdnzla
true 12 0 40000000 BOBIBD bdz       true 12 0 40000001 BOBIBD bdzl
false 12 0 40000000 BOBIBD bdza     false 12 0 40000001 BOBIBD bdzla

true 0c 40020000 BOBIFBD beq        true 0c 40020001 BOBIFBD beql
false 0c 40020000 BOBIFBD beqa      false 0c 40020001 BOBIFBD beqla
true 04 40000000 BOBIFBD bge        true 04 40000001 BOBIFBD bgel
false 04 40000000 BOBIFBD bgea      false 04 40000001 BOBIFBD bgela
true 0c 40001000 BOBIFBD bgt        true 0c 40010001 BOBIFBD bgtl
false 0c 40010000 BOBIFBD bgta      false 0c 40010001 BOBIFBD bgtla
true 04 40010000 BOBIFBD ble        true 04 40010001 BOBIFBD blel
false 04 40010000 BOBIFBD blea      false 04 40010001 BOBIFBD blela
true 0c 40000000 BOBIFBD blt        true 0c 40000001 BOBIFBD bltl
false 0c 40000000 BOBIFBD blta      false 0c 40000001 BOBIFBD bltla
true 04 40020000 BOBIFBD bne        true 04 40020001 BOBIFBD bnel
false 04 40020000 BOBIFBD bnea      false 04 40020001 BOBIFBD bnela
true 04 40030000 BOBIFBD bns        true 04 40030001 BOBIFBD bnsl
false 04 40030000 BOBIFBD bnsa      false 04 40030001 BOBIFBD bnsla
true 0c 40030000 BOBIFBD bso        true 0c 40030001 BOBIFBD bsol
false 0c 40030000 BOBIFBD bsoa      false 0c 40030001 BOBIFBD bsola

\ unimplemented: bdnzfXX bdnztXX bdzfXX bdztXX bfXX btXX bngXX bnlXX
\                bnuXX bunXX

: bcctr  ( bo bi -- ) BI swap BO or 4c000420 or asm, ;
: bcctrl  ( bo bi -- ) BI swap BO or 4c000421 or asm, ;

14 0 4c000420 BOBI bctr             14 0 4c000421 BOBI bctrl

0c 4c020420 BOBIF beqctr            0c 4c020421 BOBIF beqctrl
04 4c000420 BOBIF bgectr            04 4c000421 BOBIF bgectrl
0c 4c010420 BOBIF bgtctr            0c 4c010420 BOBIF bgtctrl
04 4c010420 BOBIF blectr            04 4c010420 BOBIF blectrl
0c 4c000420 BOBIF bltctr            0c 4c000420 BOBIF bltctrl
04 4c020420 BOBIF bnectr            04 4c020420 BOBIF bnectrl
04 4c030420 BOBIF bnsctr            04 4c030420 BOBIF bnsctrl
0c 4c030420 BOBIF bsoctr            0c 4c030420 BOBIF bsoctrl

\ unimplemented: bfctrX btctrX bngctrX bnlctrX bnuctrX bunctrX

: bclr  ( bo bi -- ) BI swap BO or 4c000020 or asm, ;
: bclrl  ( bo bi -- ) BI swap BO or 4c000021 or asm, ;

14 0 4c000020 BOBI blr              14 0 4c000021 BOBI blrl
10 0 4c000020 BOBI bdnzlr           10 0 4c000021 BOBI bdnzlrl
12 0 4c000020 BOBI bdzlr            12 0 4c000021 BOBI bdzlrl

0c 4c020020 BOBIF beqlr             0c 4c020021 BOBIF beqlrl
04 4c000020 BOBIF bgelr             04 4c000021 BOBIF bgelrl
0c 4c010020 BOBIF bgtlr             0c 4c010021 BOBIF bgtlrl
04 4c010020 BOBIF blelr             04 4c010021 BOBIF blelrl
0c 4c000020 BOBIF bltlr             0c 4c000021 BOBIF bltlrl
04 4c020020 BOBIF bnelr             04 4c020021 BOBIF bnelrl
04 4c030020 BOBIF bnslr             04 4c030021 BOBIF bnslrl
0c 4c030020 BOBIF bsolr             0c 4c030021 BOBIF bsolrl

\ unimplemented: bdnzflrX bdnztlrX bdzflrX bdztlrX bflrX bnglrX
\                bnllrX bnulrX btlrX bunlrX

7c000000 cTLAB cmp          7c000040 cTLAB cmpl

: cmpw  ( crT rA 0 rB 0 -- ) 2>r  0 -rot  2r> cmp ;
: cmplw  ( crT rA 0 rB 0 -- ) 2>r  0 -rot  2r> cmpl ;

2c000000 cTLASI cmpi        28000000 cTLASI cmpli

: cmpwi  ( crT rA 0 n 1 -- ) 2>r  0 -rot  2r> cmpi ;
: cmplwi  ( crT rA 0 n 1 -- ) 2>r  0 -rot  2r> cmpli ;

7c000034 AS cntlzw          7c000774 AS extsb
7c000775 AS extsb.          7c000734 AS extsh
7c000735 AS extsh.          7c0007b4 AS extsw
7c0007b5 AS extsw.

4c000202 bTAB crand         4c000102 bTAB crandc
4c000242 bTAB creqv         4c0001c2 bTAB crnand
4c000082 bTAB crnor         4c000382 bTAB cror
4c000342 bTAB crorc         4c000182 bTAB crxor

: crnot  ( bT bA -- ) dup crnor ;
: crmove  ( bT bA -- ) dup cror ;

7c0000ac AB dcbf            7c0003ac AB dcbi
7c00006c AB dcbst           7c00022c AB dcbt
7c0001ec AB dcbtst          7c0007ec AB dcbz
7c0007ac AB icbi

: eieio  7c0006ac asm, ;
: isync  4c00012c asm, ;

fc000210 TB fabs            fc000211 TB fabs.
fc00001c TB fctiw           fc00001d TB fctiw.
fc00001e TB fctiwz          fc00001f TB fctiwz.
fc000090 TB fmr             fc000091 TB fmr.
fc000110 TB fnabs           fc000111 TB fnabs.
fc000050 TB fneg            fc000051 TB fneg.
fc000018 TB frsp            fc000019 TB frsp.

fc000040 cTAB fcmpo         fc000000 cTAB fcmpu

fc00003a TABC fmadd         fc00003b TABC fmadd.
ec00003a TABC fmadds        ec00003b TABC fmadds.
fc000038 TABC fmsub         fc000039 TABC fmsub.
ec000038 TABC fmsubs        ec000039 TABC fmsubs.

fc000032 TAC fmul           fc000033 TAC fmul.
ec000032 TAC fmuls          ec000033 TAC fmuls.

fc00003e TACB fnmadd        fc00003f TACB fnmadd.
ec00003e TACB fnmadds       ec00003f TACB fnmadds.
fc00003c TACB fnmsub        fc00003d TACB fnmsub.
ec00003c TACB fnmsubs       ec00003d TACB fnmsubs.

: lswi  ( rT 0 rA 0 u 1 -- ) 
  SI d# 11 lshift -rot  rA or -rot  rT or  7c0004aa or asm, ;

: stswi  ( rT 0 rA 0 u 1 -- ) 
  SI d# 11 lshift -rot  rA or -rot  rT or  7c0005aa or asm, ;

4c000000 cTcS mcrf          fc000080 cTcS mcrfs

7c000400 cT mcrxr

7c000026 RT mfcr            fc00048e RT mffs
7c0000a6 RT mfmsr           7c000124 RT mtmsr

: mfspr  ( rT 0 SPR -- ) >r rT r> SPR or 7c0002a6 or asm, ;

: mfctr 9 mfspr ;      : mflr 8 mfspr ;     : mfxer 1 mfspr ;

\ unimplemented: mfasr mfdar mfdbatl mfdbatu mfdec mfdisr mfear
\                mfibatl mfibatu mfpvr mfsdrl mfsprg mfsrr0 mfsrr1
\                mfsr mfsrin

: mftb  ( rT 0 TBR -- ) >r rT  r> SPR or  7c0004a6 or asm, ;
: mftbu 269 mftb ;

: mtcrf  ( crMASK rS 0 -- ) 
  rT swap  d# 12 lshift or  7c000120 or asm, ;

: mtcr 0ff -rot mtcrf ;

fc00008c BT mtfsb0          fc00008d BT mtfsb0.
fc00004c BT mtfsb1          fc00004d BT mtfsb1.

: mtfsf  ( frMASK rB 0 -- ) 
  rB swap  d# 17 lshift or  fc00058e or asm, ;

: mtfsf.  ( frMASK rB 0 -- ) 
  rB swap  d# 17 lshift or  fc00058f or asm, ;

: mtfsfi  ( crT IMM 1 -- ) 
  0= abort" expected immediate"
  d# 13 lshift  swap crT or  fc00010c or asm, ;

: mtfsfi.  ( crT IMM 1 -- ) 
  0= abort" expected immediate"
  d# 13 lshift  swap crT or  fc00010d or asm, ;

: mtspr  ( SPR rS 0 -- ) rT swap  SPR or  7c0003a6 or asm, ;

: mtctr 9 -rot mtspr ;      : mtlr 8 -rot mtspr ;
: mtxer 1 -rot mtspr ;

\ unimplemented: mtasr mtdar mtdbatl mtdbatu mtdec mtdisr mtear
\                mtibatl mtibatu mtsdr1 mtsprg mtsrr0 mtsrr1
\                mtsr mtsrin

50000000 ASnBE rlwimi       50000001 ASnBE rlwimi.
54000000 ASnBE rlwinm       54000001 ASnBE rlwinm.

: clrlslwi  swap over -  over d# 31 swap - rlwinm ;
: clrlslwi.  swap over -  over d# 31 swap - rlwinm. ;
: clrlwi  +imm  0 swap d# 31 rlwinm ;     
: clrlwi.  +imm  0 swap d# 31 rlwinm. ;
: clrrwi  +imm  0 0 rot d# 31 swap - rlwinm ;
: clrrwi.  +imm  0 0 rot d# 31 swap - rlwinm. ;
: extlwi  +imm  0 rot 1- rlwinm ;         
: extlwi.  +imm  0 rot 1- rlwinm. ;
: extrwi  +imm  over >r  +  d# 32 r> -  d# 31 rlwinm ;
: extrwi.  +imm  over >r  +  d# 32 r> -  d# 31 rlwinm. ;
: rotlwi  +imm  0 d# 31 rlwinm ;     
: rotlwi.  +imm  0 d# 31 rlwinm. ;
: rotrwi  +imm  d# 32 swap - 0 d# 31 rlwinm ;
: rotrwi.  +imm  d# 32 swap - 0 d# 31 rlwinm. ;
: slwi  +imm  0 over d# 31 swap - rlwinm ;
: slwi.  +imm  0 over d# 31 swap - rlwinm. ;
: srwi  +imm  dup >r  d# 32 swap -  r> d# 31 rlwinm ;
: srwi.  +imm  dup >r  d# 32 swap -  r> d# 31 rlwinm. ;

5c000000 ASBBE rlwnm        5c000001 ASBBE rlwnm.

: rotlw  0 d# 31 rlwnm ;        : rotlw.  0 d# 31 rlwnm. ;
: sc  44000002 asm, ;           : sync  7c0004ac asm, ;

\ unimplemented: tlbia tlbie tlbsync

: tw  ( TO rA 0 rB 0 -- ) rB -rot  rA or  swap d# 21 lshift or
  7c000008 or asm, ;

: trap  d# 31 r0 r0 tw ;
: tw-rot  ( rA 0 rB 0 t# -- ) -rot 2>r -rot 2r> tw ;

: tweq  4 tw-rot ;      : twge  0c tw-rot ;     : twgt  8 tw-rot ;   
: twle  d# 20 tw-rot ;  : twlge  5 tw-rot ;     : twlgt  1 tw-rot ;
: twlle  6 tw-rot ;     : twllt  2 tw-rot ;     : twlt  10 tw-rot ;
: twne  d# 24 tw-rot ;

\ unimplemented: twlng twlnl twng twnl

: twi  ( TO rA 0 n 1 -- ) SI -rot  rA or  swap d# 21 lshift or
  0c000000 or asm, ;

: twi-rot  ( rA 0 n 1 t# -- ) -rot 2>r -rot 2r> twi ;

: tweqi  4 twi-rot ;        : twgei  d# 12 twi-rot ;   
: twgti  8 twi-rot ;        : twlei  d# 20 twi-rot ; 
: twlgei  5 twi-rot ;       : twlgti  1 twi-rot ;
: twllei  6 twi-rot ;       : twllti  2 twi-rot ;
: twlti  d# 16 twi-rot ;    : twnei  d# 24 twi-rot ;

\ unimplemented: twlngi twlnli twngi twnli

also forth 

variable cond

: >  810000 cond ! ;     : <  800000 cond ! ;
: =  820000 cond ! ;     : <>  1820000 cond ! ;
: <=  1810000 cond ! ;   : >=  1800000 cond ! ;
: so?  830000 cond ! ;   : ns?  1830000 cond ! ;

\ control structures

: patch  ( from to -- ) over -  fffc and  over asm@ or  swap asm! ;
: %if  ( -- a ) asmhere  cond @ 40000000 or asm, ;
: if  %if ;
: then  ( a -- ) asmhere patch ;
: branch,  ( -- a ) asmhere  48000000 asm, ;
: else  ( a1 -- a2 ) branch,  swap asmhere patch ;
: begin  ( -- a ) asmhere ;
: again  ( a -- ) asmhere - absLI 48000000 or asm, ;
: until  ( a -- ) %if  swap patch ;
: while  ( a1 -- a1 a2 ) %if ;
: repeat  ( a1 a2 -- ) asmhere >r  swap b r> asmhere patch ;

\ here, because we need `and` + `or` in the code above
7c000378 ASB or       7c000379 ASB or.
7c000038 ASB and      7c000039 ASB and.

previous

: nop  r0 r0 0 # ori ;      : rfi 4c000064 asm, ;
: mr  2dup or ;             : mr.  2dup or. ;

\ next
\
\ registers: TOS: r3, SP: r1, RP: r11, AP: r13, W: r14

create (next)
  r14 r13 ) lwz
  r13 r13 4 # addi
  r4 r14 ) lwz
  r4 mtlr
  blr

: next  (next) b ;

previous  also forth definitions  also assembler

: code  ( | name -- ) 
  create  asmhere dup 1 cells - ! ( cfa → paramfield )
  also assembler ;

: end-code  previous ;

previous previous
base !
