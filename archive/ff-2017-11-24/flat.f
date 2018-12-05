\ flat file generation
\
\ requires: meta.f

: copydata  codebuffer @ codesize @ copyimage ;
: genimage  here imagestart !  copydata  here imageend ! ;

:noname  dictsize @ codesize ! ; is set-codesize
