\ generic i386 operations
\
\ TOS: eax
\ SP:  esp
\ RP:  ebp
\ AP:  esi
\ W:   edi
\ 
\ x, y, z: ebx, ecx, edx

hex

: dup  50 a, ;      \ push eax
: drop  58 a, ;     \ pop eax
: #  ( x -- ) 
  ?dup 0=  if  31 a, c0 a,  \ xor eax, eax
  else  b8 a,  a4,  then ;   \ mov eax, <imm>
: cell+  83 a,  c0 a,  1 tcells a, ;     \ add eax, <1 cells>
: cell-  83 a,  e8 a,  1 tcells a, ;     \ sub eax, <1 cells>
: jump  ff a, e3 a, ;   \ jmp ebx
: next      \ clobbers y
  8b a, 3e a,           \ mov edi, [esi]
  83 a, c6 a, 04 a,     \ add esi, 4
  8b a, 1f a,           \ mov ebx, [edi]
  jump ;         \ jmp ebx
[defined] target-linux  [defined] target-darwin or  
  [defined] target-freebsd or  [if]
: osargs  89 a, e0 a, ;     \ mov eax, esp
[else]
: osargs  89 a, d8 a, ;     \ mov eax, ebx
[then]
: sp  89 a, e0 a, ;     \ mov eax, esp
: rp  89 a, e8 a, ;     \ mov eax, ebp
: ap  89 a, f0 a, ;     \ mov eax, esi
: w  89 a, f8 a, ;     \ mov eax, edi
: x  89 a, d8 a, ;     \ mov eax, ebx
: y  89 a, c8 a, ;     \ mov eax, ecx
: z  89 a, d0 a, ;     \ mov eax, edx
: @  8b a, 0 a, ;       \ mov eax, [eax]
: c@  
  8a a, 0 a,            \ mov al, [eax]
  25 a, ff a, 0 a, 0 a, 0 a, ; \ and eax, 0xff
: !  89 a, 03 a, ;      \ mov [ebx], eax
: c!  88 a, 03 a, ;     \ mov [ebx], al
: sp!  89 a, c4 a, ;    \ mov esp, eax
: rp!  89 a, c5 a, ;    \ mov ebp, eax
: ap!  89 a, c6 a, ;    \ mov esi, eax
: w!  89 a, c7 a, ;    \ mov edi, eax
: x!  89 a, c3 a, ;    \ mov ebx, eax
: y!  89 a, c1 a, ;    \ mov ecx, eax
: z!  89 a, c2 a, ;    \ mov edx, eax
: +  01 a, d8 a, ;      \ add eax, ebx
: -  29 a, d8 a, ;      \ sub eax, ebx
: *  f7 a, eb a, ;      \ imul ebx  (clobbers z)
: and  21 a, d8 a, ;    \ and eax, ebx
: or  09 a, d8 a, ;     \ or eax, ebx
: xor  31 a, d8 a, ;    \ xor eax, ebx
: /mod   \ tos /mod x -> tos=q, x=r, clobbers z
  99 a,         \ cdq
  f7 a, fb a,   \ idiv ebx
  89 a, d3 a, ; \ mov ebx, edx
: u/mod     \ tos u/mod x -> tos=q, x=r, clobbers z
  31 a, d2 a,       \ xor edx, edx
  f7 a, f3 a,       \ div ebx   
  89 a, d3 a, ;     \ mov ebx, edx
: 1+  40 a, ;       \ inc eax
: aligned  
  83 a, c0 a, 1 tcells 1- a,     \ add eax, 3
  83 a, e0 a, 1 tcells 1- invert a, ;   \ and eax, ~3
: skip  83 a, c6 a, 1 tcells a, ; \ add esi, 4
: >r  
  89 a, 45 a, 00 a,     \ mov [ebp], eax
  83 a, c5 a, 1 tcells a, ;   \ add ebp, 4
: r>
  83 a, ed a, 1 tcells a,     \ sub ebp, 4
  8b a, 45 a, 00 a, ;   \ mov eax, [ebp]
: lshift    \ clobbers y
  89 a, d9 a,       \ mov ecx, ebx
  d3 a, e0 a, ;     \ shl eax, cl
: rshift    \ clobbers y
  89 a, d9 a,       \ mov ecx, ebx
  d3 a, e8 a, ;     \ shr eax, cl
: rshifta   \ clobbers y
  89 a, d9 a,       \ mov ecx, ebx
  d3 a, f8 a, ;     \ sar eax, cl
: syscall  cd a, 80 a, ;    \ int 0x80
: syssave
  56 a, 57 a, 55 a, ;   \ push esi, edi, ebp
: sysrestore
  5d a, 5f a, 5e a, ;   \ pop ebp, edi, esi
: break  cd a, 03 a, ;  \ int 3
: trylock  86 a, 03 a, ;  \ xchg al, [ebx]
: portc!  
  89 a, da a,   \ mov edx, ebx
  ee a, ;        \ out dx, al
: portc@
  89 a, c2 a,   \ mov edx, eax
  ec a, ;       \ in al, dx
: ticks  \ clobbers z
  0f a, 31 a,  \ rdtsc
  89 a, d3 a, ; \ mov ebx, edx
: lidt  0f a, 01 a, 18 a, ; \ lidt [eax]
: cli  fa a, ;  \ cli
: sti  fb a, ;  \ sti
: iret  cf a, ; \ iret
: pause  f4 a, ;  \ hlt
variable cond
: <
  39 a, c3 a,           \ cmp ebx, eax
  7d cond ! ;            \ jge
: =
  39 a, c3 a,           \ cmp ebx, eax
  75 cond ! ;            \ jne
: u<
  39 a, c3 a,           \ cmp ebx, eax
  73 cond ! ;            \ jae
: 0=  
  85 a, c0 a,           \ test eax, eax
  75 cond ! ;           \ jne
: cs?  
  73 cond ! ;           \ jnc

: patch  ( from to -- ) over 2 + - swap 1+ c! ;
: %if  ( -- a ) ahere  cond @ a, 0 a, ;
: if  %if ;
: then  ( a -- ) ahere patch ;
: branch,  ( -- a ) ahere  eb a, 0 a, ;  \ jmp
: else  ( a1 -- a2 ) branch,  swap ahere patch ;
: begin  ( -- a ) ahere ;
: again  ( a -- ) branch,  swap patch ;

decimal
