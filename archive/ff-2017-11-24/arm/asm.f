\ arm assembler - from: http://yxit.co.uk/source/#ARM%20Assembler


\
\ this program is distributed under the terms of the 'mit license'. the text
\ of this licence follows...
\
\ copyright (c) 2005 j.d.medhurst (a.k.a. tixy)
\
\ permission is hereby granted, free of charge, to any person obtaining a copy
\ of this software and associated documentation files (the "software"), to deal
\ in the software without restriction, including without limitation the rights
\ to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
\ copies of the software, and to permit persons to whom the software is
\ furnished to do so, subject to the following conditions:
\
\ the above copyright notice and this permission notice shall be included in
\ all copies or substantial portions of the software.
\
\ the software is provided "as is", without warranty of any kind, express or
\ implied, including but not limited to the warranties of merchantability,
\ fitness for a particular purpose and noninfringement.  in no event shall the
\ authors or copyright holders be liable for any claim, damages or other
\ liability, whether in an action of contract, tort or otherwise, arising from,
\ out of or in connection with the software or the use or other dealings in
\ the software.
\
\
\ ----------------------------------------------------------------------------
\ requirements and dependecies
\
\ this code requires ans wordsets: core, core-ext, search-order and
\ search-order-ext. it also uses the non-standard word vocabulary.
\
\ the code is dependent on the size of a cell being at least 32 bits.
\
\
\ ----------------------------------------------------------------------------
\ usage
\
\ all assembler words are in the vocabulary assembler. before use
\ this must be added to the search order, with:
\
\     also assembler
\
\ before performing any assembly code-begin must be executed, this takes as
\ a parameter the target address for which code will be compiled for.
\ when all code has been assembled, code-end must be executed to ensure that
\ the final instruction is assembled correctly.
\
\ because many arm instructions also share names with standard forth words
\ there may be problems when intermingling forth and arm code. to resolve this
\ the word [[ is provided which adds the forth wordlist to the beginning of
\ the search order, the word ]] reverts this change. e.g.
\
\     mov r0 [[ some-variable @ ff and ]] #
\
\ this is analogous to escaping from compilation mode with the forth [ ]
\ words.
\
\
\ ----------------------------------------------------------------------------
\ assembler syntax
\
\ the assembler syntax attempts to follow that defined by arm but changes have
\ made to enable it to work under the forth interpreter. these changes are
\ detailed below.
\
\ 1. operands are separated by whitespace rather than commas. e.g.
\
\        add  r0,r1,r2
\
\    is written as
\
\        add  r0 r1 r2
\
\ 2. non alpha-numeric symbols must be surrounded by whitespace. e.g.
\
\        ldr  r0,[r1]
\        ldm  r0!,{r2,r3}
\
\    is written as
\
\        ldr  r0 [ r1 ]
\        ldm  r0 ! { r2 r3 }
\
\ 3. condition code mnemonics must be surrounded by whitespace. e.g.
\
\        moveq  r0,r1
\
\    is written as
\
\        mov eq  r0 r1
\
\    this may also mean that an instruction's name gets split. e.g.
\
\        ldreqbt  r0,[r1]
\        moveqs   r2,r0
\
\    is written as
\
\        ldr eq bt  r0 [ r1 ]
\        mov eq s   r2 r0
\
\ 4. all numeric constants are postfixed by a #, (which actually just takes a
\    value from the stack). e.g.
\
\        mov  r0,#123
\
\    is written as
\
\        mov  r0 123 #
\
\    a # is also used for numeric values which don't normally have a # prefix
\    in arm syntax. e.g.
\
\        mcr  p15,1,r2,c3,c4,5
\
\    is written as
\
\        mcr  p15 1 # r2 c3 c4 5 #
\
\ 5. the psr fields in the msr instruction must have whitespace before them.
\    e.g.
\
\        msr  cpsr_cf,r0
\
\    is written as
\
\        msr  cpsr_ cf r0
\
\    the words cpsr_ and spsr_ are parsing words.
\
\
\ other notes:
\
\ the load an store instructions can take numeric constants as their
\ addressing mode and the assembler converts these into pc relative
\ addressing. e.g.
\
\     ldr r0 12345678 #
\
\ is converted to the form
\
\     ldr r0 [ pc <offset> # ]
\
\ the pseudo instruction adr does a similar thing to generate add or sub
\ instructions which give a pc relative address. e.g.
\
\     adr r0 12345678 #
\
\ is converted to the form
\
\     add r0 pc <offset> #
\
\
\ labels
\
\ the assembler supports labels. there are 3 words which support this:
\
\    l: name
\        define label 'name' whose value is the current code address.
\
\    l= name
\        define label 'name' and assign its value from the top of the stack.
\
\    l# name
\        use the value of label 'name' in an instruction as though it were a
\        numeric constant.
\
\    examples:
\        char " l= terminator
\        l: scan-loop
\            ldr b  r0 [ r1 ] 1 #
\            cmp    r0 l# terminator
\            b ne   l# scan-loop
\
\            ldr    r0 l# default
\            mov    pc lr
\        l: default
\            dcd 12345678 #
\
\
\ porting
\
\ the internal words code-here code-here! and code, are used for storing
\ assembled code into memory. this implementation uses the forth dictionary
\ but these words can be modified to use some other location.
\
\ code, will also need porting if this code is run on a forth system where
\ a cell isn't 32 bits.
\
\
\ ----------------------------------------------------------------------------
\ changes
\
\ 2016-12-24
\     fixed some non-portable code, use "compare".
\
\ 2016-12-23
\     made "code-here"/"code-here!"/"code," deferred words.
\     exposed "code-origin" 
\
\ 2016-12-15
\     ported to ff. (felix)
\
\ 2006-11-09
\     fixed some ans forth standard compliancey issues.
\     * made all hex values use upper-case letters.
\     * fixed use of private and public so the compilation wordlist isn't
\       changed during compilation of a word.
\     thanks to dmitry yakimov for fixes and suggestions.
\
\
\ code follows...


: char+ 1+ ;        : chars ;

hex

\ ----------------------------------------------------------------------------
\ place assembler in its own vocabulary.
\ internal implementation words go into a separate private-wordlist

vocabulary assembler      also assembler definitions
vocabulary private-wordlist   also private-wordlist definitions

also forth   \ make sure forth words are found first

: private   ( -- )   \ make new words go into private wordlist
        also private-wordlist definitions previous ;

: public   ( -- )   \ make new words go into public wordlist
        also assembler definitions previous ;

\ ----------------------------------------------------------------------------
\ helpers words...

: rrotate   ( x1 u -- x2 )   \ rotate the bits of x1 right by u bits
        1f and
        2dup rshift
        rot rot 20 swap - lshift
        or
;

\ ----------------------------------------------------------------------------
\ words governing where assembled code gets placed.  ( porting )

public 

defer code-here     defer code-here!        defer code,

: (code-here)   ( -- a-addr )   \ return address where code will be assembled to
        here ;

: (code-here!)   ( a-addr -- )   \ set address where code will be assembled to
        here - allot ;

: (code,)   ( x -- )   \ store 32 bit x at assembly address, and step to next
        , ;

' (code-here) is code-here
' (code-here!) is code-here!
' (code,) is code,

private

\ ----------------------------------------------------------------------------
\ variables

variable op-value     \ bits for op-code being constructed
variable op-mask      \ mask of bits currently stored in op-value
variable op-default   \ mask of bits in op-value which have default values
variable shift-flag   \ set by shift operands
variable ]-flag       \ set true by ]
variable {-flag       \ set true by {
variable register-location   \ 0 to 4 bytes giving location to store registers
variable '#           \ vector for #
variable 'rm          \ vector called when rm register is encountered

public

variable code-origin  \ address at which op-value is assembled for


\ ----------------------------------------------------------------------------
\ words controlling immediate operands

: #   ( x -- )   \ arm assembler, immediate operand suffix
        '# @ execute ;

private

: unexpected-#   ( -- )
        true abort" assembler: unexpected #" ;

: reset-#   ( -- )   \ clear behaviour of immediate operand
        ['] unexpected-# '# ! ;

: invalid#   ( -- )
        true abort" assembler: invalid immediate operand" ;

: check#   ( u1 u2 -- u1 )   \ check u1 <= u2
        over u< if invalid# then ;

\ ----------------------------------------------------------------------------
\ words for initialising op-code generation

: default-rm   ( x1 x2 x3 -- x1 x2 )   \ default action when rm register used
        drop ;   \ do nothing

: op-reset   ( -- )   \ reset assembler state
        0 op-value !
        0 op-mask !
        f0000000 op-default !
        0 shift-flag !
        0 ]-flag !
        0 {-flag !
        ffffffff register-location !
        reset-#
        ['] default-rm 'rm !
;

: ?invalid   ( x -- )   \ if x not zero, then instruction is invalid
        abort" assembler: invalid instruction form"
;

: op-build   ( x1 x2 -- )   \ set opcode bits masked by x2 to values in x1
        op-mask @
        2dup and ?invalid
        over or op-mask !
        invert op-value @ and or op-value !
;

: op-end   ( -- )   \ end of instruction assembly
        op-mask @
        if
                op-mask @ op-default @ or
                ffffffff xor ?invalid   \ check all bits are accounted for
                op-value @ code,
                4 code-origin +!
                0 op-mask !
        then
;

: op-init   ( x1 x2 x3 -- )   \ initialise the assembler of new instruction
        op-reset
        register-location !
        op-mask !
        op-value !
;

: op-begin   ( x1 x2 x3 -- )    \ start assembly of a new instruction
        op-end op-init ;

: do-instruction   ( a-addr -- )   \ common behaviour of instruction words
        \ fetch 3 words from a-addr and call op-begin
        dup @
        swap cell+ dup @
        swap cell+ @
        op-begin
;

: instruction   ( "<spaces>name" -- )   \ create instruction
        <builds
        does>  ( -- )
        do-instruction
;

: instruction#   ( "<spaces>name" -- )   \ instruction with immediate operand
        <builds
        does>  ( -- )
        dup do-instruction
        cell+ cell+ cell+
        @ '# !
;

: instructiond   ( "<spaces>name" -- )   \ instruction with default ops mask
        <builds
        does>  ( -- )
        dup do-instruction
        cell+ cell+ cell+
        @ op-default !
;

: instructiond#   ( "<spaces>name" -- )   \ instr. with default and immediate
        <builds
        does>  ( -- )
        dup do-instruction
        cell+ cell+ cell+
        dup @ '# !
        cell+ @ op-default !
;

\ ----------------------------------------------------------------------------
\ flags parsing

: lower-case   ( c1 -- c2 )   \ covert ascii character to lower-case
        dup [char] a - 1a u< 20 and +
;

: flag   ( c c-addr -- )   \ process a single parsed flag character
        begin
                2dup c@ <>
        while
                dup c@ 0= ?invalid
                char+ char+
        repeat
        1 swap char+ c@ lshift
        dup op-build
        drop
;

: flags   ( -- )   \ create flags parsing word
        <builds
        does>   ( "<spaces>ccc" -- )
        >r
        \ set flags in op-value for each flag char present in "ccc"...
        bl word count
        begin
                dup
        while
                over c@ lower-case r@ flag
                1- swap char+ swap
        repeat
        2drop
        \ now set op-mask for each flag bit...
        0 r>
        begin
                dup c@
        while
                char+
                >r 1 r@ c@ lshift or
                r> char+
        repeat
        drop
        op-mask @ or op-mask !
;

\ ----------------------------------------------------------------------------
\ labels
\
\ structure of object is
\   cell    ref-link   \ link to list of unresolved references
\   cell    value      \ value for label
\   string  name       \ name of label as a counted string

: label>ref-link   ( a-addr1 -- a-addr2 )
        ;

: label>value   ( a-addr1 -- a-addr2 )
        cell+ ;

: label>name   ( a-addr -- c-addr )
        cell+ cell+ ;

0f constant max-label-name-size   \ max significant length for label name

2 cells  max-label-name-size 1+ +   aligned
constant label-size   \ size of label object

10 constant #labels   \ max number of labels
create labels   #labels label-size * allot
here constant labels-end

: alloc-label   ( -- a-addr )   \ allocate a new label object
        labels
        begin
                dup label>name c@ 0= ?exit
                label-size +
                dup labels-end u<
        while
        repeat
        1 abort" assembler: too many labels"
;

: create-label   ( c-addr1 u1 -- a-addr )
        max-label-name-size min
        alloc-label >r
        r@ label>name
        2dup c!
        char+ swap chars cmove
        r>
;

: find-label   ( c-addr u -- a-addr true | c-addr u false )
        max-label-name-size min
        2>r
        labels
        begin
                dup label>name count 
                2r@ compare 0=  if  2r> 2drop  true  exit  then
          label-size +
          dup labels-end u<
        while
        repeat
        drop 2r> false
;

\ ----------------------------------------------------------------------------
\ unresolved label references
\
\ structure of object is
\   cell ref-link   \ link to next unresolved references
\   cell origin     \ value for op-origin where reference occurred
\   cell op-addr    \ address of instruction where reference occurred
\   cell '#         \ xt of word handling immediate arguments for reference

: ref>ref-link   ( a-addr1 -- a-addr2 )
        ;

: ref>origin   ( a-addr1 -- a-addr2 )
        cell+ ;

: ref>op-addr   ( a-addr1 -- a-addr2 )
        cell+ cell+ ;

: ref>'#   ( a-addr1 -- a-addr2 )
        cell+ cell+ cell+ ;

4 cells constant ref-size

20 constant #label-refs   \ max number of unresolved label references
create label-refs   \ size of label reference object
#label-refs ref-size * allot
here constant label-refs-end

: alloc-label-ref   ( -- a-addr )   \ allocate a reference to a label
        label-refs
        begin
                dup ref>origin @
        while
                ref-size +
                dup label-refs-end =
                if 1 abort" assembler: too many label references" then
        repeat
;

: create-label-ref   ( a-addr -- )   \ create reference to label a-addr
        alloc-label-ref >r

        dup label>ref-link @      \ get old head of ref list
        r@ ref>ref-link !         \ link to old head from new ref
        r@ swap label>ref-link !  \ make new ref the head

        code-origin @ r@ ref>origin  !
        code-here r@ ref>op-addr !
        '# @ r> ref>'# !
;

: resolve-ref   ( x a-addr -- x a-addr )   \ ref a-addr resolves to value x
        code-origin @ >r

        >r
        op-reset

        ffffff10 register-location !
        r@ ref>origin @ code-origin !
        r@ ref>op-addr @ @ op-value !

        dup r@ ref>'# @ execute

        op-value @
        r@ ref>op-addr @ !

        op-reset
        r> 0 over ref>origin !   \ clear ref origin to indicate it is free

        r> code-origin !
;

: label-resolve   ( a-addr -- )   \ resolve all references to a label
        dup label>value @
        swap label>ref-link 
        begin
                dup @    \ get ref-link
                0 rot !  \ clear ref-link
                dup
        while
                resolve-ref
                ref>ref-link
        repeat
        2drop
;

: check-labels-resolved   ( -- )
        0 labels
        begin
                dup label>ref-link @ 
                if
                        ." unresolved label: " dup label>name count type cr
                        >r 1+ r>
                then
                label-size +
                dup labels-end u< 0=
        until
        drop
        abort" assembler: unresolved labels"
;


\ ----------------------------------------------------------------------------
\ top level words for labels

: labels-reset   ( -- )   \ clear all labels and references
        labels labels-end over - erase
        label-refs label-refs-end over - erase
;

: get-label   ( <spaces>"name" -- a-addr flag )   \ find label or create one
        \ flag is true if label has a value assigned.
        bl word count find-label
        if
                dup label>ref-link @ 0=
        else
                create-label false
        then
;

public

: l=    ( x <spaces>"name" -- )   \ arm assembler, assign value to label
        op-end
        get-label
        abort" assembler: label already defined"
        swap over label>value !
        label-resolve
;

: l:    ( <spaces>"name" -- )   \ arm assembler, define a label
        op-end  code-origin @ l= ;

: l#    ( <spaces>"name" -- )   \ arm assembler, label reference
        get-label
        if
                label>value @   \ use address from label
        else
                create-label-ref
                code-origin @   \ use current address as a dummy value
        then
        '# @ execute
;

private

\ ----------------------------------------------------------------------------
\ pseudo instructions

public

: .    ( -- addr )   \ arm assembler, current code address
        code-origin @ ;

private

: dcd#   ( x -- )
        ffffffff op-build ;

public

instructiond# dcd    ( -- addr )   \ arm assembler, inline constant
        0 , 0 , ffffffff , ' dcd# , 0 ,

private

\ ----------------------------------------------------------------------------
\ top level words for assembler

public

: [[   ( -- )   \ arm assembler, add forth wordlist to search order
        also forth ;

: ]]   ( -- )   \ arm assembler, revert action of [[
        previous ;

: code-begin   ( a-addr -- )   \ start code assembly
        code-origin !
        labels-reset
        op-reset
;

: code-end   ( -- )   \ end code asembly
        op-end
        check-labels-resolved
;

private

\ ----------------------------------------------------------------------------
\ condition codes...

: condition   ( u "<spaces>name" -- )   \ definer for condition codes
        <builds ,
        does>   ( -- )
        @ f0000000 op-build
;

public

00000000 condition eq   \ arm assembler, condition code
10000000 condition ne   \ arm assembler, condition code
20000000 condition cs   \ arm assembler, condition code
30000000 condition cc   \ arm assembler, condition code
40000000 condition mi   \ arm assembler, condition code
50000000 condition pl   \ arm assembler, condition code
60000000 condition vs   \ arm assembler, condition code
70000000 condition vc   \ arm assembler, condition code
80000000 condition hi   \ arm assembler, condition code
90000000 condition ls   \ arm assembler, condition code
a0000000 condition ge   \ arm assembler, condition code
b0000000 condition lt   \ arm assembler, condition code
c0000000 condition gt   \ arm assembler, condition code
d0000000 condition le   \ arm assembler, condition code
e0000000 condition al   \ arm assembler, condition code
f0000000 condition nv   \ arm assembler, condition code

private

\ ----------------------------------------------------------------------------
\ register operands

: ?bad-register   ( x -- )
        abort" assembler: unexpected or bad register operand"
;

: register   ( u "<spaces>name" -- )   \ definer for cpu register words
        <builds ,
        does>   ( -- )
        @ {-flag @
        if
                \ register in ldm/stm list...
                dup 0f u> ?bad-register
                1 swap lshift dup op-build
                exit
        then

        \ get bit position for register in the op-code were building...
        register-location dup @ dup 8 rshift ff000000 or rot !

        dup -1 = ?bad-register

        \ check register type
        2dup xor 20 and ?bad-register

        over >r

        \ create values for op-build
        swap 0f and swap 1f and
        0f over lshift >r lshift r>

        \ add op-code bits for shift value if required
        shift-flag @
        if
                swap 010 or
                swap 090 or
        then

        \ execute special action for rm register
        dup 0f and
        if
                r@ 'rm @ execute
        then

        r> drop
        op-build   \ include bits in op-code we're building
;

public

00 register r0   \ arm assembler, cpu register
01 register r1   \ arm assembler, cpu register
02 register r2   \ arm assembler, cpu register
03 register r3   \ arm assembler, cpu register
04 register r4   \ arm assembler, cpu register
05 register r5   \ arm assembler, cpu register
06 register r6   \ arm assembler, cpu register
07 register r7   \ arm assembler, cpu register
08 register r8   \ arm assembler, cpu register
09 register r9   \ arm assembler, cpu register
0a register r10   \ arm assembler, cpu register
0b register r11   \ arm assembler, cpu register
0c register r12   \ arm assembler, cpu register
0d register r13   \ arm assembler, cpu register
0e register r14   \ arm assembler, cpu register
0f register r15   \ arm assembler, cpu register
80 register -r0   \ arm assembler, cpu register
81 register -r1   \ arm assembler, cpu register
82 register -r2   \ arm assembler, cpu register
83 register -r3   \ arm assembler, cpu register
84 register -r4   \ arm assembler, cpu register
85 register -r5   \ arm assembler, cpu register
86 register -r6   \ arm assembler, cpu register
87 register -r7   \ arm assembler, cpu register
88 register -r8   \ arm assembler, cpu register
89 register -r9   \ arm assembler, cpu register
8a register -r10   \ arm assembler, cpu register
8b register -r11   \ arm assembler, cpu register
8c register -r12   \ arm assembler, cpu register
8d register -r13   \ arm assembler, cpu register
8e register -r14   \ arm assembler, cpu register
8f register -r15   \ arm assembler, cpu register
20 register c0   \ arm assembler, coprocessor register
21 register c1   \ arm assembler, coprocessor register
22 register c2   \ arm assembler, coprocessor register
23 register c3   \ arm assembler, coprocessor register
24 register c4   \ arm assembler, coprocessor register
25 register c5   \ arm assembler, coprocessor register
26 register c6   \ arm assembler, coprocessor register
27 register c7   \ arm assembler, coprocessor register
28 register c8   \ arm assembler, coprocessor register
29 register c9   \ arm assembler, coprocessor register
2a register c10   \ arm assembler, coprocessor register
2b register c11   \ arm assembler, coprocessor register
2c register c12   \ arm assembler, coprocessor register
2d register c13   \ arm assembler, coprocessor register
2e register c14   \ arm assembler, coprocessor register
2f register c15   \ arm assembler, coprocessor register
: sp r13 ;     \ arm assembler, alias for r13
: -sp -r13 ;   \ arm assembler, alias for r13
: lr r14 ;     \ arm assembler, alias for r14
: -lr -r14 ;   \ arm assembler, alias for r14
: pc r15 ;     \ arm assembler, alias for r15
: -pc -r15 ;   \ arm assembler, alias for r15
private

\ ----------------------------------------------------------------------------
\ shift operands

: shift#   ( x -- )   \ handle immediate operand for shifts
        dup 1- shift-flag @ u> if invalid# then
        1f and 7 lshift f90 op-build
        reset-#
;

: shift   ( n x -- )   \ definer for shift operand words
        <builds , ,
        does>   ( -- )
        dup @ 060 op-build
        cell+ @ shift-flag !
        ['] shift# '# !
        op-default @ fffff0ff and op-default !   \ force more operands to be given
;

public

1e 000 shift lsl   ( -- )   \ arm assembler, shift operator
1f 020 shift lsr   ( -- )   \ arm assembler, shift operator
1f 040 shift asr   ( -- )   \ arm assembler, shift operator
1e 060 shift ror   ( -- )   \ arm assembler, shift operator

: rrx   ( -- )   \ arm assembler, shift operator
        060 ff0 op-build ;

private

\ ----------------------------------------------------------------------------
\ data processing instructions...

: arm-data-literal-rotate-count   ( u -- u n )   \ used by arm-data-literal
        0
        over 100 u< ?exit
        begin
                2 +
                2dup rrotate 0ff u> 0= ?exit
        dup 1e u<
        while
        repeat
        drop -1
;

: arm-data-literal   ( u -- x )   \ convert u into 12bit data literal
        arm-data-literal-rotate-count
        dup 0= if drop exit then
        dup 20 u<
        if
                dup >r
                rrotate
                20 r> - 7 lshift or
                exit
        then
        invalid#
;

: data#   ( x -- )   \ handle literal operand for data instructions
        arm-data-literal
        02000000 or 02000fff
        op-build
;

public

instructiond# and   \ arm assembler, data processing instruction
        e0000000 , 0de00000 , 0800100c , ' data# , f2100fff ,

instructiond# eor   \ arm assembler, data processing instruction
        e0200000 , 0de00000 , 0800100c , ' data# , f2100fff ,

instructiond# sub   \ arm assembler, data processing instruction
        e0400000 , 0de00000 , 0800100c , ' data# , f2100fff ,

instructiond# rsb   \ arm assembler, data processing instruction
        e0600000 , 0de00000 , 0800100c , ' data# , f2100fff ,

instructiond# add   \ arm assembler, data processing instruction
        e0800000 , 0de00000 , 0800100c , ' data# , f2100fff ,

instructiond# adc   \ arm assembler, data processing instruction
        e0a00000 , 0de00000 , 0800100c , ' data# , f2100fff ,

instructiond# sbc   \ arm assembler, data processing instruction
        e0c00000 , 0de00000 , 0800100c , ' data# , f2100fff ,

instructiond# rsc   \ arm assembler, data processing instruction
        e0e00000 , 0de00000 , 0800100c , ' data# , f2100fff ,

instructiond# tst   \ arm assembler, data processing instruction
        e1100000 , 0df0f000 , ff080010 , ' data# , f2000fff ,

instructiond# teq   \ arm assembler, data processing instruction
        e1300000 , 0df0f000 , ff080010 , ' data# , f2000fff ,

instructiond# cmp   \ arm assembler, data processing instruction
        e1500000 , 0df0f000 , ff080010 , ' data# , f2000fff ,

instructiond# cmn   \ arm assembler, data processing instruction
        e1700000 , 0df0f000 , ff080010 , ' data# , f2000fff ,

instructiond# orr   \ arm assembler, data processing instruction
        e1800000 , 0de00000 , 0800100c , ' data# , f2100fff ,

instructiond# mov   \ arm assembler, data processing instruction
        e1a00000 , 0def0000 , ff08000c , ' data# , f2100fff ,

instructiond# bic   \ arm assembler, data processing instruction
        e1c00000 , 0de00000 , 0800100c , ' data# , f2100fff ,

instructiond# mvn   \ arm assembler, data processing instruction
        e1e00000 , 0def0000 , ff08000c , ' data# , f2100fff ,

: s   ( -- )   \ arm assembler, data processing instruction modifier
        00100000 dup op-build
;

private

\ ----------------------------------------------------------------------------
\ multiply instructions

public

instructiond mul   ( -- )   \ arm assembler, multiply instruction
        e0000090 , 0fe0f0f0 , ff080010 , f0100000 ,
instructiond mla   ( -- )   \ arm assembler, multiply instruction
        e0200090 , 0fe000f0 , 0c080010 , f0100000 ,
instructiond umull   ( -- )   \ arm assembler, multiply instruction
        e0800090 , 0fe000f0 , 0800100c , f0100000 ,
instructiond umlal   ( -- )   \ arm assembler, multiply instruction
        e0a00090 , 0fe000f0 , 0800100c , f0100000 ,
instructiond smull   ( -- )   \ arm assembler, multiply instruction
        e0c00090 , 0fe000f0 , 0800100c , f0100000 ,
instructiond smlal   ( -- )   \ arm assembler, multiply instruction
        e0e00090 , 0fe000f0 , 0800100c , f0100000 ,

private

\ ----------------------------------------------------------------------------
\ load/store instructions

: adr#   ( x -- )   \ handle immediate operand for adr pseudo instructions
        code-origin @ 8 + -
        dup 0<
        if
                negate
                op-value dup @ 00c00000 xor swap !   \ turn add into sub
        then
        arm-data-literal
        00000fff
        op-build
;

public

instruction# adr   ( -- )   \ arm assembler, pseudo op for pc relative address
        e28f0000 , 0fff0000 , ffffff0c , ' adr# ,

private

: set-pre-indexing   ( x1 -- x2 )
        op-mask @ 01000000 and 0=
        if
                ]-flag @ 0=
                if swap 01000000 or swap then
                01000000 or
        then
;

: try-mem#   ( n -- n | n2 )   \ see if we need a pc relative address
        op-mask @ 000f000f and 0=        \ if no rn or index already set...
        if pc code-origin @ 8 + - then   \ ...use pc relative addressing
;

: mem#   ( n -- )   \ process immediate operand for ldr/str instructions
        try-mem#                         \ check for absolute memory address
        dup abs 0fff check#              \ get abs value and check range
        swap 0< invert 00800000 and or   \ set u bit if index +ve
        02800fff                         \ op-mask value
        set-pre-indexing                 \ set pre-index (p) bit if appropriate
        op-build
        reset-#
;

: mem-op-rm   ( x1 x2 x3 -- x4 x5 )   \ process rm register for ldr/str ops
        \ x1,x2 = op-value,op-mask   x3 = rm register value
        \ x4,x5 = modified op-value,op-mask
        invert 80 and 10 lshift rot or   \ set u bit if not -ve register
        02000000 or                      \ set register index
        swap 02800000 or                 \ add bits to op-mask
        set-pre-indexing                 \ set pre-index (p) bit if appropriate
;

: mem-op   ( x -- )   \ common factor for ldr and str instructions
        0c100000 ff00100c op-begin
        ['] mem# '# !
        f3e00fff op-default !
        ['] mem-op-rm 'rm !
;

public

: str   ( -- )   \ arm assembler, store instruction
        e5800000 mem-op ;

: ldr   ( -- )   \ arm assembler, load instruction
        e5900000 mem-op ;

: t   ( -- )   \ arm assembler, load and store instruction modifier
        00200000 01200000 op-build
;

: bt   ( -- )   \ arm assembler, load and store instruction modifier
        00600000 01600000 op-build
;

: [   ( -- )   \ arm assembler, address bracket
        ;

: ]   ( -- )   \ arm assembler, address bracket
        true ]-flag ! ;

: !   ( -- )   \ arm assembler, address write-back modifier
        00200000 dup op-build ;

private

: extra-mem#   ( n -- )   \ handle immediate operand for extra ldr/str
        try-mem#                              \ check for absolute memory address
        dup abs 0ff check#                    \ get abs value and check range
        dup 0f0 and 4 lshift swap 0f and or   \ covert value into op-code format
        00400000 or                           \ set i bit
        swap 0< invert 00800000 and or        \ set u bit if index +ve
        00c00f0f                              \ op-mask value
        set-pre-indexing                      \ set pre-index bit if appropriate
        op-build
        reset-#
;

: extra-mem-op-rm   ( x1 x2 x3 -- x4 x5 )   \ process rm for extra ldr/str
        \ x1,x2 = op-value,op-mask   x3 = rm register value
        \ x4,x5 = modified op-value,op-mask
        invert 80 and 10 lshift rot or   \ set u bit if not -ve register
        swap 00c00000 or                 \ add bits to op-mask
        set-pre-indexing                 \ set pre-index (p) bit if appropriate
;

: extra-mem-op2   ( x -- )   \ mutate into extra load/store instruction
        op-value @ f0000000 and or   \ add in condition code
        0e1000f0                     \ op-mask value
        op-mask @ f0000000 and or    \ add in condition code mask
        ff00100c op-init             \ transmute instruction into new form
        f1e00f0f op-default !
        ['] extra-mem# '# !
        ['] extra-mem-op-rm 'rm !
;

: extra-mem-op   ( x -- )
        op-value @ 00100000 and or   \ add in ldr/str bit
        extra-mem-op2
;

public

: h   ( -- )   \ arm assembler, load and store instruction modifier
        01c000b0 extra-mem-op ;

: sb   ( -- )   \ arm assembler, load and store instruction modifier
        01c000d0 extra-mem-op ;

: sh   ( -- )   \ arm assembler, load and store instruction modifier
        01c000f0 extra-mem-op ;

instructiond swp   ( -- )   \ arm assembler, swap instruction
        e1000090 , 0fb00ff0 , ff10000c , f0400000 ,

instructiond stm   ( -- )   \ arm assembler, store multiple instruction
        e8800000 , 0e100000 , ffffff10 , f1e0ffff ,

instructiond ldm   ( -- )   \ arm assembler, load multiple instruction
        e8900000 , 0e100000 , ffffff10 , f1e0ffff ,

private

: multi-type   ( x "<spaces>name" -- )
        <builds ,
        does> ( -- )
        @ 01800000 op-build
;

public

00000000 multi-type da   \ arm assembler, load/store multiple modifier
00800000 multi-type ia   \ arm assembler, load/store multiple modifier
01000000 multi-type db   \ arm assembler, load/store multiple modifier
01800000 multi-type ib   \ arm assembler, load/store multiple modifier

: {   ( -- )   \ arm assembler, load/store multiple register list brace
        true {-flag ! ;

: }   ( -- )   \ arm assembler, load/store multiple register list brace
        ;

: ^ ( -- )   \ arm assembler, load/store multiple instruction modifier
        00400000 dup op-build ;

private

\ ----------------------------------------------------------------------------
\ branch instructions...

: ?bad-branch   ( flag -- )
        abort" assembler: bad branch target"
;

: branch#   ( x -- )   \ handle immediate operand for branch instruction
        dup 3 and ?bad-branch   \ check target is word aligned
        code-origin @ 8 + -
        dup 0< over xor fc000000 and ?bad-branch   \ check range for branch
        2 rshift 00ffffff and
        00ffffff op-build
        reset-#
;

instruction# branch-op   ( -- )
        ea000000 , 0f000000 , ffffffff , ' branch# ,

public

: b   ( -- )   \ arm assembler, branch instruction or ldr/str modifier
        op-mask @ dup 0= swap 000ff000 and or
        if branch-op exit then   \ branch instruction
        00400000 dup op-build    \ byte modifier of load/store instructions
;

instruction# bl   ( -- )   \ arm assembler, branch instruction
        eb000000 , 0f000000 , ffffffff , ' branch# ,

instruction bx ( -- )   \ arm assembler, branch instruction (arm 4t)
        e12fff10 , 0ffffff0 , ffffff00 ,

private

: swi#   ( u -- )   \ handle immediate operand for swi instructions
        00ffffff check#
        00ffffff op-build
        reset-#
;

public

instruction# swi   ( -- )   \ arm assembler, swi instruction
        ef000000 , 0f000000 , ffffffff , ' swi# ,

private

\ ----------------------------------------------------------------------------
\ mrs and msr instructions...

: psr   ( x -- )   \ common factor for psr operands
        00400000 op-build
        op-mask @ 000f0000 and if exit then   \ end if mrs instruction
        00090000 000f0000 op-build   \ set f and c field mask
;

flags psr-flags   \ parse fields for psr register
        char f c, 13 c,
        char s c, 12 c,
        char x c, 11 c,
        char c c, 10 c,
        0 c,

public

: cpsr   ( -- )   \ arm assembler, status register
        00000000 psr ;

: spsr   ( -- )   \ arm assembler, status register
        00400000 psr ;

: cpsr_   ( -- )   \ arm assembler, status register
        00000000 00400000 op-build psr-flags ;

: spsr_   ( -- )   \ arm assembler, status register
        00400000 00400000 op-build psr-flags ;

instruction mrs   ( -- )   \ arm assembler, status register instruction
        e10f0000 , 0fbf0fff , ffffff0c ,

instructiond# msr   ( -- )   \ arm assembler, status register instruction
        e120f000 , 0db0f000 , ffffff00 , ' data# , f2000ff0 ,

private

\ ----------------------------------------------------------------------------
\ coprocessor instructions...

: coprocessor    ( u "<spaces>name" -- )   \ definer for coprocessor
        <builds , does> @ 00000f00 op-build ;

public

000 coprocessor p0   \ arm assembler, coprocessor
100 coprocessor p1   \ arm assembler, coprocessor
200 coprocessor p2   \ arm assembler, coprocessor
300 coprocessor p3   \ arm assembler, coprocessor
400 coprocessor p4   \ arm assembler, coprocessor
500 coprocessor p5   \ arm assembler, coprocessor
600 coprocessor p6   \ arm assembler, coprocessor
700 coprocessor p7   \ arm assembler, coprocessor
800 coprocessor p8   \ arm assembler, coprocessor
900 coprocessor p9   \ arm assembler, coprocessor
a00 coprocessor p10   \ arm assembler, coprocessor
b00 coprocessor p11   \ arm assembler, coprocessor
c00 coprocessor p12   \ arm assembler, coprocessor
d00 coprocessor p13   \ arm assembler, coprocessor
e00 coprocessor p14   \ arm assembler, coprocessor
f00 coprocessor p15   \ arm assembler, coprocessor

private

: co-mem#   ( x -- )   \ handle immediate operand for ldc/stc
        dup
        {-flag @ 0= if abs 2 rrotate then
        0ff check#
        swap 0< invert if 00800000 or then
        008000ff
        ]-flag @
        if
                \ post index...
                {-flag @ 0= if swap 00200000 or swap then
                01200000 or
        then
        op-build
        reset-#
;

public

instructiond# ldc   ( -- )   \ arm assembler, co-processor instruction
        ed900000 , 0e100000 , ffff102c , ' co-mem# , f1e000ff ,

instructiond# stc   ( -- )   \ arm assembler, co-processor instruction
        ed800000 , 0e100000 , ffff102c , ' co-mem# , f1e000ff ,

: l   ( -- )   \ arm assembler, co-processor instruction modifier
        00400000 dup op-build ;

private

: co-op2#   ( u -- )   \ handle coprocessor instruction 2nd op-code
        7 check#
        5 lshift 000000e0 op-build
        reset-#
;

: co-data#   ( u -- )   \ handler cdp instruction 1st op-code
        0f check#
        14 lshift 00f00000 op-build
        ['] co-op2# '# !
;

: co-mov#   ( u -- )   \ handler mcr/mrc instruction 1st op-code
        7 check#
        15 lshift 00e00000 op-build
        ['] co-op2# '# !
;

public

instruction# cdp   ( -- )   \ arm assembler, co-processor instruction
        ee000000 , 0f000010 , ff20302c , ' co-data# ,

instruction# mcr   ( -- )   \ arm assembler, co-processor instruction
        ee000010 , 0f100010 , ff20300c , ' co-mov# ,

instruction# mrc   ( -- )   \ arm assembler, co-processor instruction
        ee100010 , 0f100010 , ff20300c , ' co-mov# ,

private

\ ----------------------------------------------------------------------------
\ arm5 instructions
\ ----------------------------------------------------------------------------

: blx#   ( x -- )   \ handle immediate operand for blx instruction
        0 f000000f op-build                   \ check no operands have been added
        dup 2 and 17 lshift                   \ get half-word flag
        fa000000 or ff000000 ffffffff op-init \ transmute instruction to long blx
        fffffffd and                          \ clear half-word bit in address
        branch#                               \ insert branch address
;

public

instruction# blx   ( -- )   \ arm assembler, branch instruction
        e12fff30 , 0ffffff0 , ffffff00 , ' blx# ,

private

\ ----------------------------------------------------------------------------

: bkpt#   ( u -- )   \ handle immediate operand for bkpt instruction
        0000ffff check#
        dup 0000fff0 and 4 lshift
        swap 0000000f and or
        000fff0f op-build
        reset-#
;

public

instruction# bkpt   ( -- )   \ arm assembler, breakpoint instruction
        e1200070 , fff000f0 , ffffffff , ' bkpt# ,

private

\ ----------------------------------------------------------------------------

public

instruction clz   ( -- )   \ arm assembler, count leading zeros instruction
        e16f0f10 , 0fff0ff0 , ffff000c ,

private

\ ----------------------------------------------------------------------------

public

instruction# mcr2   ( -- )   \ arm assembler, co-processor instruction
        fe000010 , ff100010 , ff20300c , ' co-mov# ,

instruction# mrc2   ( -- )   \ arm assembler, co-processor instruction
        fe100010 , ff100010 , ff20300c , ' co-mov# ,

instructiond# ldc2   ( -- )   \ arm assembler, co-processor instruction
        fd900000 , fe100000 , ffff102c , ' co-mem# , f1e000ff ,

instructiond# stc2   ( -- )   \ arm assembler, co-processor instruction
        fd800000 , fe100000 , ffff102c , ' co-mem# , f1e000ff ,

instruction# cdp2   ( -- )   \ arm assembler, co-processor instruction
        fe000000 , ff000010 , ff20302c , ' co-data# ,

private

\ ----------------------------------------------------------------------------
\ arm5e instructions
\ ----------------------------------------------------------------------------

public

: d   ( -- )   \ arm assembler, load/store double instruction modifier
        01c000d0
        op-value @ invert 00100000 and 0f rshift or   \ add in ldr/str bit
        extra-mem-op2
;

private

\ ----------------------------------------------------------------------------

public

: pld   ( -- )   \ arm assembler, pld instruction
        ldr r15 f1400000 f1600000 op-build ;

private

\ ----------------------------------------------------------------------------

: co-mov2#   ( u -- )   \ handle immediate operand for mcrr/mrcc
        0f check#
        4 lshift 000000f0 op-build
        reset-#
;

public

instruction# mcrr   ( -- )   \ arm assembler, co-processor double instruction
        ec400000 , 0ff00000 , ff20100c , ' co-mov2# ,

instruction# mrrc   ( -- )   \ arm assembler, co-processor double instruction
        ec500000 , 0ff00000 , ff20100c , ' co-mov2# ,

private

\ ----------------------------------------------------------------------------

public

instruction qadd   ( -- )   \ arm assembler, saturated arithmetic instruction
        e1000050 , 0ff00ff0 , ff10000c ,

instruction qsub   ( -- )   \ arm assembler, saturated arithmetic instruction
        e1200050 , 0ff00ff0 , ff10000c ,

instruction qdadd   ( -- )   \ arm assembler, saturated arithmetic instruction
        e1400050 , 0ff00ff0 , ff10000c ,

instruction qdsub   ( -- )   \ arm assembler, saturated arithmetic instruction
        e1600050 , 0ff00ff0 , ff10000c ,

private

\ ----------------------------------------------------------------------------

public

instruction smlabb   ( -- )   \ arm assembler, dsp multiply instruction
        e1000080 , 0ff000f0 , 0c080010 ,

instruction smlatb   ( -- )   \ arm assembler, dsp multiply instruction
        e10000a0 , 0ff000f0 , 0c080010 ,

instruction smlabt   ( -- )   \ arm assembler, dsp multiply instruction
        e10000c0 , 0ff000f0 , 0c080010 ,

instruction smlatt   ( -- )   \ arm assembler, dsp multiply instruction
        e10000e0 , 0ff000f0 , 0c080010 ,

instruction smlawb   ( -- )   \ arm assembler, dsp multiply instruction
        e1200080 , 0ff000f0 , 0c080010 ,

instruction smlawt   ( -- )   \ arm assembler, dsp multiply instruction
        e12000c0 , 0ff000f0 , 0c080010 ,

instruction smulbb   ( -- )   \ arm assembler, dsp multiply instruction
        e1600080 , 0ff0f0f0 , ff080010 ,

instruction smultb   ( -- )   \ arm assembler, dsp multiply instruction
        e16000a0 , 0ff0f0f0 , ff080010 ,

instruction smulbt   ( -- )   \ arm assembler, dsp multiply instruction
        e16000c0 , 0ff0f0f0 , ff080010 ,

instruction smultt   ( -- )   \ arm assembler, dsp multiply instruction
        e16000e0 , 0ff0f0f0 , ff080010 ,

instruction smulwb   ( -- )   \ arm assembler, dsp multiply instruction
        e12000a0 , 0ff0f0f0 , ff080010 ,

instruction smulwt   ( -- )   \ arm assembler, dsp multiply instruction
        e12000e0 , 0ff0f0f0 , ff080010 ,

instruction smlalbb   ( -- )   \ arm assembler, dsp multiply instruction
        e1400080 , 0ff000f0 , 0800100c ,

instruction smlaltb   ( -- )   \ arm assembler, dsp multiply instruction
        e14000a0 , 0ff000f0 , 0800100c ,

instruction smlalbt   ( -- )   \ arm assembler, dsp multiply instruction
        e14000c0 , 0ff000f0 , 0800100c ,

instruction smlaltt   ( -- )   \ arm assembler, dsp multiply instruction
        e14000e0 , 0ff000f0 , 0800100c ,

private

\ ----------------------------------------------------------------------------
\ arm5j instructions
\ ----------------------------------------------------------------------------

public

instruction bxj   ( -- )   \ arm assembler, branch instruction
        e12fff20 , 0ffffff0 , ffffff00 ,

private

\ ----------------------------------------------------------------------------
\ arm6 instructions
\ ----------------------------------------------------------------------------

public

instruction# mcrr2   ( -- )   \ arm assembler, co-processor double instruction
        fc400000 , fff00000 , ff20100c , ' co-mov2# ,

instruction# mrrc2   ( -- )   \ arm assembler, co-processor double instruction
        fc500000 , fff00000 , ff20100c , ' co-mov2# ,

private

\ ----------------------------------------------------------------------------

: cps#   ( u -- )   \ handle immediate operand for cps instruction
        1f check#
        00020000 or 0002001f op-build
;

flags iflags   ( c -- )   \ parse flags for cps instruction
        char a c, 8 c,
        char i c, 7 c,
        char f c, 6 c,
        0 c,

instructiond# cpsie   ( -- )   \ arm assembler, cps instruction
        f1080000 , fffdfe20 , ffffffff , ' cps# , f002001f ,

instructiond# cpsid   ( -- )   \ arm assembler, cps instruction
        f10c0000 , fffdfe20 , ffffffff , ' cps# , f002001f ,

public

: cpsie   ( -- )
        cpsie iflags ;

: cpsid   ( -- )
        cpsid iflags ;

instruction# cps   ( -- )   \ arm assembler, cps instruction
        f1000000 , fffdffe0 , ffffffff , ' cps# ,

private

\ ----------------------------------------------------------------------------

public

instruction setend   ( -- )   \ arm assembler, setend instruction
        f1010000 , fffffdff , ffffffff ,

: le   ( -- )   \ arm assembler, modifier for setend instruction
        op-value @ f1010000 =   \ if setend instruction...
        if 000 200 op-build     \ ... set le bit to zero
        else le                 \ else do less-or-equal condition code
        then
        ;

: be   ( -- )   \ arm assembler, modifier for setend instruction
        200 200 op-build ;

private

\ ----------------------------------------------------------------------------

: srs#   ( u -- )   \ handle immediate operand for srs instruction
        1f check# 0000001f op-build  reset-# ;

public

instructiond# srs   ( -- )   \ arm assembler, srs instruction
        f84d0a00 , fe5fffe0 , ffffffff , ' srs#  , 01a00000 ,

instructiond rfe   ( -- )   \ arm assembler, rfe instruction
        f8100a00 , fe50ffff , ffffff10 , 01a00000 ,

private

\ ----------------------------------------------------------------------------

public

instruction ldrex   ( -- )   \ arm assembler, swap instruction
        e1900f9f , 0ff00fff , ffff100c ,

instruction strex   ( -- )   \ arm assembler, swap instruction
        e1800f90 , 0ff00ff0 , ff10000c ,

private

\ ----------------------------------------------------------------------------

public

instruction umaal   ( -- )   \ arm assembler, multiply instruction
        e0400090 , 0ff000f0 , 0800100c ,

private

\ ----------------------------------------------------------------------------

: pas-instruction   ( x "<spaces>name" -- )   \ parallel add/sub intruction
        <builds ,
        does>   ( -- )
        @ 0ff00ff0 ff00100c op-begin
;

public

e6100f10 pas-instruction sadd16   ( -- )   \ arm assembler, parallel add/sub
e6100f30 pas-instruction saddsubx   ( -- )   \ arm assembler, parallel add/sub
e6100f50 pas-instruction ssubaddx   ( -- )   \ arm assembler, parallel add/sub
e6100f70 pas-instruction ssub16   ( -- )   \ arm assembler, parallel add/sub
e6100f90 pas-instruction sadd8   ( -- )   \ arm assembler, parallel add/sub
e6100ff0 pas-instruction ssub8   ( -- )   \ arm assembler, parallel add/sub

e6200f10 pas-instruction qadd16   ( -- )   \ arm assembler, parallel add/sub
e6200f30 pas-instruction qaddsubx   ( -- )   \ arm assembler, parallel add/sub
e6200f50 pas-instruction qsubaddx   ( -- )   \ arm assembler, parallel add/sub
e6200f70 pas-instruction qsub16   ( -- )   \ arm assembler, parallel add/sub
e6200f90 pas-instruction qadd8   ( -- )   \ arm assembler, parallel add/sub
e6200ff0 pas-instruction qsub8   ( -- )   \ arm assembler, parallel add/sub

e6300f10 pas-instruction shadd16   ( -- )   \ arm assembler, parallel add/sub
e6300f30 pas-instruction shaddsubx   ( -- )   \ arm assembler, parallel add/sub
e6300f50 pas-instruction shsubaddx   ( -- )   \ arm assembler, parallel add/sub
e6300f70 pas-instruction shsub16   ( -- )   \ arm assembler, parallel add/sub
e6300f90 pas-instruction shadd8   ( -- )   \ arm assembler, parallel add/sub
e6300ff0 pas-instruction shsub8   ( -- )   \ arm assembler, parallel add/sub

e6500f10 pas-instruction uadd16   ( -- )   \ arm assembler, parallel add/sub
e6500f30 pas-instruction uaddsubx   ( -- )   \ arm assembler, parallel add/sub
e6500f50 pas-instruction usubaddx   ( -- )   \ arm assembler, parallel add/sub
e6500f70 pas-instruction usub16   ( -- )   \ arm assembler, parallel add/sub
e6500f90 pas-instruction uadd8   ( -- )   \ arm assembler, parallel add/sub
e6500ff0 pas-instruction usub8   ( -- )   \ arm assembler, parallel add/sub

e6600f10 pas-instruction uqadd16   ( -- )   \ arm assembler, parallel add/sub
e6600f30 pas-instruction uqaddsubx   ( -- )   \ arm assembler, parallel add/sub
e6600f50 pas-instruction uqsubaddx   ( -- )   \ arm assembler, parallel add/sub
e6600f70 pas-instruction uqsub16   ( -- )   \ arm assembler, parallel add/sub
e6600f90 pas-instruction uqadd8   ( -- )   \ arm assembler, parallel add/sub
e6600ff0 pas-instruction uqsub8   ( -- )   \ arm assembler, parallel add/sub

e6700f10 pas-instruction uhadd16   ( -- )   \ arm assembler, parallel add/sub
e6700f30 pas-instruction uhaddsubx   ( -- )   \ arm assembler, parallel add/sub
e6700f50 pas-instruction uhsubaddx   ( -- )   \ arm assembler, parallel add/sub
e6700f70 pas-instruction uhsub16   ( -- )   \ arm assembler, parallel add/sub
e6700f90 pas-instruction uhadd8   ( -- )   \ arm assembler, parallel add/sub
e6700ff0 pas-instruction uhsub8   ( -- )   \ arm assembler, parallel add/sub

private

\ ----------------------------------------------------------------------------

: pkh/sat-lsr#   ( x -- )   \ handle immediate operand for pkt & sat shifts
        1f check#  7 lshift 00000f80 op-build  reset-# ;

public

: lsl   ( -- )   \ extend lsl shift to cope with pkh & sat instructions
        op-value @ 0f800070 and 06800010 <>
        if lsl exit then   \ if not pkh/sat instruction do normal lsl
        00000000 00000040 op-build
        ['] pkh/sat-lsr# '# !
;

private

: pkh/sat-asr#   ( x -- )
        1- 1f check# 1+  1f and pkh/sat-lsr# ;

public

: asr   ( -- )   \ extend asr shift to cope with pkh & sat instructions
        op-value @ 0f800030 and 06800010 <>
        if asr exit then   \ if not pkh/sat instruction do normal asr
        00000040 dup op-build
        ['] pkh/sat-asr# '# !
;

instructiond pkhbt   ( -- )   \ arm assembler, pkhbt instruction
        e6800010 , 0ff00030 , ff00100c , f0000fc0 ,

: pkhtb   ( -- )   \ arm assembler, pkhtb instruction
        pkhbt ;

private

: sat#   ( x -- )   \ handle immediate operand for sat instructions
        1f check#  10 lshift 001f0000 op-build  reset-# ;

: sat16#   ( x -- )   \ handle immediate operand for sat16 instructions
        f check#  10 lshift 000f0000 op-build  reset-# ;

public

instructiond# ssat   ( -- )   \ arm assembler, ssat instruction
        e6a00010 , 0fe00030 , ffff000c , ' sat# , f0000fc0 ,

instructiond# usat   ( -- )   \ arm assembler, usat instruction
        e6e00010 , 0fe00030 , ffff000c , ' sat# , f0000fc0 ,

instruction# ssat16   ( -- )   \ arm assembler, ssat16 instruction
        e6a00f30 , 0ff00ff0 , ffff000c , ' sat16# ,

instruction# usat16   ( -- )   \ arm assembler, usat16 instruction
        e6e00f30 , 0ff00ff0 , ffff000c , ' sat16# ,

instruction sel   ( -- )   \ arm assembler, sel instruction
        e6800fb0 , 0ff00ff0 , ff00100c ,

private

\ ----------------------------------------------------------------------------

: ext#   ( x -- x)   \ handle immediate operand for extend instructions
        dup ffffffe7 and if invalid# then
        pkh/sat-lsr#
;

public

: ror   ( -- )   \ extend ror shift to cope with extend instructions
        op-value @ 0f8000f0 and 06800070 <>
        if ror exit then   \ if not extend instruction do normal ror
        ['] ext# '# !
;

instructiond sxtab16   ( -- )   \ arm assembler, extend instruction
        e6800070 , 0ff00070 , ff00100c , f0000f80 ,

instructiond sxtab   ( -- )   \ arm assembler, extend instruction
        e6a00070 , 0ff00070 , ff00100c , f0000f80 ,

instructiond sxtah   ( -- )   \ arm assembler, extend instruction
        e6b00070 , 0ff00070 , ff00100c , f0000f80 ,

instructiond uxtab16   ( -- )   \ arm assembler, extend instruction
        e6c00070 , 0ff00070 , ff00100c , f0000f80 ,

instructiond uxtab   ( -- )   \ arm assembler, extend instruction
        e6e00070 , 0ff00070 , ff00100c , f0000f80 ,

instructiond uxtah   ( -- )   \ arm assembler, extend instruction
        e6f00070 , 0ff00070 , ff00100c , f0000f80 ,

instructiond sxtb16   ( -- )   \ arm assembler, extend instruction
        e68f0070 , 0fff0070 , ffff000c , f0000f80 ,

instructiond sxtb   ( -- )   \ arm assembler, extend instruction
        e6af0070 , 0fff0070 , ffff000c , f0000f80 ,

instructiond sxth   ( -- )   \ arm assembler, extend instruction
        e6bf0070 , 0fff0070 , ffff000c , f0000f80 ,

instructiond uxtb16   ( -- )   \ arm assembler, extend instruction
        e6cf0070 , 0fff0070 , ffff000c , f0000f80 ,

instructiond uxtb   ( -- )   \ arm assembler, extend instruction
        e6ef0070 , 0fff0070 , ffff000c , f0000f80 ,

instructiond uxth   ( -- )   \ arm assembler, extend instruction
        e6ff0070 , 0fff0070 , ffff000c , f0000f80 ,

instruction rev   ( -- )   \ arm assembler, reverse instruction
        e6bf0f30 , 0fff0ff0 , ffff000c ,

instruction rev16   ( -- )   \ arm assembler, reverse instruction
        e6bf0fb0 , 0fff0ff0 , ffff000c ,

instruction revsh   ( -- )   \ arm assembler, reverse instruction
        e6ff0fb0 , 0fff0ff0 , ffff000c ,

private

\ ----------------------------------------------------------------------------

public

instruction smuad   ( -- )   \ arm assembler, multiply instruction
        e700f010 , 0ff0f0f0 , ff080010 ,

instruction smuadx   ( -- )   \ arm assembler, multiply instruction
        e700f030 , 0ff0f0f0 , ff080010 ,

instruction smusd   ( -- )   \ arm assembler, multiply instruction
        e700f050 , 0ff0f0f0 , ff080010 ,

instruction smusdx   ( -- )   \ arm assembler, multiply instruction
        e700f070 , 0ff0f0f0 , ff080010 ,

instruction smmul   ( -- )   \ arm assembler, multiply instruction
        e750f010 , 0ff0f0f0 , ff080010 ,

instruction smmulr   ( -- )   \ arm assembler, multiply instruction
        e750f030 , 0ff0f0f0 , ff080010 ,

instruction smlad   ( -- )   \ arm assembler, multiply instruction
        e7000010 , 0ff000f0 , 0c080010 ,

instruction smladx   ( -- )   \ arm assembler, multiply instruction
        e7000030 , 0ff000f0 , 0c080010 ,

instruction smlsd   ( -- )   \ arm assembler, multiply instruction
        e7000050 , 0ff000f0 , 0c080010 ,

instruction smlsdx   ( -- )   \ arm assembler, multiply instruction
        e7000070 , 0ff000f0 , 0c080010 ,

instruction smlald   ( -- )   \ arm assembler, multiply instruction
        e7400010 , 0ff000f0 , 0800100c ,

instruction smlaldx   ( -- )   \ arm assembler, multiply instruction
        e7400030 , 0ff000f0 , 0800100c ,

instruction smlsld   ( -- )   \ arm assembler, multiply instruction
        e7400050 , 0ff000f0 , 0800100c ,

instruction smlsldx   ( -- )   \ arm assembler, multiply instruction
        e7400070 , 0ff000f0 , 0800100c ,

instruction smmla   ( -- )   \ arm assembler, multiply instruction
        e7500010 , 0ff000f0 , 0c080010 ,

instruction smmlar   ( -- )   \ arm assembler, multiply instruction
        e7500030 , 0ff000f0 , 0c080010 ,

instruction smmls   ( -- )   \ arm assembler, multiply instruction
        e75000d0 , 0ff000f0 , 0c080010 ,

instruction smmlsr   ( -- )   \ arm assembler, multiply instruction
        e75000f0 , 0ff000f0 , 0c080010 ,

private

\ ----------------------------------------------------------------------------

public

instruction usad8   ( -- )   \ arm assembler, usad instruction
        e780f010 , 0ff0f0f0 , ff080010 ,

instruction usada8   ( -- )   \ arm assembler, usad instruction
        e7800010 , 0ff000f0 , 0c080010 ,

private

\ ----------------------------------------------------------------------------

previous previous previous definitions

also assembler definitions

: next  
  ldr r11 [ r12 ] 4 #
  ldr pc [ r11 ] ;

also forth definitions

: code  ( | name -- )
  create  here dup 1 cells - ! ( cfa → paramfield )
  also assembler  here code-begin ;

: end-code  code-end  previous ;

previous previous
decimal

