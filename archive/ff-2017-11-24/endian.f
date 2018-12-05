\ endian-neutral operations


: hisign  ( n1 -- n2 ) 0<  if  -1  else 0  then ;

\ big endian

: be2@  ( a -- x ) dup c@ 8 lshift  swap 1+ c@ or ;
: be2!  ( x a -- ) over 8 rshift over c!  1+ c! ;

: be4@  ( a -- x ) 
  dup c@ 24 lshift over 1+ c@ 16 lshift or over 2 + c@ 
  8 lshift or swap 3 + c@ or ;

: be4!  ( x a -- ) 
  swap dup >r 24 rshift over c! r@ 16 rshift over 1+ c!
  r@ 8 rshift over 2 + c! r> swap 3 + c! ;

1 cells 4 =  [if]
: be8@  ( a -- x ) 4 + be4@ ;
: be8!  ( x a -- ) over hisign over !  swap 4 + ! ;
[else]
: be8@  ( a -- x ) dup be4@ 32 lshift swap 4 + be4@ or ;
: be8!  ( x a -- ) over 32 rshift over be4! 4 + be4! ;
[then]

\ little endian

: le2@  ( a -- x ) dup c@ swap 1+ c@ 8 lshift or ;
: le2!  ( x a -- ) 2dup c!  swap 8 rshift swap 1+ c! ;

: le4@  ( a -- x ) 
  dup c@ over 1+ c@ 8 lshift or over 2 + c@ 16 lshift or
  swap 3 + c@ 24 lshift or ;

: le4!  ( x a -- ) 
  swap dup >r over c! r@ 8 rshift over 1+ c! r@ 16 rshift
  over 2 + c! r> 24 rshift swap 3 + c! ;

1 cells 4 =  [if]
: le8@  ( a -- x ) le4@ ;
: le8!  ( x a -- ) 2dup le4! swap hisign swap 4 + le4! ;
[else]
: le8@  ( a -- x ) dup le4@ swap 4 + le4@ 32 lshift or ;
: le8!  ( x a -- ) 2dup le4! swap 32 rshift swap 4 + le4! ;
[then]

defer w4@   defer w4!   defer w2!   defer w2@
defer w8@   defer w8!   defer w!    defer w@

variable target/e       
variable twordsize      1 cells twordsize !

: w2,  ( x -- ) here w2!  2 allot ;
: w4,  ( x -- ) here w4!  4 allot ;
: w8,  ( x -- ) here w8!  8 allot ;
: w,  ( x -- ) here w!  twordsize @ allot ;
: wordsize  ( u -- ) dup twordsize ! ;

: little
  ['] le2@ is w2@  ['] le2! is w2!
  ['] le4@ is w4@  ['] le4! is w4!
  ['] le8@ is w8@  ['] le8! is w8!
  twordsize @  case
    2  of  ['] le2@ is w@  ['] le2! is w!  endof
    4  of  ['] le4@ is w@  ['] le4! is w!  endof
    8  of  ['] le8@ is w@  ['] le8! is w!  endof
  endcase  target/e off ;

: big
  ['] be2@ is w2@  ['] be2! is w2!
  ['] be4@ is w4@  ['] be4! is w4!
  ['] be8@ is w8@  ['] be8! is w8!
  twordsize @  case
    2  of  ['] be2@ is w@  ['] be2! is w!  endof
    4  of  ['] be4@ is w@  ['] be4! is w!  endof
    8  of  ['] be8@ is w@  ['] be8! is w!  endof
  endcase  target/e on ;

: report-endianness
  ." host is "  1 cells 8 * . ." bits "
  [defined] big-endian  [if]  ." (big-endian)"  
  [else]  ." (little-endian)"  [then]
  ." , target is "  twordsize @ 8 * . ." bits "
  target/e @  if  ." (big-endian)"  
  else  ." (little-endian)"  then ;
