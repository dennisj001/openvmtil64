\ decompiler


vocabulary decompiler
only forth  also decompiler definitions


: (rfind)  ( cfa dp -- a|0 )
  begin  ?dup  while
    dup >r >cfa over =  if  drop  r>  exit  else  r> >link @  then
  repeat  drop  false ;

variable rfindcfa
: rfind  ( cfa -- a|0 )
  rfindcfa ! context  begin
    dup voctop <> while
    >r rfindcfa @ r@ @ @ (rfind) ?dup  if  r> drop exit  then
    r> cell+
  repeat drop false ;

: ?rfind  ( cfa -- a )
  dup rfind ?dup  if  nip  else
    ."  execution token not found: " . cr  true abort
  then ;

256 constant maxfwdjmps
maxfwdjmps cells buffer: fwdjmps
variable #fwdjmps

: recbranch  ( a ba -- a )
  2dup < if 
    fwdjmps #fwdjmps @ 
    dup maxfwdjmps > abort" too many forward branches"
    th !  1 #fwdjmps +!
  else  drop  then ;

: nofwdjmps?  ( a -- f )
  #fwdjmps @  0  ?do
    fwdjmps i th @ over >  if  drop false unloop exit  then
  loop  drop true ;

: (findend)  ( a1 -- a2 f )
  dup @  case
    ['] exit  of  dup nofwdjmps?  endof
    ['] (if)  of  cell+ dup @ recbranch  false  endof
    ['] (else)  of  cell+ dup @ recbranch  false  endof
    ['] (loop)  of  cell+  false   endof \ assumes branch backwards
    ['] (+loop)  of  cell+  false  endof \ "
    ['] (lit)  of  cell+  false  endof
    ['] (slit)  of  cell+ count + aligned 1 cells -  false  endof
    false swap
  endcase  1 cells under+ ;

: findend  ( a1 -- a2 )
  #fwdjmps off  begin  (findend)  until ;

: .name  ( a -- ) count len-mask and type ;
: .name'  ( a -- ) dup .name  c@ i-bit and  if  ."  (immediate)"  then ;

: see-op  ( a1 -- a2 )
  dup 8 u.r space dup @ dup rfind ?dup 0=  if  ." ??? " . 
  else 
    .name space  case
      ['] (if)  of  cell+ dup @ .  endof
      ['] (else)  of  cell+ dup @ .  endof
      ['] (loop)  of  cell+ dup @ .  endof
      ['] (+loop)  of  cell+ dup @ .  endof
      ['] (lit)  of  cell+ dup @ decimal . hex  endof
      ['] (slit)  of  cell+ [char] " emit count 2dup type 
        [char] " emit  space  + aligned 1 cells - 
      endof
    endcase
  then  cell+ ;

: see-code  ( addr -- ) 
  dup findend swap  begin  see-op cr  2dup <= until  2drop ;
: see-(:)  ( cfa -- ) 
  ?rfind ." : " dup .name' cr  >cfa >body see-code ;

: see-(variable)  ( cfa -- ) 
  ?rfind ." variable " dup .name' space >cfa dup [char] @ emit . ." = " 
  cell+ @ decimal . hex cr ;

: see-(constant)  ( cfa -- ) 
  ?rfind ." constant " dup .name' ."  = " >cfa >body @ 
  decimal . hex cr ;

: see-(does)  ( cfa -- )
  ?rfind ." does> " dup .name' space >cfa >body dup @ swap [char] @ emit 
  . cr see-code ;

: see-(deferred)  ( cfa -- )
  ?rfind ." defer " dup .name' ."  = " >cfa >body @ dup rfind ?dup if
    .name drop
  else  ." ??? " .  then cr ;

: see-primitive  ( cfa -- ) ." primitive " . cr ;

' (:) @        constant x(:)
' (variable) @ constant x(variable)
' (constant) @ constant x(constant)
' (does>) @     constant x(does)
' (defer) @ constant x(deferred)

variable where-xt
: scancode  ( wa a1 a2 -- ) 
  dup >cfa >body  dup findend swap  do
      i @ where-xt @ =  if  unloop  .name space  exit  then 
    loop  drop ;

only forth definitions also decompiler

: (see)  ( addr -- ) base @ swap hex  see-code  base ! ;

: see  ( | <word> -- )
  base @ >r hex
  ' dup @ case 
    x(:)  of  see-(:)  endof
    x(variable)  of  see-(variable)  endof
    x(constant)  of  see-(constant)  endof
    x(does)  of  see-(does)  endof
    x(deferred)  of  see-(deferred)  endof
    dup see-primitive
  endcase 
  r> base ! ;

: (where)  ( xt -- ) where-xt !  words:  scancode ;
: where  ( | <word> -- ) 
  bl word find  if  (where)  else  
  count type  ."  ? " cr  abort  then ;

previous
