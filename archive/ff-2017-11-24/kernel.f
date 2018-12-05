\ generic kernel

\ dict-entry: [bits/len(1) name(?) link cf pf(?)]

code (variable)  ( -- a ) dup w cell+ next  end-code

variable h      variable dp     variable args
variable r0     variable s0

code _start
  osargs y!         \ save argc+argv ptr
  args # x! y !     \ and store
  dp # @ x!         \ fetch last word in dictionary and enter
  c@ + 1+ aligned cell+ cell+ ap!  \ add len + align to extract pf
  r0 # @ rp!        \ reset rp, or initial (:) will crash
  s0 # @ sp!        \ reset sp, as we need it before first `clear`
  next  
end-code

code (lit)  ( -- x ) dup ap @ skip  next  end-code
code (:)  x!  ap >r  w cell+ ap!  x  next  end-code
code exit  x!  r> ap! x  next  end-code
code (constant)  ( -- x ) dup w cell+ @  next  end-code
code reset  x!  r0 # @ rp!  x  next  end-code
code @  ( a -- x ) @  next  end-code
code !  ( x a -- ) x! drop !  drop  next  end-code
code c@  ( a -- c ) c@  next  end-code
code c!  ( c a -- ) x! drop c!  drop  next  end-code
code sp@  ( -- a ) dup sp  next  end-code
code sp!  ( ... a -- ... ) x! drop y!  x sp!  y  next  end-code
code rp@  ( -- a ) dup rp  next  end-code
code rp!  ( a -- ) rp! drop  next  end-code

code (does>)  ( -- a )
  dup  ap >r  w cell+ @ ap!  w cell+ cell+  next  
end-code

code (else)  x!  ap @ ap!  x  next  end-code

code (if)  ( f -- )
  x!  ap @ y! ap cell+ ap!  x 0=  if  y ap!  then  drop  next
end-code

code (slit)  ( -- a u )
  dup ap c@ x!  ap 1+ dup  + aligned ap!  x  next
end-code

code (do)  ( hi lo -- ) >r drop >r drop  next  end-code

code (loop)
  y!  rp cell- cell- @ 1+ x!  rp cell- @ 
  <  if  x z!  rp cell- cell- x! z !  ap @ ap!  y  next  then
  skip  rp cell- cell- rp!  y  next
end-code

code (+loop)  ( n -- )
  x!  rp cell- cell- @ + x!  rp cell- @
  <  if  x z!  rp cell- cell- x! z !  ap @ ap!  drop  next  then
  skip  rp cell- cell- rp!  drop  next
end-code

code r@  ( -- x ) dup rp cell- @  next  end-code
code >r  ( x -- ) >r drop  next  end-code
code r>  ( -- x ) dup r>  next  end-code
code i  ( -- n ) dup rp cell- cell- @  next  end-code
code j  ( -- n ) dup rp x! cell- cell- cell- cell- @  next  end-code
code +  ( n1 n2 -- n ) x! drop +  next  end-code
code -  ( n1 n2 -- n ) x! drop -  next  end-code
code *  ( n1 n2 -- n ) x! drop *  next  end-code

code /mod  ( n1 n2 -- n3 n4 )
  x! drop /mod y! x dup y  next  
end-code

code u/mod  ( u1 u2 -- u3 u4 )
  x! drop u/mod y! x dup y  next
end-code

code and  ( n1 n2 -- n ) x! drop and  next  end-code
code or  ( n1 n2 -- n ) x! drop or  next  end-code
code xor  ( n1 n2 -- n ) x! drop xor  next  end-code
code swap  ( x y -- y x ) x! drop y! x dup y  next  end-code
code drop  ( x -- ) drop  next  end-code
code dup  ( x -- x x ) dup  next  end-code
code over  ( x y -- x y x ) x! sp @ y!  x dup  y  next  end-code

code = ( x y -- f )
  x! drop =  if  -1 #  else  0 #  then  next 
end-code

code u<  ( u1 u2 -- f )
  y! drop x! y u<  if  -1 #  else  0 #  then  next
end-code
  
code <  ( n1 n2 -- f )
  y! drop x! y <  if  -1 #  else  0 #  then  next
end-code

code lshift  ( x u -- y ) x! drop lshift  next  end-code
code rshift  ( x u -- y ) x! drop rshift  next  end-code
code rshifta  ( x u -- y ) x! drop rshifta  next  end-code
code execute  ( ... a -- ... ) w! @ x! drop jump  end-code
code (defer)  y!  w cell+ @ w!  @ x!  y jump  end-code
code unloop  x!  rp cell- cell- rp!  x  next  end-code
code brk  break  next  end-code
code pause  pause  next  end-code

code lock?  ( a -- f ) 
  x! 1 # trylock 0=  if  -1 #  else  0 #  then  next
end-code

[defined] target-i386  [if]
variable isr1_on
code portc!  ( x p -- ) x! drop portc!  drop  next  end-code
code portc@  ( p -- x ) y! 255 # x!  y portc@ and  next  end-code
code ticks  ( -- hi lo ) dup ticks y! x dup  y  next  end-code
code lidt  ( a -- ) lidt  drop  next  end-code
code sti  sti  next  end-code
code isr1
  cli  dup  x dup  isr1_on # x! 1 # !  
  32 # x!  32 # portc!  \ EOI, for PIC interrupts
  drop x!  drop  sti  iret
end-code
[then]
