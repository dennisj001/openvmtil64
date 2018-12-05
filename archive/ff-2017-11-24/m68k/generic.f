\ generic m68k operations
\
\ TOS: d0
\ SP:  a7 (sp)
\ RP:  a6
\ AP:  a5
\ W:   a4
\ X, Y, Z: a0, d1, d2

hex

: dup  2F00 a2, ;   \ move.l d0, -(sp)
: drop  201F a2, ;  \ move.l (sp)+, d0
: #  ( x -- )
  dup -128 127 within  if
    ff and 7000 or a2,  exit  then  \ moveq.l d0, #xx
  203c a2, a4, ;    \ move.l #xxxxxxxx, d0
: cell+  5080 1 tcells 9 lshift or a2, ;     \ addq.l #<cell>, d0
: cell-  5180 1 tcells 9 lshift or a2, ;     \ subq.l #<cell>, d0
: jump  4ed0 a2, ;  \ jmp (a0)
: next
  285d a2,  \ move.l (a5)+, a4
  2054 a2,  \ move.l (a4), a0
  jump ;
[defined] target-bsd  [if]
: osargs  200a a2, ;    \ move.l a2, d0
[else]
: osargs 200f a2, ;     \ move.l sp, d0
[then]
: sp  200f a2, ;    \ move.l sp, d0
: rp  200e a2, ;    \ move.l a6, d0
: ap  200d a2, ;    \ move.l a5, d0
: w  200c a2, ;    \ move.l a4, d0
: x  2008 a2, ;    \ move.l a0, d0
: y  2001 a2, ;    \ move.l d1, d0
: z  2002 a2, ;    \ move.l d2, d0
: @  
  2240 a2,   \ movea.l d0, a1
  2011 a2, ;    \ move.l (a1), d0
: c@ 
  2240 a2,  \ movea.l d0, a1
  7000 a2,  \ moveq.l #0, d0
  1011 a2, ;    \ move.b (a1), d0
: !  2080 a2, ; \ move.l d0, (a0)
: c!  1080 a2, ;    \ move.b d0, (a0)
: sp!  2e40 a2, ;   \ movea.l d0, sp
: rp!  2c40 a2, ;   \ movea.l d0, a6
: ap!  2a40 a2, ;   \ movea.l d0, a5
: w!  2840 a2, ;   \ movea.l d0, a4
: x!  2040 a2, ;   \ movea.l d0, a0
: y!  2200 a2, ;   \ movea.l d0, d2
: z!  2400 a2, ;   \ movea.l d0, d3
: +  d088 a2, ;     \ add.l a0, d0
: -  9088 a2, ;     \ sub.l a0, d0
: *
  2608 a2,  \ move.l a0, d3
  4c03 a2, 0800 a2, ;   \ muls.l d3, d0
: and
  2608 a2,  \ move.l a0, d3
  c083 a2, ;    \ and.l d3, d0
: or
  2608 a2,  \ move.l a0, d3
  8083 a2, ;    \ or.l d3, d0
: xor
  2608 a2,  \ move.l a0, d3
  b780 a2, ;    \ eor.l d3, d0
: break  4e41 a2, ;   \ trap #1
: /mod
  2608 a2,  \ move.l a0, d3
  [defined] target-coldfire  [if]
  2800 a2,  \ move.l d0, d4
  4c43 a2, 0800 a2, \ divs.l d3, d0
  4c43 a2, 4803 a2, \ rems.l d3, d3:d4
  [else]
  4c43 a2, 0803 a2,     \ divsl.l d3, d3:d0  
  [then]
  2043 a2, ;    \ movea.l d3, a0
: u/mod
  2608 a2,      \ move.l a0, d3
  [defined] target-coldfire  [if]
  2800 a2,      \ move.l d0, d4
  4c43 a2, 0000 a2, \ divu.l d3, d0
  4c43 a2, 4003 a2, \ remu.l d3, d3:d4
  [else]
  4c43 a2, 0403 a2,     \ divul.l d3, d3:d0  
  [then]
  2043 a2, ;    \ movea.l d3, a0
: 1+  5280 a2, ;    \ addq.l #1, d0
: aligned
  5080 1 tcells 1- tuck 9 lshift or a2,  \ addq.l #<cell-1>, d0
  c0bc a2,  invert a4, ;   \ and.l #~<cell-1>, d0
: skip  508d 1 tcells 9 lshift or a2, ; \ addq.l #<cell>, a5
: >r  2cc0 a2, ;    \ move.l d0, (a6)+
: r>  2026 a2, ;    \ move.l -(a6), d0
: lshift
  2608 a2,  \ move.l a0, d3
  e7a8 a2, ;    \ lsl.l d3, d0
: rshift
  2608 a2,  \ move.l a0, d3
  e6a8 a2, ;    \ lsr.l d3, d0
: rshifta
  2608 a2,  \ move.l a0, d3
  e6a0 a2, ;    \ asr.l d3, d0
: syscall  4e40 a2, ;   \ trap #0
: sysarg  ( u -- ) 9 lshift 2000 or a2, ; \ move.l d0, d<n>
: trylock
  7001 a2,  \ moveq.l #1, d0
  4ad0 a2,  \ tas (a0)
  6702 a2,  \ beq l1
  7000 a2, ;    \ moveq.l #0, d0   l1:
: pause ;
variable cond
: <
  b1c0 a2,      \ cmpa.l d0, a0
  6c00 cond ! ; \ bge
: =
  b088 a2,      \ cmp.l a0, d0
  6600 cond ! ; \ bne
: u<
  b1c0 a2,      \ cmpa.l d0, a0
  6400 cond ! ; \ bls
: 0=  
  4a80 a2,      \ tst.l d0
  6600 cond ! ; \ bne
: cs?  6400 cond ! ;           \ bcc
: patch  ( from to -- ) over 2 + - swap 1+ c! ;
: %if  ( -- a ) ahere  cond @ a2, ;
: if  %if ;
: then  ( a -- ) ahere patch ;
: branch,  ( -- a ) ahere  6000 a2, ;   \ bra
: else  ( a1 -- a2 ) branch,  swap ahere patch ;
: begin  ( -- a ) ahere ;
: again  ( a -- ) branch,  swap patch ;

decimal
