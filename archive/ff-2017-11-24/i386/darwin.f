\ syscall implementation for i386/darwin


7 constant sys_wait4
199 constant sys_lseek
189 constant sys_fstat

include i386/bsd.f

48 constant stat>size

\ custom syscall0 that checks edx, needed for `fork`:
\ (see libsyscall/custom/__fork.s in the xnu sources)
code (fork)  ( -- y )
  dup sys_fork # dup syscall cs?  if  -1 # x!  drop  x  else 
  x!  drop  z 0=  if  x  else  0 #  then  then  next
end-code
