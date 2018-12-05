\ syscall implementation for x86_64/Linux

include x86_64/sysv.f

code syscall6  ( a n -- x )     \ parameters are in a[0]...a[5]
  y!  drop x!  5 tcells # +  x!  ap dup  y dup
  x @ r9!  x cell- x! @ r8!  x cell- x! @ r10!  
  x cell- x! @ z!  x cell- x! @ ap!  x cell- @ w!
  drop syscall  x! drop ap!  x  next
end-code

0 constant sys_read     
1 constant sys_write
2 constant sys_open
3 constant sys_close    
5 constant sys_fstat
8 constant sys_lseek   
9 constant sys_mmap
11 constant sys_munmap
35 constant sys_nanosleep
57 constant sys_fork
59 constant sys_execve
60 constant sys_exit     
61 constant sys_wait4
87 constant sys_unlink

1 512 or 64 or constant w/o  \ O_WRONLY | O_TRUNC | O_CREAT
0 constant r/o  \ O_RDONLY
2 constant r/w  \ O_RDWR
1 1024 or 64 or constant a/o   \ O_WRONLY | O_APPEND | O_CREAT
2 1024 or constant r/a  \ O_RDWR | O_APPEND

48 constant stat>size

420 ( 644 ) constant OPEN_MODE      
493 ( 755 ) constant OPENX_MODE
512 constant O_TRUNC

include unix.f
