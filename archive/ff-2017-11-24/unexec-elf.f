\ generate executable (ELF)
\
\ requires: stuff.f

vocabulary unexec
also unexec definitions

6 constant AX       7 constant WAX
1 constant LOAD     1 constant PROGBITS
8 constant NOBITS

\ extract prg-header and base address from ELF data in image
1 cells 8 = [if]        \ elf64
32 constant e_phoff
8 constant p_offset
16 constant p_vaddr
24 constant p_paddr
32 constant p_filesz
40 constant p_memsz
48 constant p_align
56 constant phentsize
[else]
28 constant e_phoff
4 constant p_offset
8 constant p_vaddr
12 constant p_paddr
16 constant p_filesz
20 constant p_memsz
28 constant p_align
32 constant phentsize
[then]
imgbase e_phoff + @ imgbase + constant prghdraddr
prghdraddr p_vaddr + @ constant baseaddr
prghdraddr p_filesz + @ constant textsize

512 constant baseoffset   \ /elfprefix

prghdraddr p_align + @ constant elfalign

: addralign  ( u1 -- u2 ) 
  elfalign 1- swap over +  swap invert and ;

\ compute data/bss segment sizes
: memsize  ( -- u )
  here baseaddr - addralign textsize - ;

\ adjust program-header for data, bss + note segments
: fixup-prghdr  ( a -- )
  prghdraddr imgbase - + phentsize +    \ 2nd program-header (data/bss)
  p_filesz +  memsize swap ! ;  \ modify filesize

\ copy elf-header + load-headers and modify + write
: gen-elf/prghdr  ( fd -- )
  imgbase pad baseoffset cmove
  pad fixup-prghdr  
  pad  baseoffset  rot write-file ?fcheck ;

\ write text + data segments
: gen-text/data  ( fd -- )  
  imgbase baseoffset + textsize memsize + 
    baseoffset - rot write-file ?fcheck ;

\ create file with executable permissions
: xcreate-file  ( a n -- fd ior ) 
  zstring w/o O_TRUNC or OPENX_MODE fscreate dup ior ;

\ variant of "boot" for use in unexec'd programs
: xboot  clear  sp@ cell+ s0 !  here h0 !  startup  bye ;

\ boot "xboot" on startup using initial `dp` (not used by vocabulary
\ system)
c" xboot" findname drop dpboot ! 

also forth definitions

: saved  ( a n | -- )
  2dup delete-file drop  \ delete in case it is running
  xcreate-file ?fcheck  
  dup gen-elf/prghdr
  dup gen-text/data
  close-file ?fcheck ;

: save  ( | <fname> -- ) bl word count saved ;

previous previous
