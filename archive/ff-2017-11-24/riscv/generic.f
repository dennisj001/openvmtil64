\ generic riscv operations
\
\ requires: generic.f
\
\  TOS: x10 / a0
\  SP:  x2  / sp
\  RP:  x3  / gp
\  AP:  x18 / s2
\  W:   x19 / s3
\
\ temporary used in assembler and `next`: x5 / t0
\ temporaries: x=x11, y=x12, z=x13

hex

: imm12  ( x -- y ) d# 20 lshift ;
: dup
  10113 -1 tcells imm12 or a4,  \  sp sp <-cell> # addi
  a12023 a4, ;  \ x10 sp ) sw
: drop
  12503 a4,     \ x10 sp ) lw
  10113 1 tcells imm12 or a4, ;  \ sp sp <cell> # addi
: #  ( x -- )
  dup d# -2048 d# 2048 within 0=  if
    dup fffff000 and 00000537 or a4,    \ x10 xxxx # lui
    imm12 00056513 or a4,     \ x10 x10 yyyy # ori
  else  imm12 00000513 or a4,  then ;   \ x10 x0 xxxx # addi
: cell+  1 tcells imm12 50513 or a4, ;   \ x10 x10 <cell> # addi
: cell-  -1 tcells imm12 50513 or a4, ; \ x10 x10 <-cell> # addi
: jump  58067 a4, ; \ x11 jr
: next
  92983 a4,     \ x19 x18 ) lw
  1 tcells imm12 90913 or a4,    \ x18 x18 <cell> # addi
  9a283 a4,     \ x5 x19 ) lw
  28067 a4, ;   \ x5 jr
: osargs
  [defined] target-bsd  [if]
    60513 a4,   \ x10 x12 mv
  [else]
    10513 a4,   \ x10 sp mv
  [then] ;
: sp  10513 a4, ;   \ x10 sp mv
: rp  18513 a4, ;   \ x10 x3 mv
: ap  90513 a4, ;   \ x10 x18 mv
: w  98513 a4, ;    \ x10 x19 mv
: x  58513 a4, ;    \ x10 x11 mv
: y  60513 a4, ;    \ x10 x12 mv
: z  68513 a4, ;    \ x10 x13 mv
: @  52503 a4, ;    \ x10 x10 ) lw
: c@  54503 a4, ;   \  x10 x10 ) lbu
: !  a5a023 a4, ;   \ x10 x11 ) sw
: c!  a58023 a4, ;  \ x10 x11 ) sb
: sp!  50113 a4, ;  \ sp x10 mv
: rp!  50193 a4, ;  \ x3 x10 mv
: ap!  50913 a4, ;  \ x18 x10 mv
: w!  50993 a4, ;   \ x19 x10 mv
: x!  50593 a4, ;   \  x11 x10 mv
: y!  50613 a4, ;   \ x12 x10 mv
: z!  50693 a4, ;   \ x13 x10 mv
: +  b50533 a4, ;   \ x10 x10 x11 add
: -  40b50533 a4, ; \ x10 x10 x11 sub
: *  2b50533 a4, ;  \ x10 x10 x11 mul
: and  b57533 a4, ; \ x10 x10 x11 and
: or  b56533 a4, ;  \ x10 x10 x11 or
: xor  b54533 a4, ; \ x10 x10 x11 xor
: /mod
  50293 a4,         \ x5 x10 mv
  2b54533 a4,       \ x10 x10 x11 div
  2b2e5b3 a4, ;     \ x11 x5 x11 rem
: u/mod
  50293 a4,         \ x5 x10 mv
  2b55533 a4,       \ x10 x10 x11 div
  2b2f5b3 a4, ;     \ x11 x5 x11 remu
: 1+  150513 a4, ;  \ x10 x10 1 # addi
: aligned
  1 tcells 1- dup imm12 50513 or a4,        \ x10 x10 <cell-1> # addi
  invert imm12 57513 or a4, ;   \ x10 x10 <~cell-1> # andi
: skip  90913 1 tcells imm12 or a4, ;    \ x18 x18 <cell> # addi
: >r
  a1a023 a4,    \ x10 x3 ) sw
  1 tcells imm12 18193 or a4, ;  \ x3 x3 <cell> # addi
: r>
  -1 tcells imm12 18193 or a4,  \ x3 x3 <-cell> # addi
  1a503 a4, ;    \ x10 x3 ) lw
: lshift  b51533 a4, ;  \ x10 x10 x11 sll
: rshift  b55533 a4, ;  \ x10 x10 x11 srl
: rshifta  40b55533 a4, ;   \ x10 x10 x11 sra
: syscall  73 a4, ; \ ecall
: sysarg!  ( u -- )
  7 lshift 00050013 or a4, ;    \ x<u> x10 0 # addi
: syscall#  d# 17 sysarg! ;
: break  00100073 a4, ;  \ ebreak
: trylock
  1005a52f a4,  \ x10 x11 lr.w
  51a63 a4,     \ x10 x0 l1 beq
  100513 a4,    \ x10 x0 1 # addi
  18b5252f a4,  \ x10 x10 x11 sc.w
  153513 a4,    \ x10 x10 seqz
  463 a4,       \ x0 x0 l2 beq
  513 a4, ;     \ l1: x10 x0 mv   l2:
: pause ;
variable cond
: <  a5d063 cond ! ;  \ x11 x10 <l> bge
: =  b51063 cond ! ;  \ x10 x11 <l> bne
: u<  a5f263 cond ! ;   \ x11 x10 <l> bgeu
: 0=  51063 cond ! ;    \ x10 x0 <l> bne
: sboff  ( x -- u )
  \ ____ ____ ____ ____ ___A BCCC CCCD DDD_
  \ ACCC CCCX XXXX YYYY YZZZ DDDD BOOO OOOO
  dup 1000 and d# 19 lshift         \ A
  over 03e0 and d# 20 lshift or      \ C
  over 001e and 7 lshift or        \ D
  swap 0800 and 4 rshift or ;     \ B
: patch  ( from to -- ) over - sboff over w4@ or swap w4! ;
: %if  ( -- a ) ahere  cond @ a4, ;
: if  %if  ;
: then  ( a -- ) ahere patch  ;
: branch,  ( -- a ) ahere  63 a4, ;  \ x0 x0 <l> beq
: else  ( a1 -- a2 ) branch,  swap ahere patch ;
: begin  ( -- a ) ahere ;
: again  ( a -- ) branch,  swap patch ;

decimal
