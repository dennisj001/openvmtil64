\ syscall implementation for sparc/Linux

include sparc/common.f

code syscall6  ( a n -- x )     \ parameters are in a[0]...a[5]
  y!  drop x!  5 tcells # + x!
  @ 5 sysarg  x cell- x! @ 4 sysarg
  x cell- x! @ 3 sysarg  x cell- x! @ 2 sysarg
  x cell- x! @ 1 sysarg  x cell- @ 0 sysarg
  y syscall cs?  if  -1 #  else  sysresult  then  next
end-code

1 constant sys_exit     
2 constant sys_fork
3 constant sys_read     
4 constant sys_write
5 constant sys_open
6 constant sys_close    
7 constant sys_wait4
10 constant sys_unlink
19 constant sys_lseek   
56 constant sys_mmap2
59 constant sys_execve
62 constant sys_fstat
73 constant sys_munmap
249 constant sys_nanosleep

1 1024 or 512 or constant w/o  \ O_WRONLY | O_TRUNC | O_CREAT
0 constant r/o  \ O_RDONLY
2 constant r/w  \ O_RDWR
1 8 or 512 or constant a/o   \ O_WRONLY | O_APPEND | O_CREAT
2 8 or constant r/a  \ O_RDWR | O_APPEND

20 constant stat>size

420 ( 644 ) constant OPEN_MODE      
493 ( 755 ) constant OPENX_MODE
512 constant O_TRUNC

include unix.f
