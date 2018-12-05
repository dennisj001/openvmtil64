\ syscall implementation for PPC/NetBSD


7 constant sys_wait4
19 constant sys_lseek
440 constant sys_fstat 

include ppc/bsd.f

112 [defined] big-endian  [if]  4 +  [then] constant stat>size
