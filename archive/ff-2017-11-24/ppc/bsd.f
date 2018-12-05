\ syscall implementation common to PPC/*BSD

include ppc/common.f

code syscall8  ( a n -- x )     \ parameters are in a[0]...a[7]
  syscall#  drop x! 7 tcells # + x!
  @ 10 sysarg!  
  x cell- x! @ 9 sysarg!
  x cell- x! @ 8 sysarg!
  x cell- x! @ 7 sysarg!
  x cell- x! @ z!  
  x cell- x! @ y!  
  x cell- x! @ dup
  x cell- @ >r  
  drop x!  r> syscall syserr?  if  -1 #  then  next
end-code

1 constant sys_exit     
2 constant sys_fork
3 constant sys_read     
4 constant sys_write
5 constant sys_open
6 constant sys_close    
10 constant sys_unlink
59 constant sys_execve
73 constant sys_munmap
197 constant sys_mmap64     \ 64-bit off_t
240 constant sys_nanosleep

1 1024 or 512 or constant w/o  \ O_WRONLY | O_TRUNC | O_CREAT
0 constant r/o  \ O_RDONLY
2 constant r/w  \ O_RDWR
1 8 or 512 or constant a/o   \ O_WRONLY | O_APPEND | O_CREAT
2 8 or constant r/a  \ O_RDWR | O_APPEND

420 ( 644 ) constant OPEN_MODE      
493 ( 755 ) constant OPENX_MODE
512 constant O_TRUNC

include unix.f
