\ common syscall implementations


code syscall0  ( n -- y ) 
  syscall syserr?  if  -1 #  then  next
end-code

code syscall1  ( x n -- y )
  x!  drop 0 sysarg  x syscall syserr?  if  -1 #  then  next
end-code

code syscall2  ( x y n -- z )
  x!  drop 1 sysarg  drop 0 sysarg
  x syscall syserr?  if  -1 #  then  next
end-code

code syscall3  ( x y z n -- p )
  x!  drop 2 sysarg  drop 1 sysarg  drop 0 sysarg
  x syscall syserr?  if  -1 #  then  next
end-code

code syscall4  ( x y z p n -- q )
  x!  drop 3 sysarg  drop 2 sysarg  drop 1 sysarg
  drop 0 sysarg  x syscall syserr?  if  -1 #  then  next
end-code
