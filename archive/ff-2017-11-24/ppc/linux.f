\ syscall implementation for PPC/Linux

include ppc/common.f

code syscall6  ( a n -- x )     \ parameters are in a[0]...a[5]
  syscall#  drop x! 5 tcells # + x!
  @ 8 sysarg!  x cell- x! @ 7 sysarg!
  x cell- x! @ z!  x cell- x! @ y!  x cell- x! @ dup
  x cell- @ >r  drop x!  r>  syscall
  syserr?  if  -1 #  then  next
end-code

1 constant sys_exit     
2 constant sys_fork
3 constant sys_read     
4 constant sys_write
5 constant sys_open
6 constant sys_close    
10 constant sys_unlink
11 constant sys_execve
19 constant sys_lseek   
108 constant sys_fstat
91 constant sys_munmap
114 constant sys_wait4
162 constant sys_nanosleep
192 constant sys_mmap2

1 512 or 64 or constant w/o  \ O_WRONLY | O_TRUNC | O_CREAT
0 constant r/o  \ O_RDONLY
2 constant r/w  \ O_RDWR
1 1024 or 256 or constant a/o   \ O_WRONLY | O_APPEND | O_CREAT
2 1024 or constant r/a  \ O_RDWR | O_APPEND

28 constant stat>size

420 ( 644 ) constant OPEN_MODE      
493 ( 755 ) constant OPENX_MODE
512 constant O_TRUNC

include unix.f