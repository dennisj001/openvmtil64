\ generic assembler - portable part
\ 
\ requires: endian.f meta.f

vocabulary generic

: ahere  ( -- a ) mkh @ ;
: a,  ( x -- ) ahere c!  1 tkallot ;
: aw,  ( x -- ) ahere w!  1 tcells tkallot ;
[defined] target-little-endian [if]
: a2,  ( x -- ) ahere le2!  2 tkallot ;
: a4,  ( x -- ) ahere le4!  4 tkallot ;
: a8,  ( x -- ) ahere le8!  8 tkallot ;
[else]
: a2,  ( x -- ) ahere be2!  2 tkallot ;
: a4,  ( x -- ) ahere be4!  4 tkallot ;
: a8,  ( x -- ) ahere be8!  8 tkallot ;
[then]

: code  ( | name -- )
  bl word count theader mkh @ reloc t, also generic ;
: end-code  previous ;
