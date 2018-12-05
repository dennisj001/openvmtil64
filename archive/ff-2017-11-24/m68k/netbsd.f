\ syscall implementation got m68k/NetBSD

code syscall0  ( n -- y )
  dup  syscall  cs?  if  -1 #  then  x!  drop  x  next
end-code

code syscall1  ( x n -- y )
  dup  syscall  cs?  if  -1 #  then  x!  drop  drop  x  next
end-code

code syscall2  ( x y n -- z )
  x!  drop  y!  drop  z!  y dup  z dup  dup  
  x syscall  cs?  if  -1 #  then  drop drop drop  next
end-code

code syscall3  ( x y z n -- p )
  x!  drop y!  drop z!  drop w!
  y dup  z dup  w dup  dup  x syscall  cs?  if  -1 #  then
  x!  drop drop drop drop  x next
end-code

code syscall4  ( x y z p n -- q )
  >r  drop x!  drop y!  drop z!  drop w!
  x dup  y dup  z dup  w dup  dup  r> syscall
  cs?  if  -1 #  then  x!  drop drop drop drop drop  x  next
  next
end-code

code syscall8  ( a n -- x )     \ parameters are in a[0]...a[7]
  y!  drop x!  7 tcells # +  x!
  x @ dup  
  x cell- x! @ dup  
  x cell- x! @ dup
  x cell- x! @ dup  
  x cell- x! @ dup
  x cell- x! @ dup
  x cell- x! @ dup
  x cell- x! @ dup
  dup  y syscall  cs?  if  -1 #  then  x! 
  drop drop drop drop drop drop drop drop drop  x  next
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
7 constant sys_wait4
19 constant sys_lseek
440 constant sys_fstat 

1 1024 or 512 or constant w/o  \ O_WRONLY | O_TRUNC | O_CREAT
0 constant r/o  \ O_RDONLY
2 constant r/w  \ O_RDWR
1 8 or 512 or constant a/o   \ O_WRONLY | O_APPEND | O_CREAT
2 8 or constant r/a  \ O_RDWR | O_APPEND

88 constant stat>size

420 ( 644 ) constant OPEN_MODE      
493 ( 755 ) constant OPENX_MODE
1024 constant O_TRUNC

include unix.f
