\ basic SysV system calls

code syscall0  ( n -- y ) syscall  next  end-code

code syscall1  ( x n -- y ) 
  x!  drop y!  y w!  x syscall  next
end-code

code syscall2  ( x y n -- z )
  x!  drop y!  drop w!  ap dup  y ap!  x syscall  
  x!  drop ap!  x  next
end-code

code syscall3  ( x y z n -- p )
  >r  drop z!  drop y!  drop w!  ap dup  y ap!
  r> syscall  x!  drop ap!  x  next
end-code

code syscall4  ( x y z p n -- q )
  >r  drop r10!  drop z!  drop y!  drop w!  ap dup
  y ap!  r> syscall  x!  drop ap!  x  next
end-code
