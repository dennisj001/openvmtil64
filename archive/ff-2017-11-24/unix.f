\ UNIX I/O

: halt  ( u -- ) sys_exit syscall1 ;
: fsread  ( fd a u -- n ) sys_read syscall3 ;
: fswrite  ( fd a u -- n ) sys_write syscall3 ;

: fsopen  ( cstr flags mode -- fd )
[defined] sys_openat  [if]
  >r >r >r -100 r> r> r> sys_openat syscall4
[else]
  sys_open syscall3
[then] ;

: fscreate  ( cstr flags mode -- fd ) fsopen ;
: fsclose  ( fd -- n ) sys_close syscall1 ;
: fsunlink  ( cstr -- n ) sys_unlink syscall1 ;
: fsseek  ( fd pos -- n ) 0 ( SEEK_SET ) sys_lseek syscall3 ;
: fsstat  ( fd a u -- n ) drop sys_fstat syscall2 ;
: conread  ( channel a -- c 1|0 ) dup >r 1 fsread  r> c@ swap ;
: conwrite  ( channel a u -- ) fswrite drop ;
