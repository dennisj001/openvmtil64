\ syscall implementation for x86_64/darwin

include x86_64/sysv.f

code syscall8  ( a n -- x )     \ parameters are in a[0]...a[7]
  y!  drop x!  7 tcells # +  x!
  @ dup  x cell- x! @ dup  x cell- x!
  ap dup  y dup
  x @ r9!  x cell- x! @ r8!  x cell- x! @ r10!  
  x cell- x! @ z!  x cell- x! @ ap!  x cell- @ w!
  drop syscall  x! drop ap!  x  next
end-code

h# 2000007 constant sys_wait4
h# 20000c7 constant sys_lseek
h# 20000bd constant sys_fstat
h# 2000001 constant sys_exit     
h# 2000002 constant sys_fork
h# 2000003 constant sys_read     
h# 2000004 constant sys_write
h# 2000005 constant sys_open
h# 2000006 constant sys_close
h# 200000a constant sys_unlink
h# 200003b constant sys_execve
h# 2000049 constant sys_munmap
h# 20000c5 constant sys_mmap64     \ 64-bit off_t

1 1024 or 512 or constant w/o  \ O_WRONLY | O_TRUNC | O_CREAT
0 constant r/o  \ O_RDONLY
2 constant r/w  \ O_RDWR
1 8 or 512 or constant a/o   \ O_WRONLY | O_APPEND | O_CREAT
2 8 or constant r/a  \ O_RDWR | O_APPEND
72 constant stat>size
420 ( 644 ) constant OPEN_MODE      
493 ( 755 ) constant OPENX_MODE
1024 constant O_TRUNC

include unix.f

\ custom syscall0 that checks edx, needed for `fork`:
\ (see libsyscall/custom/__fork.s in the xnu sources)
code (fork)  ( -- y )
  dup sys_fork # syscall cs?  if  -1 #  else 
  y!  z h# ffffffff # x! and 0=  if  y  else  0 #  then  then  next
end-code
