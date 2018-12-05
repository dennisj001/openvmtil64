\ debugger
\
\ requires: decomp.f


vocabulary debugger
also debugger definitions
also decompiler  \ for "see-op"


1024 constant /rsp
/rsp cells buffer: rstack    

variable rsp        variable ip     
variable debugging  
variable en-cont-stop   variable cont-stop  variable tracing

en-cont-stop off    tracing off

: +debugging  ( -- ) debugging @ 0= abort" not debugging" ;
: rpush  ( x -- ) rsp @ ! 1 cells rsp +! ;
: rpop  ( -- x ) 1 cells negate rsp +! rsp @ @ ;
: rtop  ( -- x ) rsp @ 1 cells - @ ;
: dbgstop  ( -- ) ['] (prompt) is prompt  debugging off ;

: doexit  ( -- ) 
    rsp @ rstack =  if 
        dbgstop  ." done" cr  abort 
    then
    rpop dup ip ! 
    cont-stop @ =  if  cont-stop off  then ;

: docond  ( f -- ) 
    0=  if ip @ cell+ @ ip ! else  2 cells ip +! then ;

: doloop  ( n -- )
    rsp @ 2 cells - dup >r +!  
    r> rtop < if
        ip @ cell+ @ ip !
    else
        2 cells ip +! 
    then ;

: advance  ( -- ) 1 cells ip +! ;
: dolit  ( -- x ) ip @ cell+ @  2 cells ip +! ;
: doslit  ( -- a n ) ip @ cell+ count dup aligned cell+ ip +! ;

defer dbg-cont

: push-ip  ( new-ip -- )
    ip @ rpush  ip !
    en-cont-stop @  if  
        en-cont-stop off
        rtop cont-stop !  dbg-cont
    then ;

: doexec  ( xt -- )
    dup @ case
        [ ' (:) @ literal ]  of  
            cell+ push-ip
        endof
        [ ' (defer) @ literal ]  of
            cell+ @ recurse exit
        endof
        [ ' (does>) @ literal ]  of
            cell+ @+ push-ip
        endof
        drop execute  exit
    endcase ;

: .debug  ( -- )
    base @ >r  #fwdjmps off  \ for "see-op"
    ." DEBUG: ("  rsp @ rstack - 2/ 2/ (.) type ." ) "
    hex  ip @ see-op drop  ." | " 
    r> base !  .s  cr ;

: dbg-step  ( -- )
    +debugging  
    tracing @  if  .debug  then
    ip @ @ case
        ['] exit  of  doexit  endof
        ['] (if)  of  docond  endof
        ['] (else)  of  ip @ cell+ @ ip !  endof
        ['] (do)  of  rpush rpush  advance  endof
        ['] (loop)  of  1 doloop  endof
        ['] (+loop)  of  doloop  endof
        ['] (lit)  of  dolit  endof
        ['] (slit)  of  doslit  endof
        ['] unloop  of  2 cells negate rsp +!  advance  endof
        ['] execute  of  advance  doexec  endof
        ['] i  of  rsp @ 2 cells - @  advance  endof
        ['] j  of  rsp @ 4 cells - @  advance  endof
        ['] r>  of  rpop  advance  endof
        ['] >r  of  rpush  advance  endof
        ['] r@  of  rtop  advance  endof
        ['] rp@  of  rsp @  advance  endof
        ['] rp!  of  rsp !  advance  endof
        ['] reset  of  rstack rsp ! reset  endof \ questionable...
        advance  doexec  exit
    endcase ;

: (dbg-cont)  ( -- ) begin  dbg-step  cont-stop @ 0= until ;
' (dbg-cont) is dbg-cont

: debug-prompt  ( -- ) cr .debug ;

: debuggable  ( xt1 -- xt2 ) 
    dup @ case
        [ ' (:) @ literal ]  of endof
        [ ' (defer) @ literal ]  of  cell+ @ recurse  endof
        [ ' (does>) @ literal ]  of  cell+ @+ 1 cells -  endof  \ hack
        dbgstop  true abort" can not debug word" 
    endcase ;

: debug-word  ( xt -- ) debuggable  rstack rsp !  cell+ ip ! ;

: debug  ( | <word> -- ) 
    ['] debug-prompt is prompt  debugging on  ' debug-word ;

: skipcall  ( -- ) 
    +debugging  en-cont-stop on  dbg-step  en-cont-stop off ;

: q  ( -- ) +debugging  dbgstop ;
: s  ( -- ) +debugging  tracing off  en-cont-stop off  dbg-step ;
: n  ( -- ) tracing off  skipcall ;
: t  ( -- ) tracing on  skipcall ;

: .rs  ( -- ) +debugging
    rstack rsp @ =  if  ." return stack empty " exit then
    rstack begin  dup rsp @ < while  dup @ . cell+  repeat  drop ;

only forth definitions
