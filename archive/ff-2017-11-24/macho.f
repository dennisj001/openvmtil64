\ Mach-O binary generation
\
\ Assuming one text, one data and one bss section and no frills.
\
\ requires: endian.f meta.f

512 constant /machoprefix
4096 constant pagesize          
variable machobase

7 constant CPU_TYPE_X86
h# 01000007 constant CPU_TYPE_X86_64

3 constant CPU_SUBTYPE_I386_ALL
h# 80000003 constant CPU_SUBTYPE_X86_64_ALL

2 constant MH_EXECUTE       1 constant MH_NOUNDEFS

1 constant LC_SEGMENT           h# 19 constant LC_SEGMENT_64
5 constant LC_UNIXTHREAD

1 constant VM_PROT_READ     2 constant VM_PROT_WRITE
4 constant VM_PROT_EXECUTE

1 constant I386_THREAD_STATE
4 constant X86_THREAD_STATE64

16 constant I386_THREAD_STATE_COUNT
42 constant X86_THREAD_STATE64_COUNT

h# 1000 constant baseaddr_i386
h# 100000000 constant baseaddr_x86_64

h# feedface constant i386-magic
h# feedfacf constant x86_64-magic

variable cputype    variable cpusubtype     variable lc_segment

: machobaseaddr  ( -- a ) machobase @ /machoprefix + ;
: machooffset  ( -- u ) here imagestart @ - ;
: macho64  ( -- f ) twordsize @ 8 = ;
: magic  macho64  if  x86_64-magic  else  i386-magic  then  w4, ;
\ align value up to page size
: machoaligned  ( a1 -- a2 )
  pagesize 1-  swap over + swap invert and ;

defer machocpustate

: i386-cpustate
  I386_THREAD_STATE w4, \ flavor
  I386_THREAD_STATE_COUNT w4,   \ count
  10 tcells allot  entrypoint @ w4,  5 tcells allot ; \ registers

: x86_64-cpustate
  X86_THREAD_STATE64 w4, \ flavor
  X86_THREAD_STATE64_COUNT w4,   \ count
  16 tcells allot  entrypoint @ w8,  4 tcells allot ; \ registers

: i386-macho
  CPU_TYPE_X86 cputype !  CPU_SUBTYPE_I386_ALL cpusubtype !
  baseaddr_i386 machobase !  LC_SEGMENT lc_segment !
  ['] i386-cpustate is machocpustate ;

: x86_64-macho
  1 cells 8 <> 
    abort" 64-bit darwin file can only be generated by 64-bit host"
  CPU_TYPE_X86_64 cputype !  CPU_SUBTYPE_X86_64_ALL cpusubtype !
  baseaddr_x86_64 machobase !  LC_SEGMENT_64 lc_segment !
  ['] x86_64-cpustate is machocpustate ;

variable totalsize
: machoheader
  magic  
  cputype @ w4,  
  cpusubtype @ w4,  
  MH_EXECUTE w4,    \ filetype
  4 w4,             \ ncmds
  here totalsize ! 0 w4,    \ size of all LCs
  MH_NOUNDEFS w4,             \ flags
  macho64  if  0 w4,  then ;    \ reserved

: ,str16  ( a u -- ) here swap cmove  16 allot ;
: wm,  ( x -- ) macho64  if  w8,  else  w4,  then ;
: fixsize  ( a1 a2 -- ) here rot - swap w4! ;

: loadcmds
  \ pagezero:
  here              \ remember start of LC
  lc_segment @ w4, \ cmd
  here 0 w4,        \ cmdsize (take addr)
  s" __PAGEZERO" ,str16 \ segname
  0 wm,            \ vmaddr
  machobase @ wm,  \ vmsize
  0 wm, 0 wm, 0 w4, 0 w4,   \ fileoff filesize maxprot initprot
  0 w4, 0 w4,       \ nsects flags
  fixsize
  \ code segment:
  here
  lc_segment @ w4,    \ cmd
  here 0 w4,        \ cmdsize
  s" __TEXT" ,str16   \ segname
  machobase @ wm,     \ vmaddr
  kernelsize @ wm,  \ vmsize
  0 wm,             \ offset
  kernelsize @ wm,    \ filesize
  VM_PROT_READ VM_PROT_EXECUTE or dup w4, w4,  \ maxprot initprot
  0 w4,             \ nsects
  0 w4,             \ flags
  fixsize
  \ data/bss segment:
  here
  lc_segment @ w4,    \ cmd
  here 0 w4,        \ cmdsize
  s" __DATA" ,str16 \ segname
  machobase @ kernelsize @ + wm,    \ vmaddr
  codesize @ kernelsize @ - machoaligned bsssize @ + wm,   \ vmsize
  kernelsize @ wm,  \ offset
  codesize @ kernelsize @ - wm,    \ filesize
  VM_PROT_READ VM_PROT_WRITE or dup w4, w4, \ maxprot initprot
  0 w4,             \ nsects
  0 w4,             \ flags
  fixsize
  \ unixthread segment:
  here
  LC_UNIXTHREAD w4,     \ cmd
  here 0 w4,            \ cmdsize
  machocpustate
  fixsize
  here imagestart @ - totalsize @ ! ;   \ fixup sizeofcmds

: copydata  
  codebuffer @ codesize @ /machoprefix - copyimage ;

:noname  dictsize @ /machoprefix + 
  machoaligned codesize ! ; is set-codesize

: genimage
  here imagestart !  here /machoprefix erase
  machoheader  loadcmds  /machoprefix machooffset - allot ( pad )
  copydata  here imageend ! ;
