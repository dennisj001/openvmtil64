\ generic sparc operations
\
\ requires: generic.f
\
\  TOS: %r1
\  SP:  %g2
\  RP:  %g3
\  AP:  %g4
\  W:   %g5


hex

: %lo  ( n -- u ) 3ff and ;
: %hi  ( n -- u ) d# 10 rshift ;
: dup  8420a004 a4, c220a000 a4, ;  \ dec #4, %g2; st %r1, (%g2)
: drop  c200a000 a4, 8400a004 a4, ; \ ld (%g2), %r1; inc #4, %g2
: #  ( x -- ) 
  dup d# -4095 0 within  if
    negate 82202000 or a4,  exit  then \ sub %g0, #xxxx, %r1
  dup d# 0 d# 4096 within  if  
    82102000 or a4,  exit  then  \ or %g0, #xxxx, %r1
  dup %hi 03000000 or a4,   \ sethi #xxxx, %r1
  %lo 82106000 or a4, ;     \ or %r1, #yyyy, %r1
: cell+  82006000 1 tcells or a4, ;     \ inc #<cell>, %r1
: cell-  82206000 1 tcells or a4, ;     \ dec #<cell>, %r1
: jump  
  81c46000 a4,   \ jmp (%r1)
  01000000 a4, ; \ nop
: next      \ clobbers x
  ca012000 a4,  \ ld (%g4), %g5
  88012000 1 tcells or a4,  \ inc #<cell>, %g4
  e2016000 a4,  \ ld (%g5), %l1
  jump ;
[defined] bsd [if]
: osargs  ;  \ nop (%g1/%r1 already contains ptr)
[else]
\ XXX: is this offset wordsize dependent?
: osargs  8203a040 a4, ;    \ add %sp, #64, %r1
[then]
: sp  82100002 a4, ;     \ mov %g2, %r1
: rp  82100003 a4, ;     \ mov %g3, %r1
: ap  82100004 a4, ;     \ mov %g4, %r1
: w  82100005 a4, ;     \ mov %g5, %r1
: x  82100011 a4, ;     \ mov %l1, %r1
: y  82100012 a4, ;     \ mov %l2, %r1
: z  82100013 a4, ;     \ mov %l3, %r1
: @  c2006000 a4, ;       \ ld (%r1), %r1
: c@  c2086000 a4, ;    \ ldub (%r1), %r1
: !  c2246000 a4, ;      \ st %r1, (%l1)
: c!  c22c6000 a4, ;     \ stb %r1, (%l1)
: sp!  84100001 a4, ;    \ mov %r1, %g2
: rp!  86100001 a4, ;    \ mov %r1, %g3
: ap!  88100001 a4, ;    \ mov %r1, %g4
: w!  8a100001 a4, ;    \ mov %r1, %g5
: x!  a2100001 a4, ;    \ mov %r1, %l1
: y!  a4100001 a4, ;    \ mov %r1, %l2
: z!  a6100001 a4, ;    \ mov %r1, %l3
: +  82004011 a4, ;      \ add %r1, %l1, %r1
: -  82204011 a4, ;      \ sub %r1, %l1, %r1
: *  82584011 a4, ;      \ smul %r1, %l1, %r1
: and  82084011 a4, ;    \ and %r1, %l1, %r1
: or  82104011 a4, ;     \ or %r1, %l1, %r1
: xor  82184011 a4, ;    \ xor %r1, %l1, %r1
: /mod   \ tos /mod x -> tos=q, x=r, clobbers y, z
  80900001 a4,  \ tst %r1
  1c800006 a4,  \ bpos l1
  01000000 a4,  \ nop
  a6202001 a4,  \ sub %g0, #1, %l3
  81800013 a4,  \ wry %g0, %l3
  10800003 a4,  \ ba l2
  01000000 a4,  \ nop
  81800000 a4,  \ l1: wry %g0, %g0
  a4784011 a4,  \ l2: sdiv %r1, %l1, %l2
  a65c8011 a4,  \ smul %l2, %l1, %l3
  a6204013 a4,  \ sub %r1, %l3, %l3
  82100012 a4,  \ mov %l2, %r1
  a2100013 a4, ; \ mov %l3, %l1
: u/mod     \ tos u/mod x -> tos=q, x=r, clobbers z
  81800000 a4,      \ wry %g0, %g0
  a4704011 a4,      \ udiv %r1, %l1, %l2
  a6548011 a4,      \ umul %l2, %l1, %l3
  a6204013 a4,      \ sub %r1, %l3, %l3
  82100012 a4,      \ mov %l2, %r1
  a2100013 a4, ;    \ mov %l3, %l1
: 1+  82006001 a4, ;       \ inc #1, %r1
: aligned  
  82006000 1 tcells 1- tuck or a4,      \ inc #<cell-1>, %r1
  82286000 or a4, ;    \ bclr #<cell-1>, %r1
: skip  88012000 1 tcells or a4, ;  \ inc #<cell>, %g4
: >r  
  c220e000 a4,      \ st %r1, (%g3)
  8600e000 1 tcells or a4, ;    \ inc #<cell>, %g3
: r>
  8620e000 1 tcells or a4,  \ dec #<cell>, %g3
  c200e000 a4, ;    \ ld (%g3), %r1
: lshift  83284011 a4, ;    \ sll %r1, %l1, %r1
: rshift  83304011 a4, ;    \ srl %r1, %l1, %r1
: rshifta  83384011 a4, ;   \ sra %r1, %l1, %r1
: syscall  
  91d02000 [defined] target-linux  [if] h# 10 or [then]  a4, ; \ ta %g0, 10/0
: sysarg  ( u -- )
  d# 25 lshift  90100001 or a4, ;  \ mov %r1, %o<0...>
: sysresult  82100008 a4, ;     \ mov %o0, %r1
: break  91d02001 a4, ;     \ ta %g0, 1
: trylock  c26c6000 a4, ;   \ ldstub (%l1), %r1
: pause ;
variable cond
: <
  80a44001 a4,          \ cmp %l1, %r1
  0b cond ! ;            \ bge
: =
  80a44001 a4,          \ cmp %l1, %r1
  9 cond ! ;            \ bne
: u<
  80a44001 a4,          \ cmp %l1, %r1
  0d cond ! ;            \ bae
: 0=  
  80900001 a4,          \ tst %r1
  9 cond ! ;           \ bnz
: cs?  0d cond ! ;           \ bcs

: patch  ( from to -- ) 
  over - 1 tcells / 3fffff and over w4@ or  swap w4! ;
: %if  ( -- a ) 
  ahere  cond @ d# 25 lshift  800000 or a4, \ b<xx>
  01000000 a4, ;    \ nop
: if  %if ;
: then  ( a -- ) ahere patch ;
: branch,  ( -- a ) ahere  10800000 a4, 01000000 a4, ;  \ ba, nop
: else  ( a1 -- a2 ) branch,  swap ahere patch ;
: begin  ( -- a ) ahere ;
: again  ( a -- ) branch,  swap patch ;

decimal
