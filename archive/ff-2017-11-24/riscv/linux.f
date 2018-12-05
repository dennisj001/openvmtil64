\ syscall implementation for RISC-V/Linux

code syscall0  ( n -- y )  syscall#  syscall  next  end-code

code syscall1  ( x n -- y )
  syscall#  drop syscall  next
end-code

code syscall2  ( x y n -- z )
  syscall#  drop x!  drop syscall  next
end-code

code syscall3  ( x y z n -- p )
  syscall#  drop y!  drop x!  drop syscall  next
end-code

code syscall4  ( x y z p n -- q )
  syscall#  drop z!  drop y!  drop x!  drop syscall  next
end-code

code syscall6  ( a n -- x )     \ parameters are in a[0]...a[5]
  syscall#  drop x! 5 tcells # + x!
  @ 15 sysarg!  
  x cell- x! @ 14 sysarg!
  x cell- x! @ z!
  x cell- x! @ y!
  x cell- x! @ >r
  x cell- @ dup
  r> x!  drop syscall  next
end-code

63 constant sys_read     
64 constant sys_write
93 constant sys_exit     
56 constant sys_openat
57 constant sys_close    
35 constant sys_unlink
62 constant sys_lseek   
101 constant sys_nanosleep
222 constant sys_mmap2
215 constant sys_munmap
80 constant sys_fstat
220 constant sys_clone
221 constant sys_execve
260 constant sys_wait4

1 512 or 64 or constant w/o  \ O_WRONLY | O_TRUNC | O_CREAT
0 constant r/o  \ O_RDONLY
2 constant r/w  \ O_RDWR
1 1024 or 64 or constant a/o   \ O_WRONLY | O_APPEND | O_CREAT
2 1024 or constant r/a  \ O_RDWR | O_APPEND
48 constant stat>size
17 constant SIGCHLD
420 ( 644 ) constant OPEN_MODE      
493 ( 755 ) constant OPENX_MODE
512 constant O_TRUNC

include unix.f
