\ syscall implementation for MIPS/Linux

include mips/common.f

code syscall6  ( a n -- x )     \ parameters are in a[0]...a[5]
  y!  drop x!  5 tcells # + x!
  [defined] N32  [if]
    @ 5 sysarg  x cell- x! @ 4 sysarg  y dup ( save syscall# )
  [else]
    @ z!  x cell- x! @ dup  z dup  y dup
  [then]
  x cell- x! @ 3 sysarg  x cell- x! @ 2 sysarg
  x cell- x! @ 1 sysarg  x cell- @ 0 sysarg
  drop syscall syserr?  if  -1 #  then
  [undefined] N32  [if]
    x!  drop drop  x
  [then]
  next
end-code

[defined] N32  [if]
6000 constant sys_read     
6001 constant sys_write
6002 constant sys_open
6003 constant sys_close    
6005 constant sys_fstat
6008 constant sys_lseek   
6009 constant sys_mmap
6011 constant sys_munmap
6034 constant sys_nanosleep
6056 constant sys_fork
6057 constant sys_execve
6058 constant sys_exit     
6059 constant sys_wait4
6085 constant sys_unlink
[else]
4001 constant sys_exit     
4002 constant sys_fork
4003 constant sys_read     
4004 constant sys_write
4005 constant sys_open
4006 constant sys_close    
4010 constant sys_unlink
4011 constant sys_execve
4019 constant sys_lseek   
4108 constant sys_fstat
4091 constant sys_munmap
4114 constant sys_wait4
4166 constant sys_nanosleep
4210 constant sys_mmap2
[then]

1 512 or 256 or constant w/o  \ O_WRONLY | O_TRUNC | O_CREAT
0 constant r/o  \ O_RDONLY
2 constant r/w  \ O_RDWR
1 8 or 256 or constant a/o   \ O_WRONLY | O_APPEND | O_CREAT
2 8 or constant r/a  \ O_RDWR | O_APPEND

[defined] N32  [if]  
  56  [defined] big-endian  [if]  4 +  [then]
[else]
  48 
[then] constant stat>size

420 ( 644 ) constant OPEN_MODE      
493 ( 755 ) constant OPENX_MODE
512 constant O_TRUNC

include unix.f
