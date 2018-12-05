\ generate executable (Mach-O)
\
\ requires: stuff.f


vocabulary unexec
also unexec definitions

h# feedfacf constant x86_64-magic

: le4@  ( a -- x )
  dup c@ over 1+ c@ 8 lshift or over 2 + c@ 16 lshift or
  swap 3 + c@ 24 lshift or ;
: be4@  ( a -- x )
  dup c@ 24 lshift over 1+ c@ 16 lshift or over 2 + c@ 
  8 lshift or swap 3 + c@ or ;

defer w4@

1 cells 8 =  [if]
  [defined] little-endian  [if]  ' le4@
  [else]  ' be4@  [then]  is w4@
[else]  ' @ is w4@  [then] ;    

imgbase w4@ constant magic
: macho64  ( -- f ) magic x86_64-magic = ;

24 constant >vmaddr
24 1 cells + constant >vmsize
24 2 cells + constant >offset
24 3 cells + constant >filesize

macho64  [if]  8  [else]  7  [then] 4 * constant >lcommands
>lcommands dup 4 + imgbase + w4@ + constant >text-lcmd
>text-lcmd dup 4 + imgbase + w4@ + constant >data-lcmd
>text-lcmd >vmaddr + imgbase + @ constant baseaddr
>text-lcmd >filesize + imgbase + @ constant textsize
512 constant baseoffset   \ /machoprefix

4096 constant machoalign

: addralign  ( u1 -- u2 ) 
  machoalign 1- swap over +  swap invert and ;

\ compute used data segment segment size
: datasize  ( -- u ) here baseaddr - addralign textsize - ;

\ adjust filesize of __DATA lcmd
: fixup-lcmds  ( a -- )
  >data-lcmd + >filesize + datasize  swap ! ;

\ copy macho-header + load-commands and modify + write
: gen-hdr/lcmds  ( fd -- )
  imgbase pad baseoffset cmove
  pad fixup-lcmds
  pad baseoffset rot write-file ?fcheck ;

\ write text + data segments
: gen-text/data  ( fd -- )  
  imgbase baseoffset + textsize datasize + 
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
  dup gen-hdr/lcmds
  dup gen-text/data
  close-file ?fcheck ;

: save  ( | <fname> -- ) bl word count saved ;

previous previous
