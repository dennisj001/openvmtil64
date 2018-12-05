\ core definitions


\ miscellaneous constants

0 constant false
-1 constant true
32 constant bl
128 constant i-bit      64 constant s-bit   31 constant len-mask

version 1+ constant version     \ sic


\ some helper words

: on  ( a -- ) true swap ! ;
: off  ( a -- ) false swap ! ;
1 cells 8 =  [if]  3  [then]
1 cells 4 =  [if]  2  [then]
1 cells 2 =  [if]  1  [then]  constant cellshift
: cells  ( n1 -- n2 ) cellshift lshift ;
: bytes  ( n1 -- n2 ) cellshift rshift ;
: cell+  ( a1 -- a2 ) 1 cells + ;
: >body  ( a1 -- a2 ) cell+ ;
: aligned  ( a1 -- a2 )
  [ 1 cells 1- tliteral ] +  [ 1 cells negate tliteral ] and ;


\ stack words

: depth  ( -- n ) s0 @ sp@ - bytes 2 - ;
: nip  ( x y -- y ) swap drop ;
: rot  ( x y z -- y z x ) >r swap r> swap ;
: -rot  ( x y z -- z x y ) swap >r swap r> ;
: 2drop  ( x y -- ) drop drop ;
: 2dup  ( x y -- x y x y ) over over ;
: 2nip  ( x y z q -- z q ) rot drop rot drop ;
: 2swap  ( x y z q -- z q x y ) rot >r rot r> ; 
: ?dup  ( x -- x | x x ) dup dup 0 =  if  drop  then ;
: pick  ( ... n -- x ) ?dup  if  1 + cells sp@ + @  else  dup  then ;
: 2over  ( x y z q -- x y z q x y ) 3 pick 3 pick ;
: 2rot >r >r 2swap r> r> 2swap ;
: clear  ( ... -- ) s0 @ sp! ;


\ arithmetic

: /  ( n1 n2 -- n ) /mod nip ;
: +!  ( n a -- ) dup @ rot + swap ! ;
: invert  ( n1 -- n2 ) -1 xor ;
: mod  ( n1 n2 -- n ) /mod drop ;
: 1+  ( n1 -- n2 ) 1 + ;
: 1-  ( n1 -- n2 ) 1 - ;
: negate  ( n1 -- n2 ) 0 swap - ;
: 2*  ( n1 -- n2 ) 1 lshift ;
: 2/  ( n1 -- n2 ) 1 rshifta ;


\ comparison

: >  ( n1 n2 -- f ) swap < ;
: u>  ( u1 u2 -- f )  swap u< ;
: 0=  ( n -- f ) 0 = ;
: 0<  ( n -- f ) 0 < ;
: <>  ( x y -- f ) = invert ;
: max  ( n1 n2 -- n ) 2dup >  if  drop  else  nip  then ;
: min  ( n1 n2 -- n ) 2dup <  if  drop  else  nip  then ;
: signum  ( n1 -- n2 ) dup 0 >  if  drop 1  else  0<  then ;
: within  ( n lo hi -- f ) over - >r - r> u< ;
: abs  ( n1 -- n2 ) dup 0<  if  negate  then ;


\ string operations

: count  ( a -- a n ) 1+ dup 1- c@ ;

\ count C-string
: zcount  ( a -- a n ) 
  dup  begin  dup c@  while  1+  repeat  over - ;

: compare  ( a1 n1 a2 n2 -- n ) 
  rot 2dup >r >r min  0  do 
    over i + c@ over i + c@ - signum ?dup  if
      nip nip  unloop  unloop  exit  then
  loop  2drop r> r> - signum ;

: fill  ( a n c -- ) swap 0  do  2dup swap i + c!  loop  2drop ;
: erase  ( a n -- ) 0 fill ;
: blank  ( a n -- ) bl fill ;

: cmove  ( a1 a2 u -- )
  ?dup 0=  if  2drop  exit  then
  over + swap  do  count i c!  loop  drop ;

: cmove>  ( a1 a2 u -- )
  ?dup 0=  if  2drop  exit  then
  dup >r rot +  swap r@ +  r> 1+ 1  do  
    over i - c@  over i - c!  
  loop  2drop ;

variable searchlen

: search  ( a1 n1 a2 n2 -- a3 n3 f ) 
  searchlen !  swap dup >r searchlen @ - 1+  0  do
    over i + over searchlen @ swap searchlen @ compare 0=  if 
      drop i + i  unloop  r> swap -  true  exit  then
  loop  drop  r>  false ;


\ abort 

defer abort


[defined] target-unicode  [if]
\ UTF-8 encoding/decoding

: utfenc  ( a c -- a-1 c>>6 ) 
  dup >r 63 and 128 or over c! 1- r> 6 rshift ;

: utfencode  ( a c -- a n )
  dup 128 <  if  over c!  1  exit  then
  dup 2048 <  if  swap 1 + swap utfenc 192 or over c!  2  exit  then
  dup 65536 <  if  swap 2 + swap utfenc utfenc 224 or over c!  
    3  exit  then
  swap 3 + swap utfenc utfenc utfenc 240 or over c!  4 ;

: utfdec  ( a c -- a+1 c2 ) 6 lshift swap 1+ dup c@ 63 and rot or ;

: utfdecode  ( a1 -- a2 c )
  dup c@ dup 128 and  if
    dup 32 and  if
      dup 16 and  if
        7 and utfdec utfdec utfdec
      else
        15 and utfdec utfdec
      then
    else
      31 and utfdec
    then
  then
  swap 1+ swap ;
[then]


\ basic I/O

1 cells buffer: iobuf   \ for holding an UTF character

create stdin 0 ,        create stdout 1 ,       create eof 0 ,

defer key           defer type

: (key)  ( -- c|0 )  
  stdin @ iobuf conread 0=  if  drop  eof on  -1  then ;
: (type)  ( a n -- ) stdout @ -rot conwrite ;
: emit  ( c -- ) 
  iobuf  [defined] target-unicode  [if]  swap utfencode  
  [else]  c!  iobuf 1  [then]  type ;
: cr  ( -- ) 10 emit ;
: space  ( -- ) bl emit ;
: emits  ( c n -- ) begin  ?dup  while  over emit  1-  repeat  drop ;
: spaces  ( n -- ) bl swap emits ;
: page  ( -- ) 12 emit ;


\ data area handling

: here  ( -- a ) h @ ;
: memtop  ( -- a ) r0 @ 1024 - ;
: unused  ( -- n ) r0 @ 1024 -  here - ;  \ including pad

: allot  ( n -- ) 
  dup unused >  if  space s" out of space" type cr abort  then
  h +! ;

: ,  ( n -- ) here !  1 cells allot ;
: c,  ( c -- ) here c! 1 allot ;
: pad  ( -- a ) here 256 + aligned ;
: align  ( -- ) here aligned h ! ;


\ pictured number output

create base 10 ,      variable >num

: <#  ( -- ) pad >num ! ;

: #  ( u1 -- u2 ) 
  base @ u/mod swap dup 9 >  if
    [char] a + 10 - 
  else
    [char] 0 + 
  then  >num @ 1- dup >num ! c! ;

: #s  ( u1 -- n2 ) begin  # dup  while  repeat ;
: #>  ( u1 -- a n ) drop >num @ dup pad swap - ;
: hold  ( c -- ) >num @ 1- dup >r c! r> >num ! ;
: sign  ( n -- ) 0<  if  [char] - hold  then ;
: u.  ( u -- ) <# #s #> type space ;
: (.)  ( n1 -- a n2 ) dup abs <# #s swap sign #> ;
: .  ( n -- ) (.) type space ;
: u.r  ( n1 n2 -- ) >r <# #s #> r> over - 0 max spaces type ;
: .r  ( n1 n2 -- ) >r dup abs <# #s swap sign #> r> over - 0 
  max spaces type ;


\ numeric parsing

: hex  ( -- ) 16 base ! ;       : decimal  ( -- ) 10 base ! ;

: digit  ( c -- n -1 | 0 )
  dup [char] A [char] [ within  if  55 - else  \ 'Z' + 1
  dup [char] a [char] { within  if  87 - else  \ 'z' + 1
  dup [char] 0 [char] : within  if  48 - else  drop  false exit  \ '9' + 1
  then then then  dup base @ <  if  true  else  drop  false  then ;

: number  ( a n1 -- n2 -1 | a n1 0 )
  swap dup c@ [char] - =  if  
    1+ swap 1- -1 >r  else  swap 1 >r 
  then 
  dup >r 0 swap 0 do base @ * over i + c@ digit  if  +  else 
    drop unloop r> r> drop false exit
  then  loop r> drop nip r> *  true ;


\ termination

defer bye

: (bye)  0 halt ;


\ interpretation

variable >in            variable >limit     variable >evlimit
variable sourcebuf      variable blk

1024 buffer: tib        256 buffer: wordbuf
6 constant #input

: source  ( -- a ) sourcebuf @  >limit @ ; 
: source-id  ( -- id ) >evlimit @  if  -1  else  stdin @  then ;
: current-input  ( -- c ) >in @ sourcebuf @ + c@ ;

: save-input  ( -- <input> ) 
  stdin @  >in @  >limit @  sourcebuf @  blk @  
  >evlimit @  #input ;

: default-input  ( -- ) 
  stdin off  >in off  >limit off  tib sourcebuf !  blk off 
  >evlimit off ;

: restore-input ( <input> -- f ) 
  eof off  #input <>  if  default-input  false
  else  >evlimit !  blk !  sourcebuf !  >limit !  >in !  stdin !  
    true  then ;

: ?restore-input  ( <input> -- ) 
  stdin @ >r  restore-input 0=  if 
    space  s" unable to restore input" type cr 
    r> 0=  if  1 halt  else  abort  then 
  then  r> drop ;

: input>r  
  r>  stdin @ >r  >in @ >r  >limit @ >r  sourcebuf @ >r  
  blk @ >r  >evlimit >r  >r ;

: r>input
  r>  r> >evlimit !  r> blk !  r> sourcebuf !  r> >limit !  
  r> >in !  r> stdin !  >r ;

: ?limit  ( -- f ) >in @ >limit @ < ;

: next-input  ( -- -1 c | 0 0 ) 
  ?limit  if  true  current-input 
  else  0 dup  then ;

: wsfilt  ( c1 -- c2 )
  dup 13 =  if  drop  bl  exit  then
  dup 10 =  if  drop  bl  exit  then
  dup 9 =  if  drop  bl  then ;

: parse  ( c | ... -- a ) \ note: different from ANS
  >r  wordbuf 1+  begin  next-input wsfilt r@ <> and  while 
    current-input over c! 1+  1 >in +!  repeat 
  ?limit  if  1 >in +!  then  
  r> drop  wordbuf dup >r  - 1- r@ c!  r> ;  

: word  ( c | ... -- a )
  >r  begin  next-input wsfilt r@ = and  while  1 >in +!  repeat 
  r> parse ;

: accept  ( a n1 -- n2 ) 
  swap dup >r >r  begin  ?dup  while
    key dup 10 = over -1 = or  if  2drop  r> r> -  exit  then 
    r@ c!  r> 1+ >r  1- 
  repeat  r> r> - ;

: query  
  eof off  tib 1024 accept dup 0=  eof @  and  if
  drop  ?restore-input  else  >limit !  >in off  then ;

: nextline
  >in @  dup >limit @ =  if  1+ dup >in !  then
  begin  
      dup >evlimit @ < 0=  if  >limit !  exit  then
      sourcebuf @ over + c@ 10 <>  while  1+  
   repeat  >limit !  ;

: refill  ( -- f )
  blk @  if  false  exit  then
  >evlimit @  if  nextline  >in @ >evlimit @ <  exit  then
  query  true ;

defer findname          \ later moditifed for vocabularies
variable findadr

: >link  ( nfa -- a ) count len-mask and + aligned ;
: >cfa  ( nfa -- a2 ) >link cell+ ;

: findnfa  ( a1 dp -- a2 1 | a1 0 )
  swap findadr !  begin  ?dup while
    dup c@ s-bit and 0=  if   \ not smudged?
      dup count len-mask and  findadr @ count  
      len-mask min compare 0=  if  true exit then 
    then 
    >link @
  repeat  findadr @  false ;

\ initial "findname" (w/o vocabulary support)
: (findname)  ( a1 -- a2 1 | a1 0 ) dp @ findnfa ;

: find  ( a -- a 0 | xt 1 | xt -1 )
  findname  if
    dup >cfa  swap c@ i-bit and  if  1
    else  -1  then  exit  
  else  false  then ;

: '  ( | <name> -- xt ) 
  bl word find 0=  if  space count type  s"  ?" type cr abort then ;

: ?stack  ( ... -- ... ) 
  sp@ s0 @ u< 0=  if  s"  stack underflow" type  cr  abort  then ;

: undefd  ( a u -- ) space  type  s"  ?" type cr  abort ;

: interpret  ( -- )
  begin  bl word dup c@  while
    find  if  execute  ?stack 
    else  count number 0=  if  undefd  then then
  repeat  drop ;

: evaluate  ( a u -- )
  input>r  >evlimit !  sourcebuf !  >in off
  begin  refill  while   interpret  >limit @ 1+ >in !  repeat
  r>input ;

\ bulk evaluate
: bulkread  ( u1 -- a u2 )
  memtop over - dup >r  over 0  do
    key over c!  1+  i 1024 mod 0=  if  [char] . emit  then
  loop  drop  r> swap ;
: transmit  ( u -- ) bulkread evaluate ;


\ defining words

variable current        defer newheader

: header  ( a n -- )
  len-mask min  here dup >r  2dup c!  
  over 1+ allot  1+ swap  cmove
  align  current @ @ ,  r@ newheader  r> current @ ! ;

: create  ( | <name> -- ) 
  bl word count header  ['] (variable) @ , ;

: variable  ( | <name> -- ) create 0 , ;

: constant  ( x | <name> -- ) 
  create  ['] (constant) @ here 1 cells - ! , ;


\ literals

: char  ( | <char> -- c ) 
  bl word 1+  [defined] target-unicode  [if]  utfdecode nip 
  [else]  c@  [then] ;
: literal  ( x -- ) ['] (lit) , , ;
: sliteral  ( a n -- ) 
  ['] (slit) ,  dup >r c, here r@ cmove  r> allot  align ;


\ compiler

variable state

: immediate  ( -- ) current @ @ dup c@ i-bit or swap c! ;

: compile  ( a -- )
  findname  if 
    dup c@ i-bit and  if  >cfa execute  ?stack
    else  >cfa ,  then
  else
    count number 0=  if  undefd  else literal then
  then ;

: ]
  state on  begin  
    bl word dup c@ 0=  if  
      drop refill
    else
      compile  state @ 
    then 
  while repeat ;

: [  state off ; immediate


\ some immediate words

: [char]  ( | <char> -- xc ) char literal ; immediate
: [']  ( | <name> -- cfa ) ' literal ; immediate
: (  ( | ... <paren> -- ) [char] ) parse drop ; immediate

\ round >in upwards to 64 bytes if reading from block
: \  ( | <line> -- ) 
  blk @  if  >in @ 63 + 63 invert and  >in ! 
  else  >limit @ >in !  then ; immediate


\ colon word definitions

: smudge  current @ @ dup c@ s-bit or swap c! ;
: reveal  current @ @ dup c@ s-bit invert and swap c! ;

: :  ( | <name> ... -- ) 
  create  smudge  ['] (:) @ here 1 cells - !  ] ;

: ;  ['] exit ,  state off  reveal ; immediate
: recurse  current @ @ >cfa , ; immediate


\ string words

: "  ( | ..." -- a n ) 
  [char] " parse count >r here r@ cmove  here r> dup allot ;

: c"  ( | ..." -- a ) 
  [char] " parse dup c@ 1+ >r here r@ cmove  here r> allot ;

: s"  ( | ..." -- a n ) 
  [char] " parse count sliteral ; immediate

: ."  ( | ..." -- ) 
  [char] " parse count sliteral ['] type , ; immediate


\ check new definitions

variable warnings

: (newheader)  ( a -- )
  warnings @ 0=  if  drop  exit  then
  dup find if  
    drop  s"  redefined " type  count type  space
  else  2drop  then ;


\ conditional abort

: (?abort)  ( f a n -- ) 
  rot  if  space type  cr  abort  else  2drop  then ;

: abort"  ( f | ... " -- ) 
  [char] " parse count sliteral  ['] (?abort) , ; immediate


\ control structures

: if  ( f -- ) ['] (if) ,  here 0 , ; immediate
: else  ['] (else) ,  here >r 0 , here swap ! r> ; immediate
: then  here swap ! ; immediate
: begin  here ; immediate
: again  ['] (else) , , ; immediate
: until  ( f -- ) ['] (if) , , ; immediate
: while  ( f -- ) ['] (if) ,  here 0 , ; immediate
: repeat  ['] (else) ,  swap ,  here swap ! ; immediate
: do  ( n1 n2 -- ) ['] (do) ,  0 here ; immediate

: ?do  ( n1 n2 -- ) 
  ['] over ,  ['] over ,  ['] = ,  ['] (if) ,
  here 0 ,  ['] drop dup , ,  ['] (else) ,  here 0 ,  here rot ! 
  ['] (do) ,  here ; immediate

: loop  ['] (loop) , ,  ?dup  if  here swap !  then ; immediate

: +loop  ( n -- ) 
  ['] (+loop) , ,  ?dup  if  here swap !  then ; immediate


\ file I/O

256 buffer: zpad

: zstring  ( a1 n -- a2 ) 
  zpad swap dup >r cmove  0 zpad r> + c!  zpad ;

: ior  ( n -- ior ) dup 0 >  if  drop  0  then ;

: open-file  ( a n fam -- fd ior ) 
  >r  zstring  r> OPEN_MODE fsopen dup ior ;

: create-file  ( a n fam -- fd ior )
  >r  zstring  r> O_TRUNC or OPEN_MODE fscreate dup ior ;

: close-file  ( fd -- ior ) fsclose ior ;
: read-file  ( a n fd -- n2 ior ) -rot fsread dup ior ;
: write-file  ( a n fd -- ior ) -rot fswrite ior ;
: reposition-file  ( n fd -- ior ) swap fsseek ior ;
: delete-file  ( a n -- ior ) zstring fsunlink ;

: ?fcheck  ( f -- ) 
  dup 0<  if  space  s" I/O error: " type  .  cr  abort then 
  drop ;


\ file interpretation

: include-file  ( fd -- ) 
  >r  >limit @ >in !  save-input  default-input
  r>  stdin @ >r  stdin ! 
  begin  query  interpret  stdin @ r@ =  until
  r> drop ;     \ eof in `query` restores input

: included  ( a u -- ) 
  r/o open-file ?fcheck  dup >r include-file
  r> close-file ?fcheck ;

: include  ( | <fname> -- ) bl word count included ;


\ deferred words

: crash  ( -- ) s" uninitialized execution vector" type cr abort ;
: defer@  ( xt1 -- xt2 ) >body @ ;
: defer!  ( xt1 xt2 -- ) >body ! ;

: defer  ( | <name> -- ) 
  create ['] (defer) @ here 1 cells - !  ['] crash , ;

: is  ( | <name> -- xt ) 
  state @  if 
    ' literal  ['] defer! ,
  else
    ' defer!
  then ; immediate


\ <builds + does>

variable building

: <builds  ( | <word> -- ) 
  create  ['] (does>) @ here 1 cells - !  here building !  0 , ;

: does>  ( -- a ) r> building @ ! ;


\ command-line access

[defined] target-linux  [defined] target-darwin or  
  [defined] target-freebsd or  [if]
: #arg  ( -- u ) args @ @ ;
: arg  ( u1 -- a u2 )  1+ cells args @ + @ zcount ;
[else]
: #arg  ( -- u ) args @ cell+ @ ;
: arg  ( u1 -- a u2 ) cells args @ @ + @ zcount ;
[then]


\ interpreter loop and startup code

variable h0         variable dp0
defer startup       defer prompt

defer quit  ( ... -- )

: (quit)  ( ... -- )
  reset  clear 
  begin  query  interpret  stdin @ 0=  if  prompt  then  again ;

: cold
  h0 @ h !  dp0 @ dp !  reset  clear  state off  
  default-input  decimal  quit ;

: (abort)  ( ... -- ) state off  default-input  quit ;
: (startup)  prompt  (abort) ;
: (prompt)  s"  ok" type cr ;


\ initialize deferred words (startup code may  override these)

' (key) is key
' (type) is type
' (bye) is bye
' (abort) is abort
' (prompt) is prompt
' (startup) is startup
' (findname) is findname
' (newheader) is newheader
' (quit) is quit


\ after this, OS-specific startup code follows, and `boot`
