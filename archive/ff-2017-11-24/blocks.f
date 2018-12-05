\ block words

variable scr
variable recent-buffer
variable buffer-map
variable buffers-base
variable max-buffers
variable blockfile
variable bfname
1024 constant max-blocks

: buffer-addr  ( n -- a ) 1024 * buffers-base @ + ;
: buffer-block  ( n -- a ) 2 cells * buffer-map @ + ;
: buffer-dirty  ( n -- a ) buffer-block cell+ ;

defer ?blockfile
: (?blockfile)  ( -- )
  blockfile @ 0=  if  bfname @ count r/w open-file ?fcheck 
  blockfile !  then ;
' (?blockfile) is ?blockfile

: update  ( -- ) recent-buffer @ buffer-dirty on ;

defer wrblock       defer rdblock
: (wrblock)  ( a blk -- )
  1024 * blockfile @ reposition-file ?fcheck 
  1024 blockfile @ write-file ?fcheck ;
: (rdblock)  ( a blk -- )
  1024 * blockfile @ reposition-file ?fcheck
  1024 blockfile @ read-file ?fcheck  drop ;
' (wrblock) is wrblock      ' (rdblock) is rdblock

: save-buffer  ( n -- ) 
  dup buffer-block @ over buffer-addr swap wrblock
  buffer-dirty off ;

: flush  ( -- ) 
  blockfile @  if 
    max-buffers @ 0  do 
      i buffer-dirty @  if  i save-buffer  then
    loop
  then ;

: empty-buffers  ( -- ) buffer-map @ max-buffers @ 2 cells * 
  erase ;

: next-buffer  ( n1 -- n2 ) 1+ max-buffers @ mod ;

: buffer  ( n -- a ) 
  max-buffers @ 0  do
    recent-buffer @ i + next-buffer dup buffer-dirty @ 0=  if
      dup recent-buffer ! dup 
      >r buffer-block ! r> buffer-addr unloop exit  then
    drop 
  loop 
  recent-buffer @ next-buffer dup save-buffer dup recent-buffer 
  ! dup >r buffer-block ! r> buffer-addr ;

: ?block  ( u -- u ) 
  dup 0=  if  ." block zero" cr abort  then ;

: block  ( n -- a ) 
  ?block ?blockfile
  max-buffers @ 0  do
    dup i buffer-block @ =  if
      drop  i buffer-addr i recent-buffer ! unloop  exit  then
  loop  
  dup buffer dup >r swap rdblock r> ;

: load  ( n -- ) 
  >r save-input r@ blk ! r> block >r
  >in off 1024 >limit ! r> sourcebuf ! interpret restore-input 
  0=  if  space s" unable to restore input" type cr abort  then
  blk @ ?dup  if  block sourcebuf !  then ;

: thru  ( n1 n2 -- ) 1+ swap  do  i load  loop ;
: .row  ( n -- ) 2 .r [char] | emit ;

: .blkhdr  ( n -- ) s"   +BLOCK: " type 4 u.r 
  s" -----------------------------------------------------+" type cr ;

: list  ( n -- ) 
  base @ >r decimal dup scr ! dup .blkhdr 
  block 16 0  do  
    i .row dup 64 type [char] | emit cr 64 
    + 
  loop
  drop r> base ! 
  s"   +----------------------------------------------------------------+"
  type cr ;

: .buffers  ( -- ) base @ cr                                    
  ."   Buffer  Block  Dirty  Address" cr                        
  ."   -----------------------------" cr                        
  max-buffers @ 0  do
    decimal  6 spaces i 2 .r 3 spaces i buffer-block @ 4 .r               
    4 spaces i buffer-dirty @  if  [char] X else [char] -  then      
    emit 3 spaces hex i buffer-addr 8 .r cr                       
  loop  base ! ;                                                 

: initblocks 
  16 max-buffers !
  r0 @ max-buffers @ 1024 * - buffers-base !
  s" _blockfile" 1- over c!  bfname !
  buffers-base @ max-buffers @ 2 cells * - buffer-map ! ;

initblocks
