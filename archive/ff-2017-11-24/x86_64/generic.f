\ generic x86_64 operations
\
\ requires: generic.f
\
\ TOS: rax
\ SP:  rsp
\ RP:  rbp
\ AP:  rsi
\ W:   rdi
\
\ x, y, z: rbx, rcx, rdx


hex

: dup  50 a, ;      \ push rax
: drop  58 a, ;     \ pop rax
: #  ( x -- ) 
  ?dup 0=  if  48 a, 31 a, c0 a,  \ xor rax, rax
  else  48 a, b8 a,  a8,  then ;   \ mov rax, <imm>
: cell+  48 a, 83 a,  c0 a,  1 tcells a, ;     \ add rax, <1 cells>
: cell-  48 a, 83 a,  e8 a,  1 tcells a, ;     \ sub rax, <1 cells>
: jump  ff a, e3 a, ;   \ jmp rbx
: next      \ clobbers y
  48 a, 8b a, 3e a,           \ mov rdi, [rsi]
  48 a, 83 a, c6 a, 1 tcells a,     \ add rsi, 8
  48 a, 8b a, 1f a,           \ mov rbx, [rdi]
  jump ;         \ jmp rbx
[defined] target-linux [defined]  target-darwin or  [if]
: osargs  48 a, 89 a, e0 a, ;     \ mov rax, rsp
[else]
: osargs  48 a, 89 a, d8 a, ;     \ mov rax, rbx
[then]
: sp  48 a, 89 a, e0 a, ;     \ mov rax, rsp
: rp  48 a, 89 a, e8 a, ;     \ mov rax, rbp
: ap  48 a, 89 a, f0 a, ;     \ mov rax, rsi
: w  48 a, 89 a, f8 a, ;     \ mov rax, rdi
: x  48 a, 89 a, d8 a, ;     \ mov rax, rbx
: y  48 a, 89 a, c8 a, ;     \ mov rax, rcx
: z  48 a, 89 a, d0 a, ;     \ mov rax, rdx
: @  48 a, 8b a, 0 a, ;       \ mov rax, [rax]
: c@  
  8a a, 0 a,            \ mov al, [rax]
  48 a, 25 a, ff a, 0 a, 0 a, 0 a, ; \ and rax, 0xff
: !  48 a, 89 a, 03 a, ;      \ mov [rbx], rax
: c!  88 a, 03 a, ;     \ mov [rbx], al
: sp!  48 a, 89 a, c4 a, ;    \ mov rsp, rax
: rp!  48 a, 89 a, c5 a, ;    \ mov rbp, rax
: ap!  48 a, 89 a, c6 a, ;    \ mov rsi, rax
: w!  48 a, 89 a, c7 a, ;    \ mov rdi, rax
: x!  48 a, 89 a, c3 a, ;    \ mov rbx, rax
: y!  48 a, 89 a, c1 a, ;    \ mov rcx, rax
: z!  48 a, 89 a, c2 a, ;    \ mov rdx, rax
: +  48 a, 01 a, d8 a, ;      \ add rax, rbx
: -  48 a, 29 a, d8 a, ;      \ sub rax, rbx
: *  48 a, f7 a, eb a, ;      \ imul rbx  (clobbers z)
: and  48 a, 21 a, d8 a, ;    \ and rax, rbx
: or  48 a, 09 a, d8 a, ;     \ or rax, rbx
: xor  48 a, 31 a, d8 a, ;    \ xor rax, rbx
: /mod   \ tos /mod x -> tos=q, x=r, clobbers z
  48 a, 99 a,         \ cqo
  48 a, f7 a, fb a,   \ idiv rbx
  48 a, 89 a, d3 a, ; \ mov rbx, rdx
: u/mod     \ tos u/mod x -> tos=q, x=r, clobbers z
  48 a, 31 a, d2 a,       \ xor rdx, rdx
  48 a, f7 a, f3 a,       \ div rbx   
  48 a, 89 a, d3 a, ;     \ mov rbx, rdx
: 1+  48 a, ff a, c0 a, ;       \ inc rax
: aligned  
  48 a, 83 a, c0 a, 1 tcells 1- a,     \ add rax, 7
  48 a, 83 a, e0 a, 1 tcells 1- invert a, ;   \ and rax, ~7
: skip  48 a, 83 a, c6 a, 1 tcells a, ; \ add rsi, 8
: >r  
  48 a, 89 a, 45 a, 00 a,     \ mov [rbp], rax
  48 a, 83 a, c5 a, 1 tcells a, ;   \ add rbp, 8
: r>
  48 a, 83 a, ed a, 1 tcells a,     \ sub rbp, 8
  48 a, 8b a, 45 a, 00 a, ;   \ mov rax, [rbp]
: lshift    \ clobbers y
  48 a, 89 a, d9 a,       \ mov rcx, rbx
  48 a, d3 a, e0 a, ;     \ shl rax, cl
: rshift    \ clobbers y
  48 a, 89 a, d9 a,       \ mov rcx, rbx
  48 a, d3 a, e8 a, ;     \ shr rax, cl
: rshifta   \ clobbers y
  48 a, 89 a, d9 a,       \ mov rcx, rbx
  48 a, d3 a, f8 a, ;     \ sar rax, cl
: syscall  0f a, 05 a, ;    \ syscall
: r8!  49 a, 89 a, c0 a, ;  \ mov r8, rax
: r9!  49 a, 89 a, c1 a, ;  \ mov r9, rax
: r10!  49 a, 89 a, c2 a, ;  \ mov r10, rax
: break  cd a, 03 a, ;  \ int 3
: trylock  86 a, 03 a, ;  \ xchg al, [rbx]
: pause  f4 a, ;    \ hlt
variable cond
: <
  48 a, 39 a, c3 a,           \ cmp rbx, rax
  7d cond ! ;            \ jge
: =
  48 a, 39 a, c3 a,           \ cmp rbx, rax
  75 cond ! ;            \ jne
: u<
  48 a, 39 a, c3 a,           \ cmp rbx, rax
  73 cond ! ;            \ jae
: 0=  
  48 a, 85 a, c0 a,           \ test rax, rax
  75 cond ! ;           \ jne
: cs?  73 cond ! ;           \ jnc

: patch  ( from to -- ) over 2 + - swap 1+ c! ;
: %if  ( -- a ) ahere  cond @ a, 0 a, ;
: if  %if ;
: then  ( a -- ) ahere patch ;
: branch,  ( -- a ) ahere  eb a, 0 a, ;  \ jmp
: else  ( a1 -- a2 ) branch,  swap ahere patch ;
: begin  ( -- a ) ahere ;
: again  ( a -- ) branch,  swap patch ;

decimal
