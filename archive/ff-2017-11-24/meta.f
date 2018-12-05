\ meta compiler
\
\ dict-entry: [len(1) name(?) link cf pf(?)]
\
\ requires: endian.f


vocabulary meta     vocabulary target
only forth also meta definitions

variable tbase          variable torigin
variable mdp            variable mh
variable mkh


\ code for building the final image

4096 constant minkernel     variable kernelsize

variable entrypoint
variable codebuffer
variable imagestart         variable imageend
variable codeaddr           variable codesize
variable bssaddr            variable bsssize

: copyimage  ( a u -- ) here swap dup >r cmove  r> allot ;
: imagesize  ( -- u ) imageend @ imagestart @ - ;

: writeimage  ( a u -- )
  zstring w/o OPENX_MODE fsopen dup ior ?fcheck
  >r  imagestart @ imagesize r@ write-file ?fcheck
  r> close-file ?fcheck ;

\ this is needed to metacompile with a forth that has the old 
\ header layout:
\ : >name  ( a1 -- a2 ) cell+ ;
: >name ;
: tcells  ( u1 -- u2 ) twordsize @ * ;
: tcell+  ( u1 -- u2 ) 1 tcells + ;
: tallot  ( n -- ) mh +! ;
: tkallot  ( n -- ) mkh +! ;
: t,  ( x -- ) mh @ w!  1 tcells tallot ; 
: tc,  ( c -- ) mh @ c!  1 tallot ;
: reloc  ( a1 -- a2 ) dup 0= ?exit  tbase @ - torigin @ + ;
: unreloc  ( a1 -- a2 ) dup 0= ?exit torigin @ - tbase @ + ;
: taligned  ( n1 -- n2 ) twordsize @ 1- tuck + swap invert and ;
: talign  mh @ taligned mh ! ;

: theader  ( a n -- )
  space 2dup type
  dup >r mh @ place  mh @  r> 1+ tallot  talign  mdp @ reloc t,  
  mdp !  ;

: tcount  ( a1 -- a2 u ) count len-mask and ;

: tfind  ( a -- a 0 | xt 1 )
  count  mdp @  begin  ?dup  while
    >r 2dup r@ tcount compare 0=  if  
      2drop  r> tcount + taligned tcell+ reloc  1  exit  then
    r> tcount + taligned w@ unreloc  repeat  drop  1-  0 ;

: t'  ( a1 -- xt )
  tfind 0=  if  space  count type  true abort"  ?"  then ;

: ([t'])  ( a n -- xt ) drop  1- t' ;

: [t']  ( | word -- a ) 
  bl word count sliteral  postpone ([t']) ; immediate

: tliteral  ( x -- ) [t'] (lit) t, t, ;

: tsliteral  ( a n -- ) 
  [t'] (slit) t,  dup >r tc,  mh @ r@ cmove  r> tallot talign ;

\ colon compiler for target definitions

: tcompile  ( a -- )   \ counted string holding word
  \ dup space count type space  \ XXX
  \ immediate word in meta vocabulary?
  dup find  0>  if  nip execute  ?stack  exit  else  drop  then
  \ otherwise look up in target, compile word or literal
  tfind  if  t,  exit  then
  count number 0=  if  space type  true abort"  ?"  then
  tliteral ;

: t]  state on   \ "[" is re-used
  begin  bl word dup c@ 0=  if  drop  refill  else 
    tcompile  state @  then  while  repeat ;

\ initialization

: metacompile  ( a1 a2  -- )
  dup tbase !  dup mkh !  kernelsize @ + mh !
  dup torigin ! codeaddr !  mdp off ;

\ finalization

variable dictsize

defer set-codesize     \ align code top address as necessary
' noop is set-codesize

: finalize  ( heap code -- )  
  codebuffer !  
  mh @ codebuffer @ - dictsize !  \ size of used dictionary space
  set-codesize    \ format specific
  ( heap ) codesize @ dictsize @ - - bsssize !  \ heap - unused code
  codeaddr @ codesize @ + 512 ( /elfprefix ) - bssaddr !
  cr cr ." dictionary size: 0x" dictsize ? ;


\ target definitions (in "meta"):

also forth  \ so redefinitions of forth words won't get in the way

: lastname  ( -- a n ) current @ @ >name count ;

: variable  ( | name -- ) 
  <builds  lastname theader  mh @ reloc ,  [t'] (variable)
  unreloc w@ t,  0 t,  does>  @ tcell+ ;

: constant  ( x | name -- ) 
  <builds  lastname theader  dup ,  [t'] (constant) 
  unreloc w@ t,  t,  does>  @ ;

: create  ( | name -- )
  <builds  lastname theader  mh @ reloc ,  [t'] (variable) 
  unreloc w@ t,  does>  @ tcell+ ;

: buffer:  ( u | name -- )
  <builds  lastname theader  mh @ reloc ,  [t'] (variable) 
  unreloc w@ t,  tallot  does>  @ tcell+ ;

: '  ( | name -- xt ) bl word t' ;

: :  ( | name ... -- ) 
  bl word count theader  [t'] (:) unreloc w@ t,  t] ;

: ;  [t'] exit t,  state off ; immediate
: ]  t] ;
: immediate  mdp @ dup c@  i-bit or  swap c! ;
: [char]  ( | word -- xc ) char tliteral ; immediate
: (s")  ( | ..." -- ) [char] " parse count tsliteral ;
: s"  ( | ..." -- a n ) (s") ; immediate
: ."  ( | ..." -- ) (s")  [t'] type t, ; immediate
: ,  ( x -- ) t, ;          : c,  ( x -- ) tc, ;
: abort"  ( f | ..." -- ) (s")  [t'] (?abort) t, ; immediate

: ,"  ( | ..." -- ) 
  [char] " parse count dup >r mh @ place r> 1+ tallot ;

: [']  ( | word -- xt ) bl word t' tliteral ; immediate
: if  [t'] (if) t,  mh @ 0 t, ; immediate

: %else     \ needed below for `endof`
  [t'] (else) t,  mh @ >r  0 t,  mh @ reloc swap w!  r> ;

: else  %else ; immediate
: then  mh @ reloc swap w! ; immediate
: begin  mh @ ; immediate
: while  [t'] (if) t,  mh @  0 t, ; immediate
: again  [t'] (else) t,  reloc t, ; immediate

: repeat  [t'] (else) t,  swap reloc t,  mh @ reloc swap w! ; 
  immediate

: until  [t'] (if) t,  reloc t, ; immediate
: do  ( n1 n2 -- ) [t'] (do) t,  0 mh @ ; immediate
: ?do  true abort" ?do not available in meta compiler" ; immediate

: loop  ( -- ) 
  [t'] (loop) t,  reloc t,  ?dup  if  mh @ reloc swap w!  then ;
  immediate

: +loop  ( n -- ) 
  [t'] (+loop) t,  reloc t, ?dup  if  mh @ reloc swap w! then ;
  immediate

: defer  ( | word -- )      \ note: does not initialize with ' crash
  bl word count theader  [t'] (defer) unreloc w@ t,  0 t, ;

: is  ( xt | word -- )
  bl word t'  state @  if  tliteral  [t'] defer! t,
  else  tcell+ unreloc w!  then ; immediate

: of  ( -- sys )
  [t'] over t,  [t'] = t,  [t'] (if) t,  mh @ 0 t, 
  [t'] drop t, ; immediate

: endof  ( sys -- sys ) %else ; immediate

: tesac ( 0 i*sys -- ) 
  begin  ?dup while  mh @ reloc swap w!  repeat ;

: endcase ( 0 i*sys -- ) [t'] drop t,  tesac ; immediate

: cells  tcells ;

only forth definitions
