\ common syscall implemenation

code syscall0  ( n -- y )
  syscall#  syscall  syserr?  if  -1 #  then  next 
end-code

code syscall1  ( x n -- y )
  syscall#  drop syscall  syserr?  if  -1 #  then  next 
end-code

code syscall2  ( x y n -- z )
  syscall#  drop x!  drop  syscall  syserr?  if  -1 #  then  next
end-code

code syscall3  ( x y z n -- p )
  syscall#  drop y!  drop x!  drop
  syscall  syserr?  if  -1 #  then  next
end-code

code syscall4  ( x y z p n -- q )
  syscall#  drop z!  drop y!  drop x!  drop
  syscall  syserr?  if  -1 #  then  next
end-code
