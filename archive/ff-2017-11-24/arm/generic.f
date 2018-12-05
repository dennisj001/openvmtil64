\ generic ARM operations
\
\ requires: generic.f
\
\  TOS: r0
\  SP:  r13 (sp)
\  RP:  r14 (lr)
\  AP:  r12 (ip)
\  W:   r11 (fp)
\
\ temporaries: x=r2, y=r3, z=r4

hex

: dup  e52d0004 a4, ;       \ str r0 [ r13 -4 # ] !
: drop  e49d0004 a4, ;      \ ldr r0 [ r13 ] 4 #
: #  ( x -- )
  dup 0 d# 256 within  if
    e3a00000 or a4,  exit  then      \ mov r0 xx #
  \ XXX small negatives -> mvn r0 xx #
  e51f0000 a4,      \ ldr r0 [ pc 8 # ]
  ea000000 a4,  a4, ;     \ b +4
: cell+  e2800000 1 tcells or a4, ;     \ add r0 r0 <cell> #
: cell-  e2400000 1 tcells or a4, ;     \ sub r0 r0 <cell> #
: jump  e1a0f002 a4, ;      \ mov pc r2
: next
  e49cb000 1 tcells or a4,  \  ldr r11 [ r12 ] <cell> #
  e59bf000 a4, ; \ ldr pc [ r11 ]
: osargs
  [undefined] target-bsd  [if]  e1a0000d a4,  [then] ; \  mov r0 sp
: sp  e1a0000d a4, ; \ mov r0 sp
: rp  e1a0000e a4, ; \   mov r0 r14
: ap  e1a0000c a4, ; \ mov r0 r12
: w  e1a0000b a4, ; \ mov r0 r11
: x  e1a00002 a4, ; \  mov r0 r2
: y  e1a00003 a4, ; \ mov r0 r3
: z  e1a00004 a4, ; \  mov r0 r4
: @  e5900000 a4, ; \ ldr r0 [ r0 ]
: c@  e5d00000 a4, ; \ ldr b r0 [ r0 ]
: !  e5820000 a4, ;  \ str r0 [ r2 ]
: c!  e5c20000 a4, ;    \  str b r0 [ r2 ]
: sp!  e1a0d000 a4, ;   \ mov sp r0
: rp!  e1a0e000 a4, ; \ mov r14 r0
: ap!  e1a0c000 a4, ; \ mov r12 r0
: w!  e1a0b000 a4, ; \ mov r11 r0
: x!  e1a02000 a4, ;    \ mov r2 r0
: y!  e1a03000 a4, ;    \  mov r3 r0
: z!  e1a04000 a4, ;    \ mov r4 r0
: +  e0800002 a4, ;     \ add r0 r0 r2
: -  e0400002 a4, ;     \ sub r0 r0 r2
: *  e0000290 a4, ; \ mul r0 r0 r2
: and  e0000002 a4, ;   \ and r0 r0 r2
: or  e1800002 a4, ;    \ orr r0 r0 r2
: xor  e0200002 a4, ;   \ eor r0 r0 r2 
: /mod  \ tos /mod x -> tos=q, x=r, clobbers y z
\ from: http://www.peter-cockerell.net/aalp/html/ch-6.html:
\ r0 = lhs, r1 = rhs -> r2 = div, r3 = mod
  e1a01002 a4,  \ mov r1 r2
  e0305001 a4,  \ eor s r5 r0 r1               \ divsgn
  e1b06000 a4,  \ mov s r6 r0                   \ modsgn
  42600000 a4,  \  rsb mi r0 r0 0 #
  e3310000 a4,  \ teq r1 0 #
  42611000 a4,  \  rsb mi r1 r1 0 #
  ea000006 a4,  \ b l# udiv32
  e3350000 a4,  \ l: sdiv32r  teq r5 0 #
  42622000 a4,  \ rsb mi r2 r2 0 #
  e3360000 a4,  \ teq r6 0 #
  42633000 a4,  \ rsb mi r3 r3 0 #
  e1a00002 a4,  \ mov r0 r2
  e1a02003 a4,  \ mov r2 r3
  ea00000e a4,  \  b l# smdone 
\ l: udiv32      r0 = lhs, r1 = rhs -> r2 = div, r3 = mod
  e3a02000 a4,  \ mov r2 0 #
  e3a03000 a4,  \ mov r3 0 #
  e3a04020 a4,  \ mov r4 d# 32 #      
  e2544001 a4,  \ sub s r4 r4 1 #
  afffff3 a4,   \ b eq l# sdiv32r
  e1b00080 a4,  \  mov s r0 r0 lsl 1 #
  5affffff a4,  \  b pl l# udiv32_2
  e1b00080 a4,  \ l: udiv32_2  mov s r0 r0 lsl 1 #
  e0a33003 a4,  \ adc r3 r3 r3
  e1530001 a4,  \ cmp r3 r1
  20433001 a4,  \ sub cs r3 r3 r1
  e0a22002 a4,  \ adc r2 r2 r2 
  e2544001 a4,  \ sub s r4 r4 1 #
  1afffff8 a4,  \ b ne l# udiv32_2
  eaffffe9 a4,  \  b l# sdiv32r
\   l: smdone
  ;
: u/mod   \ tos u/mod x -> tos=q, x=r, clobbers y z
\ uses a different algorithm, as the code above doesn't do a full unsigned 32 bit divide
  e1a05000 a4,  \ mov r5 r0
  e1a04002 a4,  \ mov r4 r2
  e15200a5 a4,  \ cmp r2 r5 lsr 1 #
  91a02082 a4,  \ l: usm1  mov ls r2 r2 lsl 1 #
  e15200a5 a4,  \ cmp r2 r5 lsr 1 #
  9afffffc a4,  \ b ls l# usm1
  e3a00000 a4,  \ mov r0 0 #
  e1550002 a4,  \ l: usm2  cmp r5 r2
  20455002 a4,  \ sub cs r5 r5 r2
  e0a00000 a4,  \ adc r0 r0 r0
  e1a020a2 a4,  \ mov r2 r2 lsr 1 #
  e1520004 a4,  \ cmp r2 r4
  2afffff9 a4,  \ b cs l# usm2
  e1a02005 a4, ; \ mov r2 r5
: 1+  e2800001 a4, ;    \ add r0 r0 1 #
: aligned
  e2800000 1 tcells 1- tuck or a4,  \ add r0 r0 <cell-1> #
  e3c00000 or a4, ; \   bic r0 r0 <cell-1> #
: skip  e28cc000 1 tcells or a4, ;  \  add r12 r12 4 #
: >r  e48e0004 a4, ;    \ str r0 [ r14 ] 4 #
: r>  e53e0004 a4, ;    \ ldr r0 [ r14 -4 # ] !
: lshift  e1a00210 a4, ; \ lsl r0 r0 r2
: rshift  e1a00230 a4, ; \ lsr r0 r0 r2
: rshifta  e1a00250 a4, ; \ asr r0 r0 r2
: syscall# e1a07000 a4, ;   \ mov r7 r0
: syscall  ef000000 a4, ;   \ swi 0 #
: sysarg    ( u -- )
  d# 12 lshift e1a00000 or a4, ; \ mov r<n> r0
: break  e7f001f0 a4, ;     \ dcd h# e7f001f0 #
: trylock
  e3a01001 a4,  \ mov r1 1 #
  e1920f9f a4,  \ ldrex r0 [ r2 ]
  e3300000 a4,  \ teq r0 0 #
  e3a00000 a4,  \ mov r0 0 #
  1a000003 a4,  \ b ne l1
  e1820f91 a4,  \ strex r0 r1 [ r2 ]
  e3300000 a4,  \ teq r0 0 #
  3a00001 a4,   \ mov eq r0 1 #
  13a00000 a4, ; \ mov ne r0 0 #  l1:
: pause
  ee070f90 a4, ; \ mcr p15 0 # r0 c7 c0 4 # (ARMv7: WFI - 03200002, or: WFE - e320f002)

variable cond
: <
  e1520000 a4,  \ cmp r2 r0
  aa000000 cond ! ; \  b ge 
: =
  e1520000 a4,  \ cmp r2 r0
  1a000000 cond ! ; \ b ne
: u<
   e1520000 a4, \ cmp r2 r0
  2a000000 cond ! ; \ b cs
: 0=  
  e3300000 a4,  \ teq r0 0 #
  1a000000 cond ! ; \ b ne
: cs? 3a000000 cond ! ; \ b cc
: patch  ( from to -- ) 
  over - 2 rshifta 2 - ffffff and over w4@ or  swap w4! ;
: %if  ( -- a ) ahere  cond @ a4, ;
: if  %if ;
: then  ( a -- ) ahere patch ;
: branch,  ( -- a ) ahere  ea000000 a4, ;  \ b 
: else  ( a1 -- a2 ) branch,  swap ahere patch ;
: begin  ( -- a ) ahere ;
: again  ( a -- ) branch,  swap patch ;

decimal
