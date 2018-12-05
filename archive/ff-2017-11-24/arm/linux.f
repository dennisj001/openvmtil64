\ syscall implementation for ARM/Linux

code syscall0  ( n -- y ) 
  syscall#  syscall  next
end-code

code syscall1  ( x n -- y )
  syscall#  drop  syscall  next
end-code

code syscall2  ( x y n -- z )
  syscall#  drop 1 sysarg  drop  syscall  next
end-code

code syscall3  ( x y z n -- p )
  syscall#  drop x!  drop 1 sysarg  drop  syscall  next
end-code

code syscall4  ( x y z p n -- q )
  syscall#  drop y!  drop x!  drop 1 sysarg  drop  syscall  next
end-code

code syscall6  ( a n -- x )     \ parameters are in a[0]...a[5]
  syscall#  drop x! 5 tcells # + x!
  x @ 5 sysarg  x cell- x! @ z!  x cell- x! @ y!
  x cell- x! @ dup  x cell- x! @ 1 sysarg  x cell- @ >r
  drop x!  r>  syscall  next
end-code

3 constant sys_read     
4 constant sys_write
1 constant sys_exit     
5 constant sys_open
6 constant sys_close    
10 constant sys_unlink
19 constant sys_lseek   
162 constant sys_nanosleep
192 constant sys_mmap2
91 constant sys_munmap
197 constant sys_fstat  \ actually fstat64
2 constant sys_fork
11 constant sys_execve
114 constant sys_wait4

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
