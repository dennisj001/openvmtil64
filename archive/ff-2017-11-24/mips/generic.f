\ generic mips operations
\
\ requires: generic.f
\
\  TOS: $2 / $v0
\  SP:  $29 / $sp
\  RP:  $30 / $fp
\  AP:  $28 / $gp
\  W:   $25 / $t9
\
\ temporaries: x=$v1, y=$a0, z=$a1


hex

: imm  ( x -- u ) ffff and ;
: dup  
  23bd0000 1 tcells negate imm or a4,      \ $sp <-cell> # $sp addi
  afa20000 a4, ;    \ $sp ) $2 sw
: drop
  8fa20000 a4,      \ $sp ) $2 lw
  23bd0000 1 tcells or a4, ;    \ $sp <cell> # $sp addi
: #  ( x -- )
  dup ffff0000 and 0=  if
    34020000 or a4,  exit  then     \ $0 xxxx # $2 ori
  dup 0<  if
    imm 20020000 or a4,  exit  then  \ $0 xxxx # $2 addi
  dup d# 16 rshift 3c020000 or a4,     \ xxxx # $2 lui
  imm 34420000 or a4, ;       \ $2 yyyy # $2 ori
: cell+  20420004  a4, ;    \ $2 4 # $2 addi
: cell-  2042fffc  a4, ;    \ $2 -4 # $2 addi
: jump  
  600008  a4,         \ $3 jr
  0 a4, ;             \ nop
: next  \ clobbers x
  8f990000  a4,     \ $28 ) $25 lw
  239c0004  a4,     \  $28 4 # $28 addi
  8f230000  a4,     \ $25 ) $3 lw
  0  a4,            \ nop (LDS)
  jump ;
: osargs
  [defined] target-bsd  [if]
    e01020  a4,   \ $a3 $2 move
  [else]
    3a01020  a4,    \ $sp $2 move
  [then] ;
: sp  3a01020  a4, ;    \ $29 $2 move
: rp  3c01020  a4, ;    \ $30 $2 move
: ap  3801020  a4, ;    \ $28 $2 move
: w  3201020  a4, ;     \  $25 $2 move
: x  601020  a4, ;      \  $3 $2 move
: y  801020  a4, ;      \  $4 $2 move
: z  a01020  a4, ;      \ $5 $2 move
: @  8c420000  a4, ;    \ $2 ) $2 lw
: c@  90420000  a4, ;   \ $2 ) $2 lbu
: !  ac620000  a4, ;    \  $3 ) $2 sw
: c!  a0620000  a4, ;   \ $3 ) $2 sb
: sp!  40e820  a4, ;    \  $2 $29 move
: rp!  40f020  a4, ;    \  $2 $30 move
: ap!  40e020  a4, ;    \ $2 $28 move
: w!  40c820  a4, ;     \  $2 $25 move
: x!  401820  a4, ;     \ $2 $3 move
: y!  402020  a4, ;     \ $2 $4 move
: z!  402820  a4, ;     \ $2 $5 move
: +  431021  a4, ;      \ $2 $3 $2 addu
: -  431023  a4, ;      \  $2 $3 $2 subu
: *  
  620018  a4,   \  $3 $2 mult
  1012  a4, ;   \  $2 mflo
: and  431024  a4, ;    \  $2 $3 $2 and
: or  431025  a4, ;     \  $2 $3 $2 or
: xor  431026  a4, ;    \ $2 $3 $2 xor
: /mod
  43001a  a4,   \  $2 $3 div
  1810  a4,     \ $3 mfhi
  1012  a4, ;   \ $2 mflo
: u/mod
  43001b  a4,   \ $2 $3 divu
  1810  a4,     \ $3 mfhi
  1012  a4, ;   \ $2 mflo
: 1+  20420001  a4, ;   \ $2 1 # $2 addi
: aligned
  20420000 1 tcells 1- tuck or  a4,     \  $2 <cell-1> # $2 addi
  invert imm 20010000 or  a4,      \  $0 <~cell-1> # $at addi
  411024  a4, ;     \  $2 $at $2 and
: skip  239c0000 1 tcells or  a4, ;     \ $28 <cell> # $28 addi
: >r
  afc20000  a4,     \ $30 ) $2 sw
  23de0000 1 tcells or  a4, ;   \  $30 <cell> # $30 addi
: r>
  23de0000 1 tcells negate imm or  a4,     \ $30 -4 # $30 addi
  8fc20000  a4, ;   \ $30 ) $2 lw
: lshift  621004  a4, ; \ $3 $2 $2 sllv
: rshift  621006  a4, ; \ $3 $2 $2 srlv
: rshifta  621007  a4, ;    \  $3 $2 $2 srav
: syscall  c  a4, ; \ syscall
: sysarg  ( u -- )
  d# 11 lshift 402020 or a4, ;  \ $2 $a<u> move
: break  0d  a4, ;  \ break
: trylock
  8c620000  a4,     \ $3 ) $2 lw
  10400004  a4,     \ l1 $0 $2 beq
  0  a4,            \ nop
  34420000  a4,     \ 0 # $2 li          
  10000009  a4,     \ ba l2
  0  a4,            \ nop
  34420001  a4,     \ l1: 0 # $2 li  
  e0620000  a4,     \ $3 ) $2 sc
  10400004  a4,     \ l2 $0 $2 beq
  0  a4,            \ nop
  34420001  a4,     \ 1 # $2 li
  10000002  a4,     \ ba l3
  0  a4,            \ nop
  34420000  a4, ;   \ l3: 0 # $2 li; l2:
: pause ;
variable cond
: <
  62082a a4,    \ $2 $3 $at slt
  10200000 cond ! ; \ <dest> $at $0 beq
: =
  14430000 cond ! ; \ <dest> $2 $3 bne
: u<
  62082b a4,        \ $2 $3 $at sltu
  10200000 cond ! ; \ <dest> $at $0 beq
: 0=  
  14400000 cond ! ; \ <dest> $2 $0 beq
: syserr?
  10e00000 cond ! ; \ <dest> $a3 $0 beq
: patch  ( from to -- ) 
  over - 1 tcells / 1- imm  over w4@ or  swap w4! ;
: %if  ( -- a ) ahere  cond @ a4, 0 a4, ;
: if  %if ;
: then  ( a -- ) ahere patch ;
: branch,  ( -- a ) ahere  10000000 a4, 0 a4, ;  \ ba, nop
: else  ( a1 -- a2 ) branch,  swap ahere patch ;
: begin  ( -- a ) ahere ;
: again  ( a -- ) branch,  swap patch ;

decimal
