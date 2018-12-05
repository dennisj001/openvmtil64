\ ELF binary generation
\
\ Assuming one text, one data and one bss section
\ and no frills.
\
\ requires: endian.f meta.f


\ machine parameters

variable mparams        variable >machine   variable mdef

: machine  ( | name -- ) 
  <builds  here cell+ ,  mparams off  mdef on
  does>  @ >machine !  ;

: slot  ( | name -- ) 
  <builds  mparams @ ,  1 mparams +! 
  does>  ( x -- | -- a ) 
  mdef @  if  drop ,  else  @ cells >machine @ +  then ;

slot elfdata   slot elfalign    slot elfcodealign
slot elfflags  slot elfmachine  slot elfbase
slot elfclass

1 constant LSB          2 constant MSB
1 constant ELFCLASS32   2 constant ELFCLASS64

machine i386-elf
 LSB elfdata    h# 1000 elfalign        
 16 elfcodealign
 0 elfflags     3 elfmachine
 h# 8048000 elfbase  ELFCLASS32 elfclass

machine x86_64-elf
 LSB elfdata    h# 10000 elfalign    \ defaults seems to be 2000000
 16 elfcodealign
 0 elfflags     62 elfmachine
 h# 400000 elfbase  ELFCLASS64 elfclass

machine arm-elf
 LSB elfdata    h# 8000 elfalign        
 4 elfcodealign
 h# 5000002 elfflags    40 elfmachine
 h# 8000 elfbase  ELFCLASS32 elfclass

machine armeb-elf
 MSB elfdata    h# 8000 elfalign        
 4 elfcodealign
 h# 5000002 elfflags    40 elfmachine
 h# 8000 elfbase  ELFCLASS32 elfclass

machine sparc-elf
 MSB elfdata    h# 10000 elfalign       
 8 elfcodealign
 0 elfflags     2 elfmachine
 h# 10000 elfbase  ELFCLASS32 elfclass

machine mips-elf
 MSB elfdata    h# 10000 elfalign       
 8 elfcodealign
 0 elfflags     8 elfmachine
 h# 400000 elfbase  ELFCLASS32 elfclass

machine mipsel-elf
 LSB elfdata    h# 10000 elfalign       
 8 elfcodealign
 0 elfflags     8 elfmachine
 h# 400000 elfbase  ELFCLASS32 elfclass

machine ppc-elf
 MSB elfdata    h# 10000 elfalign       
 8 elfcodealign
 0 elfflags     20 elfmachine
 h# 10000000 elfbase  ELFCLASS32 elfclass

machine riscv32-elf
 LSB elfdata    h# 10000 elfalign       
 8 elfcodealign
 0 elfflags     h# f3 elfmachine
 h# 10000 elfbase  ELFCLASS32 elfclass

machine riscv64-elf
 LSB elfdata    h# 10000 elfalign       
 8 elfcodealign
 0 elfflags     h# f3 elfmachine
 h# 10000 elfbase  ELFCLASS64 elfclass

machine m68k-elf
 MSB elfdata    h# 1000 elfalign       
 4 elfcodealign
 0 elfflags     4 elfmachine
 h# 2000 elfbase  ELFCLASS32 elfclass

mdef off

0 constant ELFOSABI_SYSV        2 constant ELFOSABI_NETBSD
3 constant ELFOSABI_LINUX       9 constant ELFOSABI_FREEBSD
12 constant ELFOSABI_OPENBSD

variable elfosabi
2variable elfnote       2variable elfosdesc     2variable elfosname
variable W^X    W^X off

create linux_osname ," GNU" 0 c,

: linux_osdata  ( -- a )
  here  0 w4, 2 w4, 6 w4, 0 w4, ;  \ OS: Linux, ABI: 2.6.0

: select-linux
  ELFOSABI_LINUX elfosabi !  
  linux_osname count 1+ elfosname 2!
  linux_osdata 16 elfosdesc 2! ;

create none_osname ," ff-elf" 0 c,

: select-none       \ plain elf for qemu kernels (for example)
  ELFOSABI_SYSV elfosabi !
  none_osname count 1+ elfosname 2!
  pad 0 elfosdesc 2! ;

create freebsd_osname ," FreeBSD" 0 c,
create freebsd_osdata 0 ,   \ ???

: select-freebsd
  ELFOSABI_FREEBSD elfosabi !  
  freebsd_osname count 1+ elfosname 2!
  freebsd_osdata 4 elfosdesc 2! ;

create netbsd_osname ," NetBSD" 0 c,
: netbsd_osdata  ( -- a ) here 105000000 w4, ; \ NetBSD 1.5

: select-netbsd
  ELFOSABI_NETBSD elfosabi !  
  netbsd_osname count 1 + elfosname 2!
  netbsd_osdata 4 elfosdesc 2! ;

create openbsd_osname ," OpenBSD" 0 c,
create openbsd_osdata 0 ,

: select-openbsd
  ELFOSABI_OPENBSD elfosabi !  W^X on
  openbsd_osname count 1 + elfosname 2!
  openbsd_osdata 4 elfosdesc 2! ;

: notesize  ( -- u )
  elfosname 2@ nip aligned  
  elfosdesc 2@ nip aligned + 3 4 *  + ;

512 constant /elfprefix

: elfbaseaddr  ( -- a ) elfbase @ /elfprefix + ;
: elfmagic  [ hex ] 7f c,  45 c,  4c c,  46 c,  [ decimal ] ;

2 constant EXEC
52 constant ehsize32        64 constant ehsize64      
32 constant phentsize32     56 constant phentsize64
3 constant phnum

1 constant LOAD         4 constant NOTE
1 constant PROGBITS     8 constant NOBITS

6 constant AX           7 constant WAX        
5 constant RE           7 constant RWE
6 constant RW

1 constant EV_CURRENT
1 constant ELF_NOTE_TYPE_OSVERSION

: elf64  ( -- f ) elfclass @ ELFCLASS64 = ;
: elf32  ( -- f ) elfclass @ ELFCLASS32 = ;
: elfoffset  ( -- u ) here imagestart @ - ;

\ ELF header

: elfheader
  elfmagic  
  elfclass @ c,
  elfdata @ c,  EV_CURRENT c,  
  elfosabi @ c, 0 c,     \ e_ident
   7 allot         \ padding
  EXEC w2,          \ e_type
  elfmachine @ w2,  \ e_machine
  EV_CURRENT w4,    \ e_version
  entrypoint @ w,  \ e_entry
  elf64  if  ehsize64  else  ehsize32  then w,        \ e_phoff
  0 w,             \ e_shoff
  elfflags @ w4,    \ e_flags
  elf64  if  ehsize64  else  ehsize32  then w2,        \ e_ehsize
  elf64  if  phentsize64  else  phentsize32  then w2,  \ e_phentsize
  phnum w2,         \ e_phnum
  0 w2,             \ e_shentsize
  0 w2,             \ e_shnum
  0 w2, ;           \ e_shstrndx

\ program headers

variable dataflags

: prgheaders
  \ code:
  LOAD w4,         \ p_type
  elf64  if  RE w4,  then  \ p_flags (elf64)
  0 w,            \ p_offset
  elfbase @ dup w, w, \ p_vaddr + p_paddr
  kernelsize @ dup w, w, \ p_filesz, p_memsz
  elf32  if  RE w4,  then   \ p_flags (elf32)
  elfalign @ w,   \ p_align  
  \ data/bss:
  W^X @  if  RW  else  RWE  then  dataflags !
  LOAD w4,         \ p_type
  elf64  if  RW w4,  then  \ p_flags (elf64)
  kernelsize @ w,  \ p_offset
  elfbase @ kernelsize @ + dup w, w,  \ p_vaddr + p_paddr
  codesize @ kernelsize @ - w,  \ p_filesz
  codesize @ bsssize @ + w,  \ p_memsz
  elf32  if  dataflags @ w4,  then   \ p_flags (elf32)
  elfalign @ w,   \ p_align
  \ note:
  NOTE w4,         \ p_type
  elf64  if  RW w4,  then  \ p_flags (elf64)
  elf64  if  6   else  7  then  twordsize @ * elfoffset + w, \ p_offset
  bssaddr @ bsssize @ + dup w, w, \ p_vaddr + p_paddr
  notesize dup w, w,  \ p_filesz, p_memsz
  elf32  if  RW w4,  then  \ p_flags (elf32)
  4 w, ;          \ p_align  

\ note segment

: notesegment  ( desc descsz name namesz -- )
  dup w4,         \ namesz
  2 pick w4,      \ descsz
  ELF_NOTE_TYPE_OSVERSION w4, \ type
  dup >r here swap cmove  r> allot  align    \ name
  dup >r here swap cmove  r> allot  align ;  \ desc

: addnote  elfosdesc 2@ elfosname 2@ notesegment ;

\ copy text section

: copydata  
  codebuffer @ codesize @ /elfprefix - copyimage ;

\ align codesize (including elfheader) up to elf alignment
: elfaligned  ( a1 -- a2 )
  elfalign @ 1-  swap over + swap invert and ;

:noname  dictsize @ /elfprefix + 
  elfaligned codesize ! ; is set-codesize

: genimage
  here imagestart !  here /elfprefix erase
  elfheader  prgheaders  addnote
  /elfprefix elfoffset - allot ( pad )
  copydata  here imageend ! ;
