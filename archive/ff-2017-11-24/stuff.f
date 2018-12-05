\ Utilities


\ Fundamental utilities                                         
                                                                
: @+  ( a1 -- a2 x ) dup cell+ swap @ ;                         
: !+  ( a1 x -- a2 ) over ! cell+ ;                             
: noop ;                                                        
: perform  ( ... a -- ... ) @ execute ;                         
: under+  ( n1 x n2 -- n3 x ) rot + swap ;                      
: th  ( a1 n -- a2 ) cells + ;                                  
: bounds  ( a1 n -- a2 a1 ) over + swap ;                       
: ?exit  ( f -- ) if  r> drop exit  then ;
: tuck  ( x y -- y x y ) dup >r swap r> ;
: callback  ( a -- ) >r ;
: 0>  ( n -- f ) 0 > ;
: 0<>  ( n -- f ) 0 <> ;
: >=  ( x y -- ) < 0= ;
: <=  ( x y -- ) > 0= ;

\ no, I'm not proud of this ...
: roll  ( x1 x2 ... xn u -- x2 ... xn x1 )
  1+ dup 2 <=  if  drop  exit  then
  sp@ over cells + dup @ >r  1 cells -       ( ... u a )
  swap 1 - 0  ?do  dup @ over cell+ !  1 cells -  loop 
  2drop  r> ;


\ More double words

: 2@  ( a -- x y ) dup cell+ @ swap @ ;
: 2!  ( x y a -- ) swap over ! cell+ ! ;
: 2>r  ( x y -- ) r> -rot swap >r >r >r ;
: 2r>  ( -- x y ) r> r> r> swap rot >r ;
: 2r@  ( -- x y ) r> r> r> 2dup >r >r swap rot >r ;
: 2variable  ( | <word> -- ) variable  0 , ;

: 2constant  ( x y | <word> -- ) 
  <builds swap , ,  does>  dup @ swap cell+ @ ;

: 2literal  ( x y -- ) swap literal literal ;


\ interpreter conditionals

: processword  ( n1 a n2 -- n3 )
  2dup s" [if]" compare 0=  if  2drop 1+ exit  then
  2dup s" [else]" compare 0=  if 
      2drop dup 1 =  if  1-  then  exit
  then
  s" [then]" compare 0=  if  1-  then ;

: skipwords  ( | ... -- )
  1 begin
      bl word dup c@ 0=  if 
        drop refill 0= abort" unexpected end of input"
      else
        count processword
      then
  ?dup 0=  until ;

: [if]  ( f | ... -- ) 0=  if  skipwords  then ; immediate
: [else]  ( | ... -- ) skipwords ; immediate
: [then] ; immediate
: [defined]  ( | <word> -- f ) bl word find nip ; immediate
: [undefined]  ( | <word> -- f ) bl word find 0= nip ; immediate


\ Compiling words

: postpone  ( | <word> -- ) 
  bl word find dup 0=  if 
    drop  space  count type  true abort" ?" 
  then
  1 =  if  ,  else  literal ['] , ,  then ; immediate                                            

\ Definitions
                                               
: :noname  ( ... -- xt ) here ['] (:) @ , ] ;                   


\ String utilities                                              
                                                                
: /string  ( a1 n1 n2 -- a2 n3 ) dup >r under+ r> - ;           
                                                                
: buffer:  ( n | <word> -- ) create allot ;                     
                                                                
: -trailing  ( a n1 -- a n2 ) 
  begin  1- dup 0<  if  1+  exit  then   
    2dup + c@ bl <>  until  1+ ;                                    
                                                                
: scan  ( a1 n1 c -- a2 n2 ) 
  >r begin dup 0=  if  r> drop  exit then 
    over c@ r@ <>  while  1 /string 
  repeat  r> drop ;      
                                                                
: skip  ( a1 n1 c -- a2 n2 ) 
  >r begin dup 0=  if  r> drop  exit then
    over c@ r@ =  while  1 /string 
  repeat  r> drop ;       
                                                                
: split  ( a1 n1 c -- a2 n2 a1 n3 ) 
  >r 2dup r> scan 2swap 2 pick - ;                                                    
                                                                
: place  ( a1 n a2 -- ) 2dup >r >r 1+ swap cmove r> r> c! ;     
: string,  ( a n -- ) here over 1+ allot place ;
: ,"  ( | ..." -- ) [char] " parse count string, ;


\ system operations

[defined] sys_nanosleep  [if]
2variable sleepbuf  \ [secs nsecs]
: ms  ( u -- ) 
  1000 /mod sleepbuf !  1000000 * sleepbuf cell+ !  
  sleepbuf 0 sys_nanosleep syscall2  drop ;
[else]
: ms  ( u -- ) ;
[then]


\ Random numbers - http://excamera.com/sphinx/article-xorshift.html

variable seed   7 seed !

: random    ( -- x )  \ return a 32-bit random number x
  seed @
  dup 13 lshift xor
  dup 17 rshift xor
  dup 5  lshift xor
  dup seed ! ;

: randomize  ( -- )
  s" /dev/urandom" r/o open-file ?fcheck
  dup pad 4 rot read-file ?fcheck drop pad @ seed !
  close-file drop ;


\ Display tools                                                 
                                                                
: .s  ( ... -- ... ) 
  depth ?dup 0= if
      ." stack empty "
  else
      dup 0  do  dup i -  pick .  loop  drop
  then ;
                                                                
: ?  ( a -- ) @ . ;                                             
                                                                
: dumpascii  ( a n -- )
  0 do  
      count dup 33 128 within 0=  if  drop  [char] ·  then  emit
  loop  drop ;
: dumpbyte  ( u -- ) dup 16 <  if   [char] 0 emit  then  . ;
: dump  ( a n -- ) 
  base @ >r  hex  dup >r  0  do 
    i 16 mod dup 0= if
      i 0 > if  over 16 dumpascii  16 under+  then
        cr  2dup + 8 u.r  space  then
    over + c@ dumpbyte
  loop  r> 16 mod ?dup 0=  if  16
  else  16 over - 3 * spaces  then
  dumpascii  r> base !  cr ;

: .(  [char] ) parse count type ; immediate                     
                                                                

\ case/of - http://www.calcentral.com/~forth/forth/eforth/e4.src/LIB.SHTML

0 constant case ( -- 0 ) immediate

: of ( -- sys )
  postpone over postpone = postpone if postpone drop ; immediate

: endof ( sys -- sys ) postpone else ; immediate

: esac ( 0 i*sys -- ) 
  begin  ?dup while postpone then  repeat ;

: endcase ( 0 i*sys -- ) postpone drop  esac ; immediate


\ memory-mapped files + memory

1 constant MAP_SHARED    2 constant MAP_PRIVATE
1 constant PROT_READ     2 constant PROT_WRITE
8 cells buffer: mmargs  mmargs off   \ 6 + 2 cells for 64-bit off_t

[defined] sys_mmap64  [if]  \ BSD
: fsmmap  ( a -- n ) sys_mmap64 syscall8 ;
[then]
[defined] sys_mmap2 [if]
: fsmmap  ( a -- n ) sys_mmap2 syscall6 ;
[then]
[defined] sys_mmap [if]
: fsmmap  ( a -- n ) sys_mmap syscall6 ;
[then]

[defined] sys_munmap  [if]
: fsmunmap  ( a n1 -- n2 ) sys_munmap syscall2 ;
[then]

[undefined] fsmmap  [if]
: fsmmap 2drop -1 ;
: fsmunmap 2drop -1 ;
[then]

: mmaccess  ( acc -- mmacc )
  case  
      w/o of  PROT_WRITE  endof  
      r/o of  PROT_READ  endof  
      PROT_READ PROT_WRITE or swap
  endcase ;

: mmior  ( ptr -- a ior )
  dup abs 256 >  if  0  else  -1  then ; 

: map-file  ( fd acc size offset -- a ior )
[defined] sys_mmap64  [if]
  [defined] big-endian  [if]  0  [else]  0 swap  [then]
  mmargs 7 th !  mmargs 6 th !    \ 64-bit off_t
[else] [defined] sys_mmap2  [if]
    12 rshift 
  [then]
    mmargs 5 th !         \ offset
  [then] 
[then]
  mmargs cell+ swap !+            \ size
  swap mmaccess !+  MAP_SHARED !+  !  \ prot, flags, fd
  mmargs fsmmap mmior ; 

: unmap-memory  ( a size -- ior ) fsmunmap ;

[defined] bsd  [if]  h# 1000  [else]  32  [then]
  constant MAP_ANONYMOUS

: map-memory  ( size -- a ior )
  mmargs cell+ swap !+  PROT_READ PROT_WRITE or !+  \ addr(0), size, prot
  MAP_ANONYMOUS MAP_PRIVATE or !+  -1 !+  off  \ flags, fd, off
  mmargs fsmmap mmior ;


\ file-info access 

256 buffer: statbuf

: file-size  ( fd -- n ior )
  statbuf 256 fsstat drop  statbuf stat>size + @  0 ;


\ Command invocation from frontend

defer command  ( | <word> -- )
defer previous-screen
defer next-screen


\ Vocabularies

8 constant maxvocs

maxvocs cells buffer: vocs      variable >vocs
vocs maxvocs cells + constant voctop
here ," forth" align create forthwords 0 , ,
dp constant dpboot  \ used in unexec-*.f

\ voc: [link nameptr]

: context  ( -- a ) >vocs @ ;

: vocabulary  ( | <name> -- ) 
  here  <builds  0 , ,  does>  context ! ;

: (words:)  ( wa ra -- ) 
  swap  begin  ?dup  while  dup >r  over callback
    r> >link @  repeat  drop ;

: words:  ( | ... -- )
  r>  voctop context  do  
    i @ @ over (words:)
  1 cells  +loop  drop ;

: .word  ( a -- ) count len-mask and type space ;
: words  words:  .word ;

2variable 'sifting
: sifting  ( | <word> -- )
  bl word count 'sifting 2!  
  words:  dup count len-mask and 'sifting 2@ search  if
    2drop .word  else  2drop drop  then ;

: dp  ( -- a ) forthwords ;     \ reimplemented
: only  ( -- ) voctop 1 cells - dup >vocs ! forthwords swap ! ;

: order  ( -- )
  voctop context  do
    i @ dup cell+ @ count type
    current @ =  if  [char] * emit  then
    space
  1 cells  +loop ;

: also  ( -- )
  context dup vocs = abort" too many wordlists" 
  dup @ >r 1 cells - >vocs ! r> context ! ;

: previous  ( -- ) 
  context cell+ dup voctop <  if  >vocs !  else  drop  then ;

: definitions  ( -- ) context @ current ! ;

: vfindname  ( a1 -- a2 1 | a1 0 )
  context  begin
    dup voctop <>  while
    dup >r @ @ findnfa  if  r>  drop  true  exit  then
    r> cell+
  repeat  drop false ;

: forget  ( | <word> -- ) 
  bl word current @ @ findnfa  if 
    >link dup @ current @ !  h ! 
  else 
    space  count type  true abort" ?" 
  then ;    

: vocs,  ( -- )
  context voctop over - 1 cells / dup , 0  do
    dup i cells + @ dup , @ ,
  loop  drop current @ dup , @ , ;

: vocs@  ( a1 -- a2 )
  @+ dup >r cells voctop swap - >vocs !
  r> 0  do
      @+ context i cells + dup >r ! @+ r> @ !
  loop  @+ current ! @+ current @ ! ;

: marker  ( | <word> -- )
  <builds  vocs, here cell+ ,   \ skip this actual cell
  does>  vocs@ @ h ! ;

: forth  ( -- ) forthwords context ! ;

\ fixup "forth" vocabulary and initialize
:noname 
  forthwords cell+ @ (findname) drop forthwords ! 
  ['] vfindname is findname
  forthwords current !  only ; execute


\ Structures - taken from forth-standard.org
: begin-structure  \ -- addr 0 ; -- size 
   <builds 
     here 0 0 ,      \ mark stack, lay dummy 
   does> @ ;            \ -- rec-len 
: end-structure  \ addr n -- 
   swap ! ;          \ set len
: +field  \ n <"name"> -- ; exec: addr -- 'addr 
   <builds over , + 
   does> @ + ;
: field:    ( n1 "name" -- n2 ; addr1 -- addr2 ) aligned 1 cells +field ;
: cfield:   ( n1 "name" -- n2 ; addr1 -- addr2 ) 1   +field ;


\ base-independent literals

: (d/h#)  ( b | <number> -- n )
  bl word count number 0= abort" bad number syntax"
  state @  if  literal  else  swap  then  base ! ;

: d#  ( | <number> -- n ) base @  decimal  (d/h#) ; immediate
: h#  ( | <number> -- n ) base @  hex  (d/h#) ; immediate


[defined] utfencode  [if]
\ UTF8-aware parse

4 buffer: utfbuf    variable utflen     variable utfp1

: utffound  ( a -- )
  utfp1 @ - utfp1 @ over wordbuf @ place
  utflen @ + >in +! ;

: utfremaining  ( a -- )
  >limit @ >in @ - wordbuf @ place  >limit @ >in ! ;

: utfparse  ( c | ... -- a )
  utfbuf swap utfencode utflen !  drop
  sourcebuf @ >in @ + dup utfp1 !  >limit @ >in @ -
  utfbuf utflen @  search  
  nip  if  utffound  else  utfremaining  then  
  wordbuf @ ;
[then]


\ system(3)

[defined] sys_execve  [if]
4 cells buffer: systemargs      variable systemenv

: fork  ( -- pid|0 ) 
  [defined] (fork)  [if]  (fork)  [then]
  [defined] sys_fork  [if]  sys_fork syscall0  [then]
  [defined] sys_clone  [if]  SIGCHLD 0 sys_clone syscall2  [then] ;
: execve  ( args env -- |ior ) over @ -rot sys_execve syscall3 ior ;
: wifexited  ( status -- f ) h# 7f and 0= ;
: wexitstatus  ( status -- u ) 8 rshift 255 and ;

variable waitstatus

: waitpid  ( pid -- status ior )
  waitstatus 0 0 sys_wait4 syscall4 dup 0<  if  0 swap  exit  then
  drop  waitstatus @ dup wifexited  if  wexitstatus  0  
  else  -1  then ;

here  ," /bin/sh" 0 c,  1+ systemargs !
here  ," -c" 0 c,  1+ systemargs 1 th !  0 systemargs 3 th !

: exec  ( a u -- )
  zstring systemargs 2 th !
  systemargs  dup 3 th  execve ;

: system  ( a u -- status )
  fork ?dup  if  nip nip  waitpid abort" waitpid failed"
  else  exec  true abort" execve failed"  then ;
[then]


\ catch/throw

variable handler        handler off

: catch  ( xt -- exn | 0 )
  sp@ >r  handler @ >r  rp@ handler !
  execute  r> handler !  r> drop  0 ;

: throw  ( ... n -- ... | ... n )
  ?dup  if
    handler @ dup 0= abort" no handler"
    rp!  r> handler !  r> swap >r  sp!  2drop  r>
  then ;


\ base address of image

' (variable) @ h# fff invert and constant imgbase
