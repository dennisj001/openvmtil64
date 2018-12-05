\ generic PPC operations
\
\ requires: generic.f
\
\  TOS: r3
\  SP:  r1
\  RP:  r11
\  AP:  r13
\  W:   r14
\
\ temporaries: x=r4, y=r5, z=r6

hex

: dup  9461fffc a4, ;    \  r3 r1 -4 # stwu
: drop
  80610000 a4,  \ r3 r1 ) lwz
  38210004 a4, ;    \ r1 r1 4 # addi
: #  ( x -- )
  dup d# -32768 d# 32768 within  if 
    ffff and 38600000 or a4,  exit  then    \ r3 r0 xxxx # addi
  dup d# 16 rshifta 3c600000 or a4,  \  r3 r3 yyyy # addis
  ffff and 38630000 or a4, ;    \ r3 r0 xxxx # addi
: cell+  38630004 a4, ; \ r3 r3 4 # addi
: cell-  3863fffc a4, ; \ r3 r3 -4 # addi
: jump
  7c8803a6 a4,  \ r2 mtlr
  4e800020 a4, ;    \ blr
: next
  81cd0000 a4,  \  r14 r13 ) lwz
  39ad0004 a4,  \ r13 r13 4 # addi
  808e0000 a4,  \  r4 r14 ) lwz
  7c8803a6 a4,  \ r4 mtlr
  4e800020 a4, ;    \ blr
: osargs
  [defined] target-bsd  [if]
      7d034378 a4,  \ r3 r8 mr
  [else]  7c230b78 a4, [then] ; \ r3 r1 mr
: sp  7c230b78 a4, ;    \ r3 r1 mr
: rp  7d635b78 a4, ;    \ r3 r11 mr
: ap  7da36b78 a4, ;    \ r3 r13 mr
: w  7dc37378 a4, ;     \ r3 r14 mr
: x  7c832378 a4, ;     \ r3 r4 mr
: y  7ca32b78 a4, ;     \ r3 r5 mr
: z  7cc33378 a4, ;     \ r3 r5 mr
: @  80630000 a4, ;     \  r3 r3 ) lwz
: c@  88630000 a4, ;    \ r3 r3 ) lbz
: !  90640000 a4, ;     \ r3 r4 ) stw
: c!  98640000 a4, ;    \ r3 r4 ) stb
: sp!  7c611b78 a4, ;   \ r1 r3 mr
: rp!  7c6b1b78 a4, ;   \ r11 r3 mr
: ap!  7c6d1b78 a4, ;   \ r13 r3 mr
: w!  7c6e1b78 a4, ;    \ r14 r3 mr
: x!  7c641b78 a4, ;    \ r4 r3 mr
: y!  7c651b78 a4, ;    \ r5 r3 mr
: z!  7c661b78 a4, ;    \ r6 r3 mr
: +  7c641a14 a4, ;     \ r3 r4 r3 add
: -  7c641850 a4, ;     \ r3 r3 r4 sub
: *  7c6419d6 a4, ;     \  r3 r4 r3 mullw
: and  7c831838 a4, ;   \ r3 r4 r3 and
: or  7c831b78 a4, ;    \ r3 r4 r3 or
: xor  7c831a78 a4, ;   \ r3 r4 r3 xor
: /mod
  7c651b78 a4,  \ r5 r3 mr
  7c6523d6 a4,  \ r3 r5 r4 divw
  7cc321d6 a4,  \ r6 r3 r4 mullw
  7cc62850 a4,  \ r6 r5 r6 sub
  7cc43378 a4, ;    \  r4 r6 mr
: u/mod
  7c651b78 a4,  \ r5 r3 mr
  7c652396 a4,  \  r3 r5 r4 divwu
  7cc321d6 a4,  \ r6 r3 r4 mullw
  7cc62850 a4,  \ r6 r5 r6 sub
  7cc43378 a4, ;    \ r4 r6 mr
: 1+  38630001 a4, ;    \ r3 r3 1 # addi
: aligned
  38630003 a4,  \ r3 r3 3 # addi
  5463003a a4, ;    \ r3 r3 2 # clrrwi
: skip  39ad0004 a4, ;  \ r13 r13 4 # addi
: >r
  906b0000 a4,  \ r3 r11 ) stw
  396b0004 a4, ;    \ r11 r11 4 # addi 
: r>  846bfffc a4, ;    \ r3 r11 -4 # lwzu
: lshift  7c632030 a4, ;    \ r3 r3 r4 slw
: rshift  7c632430 a4, ;    \ r3 r3 r4 srw
: rshifta  7c632630 a4, ;   \ r3 r3 r4 sraw
: sysarg!  ( u -- )
  d# 16 lshift 7c601b78 or a4, ; \ r<x> r3 mr
: syscall#  ( u -- ) 0 sysarg! ;
: syscall  44000002 a4, ;   \ sc
: break  7fe00008 a4, ;     \ trap
: trylock
  7cc02028 a4,  \ r6 r0 r4 lwarx
  38600000 a4,  \ r3 0 # li
  2c060000 a4,  \ crf0 r6 0 # cmpwi
  40820018 a4,  \  =  if
  38600001 a4,  \ r3 1 # li
  7c60212d a4,  \  r3 r0 r4 stwcx.
  4082000c a4,  \ =  if
  4c00012c a4,  \   isync
  38600001 a4, ; \  r3 1 # li  then  then
: pause ;
variable cond
: <
  7c041800 a4,  \ crf0 r4 r3 cmpw
  800000 cond !  ; \  bge 
: =
  7c041800 a4,  \ crf0 r4 r3 cmpw
  820000 cond !  ; \ bne
: u<
  7c041840 a4, \ crf0 r4 r3 cmplw
  800000 cond !  ; \ bge
: 0=  
  2c030000 a4,  \ crf0 r3 0 # cmpwi
  820000 cond !  ; \ bne
: syserr?  830000 cond ! ;  \ bso
: patch  ( from to -- ) 
  over -  fffc and  over w4@ or swap w4! ;
: %if  ( -- a ) ahere  cond @ 40000000 or a4, ;
: if  %if  ;
: then  ( a -- ) ahere patch  ;
: branch,  ( -- a ) ahere  48000000 a4,  ;  \ b 
: else  ( a1 -- a2 ) branch,  swap ahere patch ;
: begin  ( -- a ) ahere ;
: again  ( a -- ) ahere - h# 03fffffc 48000000 or a4, ;

decimal
