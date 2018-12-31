
dbg[i]  :: [34;49m...[34;49m : 040.002 : Root :> [33;40mC[34;49m <: 0x00007ffff7fa0dc8 :> [34;49m[34;49m[33;40mC[34;49m[34;49m [34;49m 
Debugger :: Starting AutoMode : automatically repeating key :: 'e' ...
dbg[i]  :: [34;49m...[34;49m : 040.002 : Root :> [33;40mC[34;49m <: 0x00007ffff7fa0dc8 :> [34;49m[34;49m[33;40mC[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 041.009 : Namespaces :> [33;40mCompiler[34;49m <: 0x00007ffff7fa6980 :> [34;49m[34;49m[33;40mCompiler[34;49m[34;49m Compiling C Asm [34;49m 
dbg[i]  :: [34;49m...[34;49m : 041.019 : Compiler :> [33;40mCompiling[34;49m <: 0x00007ffff7289c28 :> [34;49mCompiler [34;49m[33;40mCompiling[34;49m[34;49m C Asm [34;49m 
dbg[i]  :: [34;49m...[34;49m : 041.021 : Root :> [33;40mC[34;49m <: 0x00007ffff7fa0dc8 :> [34;49mCompiler Compiling [34;49m[33;40mC[34;49m[34;49m Asm [34;49m 
dbg[i]  :: [34;49m...[34;49m : 041.025 : Root :> [33;40mAsm[34;49m <: 0x00007ffff7299730 :> [34;49mCompiler Compiling C [34;49m[33;40mAsm[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 042.002 : Interpreter :> [33;40m:[34;49m <: 0x00007ffff72952f0 :> [34;49m[34;49m[33;40m:[34;49m[34;49m :asm compileModeOn sourceCodeInit token create begin ' {| find compileWord source[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 42.7[32;49m
0x7ffff72fd082    e900000000              jmp 0x7ffff72fd087         	< C compiler code >        [34;49m
[34;49m ..                                     : [34;49m[33;40m:asm[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd087    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd08b    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd08f    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 42.7 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff74b5268[34;49m.
dbg[c]  :: [34;49m...[34;49m : 042.021 : Interpreter :> [33;40mcompileModeOn[34;49m <: cprimitive :> [34;49m: :asm [34;49m[33;40mcompileModeOn[34;49m[34;49m sourceCodeInit token create begin ' {| find compileWord so[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompileModeOn[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 42.21
[34;49m ..                                : :asm [34;49m[33;40mcompileModeOn[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd096    49b8e6af5b5555550000    mov r8, 0x5555555bafe6                                 [34;49m[32;49m
0x7ffff72fd0a0    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd0aa    49ffd1                  call r9                    	< Interpreter.[39;49mcompileModeOn[34;49m : 0x00005555555bafe6 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 042.036 : Compiler :> [33;40msourceCodeInit[34;49m <: cprimitive :> [34;49m: :asm compileModeOn [34;49m[33;40msourceCodeInit[34;49m[34;49m token create begin ' {| find compileWord sour[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msourceCodeInit[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 42.36
[34;49m ..                  : :asm compileModeOn [34;49m[33;40msourceCodeInit[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd0ad    49b89c245a5555550000    mov r8, 0x5555555a249c                                 [34;49m[32;49m
0x7ffff72fd0b7    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd0c1    49ffd1                  call r9                    	< Compiler.[39;49msourceCodeInit[34;49m : 0x00005555555a249c >[34;49m
dbg[c]  :: [34;49m...[34;49m : 042.042 : Compiler :> [33;40mtoken[34;49m <: cprimitive :> [34;49m: :asm compileModeOn sourceCodeInit [34;49m[33;40mtoken[34;49m[34;49m create begin ' {| find compileWord sourceCodeOn [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mtoken[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 42.42
[34;49m ..   : :asm compileModeOn sourceCodeInit [34;49m[33;40mtoken[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd0c4    49b8b98d5b5555550000    mov r8, 0x5555555b8db9                                 [34;49m[32;49m
0x7ffff72fd0ce    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd0d8    49ffd1                  call r9                    	< Compiler.[39;49mtoken[34;49m : 0x00005555555b8db9 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 042.049 : Word :> [33;40mcreate[34;49m <: cprimitive :> [34;49m: :asm compileModeOn sourceCodeInit token [34;49m[33;40mcreate[34;49m[34;49m begin ' {| find compileWord sourceCodeOn ; i[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcreate[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 42.49
[34;49m: :asm compileModeOn sourceCodeInit token [34;49m[33;40mcreate[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd0db    49b8c2b35b5555550000    mov r8, 0x5555555bb3c2                                 [34;49m[32;49m
0x7ffff72fd0e5    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd0ef    49ffd1                  call r9                    	< Word.[39;49mcreate[34;49m : 0x00005555555bb3c2 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 042.055 : Compiler :> [33;40mbegin[34;49m <: cprimitive :> [34;49mcompileModeOn sourceCodeInit token create [34;49m[33;40mbegin[34;49m[34;49m ' {| find compileWord sourceCodeOn ; immed[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mbegin[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 42.55
[34;49m .. ileModeOn sourceCodeInit token create [34;49m[33;40mbegin[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd0f2    49b894de575555550000    mov r8, 0x55555557de94                                 [34;49m[32;49m
0x7ffff72fd0fc    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd106    49ffd1                  call r9                    	< Compiler.[39;49mbegin[34;49m : 0x000055555557de94 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 042.056 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49mileModeOn sourceCodeInit token create begin [34;49m[33;40m'[34;49m[34;49m {| find compileWord sourceCodeOn ; immediate[34;49m 
Stack : word at namespaces/compiler/x64.cft : 42.60 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7466bce[34;49m.
dbg[c]  :: [34;49m...[34;49m : 042.065 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49modeOn sourceCodeInit token create begin ' {| [34;49m[33;40mfind[34;49m[34;49m compileWord sourceCodeOn ; immediate [34;49m 
Stack : word at namespaces/compiler/x64.cft : 42.65 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff7284a38[34;49m.
dbg[c]  :: [34;49m...[34;49m : 042.077 : Compiler :> [33;40mcompileWord[34;49m <: cprimitive :> [34;49mOn sourceCodeInit token create begin ' {| find [34;49m[33;40mcompileWord[34;49m[34;49m sourceCodeOn ; immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompileWord[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 42.77
[34;49m .. CodeInit token create begin ' {| find [34;49m[33;40mcompileWord[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd109    49b87baf5b5555550000    mov r8, 0x5555555baf7b                                 [34;49m[32;49m
0x7ffff72fd113    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd11d    49ffd1                  call r9                    	< Interpreter.[39;49mcompileModeOff[34;49m : 0x00005555555baf7b >[34;49m
Stack : word at namespaces/compiler/x64.cft : 42.77 :> [39;49mcompileWord[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff74b5268[34;49m.
dbg[c]  :: [34;49m...[34;49m : 042.090 : Compiler :> [33;40msourceCodeOn[34;49m <: cprimitive :> [34;49mn sourceCodeInit token create begin ' {| find compileWord [34;49m[33;40msourceCodeOn[34;49m[34;49m ; immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msourceCodeOn[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 42.90
[34;49m .. en create begin ' {| find compileWord [34;49m[33;40msourceCodeOn[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd120    49b8f2245a5555550000    mov r8, 0x5555555a24f2                                 [34;49m[32;49m
0x7ffff72fd12a    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd134    49ffd1                  call r9                    	< Compiler.[39;49msourceCodeOn[34;49m : 0x00005555555a24f2 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 042.092 : Interpreter :> [33;40m;[34;49m <: 0x00007ffff7294bd0 :> [34;49mn sourceCodeInit token create begin ' {| find compileWord sourceCodeOn [34;49m[33;40m;[34;49m[34;49m immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 42.92
[34;49m .. in ' {| find compileWord sourceCodeOn [34;49m[33;40m;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd137    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 42.92 :> [39;49m;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 042.102 : Compiler :> [33;40mimmediate[34;49m <: cprimitive :> [34;49mdeOn sourceCodeInit token create begin ' {| find compileWord sourceCodeOn ; [34;49m[33;40mimmediate[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 043.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m: :asm compileModeOn sourceCodeInit token create begin ' {| find compileWord ; immediate[34;49m 
dbg[i]  :: [34;49m...[34;49m : 044.002 : Interpreter :> [33;40m:[34;49m <: 0x00007ffff72952f0 :> [34;49m[34;49m[33;40m:[34;49m[34;49m asm; semi ' {| find compileWord ; immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 44.7[32;49m
0x7ffff72fd138    e900000000              jmp 0x7ffff72fd13d         	< C compiler code >        [34;49m
[34;49m ..                                     : [34;49m[33;40masm;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd13d    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd141    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd145    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 44.7 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff74b5430[34;49m.
dbg[c]  :: [34;49m...[34;49m : 044.012 : Interpreter :> [33;40msemi[34;49m <: 0x00007ffff7294a08 :> [34;49m: asm; [34;49m[33;40msemi[34;49m[34;49m ' {| find compileWord ; immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msemi[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 44.12
[34;49m ..                                : asm; [34;49m[33;40msemi[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd14c    49b946372ff7ff7f0000    mov r9, 0x7ffff72f3746                                 [34;49m[32;49m
0x7ffff72fd156    49ffd1                  call r9                    	< Interpreter.[39;49m;[34;49m : 0x00007ffff72f3746 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 044.013 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m: asm; semi [34;49m[33;40m'[34;49m[34;49m {| find compileWord ; immediate [34;49m 
Stack : word at namespaces/compiler/x64.cft : 44.17 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7466c0c[34;49m.
dbg[c]  :: [34;49m...[34;49m : 044.022 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m: asm; semi ' {| [34;49m[33;40mfind[34;49m[34;49m compileWord ; immediate [34;49m 
Stack : word at namespaces/compiler/x64.cft : 44.22 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff7284a38[34;49m.
dbg[c]  :: [34;49m...[34;49m : 044.034 : Compiler :> [33;40mcompileWord[34;49m <: cprimitive :> [34;49m: asm; semi ' {| find [34;49m[33;40mcompileWord[34;49m[34;49m ; immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompileWord[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 44.34
[34;49m ..                 : asm; semi ' {| find [34;49m[33;40mcompileWord[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd159    49b87baf5b5555550000    mov r8, 0x5555555baf7b                                 [34;49m[32;49m
0x7ffff72fd163    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd16d    49ffd1                  call r9                    	< Interpreter.[39;49mcompileModeOff[34;49m : 0x00005555555baf7b >[34;49m
Stack : word at namespaces/compiler/x64.cft : 44.34 :> [39;49mcompileWord[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff74b5430[34;49m.
dbg[c]  :: [34;49m...[34;49m : 044.036 : Interpreter :> [33;40m;[34;49m <: 0x00007ffff7294bd0 :> [34;49m: asm; semi ' {| find compileWord [34;49m[33;40m;[34;49m[34;49m immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 44.36
[34;49m ..     : asm; semi ' {| find compileWord [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd170    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 44.36 :> [39;49m;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 044.046 : Compiler :> [33;40mimmediate[34;49m <: cprimitive :> [34;49m: asm; semi ' {| find compileWord ; [34;49m[33;40mimmediate[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 045.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m' :asm find winfo //sp [34;49m 
dbg[i]  :: [34;49m...[34;49m : 047.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mcompile1 '1, find alias // we can't use ',' as part of a word.name with C syntax [34;49m 
Stack : word at namespaces/compiler/x64.cft : 47.10 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7466c34[34;49m.
dbg[i]  :: [34;49m...[34;49m : 047.019 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m'compile1 '1, [34;49m[33;40mfind[34;49m[34;49m alias // we can't use ',' as part of a word.name with C syntax [34;49m 
Stack : word at namespaces/compiler/x64.cft : 47.19 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff7fa06a8[34;49m.
dbg[i]  :: [34;49m...[34;49m : 047.025 : Macro :> [33;40malias[34;49m <: cprimitive :> [34;49m'compile1 '1, find [34;49m[33;40malias[34;49m[34;49m // we can't use ',' as part of a word.name with C syntax [34;49m 
Stack : word at namespaces/compiler/x64.cft : 47.25 :> [39;49malias[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 047.027 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m'compile1 '1, find alias [34;49m[33;40m//[34;49m[34;49m we can't use ',' as part of a word.name with C syntax [34;49m 
dbg[i]  :: [34;49m...[34;49m : 048.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mcompile2 '2, find alias [34;49m 
Stack : word at namespaces/compiler/x64.cft : 48.10 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7466c52[34;49m.
dbg[i]  :: [34;49m...[34;49m : 048.019 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m'compile2 '2, [34;49m[33;40mfind[34;49m[34;49m alias [34;49m 
Stack : word at namespaces/compiler/x64.cft : 48.19 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff7fa0870[34;49m.
dbg[i]  :: [34;49m...[34;49m : 048.025 : Macro :> [33;40malias[34;49m <: cprimitive :> [34;49m'compile2 '2, find [34;49m[33;40malias[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 48.25 :> [39;49malias[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 049.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mcompile4 '4, find alias [34;49m 
Stack : word at namespaces/compiler/x64.cft : 49.10 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7466c6d[34;49m.
dbg[i]  :: [34;49m...[34;49m : 049.019 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m'compile4 '4, [34;49m[33;40mfind[34;49m[34;49m alias [34;49m 
Stack : word at namespaces/compiler/x64.cft : 49.19 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff7fa0318[34;49m.
dbg[i]  :: [34;49m...[34;49m : 049.025 : Macro :> [33;40malias[34;49m <: cprimitive :> [34;49m'compile4 '4, find [34;49m[33;40malias[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 49.25 :> [39;49malias[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 050.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mcompile8 '8, find alias [34;49m 
Stack : word at namespaces/compiler/x64.cft : 50.10 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7466c88[34;49m.
dbg[i]  :: [34;49m...[34;49m : 050.019 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m'compile8 '8, [34;49m[33;40mfind[34;49m[34;49m alias [34;49m 
Stack : word at namespaces/compiler/x64.cft : 50.19 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff7fa04e0[34;49m.
dbg[i]  :: [34;49m...[34;49m : 050.025 : Macro :> [33;40malias[34;49m <: cprimitive :> [34;49m'compile8 '8, find [34;49m[33;40malias[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 50.25 :> [39;49malias[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 051.002 : Interpreter :> [33;40m:[34;49m <: 0x00007ffff72952f0 :> [34;49m[34;49m[33;40m:[34;49m[34;49m ;; ' ; find compileWord ' _prefix find compileWord ; immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 51.5[32;49m
0x7ffff72fd171    e900000000              jmp 0x7ffff72fd176         	< C compiler code >        [34;49m
[34;49m ..                                     : [34;49m[33;40m;;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd176    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd17a    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd17e    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 51.5 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff74b5d18[34;49m.
dbg[c]  :: [34;49m...[34;49m : 051.006 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m: ;; [34;49m[33;40m'[34;49m[34;49m ; find compileWord ' _prefix find compileWord ; immediate [34;49m 
Stack : word at namespaces/compiler/x64.cft : 51.9 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7466ca8[34;49m.
dbg[c]  :: [34;49m...[34;49m : 051.014 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m: ;; ' ; [34;49m[33;40mfind[34;49m[34;49m compileWord ' _prefix find compileWord ; immediate [34;49m 
Stack : word at namespaces/compiler/x64.cft : 51.14 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff7294bd0[34;49m.
dbg[c]  :: [34;49m...[34;49m : 051.026 : Compiler :> [33;40mcompileWord[34;49m <: cprimitive :> [34;49m: ;; ' ; find [34;49m[33;40mcompileWord[34;49m[34;49m ' _prefix find compileWord ; immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompileWord[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 51.26
[34;49m ..                         : ;; ' ; find [34;49m[33;40mcompileWord[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd185    49b946372ff7ff7f0000    mov r9, 0x7ffff72f3746                                 [34;49m[32;49m
0x7ffff72fd18f    49ffd1                  call r9                    	< Interpreter.[39;49m;[34;49m : 0x00007ffff72f3746 >[34;49m
Stack : word at namespaces/compiler/x64.cft : 51.26 :> [39;49mcompileWord[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff74b5d18[34;49m.
dbg[c]  :: [34;49m...[34;49m : 051.027 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m: ;; ' ; find compileWord [34;49m[33;40m'[34;49m[34;49m _prefix find compileWord ; immediate [34;49m 
Stack : word at namespaces/compiler/x64.cft : 51.36 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7466cbd[34;49m.
dbg[c]  :: [34;49m...[34;49m : 051.041 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m: ;; ' ; find compileWord ' _prefix [34;49m[33;40mfind[34;49m[34;49m compileWord ; immediate [34;49m 
Stack : word at namespaces/compiler/x64.cft : 51.41 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff7287330[34;49m.
dbg[c]  :: [34;49m...[34;49m : 051.053 : Compiler :> [33;40mcompileWord[34;49m <: cprimitive :> [34;49m: ;; ' ; find compileWord ' _prefix find [34;49m[33;40mcompileWord[34;49m[34;49m ; immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompileWord[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 51.53[32;49m
0x7ffff72fd192    49b885b85b5555550000    mov r8, 0x5555555bb885                                 [34;49m[32;49m
0x7ffff72fd19c    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd1a6    49ffd1                  call r9                    	< Compiler.[39;49mprefix[34;49m : 0x00005555555bb885 >[34;49m
Stack : word at namespaces/compiler/x64.cft : 51.53 :> [39;49mcompileWord[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff74b5d18[34;49m.
dbg[c]  :: [34;49m...[34;49m : 051.055 : Interpreter :> [33;40m;[34;49m <: 0x00007ffff7294bd0 :> [34;49m: ;; ' ; find compileWord ' _prefix find compileWord [34;49m[33;40m;[34;49m[34;49m immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 51.55
[34;49m .. ompileWord ' _prefix find compileWord [34;49m[33;40m;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd1a9    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 51.55 :> [39;49m;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 051.065 : Compiler :> [33;40mimmediate[34;49m <: cprimitive :> [34;49m: ;; ' ; find compileWord ' _prefix find compileWord ; [34;49m[33;40mimmediate[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 052.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m C : ;; ' ;; find compileWord ; immediate [34;49m 
dbg[i]  :: [34;49m...[34;49m : 054.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mX64 namespace [34;49m 
Stack : word at namespaces/compiler/x64.cft : 54.5 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7466cea[34;49m.
dbg[i]  :: [34;49m...[34;49m : 054.015 : Namespace :> [33;40mnamespace[34;49m <: cprimitive :> [34;49m'X64 [34;49m[33;40mnamespace[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 54.15 :> [39;49mnamespace[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 055.004 : Asm :> [33;40mX64[34;49m <: 0x00007ffff74b6438 :> [34;49m[34;49m[33;40mX64[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 056.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mnamespaces/compiler/asmConstants.cft" include [34;49m 
dbg[i]  :: [34;49m...[34;49m : 056.038 : <literal> :> [33;40m"namespaces/compiler/asmConstants.cft"[34;49m <: 0x00007ffff5cf73a0 :> [34;49m[34;49m[33;40m"namespaces/compiler/asmConstants.cft"[34;49m[34;49m include [34;49m 
Stack : word at namespaces/compiler/x64.cft : 56.1 :> [39;49m"namespaces/compiler/asmConstants.cft"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8cbf[34;49m.
Literal :> 0x00007ffff72c8cbf <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 056.047 : System :> [33;40minclude[34;49m <: cprimitive :> [34;49m"namespaces/compiler/asmConstants.cft" [34;49m[33;40minclude[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 1.2 :> [39;49minclude[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
word popped 1 value off the stack.
dbg[i]  :: [34;49mnamespaces/compiler/asmConstants.cft[34;49m : 001.002 : <literal> :> [33;40m5[34;49m <: 0x00007ffff5cf7568 :> [34;49m[34;49m[33;40m5[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 1.2 :> [39;49m5[34;49m <: 1 cell pushed. TOS set to [39;49m0x0000000000000005[34;49m.
Literal :> 0x0000000000000005 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 002.002 : Interpreter :> [33;40m:[34;49m <: 0x00007ffff72952f0 :> [34;49m[34;49m[33;40m:[34;49m[34;49m sp ; //stack pause ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/asmConstants.cft : 2.5[32;49m
0x7ffff72fd1aa    e900000000              jmp 0x7ffff72fd1af         	< C compiler code >        [34;49m
[34;49m ..                                     : [34;49m[33;40msp[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd1af    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd1b3    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd1b7    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/asmConstants.cft : 2.5 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff74b6638[34;49m.
dbg[c]  :: [34;49m...[34;49m : 002.007 : Interpreter :> [33;40m;[34;49m <: 0x00007ffff7294bd0 :> [34;49m: sp [34;49m[33;40m;[34;49m[34;49m //stack pause ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/asmConstants.cft : 2.7
[34;49m ..                                  : sp [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd1be    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/asmConstants.cft : 2.7 :> [39;49m;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 002.009 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m: sp ; [34;49m[33;40m//[34;49m[34;49mstack pause ; [34;49m 
dbg[i]  :: [34;49m...[34;49m : 003.012 : Compiler :> [33;40mc_syntaxOff[34;49m <: cprimitive :> [34;49m[34;49m[33;40mc_syntaxOff[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 004.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mtrue 1 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 4.6 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7466d20[34;49m.
dbg[i]  :: [34;49m...[34;49m : 004.008 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cf7730 :> [34;49m'true [34;49m[33;40m1[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 4.8 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 004.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m'true 1 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 4.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 005.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mfalse 0 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 5.7 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7466d2f[34;49m.
dbg[i]  :: [34;49m...[34;49m : 005.009 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cf78f8 :> [34;49m'false [34;49m[33;40m0[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 5.9 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 005.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m'false 0 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 5.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 006.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mon true const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 6.4 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7466d3f[34;49m.
dbg[i]  :: [34;49m...[34;49m : 006.009 : X64 :> [33;40mtrue[34;49m <: 0x00007ffff74b6800 :> [34;49m'on [34;49m[33;40mtrue[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 6.9 :> [39;49mtrue[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
dbg[i]  :: [34;49m...[34;49m : 006.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m'on true [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 6.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 007.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49moff false const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 7.5 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7466d4f[34;49m.
dbg[i]  :: [34;49m...[34;49m : 007.011 : X64 :> [33;40mfalse[34;49m <: 0x00007ffff74b69c8 :> [34;49m'off [34;49m[33;40mfalse[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 7.11 :> [39;49mfalse[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
dbg[i]  :: [34;49m...[34;49m : 007.017 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m'off false [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 7.17 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 008.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m asm constants [34;49m 
dbg[i]  :: [34;49m...[34;49m : 010.008 : System :> [33;40mdecimal[34;49m <: cprimitive :> [34;49m[34;49m[33;40mdecimal[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 011.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mREG" 3 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 011.005 : <literal> :> [33;40m"REG"[34;49m <: 0x00007ffff5cf7ac0 :> [34;49m[34;49m[33;40m"REG"[34;49m[34;49m 3 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 11.1 :> [39;49m"REG"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8dab[34;49m.
Literal :> 0x00007ffff72c8dab <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 011.008 : <literal> :> [33;40m3[34;49m <: 0x00007ffff5cf7c88 :> [34;49m"REG" [34;49m[33;40m3[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 11.8 :> [39;49m3[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000003[34;49m.
Literal :> 0x0000000000000003 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 011.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"REG" 3 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 11.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 012.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mMEM8" 1 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 012.006 : <literal> :> [33;40m"MEM8"[34;49m <: 0x00007ffff5cf7e50 :> [34;49m[34;49m[33;40m"MEM8"[34;49m[34;49m 1 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 12.1 :> [39;49m"MEM8"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8dd1[34;49m.
Literal :> 0x00007ffff72c8dd1 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 012.009 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cf8018 :> [34;49m"MEM8" [34;49m[33;40m1[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 12.9 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 012.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"MEM8" 1 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 12.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 013.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mMEM32" 2 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 013.007 : <literal> :> [33;40m"MEM32"[34;49m <: 0x00007ffff5cf81e0 :> [34;49m[34;49m[33;40m"MEM32"[34;49m[34;49m 2 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 13.1 :> [39;49m"MEM32"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8dfc[34;49m.
Literal :> 0x00007ffff72c8dfc <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 013.010 : <literal> :> [33;40m2[34;49m <: 0x00007ffff5cf83a8 :> [34;49m"MEM32" [34;49m[33;40m2[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 13.10 :> [39;49m2[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
Literal :> 0x0000000000000002 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 013.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"MEM32" 2 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 13.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 014.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mMEM0" 0 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 014.006 : <literal> :> [33;40m"MEM0"[34;49m <: 0x00007ffff5cf8570 :> [34;49m[34;49m[33;40m"MEM0"[34;49m[34;49m 0 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 14.1 :> [39;49m"MEM0"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8e2a[34;49m.
Literal :> 0x00007ffff72c8e2a <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 014.009 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cf8738 :> [34;49m"MEM0" [34;49m[33;40m0[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 14.9 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 014.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"MEM0" 0 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 14.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 015.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mMEM" MEM0 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 015.005 : <literal> :> [33;40m"MEM"[34;49m <: 0x00007ffff5cf8900 :> [34;49m[34;49m[33;40m"MEM"[34;49m[34;49m MEM0 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 15.1 :> [39;49m"MEM"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8e53[34;49m.
Literal :> 0x00007ffff72c8e53 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 015.011 : X64 :> [33;40mMEM0[34;49m <: 0x00007ffff74b7478 :> [34;49m"MEM" [34;49m[33;40mMEM0[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 15.11 :> [39;49mMEM0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
dbg[i]  :: [34;49m...[34;49m : 015.017 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"MEM" MEM0 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 15.17 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 016.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m registers [34;49m 
dbg[i]  :: [34;49m...[34;49m : 017.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mRAX" 0 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 017.005 : <literal> :> [33;40m"RAX"[34;49m <: 0x00007ffff5cf8ac8 :> [34;49m[34;49m[33;40m"RAX"[34;49m[34;49m 0 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 17.1 :> [39;49m"RAX"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8e79[34;49m.
Literal :> 0x00007ffff72c8e79 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 017.008 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cf8c90 :> [34;49m"RAX" [34;49m[33;40m0[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 17.8 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 017.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"RAX" 0 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 17.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 018.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mRCX" 1 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 018.005 : <literal> :> [33;40m"RCX"[34;49m <: 0x00007ffff5cf8e58 :> [34;49m[34;49m[33;40m"RCX"[34;49m[34;49m 1 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 18.1 :> [39;49m"RCX"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8e9e[34;49m.
Literal :> 0x00007ffff72c8e9e <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 018.008 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cf9020 :> [34;49m"RCX" [34;49m[33;40m1[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 18.8 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 018.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"RCX" 1 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 18.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 019.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mRDX" 2 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 019.005 : <literal> :> [33;40m"RDX"[34;49m <: 0x00007ffff5cf91e8 :> [34;49m[34;49m[33;40m"RDX"[34;49m[34;49m 2 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 19.1 :> [39;49m"RDX"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8ec3[34;49m.
Literal :> 0x00007ffff72c8ec3 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 019.008 : <literal> :> [33;40m2[34;49m <: 0x00007ffff5cf93b0 :> [34;49m"RDX" [34;49m[33;40m2[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 19.8 :> [39;49m2[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
Literal :> 0x0000000000000002 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 019.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"RDX" 2 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 19.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 020.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mRBX" 3 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 020.005 : <literal> :> [33;40m"RBX"[34;49m <: 0x00007ffff5cf9578 :> [34;49m[34;49m[33;40m"RBX"[34;49m[34;49m 3 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 20.1 :> [39;49m"RBX"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8ee8[34;49m.
Literal :> 0x00007ffff72c8ee8 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 020.008 : <literal> :> [33;40m3[34;49m <: 0x00007ffff5cf9740 :> [34;49m"RBX" [34;49m[33;40m3[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 20.8 :> [39;49m3[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000003[34;49m.
Literal :> 0x0000000000000003 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 020.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"RBX" 3 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 20.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 021.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mRSP" 4 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 021.005 : <literal> :> [33;40m"RSP"[34;49m <: 0x00007ffff5cf9908 :> [34;49m[34;49m[33;40m"RSP"[34;49m[34;49m 4 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 21.1 :> [39;49m"RSP"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8f0d[34;49m.
Literal :> 0x00007ffff72c8f0d <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 021.008 : <literal> :> [33;40m4[34;49m <: 0x00007ffff5cf9ad0 :> [34;49m"RSP" [34;49m[33;40m4[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 21.8 :> [39;49m4[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000004[34;49m.
Literal :> 0x0000000000000004 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 021.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"RSP" 4 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 21.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 022.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mRBP" 5 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 022.005 : <literal> :> [33;40m"RBP"[34;49m <: 0x00007ffff5cf9c98 :> [34;49m[34;49m[33;40m"RBP"[34;49m[34;49m 5 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 22.1 :> [39;49m"RBP"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8f32[34;49m.
Literal :> 0x00007ffff72c8f32 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 022.008 : <literal> :> [33;40m5[34;49m <: 0x00007ffff5cf9e60 :> [34;49m"RBP" [34;49m[33;40m5[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 22.8 :> [39;49m5[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000005[34;49m.
Literal :> 0x0000000000000005 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 022.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"RBP" 5 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 22.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS set to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 023.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mRSI" 6 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 023.005 : <literal> :> [33;40m"RSI"[34;49m <: 0x00007ffff5cfa028 :> [34;49m[34;49m[33;40m"RSI"[34;49m[34;49m 6 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 23.1 :> [39;49m"RSI"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8f57[34;49m.
Literal :> 0x00007ffff72c8f57 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 023.008 : <literal> :> [33;40m6[34;49m <: 0x00007ffff5cfa1f0 :> [34;49m"RSI" [34;49m[33;40m6[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 23.8 :> [39;49m6[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000006[34;49m.
Literal :> 0x0000000000000006 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 023.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"RSI" 6 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 23.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 024.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mRDI" 7 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 024.005 : <literal> :> [33;40m"RDI"[34;49m <: 0x00007ffff5cfa3b8 :> [34;49m[34;49m[33;40m"RDI"[34;49m[34;49m 7 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 24.1 :> [39;49m"RDI"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8f7c[34;49m.
Literal :> 0x00007ffff72c8f7c <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 024.008 : <literal> :> [33;40m7[34;49m <: 0x00007ffff5cfa580 :> [34;49m"RDI" [34;49m[33;40m7[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 24.8 :> [39;49m7[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000007[34;49m.
Literal :> 0x0000000000000007 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 024.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"RDI" 7 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 24.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 025.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mR8D" 8 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 025.005 : <literal> :> [33;40m"R8D"[34;49m <: 0x00007ffff5cfa748 :> [34;49m[34;49m[33;40m"R8D"[34;49m[34;49m 8 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 25.1 :> [39;49m"R8D"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8fa1[34;49m.
Literal :> 0x00007ffff72c8fa1 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 025.008 : <literal> :> [33;40m8[34;49m <: 0x00007ffff5cfa910 :> [34;49m"R8D" [34;49m[33;40m8[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 25.8 :> [39;49m8[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000008[34;49m.
Literal :> 0x0000000000000008 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 025.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"R8D" 8 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 25.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 026.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mR9D" 9 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 026.005 : <literal> :> [33;40m"R9D"[34;49m <: 0x00007ffff5cfaad8 :> [34;49m[34;49m[33;40m"R9D"[34;49m[34;49m 9 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 26.1 :> [39;49m"R9D"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8fc6[34;49m.
Literal :> 0x00007ffff72c8fc6 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 026.008 : <literal> :> [33;40m9[34;49m <: 0x00007ffff5cfaca0 :> [34;49m"R9D" [34;49m[33;40m9[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 26.8 :> [39;49m9[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000009[34;49m.
Literal :> 0x0000000000000009 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 026.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"R9D" 9 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 26.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 027.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mR10D" 10 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 027.006 : <literal> :> [33;40m"R10D"[34;49m <: 0x00007ffff5cfae68 :> [34;49m[34;49m[33;40m"R10D"[34;49m[34;49m 10 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 27.1 :> [39;49m"R10D"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8fec[34;49m.
Literal :> 0x00007ffff72c8fec <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 027.010 : <literal> :> [33;40m10[34;49m <: 0x00007ffff5cfb030 :> [34;49m"R10D" [34;49m[33;40m10[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 27.10 :> [39;49m10[34;49m <: 1 cell pushed. TOS changed to [39;49m0x000000000000000a[34;49m.
Literal :> 0x000000000000000a <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 027.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"R10D" 10 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 27.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 028.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mR11D" 11 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 028.006 : <literal> :> [33;40m"R11D"[34;49m <: 0x00007ffff5cfb1f8 :> [34;49m[34;49m[33;40m"R11D"[34;49m[34;49m 11 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 28.1 :> [39;49m"R11D"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9018[34;49m.
Literal :> 0x00007ffff72c9018 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 028.010 : <literal> :> [33;40m11[34;49m <: 0x00007ffff5cfb3c0 :> [34;49m"R11D" [34;49m[33;40m11[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 28.10 :> [39;49m11[34;49m <: 1 cell pushed. TOS changed to [39;49m0x000000000000000b[34;49m.
Literal :> 0x000000000000000b <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 028.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"R11D" 11 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 28.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 029.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mR12D" 12 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 029.006 : <literal> :> [33;40m"R12D"[34;49m <: 0x00007ffff5cfb588 :> [34;49m[34;49m[33;40m"R12D"[34;49m[34;49m 12 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 29.1 :> [39;49m"R12D"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9044[34;49m.
Literal :> 0x00007ffff72c9044 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 029.010 : <literal> :> [33;40m12[34;49m <: 0x00007ffff5cfb750 :> [34;49m"R12D" [34;49m[33;40m12[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 29.10 :> [39;49m12[34;49m <: 1 cell pushed. TOS changed to [39;49m0x000000000000000c[34;49m.
Literal :> 0x000000000000000c <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 029.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"R12D" 12 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 29.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 030.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mR13D" 13 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 030.006 : <literal> :> [33;40m"R13D"[34;49m <: 0x00007ffff5cfb918 :> [34;49m[34;49m[33;40m"R13D"[34;49m[34;49m 13 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 30.1 :> [39;49m"R13D"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9070[34;49m.
Literal :> 0x00007ffff72c9070 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 030.010 : <literal> :> [33;40m13[34;49m <: 0x00007ffff5cfbae0 :> [34;49m"R13D" [34;49m[33;40m13[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 30.10 :> [39;49m13[34;49m <: 1 cell pushed. TOS changed to [39;49m0x000000000000000d[34;49m.
Literal :> 0x000000000000000d <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 030.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"R13D" 13 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 30.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 031.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mR14D" 14 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 031.006 : <literal> :> [33;40m"R14D"[34;49m <: 0x00007ffff5cfbca8 :> [34;49m[34;49m[33;40m"R14D"[34;49m[34;49m 14 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 31.1 :> [39;49m"R14D"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c909c[34;49m.
Literal :> 0x00007ffff72c909c <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 031.010 : <literal> :> [33;40m14[34;49m <: 0x00007ffff5cfbe70 :> [34;49m"R14D" [34;49m[33;40m14[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 31.10 :> [39;49m14[34;49m <: 1 cell pushed. TOS changed to [39;49m0x000000000000000e[34;49m.
Literal :> 0x000000000000000e <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 031.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"R14D" 14 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 31.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 032.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mR15D" 15 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 032.006 : <literal> :> [33;40m"R15D"[34;49m <: 0x00007ffff5cfc038 :> [34;49m[34;49m[33;40m"R15D"[34;49m[34;49m 15 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 32.1 :> [39;49m"R15D"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c90c8[34;49m.
Literal :> 0x00007ffff72c90c8 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 032.010 : <literal> :> [33;40m15[34;49m <: 0x00007ffff5cfc200 :> [34;49m"R15D" [34;49m[33;40m15[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 32.10 :> [39;49m15[34;49m <: 1 cell pushed. TOS changed to [39;49m0x000000000000000f[34;49m.
Literal :> 0x000000000000000f <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 032.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"R15D" 15 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 32.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 034.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mDSP" R14D const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 034.005 : <literal> :> [33;40m"DSP"[34;49m <: 0x00007ffff5cfc3c8 :> [34;49m[34;49m[33;40m"DSP"[34;49m[34;49m R14D const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 34.1 :> [39;49m"DSP"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c90f3[34;49m.
Literal :> 0x00007ffff72c90f3 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 034.011 : X64 :> [33;40mR14D[34;49m <: 0x00007ffff5c7ae50 :> [34;49m"DSP" [34;49m[33;40mR14D[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 34.11 :> [39;49mR14D[34;49m <: 1 cell pushed. TOS changed to [39;49m0x000000000000000e[34;49m.
dbg[i]  :: [34;49m...[34;49m : 034.017 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"DSP" R14D [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 34.17 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 035.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mFP" R15D const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 035.004 : <literal> :> [33;40m"FP"[34;49m <: 0x00007ffff5cfc590 :> [34;49m[34;49m[33;40m"FP"[34;49m[34;49m R15D const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 35.1 :> [39;49m"FP"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9118[34;49m.
Literal :> 0x00007ffff72c9118 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 035.010 : X64 :> [33;40mR15D[34;49m <: 0x00007ffff5c7b018 :> [34;49m"FP" [34;49m[33;40mR15D[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 35.10 :> [39;49mR15D[34;49m <: 1 cell pushed. TOS changed to [39;49m0x000000000000000f[34;49m.
dbg[i]  :: [34;49m...[34;49m : 035.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"FP" R15D [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 35.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 037.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m ttt codes [34;49m 
dbg[i]  :: [34;49m...[34;49m : 038.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mBELOW" 1 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 038.007 : <literal> :> [33;40m"BELOW"[34;49m <: 0x00007ffff5cfc758 :> [34;49m[34;49m[33;40m"BELOW"[34;49m[34;49m 1 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 38.1 :> [39;49m"BELOW"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c913c[34;49m.
Literal :> 0x00007ffff72c913c <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 038.010 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cfc920 :> [34;49m"BELOW" [34;49m[33;40m1[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 38.10 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 038.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"BELOW" 1 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 38.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 039.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mEQUAL" 2 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 039.007 : <literal> :> [33;40m"EQUAL"[34;49m <: 0x00007ffff5cfcae8 :> [34;49m[34;49m[33;40m"EQUAL"[34;49m[34;49m 2 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 39.1 :> [39;49m"EQUAL"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c916b[34;49m.
Literal :> 0x00007ffff72c916b <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 039.010 : <literal> :> [33;40m2[34;49m <: 0x00007ffff5cfccb0 :> [34;49m"EQUAL" [34;49m[33;40m2[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 39.10 :> [39;49m2[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
Literal :> 0x0000000000000002 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 039.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"EQUAL" 2 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 39.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 040.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mEQ" 2 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 040.004 : <literal> :> [33;40m"EQ"[34;49m <: 0x00007ffff5cfce78 :> [34;49m[34;49m[33;40m"EQ"[34;49m[34;49m 2 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 40.1 :> [39;49m"EQ"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9197[34;49m.
Literal :> 0x00007ffff72c9197 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 040.007 : <literal> :> [33;40m2[34;49m <: 0x00007ffff5cfd040 :> [34;49m"EQ" [34;49m[33;40m2[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 40.7 :> [39;49m2[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
Literal :> 0x0000000000000002 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 040.013 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"EQ" 2 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 40.13 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 041.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mZERO" 2 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 041.006 : <literal> :> [33;40m"ZERO"[34;49m <: 0x00007ffff5cfd208 :> [34;49m[34;49m[33;40m"ZERO"[34;49m[34;49m 2 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 41.1 :> [39;49m"ZERO"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c91b9[34;49m.
Literal :> 0x00007ffff72c91b9 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 041.009 : <literal> :> [33;40m2[34;49m <: 0x00007ffff5cfd3d0 :> [34;49m"ZERO" [34;49m[33;40m2[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 41.9 :> [39;49m2[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
Literal :> 0x0000000000000002 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 041.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"ZERO" 2 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 41.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 042.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mZ" 2 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 042.003 : <literal> :> [33;40m"Z"[34;49m <: 0x00007ffff5cfd598 :> [34;49m[34;49m[33;40m"Z"[34;49m[34;49m 2 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 42.1 :> [39;49m"Z"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c91e0[34;49m.
Literal :> 0x00007ffff72c91e0 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 042.006 : <literal> :> [33;40m2[34;49m <: 0x00007ffff5cfd760 :> [34;49m"Z" [34;49m[33;40m2[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 42.6 :> [39;49m2[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
Literal :> 0x0000000000000002 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 042.012 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"Z" 2 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 42.12 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 043.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mBE" 3 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 043.004 : <literal> :> [33;40m"BE"[34;49m <: 0x00007ffff5cfd928 :> [34;49m[34;49m[33;40m"BE"[34;49m[34;49m 3 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 43.1 :> [39;49m"BE"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c91fc[34;49m.
Literal :> 0x00007ffff72c91fc <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 043.007 : <literal> :> [33;40m3[34;49m <: 0x00007ffff5cfdaf0 :> [34;49m"BE" [34;49m[33;40m3[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 43.7 :> [39;49m3[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000003[34;49m.
Literal :> 0x0000000000000003 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 043.013 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"BE" 3 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 43.13 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 044.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mNA" 3 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 044.004 : <literal> :> [33;40m"NA"[34;49m <: 0x00007ffff5cfdcb8 :> [34;49m[34;49m[33;40m"NA"[34;49m[34;49m 3 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 44.1 :> [39;49m"NA"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c921c[34;49m.
Literal :> 0x00007ffff72c921c <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 044.007 : <literal> :> [33;40m3[34;49m <: 0x00007ffff5cfde80 :> [34;49m"NA" [34;49m[33;40m3[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 44.7 :> [39;49m3[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000003[34;49m.
Literal :> 0x0000000000000003 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 044.013 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"NA" 3 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 44.13 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 045.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mLESS" 6 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 045.006 : <literal> :> [33;40m"LESS"[34;49m <: 0x00007ffff5cfe048 :> [34;49m[34;49m[33;40m"LESS"[34;49m[34;49m 6 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 45.1 :> [39;49m"LESS"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c923e[34;49m.
Literal :> 0x00007ffff72c923e <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 045.009 : <literal> :> [33;40m6[34;49m <: 0x00007ffff5cfe210 :> [34;49m"LESS" [34;49m[33;40m6[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 45.9 :> [39;49m6[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000006[34;49m.
Literal :> 0x0000000000000006 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 045.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"LESS" 6 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 45.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 046.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mLE" 7 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 046.004 : <literal> :> [33;40m"LE"[34;49m <: 0x00007ffff5cfe3d8 :> [34;49m[34;49m[33;40m"LE"[34;49m[34;49m 7 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 46.1 :> [39;49m"LE"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9266[34;49m.
Literal :> 0x00007ffff72c9266 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 046.007 : <literal> :> [33;40m7[34;49m <: 0x00007ffff5cfe5a0 :> [34;49m"LE" [34;49m[33;40m7[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 46.7 :> [39;49m7[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000007[34;49m.
Literal :> 0x0000000000000007 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 046.013 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"LE" 7 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 46.13 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 047.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mNG" 7 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 047.004 : <literal> :> [33;40m"NG"[34;49m <: 0x00007ffff5cfe768 :> [34;49m[34;49m[33;40m"NG"[34;49m[34;49m 7 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 47.1 :> [39;49m"NG"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9286[34;49m.
Literal :> 0x00007ffff72c9286 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 047.007 : <literal> :> [33;40m7[34;49m <: 0x00007ffff5cfe930 :> [34;49m"NG" [34;49m[33;40m7[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 47.7 :> [39;49m7[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000007[34;49m.
Literal :> 0x0000000000000007 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 047.013 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"NG" 7 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 47.13 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 049.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mADD" 0 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 049.005 : <literal> :> [33;40m"ADD"[34;49m <: 0x00007ffff5cfeaf8 :> [34;49m[34;49m[33;40m"ADD"[34;49m[34;49m 0 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 49.1 :> [39;49m"ADD"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c92a7[34;49m.
Literal :> 0x00007ffff72c92a7 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 049.008 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cfecc0 :> [34;49m"ADD" [34;49m[33;40m0[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 49.8 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 049.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"ADD" 0 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 49.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 050.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mSUB" 5 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 050.005 : <literal> :> [33;40m"SUB"[34;49m <: 0x00007ffff5cfee88 :> [34;49m[34;49m[33;40m"SUB"[34;49m[34;49m 5 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 50.1 :> [39;49m"SUB"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c92cc[34;49m.
Literal :> 0x00007ffff72c92cc <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 050.008 : <literal> :> [33;40m5[34;49m <: 0x00007ffff5cff050 :> [34;49m"SUB" [34;49m[33;40m5[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 50.8 :> [39;49m5[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000005[34;49m.
Literal :> 0x0000000000000005 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 050.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"SUB" 5 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 50.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS set to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 051.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mCMP" 7 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 051.005 : <literal> :> [33;40m"CMP"[34;49m <: 0x00007ffff5cff218 :> [34;49m[34;49m[33;40m"CMP"[34;49m[34;49m 7 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 51.1 :> [39;49m"CMP"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c92f1[34;49m.
Literal :> 0x00007ffff72c92f1 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 051.008 : <literal> :> [33;40m7[34;49m <: 0x00007ffff5cff3e0 :> [34;49m"CMP" [34;49m[33;40m7[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 51.8 :> [39;49m7[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000007[34;49m.
Literal :> 0x0000000000000007 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 051.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"CMP" 7 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 51.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 052.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mCALL" 2 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 052.006 : <literal> :> [33;40m"CALL"[34;49m <: 0x00007ffff5cff5a8 :> [34;49m[34;49m[33;40m"CALL"[34;49m[34;49m 2 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 52.1 :> [39;49m"CALL"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9317[34;49m.
Literal :> 0x00007ffff72c9317 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 052.009 : <literal> :> [33;40m2[34;49m <: 0x00007ffff5cff770 :> [34;49m"CALL" [34;49m[33;40m2[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 52.9 :> [39;49m2[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
Literal :> 0x0000000000000002 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 052.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"CALL" 2 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 52.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 053.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mBYTE" 1 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 053.006 : <literal> :> [33;40m"BYTE"[34;49m <: 0x00007ffff5cff938 :> [34;49m[34;49m[33;40m"BYTE"[34;49m[34;49m 1 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 53.1 :> [39;49m"BYTE"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9341[34;49m.
Literal :> 0x00007ffff72c9341 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 053.009 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cffb00 :> [34;49m"BYTE" [34;49m[33;40m1[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 53.9 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 053.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"BYTE" 1 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 53.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 054.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mCELL" 8 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 054.006 : <literal> :> [33;40m"CELL"[34;49m <: 0x00007ffff5cffcc8 :> [34;49m[34;49m[33;40m"CELL"[34;49m[34;49m 8 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 54.1 :> [39;49m"CELL"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c936b[34;49m.
Literal :> 0x00007ffff72c936b <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 054.009 : <literal> :> [33;40m8[34;49m <: 0x00007ffff5cffe90 :> [34;49m"CELL" [34;49m[33;40m8[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 54.9 :> [39;49m8[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000008[34;49m.
Literal :> 0x0000000000000008 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 054.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"CELL" 8 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 54.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 055.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mN" 1 const // used with JCC n/ttt notation [34;49m 
dbg[i]  :: [34;49m...[34;49m : 055.003 : <literal> :> [33;40m"N"[34;49m <: 0x00007ffff5d00058 :> [34;49m[34;49m[33;40m"N"[34;49m[34;49m 1 const // used with JCC n/ttt notation [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 55.1 :> [39;49m"N"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9392[34;49m.
Literal :> 0x00007ffff72c9392 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 055.006 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5d00220 :> [34;49m"N" [34;49m[33;40m1[34;49m[34;49m const // used with JCC n/ttt notation [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 55.6 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 055.012 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"N" 1 [34;49m[33;40mconst[34;49m[34;49m // used with JCC n/ttt notation [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 55.12 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 055.014 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m"N" 1 const [34;49m[33;40m//[34;49m[34;49m used with JCC n/ttt notation [34;49m 
dbg[i]  :: [34;49m...[34;49m : 060.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mINC 0 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 60.5 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7466f20[34;49m.
dbg[i]  :: [34;49m...[34;49m : 060.007 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5d003e8 :> [34;49m'INC [34;49m[33;40m0[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 60.7 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 060.013 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m'INC 0 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 60.13 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 061.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mDEC 1 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 61.5 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7466f2e[34;49m.
dbg[i]  :: [34;49m...[34;49m : 061.007 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5d005b0 :> [34;49m'DEC [34;49m[33;40m1[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 61.7 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 061.013 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m'DEC 1 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 61.13 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 062.003 : X64 :> [33;40msp[34;49m <: 0x00007ffff74b6638 :> [34;49m[34;49m[33;40msp[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 063.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif 1 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 063.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m 1 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 063.006 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5d00778 :> [34;49m#if [34;49m[33;40m1[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 63.6 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 064.011 : Compiler :> [33;40mc_syntaxOn[34;49m <: cprimitive :> [34;49m[34;49m[33;40mc_syntaxOn[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 065.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine REX_B           ( 1 << 0 ) // 2 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 065.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m REX_B           ( 1 << 0 ) // 2 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 065.025 : C :> [33;40m([34;49m <: cprimitive :> [34;49m#define REX_B           [34;49m[33;40m([34;49m[34;49m 1 << 0 ) // 2 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 065.028 : <literal> :> [33;40m1[34;49m <: 0x00007ffff737d03e :> [34;49m#define REX_B           ( [34;49m[33;40m1[34;49m[34;49m << 0 ) // 2 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 65.28[32;49m
0x7ffff72fd1d3    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd1dd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd1e1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 065.031 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define REX_B           ( 1 [34;49m[33;40m<<[34;49m[34;49m 0 ) // 2 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 065.033 : <literal> :> [33;40m0[34;49m <: 0x00007ffff737d239 :> [34;49m#define REX_B           ( 1 << [34;49m[33;40m0[34;49m[34;49m ) // 2 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 65.33[32;49m
0x7ffff72fd1e4    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fd1ee    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd1f2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 065.033 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define REX_B           ( 1 [34;49m[33;40m<<[34;49m[34;49m 0 ) // 2 [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/asmConstants.cft : 65.33[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737d239	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff737d03e	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Bits.<< :: type expected : Integer  :: type recorded : Integer  : namespaces/compiler/asmConstants.cft : 65.33
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<<[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 65.33[32;49m
0x7ffff72fd1d3    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd1dd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd1e1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 065.034 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m#define REX_B           ( 1 << 0 [34;49m[33;40m)[34;49m[34;49m // 2 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 065.037 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m#define REX_B           ( 1 << 0 ) [34;49m[33;40m//[34;49m[34;49m 2 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 066.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine MODRM_B         ( 1 << 1 ) // 2 backwards compatibility [34;49m 
dbg[i]  :: [34;49m...[34;49m : 066.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m MODRM_B         ( 1 << 1 ) // 2 backwards compatibility [34;49m 
dbg[c]  :: [34;49m...[34;49m : 066.025 : C :> [33;40m([34;49m <: cprimitive :> [34;49m#define MODRM_B         [34;49m[33;40m([34;49m[34;49m 1 << 1 ) // 2 backwards compatibility [34;49m 
dbg[c]  :: [34;49m...[34;49m : 066.028 : <literal> :> [33;40m1[34;49m <: 0x00007ffff737d434 :> [34;49m#define MODRM_B         ( [34;49m[33;40m1[34;49m[34;49m << 1 ) // 2 backwards compatibility [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 66.28
[34;49m ..                                    // [34;49m[33;40m1[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd1f9    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd203    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd207    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 066.031 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define MODRM_B         ( 1 [34;49m[33;40m<<[34;49m[34;49m 1 ) // 2 backwards compatibility [34;49m 
dbg[c]  :: [34;49m...[34;49m : 066.033 : <literal> :> [33;40m1[34;49m <: 0x00007ffff737d62f :> [34;49m#define MODRM_B         ( 1 << [34;49m[33;40m1[34;49m[34;49m ) // 2 backwards compatibility [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 66.33
[34;49m ..                                    // [34;49m[33;40m1[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd20a    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd214    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd218    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 066.033 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define MODRM_B         ( 1 [34;49m[33;40m<<[34;49m[34;49m 1 ) // 2 backwards compatibility [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/asmConstants.cft : 66.33[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737d62f	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff737d434	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Bits.<< :: type expected : Integer  :: type recorded : Integer  : namespaces/compiler/asmConstants.cft : 66.33
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<<[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 66.33
[34;49m ..                                    // [34;49m[33;40m<<[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd1f9    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fd203    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd207    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 066.034 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m#define MODRM_B         ( 1 << 1 [34;49m[33;40m)[34;49m[34;49m // 2 backwards compatibility [34;49m 
dbg[c]  :: [34;49m...[34;49m : 066.037 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m#define MODRM_B         ( 1 << 1 ) [34;49m[33;40m//[34;49m[34;49m 2 backwards compatibility [34;49m 
dbg[i]  :: [34;49m...[34;49m : 067.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine SIB_B           ( 1 << 2 ) // 4 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 067.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m SIB_B           ( 1 << 2 ) // 4 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 067.025 : C :> [33;40m([34;49m <: cprimitive :> [34;49m#define SIB_B           [34;49m[33;40m([34;49m[34;49m 1 << 2 ) // 4 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 067.028 : <literal> :> [33;40m1[34;49m <: 0x00007ffff737d82a :> [34;49m#define SIB_B           ( [34;49m[33;40m1[34;49m[34;49m << 2 ) // 4 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 67.28
[34;49m ..                                    // [34;49m[33;40m1[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd21f    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd229    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd22d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 067.031 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define SIB_B           ( 1 [34;49m[33;40m<<[34;49m[34;49m 2 ) // 4 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 067.033 : <literal> :> [33;40m2[34;49m <: 0x00007ffff737da25 :> [34;49m#define SIB_B           ( 1 << [34;49m[33;40m2[34;49m[34;49m ) // 4 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m2[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 67.33
[34;49m ..                                    // [34;49m[33;40m2[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd230    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fd23a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd23e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 067.033 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define SIB_B           ( 1 [34;49m[33;40m<<[34;49m[34;49m 2 ) // 4 [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/asmConstants.cft : 67.33[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737da25	< word : <literal>.[34;49m2[39;49m : value = 0x0000000000000002 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff737d82a	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Bits.<< :: type expected : Integer  :: type recorded : Integer  : namespaces/compiler/asmConstants.cft : 67.33
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<<[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 67.33
[34;49m ..                                    // [34;49m[33;40m<<[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd21f    48b80400000000000000    mov rax, 0x4                                           [34;49m[32;49m
0x7ffff72fd229    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd22d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 067.034 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m#define SIB_B           ( 1 << 2 [34;49m[33;40m)[34;49m[34;49m // 4 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 067.037 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m#define SIB_B           ( 1 << 2 ) [34;49m[33;40m//[34;49m[34;49m 4 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 068.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine DISP_B          ( 1 << 3 ) // 8 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 068.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m DISP_B          ( 1 << 3 ) // 8 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 068.025 : C :> [33;40m([34;49m <: cprimitive :> [34;49m#define DISP_B          [34;49m[33;40m([34;49m[34;49m 1 << 3 ) // 8 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 068.028 : <literal> :> [33;40m1[34;49m <: 0x00007ffff737dc20 :> [34;49m#define DISP_B          ( [34;49m[33;40m1[34;49m[34;49m << 3 ) // 8 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 68.28
[34;49m ..                                    // [34;49m[33;40m1[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd245    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd24f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd253    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 068.031 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define DISP_B          ( 1 [34;49m[33;40m<<[34;49m[34;49m 3 ) // 8 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 068.033 : <literal> :> [33;40m3[34;49m <: 0x00007ffff737de1b :> [34;49m#define DISP_B          ( 1 << [34;49m[33;40m3[34;49m[34;49m ) // 8 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m3[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 68.33
[34;49m ..                                    // [34;49m[33;40m3[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd256    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fd260    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd264    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 068.033 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define DISP_B          ( 1 [34;49m[33;40m<<[34;49m[34;49m 3 ) // 8 [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/asmConstants.cft : 68.33[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737de1b	< word : <literal>.[34;49m3[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff737dc20	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Bits.<< :: type expected : Integer  :: type recorded : Integer  : namespaces/compiler/asmConstants.cft : 68.33
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<<[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 68.33
[34;49m ..                                    // [34;49m[33;40m<<[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd245    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fd24f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd253    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 068.034 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m#define DISP_B          ( 1 << 3 [34;49m[33;40m)[34;49m[34;49m // 8 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 068.037 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m#define DISP_B          ( 1 << 3 ) [34;49m[33;40m//[34;49m[34;49m 8 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 069.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine IMM_B           ( 1 << 4 ) // 16 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 069.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m IMM_B           ( 1 << 4 ) // 16 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 069.025 : C :> [33;40m([34;49m <: cprimitive :> [34;49m#define IMM_B           [34;49m[33;40m([34;49m[34;49m 1 << 4 ) // 16 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 069.028 : <literal> :> [33;40m1[34;49m <: 0x00007ffff737e016 :> [34;49m#define IMM_B           ( [34;49m[33;40m1[34;49m[34;49m << 4 ) // 16 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 69.28
[34;49m ..                                    // [34;49m[33;40m1[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd26b    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd275    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd279    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 069.031 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define IMM_B           ( 1 [34;49m[33;40m<<[34;49m[34;49m 4 ) // 16 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 069.033 : <literal> :> [33;40m4[34;49m <: 0x00007ffff737e211 :> [34;49m#define IMM_B           ( 1 << [34;49m[33;40m4[34;49m[34;49m ) // 16 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m4[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 69.33
[34;49m ..                                    // [34;49m[33;40m4[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd27c    48b80400000000000000    mov rax, 0x4                                           [34;49m[32;49m
0x7ffff72fd286    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd28a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 069.033 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define IMM_B           ( 1 [34;49m[33;40m<<[34;49m[34;49m 4 ) // 16 [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/asmConstants.cft : 69.33[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737e211	< word : <literal>.[34;49m4[39;49m : value = 0x0000000000000004 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff737e016	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Bits.<< :: type expected : Integer  :: type recorded : Integer  : namespaces/compiler/asmConstants.cft : 69.33
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<<[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 69.33
[34;49m ..                                    // [34;49m[33;40m<<[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd26b    48b81000000000000000    mov rax, 0x10                                          [34;49m[32;49m
0x7ffff72fd275    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd279    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 069.034 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m#define IMM_B           ( 1 << 4 [34;49m[33;40m)[34;49m[34;49m // 16 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 069.037 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m#define IMM_B           ( 1 << 4 ) [34;49m[33;40m//[34;49m[34;49m 16 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 070.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine REX_W_B         REX_B //( 1 << 0 ) // 2 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 070.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m REX_W_B         REX_B //( 1 << 0 ) // 2 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 070.030 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7d748 :> [34;49m#define REX_W_B         [34;49m[33;40mREX_B[34;49m[34;49m //( 1 << 0 ) // 2 [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/asmConstants.cft : 70.30[39;49m :
TypeWordStack depth =   0 :  = Top = 0x00007ffff7fc1a20, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
type match :: X64.REX_B :: type expected :  :: type recorded :  : namespaces/compiler/asmConstants.cft : 70.30
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 70.30[32;49m
0x7ffff72fd291    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd29b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd29f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 070.032 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m#define REX_W_B         REX_B [34;49m[33;40m//[34;49m[34;49m( 1 << 0 ) // 2 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 071.012 : Compiler :> [33;40mc_syntaxOff[34;49m <: cprimitive :> [34;49m[34;49m[33;40mc_syntaxOff[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 072.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49melse [34;49m 
dbg[i]  :: [34;49m...[34;49m : 072.006 : PreProcessor :> [33;40melse[34;49m <: cprimitive :> [34;49m#[34;49m[33;40melse[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 080.003 : X64 :> [33;40msp[34;49m <: 0x00007ffff74b6638 :> [34;49m[34;49m[33;40msp[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 081.002 : <literal> :> [33;40m2[34;49m <: 0x00007ffff5d00940 :> [34;49m[34;49m[33;40m2[34;49m[34;49m + 7 assertStkChk // stack checking [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 81.2 :> [39;49m2[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
Literal :> 0x0000000000000002 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 081.004 : Int :> [33;40m+[34;49m <: cprimitive :> [34;49m2 [34;49m[33;40m+[34;49m[34;49m 7 assertStkChk // stack checking [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/asmConstants.cft : 81.4[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5d00940	< word : <literal>.[34;49m2[39;49m : value = 0x0000000000000002 > : [34;49mInteger [39;49m
type match :: Int.+ :: type expected : Integer . Integer  :: type recorded : Integer  : namespaces/compiler/asmConstants.cft : 81.4
Stack : word at namespaces/compiler/asmConstants.cft : 81.4 :> [39;49m+[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000007[34;49m.
dbg[i]  :: [34;49m...[34;49m : 081.006 : <literal> :> [33;40m7[34;49m <: 0x00007ffff5d00b08 :> [34;49m2 + [34;49m[33;40m7[34;49m[34;49m assertStkChk // stack checking [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 81.6 :> [39;49m7[34;49m <: 1 cell pushed. TOS set to [39;49m0x0000000000000007[34;49m.
Literal :> 0x0000000000000007 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 081.019 : System :> [33;40massertStkChk[34;49m <: 0x00007ffff7202810 :> [34;49m2 + 7 [34;49m[33;40massertStkChk[34;49m[34;49m // stack checking [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/asmConstants.cft : 81.19[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5d00b08	< word : <literal>.[34;49m7[39;49m : value = 0x0000000000000007 > : [34;49mInteger [39;49m
type match :: System.assertStkChk :: type expected :  :: type recorded : Integer  : namespaces/compiler/asmConstants.cft : 81.19
Stack : word at namespaces/compiler/asmConstants.cft : 81.19 :> [39;49massertStkChk[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 081.021 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m2 + 7 assertStkChk [34;49m[33;40m//[34;49m[34;49m stack checking [34;49m 
dbg[i]  :: [34;49mnamespaces/compiler/x64.cft[34;49m : 058.004 : System :> [33;40mhex[34;49m <: cprimitive :> [34;49m[34;49m[33;40mhex[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 059.006 : Root :> [33;40mLogic[34;49m <: 0x00007ffff7faf5f8 :> [34;49m[34;49m[33;40mLogic[34;49m[34;49m Bits Combinators X64 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 059.011 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49mLogic [34;49m[33;40mBits[34;49m[34;49m Combinators X64 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 059.023 : Root :> [33;40mCombinators[34;49m <: 0x00007ffff7fa76a0 :> [34;49mLogic Bits [34;49m[33;40mCombinators[34;49m[34;49m X64 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 059.027 : Asm :> [33;40mX64[34;49m <: 0x00007ffff74b6438 :> [34;49mLogic Bits Combinators [34;49m[33;40mX64[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 061.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mx64_dbg 1 const [34;49m 
Stack : word at namespaces/compiler/x64.cft : 61.9 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff74675b5[34;49m.
dbg[i]  :: [34;49m...[34;49m : 061.011 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cf71d8 :> [34;49m'x64_dbg [34;49m[33;40m1[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/x64.cft : 61.11 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 061.017 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m'x64_dbg 1 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 61.17 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 062.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mDBI 1 const [34;49m 
Stack : word at namespaces/compiler/x64.cft : 62.5 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff74675c7[34;49m.
dbg[i]  :: [34;49m...[34;49m : 062.007 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cf73a0 :> [34;49m'DBI [34;49m[33;40m1[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/x64.cft : 62.7 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 062.013 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m'DBI 1 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 62.13 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 063.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine x64_dbg 1 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 063.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m x64_dbg 1 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdefine[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 63.18[32;49m
0x7ffff72fd2a3    e900000000              jmp 0x7ffff72fd2a8         	< C compiler code >        [34;49m[32;49m
0x7ffff72fd2a8    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd2ac    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd2b0    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 63.18 :> [39;49mdefine[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c7f038[34;49m.
Literal :> 0x00007ffff5c7f038 <: was pushed onto the stack ...
dbg[c]  :: [34;49m...[34;49m : 063.018 : <literal> :> [33;40m1[34;49m <: 0x00007ffff737e53e :> [34;49m#define x64_dbg [34;49m[33;40m1[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 63.18[32;49m
0x7ffff72fd2b7    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd2c1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd2c5    498906                  mov [r14], rax                                         [34;49m
dbg[i]  :: [34;49m...[34;49m : 064.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif x64_dbg [34;49m 
dbg[i]  :: [34;49m...[34;49m : 064.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m x64_dbg [34;49m 
dbg[i]  :: [34;49m...[34;49m : 064.012 : X64 :> [33;40mx64_dbg[34;49m <: 0x00007ffff5c7f038 :> [34;49m#if [34;49m[33;40mx64_dbg[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 64.12 :> [39;49mx64_dbg[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
dbg[i]  :: [34;49m...[34;49m : 065.006 : Debug :> [33;40mdscOn[34;49m <: cprimitive :> [34;49m[34;49m[33;40mdscOn[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 066.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49mverbosity 3 = [34;49m 
dbg[i]  :: [34;49m...[34;49m : 067.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mendif [34;49m 
dbg[i]  :: [34;49m...[34;49m : 067.007 : PreProcessor :> [33;40mendif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mendif[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 068.002 : Interpreter :> [33;40m:[34;49m <: 0x00007ffff72952f0 :> [34;49m[34;49m[33;40m:[34;49m[34;49m apause ; // pause ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 68.9[32;49m
0x7ffff72fd2c9    e900000000              jmp 0x7ffff72fd2ce         	< C compiler code >        [34;49m
[34;49m ..                                     : [34;49m[33;40mapause[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd2ce    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd2d2    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd2d6    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 68.9 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c7f200[34;49m.
dbg[c]  :: [34;49m...[34;49m : 068.011 : Interpreter :> [33;40m;[34;49m <: 0x00007ffff7294bd0 :> [34;49m: apause [34;49m[33;40m;[34;49m[34;49m // pause ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 68.11
[34;49m ..                              : apause [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd2dd    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 68.11 :> [39;49m;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 068.013 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m: apause ; [34;49m[33;40m//[34;49m[34;49m pause ; [34;49m 
dbg[i]  :: [34;49m...[34;49m : 069.002 : Interpreter :> [33;40m:[34;49m <: 0x00007ffff72952f0 :> [34;49m[34;49m[33;40m:[34;49m[34;49m sp ; //stack using pause ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 69.5[32;49m
0x7ffff72fd2de    e900000000              jmp 0x7ffff72fd2e3         	< C compiler code >        [34;49m
[34;49m ..                                     : [34;49m[33;40msp[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd2e3    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd2e7    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd2eb    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 69.5 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c7f3c8[34;49m.
dbg[c]  :: [34;49m...[34;49m : 069.007 : Interpreter :> [33;40m;[34;49m <: 0x00007ffff7294bd0 :> [34;49m: sp [34;49m[33;40m;[34;49m[34;49m //stack using pause ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 69.7
[34;49m ..                                  : sp [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd2f2    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 69.7 :> [39;49m;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 069.009 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m: sp ; [34;49m[33;40m//[34;49m[34;49mstack using pause ; [34;49m 
dbg[i]  :: [34;49m...[34;49m : 070.003 : X64 :> [33;40msp[34;49m <: 0x00007ffff5c7f3c8 :> [34;49m[34;49m[33;40msp[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 072.011 : Compiler :> [33;40mc_syntaxOn[34;49m <: cprimitive :> [34;49m[34;49m[33;40mc_syntaxOn[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 073.004 : char :> [33;40mint[34;49m <: 0x00007ffff72979e0 :> [34;49m[34;49m[33;40mint[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 074.059 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49megardingDisplacement ( _mod,  disp | rmod ) [34;49m[33;40m//[34;49m[34;49m _mod/rmod avoid name class with 'mod' funct[34;49m 
dbg[c]  :: [34;49m...[34;49m : 078.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( _mod != REG ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 078.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m _mod != REG ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 78.8
[34;49m .. splacement ( _mod, disp | rmod ) { if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fd307    e900000000              jmp 0x7ffff72fd30c         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 078.014 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c7f958 :> [34;49m    if ( [34;49m[33;40m_mod[34;49m[34;49m != REG ) [34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 78.14
[34;49m .. lacement ( _mod, disp | rmod ) { if ( [34;49m[33;40m_mod[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd30c    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd310    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd314    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 078.017 : Logic :> [33;40m!=[34;49m <: cprimitive :> [34;49m    if ( _mod [34;49m[33;40m!=[34;49m[34;49m REG ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 078.021 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b6f20 :> [34;49m    if ( _mod != [34;49m[33;40mREG[34;49m[34;49m ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 78.21
[34;49m ..  ( _mod, disp | rmod ) { if ( _mod != [34;49m[33;40mREG[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd317    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fd321    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd325    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 078.021 : Logic :> [33;40m!=[34;49m <: cprimitive :> [34;49m    if ( _mod [34;49m[33;40m!=[34;49m[34;49m REG ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 78.21[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b6f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7f958	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.!= :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 78.21
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m!=[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 78.21
[34;49m .. ent ( _mod, disp | rmod ) { if ( _mod [34;49m[33;40m!=[34;49m[34;49m REG [34;49m[32;49m
0x7ffff72fd310    48b90300000000000000    mov rcx, 0x3                                           [34;49m[32;49m
0x7ffff72fd31a    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd31d    0f95c0                  setnz al                                               [34;49m[32;49m
0x7ffff72fd320    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd324    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd328    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 078.022 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( _mod != REG [34;49m[33;40m)[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 78.22
[34;49m .. mod, disp | rmod ) { if ( _mod != REG [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd32b    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 78.22 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd30c[34;49m.
dbg[c]  :: [34;49m...[34;49m : 079.006 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 79.6
[34;49m .. d, disp | rmod ) { if ( _mod != REG ) [34;49m[33;40m{[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd32c    e900000000              jmp 0x7ffff72fd331         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 080.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif 1 // c_syntax/preprocessor tesing [34;49m 
dbg[c]  :: [34;49m...[34;49m : 080.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m 1 // c_syntax/preprocessor tesing [34;49m 
dbg[i]  :: [34;49m...[34;49m : 080.006 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cf7568 :> [34;49m#if [34;49m[33;40m1[34;49m[34;49m // c_syntax/preprocessor tesing [34;49m 
Stack : word at namespaces/compiler/x64.cft : 80.6 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 080.008 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m#if 1 [34;49m[33;40m//[34;49m[34;49m c_syntax/preprocessor tesing [34;49m 
dbg[c]  :: [34;49m...[34;49m : 081.011 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m        [34;49m[33;40mif[34;49m[34;49m ( disp == 0 ) rmod = 0 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 081.012 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m        if [34;49m[33;40m([34;49m[34;49m disp == 0 ) rmod = 0 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 81.12
[34;49m .. sp | rmod ) { if ( _mod != REG ) { if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fd331    e900000000              jmp 0x7ffff72fd336         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 081.018 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c7fb20 :> [34;49m        if ( [34;49m[33;40mdisp[34;49m[34;49m == 0 ) rmod = 0 ; [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 81.18
[34;49m ..  | rmod ) { if ( _mod != REG ) { if ( [34;49m[33;40mdisp[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd336    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fd33a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd33e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 081.021 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m        if ( disp [34;49m[33;40m==[34;49m[34;49m 0 ) rmod = 0 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 081.023 : <literal> :> [33;40m0[34;49m <: 0x00007ffff737e838 :> [34;49m        if ( disp == [34;49m[33;40m0[34;49m[34;49m ) rmod = 0 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 81.23
[34;49m .. ) { if ( _mod != REG ) { if ( disp == [34;49m[33;40m0[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd341    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fd34b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd34f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 081.023 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m        if ( disp [34;49m[33;40m==[34;49m[34;49m 0 ) rmod = 0 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 81.23[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff737e838	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c7fb20	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5cf7568	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Logic.== :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 81.23
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m==[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 81.23
[34;49m .. od ) { if ( _mod != REG ) { if ( disp [34;49m[33;40m==[34;49m[34;49m 0 [34;49m[32;49m
0x7ffff72fd33a    48b90000000000000000    mov rcx, 0x0                                           [34;49m[32;49m
0x7ffff72fd344    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd347    0f94c0                  setz al                                                [34;49m[32;49m
0x7ffff72fd34a    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd34e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd352    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 081.024 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m        if ( disp == 0 [34;49m[33;40m)[34;49m[34;49m rmod = 0 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 81.24
[34;49m .. { if ( _mod != REG ) { if ( disp == 0 [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd355    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 81.24 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd336[34;49m.
dbg[c]  :: [34;49m...[34;49m : 081.030 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m        if ( disp == 0 ) [34;49m[33;40m{[34;49m[34;49mmod = 0 ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 81.30
[34;49m ..  if ( _mod != REG ) { if ( disp == 0 )[34;49m[33;40m{[34;49m[34;49mrmod [34;49m[32;49m
0x7ffff72fd356    e900000000              jmp 0x7ffff72fd35b         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 081.030 : locals_0 :> [33;40mrmod[34;49m <: 0x00007ffff5c7fce8 :> [34;49m        if ( disp == 0 ) [34;49m[33;40mrmod[34;49m[34;49m = 0 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 081.032 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m        if ( disp == 0 ) rmod [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 081.034 : <literal> :> [33;40m0[34;49m <: 0x00007ffff737ea33 :> [34;49m        if ( disp == 0 ) rmod = [34;49m[33;40m0[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 81.34
[34;49m .. od != REG ) { if ( disp == 0 ) rmod = [34;49m[33;40m0[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd35b    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fd365    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd369    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 081.036 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m        if ( disp == 0 ) rmod [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 81.36[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737ea33	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7fce8	< word : locals_0.[34;49mrmod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 81.36
dbg[c]  :: [34;49m...[34;49m : 081.036 : locals_0 :> [33;40mrmod[34;49m <: 0x00007ffff5c80b28 :> [34;49m        if ( disp == 0 ) [34;49m[33;40mrmod[34;49m[34;49m = 0 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrmod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 81.36
[34;49m .. if ( _mod != REG ) { if ( disp == 0 ) [34;49m[33;40mrmod[34;49m[34;49m = 0 ; [34;49m[32;49m
0x7ffff72fd36c    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd370    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd374    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 081.036 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m        if ( disp == 0 ) rmod [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 81.36[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c80b28	< word : locals_0.[34;49mrmod[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 81.36
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 81.36
[34;49m .. _mod != REG ) { if ( disp == 0 ) rmod [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m[32;49m
0x7ffff72fd365    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd369    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 081.036 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m        if ( disp == 0 ) rmod = 0 [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 083.010 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m        [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 83.10
[34;49m .. ) { if ( disp == 0 ) rmod = 0 ; else  [34;49m[33;40m{[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd36d    e900000000              jmp 0x7ffff72fd372         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 084.015 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m            [34;49m[33;40mif[34;49m[34;49m ( disp <= 0xff ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 084.016 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m            if [34;49m[33;40m([34;49m[34;49m disp <= 0xff ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 84.16
[34;49m ..  ( disp == 0 ) rmod = 0 ; else  {  if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fd372    e900000000              jmp 0x7ffff72fd377         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 084.022 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c7fb20 :> [34;49m            if ( [34;49m[33;40mdisp[34;49m[34;49m <= 0xff ) [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 84.22
[34;49m ..  disp == 0 ) rmod = 0 ; else  {  if ( [34;49m[33;40mdisp[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd377    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fd37b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd37f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 084.025 : Logic :> [33;40m<=[34;49m <: cprimitive :> [34;49m            if ( disp [34;49m[33;40m<=[34;49m[34;49m 0xff ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 084.030 : <literal> :> [33;40m0xff[34;49m <: 0x00007ffff737ec2e :> [34;49m            if ( disp <= [34;49m[33;40m0xff[34;49m[34;49m ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0xff[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 84.30
[34;49m ..  0 ) rmod = 0 ; else  {  if ( disp <= [34;49m[33;40m0xff[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd382    48b8ff00000000000000    mov rax, 0xff                                          [34;49m[32;49m
0x7ffff72fd38c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd390    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 084.030 : Logic :> [33;40m<=[34;49m <: cprimitive :> [34;49m            if ( disp [34;49m[33;40m<=[34;49m[34;49m 0xff ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 84.30[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737ec2e	< word : <literal>.[34;49m0xff[39;49m : value = 0x00000000000000ff > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c81410	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Logic.<= :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 84.30
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<=[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 84.30
[34;49m ..  == 0 ) rmod = 0 ; else  {  if ( disp [34;49m[33;40m<=[34;49m[34;49m 0xff [34;49m[32;49m
0x7ffff72fd37b    48b9ff00000000000000    mov rcx, 0xff                                          [34;49m[32;49m
0x7ffff72fd385    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd388    0f9ec0                  setle al                                               [34;49m[32;49m
0x7ffff72fd38b    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd38f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd393    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 084.031 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m            if ( disp <= 0xff [34;49m[33;40m)[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 84.31
[34;49m .. rmod = 0 ; else  {  if ( disp <= 0xff [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd396    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 84.31 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd377[34;49m.
dbg[c]  :: [34;49m...[34;49m : 085.021 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m                [34;49m[33;40m{[34;49m[34;49mmod = 1 ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 85.21
[34;49m .. mod = 0 ; else  {  if ( disp <= 0xff )[34;49m[33;40m{[34;49m[34;49m rmod [34;49m[32;49m
0x7ffff72fd397    e900000000              jmp 0x7ffff72fd39c         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 085.021 : locals_0 :> [33;40mrmod[34;49m <: 0x00007ffff5c7fce8 :> [34;49m                [34;49m[33;40mrmod[34;49m[34;49m = 1 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 085.023 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m                rmod [34;49m[33;40m=[34;49m[34;49m 1 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 085.025 : <literal> :> [33;40m1[34;49m <: 0x00007ffff737ee29 :> [34;49m                rmod = [34;49m[33;40m1[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 85.25
[34;49m ..  else  {  if ( disp <= 0xff )  rmod = [34;49m[33;40m1[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd39c    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd3a6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3aa    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 085.027 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m                rmod [34;49m[33;40m=[34;49m[34;49m 1 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 85.27[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737ee29	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c81b30	< word : locals_0.[34;49mrmod[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 85.27
dbg[c]  :: [34;49m...[34;49m : 085.027 : locals_0 :> [33;40mrmod[34;49m <: 0x00007ffff5c81cf8 :> [34;49m                [34;49m[33;40mrmod[34;49m[34;49m = 1 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrmod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 85.27
[34;49m .. d = 0 ; else  {  if ( disp <= 0xff )  [34;49m[33;40mrmod[34;49m[34;49m = 1 ; [34;49m[32;49m
0x7ffff72fd3ad    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd3b1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3b5    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 085.027 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m                rmod [34;49m[33;40m=[34;49m[34;49m 1 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 85.27[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c81cf8	< word : locals_0.[34;49mrmod[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 85.27
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 85.27
[34;49m ..  ; else  {  if ( disp <= 0xff )  rmod [34;49m[33;40m=[34;49m[34;49m 1 ; [34;49m[32;49m
0x7ffff72fd3a6    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd3aa    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 085.027 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m                rmod = 1 [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 087.014 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m            [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 87.14
[34;49m .. f ( disp <= 0xff )  rmod = 1 ;  else  [34;49m[33;40m{[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd3ae    e900000000              jmp 0x7ffff72fd3b3         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 088.021 : locals_0 :> [33;40mrmod[34;49m <: 0x00007ffff5c7fce8 :> [34;49m                [34;49m[33;40mrmod[34;49m[34;49m = 2 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 088.023 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m                rmod [34;49m[33;40m=[34;49m[34;49m 2 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 088.025 : <literal> :> [33;40m2[34;49m <: 0x00007ffff737f024 :> [34;49m                rmod = [34;49m[33;40m2[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m2[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 88.25
[34;49m .. <= 0xff )  rmod = 1 ;  else  { rmod = [34;49m[33;40m2[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd3b3    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fd3bd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3c1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 088.027 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m                rmod [34;49m[33;40m=[34;49m[34;49m 2 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 88.27[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737f024	< word : <literal>.[34;49m2[39;49m : value = 0x0000000000000002 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c825e0	< word : locals_0.[34;49mrmod[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 88.27
dbg[c]  :: [34;49m...[34;49m : 088.027 : locals_0 :> [33;40mrmod[34;49m <: 0x00007ffff5c827a8 :> [34;49m                [34;49m[33;40mrmod[34;49m[34;49m = 2 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrmod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 88.27
[34;49m .. ( disp <= 0xff )  rmod = 1 ;  else  { [34;49m[33;40mrmod[34;49m[34;49m = 2 ;  .. [34;49m[32;49m
0x7ffff72fd3c4    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd3c8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3cc    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 088.027 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m                rmod [34;49m[33;40m=[34;49m[34;49m 2 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 88.27[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c827a8	< word : locals_0.[34;49mrmod[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 88.27
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 88.27
[34;49m .. p <= 0xff )  rmod = 1 ;  else  { rmod [34;49m[33;40m=[34;49m[34;49m 2 ;  .. [34;49m[32;49m
0x7ffff72fd3bd    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd3c1    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 088.027 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m                rmod = 2 [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 089.014 : Reserved :> [33;40m}[34;49m <: cprimitive :> [34;49m            [34;49m[33;40m}[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 89.14
[34;49m .. ff )  rmod = 1 ;  else  { rmod = 2 ;  [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd3c4    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 89.14 :> [39;49m}[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd3b3[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 89.14[34;49m :
DataStack depth =   8 : Dsp (R14) = Top = 0x00007ffff7269238, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269238 > = 0x00007ffff72fd35b	
  DataStack   [  -1 ] < 0x00007ffff7269230 > = 0x00007ffff72fd336	
  DataStack   [  -2 ] < 0x00007ffff7269228 > = 0x00007ffff72fd30c	
  DataStack   [  -3 ] < 0x00007ffff7269220 > = 0x00007ffff5c7f590	< word : int.[39;49mCalculateModRegardingDisplacement[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -4 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -5 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -6 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -7 ] < 0x00007ffff7269200 > = 0x0000000000000005	
DataStack at : [39;49mnamespaces/compiler/x64.cft : 90.10[34;49m :
DataStack depth =   6 : Dsp (R14) = Top = 0x00007ffff7269228, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269228 > = 0x00007ffff72fd30c	
  DataStack   [  -1 ] < 0x00007ffff7269220 > = 0x00007ffff5c7f590	< word : int.[39;49mCalculateModRegardingDisplacement[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -2 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -5 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 091.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49melif 0 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 091.006 : PreProcessor :> [33;40melif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40melif[34;49m[34;49m 0 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 091.008 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cf7730 :> [34;49m#elif [34;49m[33;40m0[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 91.8 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[c]  :: [34;49m...[34;49m : 114.006 : Reserved :> [33;40m}[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m}[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 114.6
[34;49m ..   rmod = 1 ;  else  { rmod = 2 ;  } } [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd39c    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 114.6 :> [39;49m}[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd331[34;49m.
dbg[c]  :: [34;49m...[34;49m : 115.014 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    else [34;49m[33;40m{[34;49m[34;49mmod = _mod ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 115.14
[34;49m .. = 1 ;  else  { rmod = 2 ;  } } } else [34;49m[33;40m{[34;49m[34;49mmod  .. [34;49m[32;49m
0x7ffff72fd39d    e900000000              jmp 0x7ffff72fd3a2         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 115.014 : locals_0 :> [33;40mrmod[34;49m <: 0x00007ffff5c7fce8 :> [34;49m    else [34;49m[33;40mrmod[34;49m[34;49m = _mod ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 115.016 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    else rmod [34;49m[33;40m=[34;49m[34;49m _mod ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 115.021 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c7f958 :> [34;49m    else rmod = [34;49m[33;40m_mod[34;49m[34;49m ; [34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 115.21
[34;49m .. else  { rmod = 2 ;  } } } else rmod = [34;49m[33;40m_mod[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd3a2    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd3a6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3aa    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 115.023 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    else rmod [34;49m[33;40m=[34;49m[34;49m _mod ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 115.23[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c835e8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c83420	< word : locals_0.[34;49mrmod[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 115.23
dbg[c]  :: [34;49m...[34;49m : 115.023 : locals_0 :> [33;40mrmod[34;49m <: 0x00007ffff5c83978 :> [34;49m    else [34;49m[33;40mrmod[34;49m[34;49m = _mod ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrmod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 115.23
[34;49m .. = 1 ;  else  { rmod = 2 ;  } } } else [34;49m[33;40mrmod[34;49m[34;49m = _mod ;  .. [34;49m[32;49m
0x7ffff72fd3ad    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd3b1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3b5    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 115.023 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    else rmod [34;49m[33;40m=[34;49m[34;49m _mod ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 115.23[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c83978	< word : locals_0.[34;49mrmod[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 115.23
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 115.23
[34;49m ..   else  { rmod = 2 ;  } } } else rmod [34;49m[33;40m=[34;49m[34;49m _mod ;  .. [34;49m[32;49m
0x7ffff72fd3a6    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd3aa    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 115.023 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    else rmod = _mod [34;49m[33;40m;[34;49m[34;49m [34;49m 
DataStack at : [39;49mnamespaces/compiler/x64.cft : 115.23[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c7f590	< word : int.[39;49mCalculateModRegardingDisplacement[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 116.011 : Compiler :> [33;40mreturn[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mreturn[34;49m[34;49m rmod ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 116.018 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    return rmod [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 117.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 117.2
[34;49m ..  rmod = 2 ;  } } } else rmod = _mod ; [34;49m[33;40mreturn[34;49m[34;49m rmod ; }  .. [34;49m[32;49m
0x7ffff72fd399    498b4708                mov rax, [r15+0x8]                                     [34;49m
[34;49m ..  } } else rmod = _mod ; return rmod ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd39d    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fd3a1    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd3a5    4983ee08                sub r14, 0x8                                           [34;49m
[34;49m ..  2 ;  } } } else rmod = _mod ; return [34;49m[33;40mrmod[34;49m[34;49m ; }  .. [34;49m[32;49m
0x7ffff72fd3a9    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fd3ac    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 117.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 117.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 118.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m'CalculateModRegardingDisplacement find wdiss apause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 120.005 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49m[34;49m[33;40mBits[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 121.004 : char :> [33;40mint[34;49m <: 0x00007ffff72979e0 :> [34;49m[34;49m[33;40mint[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mint[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 123.2
[34;49m ..                                       [34;49m[33;40mint[34;49m[34;49m CalculateModRmByte ( _mod, _reg, rm, sib, disp | modRm ) {  .. [34;49m[32;49m
0x7ffff72fd3ad    e900000000              jmp 0x7ffff72fd3b2         	< C compiler code >        [34;49m[32;49m
0x7ffff72fd3b2    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd3b6    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd3ba    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 123.2 :> [39;49mint[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c84098[34;49m.
dbg[c]  :: [34;49m...[34;49m : 124.009 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c83d08 :> [34;49m    [34;49m[33;40m_mod[34;49m[34;49m = CalculateModRegardingDisplacement ( _mod, disp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 124.011 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    _mod [34;49m[33;40m=[34;49m[34;49m CalculateModRegardingDisplacement ( _mod, disp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 124.045 : int :> [33;40mCalculateModRegardingDisplacement[34;49m <: 0x00007ffff5c7f590 :> [34;49m    _mod = [34;49m[33;40mCalculateModRegardingDisplacement[34;49m[34;49m ( _mod, disp )[34;49m 
dbg[c]  :: [34;49m...[34;49m : 124.051 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c83d08 :> [34;49m    _mod = CalculateModRegardingDisplacement ( [34;49m[33;40m_mod[34;49m[34;49m, disp ) ; [34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
dbg[c]  :: [34;49m...[34;49m : 124.058 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c835e8 :> [34;49m    _mod = CalculateModRegardingDisplacement ( _mod, [34;49m[33;40mdisp[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 124.58
[34;49m .. ulateModRegardingDisplacement ( _mod, [34;49m[33;40mdisp[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd3cc    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fd3d0    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3d4    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 124.059 : int :> [33;40mCalculateModRegardingDisplacement[34;49m <: 0x00007ffff5c7f590 :> [34;49m    _mod = [34;49m[33;40mCalculateModRegardingDisplacement[34;49m[34;49m ( _mod, disp )[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCalculateModRegardingDisplacement[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 124.59
[34;49m .. reg, rm, sib, disp | modRm ) { _mod = [34;49m[33;40mCalculateModRegardingDisplacement[34;49m[34;49m ( _mod, disp )[34;49m[32;49m
0x7ffff72fd3d7    49b9f8d22ff7ff7f0000    mov r9, 0x7ffff72fd2f8                                 [34;49m[32;49m
0x7ffff72fd3e1    49ffd1                  call r9                    	< int.[39;49mCalculateModRegardingDisplacement[34;49m : 0x00007ffff72fd2f8 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 124.062 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    _mod [34;49m[33;40m=[34;49m[34;49m CalculateModRegardingDisplacement ( _mod, disp ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 124.62[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c835e8	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c83090	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c83d08	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Undefined . Undefined  : namespaces/compiler/x64.cft : 124.62
dbg[c]  :: [34;49m...[34;49m : 124.062 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c82ec8 :> [34;49m    _mod = CalculateModRegardingDisplacement ( [34;49m[33;40m_mod[34;49m[34;49m, disp ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 124.62
[34;49m .. = CalculateModRegardingDisplacement ( [34;49m[33;40m_mod[34;49m[34;49m, disp ) ; [34;49m[32;49m
0x7ffff72fd3e4    498d47d8                lea rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fd3e8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3ec    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 124.062 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    _mod [34;49m[33;40m=[34;49m[34;49m CalculateModRegardingDisplacement ( _mod, disp ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 124.62[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c82ec8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c83d08	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Undefined . Undefined  : namespaces/compiler/x64.cft : 124.62
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 124.62
[34;49m ..  _reg, rm, sib, disp | modRm ) { _mod [34;49m[33;40m=[34;49m[34;49m CalculateModRegardingDisplacement ( _mod, disp ) ; [34;49m[32;49m
0x7ffff72fd3e8    488bc8                  mov rcx, rax                                           [34;49m[32;49m
0x7ffff72fd3eb    498b06                  mov rax, [r14]                                         [34;49m[32;49m
0x7ffff72fd3ee    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3f2    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 124.062 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    _mod = CalculateModRegardingDisplacement ( _mod, disp ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( ( _mod < 3 ) && ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m ( _mod < 3 ) && ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 125.8
[34;49m .. rdingDisplacement ( _mod, disp ) ; if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fd3f5    e900000000              jmp 0x7ffff72fd3fa         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 125.010 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    if ( [34;49m[33;40m([34;49m[34;49m _mod < 3 ) && ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.016 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c83d08 :> [34;49m    if ( ( [34;49m[33;40m_mod[34;49m[34;49m < 3 ) && ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 125.16
[34;49m .. gDisplacement ( _mod, disp ) ; if ( ( [34;49m[33;40m_mod[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd3fa    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fd3fe    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd402    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 125.018 : Logic :> [33;40m<[34;49m <: cprimitive :> [34;49m    if ( ( _mod [34;49m[33;40m<[34;49m[34;49m 3 ) && ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.020 : <literal> :> [33;40m3[34;49m <: 0x00007ffff5c82970 :> [34;49m    if ( ( _mod < [34;49m[33;40m3[34;49m[34;49m ) && ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m3[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 125.20
[34;49m .. cement ( _mod, disp ) ; if ( ( _mod < [34;49m[33;40m3[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd405    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fd40f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd413    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 125.020 : Logic :> [33;40m<[34;49m <: cprimitive :> [34;49m    if ( ( _mod [34;49m[33;40m<[34;49m[34;49m 3 ) && ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 125.20[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c82970	< word : <literal>.[34;49m3[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c82b38	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.< :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 125.20
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 125.20
[34;49m .. lacement ( _mod, disp ) ; if ( ( _mod [34;49m[33;40m<[34;49m[34;49m 3 [34;49m[32;49m
0x7ffff72fd3fe    48b90300000000000000    mov rcx, 0x3                                           [34;49m[32;49m
0x7ffff72fd408    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd40b    0f9cc0                  setl al                                                [34;49m[32;49m
0x7ffff72fd40e    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd412    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd416    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 125.021 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 [34;49m[33;40m)[34;49m[34;49m && ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.025 : Logic :> [33;40m&&[34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 ) [34;49m[33;40m&&[34;49m[34;49m ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.026 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 ) && [34;49m[33;40m([34;49m[34;49m rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.030 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c83978 :> [34;49m    if ( ( _mod < 3 ) && ( [34;49m[33;40mrm[34;49m[34;49m == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 125.30
[34;49m .. _mod, disp ) ; if ( ( _mod < 3 ) && ( [34;49m[33;40mrm[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd419    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd41d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd421    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 125.033 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 ) && ( rm [34;49m[33;40m==[34;49m[34;49m 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.035 : <literal> :> [33;40m4[34;49m <: 0x00007ffff5c82250 :> [34;49m    if ( ( _mod < 3 ) && ( rm == [34;49m[33;40m4[34;49m[34;49m ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m4[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 125.35
[34;49m .. disp ) ; if ( ( _mod < 3 ) && ( rm == [34;49m[33;40m4[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd424    48b80400000000000000    mov rax, 0x4                                           [34;49m[32;49m
0x7ffff72fd42e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd432    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 125.035 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 ) && ( rm [34;49m[33;40m==[34;49m[34;49m 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 125.35[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c82250	< word : <literal>.[34;49m4[39;49m : value = 0x0000000000000004 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c83978	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c827a8	< word : Logic.[34;49m<[39;49m : value = 0x00005555555b7d22 > : [34;49mInteger . Integer -> Boolean [39;49m
type match :: Logic.== :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 125.35
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m==[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 125.35
[34;49m .. d, disp ) ; if ( ( _mod < 3 ) && ( rm [34;49m[33;40m==[34;49m[34;49m 4 [34;49m[32;49m
0x7ffff72fd41d    48b90400000000000000    mov rcx, 0x4                                           [34;49m[32;49m
0x7ffff72fd427    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd42a    0f94c0                  setz al                                                [34;49m[32;49m
0x7ffff72fd42d    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd431    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd435    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 125.036 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 ) && ( rm == 4 [34;49m[33;40m)[34;49m[34;49m ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.036 : Logic :> [33;40m&&[34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 ) [34;49m[33;40m&&[34;49m[34;49m ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m&&[34;49m <:   61 bytes : at namespaces/compiler/x64.cft : 125.36
[34;49m .. nt ( _mod, disp ) ; if ( ( _mod < 3 ) [34;49m[33;40m&&[34;49m[34;49m ( rm == 4 )[34;49m[32;49m
0x7ffff72fd438    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fd43b    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fd43f    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fd443    4885c9                  test rcx, rcx                                          [34;49m[32;49m
0x7ffff72fd446    0f8409000000            jz 0x7ffff72fd455          	< C compiler code >        [34;49m[32;49m
0x7ffff72fd44c    4885c0                  test rax, rax                                          [34;49m[32;49m
0x7ffff72fd44f    0f850f000000            jnz 0x7ffff72fd464         	< C compiler code >        [34;49m[32;49m
0x7ffff72fd455    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fd45f    e90a000000              jmp 0x7ffff72fd46e         	< C compiler code >        [34;49m[32;49m
0x7ffff72fd464    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd46e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd472    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 125.038 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 ) && ( rm == 4 ) [34;49m[33;40m)[34;49m[34;49m //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 125.38
[34;49m ..  ) ; if ( ( _mod < 3 ) && ( rm == 4 ) [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd475    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 125.38 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd3fa[34;49m.
dbg[c]  :: [34;49m...[34;49m : 125.041 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 ) && ( rm == 4 ) ) [34;49m[33;40m//[34;49m[34;49m|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 127.006 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 127.6
[34;49m ..  ; if ( ( _mod < 3 ) && ( rm == 4 ) ) [34;49m[33;40m{[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd476    e900000000              jmp 0x7ffff72fd47b         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 128.010 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m        [34;49m[33;40m//[34;49m[34;49m cf. InstructionSet-A-M-253666.pdf Table 2-2 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 129.009 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m        [34;49m[33;40m"[34;49m[34;49m\n\nCalculateModRmByte : MACHINE_CODE_ERROR\n\n" ps ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 129.057 : <literal> :> [33;40m"\n\nCalculateModRmByte : MACHINE_CODE_ERROR\n\n"[34;49m <: 0x00007ffff5c81968 :> [34;49m[34;49m[33;40m"\n\nCalculateModRmByte : MACHINE_CODE_ERROR\n\n"[34;49m[34;49m[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m"\n\nCalculateModRmByte : MACHINE_CODE_ERROR\n\n"[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 129.9
[34;49m ..  if ( ( _mod < 3 ) && ( rm == 4 ) ) { [34;49m[33;40m"\n\nCalculateModRmByte : MACHINE_CODE_ERROR\n\n"[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd47b    48b842962cf7ff7f0000    mov rax, 0x7ffff72c9642    	< string : '[39;49m\n\nCalculateModRmByte : MACHINE_CODE_ERROR\n\n[34;49m' >[34;49m[32;49m
0x7ffff72fd485    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd489    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 129.061 : Int :> [33;40mps[34;49m <: 0x00007ffff728e7d8 :> [34;49m        "\n\nCalculateModRmByte : MACHINE_CODE_ERROR\n\n" [34;49m[33;40mps[34;49m[34;49m ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 129.61[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c81968	< word : <literal>.[34;49m"\n\nCalculateModRmByte : MACHINE_CODE_ERROR\n\n"[39;49m : value = 0x00007ffff72c9642 > : [34;49mString [39;49m
type match :: Int.ps :: type expected : String  :: type recorded : String  : namespaces/compiler/x64.cft : 129.61
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mps[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 129.61
[34;49m .. teModRmByte : MACHINE_CODE_ERROR\n\n" [34;49m[33;40mps[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd48c    49b909332ff7ff7f0000    mov r9, 0x7ffff72f3309                                 [34;49m[32;49m
0x7ffff72fd496    49ffd1                  call r9                    	< Int.[39;49mps[34;49m : 0x00007ffff72f3309 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 130.014 : User :> [33;40mpause[34;49m <: 0x00007ffff72010e8 :> [34;49m        [34;49m[33;40mpause[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mpause[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 130.14
[34;49m .. RmByte : MACHINE_CODE_ERROR\n\n" ps ; [34;49m[33;40mpause[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd499    49b97d502ff7ff7f0000    mov r9, 0x7ffff72f507d                                 [34;49m[32;49m
0x7ffff72fd4a3    49ffd1                  call r9                    	< User.[39;49mpause[34;49m : 0x00007ffff72f507d >[34;49m
dbg[c]  :: [34;49m...[34;49m : 131.013 : System :> [33;40mquit[34;49m <: cprimitive :> [34;49m        [34;49m[33;40mquit[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mquit[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 131.13
[34;49m ..  MACHINE_CODE_ERROR\n\n" ps ; pause ; [34;49m[33;40mquit[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4a6    49b83aa65b5555550000    mov r8, 0x5555555ba63a                                 [34;49m[32;49m
0x7ffff72fd4b0    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd4ba    49ffd1                  call r9                    	< System.[39;49mquit[34;49m : 0x00005555555ba63a >[34;49m
dbg[c]  :: [34;49m...[34;49m : 132.006 : Reserved :> [33;40m}[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m}[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 132.6
[34;49m .. E_CODE_ERROR\n\n" ps ; pause ; quit ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4bd    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 132.6 :> [39;49m}[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd47b[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 133.7[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c84098	< word : int.[39;49mCalculateModRmByte[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 133.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( sib ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 133.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m sib ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 133.8
[34;49m .. E_ERROR\n\n" ps ; pause ; quit ; } if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd4b1    e900000000              jmp 0x7ffff72fd4b6         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 133.013 : locals_0 :> [33;40msib[34;49m <: 0x00007ffff5c837b0 :> [34;49m    if ( [34;49m[33;40msib[34;49m[34;49m ) [34;49m 
_Do_C_Syntax_Variable : word = sib :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msib[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 133.13
[34;49m .. ERROR\n\n" ps ; pause ; quit ; } if ( [34;49m[33;40msib[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4b6    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd4ba    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd4be    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 133.014 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( sib [34;49m[33;40m)[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 133.14
[34;49m .. R\n\n" ps ; pause ; quit ; } if ( sib [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd4c1    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 133.14 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd4b6[34;49m.
dbg[c]  :: [34;49m...[34;49m : 134.006 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 134.6
[34;49m .. n\n" ps ; pause ; quit ; } if ( sib ) [34;49m[33;40m{[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4c2    e900000000              jmp 0x7ffff72fd4c7         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 135.011 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c83978 :> [34;49m        [34;49m[33;40mrm[34;49m[34;49m = 4 ; // from intel _mod tables [34;49m 
dbg[c]  :: [34;49m...[34;49m : 135.013 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m        rm [34;49m[33;40m=[34;49m[34;49m 4 ; // from intel _mod tables [34;49m 
dbg[c]  :: [34;49m...[34;49m : 135.015 : <literal> :> [33;40m4[34;49m <: 0x00007ffff5c80b28 :> [34;49m        rm = [34;49m[33;40m4[34;49m[34;49m ; // from intel _mod tables [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m4[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 135.15
[34;49m ..  ; pause ; quit ; } if ( sib ) { rm = [34;49m[33;40m4[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4c7    48b80400000000000000    mov rax, 0x4                                           [34;49m[32;49m
0x7ffff72fd4d1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd4d5    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 135.017 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m        rm [34;49m[33;40m=[34;49m[34;49m 4 ; // from intel _mod tables [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 135.17[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c80b28	< word : <literal>.[34;49m4[39;49m : value = 0x0000000000000004 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c80cf0	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 135.17
dbg[c]  :: [34;49m...[34;49m : 135.017 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c80960 :> [34;49m        [34;49m[33;40mrm[34;49m[34;49m = 4 ; // from intel _mod tables [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 135.17
[34;49m .. n" ps ; pause ; quit ; } if ( sib ) { [34;49m[33;40mrm[34;49m[34;49m = 4 ;  .. [34;49m[32;49m
0x7ffff72fd4d8    498d47e8                lea rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd4dc    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd4e0    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 135.017 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m        rm [34;49m[33;40m=[34;49m[34;49m 4 ; // from intel _mod tables [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 135.17[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c80960	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 135.17
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 135.17
[34;49m .. ps ; pause ; quit ; } if ( sib ) { rm [34;49m[33;40m=[34;49m[34;49m 4 ;  .. [34;49m[32;49m
0x7ffff72fd4d1    498d4fe8                lea rcx, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd4d5    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 135.017 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m        rm = 4 [34;49m[33;40m;[34;49m[34;49m // from intel _mod tables [34;49m 
dbg[c]  :: [34;49m...[34;49m : 135.019 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m        rm = 4 ; [34;49m[33;40m//[34;49m[34;49m from intel _mod tables [34;49m 
dbg[c]  :: [34;49m...[34;49m : 136.013 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c83b40 :> [34;49m        [34;49m[33;40m_reg[34;49m[34;49m = 0 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 136.015 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m        _reg [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 136.017 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c80240 :> [34;49m        _reg = [34;49m[33;40m0[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 136.17
[34;49m .. quit ; } if ( sib ) { rm = 4 ; _reg = [34;49m[33;40m0[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4d8    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fd4e2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd4e6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 136.019 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m        _reg [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 136.19[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c80240	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c83b40	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 136.19
dbg[c]  :: [34;49m...[34;49m : 136.019 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c80078 :> [34;49m        [34;49m[33;40m_reg[34;49m[34;49m = 0 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 136.19
[34;49m .. ause ; quit ; } if ( sib ) { rm = 4 ; [34;49m[33;40m_reg[34;49m[34;49m = 0 ;  .. [34;49m[32;49m
0x7ffff72fd4e9    498d47e0                lea rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fd4ed    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd4f1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 136.019 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m        _reg [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 136.19[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c80078	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 136.19
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 136.19
[34;49m .. ; quit ; } if ( sib ) { rm = 4 ; _reg [34;49m[33;40m=[34;49m[34;49m 0 ;  .. [34;49m[32;49m
0x7ffff72fd4e2    498d4fe0                lea rcx, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fd4e6    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 136.019 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m        _reg = 0 [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 137.006 : Reserved :> [33;40m}[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m}[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 137.6
[34;49m ..  ; } if ( sib ) { rm = 4 ; _reg = 0 ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4e9    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 137.6 :> [39;49m}[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd4c7[34;49m.
dbg[c]  :: [34;49m...[34;49m : 138.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49mmodRm = ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // on[34;49m 
DataStack at : [39;49mnamespaces/compiler/x64.cft : 139.10[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c84098	< word : int.[39;49mCalculateModRmByte[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 139.010 : locals_0 :> [33;40mmodRm[34;49m <: 0x00007ffff5c83258 :> [34;49m    [34;49m[33;40mmodRm[34;49m[34;49m = ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ;[34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.012 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    modRm [34;49m[33;40m=[34;49m[34;49m ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.013 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    modRm = [34;49m[33;40m([34;49m[34;49m _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 bits[34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.019 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c83d08 :> [34;49m    modRm = ( [34;49m[33;40m_mod[34;49m[34;49m << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; [34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 139.19
[34;49m .. b ) { rm = 4 ; _reg = 0 ; } modRm = ( [34;49m[33;40m_mod[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4e0    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fd4e4    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd4e8    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.022 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m    modRm = ( _mod [34;49m[33;40m<<[34;49m[34;49m 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.024 : <literal> :> [33;40m6[34;49m <: 0x00007ffff737f4b6 :> [34;49m    modRm = ( _mod << [34;49m[33;40m6[34;49m[34;49m ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; //[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m6[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 139.24
[34;49m ..  = 4 ; _reg = 0 ; } modRm = ( _mod << [34;49m[33;40m6[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4eb    48b80600000000000000    mov rax, 0x6                                           [34;49m[32;49m
0x7ffff72fd4f5    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd4f9    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.024 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m    modRm = ( _mod [34;49m[33;40m<<[34;49m[34;49m 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 139.24[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff737f4b6	< word : <literal>.[34;49m6[39;49m : value = 0x0000000000000006 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c849b8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c83258	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Bits.<< :: type expected : Integer  :: type recorded : Integer  : namespaces/compiler/x64.cft : 139.24
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<<[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 139.24
[34;49m ..  rm = 4 ; _reg = 0 ; } modRm = ( _mod [34;49m[33;40m<<[34;49m[34;49m 6  .. [34;49m[32;49m
0x7ffff72fd4e4    48b90600000000000000    mov rcx, 0x6                                           [34;49m[32;49m
0x7ffff72fd4ee    48d3e0                  shl rax, cl                                            [34;49m[32;49m
0x7ffff72fd4f1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd4f5    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.025 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    modRm = ( _mod << 6 [34;49m[33;40m)[34;49m[34;49m + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use[34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.028 : Int :> [33;40m+[34;49m <: cprimitive :> [34;49m    modRm = ( _mod << 6 ) [34;49m[33;40m+[34;49m[34;49m ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 bi[34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.029 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    modRm = ( _mod << 6 ) + [34;49m[33;40m([34;49m[34;49m ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 bits[34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.039 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c83b40 :> [34;49m    modRm = ( _mod << 6 ) + ( ( ( [34;49m[33;40m_reg[34;49m[34;49m Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; [34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 139.39
[34;49m .. = 0 ; } modRm = ( _mod << 6 ) + ( ( ( [34;49m[33;40m_reg[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4f8    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fd4fc    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd500    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.043 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49m    modRm = ( _mod << 6 ) + ( ( ( _reg [34;49m[33;40mBits[34;49m[34;49m.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.044 : Class :> [33;40m.[34;49m <: cprimitive :> [34;49m    modRm = ( _mod << 6 ) + ( ( ( _reg Bits[34;49m[33;40m.[34;49m[34;49m& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.046 : Bits :> [33;40m&[34;49m <: cprimitive :> [34;49m    modRm = ( _mod << 6 ) + ( ( ( _reg Bits.[34;49m[33;40m&[34;49m[34;49m 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 b[34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.050 : <literal> :> [33;40m0x7[34;49m <: 0x00007ffff737f6b1 :> [34;49mdRm = ( _mod << 6 ) + ( ( ( _reg Bits.& [34;49m[33;40m0x7[34;49m[34;49m ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // onl[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x7[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 139.50
[34;49m .. m = ( _mod << 6 ) + ( ( ( _reg Bits.& [34;49m[33;40m0x7[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd503    48b80700000000000000    mov rax, 0x7                                           [34;49m[32;49m
0x7ffff72fd50d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd511    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.050 : Bits :> [33;40m&[34;49m <: cprimitive :> [34;49m    modRm = ( _mod << 6 ) + ( ( ( _reg Bits.[34;49m[33;40m&[34;49m[34;49m 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 b[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 139.50[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff737f6b1	< word : <literal>.[34;49m0x7[39;49m : value = 0x0000000000000007 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c85468	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c84b80	< word : Bits.[34;49m<<[39;49m : value = 0x00005555555b7658 > : [34;49mInteger -> Integer [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c849b8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c83258	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Bits.& :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 139.50
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m&[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 139.50
[34;49m .. dRm = ( _mod << 6 ) + ( ( ( _reg Bits.[34;49m[33;40m&[34;49m[34;49m 0x7  .. [34;49m[32;49m
0x7ffff72fd4fc    48b90700000000000000    mov rcx, 0x7                                           [34;49m[32;49m
0x7ffff72fd506    4823c1                  and rax, rcx                                           [34;49m[32;49m
0x7ffff72fd509    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd50d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.051 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49mmodRm = ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 [34;49m[33;40m)[34;49m[34;49m << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 b[34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.055 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49modRm = ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) [34;49m[33;40m<<[34;49m[34;49m 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 bits [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.057 : <literal> :> [33;40m3[34;49m <: 0x00007ffff737f8ac :> [34;49m _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << [34;49m[33;40m3[34;49m[34;49m ) + ( rm Bits.& 0x7 ) ) ; // only use 3 b[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m3[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 139.57
[34;49m .. d << 6 ) + ( ( ( _reg Bits.& 0x7 ) << [34;49m[33;40m3[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd510    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fd51a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd51e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.057 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49modRm = ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) [34;49m[33;40m<<[34;49m[34;49m 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 bits [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 139.57[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff737f8ac	< word : <literal>.[34;49m3[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c85630	< word : Bits.[34;49m&[39;49m : value = 0x00005555555b743a > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c84b80	< word : Bits.[34;49m<<[39;49m : value = 0x00005555555b7658 > : [34;49mInteger -> Integer [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c849b8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c83258	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Bits.<< :: type expected : Integer  :: type recorded : Integer  : namespaces/compiler/x64.cft : 139.57
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<<[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 139.57
[34;49m .. _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) [34;49m[33;40m<<[34;49m[34;49m 3  .. [34;49m[32;49m
0x7ffff72fd509    48b90300000000000000    mov rcx, 0x3                                           [34;49m[32;49m
0x7ffff72fd513    48d3e0                  shl rax, cl                                            [34;49m[32;49m
0x7ffff72fd516    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd51a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.058 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 [34;49m[33;40m)[34;49m[34;49m + ( rm Bits.& 0x7 ) ) ; // only use 3 bits of [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.061 : Int :> [33;40m+[34;49m <: cprimitive :> [34;49m= ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) [34;49m[33;40m+[34;49m[34;49m ( rm Bits.& 0x7 ) ) ; // only use 3 bits of reg/[34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.062 : C :> [33;40m([34;49m <: cprimitive :> [34;49m ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + [34;49m[33;40m([34;49m[34;49m rm Bits.& 0x7 ) ) ; // only use 3 bits of reg/rm [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.066 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c83978 :> [34;49m6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( [34;49m[33;40mrm[34;49m[34;49m Bits.& 0x7 ) ) ; // only use 3 bits of re[34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 139.66
[34;49m ..  + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( [34;49m[33;40mrm[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd51d    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd521    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd525    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.070 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49m + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm [34;49m[33;40mBits[34;49m[34;49m.& 0x7 ) ) ; // only use 3 bits of reg/rm[34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.071 : Class :> [33;40m.[34;49m <: cprimitive :> [34;49mmod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits[34;49m[33;40m.[34;49m[34;49m& 0x7 ) ) ; // only use 3 bits of reg/rm [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.073 : Bits :> [33;40m&[34;49m <: cprimitive :> [34;49m_mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.[34;49m[33;40m&[34;49m[34;49m 0x7 ) ) ; // only use 3 bits of reg/rm [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.077 : <literal> :> [33;40m0x7[34;49m <: 0x00007ffff737faa7 :> [34;49m ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& [34;49m[33;40m0x7[34;49m[34;49m ) ) ; // only use 3 bits of reg/rm [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x7[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 139.77
[34;49m .. reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& [34;49m[33;40m0x7[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd528    48b80700000000000000    mov rax, 0x7                                           [34;49m[32;49m
0x7ffff72fd532    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd536    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.077 : Bits :> [33;40m&[34;49m <: cprimitive :> [34;49m_mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.[34;49m[33;40m&[34;49m[34;49m 0x7 ) ) ; // only use 3 bits of reg/rm [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 139.77[39;49m :
TypeWordStack depth =   7 :  = Top = 0x00007ffff7fc1a58, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a58 > = 0x00007ffff737faa7	< word : <literal>.[34;49m0x7[39;49m : value = 0x0000000000000007 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c860e0	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c85b88	< word : Bits.[34;49m<<[39;49m : value = 0x00005555555b7658 > : [34;49mInteger -> Integer [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c85630	< word : Bits.[34;49m&[39;49m : value = 0x00005555555b743a > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c84b80	< word : Bits.[34;49m<<[39;49m : value = 0x00005555555b7658 > : [34;49mInteger -> Integer [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c849b8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -6 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c83258	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Bits.& :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 139.77
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m&[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 139.77
[34;49m ..  _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.[34;49m[33;40m&[34;49m[34;49m 0x7  .. [34;49m[32;49m
0x7ffff72fd521    48b90700000000000000    mov rcx, 0x7                                           [34;49m[32;49m
0x7ffff72fd52b    4823c1                  and rax, rcx                                           [34;49m[32;49m
0x7ffff72fd52e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd532    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.078 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 [34;49m[33;40m)[34;49m[34;49m ) ; // only use 3 bits of reg/rm [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.078 : Int :> [33;40m+[34;49m <: cprimitive :> [34;49m= ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) [34;49m[33;40m+[34;49m[34;49m ( rm Bits.& 0x7 ) ) ; // only use 3 bits of reg/[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 139.78[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c86470	< word : Bits.[34;49m&[39;49m : value = 0x00005555555b743a > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c85b88	< word : Bits.[34;49m<<[39;49m : value = 0x00005555555b7658 > : [34;49mInteger -> Integer [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c85630	< word : Bits.[34;49m&[39;49m : value = 0x00005555555b743a > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c84b80	< word : Bits.[34;49m<<[39;49m : value = 0x00005555555b7658 > : [34;49mInteger -> Integer [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c849b8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c83258	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Int.+ :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 139.78
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m+[34;49m <:   21 bytes : at namespaces/compiler/x64.cft : 139.78
[34;49m ..  6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) [34;49m[33;40m+[34;49m[34;49m ( rm Bits.& 0x7 ) .. [34;49m[32;49m
0x7ffff72fd535    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fd538    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fd53c    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fd540    4803c1                  add rax, rcx                                           [34;49m[32;49m
0x7ffff72fd543    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd547    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.080 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) [34;49m[33;40m)[34;49m[34;49m ; // only use 3 bits of reg/rm [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.080 : Int :> [33;40m+[34;49m <: cprimitive :> [34;49m= ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) [34;49m[33;40m+[34;49m[34;49m ( rm Bits.& 0x7 ) ) ; // only use 3 bits of reg/[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 139.80[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c86800	< word : Int.[34;49m+[39;49m : value = 0x00005555555b785f > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c85630	< word : Bits.[34;49m&[39;49m : value = 0x00005555555b743a > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c84b80	< word : Bits.[34;49m<<[39;49m : value = 0x00005555555b7658 > : [34;49mInteger -> Integer [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c849b8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c83258	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Int.+ :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 139.80
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m+[34;49m <:   21 bytes : at namespaces/compiler/x64.cft : 139.80
[34;49m ..  6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) [34;49m[33;40m+[34;49m[34;49m ( rm Bits.& 0x7 ) ) .. [34;49m[32;49m
0x7ffff72fd54a    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fd54d    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fd551    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fd555    4803c1                  add rax, rcx                                           [34;49m[32;49m
0x7ffff72fd558    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd55c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.083 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    modRm [34;49m[33;40m=[34;49m[34;49m ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 139.83[39;49m :
TypeWordStack depth =   4 :  = Top = 0x00007ffff7fc1a40, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c86d58	< word : Int.[34;49m+[39;49m : value = 0x00005555555b785f > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c84b80	< word : Bits.[34;49m<<[39;49m : value = 0x00005555555b7658 > : [34;49mInteger -> Integer [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c849b8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c83258	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 139.83
dbg[c]  :: [34;49m...[34;49m : 139.083 : locals_0 :> [33;40mmodRm[34;49m <: 0x00007ffff5c870e8 :> [34;49m    [34;49m[33;40mmodRm[34;49m[34;49m = ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ;[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mmodRm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 139.83
[34;49m ..  } if ( sib ) { rm = 4 ; _reg = 0 ; } [34;49m[33;40mmodRm[34;49m[34;49m = ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ;  .. [34;49m[32;49m
0x7ffff72fd55f    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd563    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd567    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.083 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    modRm [34;49m[33;40m=[34;49m[34;49m ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 139.83[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c870e8	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c849b8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c83258	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Undefined . Undefined  : namespaces/compiler/x64.cft : 139.83
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 139.83
[34;49m .. ( sib ) { rm = 4 ; _reg = 0 ; } modRm [34;49m[33;40m=[34;49m[34;49m ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ;  .. [34;49m[32;49m
0x7ffff72fd558    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd55c    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.083 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) [34;49m[33;40m;[34;49m[34;49m // only use 3 bits of reg/rm [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.085 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; [34;49m[33;40m//[34;49m[34;49m only use 3 bits of reg/rm [34;49m 
dbg[c]  :: [34;49m...[34;49m : 140.011 : Compiler :> [33;40mreturn[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mreturn[34;49m[34;49m modRm ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 140.019 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    return modRm [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 141.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 141.2
[34;49m ..  0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; [34;49m[33;40mreturn[34;49m[34;49m modRm ; }  .. [34;49m[32;49m
0x7ffff72fd55f    498b4708                mov rax, [r15+0x8]                                     [34;49m
[34;49m ..  ( rm Bits.& 0x7 ) ) ; return modRm ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd563    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fd567    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd56b    4983ee20                sub r14, 0x20                                          [34;49m
[34;49m .. << 3 ) + ( rm Bits.& 0x7 ) ) ; return [34;49m[33;40mmodRm[34;49m[34;49m ; }  .. [34;49m[32;49m
0x7ffff72fd56f    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fd572    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 141.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 141.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 143.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m'CalculateModRmByte find wdiss apause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 160.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif 0 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 160.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m 0 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 160.006 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cf78f8 :> [34;49m#if [34;49m[33;40m0[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 160.6 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 210.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 212.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_ImmDispData ( immDisp, immSize, forceFlag ) {  .. [34;49m[32;49m
0x7ffff72fd573    e900000000              jmp 0x7ffff72fd578         	< C compiler code >        [34;49m[32;49m
0x7ffff72fd578    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd57c    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd580    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 212.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c87808[34;49m.
dbg[c]  :: [34;49m...[34;49m : 213.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49m the opcode probably is all that needs to be adjusted for this to not be necessary [34;49m 
dbg[c]  :: [34;49m...[34;49m : 215.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( immSize > 0 ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 215.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m immSize > 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 215.8
[34;49m ..  ( immDisp, immSize, forceFlag ) { if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fd587    e900000000              jmp 0x7ffff72fd58c         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 215.017 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c872b0 :> [34;49m    if ( [34;49m[33;40mimmSize[34;49m[34;49m > 0 ) [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 215.17
[34;49m ..  immDisp, immSize, forceFlag ) { if ( [34;49m[33;40mimmSize[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd58c    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd590    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd594    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 215.019 : Logic :> [33;40m>[34;49m <: cprimitive :> [34;49m    if ( immSize [34;49m[33;40m>[34;49m[34;49m 0 ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 215.021 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c86f20 :> [34;49m    if ( immSize > [34;49m[33;40m0[34;49m[34;49m ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 215.21
[34;49m .. immSize, forceFlag ) { if ( immSize > [34;49m[33;40m0[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd597    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fd5a1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd5a5    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 215.021 : Logic :> [33;40m>[34;49m <: cprimitive :> [34;49m    if ( immSize [34;49m[33;40m>[34;49m[34;49m 0 ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 215.21[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c86f20	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c872b0	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.> :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 215.21
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m>[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 215.21
[34;49m .. , immSize, forceFlag ) { if ( immSize [34;49m[33;40m>[34;49m[34;49m 0 [34;49m[32;49m
0x7ffff72fd590    48b90000000000000000    mov rcx, 0x0                                           [34;49m[32;49m
0x7ffff72fd59a    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd59d    0f9fc0                  setg al                                                [34;49m[32;49m
0x7ffff72fd5a0    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd5a4    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd5a8    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 215.022 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( immSize > 0 [34;49m[33;40m)[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 215.22
[34;49m .. mSize, forceFlag ) { if ( immSize > 0 [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd5ab    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 215.22 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd58c[34;49m.
dbg[c]  :: [34;49m...[34;49m : 216.006 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 216.6
[34;49m .. ize, forceFlag ) { if ( immSize > 0 ) [34;49m[33;40m{[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd5ac    e900000000              jmp 0x7ffff72fd5b1         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 217.011 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m        [34;49m[33;40mif[34;49m[34;49m ( immSize == BYTE ) compile1 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 217.012 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m        if [34;49m[33;40m([34;49m[34;49m immSize == BYTE ) compile1 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 217.12
[34;49m .. forceFlag ) { if ( immSize > 0 ) { if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fd5b1    e900000000              jmp 0x7ffff72fd5b6         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 217.021 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c872b0 :> [34;49m        if ( [34;49m[33;40mimmSize[34;49m[34;49m == BYTE ) compile1 (immDisp)  ; [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 217.21
[34;49m .. rceFlag ) { if ( immSize > 0 ) { if ( [34;49m[33;40mimmSize[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd5b6    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd5ba    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd5be    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 217.024 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m        if ( immSize [34;49m[33;40m==[34;49m[34;49m BYTE ) compile1 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 217.029 : X64 :> [33;40mBYTE[34;49m <: 0x00007ffff5c7ce60 :> [34;49m        if ( immSize == [34;49m[33;40mBYTE[34;49m[34;49m ) compile1 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mBYTE[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 217.29
[34;49m ..  if ( immSize > 0 ) { if ( immSize == [34;49m[33;40mBYTE[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd5c1    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd5cb    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd5cf    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 217.029 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m        if ( immSize [34;49m[33;40m==[34;49m[34;49m BYTE ) compile1 (immDisp)  ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 217.29[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c7ce60	< word : X64.[34;49mBYTE[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c860e0	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Logic.== :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 217.29
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m==[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 217.29
[34;49m .. ) { if ( immSize > 0 ) { if ( immSize [34;49m[33;40m==[34;49m[34;49m BYTE [34;49m[32;49m
0x7ffff72fd5ba    48b90100000000000000    mov rcx, 0x1                                           [34;49m[32;49m
0x7ffff72fd5c4    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd5c7    0f94c0                  setz al                                                [34;49m[32;49m
0x7ffff72fd5ca    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd5ce    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd5d2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 217.030 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m        if ( immSize == BYTE [34;49m[33;40m)[34;49m[34;49m compile1 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 217.30
[34;49m ..  immSize > 0 ) { if ( immSize == BYTE [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd5d5    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 217.30 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd5b6[34;49m.
dbg[c]  :: [34;49m...[34;49m : 217.040 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m        if ( immSize == BYTE ) [34;49m[33;40m{[34;49m[34;49mompile1 (immDisp)  ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 217.40
[34;49m .. immSize > 0 ) { if ( immSize == BYTE )[34;49m[33;40m{[34;49m[34;49mcompile1 [34;49m[32;49m
0x7ffff72fd5d6    e900000000              jmp 0x7ffff72fd5db         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 217.040 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m        if ( immSize == BYTE ) [34;49m[33;40mcompile1[34;49m[34;49m (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 217.048 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c87478 :> [34;49m        if ( immSize == BYTE ) compile1 ([34;49m[33;40mimmDisp[34;49m[34;49m)  ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 217.48
[34;49m ..  ) { if ( immSize == BYTE ) compile1 ([34;49m[33;40mimmDisp[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd5db    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd5df    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd5e3    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 217.049 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m        if ( immSize == BYTE ) [34;49m[33;40mcompile1[34;49m[34;49m (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile1[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 217.49
[34;49m .. mmSize > 0 ) { if ( immSize == BYTE ) [34;49m[33;40mcompile1[34;49m[34;49m (immDisp)[34;49m[32;49m
0x7ffff72fd5e6    49b87da85b5555550000    mov r8, 0x5555555ba87d                                 [34;49m[32;49m
0x7ffff72fd5f0    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd5fa    49ffd1                  call r9                    	< Asm.[39;49mcompile1[34;49m : 0x00005555555ba87d >[34;49m
dbg[c]  :: [34;49m...[34;49m : 217.053 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m        if ( immSize == BYTE ) compile1 (immDisp)  [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 217.53
[34;49m ..  immSize == BYTE ) compile1 (immDisp) [34;49m[33;40m;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd5fd    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 217.53 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd5db[34;49m.
dbg[c]  :: [34;49m...[34;49m : 219.010 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m        [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 219.10
[34;49m .. == BYTE ) compile1 (immDisp) ;  else  [34;49m[33;40m{[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd5fe    e900000000              jmp 0x7ffff72fd603         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 220.015 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m            [34;49m[33;40mif[34;49m[34;49m ( immSize == 4 ) compile4 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 220.016 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m            if [34;49m[33;40m([34;49m[34;49m immSize == 4 ) compile4 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 220.16
[34;49m .. E ) compile1 (immDisp) ;  else  {  if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fd603    e900000000              jmp 0x7ffff72fd608         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 220.025 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c872b0 :> [34;49m            if ( [34;49m[33;40mimmSize[34;49m[34;49m == 4 ) compile4 (immDisp)  ; [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 220.25
[34;49m .. ) compile1 (immDisp) ;  else  {  if ( [34;49m[33;40mimmSize[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd608    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd60c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd610    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 220.028 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m            if ( immSize [34;49m[33;40m==[34;49m[34;49m 4 ) compile4 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 220.030 : <literal> :> [33;40m4[34;49m <: 0x00007ffff5c84d48 :> [34;49m            if ( immSize == [34;49m[33;40m4[34;49m[34;49m ) compile4 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m4[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 220.30
[34;49m .. (immDisp) ;  else  {  if ( immSize == [34;49m[33;40m4[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd613    48b80400000000000000    mov rax, 0x4                                           [34;49m[32;49m
0x7ffff72fd61d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd621    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 220.030 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m            if ( immSize [34;49m[33;40m==[34;49m[34;49m 4 ) compile4 (immDisp)  ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 220.30[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c84d48	< word : <literal>.[34;49m4[39;49m : value = 0x0000000000000004 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c84f10	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Logic.== :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 220.30
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m==[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 220.30
[34;49m .. e1 (immDisp) ;  else  {  if ( immSize [34;49m[33;40m==[34;49m[34;49m 4 [34;49m[32;49m
0x7ffff72fd60c    48b90400000000000000    mov rcx, 0x4                                           [34;49m[32;49m
0x7ffff72fd616    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd619    0f94c0                  setz al                                                [34;49m[32;49m
0x7ffff72fd61c    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd620    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd624    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 220.031 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m            if ( immSize == 4 [34;49m[33;40m)[34;49m[34;49m compile4 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 220.31
[34;49m .. mmDisp) ;  else  {  if ( immSize == 4 [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd627    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 220.31 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd608[34;49m.
dbg[c]  :: [34;49m...[34;49m : 220.041 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m            if ( immSize == 4 ) [34;49m[33;40m{[34;49m[34;49mompile4 (immDisp)  ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 220.41
[34;49m .. mDisp) ;  else  {  if ( immSize == 4 )[34;49m[33;40m{[34;49m[34;49mcompile4  .. [34;49m[32;49m
0x7ffff72fd628    e900000000              jmp 0x7ffff72fd62d         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 220.041 : Asm :> [33;40mcompile4[34;49m <: cprimitive :> [34;49m            if ( immSize == 4 ) [34;49m[33;40mcompile4[34;49m[34;49m (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 220.049 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c87478 :> [34;49m            if ( immSize == 4 ) compile4 ([34;49m[33;40mimmDisp[34;49m[34;49m)  ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 220.49
[34;49m .. lse  {  if ( immSize == 4 ) compile4 ([34;49m[33;40mimmDisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd62d    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd631    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd635    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 220.050 : Asm :> [33;40mcompile4[34;49m <: cprimitive :> [34;49m            if ( immSize == 4 ) [34;49m[33;40mcompile4[34;49m[34;49m (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile4[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 220.50
[34;49m .. Disp) ;  else  {  if ( immSize == 4 ) [34;49m[33;40mcompile4[34;49m[34;49m (immDisp) .. [34;49m[32;49m
0x7ffff72fd638    49b819a85b5555550000    mov r8, 0x5555555ba819                                 [34;49m[32;49m
0x7ffff72fd642    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd64c    49ffd1                  call r9                    	< Asm.[39;49mcompile4[34;49m : 0x00005555555ba819 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 220.054 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m            if ( immSize == 4 ) compile4 (immDisp)  [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 220.54
[34;49m .. f ( immSize == 4 ) compile4 (immDisp) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd64f    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 220.54 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd62d[34;49m.
dbg[c]  :: [34;49m...[34;49m : 221.020 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m            else [34;49m[33;40m{[34;49m[34;49mf ( immSize == CELL ) compile8 (immDisp) ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 221.20
[34;49m .. ize == 4 ) compile4 (immDisp) ;  else [34;49m[33;40m{[34;49m[34;49mf  .. [34;49m[32;49m
0x7ffff72fd650    e900000000              jmp 0x7ffff72fd655         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 221.020 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m            else [34;49m[33;40mif[34;49m[34;49m ( immSize == CELL ) compile8 (immDisp) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 221.021 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m            else if [34;49m[33;40m([34;49m[34;49m immSize == CELL ) compile8 (immDisp) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 221.21
[34;49m ..  == 4 ) compile4 (immDisp) ;  else if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd655    e900000000              jmp 0x7ffff72fd65a         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 221.030 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c872b0 :> [34;49m            else if ( [34;49m[33;40mimmSize[34;49m[34;49m == CELL ) compile8 (immDisp) ; [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 221.30
[34;49m .. = 4 ) compile4 (immDisp) ;  else if ( [34;49m[33;40mimmSize[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd65a    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd65e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd662    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 221.033 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m            else if ( immSize [34;49m[33;40m==[34;49m[34;49m CELL ) compile8 (immDisp) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 221.038 : X64 :> [33;40mCELL[34;49m <: 0x00007ffff5c7d028 :> [34;49m            else if ( immSize == [34;49m[33;40mCELL[34;49m[34;49m ) compile8 (immDisp) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCELL[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 221.38
[34;49m .. le4 (immDisp) ;  else if ( immSize == [34;49m[33;40mCELL[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd665    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fd66f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd673    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 221.038 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m            else if ( immSize [34;49m[33;40m==[34;49m[34;49m CELL ) compile8 (immDisp) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 221.38[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c7d028	< word : X64.[34;49mCELL[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c80eb8	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Logic.== :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 221.38
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m==[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 221.38
[34;49m .. mpile4 (immDisp) ;  else if ( immSize [34;49m[33;40m==[34;49m[34;49m CELL  .. [34;49m[32;49m
0x7ffff72fd65e    48b90800000000000000    mov rcx, 0x8                                           [34;49m[32;49m
0x7ffff72fd668    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd66b    0f94c0                  setz al                                                [34;49m[32;49m
0x7ffff72fd66e    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd672    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd676    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 221.039 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m            else if ( immSize == CELL [34;49m[33;40m)[34;49m[34;49m compile8 (immDisp) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 221.39
[34;49m .. immDisp) ;  else if ( immSize == CELL [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd679    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 221.39 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd65a[34;49m.
dbg[c]  :: [34;49m...[34;49m : 221.049 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m            else if ( immSize == CELL ) [34;49m[33;40m{[34;49m[34;49mompile8 (immDisp) ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 221.49
[34;49m .. mmDisp) ;  else if ( immSize == CELL )[34;49m[33;40m{[34;49m[34;49mcompile8  .. [34;49m[32;49m
0x7ffff72fd67a    e900000000              jmp 0x7ffff72fd67f         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 221.049 : Asm :> [33;40mcompile8[34;49m <: cprimitive :> [34;49m            else if ( immSize == CELL ) [34;49m[33;40mcompile8[34;49m[34;49m (immDisp) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 221.057 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c87478 :> [34;49m            else if ( immSize == CELL ) compile8 ([34;49m[33;40mimmDisp[34;49m[34;49m) ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 221.57
[34;49m .. else if ( immSize == CELL ) compile8 ([34;49m[33;40mimmDisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd67f    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd683    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd687    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 221.058 : Asm :> [33;40mcompile8[34;49m <: cprimitive :> [34;49m            else if ( immSize == CELL ) [34;49m[33;40mcompile8[34;49m[34;49m (immDisp) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile8[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 221.58
[34;49m .. mDisp) ;  else if ( immSize == CELL ) [34;49m[33;40mcompile8[34;49m[34;49m (immDisp) .. [34;49m[32;49m
0x7ffff72fd68a    49b8f2a75b5555550000    mov r8, 0x5555555ba7f2                                 [34;49m[32;49m
0x7ffff72fd694    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd69e    49ffd1                  call r9                    	< Asm.[39;49mcompile8[34;49m : 0x00005555555ba7f2 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 221.061 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m            else if ( immSize == CELL ) compile8 (immDisp) [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 221.61
[34;49m ..  immSize == CELL ) compile8 (immDisp) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd6a1    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 221.61 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd67f[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 222.10[34;49m :
DataStack depth =  10 : Dsp (R14) = Top = 0x00007ffff7269248, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269248 > = 0x00007ffff72fd62d	
  DataStack   [  -1 ] < 0x00007ffff7269240 > = 0x00007ffff72fd608	
  DataStack   [  -2 ] < 0x00007ffff7269238 > = 0x00007ffff72fd5db	
  DataStack   [  -3 ] < 0x00007ffff7269230 > = 0x00007ffff72fd5b6	
  DataStack   [  -4 ] < 0x00007ffff7269228 > = 0x00007ffff72fd58c	
  DataStack   [  -5 ] < 0x00007ffff7269220 > = 0x00007ffff5c87808	< word : void.[39;49m_Compile_ImmDispData[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -6 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -7 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -8 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -9 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 222.010 : Reserved :> [33;40m}[34;49m <: cprimitive :> [34;49m        [34;49m[33;40m}[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 222.10
[34;49m .. mSize == CELL ) compile8 (immDisp) ;  [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd68e    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 222.10 :> [39;49m}[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd655[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 222.10[34;49m :
DataStack depth =   8 : Dsp (R14) = Top = 0x00007ffff7269238, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269238 > = 0x00007ffff72fd5db	
  DataStack   [  -1 ] < 0x00007ffff7269230 > = 0x00007ffff72fd5b6	
  DataStack   [  -2 ] < 0x00007ffff7269228 > = 0x00007ffff72fd58c	
  DataStack   [  -3 ] < 0x00007ffff7269220 > = 0x00007ffff5c87808	< word : void.[39;49m_Compile_ImmDispData[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -4 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -5 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -6 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -7 ] < 0x00007ffff7269200 > = 0x0000000000000005	
DataStack at : [39;49mnamespaces/compiler/x64.cft : 222.10[34;49m :
DataStack depth =   6 : Dsp (R14) = Top = 0x00007ffff7269228, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269228 > = 0x00007ffff72fd58c	
  DataStack   [  -1 ] < 0x00007ffff7269220 > = 0x00007ffff5c87808	< word : void.[39;49m_Compile_ImmDispData[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -2 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -5 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 224.011 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    else [34;49m[33;40m//[34;49m[34;49m with operandSize == 0 let the compiler use the minimal size ; nb. can't be imm[34;49m 
dbg[c]  :: [34;49m...[34;49m : 225.006 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 225.6
[34;49m .. ELL ) compile8 (immDisp) ;  }  } else [34;49m[33;40m{[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd667    e900000000              jmp 0x7ffff72fd66c         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 226.011 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m        [34;49m[33;40mif[34;49m[34;49m ( immDisp >= 0x100000000 ) compile8 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 226.012 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m        if [34;49m[33;40m([34;49m[34;49m immDisp >= 0x100000000 ) compile8 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 226.12
[34;49m ..  compile8 (immDisp) ;  }  } else { if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd66c    e900000000              jmp 0x7ffff72fd671         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 226.021 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c87478 :> [34;49m        if ( [34;49m[33;40mimmDisp[34;49m[34;49m >= 0x100000000 ) compile8 (immDisp)  ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 226.21
[34;49m .. ompile8 (immDisp) ;  }  } else { if ( [34;49m[33;40mimmDisp[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd671    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd675    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd679    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 226.024 : Logic :> [33;40m>=[34;49m <: cprimitive :> [34;49m        if ( immDisp [34;49m[33;40m>=[34;49m[34;49m 0x100000000 ) compile8 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 226.036 : <literal> :> [33;40m0x100000000[34;49m <: 0x00007ffff737fe07 :> [34;49m        if ( immDisp >= [34;49m[33;40m0x100000000[34;49m[34;49m ) compile8 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x100000000[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 226.36
[34;49m .. mDisp) ;  }  } else { if ( immDisp >= [34;49m[33;40m0x100000000[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd67c    48b80000000001000000    mov rax, 0x100000000                                   [34;49m[32;49m
0x7ffff72fd686    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd68a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 226.036 : Logic :> [33;40m>=[34;49m <: cprimitive :> [34;49m        if ( immDisp [34;49m[33;40m>=[34;49m[34;49m 0x100000000 ) compile8 (immDisp)  ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 226.36[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737fe07	< word : <literal>.[34;49m0x100000000[39;49m : value = 0x0000000100000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c87bd0	< word : locals_0.[34;49mimmDisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.>= :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 226.36
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m>=[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 226.36
[34;49m .. (immDisp) ;  }  } else { if ( immDisp [34;49m[33;40m>=[34;49m[34;49m 0x100000000  .. [34;49m[32;49m
0x7ffff72fd675    48b90000000001000000    mov rcx, 0x100000000                                   [34;49m[32;49m
0x7ffff72fd67f    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd682    0f9dc0                  setge al                                               [34;49m[32;49m
0x7ffff72fd685    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd689    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd68d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 226.037 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m        if ( immDisp >= 0x100000000 [34;49m[33;40m)[34;49m[34;49m compile8 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 226.37
[34;49m ..  } else { if ( immDisp >= 0x100000000 [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd690    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 226.37 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd671[34;49m.
dbg[c]  :: [34;49m...[34;49m : 226.047 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m        if ( immDisp >= 0x100000000 ) [34;49m[33;40m{[34;49m[34;49mompile8 (immDisp)  ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 226.47
[34;49m .. } else { if ( immDisp >= 0x100000000 )[34;49m[33;40m{[34;49m[34;49mcompile8  .. [34;49m[32;49m
0x7ffff72fd691    e900000000              jmp 0x7ffff72fd696         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 226.047 : Asm :> [33;40mcompile8[34;49m <: cprimitive :> [34;49m        if ( immDisp >= 0x100000000 ) [34;49m[33;40mcompile8[34;49m[34;49m (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 226.055 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c87478 :> [34;49m        if ( immDisp >= 0x100000000 ) compile8 ([34;49m[33;40mimmDisp[34;49m[34;49m)  ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 226.55
[34;49m ..  ( immDisp >= 0x100000000 ) compile8 ([34;49m[33;40mimmDisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd696    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd69a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd69e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 226.056 : Asm :> [33;40mcompile8[34;49m <: cprimitive :> [34;49m        if ( immDisp >= 0x100000000 ) [34;49m[33;40mcompile8[34;49m[34;49m (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile8[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 226.56
[34;49m ..  else { if ( immDisp >= 0x100000000 ) [34;49m[33;40mcompile8[34;49m[34;49m (immDisp) .. [34;49m[32;49m
0x7ffff72fd6a1    49b8f2a75b5555550000    mov r8, 0x5555555ba7f2                                 [34;49m[32;49m
0x7ffff72fd6ab    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd6b5    49ffd1                  call r9                    	< Asm.[39;49mcompile8[34;49m : 0x00005555555ba7f2 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 226.060 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m        if ( immDisp >= 0x100000000 ) compile8 (immDisp)  [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 226.60
[34;49m .. p >= 0x100000000 ) compile8 (immDisp) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd6b8    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 226.60 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd696[34;49m.
dbg[c]  :: [34;49m...[34;49m : 228.010 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m        [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 228.10
[34;49m .. 00000000 ) compile8 (immDisp) ; else  [34;49m[33;40m{[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd6b9    e900000000              jmp 0x7ffff72fd6be         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 229.015 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m            [34;49m[33;40mif[34;49m[34;49m ( immDisp >= 0x100 ) compile4 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 229.016 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m            if [34;49m[33;40m([34;49m[34;49m immDisp >= 0x100 ) compile4 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 229.16
[34;49m .. 000 ) compile8 (immDisp) ; else  { if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd6be    e900000000              jmp 0x7ffff72fd6c3         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 229.025 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c87478 :> [34;49m            if ( [34;49m[33;40mimmDisp[34;49m[34;49m >= 0x100 ) compile4 (immDisp)  ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 229.25
[34;49m .. 0 ) compile8 (immDisp) ; else  { if ( [34;49m[33;40mimmDisp[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd6c3    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd6c7    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd6cb    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 229.028 : Logic :> [33;40m>=[34;49m <: cprimitive :> [34;49m            if ( immDisp [34;49m[33;40m>=[34;49m[34;49m 0x100 ) compile4 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 229.034 : <literal> :> [33;40m0x100[34;49m <: 0x00007ffff7380002 :> [34;49m            if ( immDisp >= [34;49m[33;40m0x100[34;49m[34;49m ) compile4 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x100[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 229.34
[34;49m .. 8 (immDisp) ; else  { if ( immDisp >= [34;49m[33;40m0x100[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd6ce    48b80001000000000000    mov rax, 0x100                                         [34;49m[32;49m
0x7ffff72fd6d8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd6dc    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 229.034 : Logic :> [33;40m>=[34;49m <: cprimitive :> [34;49m            if ( immDisp [34;49m[33;40m>=[34;49m[34;49m 0x100 ) compile4 (immDisp)  ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 229.34[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff7380002	< word : <literal>.[34;49m0x100[39;49m : value = 0x0000000000000100 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c88da0	< word : locals_0.[34;49mimmDisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.>= :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 229.34
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m>=[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 229.34
[34;49m .. ile8 (immDisp) ; else  { if ( immDisp [34;49m[33;40m>=[34;49m[34;49m 0x100  .. [34;49m[32;49m
0x7ffff72fd6c7    48b90001000000000000    mov rcx, 0x100                                         [34;49m[32;49m
0x7ffff72fd6d1    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd6d4    0f9dc0                  setge al                                               [34;49m[32;49m
0x7ffff72fd6d7    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd6db    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd6df    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 229.035 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m            if ( immDisp >= 0x100 [34;49m[33;40m)[34;49m[34;49m compile4 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 229.35
[34;49m .. Disp) ; else  { if ( immDisp >= 0x100 [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd6e2    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 229.35 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd6c3[34;49m.
dbg[c]  :: [34;49m...[34;49m : 229.045 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m            if ( immDisp >= 0x100 ) [34;49m[33;40m{[34;49m[34;49mompile4 (immDisp)  ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 229.45
[34;49m .. isp) ; else  { if ( immDisp >= 0x100 )[34;49m[33;40m{[34;49m[34;49mcompile4  .. [34;49m[32;49m
0x7ffff72fd6e3    e900000000              jmp 0x7ffff72fd6e8         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 229.045 : Asm :> [33;40mcompile4[34;49m <: cprimitive :> [34;49m            if ( immDisp >= 0x100 ) [34;49m[33;40mcompile4[34;49m[34;49m (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 229.053 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c87478 :> [34;49m            if ( immDisp >= 0x100 ) compile4 ([34;49m[33;40mimmDisp[34;49m[34;49m)  ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 229.53
[34;49m ..   { if ( immDisp >= 0x100 ) compile4 ([34;49m[33;40mimmDisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd6e8    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd6ec    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd6f0    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 229.054 : Asm :> [33;40mcompile4[34;49m <: cprimitive :> [34;49m            if ( immDisp >= 0x100 ) [34;49m[33;40mcompile4[34;49m[34;49m (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile4[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 229.54
[34;49m .. sp) ; else  { if ( immDisp >= 0x100 ) [34;49m[33;40mcompile4[34;49m[34;49m (immDisp) .. [34;49m[32;49m
0x7ffff72fd6f3    49b819a85b5555550000    mov r8, 0x5555555ba819                                 [34;49m[32;49m
0x7ffff72fd6fd    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd707    49ffd1                  call r9                    	< Asm.[39;49mcompile4[34;49m : 0x00005555555ba819 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 229.058 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m            if ( immDisp >= 0x100 ) compile4 (immDisp)  [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 229.58
[34;49m .. immDisp >= 0x100 ) compile4 (immDisp) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd70a    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 229.58 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd6e8[34;49m.
dbg[c]  :: [34;49m...[34;49m : 230.020 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m            else [34;49m[33;40m{[34;49m[34;49mf ( immDisp || forceFlag ) compile1 (immDisp)  ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 230.20
[34;49m ..  >= 0x100 ) compile4 (immDisp) ; else [34;49m[33;40m{[34;49m[34;49mf  .. [34;49m[32;49m
0x7ffff72fd70b    e900000000              jmp 0x7ffff72fd710         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 230.020 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m            else [34;49m[33;40mif[34;49m[34;49m ( immDisp || forceFlag ) compile1 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 230.021 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m            else if [34;49m[33;40m([34;49m[34;49m immDisp || forceFlag ) compile1 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 230.21
[34;49m ..  0x100 ) compile4 (immDisp) ; else if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd710    e900000000              jmp 0x7ffff72fd715         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 230.030 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c87478 :> [34;49m            else if ( [34;49m[33;40mimmDisp[34;49m[34;49m || forceFlag ) compile1 (immDisp)  ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 230.30
[34;49m .. x100 ) compile4 (immDisp) ; else if ( [34;49m[33;40mimmDisp[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd715    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd719    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd71d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 230.033 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m            else if ( immDisp [34;49m[33;40m||[34;49m[34;49m forceFlag ) compile1 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 230.043 : locals_0 :> [33;40mforceFlag[34;49m <: 0x00007ffff5c870e8 :> [34;49m            else if ( immDisp || [34;49m[33;40mforceFlag[34;49m[34;49m ) compile1 (immDisp)  ; [34;49m 
_Do_C_Syntax_Variable : word = forceFlag :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mforceFlag[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 230.43
[34;49m .. ile4 (immDisp) ; else if ( immDisp || [34;49m[33;40mforceFlag[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd720    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fd724    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd728    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 230.043 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m            else if ( immDisp [34;49m[33;40m||[34;49m[34;49m forceFlag ) compile1 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m||[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 230.43
[34;49m .. ompile4 (immDisp) ; else if ( immDisp [34;49m[33;40m||[34;49m[34;49m forceFlag  .. [34;49m[32;49m
0x7ffff72fd719    498b4ff8                mov rcx, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fd71d    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fd720    4885c0                  test rax, rax                                          [34;49m[32;49m
0x7ffff72fd723    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd727    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 230.044 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m            else if ( immDisp || forceFlag [34;49m[33;40m)[34;49m[34;49m compile1 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 230.44
[34;49m .. isp) ; else if ( immDisp || forceFlag [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd72a    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 230.44 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd715[34;49m.
dbg[c]  :: [34;49m...[34;49m : 230.054 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m            else if ( immDisp || forceFlag ) [34;49m[33;40m{[34;49m[34;49mompile1 (immDisp)  ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 230.54
[34;49m .. sp) ; else if ( immDisp || forceFlag )[34;49m[33;40m{[34;49m[34;49mcompile1  .. [34;49m[32;49m
0x7ffff72fd72b    e900000000              jmp 0x7ffff72fd730         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 230.054 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m            else if ( immDisp || forceFlag ) [34;49m[33;40mcompile1[34;49m[34;49m (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 230.062 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c87478 :> [34;49m            else if ( immDisp || forceFlag ) compile1 ([34;49m[33;40mimmDisp[34;49m[34;49m)  ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 230.62
[34;49m .. if ( immDisp || forceFlag ) compile1 ([34;49m[33;40mimmDisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd730    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd734    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd738    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 230.063 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m            else if ( immDisp || forceFlag ) [34;49m[33;40mcompile1[34;49m[34;49m (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile1[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 230.63
[34;49m .. p) ; else if ( immDisp || forceFlag ) [34;49m[33;40mcompile1[34;49m[34;49m (immDisp) .. [34;49m[32;49m
0x7ffff72fd73b    49b87da85b5555550000    mov r8, 0x5555555ba87d                                 [34;49m[32;49m
0x7ffff72fd745    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd74f    49ffd1                  call r9                    	< Asm.[39;49mcompile1[34;49m : 0x00005555555ba87d >[34;49m
dbg[c]  :: [34;49m...[34;49m : 230.067 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m            else if ( immDisp || forceFlag ) compile1 (immDisp)  [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 230.67
[34;49m .. isp || forceFlag ) compile1 (immDisp) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd752    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 230.67 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd730[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 231.10[34;49m :
DataStack depth =  11 : Dsp (R14) = Top = 0x00007ffff7269250, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269250 > = 0x00007ffff72fd6e8	
  DataStack   [  -1 ] < 0x00007ffff7269248 > = 0x00007ffff72fd6c3	
  DataStack   [  -2 ] < 0x00007ffff7269240 > = 0x00007ffff72fd696	
  DataStack   [  -3 ] < 0x00007ffff7269238 > = 0x00007ffff72fd671	
  DataStack   [  -4 ] < 0x00007ffff7269230 > = 0x00007ffff72fd5b1	
  DataStack   [  -5 ] < 0x00007ffff7269228 > = 0x00007ffff72fd58c	
  DataStack   [  -6 ] < 0x00007ffff7269220 > = 0x00007ffff5c87808	< word : void.[39;49m_Compile_ImmDispData[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -7 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -8 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -9 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [ -10 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 231.010 : Reserved :> [33;40m}[34;49m <: cprimitive :> [34;49m        [34;49m[33;40m}[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 231.10
[34;49m .. p || forceFlag ) compile1 (immDisp) ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd746    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 231.10 :> [39;49m}[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd710[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 231.10[34;49m :
DataStack depth =   9 : Dsp (R14) = Top = 0x00007ffff7269240, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269240 > = 0x00007ffff72fd696	
  DataStack   [  -1 ] < 0x00007ffff7269238 > = 0x00007ffff72fd671	
  DataStack   [  -2 ] < 0x00007ffff7269230 > = 0x00007ffff72fd5b1	
  DataStack   [  -3 ] < 0x00007ffff7269228 > = 0x00007ffff72fd58c	
  DataStack   [  -4 ] < 0x00007ffff7269220 > = 0x00007ffff5c87808	< word : void.[39;49m_Compile_ImmDispData[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -5 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -6 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -7 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -8 ] < 0x00007ffff7269200 > = 0x0000000000000005	
DataStack at : [39;49mnamespaces/compiler/x64.cft : 231.10[34;49m :
DataStack depth =   7 : Dsp (R14) = Top = 0x00007ffff7269230, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269230 > = 0x00007ffff72fd5b1	
  DataStack   [  -1 ] < 0x00007ffff7269228 > = 0x00007ffff72fd58c	
  DataStack   [  -2 ] < 0x00007ffff7269220 > = 0x00007ffff5c87808	< word : void.[39;49m_Compile_ImmDispData[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -3 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -5 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -6 ] < 0x00007ffff7269200 > = 0x0000000000000005	
DataStack at : [39;49mnamespaces/compiler/x64.cft : 232.6[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c87808	< word : void.[39;49m_Compile_ImmDispData[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[i]  :: [34;49m...[34;49m : 233.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 234.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m'_Compile_ImmDispData find wdiss pause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 235.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mendif [34;49m 
dbg[i]  :: [34;49m...[34;49m : 235.007 : PreProcessor :> [33;40mendif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mendif[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 237.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m Intel - InstructionSet-A-M-253666.pdf - section 2.1 : [34;49m 
dbg[i]  :: [34;49m...[34;49m : 261.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 263.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_Write_Instruction_X64 ( rex, opCode, modRm, controlFlags, sib, disp, dispSize, imm, immSiz .. [34;49m[32;49m
0x7ffff72fd717    e900000000              jmp 0x7ffff72fd71c         	< C compiler code >        [34;49m[32;49m
0x7ffff72fd71c    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd720    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd724    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 263.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c8af78[34;49m.
dbg[c]  :: [34;49m...[34;49m : 264.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif DBI [34;49m 
dbg[c]  :: [34;49m...[34;49m : 264.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m DBI [34;49m 
dbg[i]  :: [34;49m...[34;49m : 264.008 : X64 :> [33;40mDBI[34;49m <: 0x00007ffff5c7ee70 :> [34;49m#if [34;49m[33;40mDBI[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 264.8 :> [39;49mDBI[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
dbg[c]  :: [34;49m...[34;49m : 265.008 : char :> [33;40mint[34;49m <: 0x00007ffff72979e0 :> [34;49m    [34;49m[33;40mint[34;49m[34;49m nbytes, _here  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 265.025 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    int nbytes, _here  [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 266.010 : locals_0 :> [33;40m_here[34;49m <: 0x00007ffff5c89a18 :> [34;49m    [34;49m[33;40m_here[34;49m[34;49m = Here ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 266.012 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    _here [34;49m[33;40m=[34;49m[34;49m Here ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 266.017 : Compiler :> [33;40mHere[34;49m <: cprimitive :> [34;49m    _here = [34;49m[33;40mHere[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mHere[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 266.17
[34;49m .. mSize ) { int nbytes, _here ; _here = [34;49m[33;40mHere[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd72b    49b88ea75b5555550000    mov r8, 0x5555555ba78e                                 [34;49m[32;49m
0x7ffff72fd735    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd73f    49ffd1                  call r9                    	< Compiler.[39;49mHere[34;49m : 0x00005555555ba78e >[34;49m
dbg[c]  :: [34;49m...[34;49m : 266.019 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    _here [34;49m[33;40m=[34;49m[34;49m Here ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 266.19[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c89a18	< word : locals_0.[34;49m_here[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7ee70	< word : X64.[34;49mDBI[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Undefined  : namespaces/compiler/x64.cft : 266.19
dbg[c]  :: [34;49m...[34;49m : 266.019 : locals_0 :> [33;40m_here[34;49m <: 0x00007ffff5c89850 :> [34;49m    [34;49m[33;40m_here[34;49m[34;49m = Here ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_here[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 266.19
[34;49m ..  imm, immSize ) { int nbytes, _here ; [34;49m[33;40m_here[34;49m[34;49m = Here ; [34;49m[32;49m
0x7ffff72fd742    498d4710                lea rax, [r15+0x10]                                    [34;49m[32;49m
0x7ffff72fd746    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd74a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 266.019 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    _here [34;49m[33;40m=[34;49m[34;49m Here ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 266.19[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c89850	< word : locals_0.[34;49m_here[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Undefined  : namespaces/compiler/x64.cft : 266.19
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 266.19
[34;49m .. immSize ) { int nbytes, _here ; _here [34;49m[33;40m=[34;49m[34;49m Here ; [34;49m[32;49m
0x7ffff72fd746    488bc8                  mov rcx, rax                                           [34;49m[32;49m
0x7ffff72fd749    498b06                  mov rax, [r14]                                         [34;49m[32;49m
0x7ffff72fd74c    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd750    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 266.019 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    _here = Here [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 267.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mendif [34;49m 
dbg[c]  :: [34;49m...[34;49m : 267.007 : PreProcessor :> [33;40mendif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mendif[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 268.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( rex ) compile1 ( rex ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 268.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m rex ) compile1 ( rex ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 268.8
[34;49m .. int nbytes, _here ; _here = Here ; if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fd753    e900000000              jmp 0x7ffff72fd758         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 268.013 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8abe8 :> [34;49m    if ( [34;49m[33;40mrex[34;49m[34;49m ) compile1 ( rex ) ; [34;49m 
_Do_C_Syntax_Variable : word = rex :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 268.13
[34;49m .. t nbytes, _here ; _here = Here ; if ( [34;49m[33;40mrex[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd758    498b47b8                mov rax, [r15-0x48]                                    [34;49m[32;49m
0x7ffff72fd75c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd760    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 268.014 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( rex [34;49m[33;40m)[34;49m[34;49m compile1 ( rex ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 268.14
[34;49m .. ytes, _here ; _here = Here ; if ( rex [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd763    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 268.14 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd758[34;49m.
dbg[c]  :: [34;49m...[34;49m : 268.024 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    if ( rex ) [34;49m[33;40m{[34;49m[34;49mompile1 ( rex ) ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 268.24
[34;49m .. tes, _here ; _here = Here ; if ( rex )[34;49m[33;40m{[34;49m[34;49mcompile1  .. [34;49m[32;49m
0x7ffff72fd764    e900000000              jmp 0x7ffff72fd769         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 268.024 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m    if ( rex ) [34;49m[33;40mcompile1[34;49m[34;49m ( rex ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 268.030 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8abe8 :> [34;49m    if ( rex ) compile1 ( [34;49m[33;40mrex[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = rex :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 268.30
[34;49m ..  _here = Here ; if ( rex ) compile1 ( [34;49m[33;40mrex[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd769    498b47b8                mov rax, [r15-0x48]                                    [34;49m[32;49m
0x7ffff72fd76d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd771    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 268.031 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m    if ( rex ) [34;49m[33;40mcompile1[34;49m[34;49m ( rex ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile1[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 268.31
[34;49m .. es, _here ; _here = Here ; if ( rex ) [34;49m[33;40mcompile1[34;49m[34;49m ( rex ) .. [34;49m[32;49m
0x7ffff72fd774    49b87da85b5555550000    mov r8, 0x5555555ba87d                                 [34;49m[32;49m
0x7ffff72fd77e    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd788    49ffd1                  call r9                    	< Asm.[39;49mcompile1[34;49m : 0x00005555555ba87d >[34;49m
dbg[c]  :: [34;49m...[34;49m : 268.034 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m    if ( rex ) compile1 ( rex ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 268.34
[34;49m ..  = Here ; if ( rex ) compile1 ( rex ) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd78b    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 268.34 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd769[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 269.7[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8af78	< word : void.[39;49m_Compile_Write_Instruction_X64[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 269.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( opCode >= 0x100 ) compile2 ( opCode ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 269.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m opCode >= 0x100 ) compile2 ( opCode ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 269.8
[34;49m .. e ; if ( rex ) compile1 ( rex ) ;  if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd782    e900000000              jmp 0x7ffff72fd787         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 269.016 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8aa20 :> [34;49m    if ( [34;49m[33;40mopCode[34;49m[34;49m >= 0x100 ) compile2 ( opCode ) ; [34;49m 
_Do_C_Syntax_Variable : word = opCode :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 269.16
[34;49m .. ; if ( rex ) compile1 ( rex ) ;  if ( [34;49m[33;40mopCode[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd787    498b47c0                mov rax, [r15-0x40]                                    [34;49m[32;49m
0x7ffff72fd78b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd78f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 269.019 : Logic :> [33;40m>=[34;49m <: cprimitive :> [34;49m    if ( opCode [34;49m[33;40m>=[34;49m[34;49m 0x100 ) compile2 ( opCode ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 269.025 : <literal> :> [33;40m0x100[34;49m <: 0x00007ffff5c88848 :> [34;49m    if ( opCode >= [34;49m[33;40m0x100[34;49m[34;49m ) compile2 ( opCode ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x100[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 269.25
[34;49m ..  ) compile1 ( rex ) ;  if ( opCode >= [34;49m[33;40m0x100[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd792    48b80001000000000000    mov rax, 0x100                                         [34;49m[32;49m
0x7ffff72fd79c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd7a0    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 269.025 : Logic :> [33;40m>=[34;49m <: cprimitive :> [34;49m    if ( opCode [34;49m[33;40m>=[34;49m[34;49m 0x100 ) compile2 ( opCode ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 269.25[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c88848	< word : <literal>.[34;49m0x100[39;49m : value = 0x0000000000000100 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8aa20	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.>= :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 269.25
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m>=[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 269.25
[34;49m .. rex ) compile1 ( rex ) ;  if ( opCode [34;49m[33;40m>=[34;49m[34;49m 0x100  .. [34;49m[32;49m
0x7ffff72fd78b    48b90001000000000000    mov rcx, 0x100                                         [34;49m[32;49m
0x7ffff72fd795    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd798    0f9dc0                  setge al                                               [34;49m[32;49m
0x7ffff72fd79b    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd79f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd7a3    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 269.026 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( opCode >= 0x100 [34;49m[33;40m)[34;49m[34;49m compile2 ( opCode ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 269.26
[34;49m .. pile1 ( rex ) ;  if ( opCode >= 0x100 [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd7a6    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 269.26 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd787[34;49m.
dbg[c]  :: [34;49m...[34;49m : 269.036 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    if ( opCode >= 0x100 ) [34;49m[33;40m{[34;49m[34;49mompile2 ( opCode ) ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 269.36
[34;49m .. ile1 ( rex ) ;  if ( opCode >= 0x100 )[34;49m[33;40m{[34;49m[34;49mcompile2  .. [34;49m[32;49m
0x7ffff72fd7a7    e900000000              jmp 0x7ffff72fd7ac         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 269.036 : Asm :> [33;40mcompile2[34;49m <: cprimitive :> [34;49m    if ( opCode >= 0x100 ) [34;49m[33;40mcompile2[34;49m[34;49m ( opCode ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 269.045 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8aa20 :> [34;49m    if ( opCode >= 0x100 ) compile2 ( [34;49m[33;40mopCode[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = opCode :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 269.45
[34;49m ..  ;  if ( opCode >= 0x100 ) compile2 ( [34;49m[33;40mopCode[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd7ac    498b47c0                mov rax, [r15-0x40]                                    [34;49m[32;49m
0x7ffff72fd7b0    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd7b4    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 269.046 : Asm :> [33;40mcompile2[34;49m <: cprimitive :> [34;49m    if ( opCode >= 0x100 ) [34;49m[33;40mcompile2[34;49m[34;49m ( opCode ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile2[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 269.46
[34;49m .. le1 ( rex ) ;  if ( opCode >= 0x100 ) [34;49m[33;40mcompile2[34;49m[34;49m ( opCode ) .. [34;49m[32;49m
0x7ffff72fd7b7    49b849a85b5555550000    mov r8, 0x5555555ba849                                 [34;49m[32;49m
0x7ffff72fd7c1    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd7cb    49ffd1                  call r9                    	< Asm.[39;49mcompile2[34;49m : 0x00005555555ba849 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 269.049 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m    if ( opCode >= 0x100 ) compile2 ( opCode ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 269.49
[34;49m .. opCode >= 0x100 ) compile2 ( opCode ) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd7ce    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 269.49 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd7ac[34;49m.
dbg[c]  :: [34;49m...[34;49m : 270.018 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    else [34;49m[33;40m{[34;49m[34;49mompile1 ( opCode ) ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 270.18
[34;49m .. = 0x100 ) compile2 ( opCode ) ;  else [34;49m[33;40m{[34;49m[34;49mompile1  .. [34;49m[32;49m
0x7ffff72fd7cf    e900000000              jmp 0x7ffff72fd7d4         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 270.018 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m    else [34;49m[33;40mcompile1[34;49m[34;49m ( opCode ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 270.027 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8aa20 :> [34;49m    else compile1 ( [34;49m[33;40mopCode[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = opCode :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 270.27
[34;49m .. ompile2 ( opCode ) ;  else compile1 ( [34;49m[33;40mopCode[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd7d4    498b47c0                mov rax, [r15-0x40]                                    [34;49m[32;49m
0x7ffff72fd7d8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd7dc    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 270.028 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m    else [34;49m[33;40mcompile1[34;49m[34;49m ( opCode ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile1[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 270.28
[34;49m .. = 0x100 ) compile2 ( opCode ) ;  else [34;49m[33;40mcompile1[34;49m[34;49m ( opCode ) .. [34;49m[32;49m
0x7ffff72fd7df    49b87da85b5555550000    mov r8, 0x5555555ba87d                                 [34;49m[32;49m
0x7ffff72fd7e9    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd7f3    49ffd1                  call r9                    	< Asm.[39;49mcompile1[34;49m : 0x00005555555ba87d >[34;49m
dbg[c]  :: [34;49m...[34;49m : 270.031 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m    else compile1 ( opCode ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 270.31
[34;49m ..  opCode ) ;  else compile1 ( opCode ) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd7f6    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 270.31 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd7d4[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 270.31[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8af78	< word : void.[39;49m_Compile_Write_Instruction_X64[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 271.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( controlFlags Bits.& MODRM_B ) compile1 ( modRm ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 271.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m controlFlags Bits.& MODRM_B ) compile1 ( modRm ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 271.8
[34;49m .. e ) ;  else compile1 ( opCode ) ;  if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd7e2    e900000000              jmp 0x7ffff72fd7e7         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 271.022 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c8a690 :> [34;49m    if ( [34;49m[33;40mcontrolFlags[34;49m[34;49m Bits.& MODRM_B ) compile1 ( modRm ) ; [34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 271.22
[34;49m .. ) ;  else compile1 ( opCode ) ;  if ( [34;49m[33;40mcontrolFlags[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd7e7    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fd7eb    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd7ef    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 271.026 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49m    if ( controlFlags [34;49m[33;40mBits[34;49m[34;49m.& MODRM_B ) compile1 ( modRm ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 271.027 : Class :> [33;40m.[34;49m <: cprimitive :> [34;49m    if ( controlFlags Bits[34;49m[33;40m.[34;49m[34;49m& MODRM_B ) compile1 ( modRm ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 271.029 : Bits :> [33;40m&[34;49m <: cprimitive :> [34;49m    if ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m MODRM_B ) compile1 ( modRm ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 271.037 : X64 :> [33;40mMODRM_B[34;49m <: 0x00007ffff5c7dad8 :> [34;49m    if ( controlFlags Bits.& [34;49m[33;40mMODRM_B[34;49m[34;49m ) compile1 ( modRm ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMODRM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 271.37[32;49m
0x7ffff72fd7f2    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fd7fc    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd800    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 271.037 : Bits :> [33;40m&[34;49m <: cprimitive :> [34;49m    if ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m MODRM_B ) compile1 ( modRm ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 271.37[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8a690	< word : locals_0.[34;49mcontrolFlags[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Bits.& :: type expected : Integer . Integer  :: type recorded : Undefined  : namespaces/compiler/x64.cft : 271.37
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m&[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 271.37
[34;49m ..  ( opCode ) ;  if ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m MODRM_B  .. [34;49m[32;49m
0x7ffff72fd7f2    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fd7fc    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd800    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fd803    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fd806    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fd80a    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fd80e    4823c1                  and rax, rcx                                           [34;49m[32;49m
0x7ffff72fd811    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd815    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 271.038 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( controlFlags Bits.& MODRM_B [34;49m[33;40m)[34;49m[34;49m compile1 ( modRm ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 271.38
[34;49m .. ) ;  if ( controlFlags Bits.& MODRM_B [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd818    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 271.38 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd7e7[34;49m.
dbg[c]  :: [34;49m...[34;49m : 271.048 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    if ( controlFlags Bits.& MODRM_B ) [34;49m[33;40m{[34;49m[34;49mompile1 ( modRm ) ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 271.48
[34;49m ..  ;  if ( controlFlags Bits.& MODRM_B )[34;49m[33;40m{[34;49m[34;49mcompile1  .. [34;49m[32;49m
0x7ffff72fd819    e900000000              jmp 0x7ffff72fd81e         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 271.048 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m    if ( controlFlags Bits.& MODRM_B ) [34;49m[33;40mcompile1[34;49m[34;49m ( modRm ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 271.056 : locals_0 :> [33;40mmodRm[34;49m <: 0x00007ffff5c8a858 :> [34;49m    if ( controlFlags Bits.& MODRM_B ) compile1 ( [34;49m[33;40mmodRm[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = modRm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mmodRm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 271.56
[34;49m .. trolFlags Bits.& MODRM_B ) compile1 ( [34;49m[33;40mmodRm[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd81e    498b47c8                mov rax, [r15-0x38]                                    [34;49m[32;49m
0x7ffff72fd822    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd826    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 271.057 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m    if ( controlFlags Bits.& MODRM_B ) [34;49m[33;40mcompile1[34;49m[34;49m ( modRm ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile1[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 271.57
[34;49m .. ;  if ( controlFlags Bits.& MODRM_B ) [34;49m[33;40mcompile1[34;49m[34;49m ( modRm ) .. [34;49m[32;49m
0x7ffff72fd829    49b87da85b5555550000    mov r8, 0x5555555ba87d                                 [34;49m[32;49m
0x7ffff72fd833    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd83d    49ffd1                  call r9                    	< Asm.[39;49mcompile1[34;49m : 0x00005555555ba87d >[34;49m
dbg[c]  :: [34;49m...[34;49m : 271.060 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m    if ( controlFlags Bits.& MODRM_B ) compile1 ( modRm ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 271.60
[34;49m .. s Bits.& MODRM_B ) compile1 ( modRm ) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd840    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 271.60 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd81e[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 272.7[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8af78	< word : void.[39;49m_Compile_Write_Instruction_X64[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 272.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( sib && ( controlFlags Bits.& SIB_B ) ) compile1 ( sib ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 272.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m sib && ( controlFlags Bits.& SIB_B ) ) compile1 ( sib ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 272.8
[34;49m .. s.& MODRM_B ) compile1 ( modRm ) ; if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd837    e900000000              jmp 0x7ffff72fd83c         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 272.013 : locals_0 :> [33;40msib[34;49m <: 0x00007ffff5c8a4c8 :> [34;49m    if ( [34;49m[33;40msib[34;49m[34;49m && ( controlFlags Bits.& SIB_B ) ) compile1 ( sib ) ; [34;49m 
_Do_C_Syntax_Variable : word = sib :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msib[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 272.13
[34;49m .. & MODRM_B ) compile1 ( modRm ) ; if ( [34;49m[33;40msib[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd83c    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fd840    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd844    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 272.016 : Logic :> [33;40m&&[34;49m <: cprimitive :> [34;49m    if ( sib [34;49m[33;40m&&[34;49m[34;49m ( controlFlags Bits.& SIB_B ) ) compile1 ( sib ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 272.017 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    if ( sib && [34;49m[33;40m([34;49m[34;49m controlFlags Bits.& SIB_B ) ) compile1 ( sib ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 272.031 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c8a690 :> [34;49m    if ( sib && ( [34;49m[33;40mcontrolFlags[34;49m[34;49m Bits.& SIB_B ) ) compile1 ( sib ) ; [34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 272.31
[34;49m ..  ) compile1 ( modRm ) ; if ( sib && ( [34;49m[33;40mcontrolFlags[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd847    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fd84b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd84f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 272.035 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49m    if ( sib && ( controlFlags [34;49m[33;40mBits[34;49m[34;49m.& SIB_B ) ) compile1 ( sib ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 272.036 : Class :> [33;40m.[34;49m <: cprimitive :> [34;49m    if ( sib && ( controlFlags Bits[34;49m[33;40m.[34;49m[34;49m& SIB_B ) ) compile1 ( sib ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 272.038 : Bits :> [33;40m&[34;49m <: cprimitive :> [34;49m    if ( sib && ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m SIB_B ) ) compile1 ( sib ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 272.044 : X64 :> [33;40mSIB_B[34;49m <: 0x00007ffff5c7de68 :> [34;49m    if ( sib && ( controlFlags Bits.& [34;49m[33;40mSIB_B[34;49m[34;49m ) ) compile1 ( sib ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mSIB_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 272.44[32;49m
0x7ffff72fd852    48b80400000000000000    mov rax, 0x4                                           [34;49m[32;49m
0x7ffff72fd85c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd860    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 272.044 : Bits :> [33;40m&[34;49m <: cprimitive :> [34;49m    if ( sib && ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m SIB_B ) ) compile1 ( sib ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 272.44[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c80960	< word : locals_0.[34;49mcontrolFlags[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8a4c8	< word : locals_0.[34;49msib[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Bits.& :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 272.44
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m&[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 272.44
[34;49m .. m ) ; if ( sib && ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m SIB_B  .. [34;49m[32;49m
0x7ffff72fd852    48b80400000000000000    mov rax, 0x4                                           [34;49m[32;49m
0x7ffff72fd85c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd860    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fd863    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fd866    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fd86a    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fd86e    4823c1                  and rax, rcx                                           [34;49m[32;49m
0x7ffff72fd871    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd875    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 272.045 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( sib && ( controlFlags Bits.& SIB_B [34;49m[33;40m)[34;49m[34;49m ) compile1 ( sib ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 272.045 : Logic :> [33;40m&&[34;49m <: cprimitive :> [34;49m    if ( sib [34;49m[33;40m&&[34;49m[34;49m ( controlFlags Bits.& SIB_B ) ) compile1 ( sib ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m&&[34;49m <:   61 bytes : at namespaces/compiler/x64.cft : 272.45
[34;49m .. DRM_B ) compile1 ( modRm ) ; if ( sib [34;49m[33;40m&&[34;49m[34;49m ( controlFlags Bits.& SIB_B ) .. [34;49m[32;49m
0x7ffff72fd878    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fd87b    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fd87f    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fd883    4885c9                  test rcx, rcx                                          [34;49m[32;49m
0x7ffff72fd886    0f8409000000            jz 0x7ffff72fd895          	< C compiler code >        [34;49m[32;49m
0x7ffff72fd88c    4885c0                  test rax, rax                                          [34;49m[32;49m
0x7ffff72fd88f    0f850f000000            jnz 0x7ffff72fd8a4         	< C compiler code >        [34;49m[32;49m
0x7ffff72fd895    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fd89f    e90a000000              jmp 0x7ffff72fd8ae         	< C compiler code >        [34;49m[32;49m
0x7ffff72fd8a4    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd8ae    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd8b2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 272.047 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( sib && ( controlFlags Bits.& SIB_B ) [34;49m[33;40m)[34;49m[34;49m compile1 ( sib ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 272.47
[34;49m ..  sib && ( controlFlags Bits.& SIB_B ) [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd8b5    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 272.47 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd83c[34;49m.
dbg[c]  :: [34;49m...[34;49m : 272.057 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    if ( sib && ( controlFlags Bits.& SIB_B ) ) [34;49m[33;40m{[34;49m[34;49mompile1 ( sib ) ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 272.57
[34;49m .. sib && ( controlFlags Bits.& SIB_B ) )[34;49m[33;40m{[34;49m[34;49mcompile1  .. [34;49m[32;49m
0x7ffff72fd8b6    e900000000              jmp 0x7ffff72fd8bb         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 272.057 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m    if ( sib && ( controlFlags Bits.& SIB_B ) ) [34;49m[33;40mcompile1[34;49m[34;49m ( sib ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 272.063 : locals_0 :> [33;40msib[34;49m <: 0x00007ffff5c8a4c8 :> [34;49m    if ( sib && ( controlFlags Bits.& SIB_B ) ) compile1 ( [34;49m[33;40msib[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = sib :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msib[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 272.63
[34;49m .. trolFlags Bits.& SIB_B ) ) compile1 ( [34;49m[33;40msib[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd8bb    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fd8bf    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd8c3    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 272.064 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m    if ( sib && ( controlFlags Bits.& SIB_B ) ) [34;49m[33;40mcompile1[34;49m[34;49m ( sib ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile1[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 272.64
[34;49m .. ib && ( controlFlags Bits.& SIB_B ) ) [34;49m[33;40mcompile1[34;49m[34;49m ( sib ) .. [34;49m[32;49m
0x7ffff72fd8c6    49b87da85b5555550000    mov r8, 0x5555555ba87d                                 [34;49m[32;49m
0x7ffff72fd8d0    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd8da    49ffd1                  call r9                    	< Asm.[39;49mcompile1[34;49m : 0x00005555555ba87d >[34;49m
dbg[c]  :: [34;49m...[34;49m : 272.067 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m    if ( sib && ( controlFlags Bits.& SIB_B ) ) compile1 ( sib ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 272.67
[34;49m .. ags Bits.& SIB_B ) ) compile1 ( sib ) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd8dd    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 272.67 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd8bb[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 273.7[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8af78	< word : void.[39;49m_Compile_Write_Instruction_X64[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 273.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( disp || ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, dispS[34;49m 
dbg[c]  :: [34;49m...[34;49m : 273.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m disp || ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, 0 ) ;[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 273.8
[34;49m .. its.& SIB_B ) ) compile1 ( sib ) ; if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd8d1    e900000000              jmp 0x7ffff72fd8d6         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.014 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c8a300 :> [34;49m    if ( [34;49m[33;40mdisp[34;49m[34;49m || ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, disp[34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 273.14
[34;49m .. s.& SIB_B ) ) compile1 ( sib ) ; if ( [34;49m[33;40mdisp[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd8d6    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fd8da    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd8de    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.017 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m    if ( disp [34;49m[33;40m||[34;49m[34;49m ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, 0 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 273.018 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    if ( disp || [34;49m[33;40m([34;49m[34;49m controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, 0 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 273.032 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c8a690 :> [34;49m    if ( disp || ( [34;49m[33;40mcontrolFlags[34;49m[34;49m Bits.& DISP_B ) ) _Compile_ImmDispData ( di[34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 273.32
[34;49m .. ) ) compile1 ( sib ) ; if ( disp || ( [34;49m[33;40mcontrolFlags[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd8e1    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fd8e5    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd8e9    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.036 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49m    if ( disp || ( controlFlags [34;49m[33;40mBits[34;49m[34;49m.& DISP_B ) ) _Compile_ImmDispData ( disp, dispSiz[34;49m 
dbg[c]  :: [34;49m...[34;49m : 273.037 : Class :> [33;40m.[34;49m <: cprimitive :> [34;49m    if ( disp || ( controlFlags Bits[34;49m[33;40m.[34;49m[34;49m& DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, 0 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 273.039 : Bits :> [33;40m&[34;49m <: cprimitive :> [34;49m    if ( disp || ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, 0 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 273.046 : X64 :> [33;40mDISP_B[34;49m <: 0x00007ffff5c7e1f8 :> [34;49m    if ( disp || ( controlFlags Bits.& [34;49m[33;40mDISP_B[34;49m[34;49m ) ) _Compile_ImmDispData ( disp, dispSiz[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDISP_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 273.46[32;49m
0x7ffff72fd8ec    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fd8f6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd8fa    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.046 : Bits :> [33;40m&[34;49m <: cprimitive :> [34;49m    if ( disp || ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, 0 ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 273.46[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c859c0	< word : locals_0.[34;49mcontrolFlags[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8a300	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Bits.& :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 273.46
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m&[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 273.46
[34;49m ..  ) ; if ( disp || ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m DISP_B  .. [34;49m[32;49m
0x7ffff72fd8ec    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fd8f6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd8fa    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fd8fd    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fd900    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fd904    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fd908    4823c1                  and rax, rcx                                           [34;49m[32;49m
0x7ffff72fd90b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd90f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.047 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( disp || ( controlFlags Bits.& DISP_B [34;49m[33;40m)[34;49m[34;49m ) _Compile_ImmDispData ( disp, dispSize, 0 ) ;[34;49m 
dbg[c]  :: [34;49m...[34;49m : 273.047 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m    if ( disp [34;49m[33;40m||[34;49m[34;49m ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m||[34;49m <:   24 bytes : at namespaces/compiler/x64.cft : 273.47
[34;49m .. IB_B ) ) compile1 ( sib ) ; if ( disp [34;49m[33;40m||[34;49m[34;49m ( controlFlags Bits.& DISP_B ) .. [34;49m[32;49m
0x7ffff72fd912    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fd915    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fd919    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fd91d    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fd920    4885c0                  test rax, rax                                          [34;49m[32;49m
0x7ffff72fd923    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd927    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.049 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m  if ( disp || ( controlFlags Bits.& DISP_B ) [34;49m[33;40m)[34;49m[34;49m _Compile_ImmDispData ( disp, dispSize, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 273.49
[34;49m .. isp || ( controlFlags Bits.& DISP_B ) [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd92a    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 273.49 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd8d6[34;49m.
dbg[c]  :: [34;49m...[34;49m : 273.071 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m   if ( disp || ( controlFlags Bits.& DISP_B ) ) [34;49m[33;40m{[34;49m[34;49mCompile_ImmDispData ( disp, dispSize, 0 ) ;  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 273.71
[34;49m .. sp || ( controlFlags Bits.& DISP_B ) )[34;49m[33;40m{[34;49m[34;49m_Compile_ImmDispData  .. [34;49m[32;49m
0x7ffff72fd92b    e900000000              jmp 0x7ffff72fd930         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.071 : void :> [33;40m_Compile_ImmDispData[34;49m <: 0x00007ffff5c87808 :> [34;49mlFlags Bits.& DISP_B ) ) [34;49m[33;40m_Compile_ImmDispData[34;49m[34;49m ( disp, dispSize, 0 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 273.077 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c8a300 :> [34;49mp || ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( [34;49m[33;40mdisp[34;49m[34;49m, dispSize, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 273.77
[34;49m .. s.& DISP_B ) ) _Compile_ImmDispData ( [34;49m[33;40mdisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd930    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fd934    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd938    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.087 : locals_0 :> [33;40mdispSize[34;49m <: 0x00007ffff5c8a138 :> [34;49m ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, [34;49m[33;40mdispSize[34;49m[34;49m, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = dispSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdispSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 273.87
[34;49m .. SP_B ) ) _Compile_ImmDispData ( disp, [34;49m[33;40mdispSize[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd93b    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd93f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd943    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.091 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7380494 :> [34;49misp || ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, [34;49m[33;40m0[34;49m[34;49m ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 273.91
[34;49m .. Compile_ImmDispData ( disp, dispSize, [34;49m[33;40m0[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd946    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fd950    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd954    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.092 : void :> [33;40m_Compile_ImmDispData[34;49m <: 0x00007ffff5c87808 :> [34;49mlFlags Bits.& DISP_B ) ) [34;49m[33;40m_Compile_ImmDispData[34;49m[34;49m ( disp, dispSize, 0 ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 273.92[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff7380494	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8a138	< word : locals_0.[34;49mdispSize[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8b508	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: void._Compile_ImmDispData :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 273.92
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_ImmDispData[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 273.92
[34;49m .. p || ( controlFlags Bits.& DISP_B ) ) [34;49m[33;40m_Compile_ImmDispData[34;49m[34;49m ( disp, dispSize, 0 ) .. [34;49m[32;49m
0x7ffff72fd957    49b978d52ff7ff7f0000    mov r9, 0x7ffff72fd578                                 [34;49m[32;49m
0x7ffff72fd961    49ffd1                  call r9                    	< void.[39;49m_Compile_ImmDispData[34;49m : 0x00007ffff72fd578 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 273.095 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m   if ( disp || ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, 0 ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 273.95
[34;49m .. ile_ImmDispData ( disp, dispSize, 0 ) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd964    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 273.95 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd930[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 274.7[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8af78	< word : void.[39;49m_Compile_Write_Instruction_X64[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 274.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( imm || ( controlFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize,[34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m imm || ( controlFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( control[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 274.8
[34;49m .. mmDispData ( disp, dispSize, 0 ) ; if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd958    e900000000              jmp 0x7ffff72fd95d         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.013 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5c89f70 :> [34;49m    if ( [34;49m[33;40mimm[34;49m[34;49m || ( controlFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize,[34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 274.13
[34;49m .. DispData ( disp, dispSize, 0 ) ; if ( [34;49m[33;40mimm[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd95d    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd961    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd965    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.016 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m    if ( imm [34;49m[33;40m||[34;49m[34;49m ( controlFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFl[34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.017 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    if ( imm || [34;49m[33;40m([34;49m[34;49m controlFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlags B[34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.031 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c8a690 :> [34;49m    if ( imm || ( [34;49m[33;40mcontrolFlags[34;49m[34;49m Bits.& IMM_B ) ) _Compile_ImmDispData ( imm,[34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 274.31
[34;49m .. ( disp, dispSize, 0 ) ; if ( imm || ( [34;49m[33;40mcontrolFlags[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd968    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fd96c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd970    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.035 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49m    if ( imm || ( controlFlags [34;49m[33;40mBits[34;49m[34;49m.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ([34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.036 : Class :> [33;40m.[34;49m <: cprimitive :> [34;49m    if ( imm || ( controlFlags Bits[34;49m[33;40m.[34;49m[34;49m& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFla[34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.038 : Bits :> [33;40m&[34;49m <: cprimitive :> [34;49m    if ( imm || ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlag[34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.044 : X64 :> [33;40mIMM_B[34;49m <: 0x00007ffff5c7e588 :> [34;49m    if ( imm || ( controlFlags Bits.& [34;49m[33;40mIMM_B[34;49m[34;49m ) ) _Compile_ImmDispData ( imm, immSize, ( [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mIMM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 274.44[32;49m
0x7ffff72fd973    48b81000000000000000    mov rax, 0x10                                          [34;49m[32;49m
0x7ffff72fd97d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd981    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.044 : Bits :> [33;40m&[34;49m <: cprimitive :> [34;49m    if ( imm || ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlag[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 274.44[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8bdf0	< word : locals_0.[34;49mcontrolFlags[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c89f70	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Bits.& :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 274.44
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m&[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 274.44
[34;49m .. 0 ) ; if ( imm || ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m IMM_B  .. [34;49m[32;49m
0x7ffff72fd973    48b81000000000000000    mov rax, 0x10                                          [34;49m[32;49m
0x7ffff72fd97d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd981    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fd984    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fd987    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fd98b    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fd98f    4823c1                  and rax, rcx                                           [34;49m[32;49m
0x7ffff72fd992    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd996    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.045 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( imm || ( controlFlags Bits.& IMM_B [34;49m[33;40m)[34;49m[34;49m ) _Compile_ImmDispData ( imm, immSize, ( control[34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.045 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m    if ( imm [34;49m[33;40m||[34;49m[34;49m ( controlFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFl[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m||[34;49m <:   24 bytes : at namespaces/compiler/x64.cft : 274.45
[34;49m .. Data ( disp, dispSize, 0 ) ; if ( imm [34;49m[33;40m||[34;49m[34;49m ( controlFlags Bits.& IMM_B ) .. [34;49m[32;49m
0x7ffff72fd999    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fd99c    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fd9a0    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fd9a4    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fd9a7    4885c0                  test rax, rax                                          [34;49m[32;49m
0x7ffff72fd9aa    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd9ae    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.047 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( imm || ( controlFlags Bits.& IMM_B ) [34;49m[33;40m)[34;49m[34;49m _Compile_ImmDispData ( imm, immSize, ( control[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 274.47
[34;49m ..  imm || ( controlFlags Bits.& IMM_B ) [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd9b1    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 274.47 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd95d[34;49m.
dbg[c]  :: [34;49m...[34;49m : 274.069 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m   if ( imm || ( controlFlags Bits.& IMM_B ) )[34;49m[33;40m{[34;49m[34;49m_Compile_ImmDispData ( imm, immSize, ( con ) ) .. [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 274.69
[34;49m .. imm || ( controlFlags Bits.& IMM_B ) )[34;49m[33;40m{[34;49m[34;49m_Compile_ImmDispData  .. [34;49m[32;49m
0x7ffff72fd9b2    e900000000              jmp 0x7ffff72fd9b7         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.069 : void :> [33;40m_Compile_ImmDispData[34;49m <: 0x00007ffff5c87808 :> [34;49molFlags Bits.& IMM_B ) ) [34;49m[33;40m_Compile_ImmDispData[34;49m[34;49m ( imm, immSize, ( control[34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.074 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5c89f70 :> [34;49mBits.& IMM_B ) ) _Compile_ImmDispData ( [34;49m[33;40mimm[34;49m[34;49m, immSize, ( controlFlags Bits.& IMM_B ) [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 274.74
[34;49m .. ts.& IMM_B ) ) _Compile_ImmDispData ( [34;49m[33;40mimm[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd9b7    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd9bb    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd9bf    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.083 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c89da8 :> [34;49mM_B ) ) _Compile_ImmDispData ( imm, [34;49m[33;40mimmSize[34;49m[34;49m, ( controlFlags Bits.& IMM_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.085 : C_Syntax :> [33;40m,[34;49m <: cprimitive :> [34;49mFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize[34;49m[33;40m,[34;49m[34;49m ( controlFlags Bits.& IMM_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.085 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c89da8 :> [34;49mM_B ) ) _Compile_ImmDispData ( imm, [34;49m[33;40mimmSize[34;49m[34;49m, ( controlFlags Bits.& IMM_B ) ) ; [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 274.85
[34;49m .. IMM_B ) ) _Compile_ImmDispData ( imm, [34;49m[33;40mimmSize[34;49m[34;49m,  .. [34;49m[32;49m
0x7ffff72fd9c2    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fd9c6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd9ca    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.086 : C :> [33;40m([34;49m <: cprimitive :> [34;49mcontrolFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, [34;49m[33;40m([34;49m[34;49m controlFlags Bits.& IMM_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.100 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c8a690 :> [34;49m) ) _Compile_ImmDispData ( imm, immSize, ( [34;49m[33;40mcontrolFlags[34;49m[34;49m Bits.& IMM_B ) ) ; [34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 274.100
[34;49m .. Compile_ImmDispData ( imm, immSize, ( [34;49m[33;40mcontrolFlags[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd9cd    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fd9d1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd9d5    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.104 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49mts.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlags [34;49m[33;40mBits[34;49m[34;49m.& IMM_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.105 : Class :> [33;40m.[34;49m <: cprimitive :> [34;49mrolFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlags Bits[34;49m[33;40m.[34;49m[34;49m& IMM_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.107 : Bits :> [33;40m&[34;49m <: cprimitive :> [34;49mtrolFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m IMM_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.113 : X64 :> [33;40mIMM_B[34;49m <: 0x00007ffff5c7e588 :> [34;49mits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlags Bits.& [34;49m[33;40mIMM_B[34;49m[34;49m ) ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mIMM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 274.113[32;49m
0x7ffff72fd9d8    48b81000000000000000    mov rax, 0x10                                          [34;49m[32;49m
0x7ffff72fd9e2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd9e6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.113 : Bits :> [33;40m&[34;49m <: cprimitive :> [34;49mtrolFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m IMM_B ) ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 274.113[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c8d188	< word : locals_0.[34;49mcontrolFlags[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c89da8	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8cdf8	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Bits.& :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 274.113
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m&[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 274.113
[34;49m .. a ( imm, immSize, ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m IMM_B  .. [34;49m[32;49m
0x7ffff72fd9d8    48b81000000000000000    mov rax, 0x10                                          [34;49m[32;49m
0x7ffff72fd9e2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd9e6    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fd9e9    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fd9ec    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fd9f0    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fd9f4    4823c1                  and rax, rcx                                           [34;49m[32;49m
0x7ffff72fd9f7    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd9fb    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.114 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49mFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlags Bits.& IMM_B [34;49m[33;40m)[34;49m[34;49m ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.116 : void :> [33;40m_Compile_ImmDispData[34;49m <: 0x00007ffff5c8de00 :> [34;49molFlags Bits.& IMM_B ) ) [34;49m[33;40m_Compile_ImmDispData[34;49m[34;49m ( imm, immSize, ( control[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 274.116[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8da70	< word : Bits.[34;49m&[39;49m : value = 0x00005555555b743a > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8cdf8	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: void._Compile_ImmDispData :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 274.116
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_ImmDispData[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 274.116
[34;49m .. mm || ( controlFlags Bits.& IMM_B ) ) [34;49m[33;40m_Compile_ImmDispData[34;49m[34;49m ( imm, immSize, ( controlFlags Bits.& IMM_B ) ) .. [34;49m[32;49m
0x7ffff72fd9fe    49b978d52ff7ff7f0000    mov r9, 0x7ffff72fd578                                 [34;49m[32;49m
0x7ffff72fda08    49ffd1                  call r9                    	< void.[39;49m_Compile_ImmDispData[34;49m : 0x00007ffff72fd578 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 274.119 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49mFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlags Bits.& IMM_B ) ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 274.119
[34;49m .. Size, ( controlFlags Bits.& IMM_B ) ) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fda0b    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 274.119 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd9b7[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 275.1[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8af78	< word : void.[39;49m_Compile_Write_Instruction_X64[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 275.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif DBI [34;49m 
dbg[c]  :: [34;49m...[34;49m : 275.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m DBI [34;49m 
dbg[i]  :: [34;49m...[34;49m : 275.008 : X64 :> [33;40mDBI[34;49m <: 0x00007ffff5c7ee70 :> [34;49m#if [34;49m[33;40mDBI[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 275.8 :> [39;49mDBI[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
dbg[c]  :: [34;49m...[34;49m : 276.011 : locals_0 :> [33;40mnbytes[34;49m <: 0x00007ffff5c89be0 :> [34;49m    [34;49m[33;40mnbytes[34;49m[34;49m = Here - _here ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 276.013 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    nbytes [34;49m[33;40m=[34;49m[34;49m Here - _here ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 276.018 : Compiler :> [33;40mHere[34;49m <: cprimitive :> [34;49m    nbytes = [34;49m[33;40mHere[34;49m[34;49m - _here ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mHere[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 276.18
[34;49m .. trolFlags Bits.& IMM_B ) ) ; nbytes = [34;49m[33;40mHere[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd9ff    49b88ea75b5555550000    mov r8, 0x5555555ba78e                                 [34;49m[32;49m
0x7ffff72fda09    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fda13    49ffd1                  call r9                    	< Compiler.[39;49mHere[34;49m : 0x00005555555ba78e >[34;49m
dbg[c]  :: [34;49m...[34;49m : 276.020 : Int :> [33;40m-[34;49m <: cprimitive :> [34;49m    nbytes = Here [34;49m[33;40m-[34;49m[34;49m _here ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 276.026 : locals_0 :> [33;40m_here[34;49m <: 0x00007ffff5c89a18 :> [34;49m    nbytes = Here - [34;49m[33;40m_here[34;49m[34;49m ; [34;49m 
_Do_C_Syntax_Variable : word = _here :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_here[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 276.26
[34;49m .. gs Bits.& IMM_B ) ) ; nbytes = Here - [34;49m[33;40m_here[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fda16    498b4710                mov rax, [r15+0x10]                                    [34;49m[32;49m
0x7ffff72fda1a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fda1e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 276.026 : Int :> [33;40m-[34;49m <: cprimitive :> [34;49m    nbytes = Here [34;49m[33;40m-[34;49m[34;49m _here ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 276.26[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c8e358	< word : locals_0.[34;49m_here[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c89be0	< word : locals_0.[34;49mnbytes[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7ee70	< word : X64.[34;49mDBI[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Int.- :: type expected : Integer . Integer  :: type recorded : Undefined . Undefined  : namespaces/compiler/x64.cft : 276.26
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m-[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 276.26
[34;49m .. lags Bits.& IMM_B ) ) ; nbytes = Here [34;49m[33;40m-[34;49m[34;49m _here  .. [34;49m[32;49m
0x7ffff72fda1a    488bc8                  mov rcx, rax                                           [34;49m[32;49m
0x7ffff72fda1d    498b06                  mov rax, [r14]                                         [34;49m[32;49m
0x7ffff72fda20    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fda24    482bc1                  sub rax, rcx                                           [34;49m[32;49m
0x7ffff72fda27    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fda2b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 276.028 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    nbytes [34;49m[33;40m=[34;49m[34;49m Here - _here ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 276.28[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8e520	< word : Int.[34;49m-[39;49m : value = 0x00005555555b7b1e > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7ee70	< word : X64.[34;49mDBI[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 276.28
dbg[c]  :: [34;49m...[34;49m : 276.028 : locals_0 :> [33;40mnbytes[34;49m <: 0x00007ffff5c8e8b0 :> [34;49m    [34;49m[33;40mnbytes[34;49m[34;49m = Here - _here ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mnbytes[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 276.28
[34;49m .. ze, ( controlFlags Bits.& IMM_B ) ) ; [34;49m[33;40mnbytes[34;49m[34;49m = Here - _here ;  .. [34;49m[32;49m
0x7ffff72fda2e    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fda32    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fda36    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 276.028 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    nbytes [34;49m[33;40m=[34;49m[34;49m Here - _here ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 276.28[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8e8b0	< word : locals_0.[34;49mnbytes[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 276.28
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 276.28
[34;49m .. ontrolFlags Bits.& IMM_B ) ) ; nbytes [34;49m[33;40m=[34;49m[34;49m Here - _here ;  .. [34;49m[32;49m
0x7ffff72fda27    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fda2b    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 276.028 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    nbytes = Here - _here [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 277.011 : C :> [33;40mprintf[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mprintf[34;49m[34;49m ( "\n_Compile_Write_Instruction_X64 : %lx : %d bytes : ...", _here, nbytes ) ; dis ( [34;49m 
dbg[c]  :: [34;49m...[34;49m : 277.087 : <literal> :> [33;40m"\n_Compile_Write_Instruction_X64 : %lx : %d bytes : ..."[34;49m <: 0x00007ffff6f36f58 :> [34;49m[34;49m[33;40m"\n_Compile_Write_Instruction_X64 : %lx : %d bytes : ..."[34;49m[34;49m[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m"\n_Compile_Write_Instruction_X64 : %lx : %d bytes : ..."[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 277.87
[34;49m .. ) ; nbytes = Here - _here ;  printf ( [34;49m[33;40m"\n_Compile_Write_Instruction_X64 : %lx : %d bytes : ..."[34;49m[34;49m, _here, nbytes ) .. [34;49m[32;49m
0x7ffff72fda2e    48b8d16acbf5ff7f0000    mov rax, 0x7ffff5cb6ad1    	< string : '[39;49m\n_Compile_Write_Instruction_X64 : %lx : %d bytes : ...[34;49m' >[34;49m[32;49m
0x7ffff72fda38    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fda3c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 277.087 : locals_0 :> [33;40m_here[34;49m <: 0x00007ffff5c8efd0 :> [34;49mtruction_X64 : %lx : %d bytes : ...", [34;49m[33;40m_here[34;49m[34;49m, nbytes ) ; dis ( _here, nbytes ) ; //[34;49m 
_Do_C_Syntax_Variable : word = _here :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_here[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 277.87
[34;49m .. truction_X64 : %lx : %d bytes : ...", [34;49m[33;40m_here[34;49m[34;49m, nbytes ) .. [34;49m[32;49m
0x7ffff72fda3b    498b4710                mov rax, [r15+0x10]                                    [34;49m[32;49m
0x7ffff72fda3f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fda43    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 277.087 : locals_0 :> [33;40mnbytes[34;49m <: 0x00007ffff5c8f198 :> [34;49m_X64 : %lx : %d bytes : ...", _here, [34;49m[33;40mnbytes[34;49m[34;49m ) ; dis ( _here, nbytes ) ; //pause ([34;49m 
_Do_C_Syntax_Variable : word = nbytes :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mnbytes[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 277.87
[34;49m .. n_X64 : %lx : %d bytes : ...", _here, [34;49m[33;40mnbytes[34;49m[34;49m ) .. [34;49m[32;49m
0x7ffff72fda42    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fda46    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fda4a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 277.087 : C :> [33;40mprintf[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mprintf[34;49m[34;49m ( "\n_Compile_Write_Instruction_X64 : %lx : %d bytes : ...", _here, nbytes ) ; dis ( [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mprintf[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 277.87
[34;49m ..  IMM_B ) ) ; nbytes = Here - _here ;  [34;49m[33;40mprintf[34;49m[34;49m ( "\n_Compile_Write_Instruction_X64 : %lx : %d bytes : ...", _here, nbytes ) .. [34;49m[32;49m
0x7ffff72fda53    49b8b334585555550000    mov r8, 0x5555555834b3                                 [34;49m[32;49m
0x7ffff72fda5d    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fda67    49ffd1                  call r9                    	< C.[39;49mprintf[34;49m : 0x00005555555834b3 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 277.090 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m_X64 : %lx : %d bytes : ...", _here, nbytes ) [34;49m[33;40m;[34;49m[34;49m dis ( _here, nbytes ) ; //pause () ; nl ; nl ;[34;49m 
dbg[c]  :: [34;49m...[34;49m : 277.094 : Debug :> [33;40mdis[34;49m <: cprimitive :> [34;49m_X64 : %lx : %d bytes : ...", _here, nbytes ) ; [34;49m[33;40mdis[34;49m[34;49m ( _here, nbytes ) ; //pause () ; nl ; nl ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 277.101 : locals_0 :> [33;40m_here[34;49m <: 0x00007ffff5c89a18 :> [34;49m%d bytes : ...", _here, nbytes ) ; dis ( [34;49m[33;40m_here[34;49m[34;49m, nbytes ) ; //pause () ; nl ; nl ; [34;49m 
_Do_C_Syntax_Variable : word = _here :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_here[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 277.101
[34;49m .. bytes : ...", _here, nbytes ) ; dis ( [34;49m[33;40m_here[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fda6a    498b4710                mov rax, [r15+0x10]                                    [34;49m[32;49m
0x7ffff72fda6e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fda72    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 277.110 : locals_0 :> [33;40mnbytes[34;49m <: 0x00007ffff5c89be0 :> [34;49md bytes : ...", _here, nbytes ) ; dis ( _here, [34;49m[33;40mnbytes[34;49m[34;49m ) ; //pause () ; nl ; nl ; [34;49m 
_Do_C_Syntax_Variable : word = nbytes :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mnbytes[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 277.110
[34;49m ..  ...", _here, nbytes ) ; dis ( _here, [34;49m[33;40mnbytes[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fda75    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fda79    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fda7d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 277.111 : Debug :> [33;40mdis[34;49m <: cprimitive :> [34;49m_X64 : %lx : %d bytes : ...", _here, nbytes ) ; [34;49m[33;40mdis[34;49m[34;49m ( _here, nbytes ) ; //pause () ; nl ; nl ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdis[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 277.111
[34;49m ..  : %d bytes : ...", _here, nbytes ) ; [34;49m[33;40mdis[34;49m[34;49m ( _here, nbytes ) .. [34;49m[32;49m
0x7ffff72fda80    49b8ded25b5555550000    mov r8, 0x5555555bd2de                                 [34;49m[32;49m
0x7ffff72fda8a    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fda94    49ffd1                  call r9                    	< Debug.[39;49mdis[34;49m : 0x00005555555bd2de >[34;49m
dbg[c]  :: [34;49m...[34;49m : 277.114 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49mX64 : %lx : %d bytes : ...", _here, nbytes ) ; dis ( _here, nbytes ) [34;49m[33;40m;[34;49m[34;49m //pause () ; nl ; nl ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 277.116 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m: %lx : %d bytes : ...", _here, nbytes ) ; dis ( _here, nbytes ) ; [34;49m[33;40m//[34;49m[34;49mpause () ; nl ; nl ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 278.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mendif [34;49m 
dbg[c]  :: [34;49m...[34;49m : 278.007 : PreProcessor :> [33;40mendif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mendif[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 279.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 279.2
[34;49m .. e, nbytes ) ; dis ( _here, nbytes ) ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fda97    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fda9b    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fda9f    4983ee48                sub r14, 0x48                                          [34;49m[32;49m
0x7ffff72fdaa3    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 279.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 279.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 280.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m'_Compile_Write_Instruction_X64 find wdiss pause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 282.004 : char :> [33;40mint[34;49m <: 0x00007ffff72979e0 :> [34;49m[34;49m[33;40mint[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mint[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 284.2
[34;49m ..                                       [34;49m[33;40mint[34;49m[34;49m  _CalculateRex ( _reg rm rex_w_flag | rex ) {  .. [34;49m[32;49m
0x7ffff72fdaa4    e900000000              jmp 0x7ffff72fdaa9         	< C compiler code >        [34;49m[32;49m
0x7ffff72fdaa9    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fdaad    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fdab1    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 284.2 :> [39;49mint[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c8f8b8[34;49m.
dbg[c]  :: [34;49m...[34;49m : 285.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif 1 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 285.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m 1 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 285.006 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5c8ee08 :> [34;49m#if [34;49m[33;40m1[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 285.6 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[c]  :: [34;49m...[34;49m : 286.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49m  0100    WRXB [34;49m 
dbg[c]  :: [34;49m...[34;49m : 287.008 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8efd0 :> [34;49m    [34;49m[33;40mrex[34;49m[34;49m = 0 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 287.010 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    rex [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 287.012 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c8ec40 :> [34;49m    rex = [34;49m[33;40m0[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 287.12
[34;49m ..  ( _reg rm rex_w_flag | rex ) { rex = [34;49m[33;40m0[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdab8    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fdac2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdac6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 287.014 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    rex [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 287.14[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c8ec40	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8efd0	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8ee08	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 287.14
dbg[c]  :: [34;49m...[34;49m : 287.014 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8ea78 :> [34;49m    [34;49m[33;40mrex[34;49m[34;49m = 0 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 287.14
[34;49m .. ateRex ( _reg rm rex_w_flag | rex ) { [34;49m[33;40mrex[34;49m[34;49m = 0 ; [34;49m[32;49m
0x7ffff72fdac9    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdacd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdad1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 287.014 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    rex [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 287.14[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8ea78	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8ee08	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 287.14
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 287.14
[34;49m .. ex ( _reg rm rex_w_flag | rex ) { rex [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m[32;49m
0x7ffff72fdac2    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdac6    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 287.014 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    rex = 0 [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 288.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( rex_w_flag ) rex = 8 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 288.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m rex_w_flag ) rex = 8 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 288.8
[34;49m ..  rm rex_w_flag | rex ) { rex = 0 ; if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fdac9    e900000000              jmp 0x7ffff72fdace         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 288.020 : locals_0 :> [33;40mrex_w_flag[34;49m <: 0x00007ffff5c8f198 :> [34;49m    if ( [34;49m[33;40mrex_w_flag[34;49m[34;49m ) rex = 8 ; [34;49m 
_Do_C_Syntax_Variable : word = rex_w_flag :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex_w_flag[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 288.20
[34;49m .. m rex_w_flag | rex ) { rex = 0 ; if ( [34;49m[33;40mrex_w_flag[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdace    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fdad2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdad6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 288.021 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( rex_w_flag [34;49m[33;40m)[34;49m[34;49m rex = 8 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 288.21
[34;49m .. g | rex ) { rex = 0 ; if ( rex_w_flag [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fdad9    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 288.21 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fdace[34;49m.
dbg[c]  :: [34;49m...[34;49m : 288.026 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    if ( rex_w_flag ) [34;49m[33;40m{[34;49m[34;49mex = 8 ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 288.26
[34;49m ..  | rex ) { rex = 0 ; if ( rex_w_flag )[34;49m[33;40m{[34;49m[34;49mrex [34;49m[32;49m
0x7ffff72fdada    e900000000              jmp 0x7ffff72fdadf         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 288.026 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8efd0 :> [34;49m    if ( rex_w_flag ) [34;49m[33;40mrex[34;49m[34;49m = 8 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 288.028 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    if ( rex_w_flag ) rex [34;49m[33;40m=[34;49m[34;49m 8 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 288.030 : <literal> :> [33;40m8[34;49m <: 0x00007ffff5c8e190 :> [34;49m    if ( rex_w_flag ) rex = [34;49m[33;40m8[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m8[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 288.30
[34;49m .. ) { rex = 0 ; if ( rex_w_flag ) rex = [34;49m[33;40m8[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdadf    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fdae9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdaed    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 288.032 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    if ( rex_w_flag ) rex [34;49m[33;40m=[34;49m[34;49m 8 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 288.32[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8e190	< word : <literal>.[34;49m8[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8e358	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 288.32
dbg[c]  :: [34;49m...[34;49m : 288.032 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8dfc8 :> [34;49m    if ( rex_w_flag ) [34;49m[33;40mrex[34;49m[34;49m = 8 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 288.32
[34;49m .. | rex ) { rex = 0 ; if ( rex_w_flag ) [34;49m[33;40mrex[34;49m[34;49m = 8 ; [34;49m[32;49m
0x7ffff72fdaf0    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdaf4    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdaf8    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 288.032 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    if ( rex_w_flag ) rex [34;49m[33;40m=[34;49m[34;49m 8 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 288.32[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8dfc8	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 288.32
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 288.32
[34;49m .. x ) { rex = 0 ; if ( rex_w_flag ) rex [34;49m[33;40m=[34;49m[34;49m 8 ; [34;49m[32;49m
0x7ffff72fdae9    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdaed    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 288.032 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    if ( rex_w_flag ) rex = 8 [34;49m[33;40m;[34;49m[34;49m [34;49m 
DataStack at : [39;49mnamespaces/compiler/x64.cft : 289.7[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8f8b8	< word : int.[39;49m_CalculateRex[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 289.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( _reg > 0x7 ) rex += 4 ; // (1 << 2) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 289.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m _reg > 0x7 ) rex += 4 ; // (1 << 2) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 289.8
[34;49m ..  = 0 ; if ( rex_w_flag ) rex = 8 ; if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fdae7    e900000000              jmp 0x7ffff72fdaec         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 289.014 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c8f528 :> [34;49m    if ( [34;49m[33;40m_reg[34;49m[34;49m > 0x7 ) rex += 4 ; // (1 << 2) ; [34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 289.14
[34;49m ..  0 ; if ( rex_w_flag ) rex = 8 ; if ( [34;49m[33;40m_reg[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdaec    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fdaf0    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdaf4    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 289.016 : Logic :> [33;40m>[34;49m <: cprimitive :> [34;49m    if ( _reg [34;49m[33;40m>[34;49m[34;49m 0x7 ) rex += 4 ; // (1 << 2) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 289.020 : <literal> :> [33;40m0x7[34;49m <: 0x00007ffff5c8d350 :> [34;49m    if ( _reg > [34;49m[33;40m0x7[34;49m[34;49m ) rex += 4 ; // (1 << 2) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x7[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 289.20
[34;49m ..  ( rex_w_flag ) rex = 8 ; if ( _reg > [34;49m[33;40m0x7[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdaf7    48b80700000000000000    mov rax, 0x7                                           [34;49m[32;49m
0x7ffff72fdb01    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb05    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 289.020 : Logic :> [33;40m>[34;49m <: cprimitive :> [34;49m    if ( _reg [34;49m[33;40m>[34;49m[34;49m 0x7 ) rex += 4 ; // (1 << 2) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 289.20[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8d350	< word : <literal>.[34;49m0x7[39;49m : value = 0x0000000000000007 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8f528	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.> :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 289.20
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m>[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 289.20
[34;49m .. if ( rex_w_flag ) rex = 8 ; if ( _reg [34;49m[33;40m>[34;49m[34;49m 0x7 [34;49m[32;49m
0x7ffff72fdaf0    48b90700000000000000    mov rcx, 0x7                                           [34;49m[32;49m
0x7ffff72fdafa    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fdafd    0f9fc0                  setg al                                                [34;49m[32;49m
0x7ffff72fdb00    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fdb04    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb08    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 289.021 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( _reg > 0x7 [34;49m[33;40m)[34;49m[34;49m rex += 4 ; // (1 << 2) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 289.21
[34;49m .. ex_w_flag ) rex = 8 ; if ( _reg > 0x7 [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fdb0b    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 289.21 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fdaec[34;49m.
dbg[c]  :: [34;49m...[34;49m : 289.026 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    if ( _reg > 0x7 ) [34;49m[33;40m{[34;49m[34;49mex += 4 ; // (1 << 2) ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 289.26
[34;49m .. x_w_flag ) rex = 8 ; if ( _reg > 0x7 )[34;49m[33;40m{[34;49m[34;49mrex [34;49m[32;49m
0x7ffff72fdb0c    e900000000              jmp 0x7ffff72fdb11         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 289.026 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8efd0 :> [34;49m    if ( _reg > 0x7 ) [34;49m[33;40mrex[34;49m[34;49m += 4 ; // (1 << 2) ; [34;49m 
_Do_C_Syntax_Variable : word = rex :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 289.26
[34;49m .. _w_flag ) rex = 8 ; if ( _reg > 0x7 ) [34;49m[33;40mrex[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdb11    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdb15    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb19    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 289.029 : Int :> [33;40m+=[34;49m <: cprimitive :> [34;49m    if ( _reg > 0x7 ) rex [34;49m[33;40m+=[34;49m[34;49m 4 ; // (1 << 2) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 289.031 : <literal> :> [33;40m4[34;49m <: 0x00007ffff5c8ca68 :> [34;49m    if ( _reg > 0x7 ) rex += [34;49m[33;40m4[34;49m[34;49m ; // (1 << 2) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m4[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 289.31
[34;49m ..  ) rex = 8 ; if ( _reg > 0x7 ) rex += [34;49m[33;40m4[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdb1c    48b80400000000000000    mov rax, 0x4                                           [34;49m[32;49m
0x7ffff72fdb26    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb2a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 289.033 : Int :> [33;40m+=[34;49m <: cprimitive :> [34;49m    if ( _reg > 0x7 ) rex [34;49m[33;40m+=[34;49m[34;49m 4 ; // (1 << 2) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m+=[34;49m <:   24 bytes : at namespaces/compiler/x64.cft : 289.33
[34;49m .. lag ) rex = 8 ; if ( _reg > 0x7 ) rex [34;49m[33;40m+=[34;49m[34;49m 4 ; [34;49m[32;49m
0x7ffff72fdb11    48b90400000000000000    mov rcx, 0x4                                           [34;49m[32;49m
0x7ffff72fdb1b    498d5f08                lea rbx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdb1f    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdb23    4803c1                  add rax, rcx                                           [34;49m[32;49m
0x7ffff72fdb26    488903                  mov [rbx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 289.033 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    if ( _reg > 0x7 ) rex += 4 [34;49m[33;40m;[34;49m[34;49m // (1 << 2) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 289.035 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    if ( _reg > 0x7 ) rex += 4 ; [34;49m[33;40m//[34;49m[34;49m (1 << 2) ; [34;49m 
DataStack at : [39;49mnamespaces/compiler/x64.cft : 291.7[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8f8b8	< word : int.[39;49m_CalculateRex[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 291.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( rm > 0x7 ) rex += 1 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 291.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m rm > 0x7 ) rex += 1 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 291.8
[34;49m .. = 8 ; if ( _reg > 0x7 ) rex += 4 ; if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fdb16    e900000000              jmp 0x7ffff72fdb1b         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 291.012 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c8f360 :> [34;49m    if ( [34;49m[33;40mrm[34;49m[34;49m > 0x7 ) rex += 1 ; [34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 291.12
[34;49m .. 8 ; if ( _reg > 0x7 ) rex += 4 ; if ( [34;49m[33;40mrm[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdb1b    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fdb1f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb23    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 291.014 : Logic :> [33;40m>[34;49m <: cprimitive :> [34;49m    if ( rm [34;49m[33;40m>[34;49m[34;49m 0x7 ) rex += 1 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 291.018 : <literal> :> [33;40m0x7[34;49m <: 0x00007ffff5c8bfb8 :> [34;49m    if ( rm > [34;49m[33;40m0x7[34;49m[34;49m ) rex += 1 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x7[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 291.18
[34;49m .. f ( _reg > 0x7 ) rex += 4 ; if ( rm > [34;49m[33;40m0x7[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdb26    48b80700000000000000    mov rax, 0x7                                           [34;49m[32;49m
0x7ffff72fdb30    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb34    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 291.018 : Logic :> [33;40m>[34;49m <: cprimitive :> [34;49m    if ( rm [34;49m[33;40m>[34;49m[34;49m 0x7 ) rex += 1 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 291.18[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8bfb8	< word : <literal>.[34;49m0x7[39;49m : value = 0x0000000000000007 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8f360	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.> :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 291.18
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m>[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 291.18
[34;49m ..  if ( _reg > 0x7 ) rex += 4 ; if ( rm [34;49m[33;40m>[34;49m[34;49m 0x7 [34;49m[32;49m
0x7ffff72fdb1f    48b90700000000000000    mov rcx, 0x7                                           [34;49m[32;49m
0x7ffff72fdb29    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fdb2c    0f9fc0                  setg al                                                [34;49m[32;49m
0x7ffff72fdb2f    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fdb33    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb37    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 291.019 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( rm > 0x7 [34;49m[33;40m)[34;49m[34;49m rex += 1 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 291.19
[34;49m .. _reg > 0x7 ) rex += 4 ; if ( rm > 0x7 [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fdb3a    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 291.19 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fdb1b[34;49m.
dbg[c]  :: [34;49m...[34;49m : 291.024 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    if ( rm > 0x7 ) [34;49m[33;40m{[34;49m[34;49mex += 1 ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 291.24
[34;49m .. reg > 0x7 ) rex += 4 ; if ( rm > 0x7 )[34;49m[33;40m{[34;49m[34;49mrex [34;49m[32;49m
0x7ffff72fdb3b    e900000000              jmp 0x7ffff72fdb40         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 291.024 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8efd0 :> [34;49m    if ( rm > 0x7 ) [34;49m[33;40mrex[34;49m[34;49m += 1 ; [34;49m 
_Do_C_Syntax_Variable : word = rex :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 291.24
[34;49m .. eg > 0x7 ) rex += 4 ; if ( rm > 0x7 ) [34;49m[33;40mrex[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdb40    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdb44    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb48    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 291.027 : Int :> [33;40m+=[34;49m <: cprimitive :> [34;49m    if ( rm > 0x7 ) rex [34;49m[33;40m+=[34;49m[34;49m 1 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 291.029 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5c8b508 :> [34;49m    if ( rm > 0x7 ) rex += [34;49m[33;40m1[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 291.29
[34;49m .. 7 ) rex += 4 ; if ( rm > 0x7 ) rex += [34;49m[33;40m1[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdb4b    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fdb55    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb59    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 291.031 : Int :> [33;40m+=[34;49m <: cprimitive :> [34;49m    if ( rm > 0x7 ) rex [34;49m[33;40m+=[34;49m[34;49m 1 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m+=[34;49m <:   24 bytes : at namespaces/compiler/x64.cft : 291.31
[34;49m ..  0x7 ) rex += 4 ; if ( rm > 0x7 ) rex [34;49m[33;40m+=[34;49m[34;49m 1 ; [34;49m[32;49m
0x7ffff72fdb40    48b90100000000000000    mov rcx, 0x1                                           [34;49m[32;49m
0x7ffff72fdb4a    498d5f08                lea rbx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdb4e    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdb52    4803c1                  add rax, rcx                                           [34;49m[32;49m
0x7ffff72fdb55    488903                  mov [rbx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 291.031 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    if ( rm > 0x7 ) rex += 1 [34;49m[33;40m;[34;49m[34;49m [34;49m 
DataStack at : [39;49mnamespaces/compiler/x64.cft : 292.7[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8f8b8	< word : int.[39;49m_CalculateRex[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 292.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( rex ) rex |= 0x40 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 292.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m rex ) rex |= 0x40 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 292.8
[34;49m ..  += 4 ; if ( rm > 0x7 ) rex += 1 ; if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fdb45    e900000000              jmp 0x7ffff72fdb4a         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 292.013 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8efd0 :> [34;49m    if ( [34;49m[33;40mrex[34;49m[34;49m ) rex |= 0x40 ; [34;49m 
_Do_C_Syntax_Variable : word = rex :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 292.13
[34;49m .. = 4 ; if ( rm > 0x7 ) rex += 1 ; if ( [34;49m[33;40mrex[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdb4a    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdb4e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb52    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 292.014 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( rex [34;49m[33;40m)[34;49m[34;49m rex |= 0x40 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 292.14
[34;49m .. ; if ( rm > 0x7 ) rex += 1 ; if ( rex [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fdb55    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 292.14 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fdb4a[34;49m.
dbg[c]  :: [34;49m...[34;49m : 292.019 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    if ( rex ) [34;49m[33;40m{[34;49m[34;49mex |= 0x40 ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 292.19
[34;49m ..  if ( rm > 0x7 ) rex += 1 ; if ( rex )[34;49m[33;40m{[34;49m[34;49mrex  .. [34;49m[32;49m
0x7ffff72fdb56    e900000000              jmp 0x7ffff72fdb5b         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 292.019 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8efd0 :> [34;49m    if ( rex ) [34;49m[33;40mrex[34;49m[34;49m |= 0x40 ; [34;49m 
_Do_C_Syntax_Variable : word = rex :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 292.19
[34;49m .. if ( rm > 0x7 ) rex += 1 ; if ( rex ) [34;49m[33;40mrex[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdb5b    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdb5f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb63    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 292.022 : Bits :> [33;40m|=[34;49m <: cprimitive :> [34;49m    if ( rex ) rex [34;49m[33;40m|=[34;49m[34;49m 0x40 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 292.027 : <literal> :> [33;40m0x40[34;49m <: 0x00007ffff5c852a0 :> [34;49m    if ( rex ) rex |= [34;49m[33;40m0x40[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x40[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 292.27
[34;49m ..  > 0x7 ) rex += 1 ; if ( rex ) rex |= [34;49m[33;40m0x40[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdb66    48b84000000000000000    mov rax, 0x40                                          [34;49m[32;49m
0x7ffff72fdb70    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb74    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 292.029 : Bits :> [33;40m|=[34;49m <: cprimitive :> [34;49m    if ( rex ) rex [34;49m[33;40m|=[34;49m[34;49m 0x40 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|=[34;49m <:   24 bytes : at namespaces/compiler/x64.cft : 292.29
[34;49m ..  rm > 0x7 ) rex += 1 ; if ( rex ) rex [34;49m[33;40m|=[34;49m[34;49m 0x40 ;  .. [34;49m[32;49m
0x7ffff72fdb5b    48b94000000000000000    mov rcx, 0x40                                          [34;49m[32;49m
0x7ffff72fdb65    498d5f08                lea rbx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdb69    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdb6d    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fdb70    488903                  mov [rbx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 292.029 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    if ( rex ) rex |= 0x40 [34;49m[33;40m;[34;49m[34;49m [34;49m 
DataStack at : [39;49mnamespaces/compiler/x64.cft : 293.11[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8f8b8	< word : int.[39;49m_CalculateRex[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 293.011 : Compiler :> [33;40mreturn[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mreturn[34;49m[34;49m rex ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 293.017 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    return rex [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 294.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49melse // from original C code and testing new '?' conditional expression [34;49m 
dbg[c]  :: [34;49m...[34;49m : 294.006 : PreProcessor :> [33;40melse[34;49m <: cprimitive :> [34;49m#[34;49m[33;40melse[34;49m[34;49m // from original C code and testing new '?' conditional expression [34;49m 
dbg[c]  :: [34;49m...[34;49m : 300.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix // prefix is not automatic with c syntax so they can be used like rpn words [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 300.2
[34;49m .. ) rex += 1 ; if ( rex ) rex |= 0x40 ; [34;49m[33;40mreturn[34;49m[34;49m rex ;  }  .. [34;49m[32;49m
0x7ffff72fdb6a    498b4708                mov rax, [r15+0x8]                                     [34;49m
[34;49m .. f ( rex ) rex |= 0x40 ; return rex ;  [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdb6e    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fdb72    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fdb76    4983ee10                sub r14, 0x10                                          [34;49m
[34;49m .. = 1 ; if ( rex ) rex |= 0x40 ; return [34;49m[33;40mrex[34;49m[34;49m ;  }  .. [34;49m[32;49m
0x7ffff72fdb7a    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fdb7d    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 300.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 300.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m // prefix is not automatic with c syntax so they can be used like rpn words [34;49m 
dbg[i]  :: [34;49m...[34;49m : 300.011 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m} prefix [34;49m[33;40m//[34;49m[34;49m prefix is not automatic with c syntax so they can be used like rpn words [34;49m 
dbg[i]  :: [34;49m...[34;49m : 304.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 306.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m Compile_CalcWrite_Instruction_X64 ( rex, opCode, _mod, _reg, rm, controlFlags, sib, disp, dispSize, .. [34;49m[32;49m
0x7ffff72fdb7e    e900000000              jmp 0x7ffff72fdb83         	< C compiler code >        [34;49m[32;49m
0x7ffff72fdb83    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fdb87    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fdb8b    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 306.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c84628[34;49m.
dbg[c]  :: [34;49m...[34;49m : 307.008 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c80078 :> [34;49m    [34;49m[33;40mrex[34;49m[34;49m = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.010 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    rex [34;49m[33;40m=[34;49m[34;49m _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.024 : int :> [33;40m_CalculateRex[34;49m <: 0x00007ffff5c8f8b8 :> [34;49m    rex = [34;49m[33;40m_CalculateRex[34;49m[34;49m ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& R[34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.030 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c80960 :> [34;49m    rex = _CalculateRex ( [34;49m[33;40m_reg[34;49m[34;49m, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B[34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 307.30
[34;49m .. ize | modRm ) { rex = _CalculateRex ( [34;49m[33;40m_reg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fdb92    498b47c0                mov rax, [r15-0x40]                                    [34;49m[32;49m
0x7ffff72fdb96    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb9a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.034 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c80eb8 :> [34;49m    rex = _CalculateRex ( _reg, [34;49m[33;40mrm[34;49m[34;49m, ( immSize == 8 ) || ( controlFlags Bits.& REX_B )[34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.036 : C_Syntax :> [33;40m,[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm[34;49m[33;40m,[34;49m[34;49m ( immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.036 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c80eb8 :> [34;49m    rex = _CalculateRex ( _reg, [34;49m[33;40mrm[34;49m[34;49m, ( immSize == 8 ) || ( controlFlags Bits.& REX_B )[34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 307.36
[34;49m .. modRm ) { rex = _CalculateRex ( _reg, [34;49m[33;40mrm[34;49m[34;49m,  .. [34;49m[32;49m
0x7ffff72fdb9d    498b47c8                mov rax, [r15-0x38]                                    [34;49m[32;49m
0x7ffff72fdba1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdba5    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.037 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, [34;49m[33;40m([34;49m[34;49m immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.046 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c82b38 :> [34;49m  rex = _CalculateRex ( _reg, rm, ( [34;49m[33;40mimmSize[34;49m[34;49m == 8 ) || ( controlFlags Bits.& REX_[34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 307.46
[34;49m .. ) { rex = _CalculateRex ( _reg, rm, ( [34;49m[33;40mimmSize[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdba8    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fdbac    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdbb0    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.049 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize [34;49m[33;40m==[34;49m[34;49m 8 ) || ( controlFlags Bits.& REX_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.051 : <literal> :> [33;40m8[34;49m <: 0x00007ffff5c82ec8 :> [34;49mex = _CalculateRex ( _reg, rm, ( immSize == [34;49m[33;40m8[34;49m[34;49m ) || ( controlFlags Bits.& REX_B ) ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m8[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 307.51
[34;49m .. CalculateRex ( _reg, rm, ( immSize == [34;49m[33;40m8[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdbb3    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fdbbd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdbc1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.051 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize [34;49m[33;40m==[34;49m[34;49m 8 ) || ( controlFlags Bits.& REX_B ) ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 307.51[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c82ec8	< word : <literal>.[34;49m8[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c82b38	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c80eb8	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c80960	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c80078	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.== :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 307.51
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m==[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 307.51
[34;49m .. = _CalculateRex ( _reg, rm, ( immSize [34;49m[33;40m==[34;49m[34;49m 8  .. [34;49m[32;49m
0x7ffff72fdbac    48b90800000000000000    mov rcx, 0x8                                           [34;49m[32;49m
0x7ffff72fdbb6    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fdbb9    0f94c0                  setz al                                                [34;49m[32;49m
0x7ffff72fdbbc    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fdbc0    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdbc4    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.052 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize == 8 [34;49m[33;40m)[34;49m[34;49m || ( controlFlags Bits.& REX_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.056 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize == 8 ) [34;49m[33;40m||[34;49m[34;49m ( controlFlags Bits.& REX_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.057 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize == 8 ) || [34;49m[33;40m([34;49m[34;49m controlFlags Bits.& REX_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.071 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c81080 :> [34;49mulateRex ( _reg, rm, ( immSize == 8 ) || ( [34;49m[33;40mcontrolFlags[34;49m[34;49m Bits.& REX_B ) ) ; [34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 307.71
[34;49m .. Rex ( _reg, rm, ( immSize == 8 ) || ( [34;49m[33;40mcontrolFlags[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdbc7    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fdbcb    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdbcf    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.075 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49mrex = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags [34;49m[33;40mBits[34;49m[34;49m.& REX_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.076 : Class :> [33;40m.[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits[34;49m[33;40m.[34;49m[34;49m& REX_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.078 : Bits :> [33;40m&[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m REX_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.084 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7d748 :> [34;49m rex = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& [34;49m[33;40mREX_B[34;49m[34;49m ) ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 307.84[32;49m
0x7ffff72fdbd2    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fdbdc    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdbe0    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.084 : Bits :> [33;40m&[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m REX_B ) ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 307.84[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c81080	< word : locals_0.[34;49mcontrolFlags[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c83090	< word : Logic.[34;49m==[39;49m : value = 0x00005555555b7f2a > : [34;49mInteger . Integer -> Boolean [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c80eb8	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c80960	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c80078	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Bits.& :: type expected : Integer . Integer  :: type recorded : Boolean . Undefined  : namespaces/compiler/x64.cft : 307.84
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m&[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 307.84
[34;49m .. immSize == 8 ) || ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m REX_B  .. [34;49m[32;49m
0x7ffff72fdbd2    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fdbdc    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdbe0    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fdbe3    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fdbe6    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fdbea    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fdbee    4823c1                  and rax, rcx                                           [34;49m[32;49m
0x7ffff72fdbf1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdbf5    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.085 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B [34;49m[33;40m)[34;49m[34;49m ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.085 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize == 8 ) [34;49m[33;40m||[34;49m[34;49m ( controlFlags Bits.& REX_B ) ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m||[34;49m <:   24 bytes : at namespaces/compiler/x64.cft : 307.85
[34;49m .. ulateRex ( _reg, rm, ( immSize == 8 ) [34;49m[33;40m||[34;49m[34;49m ( controlFlags Bits.& REX_B ) .. [34;49m[32;49m
0x7ffff72fdbf8    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fdbfb    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fdbff    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fdc03    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fdc06    4885c0                  test rax, rax                                          [34;49m[32;49m
0x7ffff72fdc09    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc0d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.087 : int :> [33;40m_CalculateRex[34;49m <: 0x00007ffff5c8f8b8 :> [34;49m    rex = [34;49m[33;40m_CalculateRex[34;49m[34;49m ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& R[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 307.87[39;49m :
TypeWordStack depth =   4 :  = Top = 0x00007ffff7fc1a40, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c87bd0	< word : Bits.[34;49m&[39;49m : value = 0x00005555555b743a > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c80eb8	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c80960	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c80078	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: int._CalculateRex :: type expected : Integer . Integer  :: type recorded : Undefined . Undefined . Integer  : namespaces/compiler/x64.cft : 307.87
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_CalculateRex[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 307.87
[34;49m .. pSize, imm, immSize | modRm ) { rex = [34;49m[33;40m_CalculateRex[34;49m[34;49m ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) .. [34;49m[32;49m
0x7ffff72fdc10    49b9a9da2ff7ff7f0000    mov r9, 0x7ffff72fdaa9                                 [34;49m[32;49m
0x7ffff72fdc1a    49ffd1                  call r9                    	< int.[39;49m_CalculateRex[34;49m : 0x00007ffff72fdaa9 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 307.090 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    rex [34;49m[33;40m=[34;49m[34;49m _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 307.90[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c88128	< word : int.[34;49m_CalculateRex[39;49m : value = 0x00007ffff72fdaa9 > : [34;49mInteger . Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c80078	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 307.90
dbg[c]  :: [34;49m...[34;49m : 307.090 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c882f0 :> [34;49m    [34;49m[33;40mrex[34;49m[34;49m = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 307.90
[34;49m .. p, dispSize, imm, immSize | modRm ) { [34;49m[33;40mrex[34;49m[34;49m = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) ;  .. [34;49m[32;49m
0x7ffff72fdc1d    498d47a8                lea rax, [r15-0x58]                                    [34;49m[32;49m
0x7ffff72fdc21    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc25    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.090 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    rex [34;49m[33;40m=[34;49m[34;49m _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 307.90[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c882f0	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 307.90
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 307.90
[34;49m .. ispSize, imm, immSize | modRm ) { rex [34;49m[33;40m=[34;49m[34;49m _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) ;  .. [34;49m[32;49m
0x7ffff72fdc21    488bc8                  mov rcx, rax                                           [34;49m[32;49m
0x7ffff72fdc24    498b06                  mov rax, [r14]                                         [34;49m[32;49m
0x7ffff72fdc27    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc2b    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.090 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 308.010 : locals_0 :> [33;40mmodRm[34;49m <: 0x00007ffff5c82d00 :> [34;49m    [34;49m[33;40mmodRm[34;49m[34;49m = CalculateModRmByte ( _mod, _reg, rm, sib, disp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 308.012 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    modRm [34;49m[33;40m=[34;49m[34;49m CalculateModRmByte ( _mod, _reg, rm, sib, disp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 308.031 : int :> [33;40mCalculateModRmByte[34;49m <: 0x00007ffff5c84098 :> [34;49m    modRm = [34;49m[33;40mCalculateModRmByte[34;49m[34;49m ( _mod, _reg, rm, sib, disp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 308.037 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c80798 :> [34;49m    modRm = CalculateModRmByte ( [34;49m[33;40m_mod[34;49m[34;49m, _reg, rm, sib, disp ) ; [34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 308.37
[34;49m .. _B ) ) ; modRm = CalculateModRmByte ( [34;49m[33;40m_mod[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdc2e    498b47b8                mov rax, [r15-0x48]                                    [34;49m[32;49m
0x7ffff72fdc32    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc36    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 308.043 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c80960 :> [34;49m    modRm = CalculateModRmByte ( _mod, [34;49m[33;40m_reg[34;49m[34;49m, rm, sib, disp ) ; [34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 308.43
[34;49m ..  ; modRm = CalculateModRmByte ( _mod, [34;49m[33;40m_reg[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdc39    498b47c0                mov rax, [r15-0x40]                                    [34;49m[32;49m
0x7ffff72fdc3d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc41    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 308.047 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c80eb8 :> [34;49m    modRm = CalculateModRmByte ( _mod, _reg, [34;49m[33;40mrm[34;49m[34;49m, sib, disp ) ; [34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 308.47
[34;49m .. Rm = CalculateModRmByte ( _mod, _reg, [34;49m[33;40mrm[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdc44    498b47c8                mov rax, [r15-0x38]                                    [34;49m[32;49m
0x7ffff72fdc48    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc4c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 308.052 : locals_0 :> [33;40msib[34;49m <: 0x00007ffff5c81410 :> [34;49m    modRm = CalculateModRmByte ( _mod, _reg, rm, [34;49m[33;40msib[34;49m[34;49m, disp ) ; [34;49m 
_Do_C_Syntax_Variable : word = sib :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msib[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 308.52
[34;49m ..  CalculateModRmByte ( _mod, _reg, rm, [34;49m[33;40msib[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdc4f    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fdc53    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc57    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 308.059 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c817a0 :> [34;49m    modRm = CalculateModRmByte ( _mod, _reg, rm, sib, [34;49m[33;40mdisp[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 308.59
[34;49m .. ulateModRmByte ( _mod, _reg, rm, sib, [34;49m[33;40mdisp[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdc5a    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fdc5e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc62    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 308.060 : int :> [33;40mCalculateModRmByte[34;49m <: 0x00007ffff5c84098 :> [34;49m    modRm = [34;49m[33;40mCalculateModRmByte[34;49m[34;49m ( _mod, _reg, rm, sib, disp ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCalculateModRmByte[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 308.60
[34;49m .. ntrolFlags Bits.& REX_B ) ) ; modRm = [34;49m[33;40mCalculateModRmByte[34;49m[34;49m ( _mod, _reg, rm, sib, disp ) .. [34;49m[32;49m
0x7ffff72fdc65    49b9b2d32ff7ff7f0000    mov r9, 0x7ffff72fd3b2                                 [34;49m[32;49m
0x7ffff72fdc6f    49ffd1                  call r9                    	< int.[39;49mCalculateModRmByte[34;49m : 0x00007ffff72fd3b2 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 308.063 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    modRm [34;49m[33;40m=[34;49m[34;49m CalculateModRmByte ( _mod, _reg, rm, sib, disp ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 308.63[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c817a0	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c81410	< word : locals_0.[34;49msib[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c88bd8	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c88a10	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c80798	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c82d00	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Undefined . Undefined  : namespaces/compiler/x64.cft : 308.63
dbg[c]  :: [34;49m...[34;49m : 308.063 : locals_0 :> [33;40mmodRm[34;49m <: 0x00007ffff5c88da0 :> [34;49m    [34;49m[33;40mmodRm[34;49m[34;49m = CalculateModRmByte ( _mod, _reg, rm, sib, disp ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mmodRm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 308.63
[34;49m ..  || ( controlFlags Bits.& REX_B ) ) ; [34;49m[33;40mmodRm[34;49m[34;49m = CalculateModRmByte ( _mod, _reg, rm, sib, disp ) ;  .. [34;49m[32;49m
0x7ffff72fdc72    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdc76    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc7a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 308.063 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    modRm [34;49m[33;40m=[34;49m[34;49m CalculateModRmByte ( _mod, _reg, rm, sib, disp ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 308.63[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c88da0	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c88bd8	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c88a10	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c80798	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c82d00	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer . Undefined  : namespaces/compiler/x64.cft : 308.63
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 308.63
[34;49m .. controlFlags Bits.& REX_B ) ) ; modRm [34;49m[33;40m=[34;49m[34;49m CalculateModRmByte ( _mod, _reg, rm, sib, disp ) ;  .. [34;49m[32;49m
0x7ffff72fdc76    488bc8                  mov rcx, rax                                           [34;49m[32;49m
0x7ffff72fdc79    498b06                  mov rax, [r14]                                         [34;49m[32;49m
0x7ffff72fdc7c    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc80    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 308.063 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    modRm = CalculateModRmByte ( _mod, _reg, rm, sib, disp ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 309.035 : void :> [33;40m_Compile_Write_Instruction_X64[34;49m <: 0x00007ffff5c8af78 :> [34;49m    [34;49m[33;40m_Compile_Write_Instruction_X64[34;49m[34;49m ( rex, opCode, modRm, cont[34;49m 
dbg[c]  :: [34;49m...[34;49m : 309.040 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c80078 :> [34;49m    _Compile_Write_Instruction_X64 ( [34;49m[33;40mrex[34;49m[34;49m, opCode, modRm, controlFlags, sib, disp, di[34;49m 
_Do_C_Syntax_Variable : word = rex :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.40
[34;49m ..  ) ; _Compile_Write_Instruction_X64 ( [34;49m[33;40mrex[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdc83    498b47a8                mov rax, [r15-0x58]                                    [34;49m[32;49m
0x7ffff72fdc87    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc8b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.048 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c80408 :> [34;49mCompile_Write_Instruction_X64 ( rex, [34;49m[33;40mopCode[34;49m[34;49m, modRm, controlFlags, sib, disp, disp[34;49m 
_Do_C_Syntax_Variable : word = opCode :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.48
[34;49m .. _Compile_Write_Instruction_X64 ( rex, [34;49m[33;40mopCode[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdc8e    498b47b0                mov rax, [r15-0x50]                                    [34;49m[32;49m
0x7ffff72fdc92    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc96    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.055 : locals_0 :> [33;40mmodRm[34;49m <: 0x00007ffff5c82d00 :> [34;49m_Write_Instruction_X64 ( rex, opCode, [34;49m[33;40mmodRm[34;49m[34;49m, controlFlags, sib, disp, dispSize, im[34;49m 
_Do_C_Syntax_Variable : word = modRm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mmodRm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.55
[34;49m .. _Write_Instruction_X64 ( rex, opCode, [34;49m[33;40mmodRm[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdc99    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdc9d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdca1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.069 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c81080 :> [34;49mtion_X64 ( rex, opCode, modRm, [34;49m[33;40mcontrolFlags[34;49m[34;49m, sib, disp, dispSize, imm, immS[34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.69
[34;49m .. Instruction_X64 ( rex, opCode, modRm, [34;49m[33;40mcontrolFlags[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdca4    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fdca8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdcac    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.074 : locals_0 :> [33;40msib[34;49m <: 0x00007ffff5c81410 :> [34;49mction_X64 ( rex, opCode, modRm, controlFlags, [34;49m[33;40msib[34;49m[34;49m, disp, dispSize, imm, immSize ) ; [34;49m 
_Do_C_Syntax_Variable : word = sib :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msib[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.74
[34;49m .. 4 ( rex, opCode, modRm, controlFlags, [34;49m[33;40msib[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdcaf    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fdcb3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdcb7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.080 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c817a0 :> [34;49mtion_X64 ( rex, opCode, modRm, controlFlags, sib, [34;49m[33;40mdisp[34;49m[34;49m, dispSize, imm, immSize ) ; [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.80
[34;49m .. ex, opCode, modRm, controlFlags, sib, [34;49m[33;40mdisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdcba    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fdcbe    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdcc2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.090 : locals_0 :> [33;40mdispSize[34;49m <: 0x00007ffff5c81cf8 :> [34;49m_X64 ( rex, opCode, modRm, controlFlags, sib, disp, [34;49m[33;40mdispSize[34;49m[34;49m, imm, immSize ) ; [34;49m 
_Do_C_Syntax_Variable : word = dispSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdispSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.90
[34;49m .. Code, modRm, controlFlags, sib, disp, [34;49m[33;40mdispSize[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdcc5    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fdcc9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdccd    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.095 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5c81ec0 :> [34;49mction_X64 ( rex, opCode, modRm, controlFlags, sib, disp, dispSize, [34;49m[33;40mimm[34;49m[34;49m, immSize ) ; [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.95
[34;49m .. m, controlFlags, sib, disp, dispSize, [34;49m[33;40mimm[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdcd0    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fdcd4    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdcd8    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.105 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c82b38 :> [34;49mn_X64 ( rex, opCode, modRm, controlFlags, sib, disp, dispSize, imm, [34;49m[33;40mimmSize[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.105
[34;49m .. ntrolFlags, sib, disp, dispSize, imm, [34;49m[33;40mimmSize[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdcdb    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fdcdf    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdce3    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.106 : void :> [33;40m_Compile_Write_Instruction_X64[34;49m <: 0x00007ffff5c8af78 :> [34;49m    [34;49m[33;40m_Compile_Write_Instruction_X64[34;49m[34;49m ( rex, opCode, modRm, cont[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 309.106[39;49m :
TypeWordStack depth =  12 :  = Top = 0x00007ffff7fc1a80, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a80 > = 0x00007ffff5c85468	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a78 > = 0x00007ffff5c81ec0	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a70 > = 0x00007ffff5c81cf8	< word : locals_0.[34;49mdispSize[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a68 > = 0x00007ffff5c850d8	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a60 > = 0x00007ffff5c84f10	< word : locals_0.[34;49msib[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a58 > = 0x00007ffff5c849b8	< word : locals_0.[34;49mcontrolFlags[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -6 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c89850	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -7 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c80408	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -8 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c89688	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -9 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c88a10	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [ -10 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c80798	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [ -11 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c82d00	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: void._Compile_Write_Instruction_X64 :: type expected :  :: type recorded : Integer . Undefined . Undefined . Integer . Undefined . Undefined . Undefined . Undefined . Integer  : namespaces/compiler/x64.cft : 309.106
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Write_Instruction_X64[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 309.106
[34;49m .. mByte ( _mod, _reg, rm, sib, disp ) ; [34;49m[33;40m_Compile_Write_Instruction_X64[34;49m[34;49m ( rex, opCode, modRm, controlFlags, sib, disp, dispSize, imm, immSize ) .. [34;49m[32;49m
0x7ffff72fdce6    49b91cd72ff7ff7f0000    mov r9, 0x7ffff72fd71c                                 [34;49m[32;49m
0x7ffff72fdcf0    49ffd1                  call r9                    	< void.[39;49m_Compile_Write_Instruction_X64[34;49m : 0x00007ffff72fd71c >[34;49m
dbg[c]  :: [34;49m...[34;49m : 309.109 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49mite_Instruction_X64 ( rex, opCode, modRm, controlFlags, sib, disp, dispSize, imm, immSize ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 310.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 310.2
[34;49m .. sib, disp, dispSize, imm, immSize ) ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdcf3    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fdcf7    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fdcfb    4983ee58                sub r14, 0x58                                          [34;49m[32;49m
0x7ffff72fdcff    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 310.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 310.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 311.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m'Compile_CalcWrite_Instruction_X64 find wdiss apause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 313.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 315.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m  _Compile_Move ( toRegOrMem _mod _reg rm controlFlags disp | opCode )  {  .. [34;49m[32;49m
0x7ffff72fdd00    e900000000              jmp 0x7ffff72fdd05         	< C compiler code >        [34;49m[32;49m
0x7ffff72fdd05    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fdd09    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fdd0d    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 315.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c859c0[34;49m.
dbg[c]  :: [34;49m...[34;49m : 316.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( toRegOrMem == REG ) opCode = #x8b ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 316.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m toRegOrMem == REG ) opCode = #x8b ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 316.8
[34;49m .. rm controlFlags disp | opCode )  { if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fdd14    e900000000              jmp 0x7ffff72fdd19         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 316.020 : locals_0 :> [33;40mtoRegOrMem[34;49m <: 0x00007ffff5c860e0 :> [34;49m    if ( [34;49m[33;40mtoRegOrMem[34;49m[34;49m == REG ) opCode = #x8b ; [34;49m 
_Do_C_Syntax_Variable : word = toRegOrMem :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mtoRegOrMem[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 316.20
[34;49m ..  controlFlags disp | opCode )  { if ( [34;49m[33;40mtoRegOrMem[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdd19    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fdd1d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd21    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 316.023 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m    if ( toRegOrMem [34;49m[33;40m==[34;49m[34;49m REG ) opCode = #x8b ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 316.027 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b6f20 :> [34;49m    if ( toRegOrMem == [34;49m[33;40mREG[34;49m[34;49m ) opCode = #x8b ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 316.27
[34;49m .. disp | opCode )  { if ( toRegOrMem == [34;49m[33;40mREG[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdd24    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fdd2e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd32    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 316.027 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m    if ( toRegOrMem [34;49m[33;40m==[34;49m[34;49m REG ) opCode = #x8b ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 316.27[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b6f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c860e0	< word : locals_0.[34;49mtoRegOrMem[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.== :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 316.27
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m==[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 316.27
[34;49m .. gs disp | opCode )  { if ( toRegOrMem [34;49m[33;40m==[34;49m[34;49m REG [34;49m[32;49m
0x7ffff72fdd1d    48b90300000000000000    mov rcx, 0x3                                           [34;49m[32;49m
0x7ffff72fdd27    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fdd2a    0f94c0                  setz al                                                [34;49m[32;49m
0x7ffff72fdd2d    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fdd31    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd35    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 316.028 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( toRegOrMem == REG [34;49m[33;40m)[34;49m[34;49m opCode = #x8b ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 316.28
[34;49m ..  | opCode )  { if ( toRegOrMem == REG [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fdd38    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 316.28 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fdd19[34;49m.
dbg[c]  :: [34;49m...[34;49m : 316.036 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    if ( toRegOrMem == REG ) [34;49m[33;40m{[34;49m[34;49mpCode = #x8b ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 316.36
[34;49m .. | opCode )  { if ( toRegOrMem == REG )[34;49m[33;40m{[34;49m[34;49mopCode [34;49m[32;49m
0x7ffff72fdd39    e900000000              jmp 0x7ffff72fdd3e         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 316.036 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8b898 :> [34;49m    if ( toRegOrMem == REG ) [34;49m[33;40mopCode[34;49m[34;49m = #x8b ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 316.038 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    if ( toRegOrMem == REG ) opCode [34;49m[33;40m=[34;49m[34;49m #x8b ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 316.043 : <literal> :> [33;40m#x8b[34;49m <: 0x00007ffff5c8c180 :> [34;49m    if ( toRegOrMem == REG ) opCode = [34;49m[33;40m#x8b[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m#x8b[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 316.43
[34;49m ..   { if ( toRegOrMem == REG ) opCode = [34;49m[33;40m#x8b[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdd3e    48b88b00000000000000    mov rax, 0x8b                                          [34;49m[32;49m
0x7ffff72fdd48    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd4c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 316.045 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    if ( toRegOrMem == REG ) opCode [34;49m[33;40m=[34;49m[34;49m #x8b ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 316.45[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8c180	< word : <literal>.[34;49m#x8b[39;49m : value = 0x000000000000008b > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8b898	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 316.45
dbg[c]  :: [34;49m...[34;49m : 316.045 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8c348 :> [34;49m    if ( toRegOrMem == REG ) [34;49m[33;40mopCode[34;49m[34;49m = #x8b ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 316.45
[34;49m ..  opCode )  { if ( toRegOrMem == REG ) [34;49m[33;40mopCode[34;49m[34;49m = #x8b ; [34;49m[32;49m
0x7ffff72fdd4f    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdd53    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd57    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 316.045 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    if ( toRegOrMem == REG ) opCode [34;49m[33;40m=[34;49m[34;49m #x8b ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 316.45[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8c348	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 316.45
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 316.45
[34;49m ..  )  { if ( toRegOrMem == REG ) opCode [34;49m[33;40m=[34;49m[34;49m #x8b ; [34;49m[32;49m
0x7ffff72fdd48    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdd4c    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 316.045 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    if ( toRegOrMem == REG ) opCode = #x8b [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 317.016 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    else [34;49m[33;40m{[34;49m[34;49mpCode = #x89 ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 317.16
[34;49m .. gOrMem == REG ) opCode = #x8b ;  else [34;49m[33;40m{[34;49m[34;49mpCode [34;49m[32;49m
0x7ffff72fdd50    e900000000              jmp 0x7ffff72fdd55         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 317.016 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8b898 :> [34;49m    else [34;49m[33;40mopCode[34;49m[34;49m = #x89 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 317.018 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    else opCode [34;49m[33;40m=[34;49m[34;49m #x89 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 317.023 : <literal> :> [33;40m#x89[34;49m <: 0x00007ffff5c8cdf8 :> [34;49m    else opCode = [34;49m[33;40m#x89[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m#x89[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 317.23
[34;49m ..  REG ) opCode = #x8b ;  else opCode = [34;49m[33;40m#x89[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdd55    48b88900000000000000    mov rax, 0x89                                          [34;49m[32;49m
0x7ffff72fdd5f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd63    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 317.025 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    else opCode [34;49m[33;40m=[34;49m[34;49m #x89 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 317.25[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8cdf8	< word : <literal>.[34;49m#x89[39;49m : value = 0x0000000000000089 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8cc30	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 317.25
dbg[c]  :: [34;49m...[34;49m : 317.025 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8cfc0 :> [34;49m    else [34;49m[33;40mopCode[34;49m[34;49m = #x89 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 317.25
[34;49m .. gOrMem == REG ) opCode = #x8b ;  else [34;49m[33;40mopCode[34;49m[34;49m = #x89 ; [34;49m[32;49m
0x7ffff72fdd66    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdd6a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd6e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 317.025 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    else opCode [34;49m[33;40m=[34;49m[34;49m #x89 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 317.25[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8cfc0	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 317.25
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 317.25
[34;49m .. == REG ) opCode = #x8b ;  else opCode [34;49m[33;40m=[34;49m[34;49m #x89 ; [34;49m[32;49m
0x7ffff72fdd5f    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdd63    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 317.025 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    else opCode = #x89 [34;49m[33;40m;[34;49m[34;49m [34;49m 
DataStack at : [39;49mnamespaces/compiler/x64.cft : 317.25[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c859c0	< word : void.[39;49m_Compile_Move[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 318.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49mCompile_CalcWrite_Instruction_X64 ( rex,  opCode,  _mod,  _reg,  rm, controlFlags,  [34;49m 
dbg[c]  :: [34;49m...[34;49m : 319.038 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c84628 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, opCode, _mod, _[34;49m 
dbg[c]  :: [34;49m...[34;49m : 319.041 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c8dc38 :> [34;49m    Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m, opCode, _mod, _reg, rm, controlFlags, 0, d[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 319.41
[34;49m .. ; Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdd52    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fdd5c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd60    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.049 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8b898 :> [34;49mmpile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40mopCode[34;49m[34;49m, _mod, _reg, rm, controlFlags, 0, dis[34;49m 
_Do_C_Syntax_Variable : word = opCode :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 319.49
[34;49m .. ompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40mopCode[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdd63    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdd67    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd6b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.055 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c862a8 :> [34;49mCalcWrite_Instruction_X64 ( 0, opCode, [34;49m[33;40m_mod[34;49m[34;49m, _reg, rm, controlFlags, 0, disp, 0, 0,[34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 319.55
[34;49m .. alcWrite_Instruction_X64 ( 0, opCode, [34;49m[33;40m_mod[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdd6e    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fdd72    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd76    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.061 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c869c8 :> [34;49mite_Instruction_X64 ( 0, opCode, _mod, [34;49m[33;40m_reg[34;49m[34;49m, rm, controlFlags, 0, disp, 0, 0, 0 ) ;[34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 319.61
[34;49m .. te_Instruction_X64 ( 0, opCode, _mod, [34;49m[33;40m_reg[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdd79    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fdd7d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd81    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.065 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c8b178 :> [34;49mrite_Instruction_X64 ( 0, opCode, _mod, _reg, [34;49m[33;40mrm[34;49m[34;49m, controlFlags, 0, disp, 0, 0, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 319.65
[34;49m .. truction_X64 ( 0, opCode, _mod, _reg, [34;49m[33;40mrm[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdd84    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fdd88    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd8c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.079 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c8b340 :> [34;49muction_X64 ( 0, opCode, _mod, _reg, rm, [34;49m[33;40mcontrolFlags[34;49m[34;49m, 0, disp, 0, 0, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 319.79
[34;49m .. tion_X64 ( 0, opCode, _mod, _reg, rm, [34;49m[33;40mcontrolFlags[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdd8f    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fdd93    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd97    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.082 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c8dfc8 :> [34;49mrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags, [34;49m[33;40m0[34;49m[34;49m, disp, 0, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 319.82
[34;49m .. opCode, _mod, _reg, rm, controlFlags, [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdd9a    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fdda4    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdda8    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.088 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c8b6d0 :> [34;49mte_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags, 0, [34;49m[33;40mdisp[34;49m[34;49m, 0, 0, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 319.88
[34;49m .. ode, _mod, _reg, rm, controlFlags, 0, [34;49m[33;40mdisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fddab    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fddaf    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fddb3    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.091 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c8e6e8 :> [34;49mrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags, 0, disp, [34;49m[33;40m0[34;49m[34;49m, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 319.91
[34;49m .. mod, _reg, rm, controlFlags, 0, disp, [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fddb6    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fddc0    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fddc4    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.099 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c84628 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, opCode, _mod, _[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 319.99[39;49m :
TypeWordStack depth =  11 :  = Top = 0x00007ffff7fc1a78, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a78 > = 0x00007ffff5c8ea78	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a70 > = 0x00007ffff5c8e8b0	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a68 > = 0x00007ffff5c8e6e8	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a60 > = 0x00007ffff5c8b6d0	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a58 > = 0x00007ffff5c8dfc8	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c8b340	< word : locals_0.[34;49mcontrolFlags[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -6 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c8b178	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -7 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c869c8	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -8 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c862a8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -9 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8de00	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [ -10 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8dc38	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: void.Compile_CalcWrite_Instruction_X64 :: type expected :  :: type recorded : Integer . Integer . Undefined . Undefined . Undefined . Undefined . Integer . Undefined . Integer . Integer . Integer  : namespaces/compiler/x64.cft : 319.99
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 319.99
[34;49m .. opCode = #x8b ;  else opCode = #x89 ; [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, opCode, _mod, _reg, rm, controlFlags, 0, disp, 0, 0, 0 ) .. [34;49m[32;49m
0x7ffff72fdde9    49b983db2ff7ff7f0000    mov r9, 0x7ffff72fdb83                                 [34;49m[32;49m
0x7ffff72fddf3    49ffd1                  call r9                    	< void.[39;49mCompile_CalcWrite_Instruction_X64[34;49m : 0x00007ffff72fdb83 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 319.102 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49mile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags, 0, disp, 0, 0, 0 ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 320.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 320.2
[34;49m .. m, controlFlags, 0, disp, 0, 0, 0 ) ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fddf6    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fddfa    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fddfe    4983ee30                sub r14, 0x30                                          [34;49m[32;49m
0x7ffff72fde02    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 320.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 320.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 321.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49m_Compile_Move find wdiss //pause [34;49m 
Stack : word at namespaces/compiler/x64.cft : 321.15 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff6e7ab82[34;49m.
dbg[i]  :: [34;49m...[34;49m : 321.020 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m'_Compile_Move [34;49m[33;40mfind[34;49m[34;49m wdiss //pause [34;49m 
Stack : word at namespaces/compiler/x64.cft : 321.20 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff5c859c0[34;49m.
dbg[i]  :: [34;49m...[34;49m : 321.026 : System :> [33;40mwdiss[34;49m <: 0x00007ffff71f6c68 :> [34;49m'_Compile_Move find [34;49m[33;40mwdiss[34;49m[34;49m //pause [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 321.26[39;49m :
TypeWordStack depth =   0 :  = Top = 0x00007ffff7fc1a20, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
type match :: System.wdiss :: type expected :  :: type recorded :  : namespaces/compiler/x64.cft : 321.26
void.[34;49m_Compile_Move[39;49m <:> cfrTil compiled word, prefix
SourceCode for void.[34;49m_Compile_Move[39;49m :> 
[34;49mvoid _Compile_Move ( toRegOrMem _mod _reg rm controlFlags disp | opCode ) { if ( toRegOrMem == REG ) opCode = #x8b ; else opCode = #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags, 0, disp, 0, 0, 0 ) ; } [39;49m
Source code file location of [34;49m_Compile_Move[39;49m : "namespaces/compiler/x64.cft" : 314.69 :: we are now at : namespaces/compiler/x64.cft : 321.26
Compiled with : optimizeOn, inlineOn, c_syntaxOn, infixOn
Debug Source Code on : BigNum off : Lisp off : Word Source Code on
starting at address : 0xf72fdd05 -- code size = 254 bytes
TypeSignature : Integer 
Word :: void.[34;49m_Compile_Move[39;49m : definition = 0x00007ffff72fdd05 : disassembly at namespaces/compiler/x64.cft : 321.26 :[32;49m
0x7ffff72fdd05    4d897e08                mov [r14+0x8], r15                                     [39;49m[32;49m
0x7ffff72fdd09    4d8d7e08                lea r15, [r14+0x8]                                     [39;49m[32;49m
0x7ffff72fdd0d    4981c610000000          add r14, 0x10                                          [39;49m
[34;49m ..  controlFlags disp | opCode )  { if ( [39;49m[33;40mtoRegOrMem[39;49m[34;49m == REG ) opCode = #x8b ;  else opCode = #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, .. [39;49m[32;49m
0x7ffff72fdd14    498b47d0                mov rax, [r15-0x30]                                    [39;49m
[34;49m .. disp | opCode )  { if ( toRegOrMem == [39;49m[33;40mREG[39;49m[34;49m ) opCode = #x8b ;  else opCode = #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, r .. [39;49m[32;49m
0x7ffff72fdd18    48b90300000000000000    mov rcx, 0x3                                           [39;49m
[34;49m .. gs disp | opCode )  { if ( toRegOrMem [39;49m[33;40m==[39;49m[34;49m REG ) opCode = #x8b ;  else opCode = #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg .. [39;49m[32;49m
0x7ffff72fdd22    483bc1                  cmp rax, rcx                                           [39;49m[32;49m
0x7ffff72fdd25    0f8516000000            jnz 0x7ffff72fdd41         	< void.[34;49m_Compile_Move[39;49m+60 >[39;49m
[34;49m ..   { if ( toRegOrMem == REG ) opCode = [39;49m[33;40m#x8b[39;49m[34;49m ;  else opCode = #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags .. [39;49m[32;49m
0x7ffff72fdd2b    48b88b00000000000000    mov rax, 0x8b                                          [39;49m
[34;49m ..  opCode )  { if ( toRegOrMem == REG ) [39;49m[33;40mopCode[39;49m[34;49m = #x8b ;  else opCode = #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, con .. [39;49m[32;49m
0x7ffff72fdd35    498d4f08                lea rcx, [r15+0x8]                                     [39;49m
[34;49m ..  )  { if ( toRegOrMem == REG ) opCode [39;49m[33;40m=[39;49m[34;49m #x8b ;  else opCode = #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFla .. [39;49m[32;49m
0x7ffff72fdd39    488901                  mov [rcx], rax                                         [39;49m
[34;49m .. f ( toRegOrMem == REG ) opCode = #x8b [39;49m[33;40m;[39;49m[34;49m  else opCode = #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags, 0,  .. [39;49m[32;49m
0x7ffff72fdd3c    e911000000              jmp 0x7ffff72fdd52         	< void.[34;49m_Compile_Move[39;49m+77 >[39;49m
[34;49m ..  REG ) opCode = #x8b ;  else opCode = [39;49m[33;40m#x89[39;49m[34;49m ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags, 0, disp, 0, 0, 0 ) ; .. [39;49m[32;49m
0x7ffff72fdd41    48b88900000000000000    mov rax, 0x89                                          [39;49m
[34;49m .. gOrMem == REG ) opCode = #x8b ;  else [39;49m[33;40mopCode[39;49m[34;49m = #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags, 0, disp, 0, .. [39;49m[32;49m
0x7ffff72fdd4b    498d4f08                lea rcx, [r15+0x8]                                     [39;49m
[34;49m .. == REG ) opCode = #x8b ;  else opCode [39;49m[33;40m=[39;49m[34;49m #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags, 0, disp, 0, 0, 0 ) .. [39;49m[32;49m
0x7ffff72fdd4f    488901                  mov [rcx], rax                                         [39;49m
[34;49m .. ; Compile_CalcWrite_Instruction_X64 ( [39;49m[33;40m0[39;49m[34;49m, opCode, _mod, _reg, rm, controlFlags, 0, disp, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fdd52    48b80000000000000000    mov rax, 0x0                                           [39;49m[32;49m
0x7ffff72fdd5c    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fdd60    498906                  mov [r14], rax                                         [39;49m
[34;49m .. ompile_CalcWrite_Instruction_X64 ( 0, [39;49m[33;40mopCode[39;49m[34;49m, _mod, _reg, rm, controlFlags, 0, disp, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fdd63    498b4708                mov rax, [r15+0x8]                                     [39;49m[32;49m
0x7ffff72fdd67    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fdd6b    498906                  mov [r14], rax                                         [39;49m
[34;49m .. alcWrite_Instruction_X64 ( 0, opCode, [39;49m[33;40m_mod[39;49m[34;49m, _reg, rm, controlFlags, 0, disp, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fdd6e    498b47d8                mov rax, [r15-0x28]                                    [39;49m[32;49m
0x7ffff72fdd72    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fdd76    498906                  mov [r14], rax                                         [39;49m
[34;49m .. te_Instruction_X64 ( 0, opCode, _mod, [39;49m[33;40m_reg[39;49m[34;49m, rm, controlFlags, 0, disp, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fdd79    498b47e0                mov rax, [r15-0x20]                                    [39;49m[32;49m
0x7ffff72fdd7d    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fdd81    498906                  mov [r14], rax                                         [39;49m
[34;49m .. truction_X64 ( 0, opCode, _mod, _reg, [39;49m[33;40mrm[39;49m[34;49m, controlFlags, 0, disp, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fdd84    498b47e8                mov rax, [r15-0x18]                                    [39;49m[32;49m
0x7ffff72fdd88    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fdd8c    498906                  mov [r14], rax                                         [39;49m
[34;49m .. tion_X64 ( 0, opCode, _mod, _reg, rm, [39;49m[33;40mcontrolFlags[39;49m[34;49m, 0, disp, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fdd8f    498b47f0                mov rax, [r15-0x10]                                    [39;49m[32;49m
0x7ffff72fdd93    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fdd97    498906                  mov [r14], rax                                         [39;49m
[34;49m .. opCode, _mod, _reg, rm, controlFlags, [39;49m[33;40m0[39;49m[34;49m, disp, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fdd9a    48b80000000000000000    mov rax, 0x0                                           [39;49m[32;49m
0x7ffff72fdda4    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fdda8    498906                  mov [r14], rax                                         [39;49m
[34;49m .. ode, _mod, _reg, rm, controlFlags, 0, [39;49m[33;40mdisp[39;49m[34;49m, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fddab    498b47f8                mov rax, [r15-0x8]                                     [39;49m[32;49m
0x7ffff72fddaf    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fddb3    498906                  mov [r14], rax                                         [39;49m
[34;49m .. mod, _reg, rm, controlFlags, 0, disp, [39;49m[33;40m0[39;49m[34;49m, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fddb6    48b80000000000000000    mov rax, 0x0                                           [39;49m[32;49m
0x7ffff72fddc0    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fddc4    498906                  mov [r14], rax                                         [39;49m
[34;49m .. , _reg, rm, controlFlags, 0, disp, 0, [39;49m[33;40m0[39;49m[34;49m, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fddc7    48b80000000000000000    mov rax, 0x0                                           [39;49m[32;49m
0x7ffff72fddd1    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fddd5    498906                  mov [r14], rax                                         [39;49m
[34;49m .. reg, rm, controlFlags, 0, disp, 0, 0, [39;49m[33;40m0[39;49m[34;49m ) ; }  .. [39;49m[32;49m
0x7ffff72fddd8    48b80000000000000000    mov rax, 0x0                                           [39;49m[32;49m
0x7ffff72fdde2    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fdde6    498906                  mov [r14], rax                                         [39;49m
[34;49m .. opCode = #x8b ;  else opCode = #x89 ; [39;49m[33;40mCompile_CalcWrite_Instruction_X64[39;49m[34;49m ( 0, opCode, _mod, _reg, rm, controlFlags, 0, disp, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fdde9    49b983db2ff7ff7f0000    mov r9, 0x7ffff72fdb83                                 [39;49m[32;49m
0x7ffff72fddf3    49ffd1                  call r9                    	< void.[34;49mCompile_CalcWrite_Instruction_X64[39;49m : 0x00007ffff72fdb83 >[39;49m
[34;49m .. m, controlFlags, 0, disp, 0, 0, 0 ) ; [39;49m[33;40m}[39;49m[34;49m  .. [39;49m[32;49m
0x7ffff72fddf6    4d8d77f8                lea r14, [r15-0x8]                                     [39;49m[32;49m
0x7ffff72fddfa    4d8b7e08                mov r15, [r14+0x8]                                     [39;49m[32;49m
0x7ffff72fddfe    4983ee30                sub r14, 0x30                                          [39;49m[32;49m
0x7ffff72fde02    c3                      ret                                                    [39;49m
Word_Disassemble : word - '_Compile_Move' :: codeSize = 2530x00007ffff72692380x00007ffff72fdd0532126
Stack : word at namespaces/compiler/x64.cft : 321.26 :> [39;49mwdiss[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 321.028 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m'_Compile_Move find wdiss [34;49m[33;40m//[34;49m[34;49mpause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 324.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m _Compile_Move_DataStackN_ToReg ( _reg n ) { _Compile_Move ( REG, MEM, _reg, DSP, [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 324.49
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_Move_DataStackN_ToReg ( _reg n ) {  .. [34;49m[32;49m
0x7ffff72fde03    e900000000              jmp 0x7ffff72fde08         	< C compiler code >        [34;49m[32;49m
0x7ffff72fde08    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fde0c    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fde10    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 324.49 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c85468[34;49m.
dbg[c]  :: [34;49m...[34;49m : 324.063 : void :> [33;40m_Compile_Move[34;49m <: 0x00007ffff5c859c0 :> [34;49me_DataStackN_ToReg ( _reg n ) { [34;49m[33;40m_Compile_Move[34;49m[34;49m ( REG, MEM, _reg, DSP, (REX_B | [34;49m 
dbg[c]  :: [34;49m...[34;49m : 324.068 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b6f20 :> [34;49maStackN_ToReg ( _reg n ) { _Compile_Move ( [34;49m[33;40mREG[34;49m[34;49m, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 324.68
[34;49m .. kN_ToReg ( _reg n ) { _Compile_Move ( [34;49m[33;40mREG[34;49m[34;49m[34;49m[32;49m
0x7ffff72fde17    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fde21    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde25    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.073 : X64 :> [33;40mMEM[34;49m <: 0x00007ffff74b7640 :> [34;49mkN_ToReg ( _reg n ) { _Compile_Move ( REG, [34;49m[33;40mMEM[34;49m[34;49m, _reg, DSP, (REX_B | MODRM_B | DISP_B), n [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMEM[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 324.73
[34;49m .. Reg ( _reg n ) { _Compile_Move ( REG, [34;49m[33;40mMEM[34;49m[34;49m[34;49m[32;49m
0x7ffff72fde28    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fde32    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde36    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.079 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c84f10 :> [34;49m( _reg n ) { _Compile_Move ( REG, MEM, [34;49m[33;40m_reg[34;49m[34;49m, DSP, (REX_B | MODRM_B | DISP_B), n * C[34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 324.79
[34;49m ..  _reg n ) { _Compile_Move ( REG, MEM, [34;49m[33;40m_reg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fde39    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fde3d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde41    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.084 : X64 :> [33;40mDSP[34;49m <: 0x00007ffff5c7b1e0 :> [34;49m_reg n ) { _Compile_Move ( REG, MEM, _reg, [34;49m[33;40mDSP[34;49m[34;49m, (REX_B | MODRM_B | DISP_B), n * CELL ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 324.086 : C_Syntax :> [33;40m,[34;49m <: cprimitive :> [34;49m_reg n ) { _Compile_Move ( REG, MEM, _reg, DSP[34;49m[33;40m,[34;49m[34;49m (REX_B | MODRM_B | DISP_B), n * CELL ) ; } pre[34;49m 
dbg[c]  :: [34;49m...[34;49m : 324.086 : X64 :> [33;40mDSP[34;49m <: 0x00007ffff5c7b1e0 :> [34;49m_reg n ) { _Compile_Move ( REG, MEM, _reg, [34;49m[33;40mDSP[34;49m[34;49m, (REX_B | MODRM_B | DISP_B), n * CELL ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDSP[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 324.86
[34;49m .. n ) { _Compile_Move ( REG, MEM, _reg, [34;49m[33;40mDSP[34;49m[34;49m, [34;49m[32;49m
0x7ffff72fde44    48b80e00000000000000    mov rax, 0xe                                           [34;49m[32;49m
0x7ffff72fde4e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde52    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.087 : C :> [33;40m([34;49m <: cprimitive :> [34;49m ( _reg n ) { _Compile_Move ( REG, MEM, _reg, DSP, [34;49m[33;40m([34;49m[34;49mREX_B | MODRM_B | DISP_B), n * CELL ) ; } prefix [34;49m 
dbg[c]  :: [34;49m...[34;49m : 324.093 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7d748 :> [34;49m { _Compile_Move ( REG, MEM, _reg, DSP, ([34;49m[33;40mREX_B[34;49m[34;49m | MODRM_B | DISP_B), n * CELL ) ; } pref[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 324.93[39;49m :
TypeWordStack depth =   4 :  = Top = 0x00007ffff7fc1a40, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c7b1e0	< word : X64.[34;49mDSP[39;49m : value = 0x000000000000000e > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c84f10	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b7640	< word : X64.[34;49mMEM[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a28 > = 0x00007ffff74b6f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
type match :: X64.REX_B :: type expected :  :: type recorded : Integer  : namespaces/compiler/x64.cft : 324.93
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 324.93[32;49m
0x7ffff72fde55    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fde5f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde63    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.095 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m_reg n ) { _Compile_Move ( REG, MEM, _reg, DSP, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | DISP_B), n * CELL ) ; } prefix [34;49m 
dbg[c]  :: [34;49m...[34;49m : 324.103 : X64 :> [33;40mMODRM_B[34;49m <: 0x00007ffff5c7dad8 :> [34;49mompile_Move ( REG, MEM, _reg, DSP, (REX_B | [34;49m[33;40mMODRM_B[34;49m[34;49m | DISP_B), n * CELL ) ; } prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMODRM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 324.103[32;49m
0x7ffff72fde66    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fde70    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde74    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.103 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m_reg n ) { _Compile_Move ( REG, MEM, _reg, DSP, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | DISP_B), n * CELL ) ; } prefix [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 324.103[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c84f10	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b7640	< word : X64.[34;49mMEM[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff74b6f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Integer . Undefined  : namespaces/compiler/x64.cft : 324.103
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 324.103
[34;49m .. le_Move ( REG, MEM, _reg, DSP, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B [34;49m[32;49m
0x7ffff72fde66    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fde70    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde74    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fde77    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fde7a    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fde7e    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fde82    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fde85    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde89    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.111 : X64 :> [33;40mDISP_B[34;49m <: 0x00007ffff5c7e1f8 :> [34;49mCompile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | [34;49m[33;40mDISP_B[34;49m[34;49m), n * CELL ) ; } prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDISP_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 324.111[32;49m
0x7ffff72fde8c    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fde96    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde9a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.111 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m_reg n ) { _Compile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m DISP_B), n * CELL ) ; } prefix [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 324.111[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c89850	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff74b6f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 324.111
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 324.111
[34;49m .. REG, MEM, _reg, DSP, (REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m DISP_B[34;49m[32;49m
0x7ffff72fde8c    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fde96    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde9a    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fde9d    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fdea0    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fdea4    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fdea8    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fdeab    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdeaf    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.112 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m n ) { _Compile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B[34;49m[33;40m)[34;49m[34;49m, n * CELL ) ; } prefix [34;49m 
dbg[c]  :: [34;49m...[34;49m : 324.116 : locals_0 :> [33;40mn[34;49m <: 0x00007ffff5c849b8 :> [34;49mCompile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B), [34;49m[33;40mn[34;49m[34;49m * CELL ) ; } prefix [34;49m 
_Do_C_Syntax_Variable : word = n :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mn[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 324.116
[34;49m .. reg, DSP, (REX_B | MODRM_B | DISP_B), [34;49m[33;40mn[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdeb2    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fdeb6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdeba    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.118 : Int :> [33;40m*[34;49m <: cprimitive :> [34;49m _reg n ) { _Compile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B), n [34;49m[33;40m*[34;49m[34;49m CELL ) ; } prefix [34;49m 
dbg[c]  :: [34;49m...[34;49m : 324.123 : X64 :> [33;40mCELL[34;49m <: 0x00007ffff5c7d028 :> [34;49m _Compile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B), n * [34;49m[33;40mCELL[34;49m[34;49m ) ; } prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCELL[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 324.123
[34;49m ..  DSP, (REX_B | MODRM_B | DISP_B), n * [34;49m[33;40mCELL[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdebd    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fdec7    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdecb    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.123 : Int :> [33;40m*[34;49m <: cprimitive :> [34;49m _reg n ) { _Compile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B), n [34;49m[33;40m*[34;49m[34;49m CELL ) ; } prefix [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 324.123[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c7d028	< word : X64.[34;49mCELL[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c849b8	< word : locals_0.[34;49mn[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c894c0	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
type match :: Int.* :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 324.123
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m*[34;49m <:   21 bytes : at namespaces/compiler/x64.cft : 324.123
[34;49m .. g, DSP, (REX_B | MODRM_B | DISP_B), n [34;49m[33;40m*[34;49m[34;49m CELL [34;49m[32;49m
0x7ffff72fdeb6    48b90800000000000000    mov rcx, 0x8                                           [34;49m[32;49m
0x7ffff72fdec0    480fafc1                imul rax, rcx                                          [34;49m[32;49m
0x7ffff72fdec4    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdec8    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.124 : void :> [33;40m_Compile_Move[34;49m <: 0x00007ffff5c859c0 :> [34;49me_DataStackN_ToReg ( _reg n ) { [34;49m[33;40m_Compile_Move[34;49m[34;49m ( REG, MEM, _reg, DSP, (REX_B | [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 324.124[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c892f8	< word : Int.[34;49m*[39;49m : value = 0x00005555555b7ba9 > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c894c0	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
type match :: void._Compile_Move :: type expected : Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 324.124
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 324.124
[34;49m .. le_Move_DataStackN_ToReg ( _reg n ) { [34;49m[33;40m_Compile_Move[34;49m[34;49m ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B), n * CELL )[34;49m[32;49m
0x7ffff72fdecb    49b905dd2ff7ff7f0000    mov r9, 0x7ffff72fdd05                                 [34;49m[32;49m
0x7ffff72fded5    49ffd1                  call r9                    	< void.[39;49m_Compile_Move[34;49m : 0x00007ffff72fdd05 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 324.127 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m n ) { _Compile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B), n * CELL ) [34;49m[33;40m;[34;49m[34;49m } prefix [34;49m 
dbg[c]  :: [34;49m...[34;49m : 324.129 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m n ) { _Compile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B), n * CELL ) ; [34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 324.129
[34;49m .. X_B | MODRM_B | DISP_B), n * CELL ) ; [34;49m[33;40m}[34;49m[34;49m [34;49m[32;49m
0x7ffff72fded8    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fdedc    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fdee0    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fdee4    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 324.129 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 324.136 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m{ _Compile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B), n * CELL ) ; } [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 326.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m group1 : ADD OR ADC SBB AND_OPCODE SUB XOR CMP : with immediate data [34;49m 
dbg[i]  :: [34;49m...[34;49m : 327.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 328.071 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m_Compile_Group1_Immediate ( code _mod rm disp imm immSize | opCode ) [34;49m[33;40m//[34;49m[34;49mcontrolFlags ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 332.011 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c857f8 :> [34;49m    [34;49m[33;40mopCode[34;49m[34;49m = #x80 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 332.013 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    opCode [34;49m[33;40m=[34;49m[34;49m #x80 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 332.018 : <literal> :> [33;40m#x80[34;49m <: 0x00007ffff5c8de00 :> [34;49m    opCode = [34;49m[33;40m#x80[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m#x80[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 332.18
[34;49m .. isp imm immSize | opCode ) { opCode = [34;49m[33;40m#x80[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdef9    48b88000000000000000    mov rax, 0x80                                          [34;49m[32;49m
0x7ffff72fdf03    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf07    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 332.020 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    opCode [34;49m[33;40m=[34;49m[34;49m #x80 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 332.20[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8de00	< word : <literal>.[34;49m#x80[39;49m : value = 0x0000000000000080 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c857f8	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 332.20
dbg[c]  :: [34;49m...[34;49m : 332.020 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8d8a8 :> [34;49m    [34;49m[33;40mopCode[34;49m[34;49m = #x80 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 332.20
[34;49m .. _mod rm disp imm immSize | opCode ) { [34;49m[33;40mopCode[34;49m[34;49m = #x80 ; [34;49m[32;49m
0x7ffff72fdf0a    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdf0e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf12    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 332.020 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    opCode [34;49m[33;40m=[34;49m[34;49m #x80 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 332.20[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8d8a8	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 332.20
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 332.20
[34;49m ..  disp imm immSize | opCode ) { opCode [34;49m[33;40m=[34;49m[34;49m #x80 ; [34;49m[32;49m
0x7ffff72fdf03    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdf07    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 332.020 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    opCode = #x80 [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 333.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49mopCode = ( code << 3 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( ( immSize > BYTE ) || ( imm >= 0x100 ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m ( immSize > BYTE ) || ( imm >= 0x100 ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 336.8
[34;49m .. Size | opCode ) { opCode = #x80 ;  if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fdf0a    e900000000              jmp 0x7ffff72fdf0f         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 336.010 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    if ( [34;49m[33;40m([34;49m[34;49m immSize > BYTE ) || ( imm >= 0x100 ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.019 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c87a08 :> [34;49m    if ( ( [34;49m[33;40mimmSize[34;49m[34;49m > BYTE ) || ( imm >= 0x100 ) ) [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 336.19
[34;49m ..  | opCode ) { opCode = #x80 ;  if ( ( [34;49m[33;40mimmSize[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdf0f    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fdf13    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf17    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 336.021 : Logic :> [33;40m>[34;49m <: cprimitive :> [34;49m    if ( ( immSize [34;49m[33;40m>[34;49m[34;49m BYTE ) || ( imm >= 0x100 ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.026 : X64 :> [33;40mBYTE[34;49m <: 0x00007ffff5c7ce60 :> [34;49m    if ( ( immSize > [34;49m[33;40mBYTE[34;49m[34;49m ) || ( imm >= 0x100 ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mBYTE[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 336.26
[34;49m .. ) { opCode = #x80 ;  if ( ( immSize > [34;49m[33;40mBYTE[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdf1a    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fdf24    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf28    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 336.026 : Logic :> [33;40m>[34;49m <: cprimitive :> [34;49m    if ( ( immSize [34;49m[33;40m>[34;49m[34;49m BYTE ) || ( imm >= 0x100 ) ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 336.26[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c7ce60	< word : X64.[34;49mBYTE[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c87a08	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.> :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 336.26
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m>[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 336.26
[34;49m .. e ) { opCode = #x80 ;  if ( ( immSize [34;49m[33;40m>[34;49m[34;49m BYTE [34;49m[32;49m
0x7ffff72fdf13    48b90100000000000000    mov rcx, 0x1                                           [34;49m[32;49m
0x7ffff72fdf1d    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fdf20    0f9fc0                  setg al                                                [34;49m[32;49m
0x7ffff72fdf23    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fdf27    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf2b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 336.027 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( ( immSize > BYTE [34;49m[33;40m)[34;49m[34;49m || ( imm >= 0x100 ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.031 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m    if ( ( immSize > BYTE ) [34;49m[33;40m||[34;49m[34;49m ( imm >= 0x100 ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.032 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    if ( ( immSize > BYTE ) || [34;49m[33;40m([34;49m[34;49m imm >= 0x100 ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.037 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5c87f60 :> [34;49m    if ( ( immSize > BYTE ) || ( [34;49m[33;40mimm[34;49m[34;49m >= 0x100 ) ) [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 336.37
[34;49m ..  #x80 ;  if ( ( immSize > BYTE ) || ( [34;49m[33;40mimm[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdf2e    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fdf32    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf36    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 336.040 : Logic :> [33;40m>=[34;49m <: cprimitive :> [34;49m    if ( ( immSize > BYTE ) || ( imm [34;49m[33;40m>=[34;49m[34;49m 0x100 ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.046 : <literal> :> [33;40m0x100[34;49m <: 0x00007ffff5c8c8a0 :> [34;49m    if ( ( immSize > BYTE ) || ( imm >= [34;49m[33;40m0x100[34;49m[34;49m ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x100[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 336.46
[34;49m ..   if ( ( immSize > BYTE ) || ( imm >= [34;49m[33;40m0x100[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdf39    48b80001000000000000    mov rax, 0x100                                         [34;49m[32;49m
0x7ffff72fdf43    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf47    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 336.046 : Logic :> [33;40m>=[34;49m <: cprimitive :> [34;49m    if ( ( immSize > BYTE ) || ( imm [34;49m[33;40m>=[34;49m[34;49m 0x100 ) ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 336.46[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c8c8a0	< word : <literal>.[34;49m0x100[39;49m : value = 0x0000000000000100 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c87f60	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8d518	< word : Logic.[34;49m>[39;49m : value = 0x00005555555b7e26 > : [34;49mInteger . Integer -> Boolean [39;49m
type match :: Logic.>= :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 336.46
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m>=[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 336.46
[34;49m .. 0 ;  if ( ( immSize > BYTE ) || ( imm [34;49m[33;40m>=[34;49m[34;49m 0x100 [34;49m[32;49m
0x7ffff72fdf32    48b90001000000000000    mov rcx, 0x100                                         [34;49m[32;49m
0x7ffff72fdf3c    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fdf3f    0f9dc0                  setge al                                               [34;49m[32;49m
0x7ffff72fdf42    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fdf46    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf4a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 336.047 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( ( immSize > BYTE ) || ( imm >= 0x100 [34;49m[33;40m)[34;49m[34;49m ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.047 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m    if ( ( immSize > BYTE ) [34;49m[33;40m||[34;49m[34;49m ( imm >= 0x100 ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m||[34;49m <:   24 bytes : at namespaces/compiler/x64.cft : 336.47
[34;49m .. ode = #x80 ;  if ( ( immSize > BYTE ) [34;49m[33;40m||[34;49m[34;49m ( imm >= 0x100 )[34;49m[32;49m
0x7ffff72fdf4d    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fdf50    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fdf54    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fdf58    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fdf5b    4885c0                  test rax, rax                                          [34;49m[32;49m
0x7ffff72fdf5e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf62    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 336.049 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( ( immSize > BYTE ) || ( imm >= 0x100 ) [34;49m[33;40m)[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 336.49
[34;49m ..  immSize > BYTE ) || ( imm >= 0x100 ) [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fdf65    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 336.49 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fdf0f[34;49m.
dbg[c]  :: [34;49m...[34;49m : 337.006 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 337.6
[34;49m .. mmSize > BYTE ) || ( imm >= 0x100 ) ) [34;49m[33;40m{[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdf66    e900000000              jmp 0x7ffff72fdf6b         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 338.015 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c857f8 :> [34;49m        [34;49m[33;40mopCode[34;49m[34;49m |= 1 ; [34;49m 
_Do_C_Syntax_Variable : word = opCode :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 338.15
[34;49m .. ize > BYTE ) || ( imm >= 0x100 ) ) {  [34;49m[33;40mopCode[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdf6b    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdf6f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf73    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 338.018 : Bits :> [33;40m|=[34;49m <: cprimitive :> [34;49m        opCode [34;49m[33;40m|=[34;49m[34;49m 1 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 338.020 : <literal> :> [33;40m1[34;49m <: 0x00007ffff73812e9 :> [34;49m        opCode |= [34;49m[33;40m1[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 338.20
[34;49m ..  ) || ( imm >= 0x100 ) ) {  opCode |= [34;49m[33;40m1[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdf76    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fdf80    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf84    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 338.022 : Bits :> [33;40m|=[34;49m <: cprimitive :> [34;49m        opCode [34;49m[33;40m|=[34;49m[34;49m 1 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|=[34;49m <:   24 bytes : at namespaces/compiler/x64.cft : 338.22
[34;49m .. YTE ) || ( imm >= 0x100 ) ) {  opCode [34;49m[33;40m|=[34;49m[34;49m 1 ; [34;49m[32;49m
0x7ffff72fdf6b    48b90100000000000000    mov rcx, 0x1                                           [34;49m[32;49m
0x7ffff72fdf75    498d5f08                lea rbx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdf79    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdf7d    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fdf80    488903                  mov [rbx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 338.022 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m        opCode |= 1 [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 339.006 : Reserved :> [33;40m}[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m}[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 339.6
[34;49m .. | ( imm >= 0x100 ) ) {  opCode |= 1 ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdf83    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 339.6 :> [39;49m}[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fdf6b[34;49m.
dbg[c]  :: [34;49m...[34;49m : 341.006 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 341.6
[34;49m ..  >= 0x100 ) ) {  opCode |= 1 ; } else [34;49m[33;40m{[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdf84    e900000000              jmp 0x7ffff72fdf89         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.011 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m        [34;49m[33;40mif[34;49m[34;49m ( ( immSize <= BYTE ) || ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 342.012 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m        if [34;49m[33;40m([34;49m[34;49m ( immSize <= BYTE ) || ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 342.12
[34;49m .. 100 ) ) {  opCode |= 1 ; } else {  if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdf89    e900000000              jmp 0x7ffff72fdf8e         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.023 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c87a08 :> [34;49m        if ( ( [34;49m[33;40mimmSize[34;49m[34;49m <= BYTE ) || ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 342.23
[34;49m .. ) ) {  opCode |= 1 ; } else {  if ( ( [34;49m[33;40mimmSize[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdf8e    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fdf92    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf96    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.026 : Logic :> [33;40m<=[34;49m <: cprimitive :> [34;49m        if ( ( immSize [34;49m[33;40m<=[34;49m[34;49m BYTE ) || ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 342.031 : X64 :> [33;40mBYTE[34;49m <: 0x00007ffff5c7ce60 :> [34;49m        if ( ( immSize <= [34;49m[33;40mBYTE[34;49m[34;49m ) || ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mBYTE[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 342.31
[34;49m .. de |= 1 ; } else {  if ( ( immSize <= [34;49m[33;40mBYTE[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdf99    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fdfa3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdfa7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.031 : Logic :> [33;40m<=[34;49m <: cprimitive :> [34;49m        if ( ( immSize [34;49m[33;40m<=[34;49m[34;49m BYTE ) || ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 342.31[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c90810	< word : X64.[34;49mBYTE[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c90648	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Logic.<= :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 342.31
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<=[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 342.31
[34;49m .. pCode |= 1 ; } else {  if ( ( immSize [34;49m[33;40m<=[34;49m[34;49m BYTE  .. [34;49m[32;49m
0x7ffff72fdf92    48b90100000000000000    mov rcx, 0x1                                           [34;49m[32;49m
0x7ffff72fdf9c    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fdf9f    0f9ec0                  setle al                                               [34;49m[32;49m
0x7ffff72fdfa2    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fdfa6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdfaa    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.032 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE [34;49m[33;40m)[34;49m[34;49m || ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 342.036 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) [34;49m[33;40m||[34;49m[34;49m ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 342.037 : C :> [33;40m([34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || [34;49m[33;40m([34;49m[34;49m imm < 0x100 ) ) opCode |= 3 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 342.042 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5c87f60 :> [34;49m        if ( ( immSize <= BYTE ) || ( [34;49m[33;40mimm[34;49m[34;49m < 0x100 ) ) opCode |= 3 ; [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 342.42
[34;49m .. else {  if ( ( immSize <= BYTE ) || ( [34;49m[33;40mimm[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdfad    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fdfb1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdfb5    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.044 : Logic :> [33;40m<[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || ( imm [34;49m[33;40m<[34;49m[34;49m 0x100 ) ) opCode |= 3 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 342.050 : <literal> :> [33;40m0x100[34;49m <: 0x00007ffff73814e4 :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < [34;49m[33;40m0x100[34;49m[34;49m ) ) opCode |= 3 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x100[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 342.50
[34;49m ..   if ( ( immSize <= BYTE ) || ( imm < [34;49m[33;40m0x100[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdfb8    48b80001000000000000    mov rax, 0x100                                         [34;49m[32;49m
0x7ffff72fdfc2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdfc6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.050 : Logic :> [33;40m<[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || ( imm [34;49m[33;40m<[34;49m[34;49m 0x100 ) ) opCode |= 3 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 342.50[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff73814e4	< word : <literal>.[34;49m0x100[39;49m : value = 0x0000000000000100 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c90f30	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c909d8	< word : Logic.[34;49m<=[39;49m : value = 0x00005555555b7da4 > : [34;49mInteger . Integer -> Boolean [39;49m
type match :: Logic.< :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 342.50
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 342.50
[34;49m ..  {  if ( ( immSize <= BYTE ) || ( imm [34;49m[33;40m<[34;49m[34;49m 0x100  .. [34;49m[32;49m
0x7ffff72fdfb1    48b90001000000000000    mov rcx, 0x100                                         [34;49m[32;49m
0x7ffff72fdfbb    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fdfbe    0f9cc0                  setl al                                                [34;49m[32;49m
0x7ffff72fdfc1    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fdfc5    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdfc9    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.051 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < 0x100 [34;49m[33;40m)[34;49m[34;49m ) opCode |= 3 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 342.051 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) [34;49m[33;40m||[34;49m[34;49m ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m||[34;49m <:   24 bytes : at namespaces/compiler/x64.cft : 342.51
[34;49m ..  ; } else {  if ( ( immSize <= BYTE ) [34;49m[33;40m||[34;49m[34;49m ( imm < 0x100 ) .. [34;49m[32;49m
0x7ffff72fdfcc    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fdfcf    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fdfd3    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fdfd7    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fdfda    4885c0                  test rax, rax                                          [34;49m[32;49m
0x7ffff72fdfdd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdfe1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.053 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < 0x100 ) [34;49m[33;40m)[34;49m[34;49m opCode |= 3 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 342.53
[34;49m ..  immSize <= BYTE ) || ( imm < 0x100 ) [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdfe4    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 342.53 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fdf8e[34;49m.
dbg[c]  :: [34;49m...[34;49m : 342.061 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < 0x100 ) ) [34;49m[33;40m{[34;49m[34;49mpCode |= 3 ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 342.61
[34;49m .. immSize <= BYTE ) || ( imm < 0x100 ) )[34;49m[33;40m{[34;49m[34;49mopCode  .. [34;49m[32;49m
0x7ffff72fdfe5    e900000000              jmp 0x7ffff72fdfea         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.061 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c857f8 :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < 0x100 ) ) [34;49m[33;40mopCode[34;49m[34;49m |= 3 ; [34;49m 
_Do_C_Syntax_Variable : word = opCode :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 342.61
[34;49m .. mmSize <= BYTE ) || ( imm < 0x100 ) ) [34;49m[33;40mopCode[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdfea    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdfee    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdff2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.064 : Bits :> [33;40m|=[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < 0x100 ) ) opCode [34;49m[33;40m|=[34;49m[34;49m 3 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 342.066 : <literal> :> [33;40m3[34;49m <: 0x00007ffff73816df :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < 0x100 ) ) opCode |= [34;49m[33;40m3[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m3[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 342.66
[34;49m .. BYTE ) || ( imm < 0x100 ) ) opCode |= [34;49m[33;40m3[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdff5    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fdfff    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe003    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.068 : Bits :> [33;40m|=[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < 0x100 ) ) opCode [34;49m[33;40m|=[34;49m[34;49m 3 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|=[34;49m <:   24 bytes : at namespaces/compiler/x64.cft : 342.68
[34;49m .. <= BYTE ) || ( imm < 0x100 ) ) opCode [34;49m[33;40m|=[34;49m[34;49m 3 ;  .. [34;49m[32;49m
0x7ffff72fdfea    48b90300000000000000    mov rcx, 0x3                                           [34;49m[32;49m
0x7ffff72fdff4    498d5f08                lea rbx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdff8    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdffc    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fdfff    488903                  mov [rbx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.068 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < 0x100 ) ) opCode |= 3 [34;49m[33;40m;[34;49m[34;49m [34;49m 
DataStack at : [39;49mnamespaces/compiler/x64.cft : 343.6[34;49m :
DataStack depth =   7 : Dsp (R14) = Top = 0x00007ffff7269230, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269230 > = 0x00007ffff72fdf6b	
  DataStack   [  -1 ] < 0x00007ffff7269228 > = 0x00007ffff72fdf0f	
  DataStack   [  -2 ] < 0x00007ffff7269220 > = 0x00007ffff5c88f68	< word : void.[39;49m_Compile_Group1_Immediate[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -3 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -5 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -6 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 343.006 : Reserved :> [33;40m}[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m}[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 343.6
[34;49m .. ) || ( imm < 0x100 ) ) opCode |= 3 ;  [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdff6    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 343.6 :> [39;49m}[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fdf89[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 343.6[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c88f68	< word : void.[39;49m_Compile_Group1_Immediate[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 344.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49mCompile_CalcWrite_Instruction_X64 (  rex,  opCode,  _mod,  _reg,  rm, controlFlags, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 345.038 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c84628 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m (  0,  opCode,  _mod[34;49m 
dbg[c]  :: [34;49m...[34;49m : 345.042 : <literal> :> [33;40m0[34;49m <: 0x00007ffff73818da :> [34;49m    Compile_CalcWrite_Instruction_X64 (  [34;49m[33;40m0[34;49m[34;49m,  opCode,  _mod,  code, rm, (REX_B | MODRM[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 345.42
[34;49m .. } Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdfe9    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fdff3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdff7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.051 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c857f8 :> [34;49mile_CalcWrite_Instruction_X64 (  0,  [34;49m[33;40mopCode[34;49m[34;49m,  _mod,  code, rm, (REX_B | MODRM_B |[34;49m 
_Do_C_Syntax_Variable : word = opCode :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 345.51
[34;49m .. ompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40mopCode[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdffa    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdffe    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe002    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.058 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c88a10 :> [34;49mcWrite_Instruction_X64 (  0,  opCode,  [34;49m[33;40m_mod[34;49m[34;49m,  code, rm, (REX_B | MODRM_B | DISP_B |[34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 345.58
[34;49m .. alcWrite_Instruction_X64 ( 0, opCode, [34;49m[33;40m_mod[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe005    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fe009    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe00d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.065 : locals_0 :> [33;40mcode[34;49m <: 0x00007ffff5c88bd8 :> [34;49mInstruction_X64 (  0,  opCode,  _mod,  [34;49m[33;40mcode[34;49m[34;49m, rm, (REX_B | MODRM_B | DISP_B | IMM_B)[34;49m 
_Do_C_Syntax_Variable : word = code :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 345.65
[34;49m .. te_Instruction_X64 ( 0, opCode, _mod, [34;49m[33;40mcode[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe010    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fe014    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe018    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.069 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c884b8 :> [34;49mruction_X64 (  0,  opCode,  _mod,  code, [34;49m[33;40mrm[34;49m[34;49m, (REX_B | MODRM_B | DISP_B | IMM_B),  0, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 345.071 : C_Syntax :> [33;40m,[34;49m <: cprimitive :> [34;49mnstruction_X64 (  0,  opCode,  _mod,  code, rm[34;49m[33;40m,[34;49m[34;49m (REX_B | MODRM_B | DISP_B | IMM_B),  0,  disp,[34;49m 
dbg[c]  :: [34;49m...[34;49m : 345.071 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c884b8 :> [34;49mruction_X64 (  0,  opCode,  _mod,  code, [34;49m[33;40mrm[34;49m[34;49m, (REX_B | MODRM_B | DISP_B | IMM_B),  0, [34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 345.71
[34;49m .. truction_X64 ( 0, opCode, _mod, code, [34;49m[33;40mrm[34;49m[34;49m,  .. [34;49m[32;49m
0x7ffff72fe01b    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fe01f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe023    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.072 : C :> [33;40m([34;49m <: cprimitive :> [34;49m_Instruction_X64 (  0,  opCode,  _mod,  code, rm, [34;49m[33;40m([34;49m[34;49mREX_B | MODRM_B | DISP_B | IMM_B),  0,  disp,  0, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 345.078 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7d748 :> [34;49mon_X64 (  0,  opCode,  _mod,  code, rm, ([34;49m[33;40mREX_B[34;49m[34;49m | MODRM_B | DISP_B | IMM_B),  0,  disp, [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 345.78[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c884b8	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c88bd8	< word : locals_0.[34;49mcode[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c88a10	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c922c8	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff73818da	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: X64.REX_B :: type expected :  :: type recorded : Undefined  : namespaces/compiler/x64.cft : 345.78
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 345.78[32;49m
0x7ffff72fe026    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe030    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe034    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.080 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49mion_X64 (  0,  opCode,  _mod,  code, rm, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | DISP_B | IMM_B),  0,  disp,  0,  imm, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 345.088 : X64 :> [33;40mMODRM_B[34;49m <: 0x00007ffff5c7dad8 :> [34;49m0,  opCode,  _mod,  code, rm, (REX_B | [34;49m[33;40mMODRM_B[34;49m[34;49m | DISP_B | IMM_B),  0,  disp,  0,  imm[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMODRM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 345.88[32;49m
0x7ffff72fe037    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe041    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe045    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.088 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49mion_X64 (  0,  opCode,  _mod,  code, rm, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | DISP_B | IMM_B),  0,  disp,  0,  imm, [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 345.88[39;49m :
TypeWordStack depth =   4 :  = Top = 0x00007ffff7fc1a40, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c88bd8	< word : locals_0.[34;49mcode[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c88a10	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c922c8	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a28 > = 0x00007ffff73818da	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Undefined . Undefined  : namespaces/compiler/x64.cft : 345.88
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 345.88
[34;49m .. 4 ( 0, opCode, _mod, code, rm, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B  .. [34;49m[32;49m
0x7ffff72fe037    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe041    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe045    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe048    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe04b    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe04f    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe053    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe056    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe05a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.097 : X64 :> [33;40mDISP_B[34;49m <: 0x00007ffff5c7e1f8 :> [34;49me,  _mod,  code, rm, (REX_B | MODRM_B | [34;49m[33;40mDISP_B[34;49m[34;49m | IMM_B),  0,  disp,  0,  imm,  immSize[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDISP_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 345.97[32;49m
0x7ffff72fe05d    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe067    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe06b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.097 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m 0,  opCode,  _mod,  code, rm, (REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m DISP_B | IMM_B),  0,  disp,  0,  imm,  immSize )[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 345.97[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c92658	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c922c8	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff73818da	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 345.97
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 345.97
[34;49m .. ode, _mod, code, rm, (REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m DISP_B  .. [34;49m[32;49m
0x7ffff72fe05d    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe067    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe06b    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe06e    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe071    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe075    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe079    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe07c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe080    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.104 : X64 :> [33;40mIMM_B[34;49m <: 0x00007ffff5c7e588 :> [34;49m_mod,  code, rm, (REX_B | MODRM_B | DISP_B | [34;49m[33;40mIMM_B[34;49m[34;49m),  0,  disp,  0,  imm,  immSize ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mIMM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 345.104[32;49m
0x7ffff72fe083    48b81000000000000000    mov rax, 0x10                                          [34;49m[32;49m
0x7ffff72fe08d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe091    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.104 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m  opCode,  _mod,  code, rm, (REX_B | MODRM_B | DISP_B [34;49m[33;40m|[34;49m[34;49m IMM_B),  0,  disp,  0,  imm,  immSize ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 345.104[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c929e8	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff73818da	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 345.104
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 345.104
[34;49m .. , code, rm, (REX_B | MODRM_B | DISP_B [34;49m[33;40m|[34;49m[34;49m IMM_B .. [34;49m[32;49m
0x7ffff72fe083    48b81000000000000000    mov rax, 0x10                                          [34;49m[32;49m
0x7ffff72fe08d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe091    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe094    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe097    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe09b    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe09f    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe0a2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe0a6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.105 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49mCode,  _mod,  code, rm, (REX_B | MODRM_B | DISP_B | IMM_B[34;49m[33;40m)[34;49m[34;49m,  0,  disp,  0,  imm,  immSize ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 345.109 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7381ad5 :> [34;49mod,  code, rm, (REX_B | MODRM_B | DISP_B | IMM_B),  [34;49m[33;40m0[34;49m[34;49m,  disp,  0,  imm,  immSize ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 345.109
[34;49m .. , (REX_B | MODRM_B | DISP_B | IMM_B), [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe0a9    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe0b3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe0b7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.116 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c882f0 :> [34;49m,  code, rm, (REX_B | MODRM_B | DISP_B | IMM_B),  0,  [34;49m[33;40mdisp[34;49m[34;49m,  0,  imm,  immSize ) ; [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 345.116
[34;49m .. REX_B | MODRM_B | DISP_B | IMM_B), 0, [34;49m[33;40mdisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe0ba    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe0be    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe0c2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.120 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7381cd0 :> [34;49mod,  code, rm, (REX_B | MODRM_B | DISP_B | IMM_B),  0,  disp,  [34;49m[33;40m0[34;49m[34;49m,  imm,  immSize ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 345.120
[34;49m .. | MODRM_B | DISP_B | IMM_B), 0, disp, [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe0c5    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe0cf    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe0d3    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.126 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5c87f60 :> [34;49md,  code, rm, (REX_B | MODRM_B | DISP_B | IMM_B),  0,  disp,  0,  [34;49m[33;40mimm[34;49m[34;49m,  immSize ) ; [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 345.126
[34;49m .. ODRM_B | DISP_B | IMM_B), 0, disp, 0, [34;49m[33;40mimm[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe0d6    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe0da    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe0de    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.137 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c87a08 :> [34;49mcode, rm, (REX_B | MODRM_B | DISP_B | IMM_B),  0,  disp,  0,  imm,  [34;49m[33;40mimmSize[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 345.137
[34;49m .. B | DISP_B | IMM_B), 0, disp, 0, imm, [34;49m[33;40mimmSize[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fe0e1    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe0e5    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe0e9    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.138 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c84628 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m (  0,  opCode,  _mod[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 345.138[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c932d0	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c93108	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff7381cd0	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c882f0	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff7381ad5	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c92d78	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
type match :: void.Compile_CalcWrite_Instruction_X64 :: type expected :  :: type recorded : Integer . Integer . Undefined . Integer . Integer . Integer  : namespaces/compiler/x64.cft : 345.138
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 345.138
[34;49m .. || ( imm < 0x100 ) ) opCode |= 3 ;  } [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, opCode, _mod, code, rm, (REX_B | MODRM_B | DISP_B | IMM_B), 0, di .. [34;49m[32;49m
0x7ffff72fe0ec    49b983db2ff7ff7f0000    mov r9, 0x7ffff72fdb83                                 [34;49m[32;49m
0x7ffff72fe0f6    49ffd1                  call r9                    	< void.[39;49mCompile_CalcWrite_Instruction_X64[34;49m : 0x00007ffff72fdb83 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 345.141 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49mCode,  _mod,  code, rm, (REX_B | MODRM_B | DISP_B | IMM_B),  0,  disp,  0,  imm,  immSize ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 346.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 346.2
[34;49m ..  IMM_B), 0, disp, 0, imm, immSize ) ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fe0f9    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe0fd    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe101    4983ee30                sub r14, 0x30                                          [34;49m[32;49m
0x7ffff72fe105    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 346.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 346.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 348.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 350.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_Group5 ( code, mod, rm, sib, disp, size ) {  .. [34;49m[32;49m
0x7ffff72fe106    e900000000              jmp 0x7ffff72fe10b         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe10b    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe10f    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe113    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 350.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c93498[34;49m.
dbg[c]  :: [34;49m...[34;49m : 351.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49mCompile_CalcWrite_Instruction_X64 ( 0, 0xff, mod, code, rm, REX_B | MODRM_B | DISP_B[34;49m 
dbg[c]  :: [34;49m...[34;49m : 352.038 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c84628 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xff, mod, code[34;49m 
dbg[c]  :: [34;49m...[34;49m : 352.041 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c92100 :> [34;49m    Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m, 0xff, mod, code, rm, (REX_B | MODRM_B | DI[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 352.41
[34;49m .. { Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe11a    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe124    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe128    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.047 : <literal> :> [33;40m0xff[34;49m <: 0x00007ffff5c91f38 :> [34;49mCompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40m0xff[34;49m[34;49m, mod, code, rm, (REX_B | MODRM_B | DIS[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0xff[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 352.47
[34;49m .. ompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40m0xff[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe12b    48b8ff00000000000000    mov rax, 0xff                                          [34;49m[32;49m
0x7ffff72fe135    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe139    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.052 : locals_0 :> [33;40mmod[34;49m <: 0x00007ffff5c92f40 :> [34;49mle_CalcWrite_Instruction_X64 ( 0, 0xff, [34;49m[33;40mmod[34;49m[34;49m, code, rm, (REX_B | MODRM_B | DISP_B), s[34;49m 
_Do_C_Syntax_Variable : word = mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mmod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 352.52
[34;49m .. _CalcWrite_Instruction_X64 ( 0, 0xff, [34;49m[33;40mmod[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe13c    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fe140    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe144    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.058 : locals_0 :> [33;40mcode[34;49m <: 0x00007ffff5c93108 :> [34;49mcWrite_Instruction_X64 ( 0, 0xff, mod, [34;49m[33;40mcode[34;49m[34;49m, rm, (REX_B | MODRM_B | DISP_B), sib, d[34;49m 
_Do_C_Syntax_Variable : word = code :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 352.58
[34;49m .. Write_Instruction_X64 ( 0, 0xff, mod, [34;49m[33;40mcode[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe147    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fe14b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe14f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.062 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c92bb0 :> [34;49mte_Instruction_X64 ( 0, 0xff, mod, code, [34;49m[33;40mrm[34;49m[34;49m, (REX_B | MODRM_B | DISP_B), sib, disp, s[34;49m 
dbg[c]  :: [34;49m...[34;49m : 352.064 : C_Syntax :> [33;40m,[34;49m <: cprimitive :> [34;49mWrite_Instruction_X64 ( 0, 0xff, mod, code, rm[34;49m[33;40m,[34;49m[34;49m (REX_B | MODRM_B | DISP_B), sib, disp, size, 0[34;49m 
dbg[c]  :: [34;49m...[34;49m : 352.064 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c92bb0 :> [34;49mte_Instruction_X64 ( 0, 0xff, mod, code, [34;49m[33;40mrm[34;49m[34;49m, (REX_B | MODRM_B | DISP_B), sib, disp, s[34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 352.64
[34;49m .. Instruction_X64 ( 0, 0xff, mod, code, [34;49m[33;40mrm[34;49m[34;49m, [34;49m[32;49m
0x7ffff72fe152    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fe156    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe15a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.065 : C :> [33;40m([34;49m <: cprimitive :> [34;49mlcWrite_Instruction_X64 ( 0, 0xff, mod, code, rm, [34;49m[33;40m([34;49m[34;49mREX_B | MODRM_B | DISP_B), sib, disp, size, 0, 0 )[34;49m 
dbg[c]  :: [34;49m...[34;49m : 352.071 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7d748 :> [34;49mstruction_X64 ( 0, 0xff, mod, code, rm, ([34;49m[33;40mREX_B[34;49m[34;49m | MODRM_B | DISP_B), sib, disp, size, 0,[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 352.71[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c92bb0	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c93108	< word : locals_0.[34;49mcode[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c92f40	< word : locals_0.[34;49mmod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c91f38	< word : <literal>.[34;49m0xff[39;49m : value = 0x00000000000000ff > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c92100	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: X64.REX_B :: type expected :  :: type recorded : Undefined  : namespaces/compiler/x64.cft : 352.71
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 352.71[32;49m
0x7ffff72fe15d    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe167    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe16b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.073 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49me_Instruction_X64 ( 0, 0xff, mod, code, rm, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | DISP_B), sib, disp, size, 0, 0 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 352.081 : X64 :> [33;40mMODRM_B[34;49m <: 0x00007ffff5c7dad8 :> [34;49m_X64 ( 0, 0xff, mod, code, rm, (REX_B | [34;49m[33;40mMODRM_B[34;49m[34;49m | DISP_B), sib, disp, size, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMODRM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 352.81[32;49m
0x7ffff72fe16e    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe178    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe17c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.081 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49me_Instruction_X64 ( 0, 0xff, mod, code, rm, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | DISP_B), sib, disp, size, 0, 0 ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 352.81[39;49m :
TypeWordStack depth =   4 :  = Top = 0x00007ffff7fc1a40, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c93108	< word : locals_0.[34;49mcode[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c92f40	< word : locals_0.[34;49mmod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c91f38	< word : <literal>.[34;49m0xff[39;49m : value = 0x00000000000000ff > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c92100	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Undefined . Undefined  : namespaces/compiler/x64.cft : 352.81
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 352.81
[34;49m .. _X64 ( 0, 0xff, mod, code, rm, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B [34;49m[32;49m
0x7ffff72fe16e    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe178    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe17c    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe17f    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe182    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe186    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe18a    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe18d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe191    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.089 : X64 :> [33;40mDISP_B[34;49m <: 0x00007ffff5c7e1f8 :> [34;49mn_X64 ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B | [34;49m[33;40mDISP_B[34;49m[34;49m), sib, disp, size, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDISP_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 352.89[32;49m
0x7ffff72fe194    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe19e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe1a2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.089 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49me_Instruction_X64 ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m DISP_B), sib, disp, size, 0, 0 ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 352.89[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c91d70	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c91f38	< word : <literal>.[34;49m0xff[39;49m : value = 0x00000000000000ff > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c92100	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 352.89
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 352.89
[34;49m .. 0xff, mod, code, rm, (REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m DISP_B[34;49m[32;49m
0x7ffff72fe194    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe19e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe1a2    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe1a5    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe1a8    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe1ac    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe1b0    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe1b3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe1b7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.090 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49mstruction_X64 ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B | DISP_B[34;49m[33;40m)[34;49m[34;49m, sib, disp, size, 0, 0 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 352.095 : locals_0 :> [33;40msib[34;49m <: 0x00007ffff5c92820 :> [34;49mX64 ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B | DISP_B), [34;49m[33;40msib[34;49m[34;49m, disp, size, 0, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = sib :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msib[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 352.95
[34;49m .. code, rm, (REX_B | MODRM_B | DISP_B), [34;49m[33;40msib[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe1ba    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe1be    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe1c2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.101 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c92490 :> [34;49m64 ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B | DISP_B), sib, [34;49m[33;40mdisp[34;49m[34;49m, size, 0, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 352.101
[34;49m ..  rm, (REX_B | MODRM_B | DISP_B), sib, [34;49m[33;40mdisp[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe1c5    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe1c9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe1cd    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.107 : locals_0 :> [33;40msize[34;49m <: 0x00007ffff5c922c8 :> [34;49m64 ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B | DISP_B), sib, disp, [34;49m[33;40msize[34;49m[34;49m, 0, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = size :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 352.107
[34;49m .. REX_B | MODRM_B | DISP_B), sib, disp, [34;49m[33;40msize[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe1d0    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe1d4    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe1d8    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.110 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c91818 :> [34;49m_X64 ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B | DISP_B), sib, disp, size, [34;49m[33;40m0[34;49m[34;49m, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 352.110
[34;49m .. | MODRM_B | DISP_B), sib, disp, size, [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe1db    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe1e5    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe1e9    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.115 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c84628 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xff, mod, code[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 352.115[39;49m :
TypeWordStack depth =   7 :  = Top = 0x00007ffff7fc1a58, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a58 > = 0x00007ffff5c91650	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c91818	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c922c8	< word : locals_0.[34;49msize[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c92490	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c92820	< word : locals_0.[34;49msib[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c919e0	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -6 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c92100	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: void.Compile_CalcWrite_Instruction_X64 :: type expected :  :: type recorded : Integer . Integer . Undefined . Undefined . Undefined . Integer . Integer  : namespaces/compiler/x64.cft : 352.115
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 352.115
[34;49m ..  ( code, mod, rm, sib, disp, size ) { [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B | DISP_B), sib, disp, size, .. [34;49m[32;49m
0x7ffff72fe1fd    49b983db2ff7ff7f0000    mov r9, 0x7ffff72fdb83                                 [34;49m[32;49m
0x7ffff72fe207    49ffd1                  call r9                    	< void.[39;49mCompile_CalcWrite_Instruction_X64[34;49m : 0x00007ffff72fdb83 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 352.118 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49mstruction_X64 ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B | DISP_B), sib, disp, size, 0, 0 ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 353.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 353.2
[34;49m ..  | DISP_B), sib, disp, size, 0, 0 ) ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fe20a    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe20e    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe212    4983ee30                sub r14, 0x30                                          [34;49m[32;49m
0x7ffff72fe216    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 353.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 353.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 355.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 357.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_CallThruReg ( _reg ) {  .. [34;49m[32;49m
0x7ffff72fe217    e900000000              jmp 0x7ffff72fe21c         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe21c    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe220    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe224    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 357.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c91488[34;49m.
dbg[c]  :: [34;49m...[34;49m : 358.020 : void :> [33;40m_Compile_Group5[34;49m <: 0x00007ffff5c93498 :> [34;49m    [34;49m[33;40m_Compile_Group5[34;49m[34;49m ( CALL, REG, _reg, 0, 0, 0 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 358.026 : X64 :> [33;40mCALL[34;49m <: 0x00007ffff5c7cc98 :> [34;49m    _Compile_Group5 ( [34;49m[33;40mCALL[34;49m[34;49m, REG, _reg, 0, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCALL[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 358.26
[34;49m .. lThruReg ( _reg ) { _Compile_Group5 ( [34;49m[33;40mCALL[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe22b    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe235    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe239    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 358.031 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b6f20 :> [34;49m    _Compile_Group5 ( CALL, [34;49m[33;40mREG[34;49m[34;49m, _reg, 0, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 358.31
[34;49m .. eg ( _reg ) { _Compile_Group5 ( CALL, [34;49m[33;40mREG[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe23c    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fe246    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe24a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 358.037 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c90f30 :> [34;49m    _Compile_Group5 ( CALL, REG, [34;49m[33;40m_reg[34;49m[34;49m, 0, 0, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 358.37
[34;49m .. _reg ) { _Compile_Group5 ( CALL, REG, [34;49m[33;40m_reg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe24d    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe251    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe255    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 358.040 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c90d68 :> [34;49m    _Compile_Group5 ( CALL, REG, _reg, [34;49m[33;40m0[34;49m[34;49m, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 358.40
[34;49m ..  { _Compile_Group5 ( CALL, REG, _reg, [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe258    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe262    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe266    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 358.048 : void :> [33;40m_Compile_Group5[34;49m <: 0x00007ffff5c93498 :> [34;49m    [34;49m[33;40m_Compile_Group5[34;49m[34;49m ( CALL, REG, _reg, 0, 0, 0 ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 358.48[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c90810	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c90ba0	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c90d68	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c90f30	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b6f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7cc98	< word : X64.[34;49mCALL[39;49m : value = 0x0000000000000002 > : [34;49mInteger [39;49m
type match :: void._Compile_Group5 :: type expected : Integer . Integer  :: type recorded : Integer . Integer . Undefined . Integer . Integer . Integer  : namespaces/compiler/x64.cft : 358.48
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Group5[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 358.48
[34;49m ..  void _Compile_CallThruReg ( _reg ) { [34;49m[33;40m_Compile_Group5[34;49m[34;49m ( CALL, REG, _reg, 0, 0, 0 ) .. [34;49m[32;49m
0x7ffff72fe28b    49b90be12ff7ff7f0000    mov r9, 0x7ffff72fe10b                                 [34;49m[32;49m
0x7ffff72fe295    49ffd1                  call r9                    	< void.[39;49m_Compile_Group5[34;49m : 0x00007ffff72fe10b >[34;49m
dbg[c]  :: [34;49m...[34;49m : 358.051 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    _Compile_Group5 ( CALL, REG, _reg, 0, 0, 0 ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 359.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 359.2
[34;49m .. Group5 ( CALL, REG, _reg, 0, 0, 0 ) ; [34;49m[33;40m}[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe298    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe29c    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe2a0    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe2a4    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 359.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 359.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 361.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m                          _Compile_Group1_Immediate ( code toRegOrMem _mod rm disp imm i[34;49m 
dbg[i]  :: [34;49m...[34;49m : 362.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m _Compile_SUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, REG, DSP, 0, imm, 1 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 362.33
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_SUBI_DSP ( imm ) {  .. [34;49m[32;49m
0x7ffff72fe2a5    e900000000              jmp 0x7ffff72fe2aa         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe2aa    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe2ae    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe2b2    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 362.33 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c90648[34;49m.
dbg[c]  :: [34;49m...[34;49m : 362.059 : void :> [33;40m_Compile_Group1_Immediate[34;49m <: 0x00007ffff5c88f68 :> [34;49m_SUBI_DSP ( imm ) { [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( SUB, REG, DSP, 0, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 362.064 : X64 :> [33;40mSUB[34;49m <: 0x00007ffff5c7c908 :> [34;49mile_SUBI_DSP ( imm ) { _Compile_Group1_Immediate ( [34;49m[33;40mSUB[34;49m[34;49m, REG, DSP, 0, imm, 1 ) ; } prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mSUB[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 362.64
[34;49m .. ( imm ) { _Compile_Group1_Immediate ( [34;49m[33;40mSUB[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe2b9    48b80500000000000000    mov rax, 0x5                                           [34;49m[32;49m
0x7ffff72fe2c3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe2c7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 362.069 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b6f20 :> [34;49mile_SUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, [34;49m[33;40mREG[34;49m[34;49m, DSP, 0, imm, 1 ) ; } prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 362.69
[34;49m ..  ) { _Compile_Group1_Immediate ( SUB, [34;49m[33;40mREG[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe2ca    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fe2d4    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe2d8    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 362.074 : X64 :> [33;40mDSP[34;49m <: 0x00007ffff5c7b1e0 :> [34;49mile_SUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, REG, [34;49m[33;40mDSP[34;49m[34;49m, 0, imm, 1 ) ; } prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDSP[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 362.74
[34;49m .. _Compile_Group1_Immediate ( SUB, REG, [34;49m[33;40mDSP[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe2db    48b80e00000000000000    mov rax, 0xe                                           [34;49m[32;49m
0x7ffff72fe2e5    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe2e9    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 362.077 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c900f0 :> [34;49mSUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, REG, DSP, [34;49m[33;40m0[34;49m[34;49m, imm, 1 ) ; } prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 362.77
[34;49m .. ile_Group1_Immediate ( SUB, REG, DSP, [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe2ec    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe2f6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe2fa    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 362.082 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5c902b8 :> [34;49mUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, REG, DSP, 0, [34;49m[33;40mimm[34;49m[34;49m, 1 ) ; } prefix [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 362.82
[34;49m .. _Group1_Immediate ( SUB, REG, DSP, 0, [34;49m[33;40mimm[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe2fd    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe301    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe305    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 362.086 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5c8ff28 :> [34;49mSUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, REG, DSP, 0, imm, [34;49m[33;40m1[34;49m[34;49m ) ; } prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 362.86
[34;49m .. p1_Immediate ( SUB, REG, DSP, 0, imm, [34;49m[33;40m1[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe308    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe312    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe316    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 362.087 : void :> [33;40m_Compile_Group1_Immediate[34;49m <: 0x00007ffff5c88f68 :> [34;49m_SUBI_DSP ( imm ) { [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( SUB, REG, DSP, 0, [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 362.87[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c8ff28	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c902b8	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c900f0	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c7b1e0	< word : X64.[34;49mDSP[39;49m : value = 0x000000000000000e > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b6f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7c908	< word : X64.[34;49mSUB[39;49m : value = 0x0000000000000005 > : [34;49mInteger [39;49m
type match :: void._Compile_Group1_Immediate :: type expected : Integer . Integer  :: type recorded : Integer . Integer . Integer . Integer . Undefined . Integer  : namespaces/compiler/x64.cft : 362.87
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Group1_Immediate[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 362.87
[34;49m ..      void _Compile_SUBI_DSP ( imm ) { [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( SUB, REG, DSP, 0, imm, 1 ) .. [34;49m[32;49m
0x7ffff72fe319    49b9eade2ff7ff7f0000    mov r9, 0x7ffff72fdeea                                 [34;49m[32;49m
0x7ffff72fe323    49ffd1                  call r9                    	< void.[39;49m_Compile_Group1_Immediate[34;49m : 0x00007ffff72fdeea >[34;49m
dbg[c]  :: [34;49m...[34;49m : 362.090 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m_Compile_SUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, REG, DSP, 0, imm, 1 ) [34;49m[33;40m;[34;49m[34;49m } prefix [34;49m 
dbg[c]  :: [34;49m...[34;49m : 362.092 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m_Compile_SUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, REG, DSP, 0, imm, 1 ) ; [34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 362.92
[34;49m .. ediate ( SUB, REG, DSP, 0, imm, 1 ) ; [34;49m[33;40m}[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe326    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe32a    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe32e    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe332    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 362.92 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 362.099 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49mile_SUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, REG, DSP, 0, imm, 1 ) ; } [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 364.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 366.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_Test ( _mod, _reg, rm, controlFlags, disp, imm ) {  .. [34;49m[32;49m
0x7ffff72fe333    e900000000              jmp 0x7ffff72fe338         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe338    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe33c    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe340    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 366.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c8fd60[34;49m.
dbg[c]  :: [34;49m...[34;49m : 367.038 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c84628 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xf7, _mod, _re[34;49m 
dbg[c]  :: [34;49m...[34;49m : 367.041 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c91ba8 :> [34;49m    Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m, 0xf7, _mod, _reg, rm, REX_B | MODRM_B | co[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 367.41
[34;49m .. { Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe347    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe351    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe355    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.047 : <literal> :> [33;40m0xf7[34;49m <: 0x00007ffff738245f :> [34;49mCompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40m0xf7[34;49m[34;49m, _mod, _reg, rm, REX_B | MODRM_B | con[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0xf7[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 367.47
[34;49m .. ompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40m0xf7[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe358    48b8f700000000000000    mov rax, 0xf7                                          [34;49m[32;49m
0x7ffff72fe362    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe366    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.053 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c89688 :> [34;49me_CalcWrite_Instruction_X64 ( 0, 0xf7, [34;49m[33;40m_mod[34;49m[34;49m, _reg, rm, REX_B | MODRM_B | controlFla[34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 367.53
[34;49m .. _CalcWrite_Instruction_X64 ( 0, 0xf7, [34;49m[33;40m_mod[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe369    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fe36d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe371    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.059 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c8bdf0 :> [34;49mWrite_Instruction_X64 ( 0, 0xf7, _mod, [34;49m[33;40m_reg[34;49m[34;49m, rm, REX_B | MODRM_B | controlFlags, 0,[34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 367.59
[34;49m .. rite_Instruction_X64 ( 0, 0xf7, _mod, [34;49m[33;40m_reg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe374    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fe378    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe37c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.063 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c8c348 :> [34;49me_Instruction_X64 ( 0, 0xf7, _mod, _reg, [34;49m[33;40mrm[34;49m[34;49m, REX_B | MODRM_B | controlFlags, 0, disp,[34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 367.63
[34;49m .. nstruction_X64 ( 0, 0xf7, _mod, _reg, [34;49m[33;40mrm[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe37f    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fe383    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe387    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.071 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7d748 :> [34;49mstruction_X64 ( 0, 0xf7, _mod, _reg, rm, [34;49m[33;40mREX_B[34;49m[34;49m | MODRM_B | controlFlags, 0, disp, 0, im[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 367.71[32;49m
0x7ffff72fe38a    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe394    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe398    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.073 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49mnstruction_X64 ( 0, 0xf7, _mod, _reg, rm, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | controlFlags, 0, disp, 0, imm, 0 ) ; /[34;49m 
dbg[c]  :: [34;49m...[34;49m : 367.081 : X64 :> [33;40mMODRM_B[34;49m <: 0x00007ffff5c7dad8 :> [34;49mX64 ( 0, 0xf7, _mod, _reg, rm, REX_B | [34;49m[33;40mMODRM_B[34;49m[34;49m | controlFlags, 0, disp, 0, imm, 0 ) ;[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMODRM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 367.81[32;49m
0x7ffff72fe39b    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe3a5    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3a9    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.081 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49mnstruction_X64 ( 0, 0xf7, _mod, _reg, rm, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | controlFlags, 0, disp, 0, imm, 0 ) ; /[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 367.81
[34;49m .. _X64 ( 0, 0xf7, _mod, _reg, rm, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B [34;49m[32;49m
0x7ffff72fe39b    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe3a5    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3a9    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe3ac    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe3af    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe3b3    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe3b7    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe3ba    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3be    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.095 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c8cfc0 :> [34;49mmod, _reg, rm, REX_B | MODRM_B | [34;49m[33;40mcontrolFlags[34;49m[34;49m, 0, disp, 0, imm, 0 ) ; //?? [34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 367.95
[34;49m .. f7, _mod, _reg, rm, REX_B | MODRM_B | [34;49m[33;40mcontrolFlags[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe3c1    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe3c5    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3c9    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.095 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49muction_X64 ( 0, 0xf7, _mod, _reg, rm, REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m controlFlags, 0, disp, 0, imm, 0 ) ; //?? [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   14 bytes : at namespaces/compiler/x64.cft : 367.95
[34;49m .. 0xf7, _mod, _reg, rm, REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m controlFlags[34;49m[32;49m
0x7ffff72fe3ba    498b4fe8                mov rcx, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe3be    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe3c1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3c5    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.098 : <literal> :> [33;40m0[34;49m <: 0x00007ffff738265a :> [34;49m0, 0xf7, _mod, _reg, rm, REX_B | MODRM_B | controlFlags, [34;49m[33;40m0[34;49m[34;49m, disp, 0, imm, 0 ) ; //?? [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 367.98
[34;49m .. , rm, REX_B | MODRM_B | controlFlags, [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe3c8    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe3d2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3d6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.104 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c8d6e0 :> [34;49m 0xf7, _mod, _reg, rm, REX_B | MODRM_B | controlFlags, 0, [34;49m[33;40mdisp[34;49m[34;49m, 0, imm, 0 ) ; //?? [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 367.104
[34;49m .. m, REX_B | MODRM_B | controlFlags, 0, [34;49m[33;40mdisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe3d9    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe3dd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3e1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.107 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7382855 :> [34;49m0, 0xf7, _mod, _reg, rm, REX_B | MODRM_B | controlFlags, 0, disp, [34;49m[33;40m0[34;49m[34;49m, imm, 0 ) ; //?? [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 367.107
[34;49m .. _B | MODRM_B | controlFlags, 0, disp, [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe3e4    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe3ee    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3f2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.112 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5c8d8a8 :> [34;49m, 0xf7, _mod, _reg, rm, REX_B | MODRM_B | controlFlags, 0, disp, 0, [34;49m[33;40mimm[34;49m[34;49m, 0 ) ; //?? [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 367.112
[34;49m .. | MODRM_B | controlFlags, 0, disp, 0, [34;49m[33;40mimm[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe3f5    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe3f9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3fd    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.116 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7382a50 :> [34;49m0, 0xf7, _mod, _reg, rm, REX_B | MODRM_B | controlFlags, 0, disp, 0, imm, [34;49m[33;40m0[34;49m[34;49m ) ; //?? [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 367.116
[34;49m .. RM_B | controlFlags, 0, disp, 0, imm, [34;49m[33;40m0[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fe400    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe40a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe40e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.117 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c84628 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xf7, _mod, _re[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 367.117[39;49m :
TypeWordStack depth =  11 :  = Top = 0x00007ffff7fc1a78, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a78 > = 0x00007ffff7382a50	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a70 > = 0x00007ffff5c8d8a8	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a68 > = 0x00007ffff7382855	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a60 > = 0x00007ffff5c8d6e0	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a58 > = 0x00007ffff738265a	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c8cfc0	< word : locals_0.[34;49mcontrolFlags[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -6 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c8c348	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -7 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c8bdf0	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -8 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c89688	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -9 ] < 0x00007ffff7fc1a30 > = 0x00007ffff738245f	< word : <literal>.[34;49m0xf7[39;49m : value = 0x00000000000000f7 > : [34;49mInteger [39;49m
  TypeWordStack   [ -10 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c91ba8	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: void.Compile_CalcWrite_Instruction_X64 :: type expected :  :: type recorded : Integer . Integer . Undefined . Undefined . Undefined . Undefined . Integer . Undefined . Integer . Undefined . Integer  : namespaces/compiler/x64.cft : 367.117
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 367.117
[34;49m .. _reg, rm, controlFlags, disp, imm ) { [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xf7, _mod, _reg, rm, REX_B | MODRM_B | controlFlags, 0, disp, 0, .. [34;49m[32;49m
0x7ffff72fe411    49b983db2ff7ff7f0000    mov r9, 0x7ffff72fdb83                                 [34;49m[32;49m
0x7ffff72fe41b    49ffd1                  call r9                    	< void.[39;49mCompile_CalcWrite_Instruction_X64[34;49m : 0x00007ffff72fdb83 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 367.120 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49mon_X64 ( 0, 0xf7, _mod, _reg, rm, REX_B | MODRM_B | controlFlags, 0, disp, 0, imm, 0 ) [34;49m[33;40m;[34;49m[34;49m //?? [34;49m 
dbg[c]  :: [34;49m...[34;49m : 367.122 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m64 ( 0, 0xf7, _mod, _reg, rm, REX_B | MODRM_B | controlFlags, 0, disp, 0, imm, 0 ) ; [34;49m[33;40m//[34;49m[34;49m?? [34;49m 
dbg[c]  :: [34;49m...[34;49m : 368.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 368.2
[34;49m ..  controlFlags, 0, disp, 0, imm, 0 ) ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fe41e    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe422    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe426    4983ee30                sub r14, 0x30                                          [34;49m[32;49m
0x7ffff72fe42a    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 368.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 368.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 370.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 372.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_Move_Reg_To_Rm ( dstRmReg, srcReg, rmRegDisp ) {  .. [34;49m[32;49m
0x7ffff72fe42b    e900000000              jmp 0x7ffff72fe430         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe430    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe434    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe438    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 372.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c93740[34;49m.
dbg[c]  :: [34;49m...[34;49m : 373.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49m_Compile_Move ( toRegOrMem _mod _reg rm controlFlags disp | opCode ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 374.018 : void :> [33;40m_Compile_Move[34;49m <: 0x00007ffff5c859c0 :> [34;49m    [34;49m[33;40m_Compile_Move[34;49m[34;49m ( MEM, MEM, srcReg, dstRmReg, (REX_B | MODRM_B | DISP_B), rm[34;49m 
dbg[c]  :: [34;49m...[34;49m : 374.023 : X64 :> [33;40mMEM[34;49m <: 0x00007ffff74b7640 :> [34;49m    _Compile_Move ( [34;49m[33;40mMEM[34;49m[34;49m, MEM, srcReg, dstRmReg, (REX_B | MODRM_B | DISP_B), rmRegDisp ) ;[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMEM[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 374.23
[34;49m .. srcReg, rmRegDisp ) { _Compile_Move ( [34;49m[33;40mMEM[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe43f    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe449    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe44d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.036 : locals_0 :> [33;40msrcReg[34;49m <: 0x00007ffff5c93cd0 :> [34;49m    _Compile_Move ( MEM, MEM, [34;49m[33;40msrcReg[34;49m[34;49m, dstRmReg, (REX_B | MODRM_B | DISP_B), rmReg[34;49m 
_Do_C_Syntax_Variable : word = srcReg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msrcReg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 374.36
[34;49m .. RegDisp ) { _Compile_Move ( MEM, MEM, [34;49m[33;40msrcReg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe461    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe465    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe469    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.046 : locals_0 :> [33;40mdstRmReg[34;49m <: 0x00007ffff5c93b08 :> [34;49m _Compile_Move ( MEM, MEM, srcReg, [34;49m[33;40mdstRmReg[34;49m[34;49m, (REX_B | MODRM_B | DISP_B), rmRegD[34;49m 
dbg[c]  :: [34;49m...[34;49m : 374.048 : C_Syntax :> [33;40m,[34;49m <: cprimitive :> [34;49m    _Compile_Move ( MEM, MEM, srcReg, dstRmReg[34;49m[33;40m,[34;49m[34;49m (REX_B | MODRM_B | DISP_B), rmRegDisp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 374.048 : locals_0 :> [33;40mdstRmReg[34;49m <: 0x00007ffff5c93b08 :> [34;49m _Compile_Move ( MEM, MEM, srcReg, [34;49m[33;40mdstRmReg[34;49m[34;49m, (REX_B | MODRM_B | DISP_B), rmRegD[34;49m 
_Do_C_Syntax_Variable : word = dstRmReg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdstRmReg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 374.48
[34;49m .. ) { _Compile_Move ( MEM, MEM, srcReg, [34;49m[33;40mdstRmReg[34;49m[34;49m, [34;49m[32;49m
0x7ffff72fe46c    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe470    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe474    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.049 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    _Compile_Move ( MEM, MEM, srcReg, dstRmReg, [34;49m[33;40m([34;49m[34;49mREX_B | MODRM_B | DISP_B), rmRegDisp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 374.055 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7d748 :> [34;49m _Compile_Move ( MEM, MEM, srcReg, dstRmReg, ([34;49m[33;40mREX_B[34;49m[34;49m | MODRM_B | DISP_B), rmRegDisp ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 374.55[39;49m :
TypeWordStack depth =   4 :  = Top = 0x00007ffff7fc1a40, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c93b08	< word : locals_0.[34;49mdstRmReg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c93cd0	< word : locals_0.[34;49msrcReg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c94060	< word : X64.[34;49mMEM[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a28 > = 0x00007ffff74b7640	< word : X64.[34;49mMEM[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: X64.REX_B :: type expected :  :: type recorded : Undefined  : namespaces/compiler/x64.cft : 374.55
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 374.55[32;49m
0x7ffff72fe477    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe481    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe485    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.057 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m    _Compile_Move ( MEM, MEM, srcReg, dstRmReg, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | DISP_B), rmRegDisp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 374.065 : X64 :> [33;40mMODRM_B[34;49m <: 0x00007ffff5c7dad8 :> [34;49mCompile_Move ( MEM, MEM, srcReg, dstRmReg, (REX_B | [34;49m[33;40mMODRM_B[34;49m[34;49m | DISP_B), rmRegDisp ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMODRM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 374.65[32;49m
0x7ffff72fe488    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe492    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe496    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.065 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m    _Compile_Move ( MEM, MEM, srcReg, dstRmReg, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | DISP_B), rmRegDisp ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 374.65[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c93cd0	< word : locals_0.[34;49msrcReg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c94060	< word : X64.[34;49mMEM[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff74b7640	< word : X64.[34;49mMEM[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Integer . Undefined  : namespaces/compiler/x64.cft : 374.65
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 374.65
[34;49m ..  ( MEM, MEM, srcReg, dstRmReg, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B [34;49m[32;49m
0x7ffff72fe488    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe492    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe496    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe499    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe49c    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe4a0    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe4a4    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe4a7    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe4ab    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.073 : X64 :> [33;40mDISP_B[34;49m <: 0x00007ffff5c7e1f8 :> [34;49m_Compile_Move ( MEM, MEM, srcReg, dstRmReg, (REX_B | MODRM_B | [34;49m[33;40mDISP_B[34;49m[34;49m), rmRegDisp ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDISP_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 374.73[32;49m
0x7ffff72fe4ae    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe4b8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe4bc    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.073 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m    _Compile_Move ( MEM, MEM, srcReg, dstRmReg, (REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m DISP_B), rmRegDisp ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 374.73[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c94228	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff74b7640	< word : X64.[34;49mMEM[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 374.73
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 374.73
[34;49m .. M, srcReg, dstRmReg, (REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m DISP_B[34;49m[32;49m
0x7ffff72fe4ae    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe4b8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe4bc    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe4bf    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe4c2    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe4c6    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe4ca    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe4cd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe4d1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.074 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    _Compile_Move ( MEM, MEM, srcReg, dstRmReg, (REX_B | MODRM_B | DISP_B[34;49m[33;40m)[34;49m[34;49m, rmRegDisp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 374.086 : locals_0 :> [33;40mrmRegDisp[34;49m <: 0x00007ffff5c93e98 :> [34;49m_Move ( MEM, MEM, srcReg, dstRmReg, (REX_B | MODRM_B | DISP_B), [34;49m[33;40mrmRegDisp[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = rmRegDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrmRegDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 374.86
[34;49m .. dstRmReg, (REX_B | MODRM_B | DISP_B), [34;49m[33;40mrmRegDisp[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe4d4    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe4d8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe4dc    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.087 : void :> [33;40m_Compile_Move[34;49m <: 0x00007ffff5c859c0 :> [34;49m    [34;49m[33;40m_Compile_Move[34;49m[34;49m ( MEM, MEM, srcReg, dstRmReg, (REX_B | MODRM_B | DISP_B), rm[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 374.87[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c93e98	< word : locals_0.[34;49mrmRegDisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5bc31d8	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
type match :: void._Compile_Move :: type expected : Integer  :: type recorded : Integer . Undefined  : namespaces/compiler/x64.cft : 374.87
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 374.87
[34;49m .. _Rm ( dstRmReg, srcReg, rmRegDisp ) { [34;49m[33;40m_Compile_Move[34;49m[34;49m ( MEM, MEM, srcReg, dstRmReg, (REX_B | MODRM_B | DISP_B), rmRegDisp )[34;49m[32;49m
0x7ffff72fe4df    49b905dd2ff7ff7f0000    mov r9, 0x7ffff72fdd05                                 [34;49m[32;49m
0x7ffff72fe4e9    49ffd1                  call r9                    	< void.[39;49m_Compile_Move[34;49m : 0x00007ffff72fdd05 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 374.090 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    _Compile_Move ( MEM, MEM, srcReg, dstRmReg, (REX_B | MODRM_B | DISP_B), rmRegDisp ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 375.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 375.2
[34;49m .. _B | MODRM_B | DISP_B), rmRegDisp ) ; [34;49m[33;40m}[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe4ec    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe4f0    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe4f4    4983ee18                sub r14, 0x18                                          [34;49m[32;49m
0x7ffff72fe4f8    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 375.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 375.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 377.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 379.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_Move_Reg_To_StackN ( stackReg, index, _reg ) {  .. [34;49m[32;49m
0x7ffff72fe4f9    e900000000              jmp 0x7ffff72fe4fe         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe4fe    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe502    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe506    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 379.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c943f0[34;49m.
dbg[c]  :: [34;49m...[34;49m : 380.028 : void :> [33;40m_Compile_Move_Reg_To_Rm[34;49m <: 0x00007ffff5c93740 :> [34;49m    [34;49m[33;40m_Compile_Move_Reg_To_Rm[34;49m[34;49m ( stackReg, _reg, index * CELL ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 380.038 : locals_0 :> [33;40mstackReg[34;49m <: 0x00007ffff5bc33d8 :> [34;49m    _Compile_Move_Reg_To_Rm ( [34;49m[33;40mstackReg[34;49m[34;49m, _reg, index * CELL ) ; [34;49m 
_Do_C_Syntax_Variable : word = stackReg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mstackReg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 380.38
[34;49m .. x, _reg ) { _Compile_Move_Reg_To_Rm ( [34;49m[33;40mstackReg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe50d    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe511    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe515    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 380.044 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5bc3768 :> [34;49m    _Compile_Move_Reg_To_Rm ( stackReg, [34;49m[33;40m_reg[34;49m[34;49m, index * CELL ) ; [34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 380.44
[34;49m .. { _Compile_Move_Reg_To_Rm ( stackReg, [34;49m[33;40m_reg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe518    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe51c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe520    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 380.052 : locals_0 :> [33;40mindex[34;49m <: 0x00007ffff5bc35a0 :> [34;49m    _Compile_Move_Reg_To_Rm ( stackReg, _reg, [34;49m[33;40mindex[34;49m[34;49m * CELL ) ; [34;49m 
_Do_C_Syntax_Variable : word = index :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mindex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 380.52
[34;49m .. pile_Move_Reg_To_Rm ( stackReg, _reg, [34;49m[33;40mindex[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe523    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe527    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe52b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 380.054 : Int :> [33;40m*[34;49m <: cprimitive :> [34;49m    _Compile_Move_Reg_To_Rm ( stackReg, _reg, index [34;49m[33;40m*[34;49m[34;49m CELL ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 380.059 : X64 :> [33;40mCELL[34;49m <: 0x00007ffff5c7d028 :> [34;49m    _Compile_Move_Reg_To_Rm ( stackReg, _reg, index * [34;49m[33;40mCELL[34;49m[34;49m ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCELL[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 380.59
[34;49m .. e_Reg_To_Rm ( stackReg, _reg, index * [34;49m[33;40mCELL[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe52e    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe538    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe53c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 380.059 : Int :> [33;40m*[34;49m <: cprimitive :> [34;49m    _Compile_Move_Reg_To_Rm ( stackReg, _reg, index [34;49m[33;40m*[34;49m[34;49m CELL ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m*[34;49m <:   21 bytes : at namespaces/compiler/x64.cft : 380.59
[34;49m .. ove_Reg_To_Rm ( stackReg, _reg, index [34;49m[33;40m*[34;49m[34;49m CELL [34;49m[32;49m
0x7ffff72fe527    48b90800000000000000    mov rcx, 0x8                                           [34;49m[32;49m
0x7ffff72fe531    480fafc1                imul rax, rcx                                          [34;49m[32;49m
0x7ffff72fe535    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe539    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 380.060 : void :> [33;40m_Compile_Move_Reg_To_Rm[34;49m <: 0x00007ffff5c93740 :> [34;49m    [34;49m[33;40m_Compile_Move_Reg_To_Rm[34;49m[34;49m ( stackReg, _reg, index * CELL ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 380.60[39;49m :
TypeWordStack depth =   4 :  = Top = 0x00007ffff7fc1a40, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c7d028	< word : X64.[34;49mCELL[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5bc35a0	< word : locals_0.[34;49mindex[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5bc3768	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5bc33d8	< word : locals_0.[34;49mstackReg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: void._Compile_Move_Reg_To_Rm :: type expected :  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 380.60
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move_Reg_To_Rm[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 380.60
[34;49m .. To_StackN ( stackReg, index, _reg ) { [34;49m[33;40m_Compile_Move_Reg_To_Rm[34;49m[34;49m ( stackReg, _reg, index * CELL )[34;49m[32;49m
0x7ffff72fe53c    49b930e42ff7ff7f0000    mov r9, 0x7ffff72fe430                                 [34;49m[32;49m
0x7ffff72fe546    49ffd1                  call r9                    	< void.[39;49m_Compile_Move_Reg_To_Rm[34;49m : 0x00007ffff72fe430 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 380.063 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    _Compile_Move_Reg_To_Rm ( stackReg, _reg, index * CELL ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 381.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 381.2
[34;49m .. Rm ( stackReg, _reg, index * CELL ) ; [34;49m[33;40m}[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe549    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe54d    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe551    4983ee18                sub r14, 0x18                                          [34;49m[32;49m
0x7ffff72fe555    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 381.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 381.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 383.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 385.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_TEST_Reg_To_Reg ( dstReg, srcReg ) {  .. [34;49m[32;49m
0x7ffff72fe556    e900000000              jmp 0x7ffff72fe55b         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe55b    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe55f    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe563    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 385.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc3930[34;49m.
dbg[c]  :: [34;49m...[34;49m : 386.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49m_Compile_Op_Special_Reg_To_Reg ( TEST_R_TO_R, dstReg, srcReg ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 387.038 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c84628 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0x85, 3, srcReg[34;49m 
dbg[c]  :: [34;49m...[34;49m : 387.041 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7382e7c :> [34;49m    Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m, 0x85, 3, srcReg, dstReg, REX_B | MODRM_B, [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 387.41
[34;49m .. { Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe56a    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe574    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe578    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.047 : <literal> :> [33;40m0x85[34;49m <: 0x00007ffff7383077 :> [34;49mCompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40m0x85[34;49m[34;49m, 3, srcReg, dstReg, REX_B | MODRM_B, 0[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x85[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 387.47
[34;49m .. ompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40m0x85[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe57b    48b88500000000000000    mov rax, 0x85                                          [34;49m[32;49m
0x7ffff72fe585    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe589    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.050 : <literal> :> [33;40m3[34;49m <: 0x00007ffff7383272 :> [34;49mpile_CalcWrite_Instruction_X64 ( 0, 0x85, [34;49m[33;40m3[34;49m[34;49m, srcReg, dstReg, REX_B | MODRM_B, 0, 0, 0[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m3[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 387.50
[34;49m .. _CalcWrite_Instruction_X64 ( 0, 0x85, [34;49m[33;40m3[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe58c    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fe596    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe59a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.058 : locals_0 :> [33;40msrcReg[34;49m <: 0x00007ffff5bc3ec0 :> [34;49mcWrite_Instruction_X64 ( 0, 0x85, 3, [34;49m[33;40msrcReg[34;49m[34;49m, dstReg, REX_B | MODRM_B, 0, 0, 0, 0,[34;49m 
_Do_C_Syntax_Variable : word = srcReg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msrcReg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 387.58
[34;49m .. lcWrite_Instruction_X64 ( 0, 0x85, 3, [34;49m[33;40msrcReg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe59d    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe5a1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe5a5    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.066 : locals_0 :> [33;40mdstReg[34;49m <: 0x00007ffff5bc3cf8 :> [34;49mnstruction_X64 ( 0, 0x85, 3, srcReg, [34;49m[33;40mdstReg[34;49m[34;49m, REX_B | MODRM_B, 0, 0, 0, 0, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = dstReg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdstReg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 387.66
[34;49m .. Instruction_X64 ( 0, 0x85, 3, srcReg, [34;49m[33;40mdstReg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe5a8    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe5ac    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe5b0    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.074 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7d748 :> [34;49mWrite_Instruction_X64 ( 0, 0x85, 3, srcReg, dstReg, [34;49m[33;40mREX_B[34;49m[34;49m | MODRM_B, 0, 0, 0, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 387.74[32;49m
0x7ffff72fe5b3    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe5bd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe5c1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.076 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49mompile_CalcWrite_Instruction_X64 ( 0, 0x85, 3, srcReg, dstReg, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B, 0, 0, 0, 0, 0 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 387.083 : X64 :> [33;40mMODRM_B[34;49m <: 0x00007ffff5c7dad8 :> [34;49mite_Instruction_X64 ( 0, 0x85, 3, srcReg, dstReg, REX_B | [34;49m[33;40mMODRM_B[34;49m[34;49m, 0, 0, 0, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMODRM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 387.83[32;49m
0x7ffff72fe5c4    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe5ce    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe5d2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.083 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49mompile_CalcWrite_Instruction_X64 ( 0, 0x85, 3, srcReg, dstReg, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B, 0, 0, 0, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 387.83
[34;49m .. 4 ( 0, 0x85, 3, srcReg, dstReg, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B[34;49m[32;49m
0x7ffff72fe5c4    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe5ce    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe5d2    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe5d5    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe5d8    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe5dc    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe5e0    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe5e3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe5e7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.086 : <literal> :> [33;40m0[34;49m <: 0x00007ffff738346d :> [34;49mite_Instruction_X64 ( 0, 0x85, 3, srcReg, dstReg, REX_B | MODRM_B, [34;49m[33;40m0[34;49m[34;49m, 0, 0, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 387.86
[34;49m .. , 3, srcReg, dstReg, REX_B | MODRM_B, [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe5ea    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe5f4    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe5f8    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.100 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c84628 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0x85, 3, srcReg[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 387.100[39;49m :
TypeWordStack depth =  10 :  = Top = 0x00007ffff7fc1a70, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a70 > = 0x00007ffff7383c59	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a68 > = 0x00007ffff7383a5e	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a60 > = 0x00007ffff7383863	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a58 > = 0x00007ffff7383668	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a50 > = 0x00007ffff738346d	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5bc3cf8	< word : locals_0.[34;49mdstReg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -6 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5bc3ec0	< word : locals_0.[34;49msrcReg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -7 ] < 0x00007ffff7fc1a38 > = 0x00007ffff7383272	< word : <literal>.[34;49m3[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -8 ] < 0x00007ffff7fc1a30 > = 0x00007ffff7383077	< word : <literal>.[34;49m0x85[39;49m : value = 0x0000000000000085 > : [34;49mInteger [39;49m
  TypeWordStack   [  -9 ] < 0x00007ffff7fc1a28 > = 0x00007ffff7382e7c	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: void.Compile_CalcWrite_Instruction_X64 :: type expected :  :: type recorded : Integer . Integer . Integer . Undefined . Undefined . Integer . Integer . Integer . Integer . Integer  : namespaces/compiler/x64.cft : 387.100
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 387.100
[34;49m .. _TEST_Reg_To_Reg ( dstReg, srcReg ) { [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0x85, 3, srcReg, dstReg, REX_B | MODRM_B, 0, 0, 0, 0, 0 )[34;49m[32;49m
0x7ffff72fe63f    49b983db2ff7ff7f0000    mov r9, 0x7ffff72fdb83                                 [34;49m[32;49m
0x7ffff72fe649    49ffd1                  call r9                    	< void.[39;49mCompile_CalcWrite_Instruction_X64[34;49m : 0x00007ffff72fdb83 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 387.103 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49mle_CalcWrite_Instruction_X64 ( 0, 0x85, 3, srcReg, dstReg, REX_B | MODRM_B, 0, 0, 0, 0, 0 ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 389.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 389.2
[34;49m .. , REX_B | MODRM_B, 0, 0, 0, 0, 0 ) ;  [34;49m[33;40m}[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe64c    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe650    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe654    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe658    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 389.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 389.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 391.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine Compile_INC( mod, rm, sib, disp ) _Compile_Group5 ( INC, mod, rm, sib, disp, 0  ) [34;49m 
dbg[i]  :: [34;49m...[34;49m : 391.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m Compile_INC( mod, rm, sib, disp ) _Compile_Group5 ( INC, mod, rm, sib, disp, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 391.020 : C :> [33;40m([34;49m <: cprimitive :> [34;49m#define Compile_INC[34;49m[33;40m([34;49m[34;49m mod, rm, sib, disp ) _Compile_Group5 ( INC, mod, rm, sib, disp, 0  ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 391.058 : void :> [33;40m_Compile_Group5[34;49m <: 0x00007ffff5c93498 :> [34;49mile_INC( mod, rm, sib, disp ) [34;49m[33;40m_Compile_Group5[34;49m[34;49m ( INC, mod, rm, sib, disp, 0  [34;49m 
dbg[c]  :: [34;49m...[34;49m : 391.063 : X64 :> [33;40mINC[34;49m <: 0x00007ffff5c7d3b8 :> [34;49mdefine Compile_INC( mod, rm, sib, disp ) _Compile_Group5 ( [34;49m[33;40mINC[34;49m[34;49m, mod, rm, sib, disp, 0  ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mINC[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 391.63[32;49m
0x7ffff72fe66d    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe677    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe67b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 391.068 : locals_0 :> [33;40mmod[34;49m <: 0x00007ffff5bc4450 :> [34;49me Compile_INC( mod, rm, sib, disp ) _Compile_Group5 ( INC, [34;49m[33;40mmod[34;49m[34;49m, rm, sib, disp, 0  ) [34;49m 
_Do_C_Syntax_Variable : word = mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mmod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 391.68[32;49m
0x7ffff72fe67e    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fe682    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe686    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 391.072 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5bc4618 :> [34;49mne Compile_INC( mod, rm, sib, disp ) _Compile_Group5 ( INC, mod, [34;49m[33;40mrm[34;49m[34;49m, sib, disp, 0  ) [34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 391.72[32;49m
0x7ffff72fe689    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe68d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe691    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 391.077 : locals_0 :> [33;40msib[34;49m <: 0x00007ffff5bc47e0 :> [34;49me Compile_INC( mod, rm, sib, disp ) _Compile_Group5 ( INC, mod, rm, [34;49m[33;40msib[34;49m[34;49m, disp, 0  ) [34;49m 
_Do_C_Syntax_Variable : word = sib :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msib[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 391.77[32;49m
0x7ffff72fe694    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe698    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe69c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 391.083 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5bc49a8 :> [34;49m Compile_INC( mod, rm, sib, disp ) _Compile_Group5 ( INC, mod, rm, sib, [34;49m[33;40mdisp[34;49m[34;49m, 0  ) [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 391.83[32;49m
0x7ffff72fe69f    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe6a3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe6a7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 391.087 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7383f53 :> [34;49mne Compile_INC( mod, rm, sib, disp ) _Compile_Group5 ( INC, mod, rm, sib, disp, [34;49m[33;40m0[34;49m[34;49m  ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 391.87[32;49m
0x7ffff72fe6aa    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe6b4    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe6b8    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 391.089 : void :> [33;40m_Compile_Group5[34;49m <: 0x00007ffff5c93498 :> [34;49mile_INC( mod, rm, sib, disp ) [34;49m[33;40m_Compile_Group5[34;49m[34;49m ( INC, mod, rm, sib, disp, 0  [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 391.89[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff7383f53	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5bc49a8	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5bc47e0	< word : locals_0.[34;49msib[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5bc4618	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5bc4450	< word : locals_0.[34;49mmod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7d3b8	< word : X64.[34;49mINC[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: void._Compile_Group5 :: type expected : Integer . Integer  :: type recorded : Integer . Undefined . Undefined . Undefined . Undefined . Integer  : namespaces/compiler/x64.cft : 391.89
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Group5[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 391.89[32;49m
0x7ffff72fe6bb    49b90be12ff7ff7f0000    mov r9, 0x7ffff72fe10b                                 [34;49m[32;49m
0x7ffff72fe6c5    49ffd1                  call r9                    	< void.[39;49m_Compile_Group5[34;49m : 0x00007ffff72fe10b >[34;49m
dbg[i]  :: [34;49m...[34;49m : 392.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine Compile_DEC( mod, rm, sib, disp ) _Compile_Group5 ( DEC, mod, rm, sib, disp, 0  ) [34;49m 
dbg[i]  :: [34;49m...[34;49m : 392.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m Compile_DEC( mod, rm, sib, disp ) _Compile_Group5 ( DEC, mod, rm, sib, disp, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 392.020 : C :> [33;40m([34;49m <: cprimitive :> [34;49m#define Compile_DEC[34;49m[33;40m([34;49m[34;49m mod, rm, sib, disp ) _Compile_Group5 ( DEC, mod, rm, sib, disp, 0  ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 392.058 : void :> [33;40m_Compile_Group5[34;49m <: 0x00007ffff5c93498 :> [34;49mile_DEC( mod, rm, sib, disp ) [34;49m[33;40m_Compile_Group5[34;49m[34;49m ( DEC, mod, rm, sib, disp, 0  [34;49m 
dbg[c]  :: [34;49m...[34;49m : 392.063 : X64 :> [33;40mDEC[34;49m <: 0x00007ffff5c7d580 :> [34;49mdefine Compile_DEC( mod, rm, sib, disp ) _Compile_Group5 ( [34;49m[33;40mDEC[34;49m[34;49m, mod, rm, sib, disp, 0  ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDEC[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 392.63
[34;49m ..                      _Compile_Group5  [34;49m[33;40mDEC[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe6d5    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe6df    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe6e3    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 392.068 : locals_0 :> [33;40mmod[34;49m <: 0x00007ffff5bc4f38 :> [34;49me Compile_DEC( mod, rm, sib, disp ) _Compile_Group5 ( DEC, [34;49m[33;40mmod[34;49m[34;49m, rm, sib, disp, 0  ) [34;49m 
_Do_C_Syntax_Variable : word = mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mmod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 392.68
[34;49m ..                      _Compile_Group5  [34;49m[33;40mmod[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe6e6    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fe6ea    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe6ee    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 392.072 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5bc5100 :> [34;49mne Compile_DEC( mod, rm, sib, disp ) _Compile_Group5 ( DEC, mod, [34;49m[33;40mrm[34;49m[34;49m, sib, disp, 0  ) [34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 392.72
[34;49m ..                      _Compile_Group5  [34;49m[33;40mrm[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe6f1    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe6f5    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe6f9    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 392.077 : locals_0 :> [33;40msib[34;49m <: 0x00007ffff5bc52c8 :> [34;49me Compile_DEC( mod, rm, sib, disp ) _Compile_Group5 ( DEC, mod, rm, [34;49m[33;40msib[34;49m[34;49m, disp, 0  ) [34;49m 
_Do_C_Syntax_Variable : word = sib :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msib[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 392.77
[34;49m ..                      _Compile_Group5  [34;49m[33;40msib[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe6fc    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe700    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe704    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 392.083 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5bc5490 :> [34;49m Compile_DEC( mod, rm, sib, disp ) _Compile_Group5 ( DEC, mod, rm, sib, [34;49m[33;40mdisp[34;49m[34;49m, 0  ) [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 392.83
[34;49m ..                      _Compile_Group5  [34;49m[33;40mdisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe707    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe70b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe70f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 392.087 : <literal> :> [33;40m0[34;49m <: 0x00007ffff738424d :> [34;49mne Compile_DEC( mod, rm, sib, disp ) _Compile_Group5 ( DEC, mod, rm, sib, disp, [34;49m[33;40m0[34;49m[34;49m  ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 392.87
[34;49m ..                      _Compile_Group5  [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe712    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe71c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe720    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 392.089 : void :> [33;40m_Compile_Group5[34;49m <: 0x00007ffff5c93498 :> [34;49mile_DEC( mod, rm, sib, disp ) [34;49m[33;40m_Compile_Group5[34;49m[34;49m ( DEC, mod, rm, sib, disp, 0  [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 392.89[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff738424d	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5bc5490	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5bc52c8	< word : locals_0.[34;49msib[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5bc5100	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5bc4f38	< word : locals_0.[34;49mmod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7d580	< word : X64.[34;49mDEC[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: void._Compile_Group5 :: type expected : Integer . Integer  :: type recorded : Integer . Undefined . Undefined . Undefined . Undefined . Integer  : namespaces/compiler/x64.cft : 392.89
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Group5[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 392.89
[34;49m ..                                       [34;49m[33;40m_Compile_Group5[34;49m[34;49m   .. [34;49m[32;49m
0x7ffff72fe723    49b90be12ff7ff7f0000    mov r9, 0x7ffff72fe10b                                 [34;49m[32;49m
0x7ffff72fe72d    49ffd1                  call r9                    	< void.[39;49m_Compile_Group5[34;49m : 0x00007ffff72fe10b >[34;49m
dbg[i]  :: [34;49m...[34;49m : 393.012 : Compiler :> [33;40mc_syntaxOff[34;49m <: cprimitive :> [34;49m[34;49m[33;40mc_syntaxOff[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 394.008 : Compiler :> [33;40minfixOn[34;49m <: cprimitive :> [34;49m[34;49m[33;40minfixOn[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 395.002 : Root :> [33;40mC[34;49m <: 0x00007ffff7fa0dc8 :> [34;49m[34;49m[33;40mC[34;49m[34;49m X64 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 395.006 : Asm :> [33;40mX64[34;49m <: 0x00007ffff74b6438 :> [34;49mC [34;49m[33;40mX64[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 396.003 : X64 :> [33;40msp[34;49m <: 0x00007ffff5c7f3c8 :> [34;49m[34;49m[33;40msp[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 397.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m _Compile_Stack_PopToReg ( _reg ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 397.34[32;49m
0x7ffff72fe729    e900000000              jmp 0x7ffff72fe72e         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe72e    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe732    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe736    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 397.34 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc5658[34;49m.
dbg[c]  :: [34;49m...[34;49m : 398.035 : void :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <: 0x00007ffff5c85468 :> [34;49m    [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( _reg @, 0 ) // 4d8b06   [34;49m 
dbg[c]  :: [34;49m...[34;49m : 398.042 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5bc5a20 :> [34;49m    _Compile_Move_DataStackN_ToReg ( [34;49m[33;40m_reg[34;49m[34;49m @, 0 ) // 4d8b06                  mov r8,[34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 398.42
[34;49m .. g )  _Compile_Move_DataStackN_ToReg ( [34;49m[33;40m_reg[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe73d    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe741    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe745    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 398.043 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Move_DataStackN_ToReg ( _reg [34;49m[33;40m@[34;49m[34;49m, 0 ) // 4d8b06                  mov r8, [r14] [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 398.43
[34;49m .. _Compile_Move_DataStackN_ToReg ( _reg [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe73d    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe741    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe745    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 398.047 : <literal> :> [33;40m0[34;49m <: 0x00007ffff73844ae :> [34;49m _Compile_Move_DataStackN_ToReg ( _reg @, [34;49m[33;40m0[34;49m[34;49m ) // 4d8b06                  mov r8, [r14[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 398.47
[34;49m .. mpile_Move_DataStackN_ToReg ( _reg @, [34;49m[33;40m0[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe748    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe752    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe756    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 398.048 : void :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <: 0x00007ffff5c85468 :> [34;49m    [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( _reg @, 0 ) // 4d8b06   [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 398.48[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff73844ae	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5bc5a20	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: void._Compile_Move_DataStackN_ToReg :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 398.48
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 398.48
[34;49m ..   : _Compile_Stack_PopToReg ( _reg )  [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( _reg @, 0 ) .. [34;49m[32;49m
0x7ffff72fe759    49b908de2ff7ff7f0000    mov r9, 0x7ffff72fde08                                 [34;49m[32;49m
0x7ffff72fe763    49ffd1                  call r9                    	< void.[39;49m_Compile_Move_DataStackN_ToReg[34;49m : 0x00007ffff72fde08 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 398.051 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    _Compile_Move_DataStackN_ToReg ( _reg @, 0 ) [34;49m[33;40m//[34;49m[34;49m 4d8b06                  mov r8, [r14] [34;49m 
dbg[c]  :: [34;49m...[34;49m : 400.022 : void :> [33;40m_Compile_SUBI_DSP[34;49m <: 0x00007ffff5c90648 :> [34;49m    [34;49m[33;40m_Compile_SUBI_DSP[34;49m[34;49m ( CELL )                   // 4983ee08              [34;49m 
dbg[c]  :: [34;49m...[34;49m : 400.029 : X64 :> [33;40mCELL[34;49m <: 0x00007ffff5c7d028 :> [34;49m    _Compile_SUBI_DSP ( [34;49m[33;40mCELL[34;49m[34;49m )                   // 4983ee08                sub r14, 0x8[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCELL[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 400.29
[34;49m .. Reg ( _reg @, 0 ) _Compile_SUBI_DSP ( [34;49m[33;40mCELL[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe766    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe770    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe774    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 400.030 : void :> [33;40m_Compile_SUBI_DSP[34;49m <: 0x00007ffff5c90648 :> [34;49m    [34;49m[33;40m_Compile_SUBI_DSP[34;49m[34;49m ( CELL )                   // 4983ee08              [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 400.30[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7d028	< word : X64.[34;49mCELL[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
type match :: void._Compile_SUBI_DSP :: type expected : Any  :: type recorded : Integer  : namespaces/compiler/x64.cft : 400.30
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_SUBI_DSP[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 400.30
[34;49m .. e_Move_DataStackN_ToReg ( _reg @, 0 ) [34;49m[33;40m_Compile_SUBI_DSP[34;49m[34;49m ( CELL )[34;49m[32;49m
0x7ffff72fe777    49b9aae22ff7ff7f0000    mov r9, 0x7ffff72fe2aa                                 [34;49m[32;49m
0x7ffff72fe781    49ffd1                  call r9                    	< void.[39;49m_Compile_SUBI_DSP[34;49m : 0x00007ffff72fe2aa >[34;49m
dbg[c]  :: [34;49m...[34;49m : 400.051 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    _Compile_SUBI_DSP ( CELL )                   [34;49m[33;40m//[34;49m[34;49m 4983ee08                sub r14, 0x8 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 402.003 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b5d18 :> [34;49m[34;49m[33;40m;;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 402.3
[34;49m .. reg @, 0 ) _Compile_SUBI_DSP ( CELL ) [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe784    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe788    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe78c    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe790    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 402.3 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 403.003 : X64 :> [33;40msp[34;49m <: 0x00007ffff5c7f3c8 :> [34;49m[34;49m[33;40msp[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 404.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m'_Compile_Stack_PopToReg find wdiss //pause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 405.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif 0 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 405.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m 0 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 405.006 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cf7c88 :> [34;49m#if [34;49m[33;40m0[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 405.6 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 423.002 : Root :> [33;40mC[34;49m <: 0x00007ffff7fa0dc8 :> [34;49m[34;49m[33;40mC[34;49m[34;49m X64 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 423.006 : Asm :> [33;40mX64[34;49m <: 0x00007ffff74b6438 :> [34;49mC [34;49m[33;40mX64[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 424.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif x64_dbg [34;49m 
dbg[i]  :: [34;49m...[34;49m : 424.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m x64_dbg [34;49m 
dbg[i]  :: [34;49m...[34;49m : 424.012 : X64 :> [33;40mx64_dbg[34;49m <: 0x00007ffff5c7f038 :> [34;49m#if [34;49m[33;40mx64_dbg[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 424.12 :> [39;49mx64_dbg[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
dbg[i]  :: [34;49m...[34;49m : 425.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49mverbosity 3 = [34;49m 
dbg[i]  :: [34;49m...[34;49m : 426.012 : Root :> [33;40mCombinators[34;49m <: 0x00007ffff7fa76a0 :> [34;49m[34;49m[33;40mCombinators[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 428.003 : X64 :> [33;40msp[34;49m <: 0x00007ffff5c7f3c8 :> [34;49m[34;49m[33;40msp[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 429.005 : Asm :> [33;40m:asm[34;49m <: 0x00007ffff74b5268 :> [34;49m[34;49m[33;40m:asm[34;49m[34;49m iax [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:asm[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 429.9[32;49m
0x7ffff72fe791    e900000000              jmp 0x7ffff72fe796         	< C compiler code >        [34;49m
[34;49m ..                                       [34;49m[33;40miax[34;49m[34;49mCompile_Stack_PopToReg ( _reg )  _Compile_Move_DataStackN_ToReg ( _reg @, 0 ) _Compile_SUBI_DSP ( CEL .. [34;49m[32;49m
0x7ffff72fe796    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe79a    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe79e    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 429.9 :> [39;49m:asm[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc5be8[34;49m.
dbg[i]  :: [34;49m...[34;49m : 430.028 : X64 :> [33;40m_Compile_Stack_PopToReg[34;49m <: 0x00007ffff5bc5658 :> [34;49m    [34;49m[33;40m_Compile_Stack_PopToReg[34;49m[34;49m ( R8D )             //4d8b06             [34;49m 
dbg[i]  :: [34;49m...[34;49m : 430.034 : X64 :> [33;40mR8D[34;49m <: 0x00007ffff5c7a3a0 :> [34;49m    _Compile_Stack_PopToReg ( [34;49m[33;40mR8D[34;49m[34;49m )             //4d8b06                  mov r8, [r14] [34;49m 
Stack : word at namespaces/compiler/x64.cft : 430.34 :> [39;49mR8D[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000008[34;49m.
dbg[i]  :: [34;49m...[34;49m : 430.035 : X64 :> [33;40m_Compile_Stack_PopToReg[34;49m <: 0x00007ffff5bc5658 :> [34;49m    [34;49m[33;40m_Compile_Stack_PopToReg[34;49m[34;49m ( R8D )             //4d8b06             [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 430.35[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7a3a0	< word : X64.[34;49mR8D[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
type match :: X64._Compile_Stack_PopToReg :: type expected : Integer  :: type recorded : Integer  : namespaces/compiler/x64.cft : 430.35
_Compile_Write_Instruction_X64 : 7ffff72fe7a5 : 3 bytes : ...
[34;49m ..                                     : [39;49m[33;40m_Compile_Stack_PopToReg[39;49m[34;49m ( _reg )  _Compile_Move_DataStackN_ToReg ( _reg @, 0 ) _Compile_SUBI_DSP ( CELL  .. [39;49m[32;49m
0x7ffff72fe7a5    4d8b06                  mov r8, [r14]                                          [39;49m
_Compile_Write_Instruction_X64 : 7ffff72fe7a8 : 4 bytes : ...[32;49m
0x7ffff72fe7a8    4983ee08                sub r14, 0x8                                           [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Stack_PopToReg[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 430.35[32;49m
0x7ffff72fe7a5    4d8b06                  mov r8, [r14]                                          [34;49m[32;49m
0x7ffff72fe7a8    4983ee08                sub r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 430.35 :> [39;49m_Compile_Stack_PopToReg[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff5bc5be8[34;49m.
dbg[i]  :: [34;49m...[34;49m : 430.050 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    _Compile_Stack_PopToReg ( R8D )             [34;49m[33;40m//[34;49m[34;49m4d8b06                  mov r8, [r14] [34;49m 
dbg[i]  :: [34;49m...[34;49m : 431.025 : void :> [33;40m_Compile_CallThruReg[34;49m <: 0x00007ffff5c91488 :> [34;49m    [34;49m[33;40m_Compile_CallThruReg[34;49m[34;49m ( R8D )                //4983ee08             [34;49m 
dbg[i]  :: [34;49m...[34;49m : 431.031 : X64 :> [33;40mR8D[34;49m <: 0x00007ffff5c7a3a0 :> [34;49m    _Compile_CallThruReg ( [34;49m[33;40mR8D[34;49m[34;49m )                //4983ee08                sub r14, 0x8 [34;49m 
Stack : word at namespaces/compiler/x64.cft : 431.31 :> [39;49mR8D[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000008[34;49m.
dbg[i]  :: [34;49m...[34;49m : 431.032 : void :> [33;40m_Compile_CallThruReg[34;49m <: 0x00007ffff5c91488 :> [34;49m    [34;49m[33;40m_Compile_CallThruReg[34;49m[34;49m ( R8D )                //4983ee08             [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 431.32[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7a3a0	< word : X64.[34;49mR8D[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
type match :: void._Compile_CallThruReg :: type expected :  :: type recorded : Integer  : namespaces/compiler/x64.cft : 431.32
_Compile_Write_Instruction_X64 : 7ffff72fe7ac : 3 bytes : ...
[34;49m : _Compile_Stack_PopToReg ( _reg )  _Comp[39;49m[33;40m_Compile_CallThruReg[39;49m[34;49mToReg ( _reg @, 0 ) _Compile_SUBI_DSP ( CELL ) ;;  .. [39;49m[32;49m
0x7ffff72fe7ac    49ffd0                  call r8                    	< C compiler code >        [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_CallThruReg[34;49m <:    3 bytes : at namespaces/compiler/x64.cft : 431.32[32;49m
0x7ffff72fe7ac    49ffd0                  call r8                    	< C compiler code >        [34;49m
Stack : word at namespaces/compiler/x64.cft : 431.32 :> [39;49m_Compile_CallThruReg[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff5bc5be8[34;49m.
dbg[i]  :: [34;49m...[34;49m : 431.050 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    _Compile_CallThruReg ( R8D )                [34;49m[33;40m//[34;49m[34;49m4983ee08                sub r14, 0x8 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 434.005 : Asm :> [33;40masm;[34;49m <: 0x00007ffff74b5430 :> [34;49m[34;49m[33;40masm;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40masm;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 434.5
[34;49m ..  ( R8D ) _Compile_CallThruReg ( R8D ) [34;49m[33;40masm;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe7af    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 434.5 :> [39;49masm;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 436.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49m iax find wdiss //pause // sp [34;49m 
Stack : word at namespaces/compiler/x64.cft : 436.6 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5cc89b0[34;49m.
dbg[i]  :: [34;49m...[34;49m : 436.011 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m' iax [34;49m[33;40mfind[34;49m[34;49m wdiss //pause // sp [34;49m 
Stack : word at namespaces/compiler/x64.cft : 436.11 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff5bc5be8[34;49m.
dbg[i]  :: [34;49m...[34;49m : 436.017 : System :> [33;40mwdiss[34;49m <: 0x00007ffff71f6c68 :> [34;49m' iax find [34;49m[33;40mwdiss[34;49m[34;49m //pause // sp [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 436.17[39;49m :
TypeWordStack depth =   0 :  = Top = 0x00007ffff7fc1a20, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
type match :: System.wdiss :: type expected :  :: type recorded :  : namespaces/compiler/x64.cft : 436.17
Combinators.[34;49miax[39;49m <:> cfrTil compiled word
SourceCode for Combinators.[34;49miax[39;49m :> 
[34;49m:asm iax _Compile_Stack_PopToReg ( R8D ) _Compile_CallThruReg ( R8D ) asm; [39;49m
Source code file location of [34;49miax[39;49m : "namespaces/compiler/x64.cft" : 429.8 :: we are now at : namespaces/compiler/x64.cft : 436.17
Compiled with : optimizeOn, inlineOn, infixOn
Debug Source Code on : BigNum off : Lisp off : Word Source Code on
starting at address : 0xf72fe7a5 -- code size = 11 bytes
Word :: Combinators.[34;49miax[39;49m : definition = 0x00007ffff72fe7a5 : disassembly at namespaces/compiler/x64.cft : 436.17 :
[34;49m ..                              :asm iax [39;49m[33;40m_Compile_Stack_PopToReg[39;49m[34;49m ( R8D ) _Compile_CallThruReg ( R8D ) asm;  .. [39;49m[32;49m
0x7ffff72fe7a5    4d8b06                  mov r8, [r14]                                          [39;49m[32;49m
0x7ffff72fe7a8    4983ee08                sub r14, 0x8                                           [39;49m
[34;49m :asm iax _Compile_Stack_PopToReg ( R8D ) [39;49m[33;40m_Compile_CallThruReg[39;49m[34;49m ( R8D ) asm;  .. [39;49m[32;49m
0x7ffff72fe7ac    49ffd0                  call r8                    	< C compiler code >        [39;49m
[34;49m ..  ( R8D ) _Compile_CallThruReg ( R8D ) [39;49m[33;40masm;[39;49m[34;49m [39;49m[32;49m
0x7ffff72fe7af    c3                      ret                                                    [39;49m
Word_Disassemble : word - 'iax' :: codeSize = 100x00007ffff72692380x00007ffff72fe7a543617
Stack : word at namespaces/compiler/x64.cft : 436.17 :> [39;49mwdiss[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 436.019 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m' iax find wdiss [34;49m[33;40m//[34;49m[34;49mpause // sp [34;49m 
dbg[i]  :: [34;49m...[34;49m : 438.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m _Compile_Test_Imm (  _mod, rm, disp, imm ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 438.44[32;49m
0x7ffff72fe7b0    e900000000              jmp 0x7ffff72fe7b5         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe7b5    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe7b9    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe7bd    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 438.44 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc5db0[34;49m.
dbg[c]  :: [34;49m...[34;49m : 439.018 : void :> [33;40m_Compile_Test[34;49m <: 0x00007ffff5c8fd60 :> [34;49m    [34;49m[33;40m_Compile_Test[34;49m[34;49m ( _mod @, rm @, IMM_B, disp @, imm @ ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 439.025 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5bc6178 :> [34;49m    _Compile_Test ( [34;49m[33;40m_mod[34;49m[34;49m @, rm @, IMM_B, disp @, imm @ ) [34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 439.25
[34;49m .. _mod, rm, disp, imm ) _Compile_Test ( [34;49m[33;40m_mod[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe7c4    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fe7c8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7cc    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.026 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Test ( _mod [34;49m[33;40m@[34;49m[34;49m, rm @, IMM_B, disp @, imm @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 439.26
[34;49m ..  rm, disp, imm ) _Compile_Test ( _mod [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe7c4    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fe7c8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7cc    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.031 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5bc6340 :> [34;49m    _Compile_Test ( _mod @, [34;49m[33;40mrm[34;49m[34;49m @, IMM_B, disp @, imm @ ) [34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 439.31
[34;49m .. , disp, imm ) _Compile_Test ( _mod @, [34;49m[33;40mrm[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe7cf    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe7d3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7d7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.032 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Test ( _mod @, rm [34;49m[33;40m@[34;49m[34;49m, IMM_B, disp @, imm @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 439.32
[34;49m .. isp, imm ) _Compile_Test ( _mod @, rm [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe7cf    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe7d3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7d7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.039 : X64 :> [33;40mIMM_B[34;49m <: 0x00007ffff5c7e588 :> [34;49m    _Compile_Test ( _mod @, rm @, [34;49m[33;40mIMM_B[34;49m[34;49m, disp @, imm @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mIMM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 439.39[32;49m
0x7ffff72fe7da    48b81000000000000000    mov rax, 0x10                                          [34;49m[32;49m
0x7ffff72fe7e4    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7e8    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.046 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5bc6508 :> [34;49m    _Compile_Test ( _mod @, rm @, IMM_B, [34;49m[33;40mdisp[34;49m[34;49m @, imm @ ) [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 439.46
[34;49m ..  _Compile_Test ( _mod @, rm @, IMM_B, [34;49m[33;40mdisp[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe7eb    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe7ef    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7f3    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.047 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Test ( _mod @, rm @, IMM_B, disp [34;49m[33;40m@[34;49m[34;49m, imm @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 439.47
[34;49m .. pile_Test ( _mod @, rm @, IMM_B, disp [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe7eb    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe7ef    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7f3    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.053 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5bc66d0 :> [34;49m    _Compile_Test ( _mod @, rm @, IMM_B, disp @, [34;49m[33;40mimm[34;49m[34;49m @ ) [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 439.53
[34;49m .. e_Test ( _mod @, rm @, IMM_B, disp @, [34;49m[33;40mimm[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe7f6    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe7fa    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7fe    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.055 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Test ( _mod @, rm @, IMM_B, disp @, imm [34;49m[33;40m@[34;49m[34;49m ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 439.55
[34;49m .. st ( _mod @, rm @, IMM_B, disp @, imm [34;49m[33;40m@[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe7f6    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe7fa    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7fe    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.056 : void :> [33;40m_Compile_Test[34;49m <: 0x00007ffff5c8fd60 :> [34;49m    [34;49m[33;40m_Compile_Test[34;49m[34;49m ( _mod @, rm @, IMM_B, disp @, imm @ ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 439.56[39;49m :
TypeWordStack depth =   4 :  = Top = 0x00007ffff7fc1a40, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5bc66d0	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5bc6508	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5bc6340	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5bc6178	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: void._Compile_Test :: type expected :  :: type recorded : Undefined . Undefined . Undefined . Undefined  : namespaces/compiler/x64.cft : 439.56
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Test[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 439.56
[34;49m .. pile_Test_Imm ( _mod, rm, disp, imm ) [34;49m[33;40m_Compile_Test[34;49m[34;49m ( _mod @, rm @, IMM_B, disp @, imm @ )[34;49m[32;49m
0x7ffff72fe801    49b938e32ff7ff7f0000    mov r9, 0x7ffff72fe338                                 [34;49m[32;49m
0x7ffff72fe80b    49ffd1                  call r9                    	< void.[39;49m_Compile_Test[34;49m : 0x00007ffff72fe338 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 440.003 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b5d18 :> [34;49m[34;49m[33;40m;;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 440.3
[34;49m ..  _mod @, rm @, IMM_B, disp @, imm @ ) [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe80e    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe812    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe816    4983ee20                sub r14, 0x20                                          [34;49m[32;49m
0x7ffff72fe81a    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 440.3 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 442.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m _Compile_IncDec_Reg ( op, _reg ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 442.34[32;49m
0x7ffff72fe81b    e900000000              jmp 0x7ffff72fe820         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe820    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe824    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe828    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 442.34 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc6df0[34;49m.
dbg[c]  :: [34;49m...[34;49m : 443.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49m_Compile_Group5 ( op @, REG, _reg @, 0, 0, 0  ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 444.038 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c84628 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xff, REG, op @[34;49m 
dbg[c]  :: [34;49m...[34;49m : 444.041 : <literal> :> [33;40m0[34;49m <: 0x00007ffff73848a7 :> [34;49m    Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m, 0xff, REG, op @, _reg @, REX_B | MODRM_B, [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 444.41
[34;49m .. ) Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe82f    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe839    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe83d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.047 : <literal> :> [33;40m0xff[34;49m <: 0x00007ffff7384aa2 :> [34;49mCompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40m0xff[34;49m[34;49m, REG, op @, _reg @, REX_B | MODRM_B, 0[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0xff[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 444.47
[34;49m .. ompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40m0xff[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe840    48b8ff00000000000000    mov rax, 0xff                                          [34;49m[32;49m
0x7ffff72fe84a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe84e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.052 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b6f20 :> [34;49mmpile_CalcWrite_Instruction_X64 ( 0, 0xff, [34;49m[33;40mREG[34;49m[34;49m, op @, _reg @, REX_B | MODRM_B, 0, 0, 0, 0[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 444.52
[34;49m .. _CalcWrite_Instruction_X64 ( 0, 0xff, [34;49m[33;40mREG[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe851    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fe85b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe85f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.057 : locals_0 :> [33;40mop[34;49m <: 0x00007ffff5bc6a60 :> [34;49malcWrite_Instruction_X64 ( 0, 0xff, REG, [34;49m[33;40mop[34;49m[34;49m @, _reg @, REX_B | MODRM_B, 0, 0, 0, 0, 0[34;49m 
_Do_C_Syntax_Variable : word = op :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mop[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 444.57
[34;49m .. Write_Instruction_X64 ( 0, 0xff, REG, [34;49m[33;40mop[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe862    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe866    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe86a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.058 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49mpile_CalcWrite_Instruction_X64 ( 0, 0xff, REG, op [34;49m[33;40m@[34;49m[34;49m, _reg @, REX_B | MODRM_B, 0, 0, 0, 0, 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 444.58
[34;49m .. te_Instruction_X64 ( 0, 0xff, REG, op [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe862    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe866    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe86a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.065 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5bc6898 :> [34;49mite_Instruction_X64 ( 0, 0xff, REG, op @, [34;49m[33;40m_reg[34;49m[34;49m @, REX_B | MODRM_B, 0, 0, 0, 0, 0 ) [34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 444.65
[34;49m .. Instruction_X64 ( 0, 0xff, REG, op @, [34;49m[33;40m_reg[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe86d    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe871    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe875    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.066 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49mpile_CalcWrite_Instruction_X64 ( 0, 0xff, REG, op @, _reg [34;49m[33;40m@[34;49m[34;49m, REX_B | MODRM_B, 0, 0, 0, 0, 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 444.66
[34;49m .. uction_X64 ( 0, 0xff, REG, op @, _reg [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe86d    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe871    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe875    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.074 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7d748 :> [34;49mlcWrite_Instruction_X64 ( 0, 0xff, REG, op @, _reg @, [34;49m[33;40mREX_B[34;49m[34;49m | MODRM_B, 0, 0, 0, 0, 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 444.74[32;49m
0x7ffff72fe878    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe882    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe886    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.076 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m Compile_CalcWrite_Instruction_X64 ( 0, 0xff, REG, op @, _reg @, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B, 0, 0, 0, 0, 0 ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 444.083 : X64 :> [33;40mMODRM_B[34;49m <: 0x00007ffff5c7dad8 :> [34;49mWrite_Instruction_X64 ( 0, 0xff, REG, op @, _reg @, REX_B | [34;49m[33;40mMODRM_B[34;49m[34;49m, 0, 0, 0, 0, 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMODRM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 444.83[32;49m
0x7ffff72fe889    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe893    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe897    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.083 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m Compile_CalcWrite_Instruction_X64 ( 0, 0xff, REG, op @, _reg @, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B, 0, 0, 0, 0, 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 444.83
[34;49m .. 4 ( 0, 0xff, REG, op @, _reg @, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B[34;49m[32;49m
0x7ffff72fe889    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe893    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe897    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe89a    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe89d    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe8a1    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe8a5    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe8a8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe8ac    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.086 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7384c9d :> [34;49mWrite_Instruction_X64 ( 0, 0xff, REG, op @, _reg @, REX_B | MODRM_B, [34;49m[33;40m0[34;49m[34;49m, 0, 0, 0, 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 444.86
[34;49m .. , REG, op @, _reg @, REX_B | MODRM_B, [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe8af    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe8b9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe8bd    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.100 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c84628 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xff, REG, op @[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 444.100[39;49m :
TypeWordStack depth =  10 :  = Top = 0x00007ffff7fc1a70, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a70 > = 0x00007ffff7385489	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a68 > = 0x00007ffff738528e	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a60 > = 0x00007ffff7385093	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a58 > = 0x00007ffff7384e98	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a50 > = 0x00007ffff7384c9d	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5bc6898	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -6 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5bc6a60	< word : locals_0.[34;49mop[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -7 ] < 0x00007ffff7fc1a38 > = 0x00007ffff74b6f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -8 ] < 0x00007ffff7fc1a30 > = 0x00007ffff7384aa2	< word : <literal>.[34;49m0xff[39;49m : value = 0x00000000000000ff > : [34;49mInteger [39;49m
  TypeWordStack   [  -9 ] < 0x00007ffff7fc1a28 > = 0x00007ffff73848a7	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: void.Compile_CalcWrite_Instruction_X64 :: type expected :  :: type recorded : Integer . Integer . Integer . Undefined . Undefined . Integer . Integer . Integer . Integer . Integer  : namespaces/compiler/x64.cft : 444.100
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 444.100
[34;49m ..    : _Compile_IncDec_Reg ( op, _reg ) [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xff, REG, op @, _reg @, REX_B | MODRM_B, 0, 0, 0, 0, 0 ) .. [34;49m[32;49m
0x7ffff72fe904    49b983db2ff7ff7f0000    mov r9, 0x7ffff72fdb83                                 [34;49m[32;49m
0x7ffff72fe90e    49ffd1                  call r9                    	< void.[39;49mCompile_CalcWrite_Instruction_X64[34;49m : 0x00007ffff72fdb83 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 445.003 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b5d18 :> [34;49m[34;49m[33;40m;;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 445.3
[34;49m ..  @, REX_B | MODRM_B, 0, 0, 0, 0, 0 )  [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe911    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe915    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe919    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe91d    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 445.3 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 447.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m _Compile_MoveTOS_To_R8D () _Compile_Move_DataStackN_ToReg ( R8D, 0 ) ;; // _Compile_Move ( REG,[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 447.28[32;49m
0x7ffff72fe91e    e900000000              jmp 0x7ffff72fe923         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe923    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe927    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe92b    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 447.28 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc71b8[34;49m.
dbg[c]  :: [34;49m...[34;49m : 447.060 : void :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <: 0x00007ffff5c85468 :> [34;49meTOS_To_R8D () [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( R8D, 0 ) ;; /[34;49m 
dbg[c]  :: [34;49m...[34;49m : 447.065 : X64 :> [33;40mR8D[34;49m <: 0x00007ffff5c7a3a0 :> [34;49mTo_R8D () _Compile_Move_DataStackN_ToReg ( [34;49m[33;40mR8D[34;49m[34;49m, 0 ) ;; // _Compile_Move ( REG, 0, EAX, DS[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mR8D[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 447.65
[34;49m .. D () _Compile_Move_DataStackN_ToReg ( [34;49m[33;40mR8D[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe932    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe93c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe940    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 447.069 : <literal> :> [33;40m0[34;49m <: 0x00007ffff73856b7 :> [34;49m () _Compile_Move_DataStackN_ToReg ( R8D, [34;49m[33;40m0[34;49m[34;49m ) ;; // _Compile_Move ( REG, 0, EAX, DSP,[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 447.69
[34;49m .. _Compile_Move_DataStackN_ToReg ( R8D, [34;49m[33;40m0[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe943    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe94d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe951    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 447.070 : void :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <: 0x00007ffff5c85468 :> [34;49meTOS_To_R8D () [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( R8D, 0 ) ;; /[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 447.70[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff73856b7	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7a3a0	< word : X64.[34;49mR8D[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
type match :: void._Compile_Move_DataStackN_ToReg :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 447.70
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 447.70
[34;49m ..          : _Compile_MoveTOS_To_R8D () [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( R8D, 0 ) .. [34;49m[32;49m
0x7ffff72fe954    49b908de2ff7ff7f0000    mov r9, 0x7ffff72fde08                                 [34;49m[32;49m
0x7ffff72fe95e    49ffd1                  call r9                    	< void.[39;49m_Compile_Move_DataStackN_ToReg[34;49m : 0x00007ffff72fde08 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 447.074 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b5d18 :> [34;49m () _Compile_Move_DataStackN_ToReg ( R8D, 0 ) [34;49m[33;40m;;[34;49m[34;49m // _Compile_Move ( REG, 0, EAX, DSP, 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 447.74
[34;49m .. pile_Move_DataStackN_ToReg ( R8D, 0 ) [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe961    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 447.74 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 447.076 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m () _Compile_Move_DataStackN_ToReg ( R8D, 0 ) ;; [34;49m[33;40m//[34;49m[34;49m _Compile_Move ( REG, 0, EAX, DSP, 0 ) [34;49m 
dbg[i]  :: [34;49m...[34;49m : 450.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m _Compile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( ADD, REG, DSP, 0, imm @, 1 ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 450.27[32;49m
0x7ffff72fe962    e900000000              jmp 0x7ffff72fe967         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe967    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe96b    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe96f    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 450.27 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc73b8[34;49m.
dbg[c]  :: [34;49m...[34;49m : 450.054 : void :> [33;40m_Compile_Group1_Immediate[34;49m <: 0x00007ffff5c88f68 :> [34;49mle_ADDI_DSP ( imm ) [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( ADD, REG, DSP, 0, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 450.059 : X64 :> [33;40mADD[34;49m <: 0x00007ffff5c7c740 :> [34;49m: _Compile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( [34;49m[33;40mADD[34;49m[34;49m, REG, DSP, 0, imm @, 1 ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mADD[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 450.59
[34;49m .. P ( imm ) _Compile_Group1_Immediate ( [34;49m[33;40mADD[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe976    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe980    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe984    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 450.064 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b6f20 :> [34;49m: _Compile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( ADD, [34;49m[33;40mREG[34;49m[34;49m, DSP, 0, imm @, 1 ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 450.64
[34;49m .. mm ) _Compile_Group1_Immediate ( ADD, [34;49m[33;40mREG[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe987    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fe991    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe995    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 450.069 : X64 :> [33;40mDSP[34;49m <: 0x00007ffff5c7b1e0 :> [34;49m: _Compile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( ADD, REG, [34;49m[33;40mDSP[34;49m[34;49m, 0, imm @, 1 ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDSP[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 450.69
[34;49m .. _Compile_Group1_Immediate ( ADD, REG, [34;49m[33;40mDSP[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe998    48b80e00000000000000    mov rax, 0xe                                           [34;49m[32;49m
0x7ffff72fe9a2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe9a6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 450.072 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7385918 :> [34;49mCompile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( ADD, REG, DSP, [34;49m[33;40m0[34;49m[34;49m, imm @, 1 ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 450.72
[34;49m .. ile_Group1_Immediate ( ADD, REG, DSP, [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe9a9    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe9b3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe9b7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 450.078 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5bc7780 :> [34;49mompile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( ADD, REG, DSP, 0, [34;49m[33;40mimm[34;49m[34;49m @, 1 ) ;; [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 450.78
[34;49m .. _Group1_Immediate ( ADD, REG, DSP, 0, [34;49m[33;40mimm[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe9ba    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe9be    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe9c2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 450.079 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m: _Compile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( ADD, REG, DSP, 0, imm [34;49m[33;40m@[34;49m[34;49m, 1 ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 450.79
[34;49m .. up1_Immediate ( ADD, REG, DSP, 0, imm [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe9ba    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe9be    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe9c2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 450.083 : <literal> :> [33;40m1[34;49m <: 0x00007ffff7385b13 :> [34;49mCompile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( ADD, REG, DSP, 0, imm @, [34;49m[33;40m1[34;49m[34;49m ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 450.83
[34;49m .. _Immediate ( ADD, REG, DSP, 0, imm @, [34;49m[33;40m1[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe9c5    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe9cf    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe9d3    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 450.084 : void :> [33;40m_Compile_Group1_Immediate[34;49m <: 0x00007ffff5c88f68 :> [34;49mle_ADDI_DSP ( imm ) [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( ADD, REG, DSP, 0, [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 450.84[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff7385b13	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5bc7780	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff7385918	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c7b1e0	< word : X64.[34;49mDSP[39;49m : value = 0x000000000000000e > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b6f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7c740	< word : X64.[34;49mADD[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: void._Compile_Group1_Immediate :: type expected : Integer . Integer  :: type recorded : Integer . Integer . Integer . Integer . Undefined . Integer  : namespaces/compiler/x64.cft : 450.84
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Group1_Immediate[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 450.84
[34;49m ..           : _Compile_ADDI_DSP ( imm ) [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( ADD, REG, DSP, 0, imm @, 1 ) .. [34;49m[32;49m
0x7ffff72fe9d6    49b9eade2ff7ff7f0000    mov r9, 0x7ffff72fdeea                                 [34;49m[32;49m
0x7ffff72fe9e0    49ffd1                  call r9                    	< void.[39;49m_Compile_Group1_Immediate[34;49m : 0x00007ffff72fdeea >[34;49m
dbg[c]  :: [34;49m...[34;49m : 450.088 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b5d18 :> [34;49m: _Compile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( ADD, REG, DSP, 0, imm @, 1 ) [34;49m[33;40m;;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 450.88
[34;49m .. ediate ( ADD, REG, DSP, 0, imm @, 1 ) [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe9e3    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe9e7    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe9eb    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe9ef    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 450.88 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 452.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m _Compile_CMP_REG_IMM ( _reg, imm, isize ) _Compile_Group1_Immediate ( CMP, REG, _reg @, 0, imm [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 452.43[32;49m
0x7ffff72fe9f0    e900000000              jmp 0x7ffff72fe9f5         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe9f5    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe9f9    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe9fd    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 452.43 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc7948[34;49m.
dbg[c]  :: [34;49m...[34;49m : 452.070 : void :> [33;40m_Compile_Group1_Immediate[34;49m <: 0x00007ffff5c88f68 :> [34;49m _reg, imm, isize ) [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( CMP, REG, _reg @, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 452.075 : X64 :> [33;40mCMP[34;49m <: 0x00007ffff5c7cad0 :> [34;49m _reg, imm, isize ) _Compile_Group1_Immediate ( [34;49m[33;40mCMP[34;49m[34;49m, REG, _reg @, 0, imm @, isize @ ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCMP[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 452.75
[34;49m .. , isize ) _Compile_Group1_Immediate ( [34;49m[33;40mCMP[34;49m[34;49m[34;49m[32;49m
0x7ffff72fea04    48b80700000000000000    mov rax, 0x7                                           [34;49m[32;49m
0x7ffff72fea0e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea12    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.080 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b6f20 :> [34;49m _reg, imm, isize ) _Compile_Group1_Immediate ( CMP, [34;49m[33;40mREG[34;49m[34;49m, _reg @, 0, imm @, isize @ ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 452.80
[34;49m .. ze ) _Compile_Group1_Immediate ( CMP, [34;49m[33;40mREG[34;49m[34;49m[34;49m[32;49m
0x7ffff72fea15    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fea1f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea23    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.087 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5bc7d10 :> [34;49m imm, isize ) _Compile_Group1_Immediate ( CMP, REG, [34;49m[33;40m_reg[34;49m[34;49m @, 0, imm @, isize @ ) ;; [34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 452.87
[34;49m .. _Compile_Group1_Immediate ( CMP, REG, [34;49m[33;40m_reg[34;49m[34;49m [34;49m[32;49m
0x7ffff72fea26    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fea2a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea2e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.088 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49mIMM ( _reg, imm, isize ) _Compile_Group1_Immediate ( CMP, REG, _reg [34;49m[33;40m@[34;49m[34;49m, 0, imm @, isize @ ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 452.88
[34;49m .. ile_Group1_Immediate ( CMP, REG, _reg [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fea26    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fea2a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea2e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.091 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7385dda :> [34;49mg, imm, isize ) _Compile_Group1_Immediate ( CMP, REG, _reg @, [34;49m[33;40m0[34;49m[34;49m, imm @, isize @ ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 452.91
[34;49m .. _Group1_Immediate ( CMP, REG, _reg @, [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fea31    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fea3b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea3f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.097 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5bc7ed8 :> [34;49m, imm, isize ) _Compile_Group1_Immediate ( CMP, REG, _reg @, 0, [34;49m[33;40mimm[34;49m[34;49m @, isize @ ) ;; [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 452.97
[34;49m .. oup1_Immediate ( CMP, REG, _reg @, 0, [34;49m[33;40mimm[34;49m[34;49m [34;49m[32;49m
0x7ffff72fea42    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fea46    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea4a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.098 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49mIMM ( _reg, imm, isize ) _Compile_Group1_Immediate ( CMP, REG, _reg @, 0, imm [34;49m[33;40m@[34;49m[34;49m, isize @ ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 452.98
[34;49m .. _Immediate ( CMP, REG, _reg @, 0, imm [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fea42    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fea46    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea4a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.106 : locals_0 :> [33;40misize[34;49m <: 0x00007ffff5bc80a0 :> [34;49mimm, isize ) _Compile_Group1_Immediate ( CMP, REG, _reg @, 0, imm @, [34;49m[33;40misize[34;49m[34;49m @ ) ;; [34;49m 
_Do_C_Syntax_Variable : word = isize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40misize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 452.106
[34;49m .. mediate ( CMP, REG, _reg @, 0, imm @, [34;49m[33;40misize[34;49m[34;49m [34;49m[32;49m
0x7ffff72fea4d    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fea51    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea55    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.108 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49mIMM ( _reg, imm, isize ) _Compile_Group1_Immediate ( CMP, REG, _reg @, 0, imm @, isize [34;49m[33;40m@[34;49m[34;49m ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 452.108
[34;49m .. e ( CMP, REG, _reg @, 0, imm @, isize [34;49m[33;40m@[34;49m[34;49m [34;49m[32;49m
0x7ffff72fea4d    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fea51    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea55    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.109 : void :> [33;40m_Compile_Group1_Immediate[34;49m <: 0x00007ffff5c88f68 :> [34;49m _reg, imm, isize ) [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( CMP, REG, _reg @, [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 452.109[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5bc80a0	< word : locals_0.[34;49misize[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5bc7ed8	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff7385dda	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5bc7d10	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b6f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7cad0	< word : X64.[34;49mCMP[39;49m : value = 0x0000000000000007 > : [34;49mInteger [39;49m
type match :: void._Compile_Group1_Immediate :: type expected : Integer . Integer  :: type recorded : Integer . Integer . Undefined . Integer . Undefined . Undefined  : namespaces/compiler/x64.cft : 452.109
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Group1_Immediate[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 452.109
[34;49m .. pile_CMP_REG_IMM ( _reg, imm, isize ) [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( CMP, REG, _reg @, 0, imm @, isize @ )[34;49m[32;49m
0x7ffff72fea58    49b9eade2ff7ff7f0000    mov r9, 0x7ffff72fdeea                                 [34;49m[32;49m
0x7ffff72fea62    49ffd1                  call r9                    	< void.[39;49m_Compile_Group1_Immediate[34;49m : 0x00007ffff72fdeea >[34;49m
dbg[c]  :: [34;49m...[34;49m : 452.113 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b5d18 :> [34;49m( _reg, imm, isize ) _Compile_Group1_Immediate ( CMP, REG, _reg @, 0, imm @, isize @ ) [34;49m[33;40m;;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 452.113
[34;49m .. CMP, REG, _reg @, 0, imm @, isize @ ) [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fea65    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fea69    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fea6d    4983ee18                sub r14, 0x18                                          [34;49m[32;49m
0x7ffff72fea71    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 452.113 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 454.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m Compile_Stack_Push_R8D () [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 454.27[32;49m
0x7ffff72fea72    e900000000              jmp 0x7ffff72fea77         	< C compiler code >        [34;49m[32;49m
0x7ffff72fea77    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fea7b    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fea7f    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 454.27 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc85f8[34;49m.
dbg[c]  :: [34;49m...[34;49m : 455.022 : Combinators :> [33;40m_Compile_ADDI_DSP[34;49m <: 0x00007ffff5bc73b8 :> [34;49m    [34;49m[33;40m_Compile_ADDI_DSP[34;49m[34;49m ( CELL ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 455.029 : X64 :> [33;40mCELL[34;49m <: 0x00007ffff5c7d028 :> [34;49m    _Compile_ADDI_DSP ( [34;49m[33;40mCELL[34;49m[34;49m ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCELL[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 455.29
[34;49m .. Stack_Push_R8D () _Compile_ADDI_DSP ( [34;49m[33;40mCELL[34;49m[34;49m [34;49m[32;49m
0x7ffff72fea86    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fea90    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea94    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 455.030 : Combinators :> [33;40m_Compile_ADDI_DSP[34;49m <: 0x00007ffff5bc73b8 :> [34;49m    [34;49m[33;40m_Compile_ADDI_DSP[34;49m[34;49m ( CELL ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 455.30[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7d028	< word : X64.[34;49mCELL[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
type match :: Combinators._Compile_ADDI_DSP :: type expected : Any  :: type recorded : Integer  : namespaces/compiler/x64.cft : 455.30
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_ADDI_DSP[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 455.30
[34;49m ..           : Compile_Stack_Push_R8D () [34;49m[33;40m_Compile_ADDI_DSP[34;49m[34;49m ( CELL ) .. [34;49m[32;49m
0x7ffff72fea97    49b967e92ff7ff7f0000    mov r9, 0x7ffff72fe967                                 [34;49m[32;49m
0x7ffff72feaa1    49ffd1                  call r9                    	< Combinators.[39;49m_Compile_ADDI_DSP[34;49m : 0x00007ffff72fe967 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 456.032 : void :> [33;40m_Compile_Move_Reg_To_StackN[34;49m <: 0x00007ffff5c943f0 :> [34;49m    [34;49m[33;40m_Compile_Move_Reg_To_StackN[34;49m[34;49m ( DSP, 0, R8D ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 456.037 : X64 :> [33;40mDSP[34;49m <: 0x00007ffff5c7b1e0 :> [34;49m    _Compile_Move_Reg_To_StackN ( [34;49m[33;40mDSP[34;49m[34;49m, 0, R8D ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDSP[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 456.37
[34;49m .. CELL )  _Compile_Move_Reg_To_StackN ( [34;49m[33;40mDSP[34;49m[34;49m[34;49m[32;49m
0x7ffff72feaa4    48b80e00000000000000    mov rax, 0xe                                           [34;49m[32;49m
0x7ffff72feaae    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72feab2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 456.040 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5bc8268 :> [34;49m    _Compile_Move_Reg_To_StackN ( DSP, [34;49m[33;40m0[34;49m[34;49m, R8D ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 456.40
[34;49m .. )  _Compile_Move_Reg_To_StackN ( DSP, [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72feab5    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72feabf    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72feac3    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 456.046 : X64 :> [33;40mR8D[34;49m <: 0x00007ffff5c7a3a0 :> [34;49m    _Compile_Move_Reg_To_StackN ( DSP, 0, [34;49m[33;40mR8D[34;49m[34;49m ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mR8D[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 456.46
[34;49m .. _Compile_Move_Reg_To_StackN ( DSP, 0, [34;49m[33;40mR8D[34;49m[34;49m [34;49m[32;49m
0x7ffff72feac6    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fead0    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fead4    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 456.047 : void :> [33;40m_Compile_Move_Reg_To_StackN[34;49m <: 0x00007ffff5c943f0 :> [34;49m    [34;49m[33;40m_Compile_Move_Reg_To_StackN[34;49m[34;49m ( DSP, 0, R8D ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 456.47[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c7a3a0	< word : X64.[34;49mR8D[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5bc8268	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7b1e0	< word : X64.[34;49mDSP[39;49m : value = 0x000000000000000e > : [34;49mInteger [39;49m
type match :: void._Compile_Move_Reg_To_StackN :: type expected :  :: type recorded : Integer  : namespaces/compiler/x64.cft : 456.47
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move_Reg_To_StackN[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 456.47
[34;49m .. sh_R8D () _Compile_ADDI_DSP ( CELL )  [34;49m[33;40m_Compile_Move_Reg_To_StackN[34;49m[34;49m ( DSP, 0, R8D )[34;49m[32;49m
0x7ffff72fead7    49b9fee42ff7ff7f0000    mov r9, 0x7ffff72fe4fe                                 [34;49m[32;49m
0x7ffff72feae1    49ffd1                  call r9                    	< void.[39;49m_Compile_Move_Reg_To_StackN[34;49m : 0x00007ffff72fe4fe >[34;49m
dbg[c]  :: [34;49m...[34;49m : 457.003 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b5d18 :> [34;49m[34;49m[33;40m;;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 457.3
[34;49m .. e_Move_Reg_To_StackN ( DSP, 0, R8D )  [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72feae4    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 457.3 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 459.005 : Root :> [33;40mUser[34;49m <: 0x00007ffff728e410 :> [34;49m[34;49m[33;40mUser[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 460.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m sp ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 460.7[32;49m
0x7ffff72feae5    e900000000              jmp 0x7ffff72feaea         	< C compiler code >        [34;49m
[34;49m ..                                     : [34;49m[33;40msp[34;49m[34;49m ;  .. [34;49m[32;49m
0x7ffff72feaea    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72feaee    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72feaf2    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 460.7 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc87f8[34;49m.
dbg[c]  :: [34;49m...[34;49m : 460.007 : Interpreter :> [33;40m;[34;49m <: 0x00007ffff7294bd0 :> [34;49m: sp [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 460.7
[34;49m ..                                  : sp [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72feaf9    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 460.7 :> [39;49m;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 461.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m qeval [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 462.8[32;49m
0x7ffff72feafa    e900000000              jmp 0x7ffff72feaff         	< C compiler code >        [34;49m
[34;49m ..                                     : [34;49m[33;40mqeval[34;49m[34;49m stk  .. [34;49m[32;49m
0x7ffff72feaff    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72feb03    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72feb07    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 462.8 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc89c0[34;49m.
dbg[c]  :: [34;49m...[34;49m : 462.008 : System :> [33;40mstk[34;49m <: 0x00007ffff71f5540 :> [34;49m    [34;49m[33;40mstk[34;49m[34;49m iax [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mstk[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 462.8
[34;49m ..                               : qeval [34;49m[33;40mstk[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72feb0e    49b99a442ff7ff7f0000    mov r9, 0x7ffff72f449a                                 [34;49m[32;49m
0x7ffff72feb18    49ffd1                  call r9                    	< System.[39;49mstk[34;49m : 0x00007ffff72f449a >[34;49m
dbg[c]  :: [34;49m...[34;49m : 462.012 : Combinators :> [33;40miax[34;49m <: 0x00007ffff5bc5be8 :> [34;49m    stk [34;49m[33;40miax[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40miax[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 462.12
[34;49m ..                           : qeval stk [34;49m[33;40miax[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72feb1b    49b9a5e72ff7ff7f0000    mov r9, 0x7ffff72fe7a5                                 [34;49m[32;49m
0x7ffff72feb25    49ffd1                  call r9                    	< Combinators.[39;49miax[34;49m : 0x00007ffff72fe7a5 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 463.002 : Interpreter :> [33;40m;[34;49m <: 0x00007ffff7294bd0 :> [34;49m[34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 463.2
[34;49m ..                       : qeval stk iax [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72feb28    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 463.2 :> [39;49m;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 464.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49m qeval find wdiss // sp [34;49m 
Stack : word at namespaces/compiler/x64.cft : 464.8 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5cc92c2[34;49m.
dbg[i]  :: [34;49m...[34;49m : 464.013 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m' qeval [34;49m[33;40mfind[34;49m[34;49m wdiss // sp [34;49m 
Stack : word at namespaces/compiler/x64.cft : 464.13 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff5bc89c0[34;49m.
dbg[i]  :: [34;49m...[34;49m : 464.019 : System :> [33;40mwdiss[34;49m <: 0x00007ffff71f6c68 :> [34;49m' qeval find [34;49m[33;40mwdiss[34;49m[34;49m // sp [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 464.19[39;49m :
TypeWordStack depth =   0 :  = Top = 0x00007ffff7fc1a20, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
type match :: System.wdiss :: type expected :  :: type recorded :  : namespaces/compiler/x64.cft : 464.19
User.[34;49mqeval[39;49m <:> cfrTil compiled word
SourceCode for User.[34;49mqeval[39;49m :> 
[34;49m: qeval stk iax ; [39;49m
Source code file location of [34;49mqeval[39;49m : "namespaces/compiler/x64.cft" : 461.7 :: we are now at : namespaces/compiler/x64.cft : 464.19
Compiled with : optimizeOn, inlineOn, infixOn
Debug Source Code on : BigNum off : Lisp off : Word Source Code on
starting at address : 0xf72feb0e -- code size = 27 bytes
Word :: User.[34;49mqeval[39;49m : definition = 0x00007ffff72feb0e : disassembly at namespaces/compiler/x64.cft : 464.19 :
[34;49m ..                               : qeval [39;49m[33;40mstk[39;49m[34;49m iax ;  .. [39;49m[32;49m
0x7ffff72feb0e    49b99a442ff7ff7f0000    mov r9, 0x7ffff72f449a                                 [39;49m[32;49m
0x7ffff72feb18    49ffd1                  call r9                    	< System.[34;49mstk[39;49m : 0x00007ffff72f449a >[39;49m
[34;49m ..                           : qeval stk [39;49m[33;40miax[39;49m[34;49m ;  .. [39;49m[32;49m
0x7ffff72feb1b    49b9a5e72ff7ff7f0000    mov r9, 0x7ffff72fe7a5                                 [39;49m[32;49m
0x7ffff72feb25    49ffd1                  call r9                    	< Combinators.[34;49miax[39;49m : 0x00007ffff72fe7a5 >[39;49m
[34;49m ..                       : qeval stk iax [39;49m[33;40m;[39;49m[34;49m  .. [39;49m[32;49m
0x7ffff72feb28    c3                      ret                                                    [39;49m
Word_Disassemble : word - 'qeval' :: codeSize = 260x00007ffff72692380x00007ffff72feb0e46419
Stack : word at namespaces/compiler/x64.cft : 464.19 :> [39;49mwdiss[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 464.021 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m' qeval find wdiss [34;49m[33;40m//[34;49m[34;49m sp [34;49m 
dbg[i]  :: [34;49m...[34;49m : 466.005 : Asm :> [33;40m:asm[34;49m <: 0x00007ffff74b5268 :> [34;49m[34;49m[33;40m:asm[34;49m[34;49m stest [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:asm[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 466.11[32;49m
0x7ffff72feb29    e900000000              jmp 0x7ffff72feb2e         	< C compiler code >        [34;49m
[34;49m ..                                       [34;49m[33;40mstest[34;49m[34;49mal stk iax ;  .. [34;49m[32;49m
0x7ffff72feb2e    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72feb32    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72feb36    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 466.11 :> [39;49m:asm[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc8b88[34;49m.
dbg[i]  :: [34;49m...[34;49m : 467.028 : Combinators :> [33;40m_Compile_MoveTOS_To_R8D[34;49m <: 0x00007ffff5bc71b8 :> [34;49m    [34;49m[33;40m_Compile_MoveTOS_To_R8D[34;49m[34;49m ( ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 467.31[39;49m :
TypeWordStack depth =   0 :  = Top = 0x00007ffff7fc1a20, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
type match :: Combinators._Compile_MoveTOS_To_R8D :: type expected :  :: type recorded :  : namespaces/compiler/x64.cft : 467.31
_Compile_Write_Instruction_X64 : 7ffff72feb3d : 3 bytes : ...
[34;49m ..                            : qeval stk[39;49m[33;40m_Compile_MoveTOS_To_R8D[39;49m[34;49m .. [39;49m[32;49m
0x7ffff72feb3d    4d8b06                  mov r8, [r14]                                          [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_MoveTOS_To_R8D[34;49m <:    3 bytes : at namespaces/compiler/x64.cft : 467.31[32;49m
0x7ffff72feb3d    4d8b06                  mov r8, [r14]                                          [34;49m
dbg[i]  :: [34;49m...[34;49m : 468.035 : void :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <: 0x00007ffff5c85468 :> [34;49m    [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( R8D, 0 ) [34;49m 
dbg[i]  :: [34;49m...[34;49m : 468.040 : X64 :> [33;40mR8D[34;49m <: 0x00007ffff5c7a3a0 :> [34;49m    _Compile_Move_DataStackN_ToReg ( [34;49m[33;40mR8D[34;49m[34;49m, 0 ) [34;49m 
Stack : word at namespaces/compiler/x64.cft : 468.40 :> [39;49mR8D[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000008[34;49m.
dbg[i]  :: [34;49m...[34;49m : 468.044 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cf8018 :> [34;49m    _Compile_Move_DataStackN_ToReg ( R8D, [34;49m[33;40m0[34;49m[34;49m ) [34;49m 
Stack : word at namespaces/compiler/x64.cft : 468.44 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 468.045 : void :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <: 0x00007ffff5c85468 :> [34;49m    [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( R8D, 0 ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 468.45[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5cf8018	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7a3a0	< word : X64.[34;49mR8D[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
type match :: void._Compile_Move_DataStackN_ToReg :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 468.45
_Compile_Write_Instruction_X64 : 7ffff72feb40 : 3 bytes : ...
[34;49m .. : qeval stk iax ; [39;49m[33;40m_Compile_Move_DataStackN_ToReg[39;49m[34;49m .. [39;49m[32;49m
0x7ffff72feb40    4d8b06                  mov r8, [r14]                                          [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <:    3 bytes : at namespaces/compiler/x64.cft : 468.45[32;49m
0x7ffff72feb40    4d8b06                  mov r8, [r14]                                          [34;49m
Stack : word at namespaces/compiler/x64.cft : 468.45 :> [39;49m_Compile_Move_DataStackN_ToReg[34;49m <: 2 cells popped. TOS changed to [39;49m0x00007ffff5bc8b88[34;49m.
dbg[i]  :: [34;49m...[34;49m : 469.027 : Combinators :> [33;40mCompile_Stack_Push_R8D[34;49m <: 0x00007ffff5bc85f8 :> [34;49m    [34;49m[33;40mCompile_Stack_Push_R8D[34;49m[34;49m ( ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 469.30[39;49m :
TypeWordStack depth =   0 :  = Top = 0x00007ffff7fc1a20, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
type match :: Combinators.Compile_Stack_Push_R8D :: type expected :  :: type recorded :  : namespaces/compiler/x64.cft : 469.30
_Compile_Write_Instruction_X64 : 7ffff72feb43 : 4 bytes : ...
[34;49m: qeval stk iax ; [39;49m[33;40mCompile_Stack_Push_R8D[39;49m[34;49m .. [39;49m[32;49m
0x7ffff72feb43    4983c608                add r14, 0x8                                           [39;49m
_Compile_Write_Instruction_X64 : 7ffff72feb47 : 3 bytes : ...[32;49m
0x7ffff72feb47    4d8906                  mov [r14], r8                                          [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCompile_Stack_Push_R8D[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 469.30[32;49m
0x7ffff72feb43    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72feb47    4d8906                  mov [r14], r8                                          [34;49m
dbg[i]  :: [34;49m...[34;49m : 470.022 : void :> [33;40m_Compile_SUBI_DSP[34;49m <: 0x00007ffff5c90648 :> [34;49m    [34;49m[33;40m_Compile_SUBI_DSP[34;49m[34;49m ( CELL ) [34;49m 
dbg[i]  :: [34;49m...[34;49m : 470.029 : X64 :> [33;40mCELL[34;49m <: 0x00007ffff5c7d028 :> [34;49m    _Compile_SUBI_DSP ( [34;49m[33;40mCELL[34;49m[34;49m ) [34;49m 
Stack : word at namespaces/compiler/x64.cft : 470.29 :> [39;49mCELL[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000008[34;49m.
dbg[i]  :: [34;49m...[34;49m : 470.030 : void :> [33;40m_Compile_SUBI_DSP[34;49m <: 0x00007ffff5c90648 :> [34;49m    [34;49m[33;40m_Compile_SUBI_DSP[34;49m[34;49m ( CELL ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 470.30[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7d028	< word : X64.[34;49mCELL[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
type match :: void._Compile_SUBI_DSP :: type expected : Any  :: type recorded : Integer  : namespaces/compiler/x64.cft : 470.30
_Compile_Write_Instruction_X64 : 7ffff72feb4a : 4 bytes : ...
[34;49m: qeval stk iax ; [39;49m[33;40m_Compile_SUBI_DSP[39;49m[34;49m .. [39;49m[32;49m
0x7ffff72feb4a    4983ee08                sub r14, 0x8                                           [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_SUBI_DSP[34;49m <:    4 bytes : at namespaces/compiler/x64.cft : 470.30[32;49m
0x7ffff72feb4a    4983ee08                sub r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 470.30 :> [39;49m_Compile_SUBI_DSP[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff5bc8b88[34;49m.
dbg[i]  :: [34;49m...[34;49m : 471.005 : Asm :> [33;40masm;[34;49m <: 0x00007ffff74b5430 :> [34;49m[34;49m[33;40masm;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40masm;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 471.5
[34;49m .. _R8D ( )  _Compile_SUBI_DSP ( CELL )  [34;49m[33;40masm;[34;49m[34;49m [34;49m[32;49m
0x7ffff72feb4e    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 471.5 :> [39;49masm;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 473.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49m stest find wdiss //pause [34;49m 
Stack : word at namespaces/compiler/x64.cft : 473.8 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5cc9363[34;49m.
dbg[i]  :: [34;49m...[34;49m : 473.013 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m' stest [34;49m[33;40mfind[34;49m[34;49m wdiss //pause [34;49m 
Stack : word at namespaces/compiler/x64.cft : 473.13 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff5bc8b88[34;49m.
dbg[i]  :: [34;49m...[34;49m : 473.019 : System :> [33;40mwdiss[34;49m <: 0x00007ffff71f6c68 :> [34;49m' stest find [34;49m[33;40mwdiss[34;49m[34;49m //pause [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 473.19[39;49m :
TypeWordStack depth =   0 :  = Top = 0x00007ffff7fc1a20, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
type match :: System.wdiss :: type expected :  :: type recorded :  : namespaces/compiler/x64.cft : 473.19
User.[34;49mstest[39;49m <:> cfrTil compiled word
SourceCode for User.[34;49mstest[39;49m :> 
[34;49m:asm stest _Compile_MoveTOS_To_R8D ( ) _Compile_Move_DataStackN_ToReg ( R8D, 0 ) Compile_Stack_Push_R8D ( ) _Compile_SUBI_DSP ( CELL ) asm; [39;49m
Source code file location of [34;49mstest[39;49m : "namespaces/compiler/x64.cft" : 466.10 :: we are now at : namespaces/compiler/x64.cft : 473.19
Compiled with : optimizeOn, inlineOn, infixOn
Debug Source Code on : BigNum off : Lisp off : Word Source Code on
starting at address : 0xf72feb3d -- code size = 18 bytes
Word :: User.[34;49mstest[39;49m : definition = 0x00007ffff72feb3d : disassembly at namespaces/compiler/x64.cft : 473.19 :
[34;49m ..                            :asm stest [39;49m[33;40m_Compile_MoveTOS_To_R8D[39;49m[34;49m ( )  _Compile_Move_DataStackN_ToReg ( R8D, 0 )  Compile_Stack_Push_R8D ( )  _Com .. [39;49m[32;49m
0x7ffff72feb3d    4d8b06                  mov r8, [r14]                                          [39;49m
[34;49m  :asm stest _Compile_MoveTOS_To_R8D ( )  [39;49m[33;40m_Compile_Move_DataStackN_ToReg[39;49m[34;49m ( R8D, 0 )  Compile_Stack_Push_R8D ( )  _Compile_SUBI_DSP ( CELL )  asm;  .. [39;49m[32;49m
0x7ffff72feb40    4d8b06                  mov r8, [r14]                                          [39;49m
[34;49m .. ile_Move_DataStackN_ToReg ( R8D, 0 )  [39;49m[33;40mCompile_Stack_Push_R8D[39;49m[34;49m ( )  _Compile_SUBI_DSP ( CELL )  asm; [39;49m[32;49m
0x7ffff72feb43    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72feb47    4d8906                  mov [r14], r8                                          [39;49m
[34;49m .. R8D, 0 )  Compile_Stack_Push_R8D ( )  [39;49m[33;40m_Compile_SUBI_DSP[39;49m[34;49m ( CELL )  asm; [39;49m[32;49m
0x7ffff72feb4a    4983ee08                sub r14, 0x8                                           [39;49m
[34;49m .. _R8D ( )  _Compile_SUBI_DSP ( CELL )  [39;49m[33;40masm;[39;49m[34;49m [39;49m[32;49m
0x7ffff72feb4e    c3                      ret                                                    [39;49m
Word_Disassemble : word - 'stest' :: codeSize = 170x00007ffff72692380x00007ffff72feb3d47319
Stack : word at namespaces/compiler/x64.cft : 473.19 :> [39;49mwdiss[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 473.021 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m' stest find wdiss [34;49m[33;40m//[34;49m[34;49mpause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 474.002 : User :> [33;40ms[34;49m <: cprimitive :> [34;49m[34;49m[33;40ms[34;49m[34;49m [34;49m 
DataStack at : [34;49mnamespaces/compiler/x64.cft : 474.2[39;49m :
DataStack depth =   4 : Dsp (R14) = Top = 0x00007ffff7269218, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -1 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[i]  :: [34;49m...[34;49m : 475.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49m\nthis is some purposefully funky code for testing\n" ps [34;49m 
dbg[i]  :: [34;49m...[34;49m : 475.054 : <literal> :> [33;40m"\nthis is some purposefully funky code for testing\n"[34;49m <: 0x00007ffff5cf81e0 :> [34;49m[34;49m[33;40m"\nthis is some purposefully funky code for testing\n"[34;49m[34;49m[34;49m 
Stack : word at namespaces/compiler/x64.cft : 475.1 :> [39;49m"\nthis is some purposefully funky code for testing\n"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72cafe9[34;49m.
Literal :> 0x00007ffff72cafe9 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 475.058 : Int :> [33;40mps[34;49m <: 0x00007ffff728e7d8 :> [34;49m"\nthis is some purposefully funky code for testing\n" [34;49m[33;40mps[34;49m[34;49m [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 475.58[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5cf81e0	< word : <literal>.[34;49m"\nthis is some purposefully funky code for testing\n"[39;49m : value = 0x00007ffff72cafe9 > : [34;49mString [39;49m
type match :: Int.ps :: type expected : String  :: type recorded : String  : namespaces/compiler/x64.cft : 475.58
Stack : word at namespaces/compiler/x64.cft : 475.58 :> [39;49mps[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 477.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif 1 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 477.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m 1 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 477.006 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cf83a8 :> [34;49m#if [34;49m[33;40m1[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 477.6 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 478.002 : User :> [33;40ms[34;49m <: cprimitive :> [34;49m[34;49m[33;40ms[34;49m[34;49m stest sp [34;49m 
DataStack at : [34;49mnamespaces/compiler/x64.cft : 478.2[39;49m :
DataStack depth =   4 : Dsp (R14) = Top = 0x00007ffff7269218, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -1 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[i]  :: [34;49m...[34;49m : 478.008 : User :> [33;40mstest[34;49m <: 0x00007ffff5bc8b88 :> [34;49ms [34;49m[33;40mstest[34;49m[34;49m sp [34;49m 
dbg[i]  :: [34;49m...[34;49m : 478.011 : User :> [33;40msp[34;49m <: 0x00007ffff5bc87f8 :> [34;49ms stest [34;49m[33;40msp[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 479.003 : Int :> [33;40mnl[34;49m <: cprimitive :> [34;49m[34;49m[33;40mnl[34;49m[34;49m "x64 test" ps "ok" ' dup find xt@ iax ' ps find xt@ iax "ok" "error" assert1s sp //pause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 479.004 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49mnl [34;49m[33;40m"[34;49m[34;49mx64 test" ps "ok" ' dup find xt@ iax ' ps find xt@ iax "ok" "error" assert1s sp //pause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 479.013 : <literal> :> [33;40m"x64 test"[34;49m <: 0x00007ffff5cf8570 :> [34;49mnl [34;49m[33;40m"x64 test"[34;49m[34;49m ps "ok" ' dup find xt@ iax ' ps find xt@ iax "ok" "error" asse[34;49m 
Stack : word at namespaces/compiler/x64.cft : 479.4 :> [39;49m"x64 test"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72cb05e[34;49m.
Literal :> 0x00007ffff72cb05e <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 479.017 : Int :> [33;40mps[34;49m <: 0x00007ffff728e7d8 :> [34;49mnl "x64 test" [34;49m[33;40mps[34;49m[34;49m "ok" ' dup find xt@ iax ' ps find xt@ iax "ok" "error" assert1s sp //paus[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 479.17[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5cf8570	< word : <literal>.[34;49m"x64 test"[39;49m : value = 0x00007ffff72cb05e > : [34;49mString [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5cf83a8	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Int.ps :: type expected : String  :: type recorded : String  : namespaces/compiler/x64.cft : 479.17
Stack : word at namespaces/compiler/x64.cft : 479.17 :> [39;49mps[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 479.018 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49mnl "x64 test" ps [34;49m[33;40m"[34;49m[34;49mok" ' dup find xt@ iax ' ps find xt@ iax "ok" "error" assert1s sp //pause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 479.021 : <literal> :> [33;40m"ok"[34;49m <: 0x00007ffff5cf8738 :> [34;49mnl "x64 test" ps [34;49m[33;40m"ok"[34;49m[34;49m ' dup find xt@ iax ' ps find xt@ iax "ok" "error" assert1s s[34;49m 
Stack : word at namespaces/compiler/x64.cft : 479.18 :> [39;49m"ok"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72cb077[34;49m.
Literal :> 0x00007ffff72cb077 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 479.023 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49mnl "x64 test" ps "ok" [34;49m[33;40m'[34;49m[34;49m dup find xt@ iax ' ps find xt@ iax "ok" "error" assert1s sp //paus[34;49m 
Stack : word at namespaces/compiler/x64.cft : 479.28 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5cc939c[34;49m.
dbg[i]  :: [34;49m...[34;49m : 479.033 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49mnl "x64 test" ps "ok" ' dup [34;49m[33;40mfind[34;49m[34;49m xt@ iax ' ps find xt@ iax "ok" "error" assert1s sp //p[34;49m 
Stack : word at namespaces/compiler/x64.cft : 479.33 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff72ae520[34;49m.
dbg[i]  :: [34;49m...[34;49m : 479.037 : Interpreter :> [33;40mxt@[34;49m <: 0x00007ffff7294678 :> [34;49mnl "x64 test" ps "ok" ' dup find [34;49m[33;40mxt@[34;49m[34;49m iax ' ps find xt@ iax "ok" "error" assert1s [34;49m 
Stack : word at namespaces/compiler/x64.cft : 479.37 :> [39;49mxt@[34;49m <: TOS changed to [39;49m0x00005555555bc591[34;49m.
dbg[i]  :: [34;49m...[34;49m : 479.041 : Combinators :> [33;40miax[34;49m <: 0x00007ffff5bc5be8 :> [34;49mnl "x64 test" ps "ok" ' dup find xt@ [34;49m[33;40miax[34;49m[34;49m ' ps find xt@ iax "ok" "error" assert1s [34;49m 
Stack : word at namespaces/compiler/x64.cft : 479.41 :> [39;49miax[34;49m <: TOS changed to [39;49m0x00007ffff72cb077[34;49m.
dbg[i]  :: [34;49m...[34;49m : 479.042 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49mnl "x64 test" ps "ok" ' dup find xt@ iax [34;49m[33;40m'[34;49m[34;49m ps find xt@ iax "ok" "error" assert1s sp //paus[34;49m 
Stack : word at namespaces/compiler/x64.cft : 479.46 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5cc93af[34;49m.
dbg[i]  :: [34;49m...[34;49m : 479.051 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m64 test" ps "ok" ' dup find xt@ iax ' ps [34;49m[33;40mfind[34;49m[34;49m xt@ iax "ok" "error" assert1s sp //pause [34;49m 
Stack : word at namespaces/compiler/x64.cft : 479.51 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff728e7d8[34;49m.
dbg[i]  :: [34;49m...[34;49m : 479.055 : Interpreter :> [33;40mxt@[34;49m <: 0x00007ffff7294678 :> [34;49mt" ps "ok" ' dup find xt@ iax ' ps find [34;49m[33;40mxt@[34;49m[34;49m iax "ok" "error" assert1s sp //pause [34;49m 
Stack : word at namespaces/compiler/x64.cft : 479.55 :> [39;49mxt@[34;49m <: TOS changed to [39;49m0x00007ffff72f3309[34;49m.
dbg[i]  :: [34;49m...[34;49m : 479.059 : Combinators :> [33;40miax[34;49m <: 0x00007ffff5bc5be8 :> [34;49mt" ps "ok" ' dup find xt@ iax ' ps find xt@ [34;49m[33;40miax[34;49m[34;49m "ok" "error" assert1s sp //pause [34;49m 
Stack : word at namespaces/compiler/x64.cft : 479.59 :> [39;49miax[34;49m <: 2 cells popped. TOS changed to [39;49m0x00007ffff72cb077[34;49m.
dbg[i]  :: [34;49m...[34;49m : 479.060 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49mnl "x64 test" ps "ok" ' dup find xt@ iax ' ps find xt@ iax [34;49m[33;40m"[34;49m[34;49mok" "error" assert1s sp //pause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 479.063 : <literal> :> [33;40m"ok"[34;49m <: 0x00007ffff5cf8900 :> [34;49mst" ps "ok" ' dup find xt@ iax ' ps find xt@ iax [34;49m[33;40m"ok"[34;49m[34;49m "error" assert1s sp //pause [34;49m 
Stack : word at namespaces/compiler/x64.cft : 479.60 :> [39;49m"ok"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72cb084[34;49m.
Literal :> 0x00007ffff72cb084 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 479.065 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49mnl "x64 test" ps "ok" ' dup find xt@ iax ' ps find xt@ iax "ok" [34;49m[33;40m"[34;49m[34;49merror" assert1s sp //pause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 479.071 : <literal> :> [33;40m"error"[34;49m <: 0x00007ffff5cf8ac8 :> [34;49m ps "ok" ' dup find xt@ iax ' ps find xt@ iax "ok" [34;49m[33;40m"error"[34;49m[34;49m assert1s sp //pause [34;49m 
Stack : word at namespaces/compiler/x64.cft : 479.65 :> [39;49m"error"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72cb094[34;49m.
Literal :> 0x00007ffff72cb094 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 479.081 : System :> [33;40massert1s[34;49m <: 0x00007ffff71fc900 :> [34;49mt" ps "ok" ' dup find xt@ iax ' ps find xt@ iax "ok" "error" [34;49m[33;40massert1s[34;49m[34;49m sp //pause [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 479.81[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5cf8ac8	< word : <literal>.[34;49m"error"[39;49m : value = 0x00007ffff72cb094 > : [34;49mString [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5cf8900	< word : <literal>.[34;49m"ok"[39;49m : value = 0x00007ffff72cb084 > : [34;49mString [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5cf8738	< word : <literal>.[34;49m"ok"[39;49m : value = 0x00007ffff72cb077 > : [34;49mString [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5cf8738	< word : <literal>.[34;49m"ok"[39;49m : value = 0x00007ffff72cb077 > : [34;49mString [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5cf8738	< word : <literal>.[34;49m"ok"[39;49m : value = 0x00007ffff72cb077 > : [34;49mString [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5cf83a8	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: System.assert1s :: type expected :  :: type recorded : String . String . String  : namespaces/compiler/x64.cft : 479.81
Stack : word at namespaces/compiler/x64.cft : 479.81 :> [39;49massert1s[34;49m <: 3 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 479.084 : User :> [33;40msp[34;49m <: 0x00007ffff5bc87f8 :> [34;49m"x64 test" ps "ok" ' dup find xt@ iax ' ps find xt@ iax "ok" "error" assert1s [34;49m[33;40msp[34;49m[34;49m //pause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 479.086 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m "x64 test" ps "ok" ' dup find xt@ iax ' ps find xt@ iax "ok" "error" assert1s sp [34;49m[33;40m//[34;49m[34;49mpause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 480.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mendif [34;49m 
dbg[i]  :: [34;49m...[34;49m : 480.007 : PreProcessor :> [33;40mendif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mendif[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 481.003 : User :> [33;40msp[34;49m <: 0x00007ffff5bc87f8 :> [34;49m[34;49m[33;40msp[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 482.006 : Root :> [33;40mStack[34;49m <: 0x00007ffff72ae320 :> [34;49m[34;49m[33;40mStack[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 483.005 : Asm :> [33;40m:asm[34;49m <: 0x00007ffff74b5268 :> [34;49m[34;49m[33;40m:asm[34;49m[34;49m ndup [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:asm[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 483.10[32;49m
0x7ffff72feb4f    e900000000              jmp 0x7ffff72feb54         	< C compiler code >        [34;49m
[34;49m ..                                       [34;49m[33;40mndup[34;49m[34;49m stest _Compile_MoveTOS_To_R8D ( )  _Compile_Move_DataStackN_ToReg ( R8D, 0 )  Compile_Stack_Push_R8 .. [34;49m[32;49m
0x7ffff72feb54    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72feb58    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72feb5c    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 483.10 :> [39;49m:asm[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc8d50[34;49m.
dbg[i]  :: [34;49m...[34;49m : 484.028 : Combinators :> [33;40m_Compile_MoveTOS_To_R8D[34;49m <: 0x00007ffff5bc71b8 :> [34;49m    [34;49m[33;40m_Compile_MoveTOS_To_R8D[34;49m[34;49m ( ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 484.31[39;49m :
TypeWordStack depth =   0 :  = Top = 0x00007ffff7fc1a20, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
type match :: Combinators._Compile_MoveTOS_To_R8D :: type expected :  :: type recorded :  : namespaces/compiler/x64.cft : 484.31
_Compile_Write_Instruction_X64 : 7ffff72feb63 : 3 bytes : ...
[34;49m ..                            :asm stest [39;49m[33;40m_Compile_MoveTOS_To_R8D[39;49m[34;49m ( )  _Compile_Move_DataStackN_ToReg ( R8D, 0 )  Compile_Stack_Push_R8D ( )  _Com .. [39;49m[32;49m
0x7ffff72feb63    4d8b06                  mov r8, [r14]                                          [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_MoveTOS_To_R8D[34;49m <:    3 bytes : at namespaces/compiler/x64.cft : 484.31[32;49m
0x7ffff72feb63    4d8b06                  mov r8, [r14]                                          [34;49m
dbg[i]  :: [34;49m...[34;49m : 485.022 : void :> [33;40m_Compile_SUBI_DSP[34;49m <: 0x00007ffff5c90648 :> [34;49m    [34;49m[33;40m_Compile_SUBI_DSP[34;49m[34;49m ( CELL ) [34;49m 
dbg[i]  :: [34;49m...[34;49m : 485.029 : X64 :> [33;40mCELL[34;49m <: 0x00007ffff5c7d028 :> [34;49m    _Compile_SUBI_DSP ( [34;49m[33;40mCELL[34;49m[34;49m ) [34;49m 
Stack : word at namespaces/compiler/x64.cft : 485.29 :> [39;49mCELL[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000008[34;49m.
dbg[i]  :: [34;49m...[34;49m : 485.030 : void :> [33;40m_Compile_SUBI_DSP[34;49m <: 0x00007ffff5c90648 :> [34;49m    [34;49m[33;40m_Compile_SUBI_DSP[34;49m[34;49m ( CELL ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 485.30[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7d028	< word : X64.[34;49mCELL[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
type match :: void._Compile_SUBI_DSP :: type expected : Any  :: type recorded : Integer  : namespaces/compiler/x64.cft : 485.30
_Compile_Write_Instruction_X64 : 7ffff72feb66 : 4 bytes : ...
[34;49m ..  :asm stest _Compile_MoveTOS_To_R8D ( [39;49m[33;40m_Compile_SUBI_DSP[39;49m[34;49mDataStackN_ToReg ( R8D, 0 )  Compile_Stack_Push_R8D ( )  _Compile_SUBI_DSP ( CELL )  as .. [39;49m[32;49m
0x7ffff72feb66    4983ee08                sub r14, 0x8                                           [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_SUBI_DSP[34;49m <:    4 bytes : at namespaces/compiler/x64.cft : 485.30[32;49m
0x7ffff72feb66    4983ee08                sub r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 485.30 :> [39;49m_Compile_SUBI_DSP[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff5bc8d50[34;49m.
dbg[i]  :: [34;49m...[34;49m : 486.035 : void :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <: 0x00007ffff5c85468 :> [34;49m    [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( R9D, 0 ) [34;49m 
dbg[i]  :: [34;49m...[34;49m : 486.040 : X64 :> [33;40mR9D[34;49m <: 0x00007ffff5c7a568 :> [34;49m    _Compile_Move_DataStackN_ToReg ( [34;49m[33;40mR9D[34;49m[34;49m, 0 ) [34;49m 
Stack : word at namespaces/compiler/x64.cft : 486.40 :> [39;49mR9D[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000009[34;49m.
dbg[i]  :: [34;49m...[34;49m : 486.044 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cf8c90 :> [34;49m    _Compile_Move_DataStackN_ToReg ( R9D, [34;49m[33;40m0[34;49m[34;49m ) [34;49m 
Stack : word at namespaces/compiler/x64.cft : 486.44 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 486.045 : void :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <: 0x00007ffff5c85468 :> [34;49m    [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( R9D, 0 ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 486.45[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5cf8c90	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7a568	< word : X64.[34;49mR9D[39;49m : value = 0x0000000000000009 > : [34;49mInteger [39;49m
type match :: void._Compile_Move_DataStackN_ToReg :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 486.45
_Compile_Write_Instruction_X64 : 7ffff72feb6a : 3 bytes : ...
[34;49m  :asm stest _Compile_MoveTOS_To_R8D ( )  [39;49m[33;40m_Compile_Move_DataStackN_ToReg[39;49m[34;49m ( R8D, 0 )  Compile_Stack_Push_R8D ( )  _Compile_SUBI_DSP ( CELL )  asm;  .. [39;49m[32;49m
0x7ffff72feb6a    4d8b0e                  mov r9, [r14]                                          [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <:    3 bytes : at namespaces/compiler/x64.cft : 486.45[32;49m
0x7ffff72feb6a    4d8b0e                  mov r9, [r14]                                          [34;49m
Stack : word at namespaces/compiler/x64.cft : 486.45 :> [39;49m_Compile_Move_DataStackN_ToReg[34;49m <: 2 cells popped. TOS changed to [39;49m0x00007ffff5bc8d50[34;49m.
dbg[i]  :: [34;49m...[34;49m : 487.005 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m"[34;49m[34;49mstart" label [34;49m 
dbg[i]  :: [34;49m...[34;49m : 487.011 : <literal> :> [33;40m"start"[34;49m <: 0x00007ffff5cf8e58 :> [34;49m    [34;49m[33;40m"start"[34;49m[34;49m label [34;49m 
Stack : word at namespaces/compiler/x64.cft : 487.5 :> [39;49m"start"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72cb0b1[34;49m.
Literal :> 0x00007ffff72cb0b1 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 487.018 : Asm :> [33;40mlabel[34;49m <: cprimitive :> [34;49m    "start" [34;49m[33;40mlabel[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 487.18 :> [39;49mlabel[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff5bc8d50[34;49m.
dbg[i]  :: [34;49m...[34;49m : 488.029 : void :> [33;40m_Compile_TEST_Reg_To_Reg[34;49m <: 0x00007ffff5bc3930 :> [34;49m    [34;49m[33;40m_Compile_TEST_Reg_To_Reg[34;49m[34;49m ( R8D, R8D ) [34;49m 
dbg[i]  :: [34;49m...[34;49m : 488.034 : X64 :> [33;40mR8D[34;49m <: 0x00007ffff5c7a3a0 :> [34;49m    _Compile_TEST_Reg_To_Reg ( [34;49m[33;40mR8D[34;49m[34;49m, R8D ) [34;49m 
Stack : word at namespaces/compiler/x64.cft : 488.34 :> [39;49mR8D[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000008[34;49m.
dbg[i]  :: [34;49m...[34;49m : 488.041 : void :> [33;40m_Compile_TEST_Reg_To_Reg[34;49m <: 0x00007ffff5bc3930 :> [34;49m    [34;49m[33;40m_Compile_TEST_Reg_To_Reg[34;49m[34;49m ( R8D, R8D ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 488.41[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c7a3a0	< word : X64.[34;49mR8D[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c7a3a0	< word : X64.[34;49mR8D[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5cf8e58	< word : <literal>.[34;49m"start"[39;49m : value = 0x00007ffff72cb0b1 > : [34;49mString [39;49m
type match :: void._Compile_TEST_Reg_To_Reg :: type expected : Any . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 488.41
_Compile_Write_Instruction_X64 : 7ffff72feb6d : 3 bytes : ...
[34;49m .. ompile_Stack_Push_R8D ( )  _Compile_SU[39;49m[33;40m_Compile_TEST_Reg_To_Reg[39;49m[34;49m[39;49m[32;49m
0x7ffff72feb6d    4d85c0                  test r8, r8                                            [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_TEST_Reg_To_Reg[34;49m <:    3 bytes : at namespaces/compiler/x64.cft : 488.41[32;49m
0x7ffff72feb6d    4d85c0                  test r8, r8                                            [34;49m
Stack : word at namespaces/compiler/x64.cft : 488.41 :> [39;49m_Compile_TEST_Reg_To_Reg[34;49m <: 2 cells popped. TOS changed to [39;49m0x00007ffff5bc8d50[34;49m.
dbg[i]  :: [34;49m...[34;49m : 489.005 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m"[34;49m[34;49mend" 0 EQ jcc [34;49m 
dbg[i]  :: [34;49m...[34;49m : 489.009 : <literal> :> [33;40m"end"[34;49m <: 0x00007ffff5cf9020 :> [34;49m    [34;49m[33;40m"end"[34;49m[34;49m 0 EQ jcc [34;49m 
Stack : word at namespaces/compiler/x64.cft : 489.5 :> [39;49m"end"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72cb0d6[34;49m.
Literal :> 0x00007ffff72cb0d6 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 489.012 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cf91e8 :> [34;49m    "end" [34;49m[33;40m0[34;49m[34;49m EQ jcc [34;49m 
Stack : word at namespaces/compiler/x64.cft : 489.12 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 489.015 : X64 :> [33;40mEQ[34;49m <: 0x00007ffff5c7b900 :> [34;49m    "end" 0 [34;49m[33;40mEQ[34;49m[34;49m jcc [34;49m 
Stack : word at namespaces/compiler/x64.cft : 489.15 :> [39;49mEQ[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
dbg[i]  :: [34;49m...[34;49m : 489.019 : Asm :> [33;40mjcc[34;49m <: cprimitive :> [34;49m    "end" 0 EQ [34;49m[33;40mjcc[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mjcc[34;49m <:    6 bytes : at namespaces/compiler/x64.cft : 489.19
[34;49m .. L )  asm; [34;49m[33;40mjcc[34;49m[34;49m[34;49m[32;49m
0x7ffff72feb70    0f8400000000            jz 0x7ffff72feb76          	< C compiler code >        [34;49m
Stack : word at namespaces/compiler/x64.cft : 489.19 :> [39;49mjcc[34;49m <: 3 cells popped. TOS changed to [39;49m0x00007ffff5bc8d50[34;49m.
dbg[i]  :: [34;49m...[34;49m : 490.022 : Combinators :> [33;40m_Compile_ADDI_DSP[34;49m <: 0x00007ffff5bc73b8 :> [34;49m    [34;49m[33;40m_Compile_ADDI_DSP[34;49m[34;49m ( CELL ) [34;49m 
dbg[i]  :: [34;49m...[34;49m : 490.029 : X64 :> [33;40mCELL[34;49m <: 0x00007ffff5c7d028 :> [34;49m    _Compile_ADDI_DSP ( [34;49m[33;40mCELL[34;49m[34;49m ) [34;49m 
Stack : word at namespaces/compiler/x64.cft : 490.29 :> [39;49mCELL[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000008[34;49m.
dbg[i]  :: [34;49m...[34;49m : 490.030 : Combinators :> [33;40m_Compile_ADDI_DSP[34;49m <: 0x00007ffff5bc73b8 :> [34;49m    [34;49m[33;40m_Compile_ADDI_DSP[34;49m[34;49m ( CELL ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 490.30[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c7d028	< word : X64.[34;49mCELL[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c7b900	< word : X64.[34;49mEQ[39;49m : value = 0x0000000000000002 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5cf91e8	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5cf9020	< word : <literal>.[34;49m"end"[39;49m : value = 0x00007ffff72cb0d6 > : [34;49mString [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5cf8e58	< word : <literal>.[34;49m"start"[39;49m : value = 0x00007ffff72cb0b1 > : [34;49mString [39;49m
type match :: Combinators._Compile_ADDI_DSP :: type expected : Any  :: type recorded : Integer  : namespaces/compiler/x64.cft : 490.30
_Compile_Write_Instruction_X64 : 7ffff72feb76 : 4 bytes : ...
[34;49m ..  asm; [39;49m[33;40m_Compile_ADDI_DSP[39;49m[34;49m[39;49m[32;49m
0x7ffff72feb76    4983c608                add r14, 0x8                                           [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_ADDI_DSP[34;49m <:    4 bytes : at namespaces/compiler/x64.cft : 490.30[32;49m
0x7ffff72feb76    4983c608                add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 490.30 :> [39;49m_Compile_ADDI_DSP[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff5bc8d50[34;49m.
dbg[i]  :: [34;49m...[34;49m : 491.032 : void :> [33;40m_Compile_Move_Reg_To_StackN[34;49m <: 0x00007ffff5c943f0 :> [34;49m    [34;49m[33;40m_Compile_Move_Reg_To_StackN[34;49m[34;49m ( DSP, 0, R9D ) [34;49m 
dbg[i]  :: [34;49m...[34;49m : 491.037 : X64 :> [33;40mDSP[34;49m <: 0x00007ffff5c7b1e0 :> [34;49m    _Compile_Move_Reg_To_StackN ( [34;49m[33;40mDSP[34;49m[34;49m, 0, R9D ) [34;49m 
Stack : word at namespaces/compiler/x64.cft : 491.37 :> [39;49mDSP[34;49m <: 1 cell pushed. TOS changed to [39;49m0x000000000000000e[34;49m.
dbg[i]  :: [34;49m...[34;49m : 491.040 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cf93b0 :> [34;49m    _Compile_Move_Reg_To_StackN ( DSP, [34;49m[33;40m0[34;49m[34;49m, R9D ) [34;49m 
Stack : word at namespaces/compiler/x64.cft : 491.40 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 491.046 : X64 :> [33;40mR9D[34;49m <: 0x00007ffff5c7a568 :> [34;49m    _Compile_Move_Reg_To_StackN ( DSP, 0, [34;49m[33;40mR9D[34;49m[34;49m ) [34;49m 
Stack : word at namespaces/compiler/x64.cft : 491.46 :> [39;49mR9D[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000009[34;49m.
dbg[i]  :: [34;49m...[34;49m : 491.047 : void :> [33;40m_Compile_Move_Reg_To_StackN[34;49m <: 0x00007ffff5c943f0 :> [34;49m    [34;49m[33;40m_Compile_Move_Reg_To_StackN[34;49m[34;49m ( DSP, 0, R9D ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 491.47[39;49m :
TypeWordStack depth =   7 :  = Top = 0x00007ffff7fc1a58, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a58 > = 0x00007ffff5c7a568	< word : X64.[34;49mR9D[39;49m : value = 0x0000000000000009 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5cf93b0	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c7b1e0	< word : X64.[34;49mDSP[39;49m : value = 0x000000000000000e > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c7b900	< word : X64.[34;49mEQ[39;49m : value = 0x0000000000000002 > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5cf91e8	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5cf9020	< word : <literal>.[34;49m"end"[39;49m : value = 0x00007ffff72cb0d6 > : [34;49mString [39;49m
  TypeWordStack   [  -6 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5cf8e58	< word : <literal>.[34;49m"start"[39;49m : value = 0x00007ffff72cb0b1 > : [34;49mString [39;49m
type match :: void._Compile_Move_Reg_To_StackN :: type expected :  :: type recorded : Integer  : namespaces/compiler/x64.cft : 491.47
_Compile_Write_Instruction_X64 : 7ffff72feb7a : 3 bytes : ...
[34;49m .. osefully funky code for testing
"[39;49m[33;40m_Compile_Move_Reg_To_StackN[39;49m[34;49m[39;49m[32;49m
0x7ffff72feb7a    4d890e                  mov [r14], r9                                          [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move_Reg_To_StackN[34;49m <:    3 bytes : at namespaces/compiler/x64.cft : 491.47[32;49m
0x7ffff72feb7a    4d890e                  mov [r14], r9                                          [34;49m
Stack : word at namespaces/compiler/x64.cft : 491.47 :> [39;49m_Compile_Move_Reg_To_StackN[34;49m <: 3 cells popped. TOS changed to [39;49m0x00007ffff5bc8d50[34;49m.
dbg[i]  :: [34;49m...[34;49m : 492.024 : Combinators :> [33;40m_Compile_IncDec_Reg[34;49m <: 0x00007ffff5bc6df0 :> [34;49m    [34;49m[33;40m_Compile_IncDec_Reg[34;49m[34;49m ( DEC, R8D ) [34;49m 
dbg[i]  :: [34;49m...[34;49m : 492.029 : X64 :> [33;40mDEC[34;49m <: 0x00007ffff5c7d580 :> [34;49m    _Compile_IncDec_Reg ( [34;49m[33;40mDEC[34;49m[34;49m, R8D ) [34;49m 
Stack : word at namespaces/compiler/x64.cft : 492.29 :> [39;49mDEC[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
dbg[i]  :: [34;49m...[34;49m : 492.035 : X64 :> [33;40mR8D[34;49m <: 0x00007ffff5c7a3a0 :> [34;49m    _Compile_IncDec_Reg ( DEC, [34;49m[33;40mR8D[34;49m[34;49m ) [34;49m 
Stack : word at namespaces/compiler/x64.cft : 492.35 :> [39;49mR8D[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000008[34;49m.
dbg[i]  :: [34;49m...[34;49m : 492.036 : Combinators :> [33;40m_Compile_IncDec_Reg[34;49m <: 0x00007ffff5bc6df0 :> [34;49m    [34;49m[33;40m_Compile_IncDec_Reg[34;49m[34;49m ( DEC, R8D ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 492.36[39;49m :
TypeWordStack depth =   8 :  = Top = 0x00007ffff7fc1a60, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a60 > = 0x00007ffff5c7a3a0	< word : X64.[34;49mR8D[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a58 > = 0x00007ffff5c7d580	< word : X64.[34;49mDEC[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5cf93b0	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c7b1e0	< word : X64.[34;49mDSP[39;49m : value = 0x000000000000000e > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c7b900	< word : X64.[34;49mEQ[39;49m : value = 0x0000000000000002 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5cf91e8	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -6 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5cf9020	< word : <literal>.[34;49m"end"[39;49m : value = 0x00007ffff72cb0d6 > : [34;49mString [39;49m
  TypeWordStack   [  -7 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5cf8e58	< word : <literal>.[34;49m"start"[39;49m : value = 0x00007ffff72cb0b1 > : [34;49mString [39;49m
type match :: Combinators._Compile_IncDec_Reg :: type expected : Integer . Any  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 492.36
_Compile_Write_Instruction_X64 : 7ffff72feb7d : 3 bytes : ...
[34;49m .. _Compile_SUBI_DSP ( CELL )  asm; [39;49m[33;40mR8D[39;49m[34;49m[39;49m[32;49m
0x7ffff72feb7d    49ffc8                  dec r8                                                 [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_IncDec_Reg[34;49m <:    3 bytes : at namespaces/compiler/x64.cft : 492.36[32;49m
0x7ffff72feb7d    49ffc8                  dec r8                                                 [34;49m
Stack : word at namespaces/compiler/x64.cft : 492.36 :> [39;49m_Compile_IncDec_Reg[34;49m <: 2 cells popped. TOS changed to [39;49m0x00007ffff5bc8d50[34;49m.
dbg[i]  :: [34;49m...[34;49m : 493.005 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m"[34;49m[34;49mstart" goto [34;49m 
dbg[i]  :: [34;49m...[34;49m : 493.011 : <literal> :> [33;40m"start"[34;49m <: 0x00007ffff5cf9578 :> [34;49m    [34;49m[33;40m"start"[34;49m[34;49m goto [34;49m 
Stack : word at namespaces/compiler/x64.cft : 493.5 :> [39;49m"start"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72cb0ec[34;49m.
Literal :> 0x00007ffff72cb0ec <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 493.017 : Asm :> [33;40mgoto[34;49m <: cprimitive :> [34;49m    "start" [34;49m[33;40mgoto[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mgoto[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 493.17
[34;49m .. [34;49m[33;40mgoto[34;49m[34;49m[34;49m[32;49m
0x7ffff72feb80    e900000000              jmp 0x7ffff72feb85         	< C compiler code >        [34;49m
Stack : word at namespaces/compiler/x64.cft : 493.17 :> [39;49mgoto[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff5bc8d50[34;49m.
dbg[i]  :: [34;49m...[34;49m : 494.005 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m"[34;49m[34;49mend" label // above jcc to Here [34;49m 
dbg[i]  :: [34;49m...[34;49m : 494.009 : <literal> :> [33;40m"end"[34;49m <: 0x00007ffff5cf9740 :> [34;49m    [34;49m[33;40m"end"[34;49m[34;49m label // above jcc to Here [34;49m 
Stack : word at namespaces/compiler/x64.cft : 494.5 :> [39;49m"end"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72cb100[34;49m.
Literal :> 0x00007ffff72cb100 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 494.016 : Asm :> [33;40mlabel[34;49m <: cprimitive :> [34;49m    "end" [34;49m[33;40mlabel[34;49m[34;49m // above jcc to Here [34;49m 
Stack : word at namespaces/compiler/x64.cft : 494.16 :> [39;49mlabel[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff5bc8d50[34;49m.
dbg[i]  :: [34;49m...[34;49m : 494.018 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    "end" label [34;49m[33;40m//[34;49m[34;49m above jcc to Here [34;49m 
dbg[i]  :: [34;49m...[34;49m : 495.005 : Asm :> [33;40masm;[34;49m <: 0x00007ffff74b5430 :> [34;49m[34;49m[33;40masm;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40masm;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 495.5
[34;49m ..  DEC, R8D )  "start" goto "end" label [34;49m[33;40masm;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72feb85    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 495.5 :> [39;49masm;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 497.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49m ndup find wdiss sp [34;49m 
Stack : word at namespaces/compiler/x64.cft : 497.7 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5cc9503[34;49m.
dbg[i]  :: [34;49m...[34;49m : 497.012 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m' ndup [34;49m[33;40mfind[34;49m[34;49m wdiss sp [34;49m 
Stack : word at namespaces/compiler/x64.cft : 497.12 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff5bc8d50[34;49m.
dbg[i]  :: [34;49m...[34;49m : 497.018 : System :> [33;40mwdiss[34;49m <: 0x00007ffff71f6c68 :> [34;49m' ndup find [34;49m[33;40mwdiss[34;49m[34;49m sp [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 497.18[39;49m :
TypeWordStack depth =   0 :  = Top = 0x00007ffff7fc1a20, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
type match :: System.wdiss :: type expected :  :: type recorded :  : namespaces/compiler/x64.cft : 497.18
Stack.[34;49mndup[39;49m <:> cfrTil compiled word
SourceCode for Stack.[34;49mndup[39;49m :> 
[34;49m:asm ndup _Compile_MoveTOS_To_R8D ( ) _Compile_SUBI_DSP ( CELL ) _Compile_Move_DataStackN_ToReg ( R9D, 0 ) "start" label _Compile_TEST_Reg_To_Reg ( R8D, R8D ) "end" 0 EQ jcc _Compile_ADDI_DSP ( CELL ) _Compile_Move_Reg_To_StackN ( DSP, 0, R9D ) _Compile_IncDec_Reg ( DEC, R8D ) "start" goto "end" label asm; [39;49m
Source code file location of [34;49mndup[39;49m : "namespaces/compiler/x64.cft" : 483.9 :: we are now at : namespaces/compiler/x64.cft : 497.18
Compiled with : optimizeOn, inlineOn, infixOn
Debug Source Code on : BigNum off : Lisp off : Word Source Code on
starting at address : 0xf72feb63 -- code size = 35 bytes
Word :: Stack.[34;49mndup[39;49m : definition = 0x00007ffff72feb63 : disassembly at namespaces/compiler/x64.cft : 497.18 :
[34;49m ..                             :asm ndup [39;49m[33;40m_Compile_MoveTOS_To_R8D[39;49m[34;49m ( ) _Compile_SUBI_DSP ( CELL )  _Compile_Move_DataStackN_ToReg ( R9D, 0 ) "start .. [39;49m[32;49m
0x7ffff72feb63    4d8b06                  mov r8, [r14]                                          [39;49m
[34;49m .. :asm ndup _Compile_MoveTOS_To_R8D ( ) [39;49m[33;40m_Compile_SUBI_DSP[39;49m[34;49m ( CELL )  _Compile_Move_DataStackN_ToReg ( R9D, 0 ) "start" label  _Compile_TEST_Reg_T .. [39;49m[32;49m
0x7ffff72feb66    4983ee08                sub r14, 0x8                                           [39;49m
[34;49m .. o_R8D ( ) _Compile_SUBI_DSP ( CELL )  [39;49m[33;40m_Compile_Move_DataStackN_ToReg[39;49m[34;49m ( R9D, 0 ) "start" label  _Compile_TEST_Reg_To_Reg ( R8D, R8D ) "end" 0 E .. [39;49m[32;49m
0x7ffff72feb6a    4d8b0e                  mov r9, [r14]                                          [39;49m
[34;49m .. tackN_ToReg ( R9D, 0 ) "start" label  [39;49m[33;40m_Compile_TEST_Reg_To_Reg[39;49m[34;49m ( R8D, R8D ) "end" 0 EQ jcc _Compile_ADDI_DSP ( CELL )  _Compile_Move_Reg_To_St .. [39;49m[32;49m
0x7ffff72feb6d    4d85c0                  test r8, r8                                            [39;49m
[34;49m .. ST_Reg_To_Reg ( R8D, R8D ) "end" 0 EQ [39;49m[33;40mjcc[39;49m[34;49m _Compile_ADDI_DSP ( CELL )  _Compile_Move_Reg_To_StackN ( DSP, 0, R9D )  _Compile_IncDec_Reg ( DEC,  .. [39;49m[32;49m
0x7ffff72feb70    0f840f000000            jz 0x7ffff72feb85          	< Stack.[34;49mndup[39;49m+34 >[39;49m
[34;49m .. eg_To_Reg ( R8D, R8D ) "end" 0 EQ jcc [39;49m[33;40m_Compile_ADDI_DSP[39;49m[34;49m ( CELL )  _Compile_Move_Reg_To_StackN ( DSP, 0, R9D )  _Compile_IncDec_Reg ( DEC, R8D  .. [39;49m[32;49m
0x7ffff72feb76    4983c608                add r14, 0x8                                           [39;49m
[34;49m ..  0 EQ jcc _Compile_ADDI_DSP ( CELL )  [39;49m[33;40m_Compile_Move_Reg_To_StackN[39;49m[34;49m ( DSP, 0, R9D )  _Compile_IncDec_Reg ( DEC, R8D )  "start" goto "end" label  .. [39;49m[32;49m
0x7ffff72feb7a    4d890e                  mov [r14], r9                                          [39;49m
[34;49m .. rt" label  _Compile_TEST_Reg_To_Reg ( [39;49m[33;40mR8D[39;49m[34;49m, R8D ) "end" 0 EQ jcc _Compile_ADDI_DSP ( CELL )  _Compile_Move_Reg_To_StackN ( DSP, 0, R9D )  _Comp .. [39;49m[32;49m
0x7ffff72feb7d    49ffc8                  dec r8                                                 [39;49m
[34;49m .. pile_IncDec_Reg ( DEC, R8D )  "start" [39;49m[33;40mgoto[39;49m[34;49m "end" label asm;  .. [39;49m[32;49m
0x7ffff72feb80    e9e8ffffff              jmp 0x7ffff72feb6d         	< Stack.[34;49mndup[39;49m+10 >[39;49m
[34;49m ..  DEC, R8D )  "start" goto "end" label [39;49m[33;40masm;[39;49m[34;49m  .. [39;49m[32;49m
0x7ffff72feb85    c3                      ret                                                    [39;49m
Word_Disassemble : word - 'ndup' :: codeSize = 340x00007ffff72692380x00007ffff72feb6349718
Stack : word at namespaces/compiler/x64.cft : 497.18 :> [39;49mwdiss[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 497.021 : User :> [33;40msp[34;49m <: 0x00007ffff5bc87f8 :> [34;49m' ndup find wdiss [34;49m[33;40msp[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 498.002 : <literal> :> [33;40m7[34;49m <: 0x00007ffff5cf9908 :> [34;49m[34;49m[33;40m7[34;49m[34;49m ndup s 7 ndrop [34;49m 
Stack : word at namespaces/compiler/x64.cft : 498.2 :> [39;49m7[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000007[34;49m.
Literal :> 0x0000000000000007 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 498.007 : Stack :> [33;40mndup[34;49m <: 0x00007ffff5bc8d50 :> [34;49m7 [34;49m[33;40mndup[34;49m[34;49m s 7 ndrop [34;49m 
Stack : word at namespaces/compiler/x64.cft : 498.7 :> [39;49mndup[34;49m <: 6 cells pushed. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 498.009 : User :> [33;40ms[34;49m <: cprimitive :> [34;49m7 ndup [34;49m[33;40ms[34;49m[34;49m 7 ndrop [34;49m 
DataStack at : [34;49mnamespaces/compiler/x64.cft : 498.9[39;49m :
DataStack depth =  11 : Dsp (R14) = Top = 0x00007ffff7269250, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269250 > = 0x0000000000000005	
  DataStack   [  -1 ] < 0x00007ffff7269248 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269240 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269238 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269230 > = 0x0000000000000005	
  DataStack   [  -5 ] < 0x00007ffff7269228 > = 0x0000000000000005	
  DataStack   [  -6 ] < 0x00007ffff7269220 > = 0x0000000000000005	
  DataStack   [  -7 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -8 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -9 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [ -10 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[i]  :: [34;49m...[34;49m : 498.011 : <literal> :> [33;40m7[34;49m <: 0x00007ffff5cf9ad0 :> [34;49m7 ndup s [34;49m[33;40m7[34;49m[34;49m ndrop [34;49m 
Stack : word at namespaces/compiler/x64.cft : 498.11 :> [39;49m7[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000007[34;49m.
Literal :> 0x0000000000000007 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 498.017 : Root :> [33;40mndrop[34;49m <: cprimitive :> [34;49m7 ndup s 7 [34;49m[33;40mndrop[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 498.17 :> [39;49mndrop[34;49m <: 8 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 499.002 : User :> [33;40ms[34;49m <: cprimitive :> [34;49m[34;49m[33;40ms[34;49m[34;49m [34;49m 
DataStack at : [34;49mnamespaces/compiler/x64.cft : 499.2[39;49m :
DataStack depth =   4 : Dsp (R14) = Top = 0x00007ffff7269218, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -1 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[i]  :: [34;49m...[34;49m : 500.004 : Root :> [33;40mAsm[34;49m <: 0x00007ffff7299730 :> [34;49m[34;49m[33;40mAsm[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 501.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m following intel conventions in the naming : insn dst, src [34;49m 
dbg[i]  :: [34;49m...[34;49m : 503.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m MOV8rm ( _reg, ptr, disp ) // 8 bit disp [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 503.28[32;49m
0x7ffff72feb86    e900000000              jmp 0x7ffff72feb8b         	< C compiler code >        [34;49m[32;49m
0x7ffff72feb8b    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72feb8f    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72feb93    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 503.28 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc94a8[34;49m.
dbg[c]  :: [34;49m...[34;49m : 503.031 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m: MOV8rm ( _reg, ptr, disp ) [34;49m[33;40m//[34;49m[34;49m 8 bit disp [34;49m 
dbg[c]  :: [34;49m...[34;49m : 505.018 : void :> [33;40m_Compile_Move[34;49m <: 0x00007ffff5c859c0 :> [34;49m    [34;49m[33;40m_Compile_Move[34;49m[34;49m ( REG, MEM, _reg @, ptr @, disp @ ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 505.023 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b6f20 :> [34;49m    _Compile_Move ( [34;49m[33;40mREG[34;49m[34;49m, MEM, _reg @, ptr @, disp @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 505.23
[34;49m .. m ( _reg, ptr, disp ) _Compile_Move ( [34;49m[33;40mREG[34;49m[34;49m[34;49m[32;49m
0x7ffff72feb9a    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72feba4    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72feba8    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 505.028 : X64 :> [33;40mMEM[34;49m <: 0x00007ffff74b7640 :> [34;49m    _Compile_Move ( REG, [34;49m[33;40mMEM[34;49m[34;49m, _reg @, ptr @, disp @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMEM[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 505.28
[34;49m .. reg, ptr, disp ) _Compile_Move ( REG, [34;49m[33;40mMEM[34;49m[34;49m[34;49m[32;49m
0x7ffff72febab    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72febb5    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72febb9    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 505.035 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5bc9870 :> [34;49m    _Compile_Move ( REG, MEM, [34;49m[33;40m_reg[34;49m[34;49m @, ptr @, disp @ ) [34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 505.35
[34;49m .. ptr, disp ) _Compile_Move ( REG, MEM, [34;49m[33;40m_reg[34;49m[34;49m [34;49m[32;49m
0x7ffff72febbc    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72febc0    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72febc4    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 505.036 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Move ( REG, MEM, _reg [34;49m[33;40m@[34;49m[34;49m, ptr @, disp @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 505.36
[34;49m .. disp ) _Compile_Move ( REG, MEM, _reg [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72febbc    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72febc0    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72febc4    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 505.042 : locals_0 :> [33;40mptr[34;49m <: 0x00007ffff5bc9a38 :> [34;49m    _Compile_Move ( REG, MEM, _reg @, [34;49m[33;40mptr[34;49m[34;49m @, disp @ ) [34;49m 
_Do_C_Syntax_Variable : word = ptr :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mptr[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 505.42
[34;49m .. p ) _Compile_Move ( REG, MEM, _reg @, [34;49m[33;40mptr[34;49m[34;49m [34;49m[32;49m
0x7ffff72febc7    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72febcb    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72febcf    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 505.043 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Move ( REG, MEM, _reg @, ptr [34;49m[33;40m@[34;49m[34;49m, disp @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 505.43
[34;49m .. _Compile_Move ( REG, MEM, _reg @, ptr [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72febc7    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72febcb    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72febcf    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 505.050 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5bc9c00 :> [34;49m    _Compile_Move ( REG, MEM, _reg @, ptr @, [34;49m[33;40mdisp[34;49m[34;49m @ ) [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 505.50
[34;49m .. mpile_Move ( REG, MEM, _reg @, ptr @, [34;49m[33;40mdisp[34;49m[34;49m [34;49m[32;49m
0x7ffff72febd2    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72febd6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72febda    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 505.052 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Move ( REG, MEM, _reg @, ptr @, disp [34;49m[33;40m@[34;49m[34;49m ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 505.52
[34;49m .. _Move ( REG, MEM, _reg @, ptr @, disp [34;49m[33;40m@[34;49m[34;49m [34;49m[32;49m
0x7ffff72febd2    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72febd6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72febda    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 505.053 : void :> [33;40m_Compile_Move[34;49m <: 0x00007ffff5c859c0 :> [34;49m    [34;49m[33;40m_Compile_Move[34;49m[34;49m ( REG, MEM, _reg @, ptr @, disp @ ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 505.53[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5bc9c00	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5bc9a38	< word : locals_0.[34;49mptr[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5bc9870	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b7640	< word : X64.[34;49mMEM[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff74b6f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
type match :: void._Compile_Move :: type expected : Integer  :: type recorded : Integer . Integer . Undefined . Undefined . Undefined  : namespaces/compiler/x64.cft : 505.53
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 505.53
[34;49m ..          : MOV8rm ( _reg, ptr, disp ) [34;49m[33;40m_Compile_Move[34;49m[34;49m ( REG, MEM, _reg @, ptr @, disp @ ) .. [34;49m[32;49m
0x7ffff72febdd    49b905dd2ff7ff7f0000    mov r9, 0x7ffff72fdd05                                 [34;49m[32;49m
0x7ffff72febe7    49ffd1                  call r9                    	< void.[39;49m_Compile_Move[34;49m : 0x00007ffff72fdd05 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 506.003 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b5d18 :> [34;49m[34;49m[33;40m;;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 506.3
[34;49m ..  ( REG, MEM, _reg @, ptr @, disp @ )  [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72febea    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72febee    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72febf2    4983ee18                sub r14, 0x18                                          [34;49m[32;49m
0x7ffff72febf6    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 506.3 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 507.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m move mem to _reg : 32 bit offset [34;49m 
dbg[i]  :: [34;49m...[34;49m : 508.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m MOV32rm ( _reg, ptr, disp ) // 32 bit disp [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 508.29[32;49m
0x7ffff72febf7    e900000000              jmp 0x7ffff72febfc         	< C compiler code >        [34;49m[32;49m
0x7ffff72febfc    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fec00    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fec04    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 508.29 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bca158[34;49m.
dbg[c]  :: [34;49m...[34;49m : 508.032 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m: MOV32rm ( _reg, ptr, disp ) [34;49m[33;40m//[34;49m[34;49m 32 bit disp [34;49m 
dbg[c]  :: [34;49m...[34;49m : 510.018 : void :> [33;40m_Compile_Move[34;49m <: 0x00007ffff5c859c0 :> [34;49m    [34;49m[33;40m_Compile_Move[34;49m[34;49m ( REG, MEM32, _reg @, ptr @, disp @ ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 510.023 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b6f20 :> [34;49m    _Compile_Move ( [34;49m[33;40mREG[34;49m[34;49m, MEM32, _reg @, ptr @, disp @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 510.23
[34;49m .. m ( _reg, ptr, disp ) _Compile_Move ( [34;49m[33;40mREG[34;49m[34;49m[34;49m[32;49m
0x7ffff72fec0b    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fec15    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fec19    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 510.030 : X64 :> [33;40mMEM32[34;49m <: 0x00007ffff74b72b0 :> [34;49m    _Compile_Move ( REG, [34;49m[33;40mMEM32[34;49m[34;49m, _reg @, ptr @, disp @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMEM32[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 510.30
[34;49m .. reg, ptr, disp ) _Compile_Move ( REG, [34;49m[33;40mMEM32[34;49m[34;49m[34;49m[32;49m
0x7ffff72fec1c    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fec26    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fec2a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 510.037 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5bc9dc8 :> [34;49m    _Compile_Move ( REG, MEM32, [34;49m[33;40m_reg[34;49m[34;49m @, ptr @, disp @ ) [34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 510.37
[34;49m .. r, disp ) _Compile_Move ( REG, MEM32, [34;49m[33;40m_reg[34;49m[34;49m [34;49m[32;49m
0x7ffff72fec2d    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fec31    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fec35    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 510.038 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Move ( REG, MEM32, _reg [34;49m[33;40m@[34;49m[34;49m, ptr @, disp @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 510.38
[34;49m .. sp ) _Compile_Move ( REG, MEM32, _reg [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fec2d    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fec31    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fec35    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 510.044 : locals_0 :> [33;40mptr[34;49m <: 0x00007ffff5bca358 :> [34;49m    _Compile_Move ( REG, MEM32, _reg @, [34;49m[33;40mptr[34;49m[34;49m @, disp @ ) [34;49m 
_Do_C_Syntax_Variable : word = ptr :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mptr[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 510.44
[34;49m .. ) _Compile_Move ( REG, MEM32, _reg @, [34;49m[33;40mptr[34;49m[34;49m [34;49m[32;49m
0x7ffff72fec38    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fec3c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fec40    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 510.045 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Move ( REG, MEM32, _reg @, ptr [34;49m[33;40m@[34;49m[34;49m, disp @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 510.45
[34;49m .. ompile_Move ( REG, MEM32, _reg @, ptr [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fec38    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fec3c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fec40    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 510.052 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5bca520 :> [34;49m    _Compile_Move ( REG, MEM32, _reg @, ptr @, [34;49m[33;40mdisp[34;49m[34;49m @ ) [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 510.52
[34;49m .. ile_Move ( REG, MEM32, _reg @, ptr @, [34;49m[33;40mdisp[34;49m[34;49m [34;49m[32;49m
0x7ffff72fec43    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fec47    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fec4b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 510.054 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Move ( REG, MEM32, _reg @, ptr @, disp [34;49m[33;40m@[34;49m[34;49m ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 510.54
[34;49m .. ove ( REG, MEM32, _reg @, ptr @, disp [34;49m[33;40m@[34;49m[34;49m [34;49m[32;49m
0x7ffff72fec43    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fec47    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fec4b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 510.055 : void :> [33;40m_Compile_Move[34;49m <: 0x00007ffff5c859c0 :> [34;49m    [34;49m[33;40m_Compile_Move[34;49m[34;49m ( REG, MEM32, _reg @, ptr @, disp @ ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 510.55[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5bca520	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5bca358	< word : locals_0.[34;49mptr[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5bc9dc8	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b72b0	< word : X64.[34;49mMEM32[39;49m : value = 0x0000000000000002 > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff74b6f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
type match :: void._Compile_Move :: type expected : Integer  :: type recorded : Integer . Integer . Undefined . Undefined . Undefined  : namespaces/compiler/x64.cft : 510.55
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 510.55
[34;49m ..         : MOV32rm ( _reg, ptr, disp ) [34;49m[33;40m_Compile_Move[34;49m[34;49m ( REG, MEM32, _reg @, ptr @, disp @ ) .. [34;49m[32;49m
0x7ffff72fec4e    49b905dd2ff7ff7f0000    mov r9, 0x7ffff72fdd05                                 [34;49m[32;49m
0x7ffff72fec58    49ffd1                  call r9                    	< void.[39;49m_Compile_Move[34;49m : 0x00007ffff72fdd05 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 511.003 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b5d18 :> [34;49m[34;49m[33;40m;;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 511.3
[34;49m ..  REG, MEM32, _reg @, ptr @, disp @ )  [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fec5b    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fec5f    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fec63    4983ee18                sub r14, 0x18                                          [34;49m[32;49m
0x7ffff72fec67    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 511.3 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 512.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m MOVmr ( ptr, disp, _reg ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 512.27[32;49m
0x7ffff72fec68    e900000000              jmp 0x7ffff72fec6d         	< C compiler code >        [34;49m[32;49m
0x7ffff72fec6d    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fec71    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fec75    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 512.27 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bcaa78[34;49m.
dbg[c]  :: [34;49m...[34;49m : 513.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49m _Compile_Move ( toRegOrMem _mod _reg rm disp ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 514.018 : void :> [33;40m_Compile_Move[34;49m <: 0x00007ffff5c859c0 :> [34;49m    [34;49m[33;40m_Compile_Move[34;49m[34;49m ( MEM, MEM, _reg @, ptr @, disp @ ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 514.023 : X64 :> [33;40mMEM[34;49m <: 0x00007ffff74b7640 :> [34;49m    _Compile_Move ( [34;49m[33;40mMEM[34;49m[34;49m, MEM, _reg @, ptr @, disp @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMEM[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 514.23
[34;49m .. r ( ptr, disp, _reg ) _Compile_Move ( [34;49m[33;40mMEM[34;49m[34;49m[34;49m[32;49m
0x7ffff72fec7c    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fec86    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fec8a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 514.035 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5bcae40 :> [34;49m    _Compile_Move ( MEM, MEM, [34;49m[33;40m_reg[34;49m[34;49m @, ptr @, disp @ ) [34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 514.35
[34;49m .. isp, _reg ) _Compile_Move ( MEM, MEM, [34;49m[33;40m_reg[34;49m[34;49m [34;49m[32;49m
0x7ffff72fec9e    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72feca2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72feca6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 514.036 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Move ( MEM, MEM, _reg [34;49m[33;40m@[34;49m[34;49m, ptr @, disp @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 514.36
[34;49m .. _reg ) _Compile_Move ( MEM, MEM, _reg [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fec9e    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72feca2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72feca6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 514.042 : locals_0 :> [33;40mptr[34;49m <: 0x00007ffff5bca6e8 :> [34;49m    _Compile_Move ( MEM, MEM, _reg @, [34;49m[33;40mptr[34;49m[34;49m @, disp @ ) [34;49m 
_Do_C_Syntax_Variable : word = ptr :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mptr[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 514.42
[34;49m .. g ) _Compile_Move ( MEM, MEM, _reg @, [34;49m[33;40mptr[34;49m[34;49m [34;49m[32;49m
0x7ffff72feca9    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fecad    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fecb1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 514.043 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Move ( MEM, MEM, _reg @, ptr [34;49m[33;40m@[34;49m[34;49m, disp @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 514.43
[34;49m .. _Compile_Move ( MEM, MEM, _reg @, ptr [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72feca9    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fecad    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fecb1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 514.050 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5bcac78 :> [34;49m    _Compile_Move ( MEM, MEM, _reg @, ptr @, [34;49m[33;40mdisp[34;49m[34;49m @ ) [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 514.50
[34;49m .. mpile_Move ( MEM, MEM, _reg @, ptr @, [34;49m[33;40mdisp[34;49m[34;49m [34;49m[32;49m
0x7ffff72fecb4    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fecb8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fecbc    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 514.052 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Move ( MEM, MEM, _reg @, ptr @, disp [34;49m[33;40m@[34;49m[34;49m ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 514.52
[34;49m .. _Move ( MEM, MEM, _reg @, ptr @, disp [34;49m[33;40m@[34;49m[34;49m [34;49m[32;49m
0x7ffff72fecb4    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fecb8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fecbc    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 514.053 : void :> [33;40m_Compile_Move[34;49m <: 0x00007ffff5c859c0 :> [34;49m    [34;49m[33;40m_Compile_Move[34;49m[34;49m ( MEM, MEM, _reg @, ptr @, disp @ ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 514.53[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5bcac78	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5bca6e8	< word : locals_0.[34;49mptr[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5bcae40	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5bcb008	< word : X64.[34;49mMEM[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff74b7640	< word : X64.[34;49mMEM[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: void._Compile_Move :: type expected : Integer  :: type recorded : Integer . Integer . Undefined . Undefined . Undefined  : namespaces/compiler/x64.cft : 514.53
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 514.53
[34;49m ..           : MOVmr ( ptr, disp, _reg ) [34;49m[33;40m_Compile_Move[34;49m[34;49m ( MEM, MEM, _reg @, ptr @, disp @ ) .. [34;49m[32;49m
0x7ffff72fecbf    49b905dd2ff7ff7f0000    mov r9, 0x7ffff72fdd05                                 [34;49m[32;49m
0x7ffff72fecc9    49ffd1                  call r9                    	< void.[39;49m_Compile_Move[34;49m : 0x00007ffff72fdd05 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 515.003 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b5d18 :> [34;49m[34;49m[33;40m;;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 515.3
[34;49m ..  ( MEM, MEM, _reg @, ptr @, disp @ )  [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72feccc    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fecd0    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fecd4    4983ee18                sub r14, 0x18                                          [34;49m[32;49m
0x7ffff72fecd8    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 515.3 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 516.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m move _reg to _reg [34;49m 
dbg[i]  :: [34;49m...[34;49m : 517.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m MOVrr ( dstReg, srcReg ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 517.26[32;49m
0x7ffff72fecd9    e900000000              jmp 0x7ffff72fecde         	< C compiler code >        [34;49m[32;49m
0x7ffff72fecde    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fece2    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fece6    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 517.26 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bcb560[34;49m.
dbg[c]  :: [34;49m...[34;49m : 518.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49m _Compile_Move ( toRegOrMem _mod _reg rm disp | opCode ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 519.018 : void :> [33;40m_Compile_Move[34;49m <: 0x00007ffff5c859c0 :> [34;49m    [34;49m[33;40m_Compile_Move[34;49m[34;49m ( REG, REG, dstReg @, srcReg @, 0 ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 519.023 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b6f20 :> [34;49m    _Compile_Move ( [34;49m[33;40mREG[34;49m[34;49m, REG, dstReg @, srcReg @, 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 519.23
[34;49m .. rr ( dstReg, srcReg ) _Compile_Move ( [34;49m[33;40mREG[34;49m[34;49m[34;49m[32;49m
0x7ffff72feced    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fecf7    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fecfb    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 519.037 : locals_0 :> [33;40mdstReg[34;49m <: 0x00007ffff5bcb1d0 :> [34;49m    _Compile_Move ( REG, REG, [34;49m[33;40mdstReg[34;49m[34;49m @, srcReg @, 0 ) [34;49m 
_Do_C_Syntax_Variable : word = dstReg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdstReg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 519.37
[34;49m .. g, srcReg ) _Compile_Move ( REG, REG, [34;49m[33;40mdstReg[34;49m[34;49m [34;49m[32;49m
0x7ffff72fed0f    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fed13    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fed17    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 519.038 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Move ( REG, REG, dstReg [34;49m[33;40m@[34;49m[34;49m, srcReg @, 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 519.38
[34;49m .. eg ) _Compile_Move ( REG, REG, dstReg [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fed0f    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fed13    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fed17    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 519.047 : locals_0 :> [33;40msrcReg[34;49m <: 0x00007ffff5bcb008 :> [34;49m    _Compile_Move ( REG, REG, dstReg @, [34;49m[33;40msrcReg[34;49m[34;49m @, 0 ) [34;49m 
_Do_C_Syntax_Variable : word = srcReg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msrcReg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 519.47
[34;49m .. ) _Compile_Move ( REG, REG, dstReg @, [34;49m[33;40msrcReg[34;49m[34;49m [34;49m[32;49m
0x7ffff72fed1a    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fed1e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fed22    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 519.048 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Move ( REG, REG, dstReg @, srcReg [34;49m[33;40m@[34;49m[34;49m, 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 519.48
[34;49m .. ile_Move ( REG, REG, dstReg @, srcReg [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fed1a    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fed1e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fed22    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 519.052 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7386701 :> [34;49m    _Compile_Move ( REG, REG, dstReg @, srcReg @, [34;49m[33;40m0[34;49m[34;49m ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 519.52
[34;49m .. _Move ( REG, REG, dstReg @, srcReg @, [34;49m[33;40m0[34;49m[34;49m [34;49m[32;49m
0x7ffff72fed25    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fed2f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fed33    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 519.053 : void :> [33;40m_Compile_Move[34;49m <: 0x00007ffff5c859c0 :> [34;49m    [34;49m[33;40m_Compile_Move[34;49m[34;49m ( REG, REG, dstReg @, srcReg @, 0 ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 519.53[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff7386701	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5bcb008	< word : locals_0.[34;49msrcReg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5bcb1d0	< word : locals_0.[34;49mdstReg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5bcb760	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff74b6f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
type match :: void._Compile_Move :: type expected : Integer  :: type recorded : Integer . Integer . Undefined . Undefined . Integer  : namespaces/compiler/x64.cft : 519.53
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 519.53
[34;49m ..            : MOVrr ( dstReg, srcReg ) [34;49m[33;40m_Compile_Move[34;49m[34;49m ( REG, REG, dstReg @, srcReg @, 0 ) .. [34;49m[32;49m
0x7ffff72fed36    49b905dd2ff7ff7f0000    mov r9, 0x7ffff72fdd05                                 [34;49m[32;49m
0x7ffff72fed40    49ffd1                  call r9                    	< void.[39;49m_Compile_Move[34;49m : 0x00007ffff72fdd05 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 520.003 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b5d18 :> [34;49m[34;49m[33;40m;;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 520.3
[34;49m ..  ( REG, REG, dstReg @, srcReg @, 0 )  [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fed43    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fed47    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fed4b    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fed4f    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 520.3 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 521.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mendif // x64_dbg [34;49m 
dbg[i]  :: [34;49m...[34;49m : 521.007 : PreProcessor :> [33;40mendif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mendif[34;49m[34;49m // x64_dbg [34;49m 
dbg[i]  :: [34;49m...[34;49m : 521.009 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m#endif [34;49m[33;40m//[34;49m[34;49m x64_dbg [34;49m 
dbg[i]  :: [34;49m...[34;49m : 523.009 : Compiler :> [33;40minfixOff[34;49m <: cprimitive :> [34;49m[34;49m[33;40minfixOff[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 525.003 : User :> [33;40msp[34;49m <: 0x00007ffff5bc87f8 :> [34;49m[34;49m[33;40msp[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 526.002 : <literal> :> [33;40m2[34;49m <: 0x00007ffff5cf9c98 :> [34;49m[34;49m[33;40m2[34;49m[34;49m + 7 assertStkChk // stack checking [34;49m 
Stack : word at namespaces/compiler/x64.cft : 526.2 :> [39;49m2[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
Literal :> 0x0000000000000002 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 526.004 : Int :> [33;40m+[34;49m <: cprimitive :> [34;49m2 [34;49m[33;40m+[34;49m[34;49m 7 assertStkChk // stack checking [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 526.4[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5cf9c98	< word : <literal>.[34;49m2[39;49m : value = 0x0000000000000002 > : [34;49mInteger [39;49m
type match :: Int.+ :: type expected : Integer . Integer  :: type recorded : Integer  : namespaces/compiler/x64.cft : 526.4
Stack : word at namespaces/compiler/x64.cft : 526.4 :> [39;49m+[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000007[34;49m.
dbg[i]  :: [34;49m...[34;49m : 526.006 : <literal> :> [33;40m7[34;49m <: 0x00007ffff5cf9e60 :> [34;49m2 + [34;49m[33;40m7[34;49m[34;49m assertStkChk // stack checking [34;49m 
Stack : word at namespaces/compiler/x64.cft : 526.6 :> [39;49m7[34;49m <: 1 cell pushed. TOS set to [39;49m0x0000000000000007[34;49m.
Literal :> 0x0000000000000007 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 526.019 : System :> [33;40massertStkChk[34;49m <: 0x00007ffff7202810 :> [34;49m2 + 7 [34;49m[33;40massertStkChk[34;49m[34;49m // stack checking [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 526.19[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5cf9e60	< word : <literal>.[34;49m7[39;49m : value = 0x0000000000000007 > : [34;49mInteger [39;49m
type match :: System.assertStkChk :: type expected :  :: type recorded : Integer  : namespaces/compiler/x64.cft : 526.19
Stack : word at namespaces/compiler/x64.cft : 526.19 :> [39;49massertStkChk[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 526.021 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m2 + 7 assertStkChk [34;49m[33;40m//[34;49m[34;49m stack checking [34;49m 
dbg[i]  :: [34;49m...[34;49m : 527.007 : Io :> [33;40mlogOff[34;49m <: cprimitive :> [34;49m[34;49m[33;40mlogOff[34;49m[34;49m [34;49m 