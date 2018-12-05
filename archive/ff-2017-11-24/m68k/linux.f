\ syscall implementation for m68k/Linux

code syscall0  ( n -- y ) syscall  next  end-code

code syscall1  ( x n -- y )
  x!  drop 1 sysarg  x syscall  next
end-code

code syscall2  ( x y n -- z )
  x!  drop 2 sysarg  drop 1 sysarg  x syscall  next
end-code

code syscall3  ( x y z n -- p )
  x!  drop 3 sysarg  drop 2 sysarg  drop 1 sysarg
  x syscall  next
end-code

code syscall4  ( x y z p n -- q )
  x!  drop 4 sysarg  drop 3 sysarg  drop 2 sysarg
  drop 1 sysarg  x syscall  next
end-code

code syscall6  ( a n -- x )     \ parameters are in a[0]...a[5]
  y!  drop x!  5 tcells # + x!
  x @ z!  x cell- x! @ 5 sysarg  y dup  z dup
  x cell- x! @ 4 sysarg  x cell- x! @ 3 sysarg
  x cell- x! @ 2 sysarg  x cell- @ 1 sysarg
  drop x!  drop syscall  next
end-code

3 constant sys_read     
4 constant sys_write
5 constant sys_open
6 constant sys_close    
108 constant sys_fstat
19 constant sys_lseek   
192 constant sys_mmap2
91 constant sys_munmap
162 constant sys_nanosleep
2 constant sys_fork
11 constant sys_execve
1 constant sys_exit     
114 constant sys_wait4
10 constant sys_unlink

1 512 or 64 or constant w/o  \ O_WRONLY | O_TRUNC | O_CREAT
0 constant r/o  \ O_RDONLY
2 constant r/w  \ O_RDWR
1 1024 or 64 or constant a/o   \ O_WRONLY | O_APPEND | O_CREAT
2 1024 or constant r/a  \ O_RDWR | O_APPEND

20 constant stat>size

420 ( 644 ) constant OPEN_MODE      
493 ( 755 ) constant OPENX_MODE
512 constant O_TRUNC

include unix.f
