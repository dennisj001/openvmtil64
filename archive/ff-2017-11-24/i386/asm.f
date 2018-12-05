\ x86 assembler
\ found at: ftp://ccreweb.org/software/kforth/examples/asm-x86.4th

\ asm-x86.4th -- ans forth assembler (postfix)
\
\ 32/16-bit assembler for x86 processors
\
\ -------- original notes ------------------------------------------------
\
\ designed to compile the forth-os from any ans forth compiler.
\ by thomas novelli, 1999-2000
\
\ based on the 16-bit assembler from pygmy forth, by frank sergeant.
\ http://pygmy.utoh.org
\
\ floating point instructions adapted from gforth's 386/asm.fs
\   by bernd paysan.
\
\ asm-x86 is released under the mit/bsd license, in accordance
\   with the preference of its original author, frank sergeant.
\  
\
\   
\ special notations:
\   ta - target address
\
\ tbd:
\   ebp@ and esp@ can't be done w/ mod r/m alone; use s-i-b.
\     workaround: use #@ ebp+ instead of ebp@  (same for esp)
\
\ low-priority items:
\   incbin
\   mov crx
\   2,3-operand imul
\   do more error checking? (wrong number/type of operands, etc)
\   support for running under 16-bit forths (use double-cells..)
\
\ output options:
\
\ 1. assemble to blocks (or blockfiles)
\ 2. assemble to allocated memory (and save to file)
\ 3. assemble to heap (here) or "code space" with c,
\    prevents some useful things, like macros & named labels
\
\ -------- end original notes --------------------------------------------
\
\ revisions:
\   2016-12-10  ported to ff, felix
\   2001-10-23  modified for kforth, krishna myneni
\   2004-10-19  make octal nondeferred word  km
\   2004-10-20  km began floating pt instruction implementation;
\               revisions to kforth interface: 
\                 -- fixed end-code to update stack ptr
\                 -- moved compilation of "ret," to inside of end-code
\   2004-10-21  changed stack ptr to ebx for code words, added fp words  km
\   2004-10-22  fixed displacement addressing for fp words km
\   2004-10-26  finished first cut of fp implementation  km
\   2004-10-27  changed asm-reset to set default flags for word/dword 
\                 based on mode; added macro: and end-macro; reduced
\                 code overhead slightly  km
\   2006-02-11  removed operations in sized-code which were redundant or useless;
\                 this should reduce code overhead significantly  km 
\   2006-03-02  changed sized-code so that code words generate inline calls and stack fixup,
\                 which increases efficiency considerably  km 
\   2006-03-11  fixed problems with jmp, -- apparently coded on assumption of
\                 16-bit mode causing relative jumps to mis-assemble for 32-bit  km
\   2006-03-13  modified begin, to return address rather than offset, so its use
\                 would be consistent with again, and repeat, ; 
\                 added do, with behavior of old begin, for use with loop, ;
\                 commented out until, and inserted corresponding code in loopx,
\                 since until, should correspond to begin, ;  km
\  2006-03-14  fixed a problem with order of computation in asm-to ;
\                 fixed jmp to allow both short and long relative jumps for 32-bit mode ;
\                 added call-code to allow code words to call other code words ;
\                 added mixed integer/fp arithmetic and memory words (fixx) km 
\  2007-01-07  modified "<reg>" and "reg": a) in "reg" the e and w flag bits are cleared
\                 prior to calling "<reg>" so that byte and word register operands will
\                 assemble properly; b) moved code to set the variable srcsiz which
\                 is needed for the movsx, and movsz, instructions from "<reg>" to
\                 "reg" to avoid side effects from change a)  km
\  2009-05-24  added fstpt, and fldt, for storing and loading full width (10 byte) values
\                 between the fpu register and memory  km
\  2009-09-26  removed definition of within  km
\  2009-10-05  re-enable use of wordlists; updated code, end-code, macro, and end-macro  km
\
\ version specific notes:
\ ----------------------
\
\ 1. output options 1 and 3 are not relevant for the kforth version.
\
\ 2. this version may be used in other ans forths with the
\      following compatibility definitions:
\
\        : a@ @ ;
\        : ?allot here swap allot ;
\
\      a word such as kforth's call, which calls machine code,
\      is also required.
\
\ 3. currently, any values placed on top of the stack from a
\      code word get clobbered on return to forth, due to
\      specific implementation of code. however, values may be 
\      dropped, or the number of stack items can remain unchanged 
\      in which case the values may be changed. see asm-x86-test.4th
\      for examples.

vocabulary assembler

also assembler definitions

: char+ 1+ ;    : 2+ 2 + ;
: a@ @ ;        : ?allot here swap allot ;

base @
hex    
: octal 8 base ! ; \ nondeferred

variable mode  ( 0=16-bit 1=32-bit)

: use16  0 mode ! ;   
: use32  1 mode ! ;
: tcell ( - n) 2 mode @ lshift ;  ( target cell size, in chars)

variable origin \ start of code (when loaded on target)
variable -org   \ difference
variable asm0   \ start of code
variable >asm   \ assembly pointer -- w/rt asm0 (starts at 0)
variable output \ 0=memory, 1=blocks


: $' ( - a  current address w/rt asm0)  >asm @ ;
: $  ( - a  current address w/rt origin)  >asm @  -org @ + ;
: org ( a -)  dup origin !  $' - -org ! ;

( assemble to memory -- org = start address, by default)

\ : asm-to ( a -) dup org  asm0 !  0 >asm !  0 output ! ;
: asm-to ( a -) dup asm0 !  0 >asm ! org 0 output ! ;
: mem-db! ( n ta -) asm0 a@ + c! ;

hex
( assemble to blocks -- org = 0, by default)

: asm-block ( start_block -)
  0a lshift asm0 !  0 org  0 >asm !  1 output ! ;

: block-db! ( n ta -) 2drop ;
\  asm0 @ +  400 /mod block  + c!  update ;


\ db! is the one and only way to output code/data.
\ that way it's easy to "filter" for block output, etc.

: db! ( n ta -)
        output @  0= if mem-db! else block-db! then ;

: dw! ( n ta -)
        2dup db! char+ swap 8 rshift swap db! ;

: dd! ( n ta -)
        4 0 do  2dup db! char+ swap 8 rshift swap  loop  2drop ;

: dc! ( n ta -)
        tcell 0 do  2dup db! char+ swap 8 rshift swap  loop  2drop ;

\ data definition words (also used for code generation)

: db,  ( c -) >asm @  swap over db!  char+ >asm ! ;
: dw,  ( x -) dup db, 8 rshift db, ;
: dd,  ( x -) 4 0 do  dup db, 8 rshift  loop drop ;
: dc,  ( x -) mode @ if dd, else dw, then ;

\ save memory to file

\ : save ( "filename" -)  ( usage: save filename )
\  bl parse ( c-addr u) r/w bin create-file 0<>
\  if drop ( fid) ." create-file error" cr
\  else dup asm0 @  $' ( location & size of code)
\    rot write-file  0<> if ." write-file error" cr then
\    close-file  0<> if ." close-file error" cr then
\  then  ;

\ for debugging - show assembly buffer:
\ tbd: only works w/ memory right now

\ : show ( -) asm0 @  $'  dump ;



variable disp   \ displacement
variable sib    \ -------- ssrrr00i
  \ ss=scale; rrr=index reg; i=index?
variable flags  \ -------e omiagsdw
  \ m=r/m; i=imm; a=accumulator (al/ax/eax); g=seg;
  \ s=imm size (1=short, 0=full size)
  \ w=word or byte; e=dword (extended reg.)
  \ o=disp only; d=direction (1 when r/m field is source)

variable #ops   \ # of operands
variable #regs  \ # of register operands
variable srcsiz \ size of 1st (source) operand; used for movzx,


: f-set  ( mask -) flags @ or flags ! ;
: f-clr  ( mask -) invert flags @ and flags ! ;
: f-get  ( mask - flags ) flags @ and ;
: f-flip ( mask -) flags @ xor flags ! ;

\ set flags

: b-ptr  101 f-clr ;
: w-ptr  100 f-clr  1 f-set ;
: d-ptr  101 f-set ;


: asm-reset  2 flags ! ( d) mode @ if d-ptr else w-ptr then
             0 disp !  0 sib !  0 #regs !  0 #ops ! ;

\ read flags

: byte?  ( - f)  1 f-get 1 xor ;
: word?  ( - f)  1 f-get ;    \ true for both 16-and 32-bit values
: dword? ( - f)  100 f-get 0<> negate ;
: cell?  ( - f)  100 f-get 8 rshift  mode @  xor invert  1 f-get and ;

: sreg?  ( - f)  8 f-get ;

: d? ( - f)  2 f-get ;
: s? ( - f)  4 f-get ;
: m? ( - f) 40 f-get ;
: o? ( - f) 80 f-get ;

: imm? ( -f)  20 f-get ;
: acc? ( -f)  10 f-get ;
: 1reg?  #regs @ 1 = ;
: 2regs? ( -f) #regs @ sreg? or  dup 2 =  swap 9 =  or ;
               ( cc=2  or  cc=1 + sreg )


hex
( conditionals )

: if, ( opcode -- offset ) db,  $' ( origin)  0 db, ( blank) ;

: while, ( a1 opcode -- offset a1) if, swap ;

: then, ( offset -- ) $' over 1+ - swap db! ;

: else, ( offset -- offset') eb ( short jmp) db,
        $' over - swap db!  $'  0 db, ;

: begin, ( -- a ) ( $') $ ;     \ changed for consistency with again, and repeat,  km2006-03-13

\ : until, ( a opc -) db,  $'  1+ - db, ;
 
( repeat, and again are defined after jmp, )

: opc ( opcode -) ( - opcode) <builds 1 ?allot c! does> c@ ;

73 opc cs,
75 opc 0=,  
79 opc 0<,  
73 opc u<,  
e3 opc cxnz,
7d opc <,   
7e opc >,   
76 opc u>,  
71 opc ov,

: do,     ( -- offset )  $' ;
: loop,   ( offset -- )  e2 db, $' 1+ - db, ;
: loopz,  ( offset -- )  e1 db, $' 1+ - db, ;
: loopnz, ( offset -- )  e0 db, $' 1+ - db, ;

: far-jmp,  ( seg offset -)  ea db,  dc, dw,  asm-reset ;

hex

: <reg> ( a - n)
  1 #ops +!  
  dup 8 rshift  ( high byte)
  dup 1 and  1 xor  2 lshift  ( s flag = not of bit 1)
  or f-set
  ff and ( low byte)  ;


: r/m ( n -) ( disp - n)  <builds 1 cells ?allot !
        does> @ <reg> 2 f-clr ( d) swap disp !  ;

\ high byte = flags, low byte=reg
\  40000=indirect
\ 100000=disp only

octal
40000 r/m [bx+si]  
40001 r/m [bx+di]   
40002 r/m [bp+si]
40003 r/m [bp+di]  
40004 r/m [si]      
40005 r/m [di]
40006 r/m [bp]     
40007 r/m [bx]

: #@ ( disp - n)  140006 mode @ -
                  <reg> 2 f-clr ( d) swap disp ! ;


\ base registers: (r/m)

40000 r/m eax@  
40001 r/m ecx@  
40002 r/m edx@  
40003 r/m ebx@
40004 r/m esp@  
40005 r/m ebp@  
40006 r/m esi@  
40007 r/m edi@

\ index registers: (s-i-b, r/m=100)

hex
: idx ( n -) ( - n)  <builds 1 cells ?allot ! does> @
        sib @ 1 and if abort" index reg defined twice!"
        else ff and sib ! then ;

octal
40001 idx eax+  
40011 idx ecx+  
40021 idx edx+  
40031 idx ebx+
40041 idx esp+  
40051 idx ebp+  
40061 idx esi+  
40071 idx edi+

\ scaling, for the index regs:
: 1x  300 invert sib @ and sib ! ;
: 2x  1x  100 sib @ or sib ! ;
: 4x  1x  200 sib @ or sib ! ;
: 8x  1x  300 sib @ or sib ! ;


hex
: reg ( 000a00ew00rrr000 -) ( - 0000000000rrr000)  <builds 1 cells ?allot !
  does>
    #ops @ 1 = if 101 f-get  srcsiz ! then   \ needed for movsx, and movzx,
    101 f-clr
    @ <reg> 1 #regs +!  2 f-flip ( d)  ;

octal
\  10000= a (accumulator)
\    400= w (word)
\ 200400= ew (dword)

210400 reg eax  
200410 reg ecx  
200420 reg edx  
200430 reg ebx
200440 reg esp  
200450 reg ebp  
200460 reg esi  
200470 reg edi

 10400 reg ax      
   410 reg cx      
   420 reg dx      
   430 reg bx
   440 reg sp      
   450 reg bp      
   460 reg si      
   470 reg di

 10000 reg al       
    10 reg cl       
    20 reg dl       
    30 reg bl
    40 reg ah       
    50 reg ch       
    60 reg dh       
    70 reg bh

: seg ( n -) ( -n)  <builds 1 cells ?allot ! does> @ <reg> 2 f-set ( d) ;

4400 seg es   
4410 seg cs   
4420 seg ss   
4430 seg ds
4440 seg fs   
4450 seg gs

\ debugging routine: .f (show flags, etc.)
hex

create f$ 8 ?allot
char o over c! 1+
char m over c! 1+
char i over c! 1+
char a over c! 1+
char g over c! 1+
char s over c! 1+
char d over c! 1+
char w swap c!

: 2^  ( n - 2^n)  1 swap lshift ;

: .f ( -)
  base @ hex
  dword? if [char] e else [char] - then emit 20 emit
  80  8 0 do  dup f-get  if f$ i + c@  else [char] -  then
             emit 1 rshift loop drop
  #regs @ 3 u.r  ."  regs  "
  1  sib @ 6 rshift  lshift  1 u.r  ." x  disp=" disp @ u.
  base !  cr ;

: r>m ( reg - r/m)  3 rshift ;

: short? ( n - f)  -80 80 within ;

: # ( n1 - n1) 20 over short? 04 and or f-set ;
  \ clears all flags except i and (if short) s

: orw  ( --opc---  -  --opc--w )  1 f-get  or ;
: ordw ( --opc---  -  --opc-dw )  3 f-get  or ;


\ generate mod r/m byte, and s-i-b byte if needed

: mod, ( md***rrr -)
  sib @ if dup f8 and 4 or db,  7 and sib @ or db,
  else db,  then ;

\ generates mod r/m byte, s-i-b byte, displacement

: moddisp, ( 00***r/m -)
  m? if
    o? if ( disp only)
      mod, disp @ dc,
    else
      sreg? disp @ or  over 7 and 6 = or ( [bp])
      if
         disp @ swap over
         short? if 40 or mod, db,  else 80 or mod, dc,  then
      else ( zero & not seg) mod, then
    then
  else ( 11***reg) c0 or db,  then ;

: ,imm ( n -)
  5 f-get 4 = if ( s,-w) db,
              else  dword? if dd, else dw, then  then ;


\ prefix instructions
octal

: pfx <builds 1 ?allot c! does> c@ db, ;

 46 pfx es:  
 56 pfx cs:  
 66 pfx ss:  
 76 pfx ds:
144 pfx fs:     
145 pfx gs:     ( 386+)
146 pfx opsiz:  
147 pfx adrsiz: ( 386+)
362 pfx repnz   
362 pfx repne
363 pfx repz    
363 pfx repe    
363 pfx rep
\ note: rep* was done differently in pygmy

( generate opsiz: prefix if necessary )
: (opsiz)  byte? 0=  cell? 0=  and  if opsiz: then ;


\ one-byte opcodes with no operands

: m1 ( n -) ( -)  <builds 1 cells ?allot ! does> @ db, asm-reset ;

octal
 47 m1 daa,      
 57 m1 das,     
 67 m1 aaa,      
 77 m1 aas,
324 m1 aam,     
325 m1 aad,
220 m1 nop,
230 m1 cbw,     
230 m1 cwde,   
231 m1 cwd,
140 m1 pushad,  
141 m1 popad,  
234 m1 pushfd,  
235 m1 popfd,
236 m1 sahf,    
237 m1 lahf,
303 m1 ret,   \ what about ret ## form?
313 m1 retf   \ (we shouldn't need it for forth)
311 m1 leave,
314 m1 int3,    
316 m1 into,
317 m1 iret,
327 m1 xlat,
360 m1 lock:
364 m1 hlt,     
233 m1 wait,
370 m1 clc,     
371 m1 stc,    
365 m1 cmc,
372 m1 cli,     
373 m1 sti,    
374 m1 cld,     
375 m1 std,

hex
( alu instructions with 2 operands, like add )

: m2 ( n -) ( various -)   <builds 1 cells ?allot !
  does> (opsiz)  @ >r  imm? if
    acc? if   drop  r> orw 4 or db,
         else 1reg? if r>m then  80 orw db,
              r> 38 and or moddisp,
         then  ,imm
  else  2regs?  if swap r>m then
        r> ordw db, or moddisp,
  then asm-reset  ;

octal
00 m2 add,  
10 m2 or,   
20 m2 adc,  
30 m2 sbb,
40 m2 and,  
50 m2 sub,  
60 m2 xor,  
70 m2 cmp,


hex
: mov, ( r/m/i r/m - )
  (opsiz)
  imm? if
    1reg? if   ( imm,reg) r>m b0 or  word? 3 lshift or  db,
    else ( imm,r/m) c6 orw db, moddisp,
    then ,imm
  else ( reg,r/m)
    o? acc? and
    if ( disp,acc) 
      2drop a0  2 f-flip  ordw db,  disp @ dc,
    else
      2regs? if ( reg,reg) d? if swap then  r>m  then
      sreg? if ( sreg,r/m) 1 f-clr 8c else ( reg,r/m)  88  then
      ordw db,  or moddisp,
    then
  then  asm-reset  ;

\ movzx, movsx, -- zero extend / sign extend

: mx ( n -) ( r/m reg -)
  <builds 2 ?allot swap over c! 1+ c! does> (opsiz)
  srcsiz @ 100 and if abort" attempt to extend a dword" then
  dup char+ c@ db,  c@ srcsiz @ or db,
  2regs? if swap r>m then  or moddisp,
  asm-reset ;

hex  
0f b6 mx movzx,  
0f be mx movsx,


\ string instructions -- all 1-byte opcodes with w bit

: m3 ( n -) ( reg -)
        <builds 1 cells ?allot ! does> (opsiz) @ orw db, asm-reset ;

octal
246 m3 cmps, 
254 m3 lods, 
244 m3 movs, 
256 m3 scas, 
252 m3 stos,


\ mul, div, etc...    xxxxxxxw  mdnnnr/m

octal

: m4 ( n -) ( -)  <builds 1 cells ?allot !
  does> (opsiz)  @  366 orw db, swap
  1reg? if r>m then or moddisp,  asm-reset ;

20 m4 com,   
40 m4 mul,   
60 m4 div,
30 m4 neg,   
50 m4 imul,  
70 m4 idiv,

\ note: i used not for conditionals, so this alias is okay:
\ 20 m4 not, ( alias for com,)

\ lea, lds, les instructions

octal

: m5 ( n -) ( -)       \ tbd: fix if broken; add lfs/lgs/lss
  <builds 1 ?allot c! does> (opsiz)  c@  db, or moddisp, asm-reset  ;

215 m5 lea,  
304 m5 les,  
305 m5 lds,

\ rotate & shift instructions
\ note: to shift by cl, omit first operand

octal
: m6 ( n -) ( n# r/m | r/m - )  <builds 1 cells ?allot !
  does> (opsiz)  @
  320  imm? if  3 pick 1 <> 20 and xor  else  2 or  then
  orw db,
  1reg? if swap r>m then or moddisp,
  imm? if  dup 1 <> if db, else drop then  then
  asm-reset  ;

00 m6 rol,  
20 m6 rcl,      
40 m6 shl,
10 m6 ror,  
30 m6 rcr,  
50 m6 shr,  
70 m6 sar,


\ inc, dec instructions
octal

: m7 ( opc -) ( reg | r/m - )  <builds 1 cells ?allot !
  does> (opsiz)  @ swap  1reg? if ( opc reg) r>m then
  1reg?  word? and  ( full-size register?)
  if ( opc rx)  or 100 or db,
  else ( opc mem | opc rh | opc rl )
    376 orw db,  or moddisp,
  then  asm-reset  ;

00 m7 inc,   
10 m7 dec,


\ push, pop instructions
hex

: m8 ( n -) ( reg | seg | r/m -)  <builds 1 cells ?allot !
  does> @  8 ( g) f-get
  if ( seg opc) over 20 and
    if   ( sreg3) 0f db,  4 rshift 1 and 1 xor  80 or  or db,
    else ( sreg2)         4 rshift 1 and 1 xor   6 or  or db,
    then
  else 1reg?
    if ( reg opc) 2/  8 and  8 xor  50 or  swap r>m or db,
    else ( r/m opc) dup 8 rshift  ff and  db,  or moddisp,
    then  then  asm-reset  ;

ff30 m8 push,    
8f00 m8 pop,   \ hex
\ 177460 m8 push,  107400 m8 pop, \ octal


\ in, out instructions
octal

: m9 ( n -) ( n# r1 | r1 -)  <builds 1 cells ?allot !
  does> @  (opsiz) orw nip
    imm? if ( n# opc)  db, ( n#) else ( opc) 10 or then db,
    asm-reset  ;

344 m9 in,   
346 m9 out,

\ xchg
hex

: xchg,  ( reg mem | mem reg | reg1 reg2 -)
  (opsiz)
  #regs @ 2 =  acc? and  word? and ( ax and another reg)
  if  ?dup if nip then ( r1) r>m  90 or db,
  else 2regs? if  r>m  then  or  86 orw db, moddisp,
  then  asm-reset  ;

\ test -- sim. to add
hex

: test,  ( various -)
  (opsiz)
  imm?
  if acc? if     drop  a8 orw ( 4 or) db,
          else   1reg? if r>m then  f6 orw db,
                 ( or)  moddisp,
          then  ,imm
  else  2regs?  if swap r>m then
        84 orw db, or moddisp,
  then  asm-reset  ;



\ int -- usage: 21 int,
octal

: int, ( #n -) 315 db, db, asm-reset ;

\ call
hex

: call, ( various -)  imm?      ( intra-seg direct)
  if  ( n#)  $ 1+ tcell + -  ( relative)
    e8 db, dc,   ( usage: 2338 call, )
  else   ( intra-seg indirect: address in reg/mem)
    ( mem | reg -)  1reg?  if r>m then
    ff db,  10 or moddisp, ( usage: 0 [bx] call,  or  dx call, )
  then  asm-reset  ;

\ jmp
hex

: jmp, ( various -) ( 140) 40  f-get  ( r or m intra-seg indirect)
  if ( mem | reg -)  1reg?  if r>m then
    ff db,  20 or moddisp,  \ 0 [bx] jmp,   dx jmp,
                           \ 3759 ) jmp,
  else  ( a) $ 1+ tcell + -  ( relative)
    dup short? if tcell + 1- eb db, db, else e9 db, dc, then
  then  asm-reset  ;

: ljmp, ( a -)  e9 db,  $'  tcell + - dc, ; 
: again, ( a -)  jmp, ;   
: repeat, ( a a -) again, then, ;


\ some 386/486 instructions...
octal

: clts,         17 db, 06 db, ;
: invd,         17 db, 10 db, ;
: wbinvd,       17 db, 11 db, ;

: label: ( "name" -) ( - a) <builds $ 1 cells ?allot ! does> a@ ;
: label' ( "name" -) ( - a) <builds $' 1 cells ?allot ! does> a@ ;

: jmp-from ( "name" -) 351 db,  label'  0 dc, ;
: jmp-to ( a -)
  $'  over -  tcell - ( displacement)
  swap dc! ;

hex

: 0fill ( # -  pad out target file w/ 0's)
  ?dup if  0 do 0 db, loop  then ;

\ pad w/ nops
: align, ( u -)  $  over mod
  dup if - 0 do  nop,  loop
  else 2drop then ;

\ pad w/ zeroes
: 0align, ( u -)  $  over mod
  dup if - 0 do  nop,  loop
  else 2drop then ;

\ dpush/dpop pseudo-instructions
\ use this like: 32 # dpush,  or  edx dpop,

: dpush, ( r/m -)
  83 db, ed db, tcell db,  ( tcell # ebp sub,)
  89 db, 45 db, 00 db,    ( eax 0 ebp@ mov,)
  ( r/m) eax mov,  ;

: dpop, ( r/m -)
  eax  swap ( r/m) mov,
  tcell # ebp add,  ;

: drop,
\  0 ebp@ eax mov,
  0 #@ ebp+ eax mov,  \ ebp@ workaround
  tcell # ebp add, ;

\ -----------------------------------------------------
\ floating point instructions
\ adapted from gforth 0.6.x 386 assembler by b. paysan, 92--94
\ k. myneni, 2004-10-20
\ ------------------------------------------------------

hex

variable fsize
\ : .fs   0 fsize ! ;
\ : .fd   2 fsize ! ;
\ : .fx   3 fsize ! ;   
: .fl   4 fsize ! ;  
\ : .fw   6 fsize ! ;  
\ : .fq   7 fsize ! ;
.fl 

: st   ( n -- )  7 and 5c0 or ;
: st?  ( reg -- reg flag ) dup 8 rshift 5 - ;
\ : ?mem ( mem -- mem )  dup c0 < 0= abort" mem expected!" ;


d9 pfx d9,
de pfx de,   
: d9: <builds 1 cells ?allot c! does> d9, c@ db, asm-reset ;
: de: <builds 1 cells ?allot c! does> de, c@ db, asm-reset ;

\ some floating point instructions with no operands.

d0 d9: fnop,
e0 d9: fchs,     e1 d9: fabs,
e4 d9: ftst,     e5 d9: fxam,
e8 d9: fld1,     e9 d9: fldl2t,   ea d9: fldl2e,   eb d9: fldpi,
ec d9: fldlg2,   ed d9: fldln2,   ee d9: fldz,
f0 d9: f2xm1,    f1 d9: fyl2x,    f2 d9: fptan,    f3 d9: fpatan,
f4 d9: fxtract,  f5 d9: fprem1,   f6 d9: fdecstp,  f7 d9: fincstp,
f8 d9: fprem,    f9 d9: fyl2xp1,  fa d9: fsqrt,    fb d9: fsincos,
fc d9: frndint,  fd d9: fscale,   fe d9: fsin,     ff d9: fcos,


\ single operand floating point instructions; operand may be a
\   memory address, indirect register reference, or an fpu
\   stack register.
: fop:  ( n -- ) <builds 1 cells ?allot c! 
                 does> ( reg/mem/st -- ) c@ >r
                   st? 0= if  c7 and r> or d8 db, db,
                   else  r> or d8 
                     fsize @ dup 1 and dup 2* + - +
                     db, moddisp,
                   then  asm-reset ;

octal

( reg/mem/st -- )
00 fop: fadd,    11 fop: fmul,    22 fop: fcom,    33 fop: fcomp,
44 fop: fsub,    55 fop: fsubr,   66 fop: fdiv,    77 fop: fdivr,

hex

\ following arithmetic instructions do not use an operand;
\   they operate on st(0) and st(1)
c1 de: faddp,
c9 de: fmulp,
e9 de: fsubp,    \  ( -- | intel style:  1 = 1 - 0, pop )
e1 de: fsubrp,   \  ( -- | intel style:  1 = 0 - 1, pop )
f9 de: fdivp,    \  ( -- | intel style:  1 = 1 / 0, pop )
f1 de: fdivrp,   \  ( -- | intel style:  1 = 0 / 1, pop )


: fwait,   ( -- | wait for fpu ready)       9b db, ; 
: finit,   ( -- | initialize fpu)    fwait, db db, e3 db,         asm-reset ;
: fnclex,  ( -- | clear exceptions)         db db, e2 db,         asm-reset ;
: fclex,   ( -- | clear exceptions w/ wait) fwait, fnclex, ;

: fcompp,  ( -- | compare 0-1, pop both)    de db, d9 db,         asm-reset ;
: fucompp, ( -- | unord. comp, pop both)    da db, e9 db,         asm-reset ;
: fucom,   ( st -- | unord. compare 0 - st)  7 and e0 or dd db, db, asm-reset ;
: ffree,   ( st -- )                        c7 and dd db, db,     asm-reset ;
: fxch,    ( st -- | exchange 0 and st)     c7 and  8 or d9 db, db, asm-reset ;

: fbld,    ( mem -- | load bcd encoded fp)  df db, 20 or moddisp, asm-reset ;
: fbstp,   ( mem -- | save in bcd format)   df db, 30 or moddisp, asm-reset ;
: fsave,   ( mem -- | save fpu state) fwait, dd db, 30 or moddisp, asm-reset ;
: frstor,  ( mem -- | restore fpu state)    dd db, 20 or moddisp, asm-reset ;

: fnstcw,  ( mem -- | save control word )   d9 db, 38 or moddisp, asm-reset ; 
: fstcw,   ( mem -- | save control word )   fwait, fnstcw, ;
: fldcw,   ( mem -- | load control word )   d9 db, 2d or moddisp, asm-reset ;
: fnstenv, ( mem -- | save environment )    d9 db, 30 or moddisp, asm-reset ; 
: fstenv,  ( mem -- | save environment )    fwait, fnstenv, ;
: fldenv,  ( mem -- | load environment )    d9 db, 20 or moddisp, asm-reset ;

: fnstsw,  ( reg/mem -- | save status word) dup ax = if 20 df 
                                else 3d dd then  db, moddisp, asm-reset ;

: fstsw,   ( reg/mem -- | save status word) fwait, fnstsw, ;

: fld,     ( st/mem -- ) st? 0= if    c7 and d9 db, db, 
                                else  d9 fsize @ or db, moddisp, 
                                then  asm-reset ;

: fldt,    ( st/mem10r ) st? 0= if    c7 and d9 db, db, 
                                else  db db, 28 or moddisp, 
                                then  asm-reset ;


: fst,     ( st/mem -- ) st? 0= if     7 and d0 or dd db, db, 
                                else  d9 fsize @ or db, 10 or moddisp, 
                                then  asm-reset ;

: fstp,    ( st/mem -- ) st? 0= if    c7 and dd db, db, 
                                else  d9 fsize @ or db, 18 or moddisp, 
                                then  asm-reset ;

: fstpt,    ( st/mem10r -- ) st? 0= if   c7 and dd db, db, 
                                else  db db, 38 or moddisp, 
                                then  asm-reset ;

: fild,    ( mem4 -- | push, 0 = mem4 )  db db, moddisp, asm-reset ;
: fist,    ( mem4 -- | mem4 = 0 )        db db, 10 or moddisp, asm-reset ;
: fistp,   ( mem4 -- | mem4 = 0, pop)    db db, 18 or moddisp, asm-reset ;
: fidiv,   ( mem4 -- | 0 = 0 / mem4 )    da db, 30 or moddisp, asm-reset ;
: fidivr,  ( mem4 -- | 0 = mem4 / 0 )    da db, 38 or moddisp, asm-reset ;
: fimul,   ( mem4 -- | 0 = 0 * mem4 )    da db, 08 or moddisp, asm-reset ;
: fiadd,   ( mem4 -- | 0 = 0 + mem4 )    da db, moddisp, asm-reset ;
: fisub,   ( mem4 -- | 0 = 0 - mem4 )    da db, 20 or moddisp, asm-reset ;
: fisubr,  ( mem4 -- | 0 = mem4 - 0 )    da db, 28 or moddisp, asm-reset ;
 

\ ----------------------------------------------------
\ k. myneni's extensions, 2001-10-23
\ ----------------------------------------------------

: [ebp] ( n -- m) dup 0= if #@ ebp+ else ebp@ then ; \ ebp@ workaround
: [esp] ( n -- m) #@ esp+ ;     \  "   "

: [eax] ( n -- m) eax@ ;
: [ebx] ( n -- m) ebx@ ;
: [ecx] ( n -- m) ecx@ ;
: [edx] ( n -- m) edx@ ;
: [esi] ( n -- m) esi@ ;
: [edi] ( n -- m) edi@ ;

\ ----------------------------------------------------
\ interface
\ ----------------------------------------------------

asm-reset
use32
decimal

create (next)  here asm-to
  0 [esi] edi mov,
  4 # esi add,
  0 [edi] ebx mov,
  hex ff db, e3 db, decimal \ "ebx jmp," produces wrong code (bug?)
  >asm @ allot

: next,  (next) # jmp, ;
  
previous
previous
forth definitions
base !

also assembler

: code  ( | name -- ) 
  create  here dup 1 cells - ! ( cfa → paramfield )
  here asm-to  asm-reset  also assembler ;

: end-code  >asm @ allot  previous ;

previous
