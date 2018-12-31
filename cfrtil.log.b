
dbg[i]  :: [34;49m...[34;49m : 040.002 : Root :> [33;40mC[34;49m <: 0x00007ffff7fa0dc8 :> [34;49m[34;49m[33;40mC[34;49m[34;49m [34;49m 
Debugger :: Starting AutoMode : automatically repeating key :: 'e' ...
dbg[i]  :: [34;49m...[34;49m : 040.002 : Root :> [33;40mC[34;49m <: 0x00007ffff7fa0dc8 :> [34;49m[34;49m[33;40mC[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 041.009 : Namespaces :> [33;40mCompiler[34;49m <: 0x00007ffff7fa6980 :> [34;49m[34;49m[33;40mCompiler[34;49m[34;49m Compiling C Asm [34;49m 
dbg[i]  :: [34;49m...[34;49m : 041.019 : Compiler :> [33;40mCompiling[34;49m <: 0x00007ffff7289c28 :> [34;49mCompiler [34;49m[33;40mCompiling[34;49m[34;49m C Asm [34;49m 
dbg[i]  :: [34;49m...[34;49m : 041.021 : Root :> [33;40mC[34;49m <: 0x00007ffff7fa0dc8 :> [34;49mCompiler Compiling [34;49m[33;40mC[34;49m[34;49m Asm [34;49m 
dbg[i]  :: [34;49m...[34;49m : 041.025 : Root :> [33;40mAsm[34;49m <: 0x00007ffff7299730 :> [34;49mCompiler Compiling C [34;49m[33;40mAsm[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 042.002 : Interpreter :> [33;40m:[34;49m <: 0x00007ffff72952f0 :> [34;49m[34;49m[33;40m:[34;49m[34;49m :asm compileModeOn sourceCodeInit token create begin ' {| find compileWord source[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 42.7[32;49m
0x7ffff72fd08f    e900000000              jmp 0x7ffff72fd094         	< C compiler code >        [34;49m
[34;49m ..                                     : [34;49m[33;40m:asm[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd094    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd098    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd09c    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 42.7 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff74b2268[34;49m.
dbg[c]  :: [34;49m...[34;49m : 042.021 : Interpreter :> [33;40mcompileModeOn[34;49m <: cprimitive :> [34;49m: :asm [34;49m[33;40mcompileModeOn[34;49m[34;49m sourceCodeInit token create begin ' {| find compileWord so[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompileModeOn[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 42.21
[34;49m ..                                : :asm [34;49m[33;40mcompileModeOn[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd0a3    49b8e6af5b5555550000    mov r8, 0x5555555bafe6                                 [34;49m[32;49m
0x7ffff72fd0ad    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd0b7    49ffd1                  call r9                    	< Interpreter.[39;49mcompileModeOn[34;49m : 0x00005555555bafe6 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 042.036 : Compiler :> [33;40msourceCodeInit[34;49m <: cprimitive :> [34;49m: :asm compileModeOn [34;49m[33;40msourceCodeInit[34;49m[34;49m token create begin ' {| find compileWord sour[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msourceCodeInit[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 42.36
[34;49m ..                  : :asm compileModeOn [34;49m[33;40msourceCodeInit[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd0ba    49b89c245a5555550000    mov r8, 0x5555555a249c                                 [34;49m[32;49m
0x7ffff72fd0c4    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd0ce    49ffd1                  call r9                    	< Compiler.[39;49msourceCodeInit[34;49m : 0x00005555555a249c >[34;49m
dbg[c]  :: [34;49m...[34;49m : 042.042 : Compiler :> [33;40mtoken[34;49m <: cprimitive :> [34;49m: :asm compileModeOn sourceCodeInit [34;49m[33;40mtoken[34;49m[34;49m create begin ' {| find compileWord sourceCodeOn [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mtoken[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 42.42
[34;49m ..   : :asm compileModeOn sourceCodeInit [34;49m[33;40mtoken[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd0d1    49b8b98d5b5555550000    mov r8, 0x5555555b8db9                                 [34;49m[32;49m
0x7ffff72fd0db    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd0e5    49ffd1                  call r9                    	< Compiler.[39;49mtoken[34;49m : 0x00005555555b8db9 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 042.049 : Word :> [33;40mcreate[34;49m <: cprimitive :> [34;49m: :asm compileModeOn sourceCodeInit token [34;49m[33;40mcreate[34;49m[34;49m begin ' {| find compileWord sourceCodeOn ; i[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcreate[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 42.49
[34;49m: :asm compileModeOn sourceCodeInit token [34;49m[33;40mcreate[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd0e8    49b8c2b35b5555550000    mov r8, 0x5555555bb3c2                                 [34;49m[32;49m
0x7ffff72fd0f2    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd0fc    49ffd1                  call r9                    	< Word.[39;49mcreate[34;49m : 0x00005555555bb3c2 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 042.055 : Compiler :> [33;40mbegin[34;49m <: cprimitive :> [34;49mcompileModeOn sourceCodeInit token create [34;49m[33;40mbegin[34;49m[34;49m ' {| find compileWord sourceCodeOn ; immed[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mbegin[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 42.55
[34;49m .. ileModeOn sourceCodeInit token create [34;49m[33;40mbegin[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd0ff    49b894de575555550000    mov r8, 0x55555557de94                                 [34;49m[32;49m
0x7ffff72fd109    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd113    49ffd1                  call r9                    	< Compiler.[39;49mbegin[34;49m : 0x000055555557de94 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 042.056 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49mileModeOn sourceCodeInit token create begin [34;49m[33;40m'[34;49m[34;49m {| find compileWord sourceCodeOn ; immediate[34;49m 
Stack : word at namespaces/compiler/x64.cft : 42.60 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7463bce[34;49m.
dbg[c]  :: [34;49m...[34;49m : 042.065 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49modeOn sourceCodeInit token create begin ' {| [34;49m[33;40mfind[34;49m[34;49m compileWord sourceCodeOn ; immediate [34;49m 
Stack : word at namespaces/compiler/x64.cft : 42.65 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff7284a38[34;49m.
dbg[c]  :: [34;49m...[34;49m : 042.077 : Compiler :> [33;40mcompileWord[34;49m <: cprimitive :> [34;49mOn sourceCodeInit token create begin ' {| find [34;49m[33;40mcompileWord[34;49m[34;49m sourceCodeOn ; immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompileWord[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 42.77
[34;49m .. CodeInit token create begin ' {| find [34;49m[33;40mcompileWord[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd116    49b87baf5b5555550000    mov r8, 0x5555555baf7b                                 [34;49m[32;49m
0x7ffff72fd120    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd12a    49ffd1                  call r9                    	< Interpreter.[39;49mcompileModeOff[34;49m : 0x00005555555baf7b >[34;49m
Stack : word at namespaces/compiler/x64.cft : 42.77 :> [39;49mcompileWord[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff74b2268[34;49m.
dbg[c]  :: [34;49m...[34;49m : 042.090 : Compiler :> [33;40msourceCodeOn[34;49m <: cprimitive :> [34;49mn sourceCodeInit token create begin ' {| find compileWord [34;49m[33;40msourceCodeOn[34;49m[34;49m ; immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msourceCodeOn[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 42.90
[34;49m .. en create begin ' {| find compileWord [34;49m[33;40msourceCodeOn[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd12d    49b8f2245a5555550000    mov r8, 0x5555555a24f2                                 [34;49m[32;49m
0x7ffff72fd137    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd141    49ffd1                  call r9                    	< Compiler.[39;49msourceCodeOn[34;49m : 0x00005555555a24f2 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 042.092 : Interpreter :> [33;40m;[34;49m <: 0x00007ffff7294bd0 :> [34;49mn sourceCodeInit token create begin ' {| find compileWord sourceCodeOn [34;49m[33;40m;[34;49m[34;49m immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 42.92
[34;49m .. in ' {| find compileWord sourceCodeOn [34;49m[33;40m;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd144    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 42.92 :> [39;49m;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 042.102 : Compiler :> [33;40mimmediate[34;49m <: cprimitive :> [34;49mdeOn sourceCodeInit token create begin ' {| find compileWord sourceCodeOn ; [34;49m[33;40mimmediate[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 043.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m: :asm compileModeOn sourceCodeInit token create begin ' {| find compileWord ; immediate[34;49m 
dbg[i]  :: [34;49m...[34;49m : 044.002 : Interpreter :> [33;40m:[34;49m <: 0x00007ffff72952f0 :> [34;49m[34;49m[33;40m:[34;49m[34;49m asm; semi ' {| find compileWord ; immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 44.7[32;49m
0x7ffff72fd145    e900000000              jmp 0x7ffff72fd14a         	< C compiler code >        [34;49m
[34;49m ..                                     : [34;49m[33;40masm;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd14a    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd14e    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd152    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 44.7 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff74b2430[34;49m.
dbg[c]  :: [34;49m...[34;49m : 044.012 : Interpreter :> [33;40msemi[34;49m <: 0x00007ffff7294a08 :> [34;49m: asm; [34;49m[33;40msemi[34;49m[34;49m ' {| find compileWord ; immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msemi[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 44.12
[34;49m ..                                : asm; [34;49m[33;40msemi[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd159    49b946372ff7ff7f0000    mov r9, 0x7ffff72f3746                                 [34;49m[32;49m
0x7ffff72fd163    49ffd1                  call r9                    	< Interpreter.[39;49m;[34;49m : 0x00007ffff72f3746 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 044.013 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m: asm; semi [34;49m[33;40m'[34;49m[34;49m {| find compileWord ; immediate [34;49m 
Stack : word at namespaces/compiler/x64.cft : 44.17 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7463c0c[34;49m.
dbg[c]  :: [34;49m...[34;49m : 044.022 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m: asm; semi ' {| [34;49m[33;40mfind[34;49m[34;49m compileWord ; immediate [34;49m 
Stack : word at namespaces/compiler/x64.cft : 44.22 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff7284a38[34;49m.
dbg[c]  :: [34;49m...[34;49m : 044.034 : Compiler :> [33;40mcompileWord[34;49m <: cprimitive :> [34;49m: asm; semi ' {| find [34;49m[33;40mcompileWord[34;49m[34;49m ; immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompileWord[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 44.34
[34;49m ..                 : asm; semi ' {| find [34;49m[33;40mcompileWord[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd166    49b87baf5b5555550000    mov r8, 0x5555555baf7b                                 [34;49m[32;49m
0x7ffff72fd170    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd17a    49ffd1                  call r9                    	< Interpreter.[39;49mcompileModeOff[34;49m : 0x00005555555baf7b >[34;49m
Stack : word at namespaces/compiler/x64.cft : 44.34 :> [39;49mcompileWord[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff74b2430[34;49m.
dbg[c]  :: [34;49m...[34;49m : 044.036 : Interpreter :> [33;40m;[34;49m <: 0x00007ffff7294bd0 :> [34;49m: asm; semi ' {| find compileWord [34;49m[33;40m;[34;49m[34;49m immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 44.36
[34;49m ..     : asm; semi ' {| find compileWord [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd17d    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 44.36 :> [39;49m;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 044.046 : Compiler :> [33;40mimmediate[34;49m <: cprimitive :> [34;49m: asm; semi ' {| find compileWord ; [34;49m[33;40mimmediate[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 045.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m' :asm find winfo //sp [34;49m 
dbg[i]  :: [34;49m...[34;49m : 047.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mcompile1 '1, find alias // we can't use ',' as part of a word.name with C syntax [34;49m 
Stack : word at namespaces/compiler/x64.cft : 47.10 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7463c34[34;49m.
dbg[i]  :: [34;49m...[34;49m : 047.019 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m'compile1 '1, [34;49m[33;40mfind[34;49m[34;49m alias // we can't use ',' as part of a word.name with C syntax [34;49m 
Stack : word at namespaces/compiler/x64.cft : 47.19 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff7fa06a8[34;49m.
dbg[i]  :: [34;49m...[34;49m : 047.025 : Macro :> [33;40malias[34;49m <: cprimitive :> [34;49m'compile1 '1, find [34;49m[33;40malias[34;49m[34;49m // we can't use ',' as part of a word.name with C syntax [34;49m 
Stack : word at namespaces/compiler/x64.cft : 47.25 :> [39;49malias[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 047.027 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m'compile1 '1, find alias [34;49m[33;40m//[34;49m[34;49m we can't use ',' as part of a word.name with C syntax [34;49m 
dbg[i]  :: [34;49m...[34;49m : 048.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mcompile2 '2, find alias [34;49m 
Stack : word at namespaces/compiler/x64.cft : 48.10 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7463c52[34;49m.
dbg[i]  :: [34;49m...[34;49m : 048.019 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m'compile2 '2, [34;49m[33;40mfind[34;49m[34;49m alias [34;49m 
Stack : word at namespaces/compiler/x64.cft : 48.19 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff7fa0870[34;49m.
dbg[i]  :: [34;49m...[34;49m : 048.025 : Macro :> [33;40malias[34;49m <: cprimitive :> [34;49m'compile2 '2, find [34;49m[33;40malias[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 48.25 :> [39;49malias[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 049.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mcompile4 '4, find alias [34;49m 
Stack : word at namespaces/compiler/x64.cft : 49.10 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7463c6d[34;49m.
dbg[i]  :: [34;49m...[34;49m : 049.019 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m'compile4 '4, [34;49m[33;40mfind[34;49m[34;49m alias [34;49m 
Stack : word at namespaces/compiler/x64.cft : 49.19 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff7fa0318[34;49m.
dbg[i]  :: [34;49m...[34;49m : 049.025 : Macro :> [33;40malias[34;49m <: cprimitive :> [34;49m'compile4 '4, find [34;49m[33;40malias[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 49.25 :> [39;49malias[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 050.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mcompile8 '8, find alias [34;49m 
Stack : word at namespaces/compiler/x64.cft : 50.10 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7463c88[34;49m.
dbg[i]  :: [34;49m...[34;49m : 050.019 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m'compile8 '8, [34;49m[33;40mfind[34;49m[34;49m alias [34;49m 
Stack : word at namespaces/compiler/x64.cft : 50.19 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff7fa04e0[34;49m.
dbg[i]  :: [34;49m...[34;49m : 050.025 : Macro :> [33;40malias[34;49m <: cprimitive :> [34;49m'compile8 '8, find [34;49m[33;40malias[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 50.25 :> [39;49malias[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 051.002 : Interpreter :> [33;40m:[34;49m <: 0x00007ffff72952f0 :> [34;49m[34;49m[33;40m:[34;49m[34;49m ;; ' ; find compileWord ' _prefix find compileWord ; immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 51.5[32;49m
0x7ffff72fd17e    e900000000              jmp 0x7ffff72fd183         	< C compiler code >        [34;49m
[34;49m ..                                     : [34;49m[33;40m;;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd183    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd187    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd18b    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 51.5 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff74b2d18[34;49m.
dbg[c]  :: [34;49m...[34;49m : 051.006 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m: ;; [34;49m[33;40m'[34;49m[34;49m ; find compileWord ' _prefix find compileWord ; immediate [34;49m 
Stack : word at namespaces/compiler/x64.cft : 51.9 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7463ca8[34;49m.
dbg[c]  :: [34;49m...[34;49m : 051.014 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m: ;; ' ; [34;49m[33;40mfind[34;49m[34;49m compileWord ' _prefix find compileWord ; immediate [34;49m 
Stack : word at namespaces/compiler/x64.cft : 51.14 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff7294bd0[34;49m.
dbg[c]  :: [34;49m...[34;49m : 051.026 : Compiler :> [33;40mcompileWord[34;49m <: cprimitive :> [34;49m: ;; ' ; find [34;49m[33;40mcompileWord[34;49m[34;49m ' _prefix find compileWord ; immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompileWord[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 51.26
[34;49m ..                         : ;; ' ; find [34;49m[33;40mcompileWord[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd192    49b946372ff7ff7f0000    mov r9, 0x7ffff72f3746                                 [34;49m[32;49m
0x7ffff72fd19c    49ffd1                  call r9                    	< Interpreter.[39;49m;[34;49m : 0x00007ffff72f3746 >[34;49m
Stack : word at namespaces/compiler/x64.cft : 51.26 :> [39;49mcompileWord[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff74b2d18[34;49m.
dbg[c]  :: [34;49m...[34;49m : 051.027 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m: ;; ' ; find compileWord [34;49m[33;40m'[34;49m[34;49m _prefix find compileWord ; immediate [34;49m 
Stack : word at namespaces/compiler/x64.cft : 51.36 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7463cbd[34;49m.
dbg[c]  :: [34;49m...[34;49m : 051.041 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m: ;; ' ; find compileWord ' _prefix [34;49m[33;40mfind[34;49m[34;49m compileWord ; immediate [34;49m 
Stack : word at namespaces/compiler/x64.cft : 51.41 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff7287330[34;49m.
dbg[c]  :: [34;49m...[34;49m : 051.053 : Compiler :> [33;40mcompileWord[34;49m <: cprimitive :> [34;49m: ;; ' ; find compileWord ' _prefix find [34;49m[33;40mcompileWord[34;49m[34;49m ; immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompileWord[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 51.53[32;49m
0x7ffff72fd19f    49b885b85b5555550000    mov r8, 0x5555555bb885                                 [34;49m[32;49m
0x7ffff72fd1a9    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd1b3    49ffd1                  call r9                    	< Compiler.[39;49mprefix[34;49m : 0x00005555555bb885 >[34;49m
Stack : word at namespaces/compiler/x64.cft : 51.53 :> [39;49mcompileWord[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff74b2d18[34;49m.
dbg[c]  :: [34;49m...[34;49m : 051.055 : Interpreter :> [33;40m;[34;49m <: 0x00007ffff7294bd0 :> [34;49m: ;; ' ; find compileWord ' _prefix find compileWord [34;49m[33;40m;[34;49m[34;49m immediate [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 51.55
[34;49m .. ompileWord ' _prefix find compileWord [34;49m[33;40m;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd1b6    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 51.55 :> [39;49m;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 051.065 : Compiler :> [33;40mimmediate[34;49m <: cprimitive :> [34;49m: ;; ' ; find compileWord ' _prefix find compileWord ; [34;49m[33;40mimmediate[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 052.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m C : ;; ' ;; find compileWord ; immediate [34;49m 
dbg[i]  :: [34;49m...[34;49m : 054.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mX64 namespace [34;49m 
Stack : word at namespaces/compiler/x64.cft : 54.5 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7463cea[34;49m.
dbg[i]  :: [34;49m...[34;49m : 054.015 : Namespace :> [33;40mnamespace[34;49m <: cprimitive :> [34;49m'X64 [34;49m[33;40mnamespace[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 54.15 :> [39;49mnamespace[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 055.004 : Asm :> [33;40mX64[34;49m <: 0x00007ffff74b3438 :> [34;49m[34;49m[33;40mX64[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 056.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mnamespaces/compiler/asmConstants.cft" include [34;49m 
dbg[i]  :: [34;49m...[34;49m : 056.038 : <literal> :> [33;40m"namespaces/compiler/asmConstants.cft"[34;49m <: 0x00007ffff5cf53a0 :> [34;49m[34;49m[33;40m"namespaces/compiler/asmConstants.cft"[34;49m[34;49m include [34;49m 
Stack : word at namespaces/compiler/x64.cft : 56.1 :> [39;49m"namespaces/compiler/asmConstants.cft"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8cbf[34;49m.
Literal :> 0x00007ffff72c8cbf <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 056.047 : System :> [33;40minclude[34;49m <: cprimitive :> [34;49m"namespaces/compiler/asmConstants.cft" [34;49m[33;40minclude[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 1.2 :> [39;49minclude[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
word popped 1 value off the stack.
dbg[i]  :: [34;49mnamespaces/compiler/asmConstants.cft[34;49m : 001.002 : <literal> :> [33;40m5[34;49m <: 0x00007ffff5cf5568 :> [34;49m[34;49m[33;40m5[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 1.2 :> [39;49m5[34;49m <: 1 cell pushed. TOS set to [39;49m0x0000000000000005[34;49m.
Literal :> 0x0000000000000005 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 002.002 : Interpreter :> [33;40m:[34;49m <: 0x00007ffff72952f0 :> [34;49m[34;49m[33;40m:[34;49m[34;49m sp ; //stack pause ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/asmConstants.cft : 2.5[32;49m
0x7ffff72fd1b7    e900000000              jmp 0x7ffff72fd1bc         	< C compiler code >        [34;49m
[34;49m ..                                     : [34;49m[33;40msp[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd1bc    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd1c0    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd1c4    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/asmConstants.cft : 2.5 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff74b3638[34;49m.
dbg[c]  :: [34;49m...[34;49m : 002.007 : Interpreter :> [33;40m;[34;49m <: 0x00007ffff7294bd0 :> [34;49m: sp [34;49m[33;40m;[34;49m[34;49m //stack pause ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/asmConstants.cft : 2.7
[34;49m ..                                  : sp [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd1cb    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/asmConstants.cft : 2.7 :> [39;49m;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 002.009 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m: sp ; [34;49m[33;40m//[34;49m[34;49mstack pause ; [34;49m 
dbg[i]  :: [34;49m...[34;49m : 003.012 : Compiler :> [33;40mc_syntaxOff[34;49m <: cprimitive :> [34;49m[34;49m[33;40mc_syntaxOff[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 004.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mtrue 1 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 4.6 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7463d20[34;49m.
dbg[i]  :: [34;49m...[34;49m : 004.008 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cf5730 :> [34;49m'true [34;49m[33;40m1[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 4.8 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 004.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m'true 1 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 4.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 005.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mfalse 0 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 5.7 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7463d2f[34;49m.
dbg[i]  :: [34;49m...[34;49m : 005.009 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cf58f8 :> [34;49m'false [34;49m[33;40m0[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 5.9 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 005.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m'false 0 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 5.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 006.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mon true const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 6.4 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7463d3f[34;49m.
dbg[i]  :: [34;49m...[34;49m : 006.009 : X64 :> [33;40mtrue[34;49m <: 0x00007ffff74b3800 :> [34;49m'on [34;49m[33;40mtrue[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 6.9 :> [39;49mtrue[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
dbg[i]  :: [34;49m...[34;49m : 006.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m'on true [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 6.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 007.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49moff false const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 7.5 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7463d4f[34;49m.
dbg[i]  :: [34;49m...[34;49m : 007.011 : X64 :> [33;40mfalse[34;49m <: 0x00007ffff74b39c8 :> [34;49m'off [34;49m[33;40mfalse[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 7.11 :> [39;49mfalse[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
dbg[i]  :: [34;49m...[34;49m : 007.017 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m'off false [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 7.17 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 008.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m asm constants [34;49m 
dbg[i]  :: [34;49m...[34;49m : 010.008 : System :> [33;40mdecimal[34;49m <: cprimitive :> [34;49m[34;49m[33;40mdecimal[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 011.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mREG" 3 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 011.005 : <literal> :> [33;40m"REG"[34;49m <: 0x00007ffff5cf5ac0 :> [34;49m[34;49m[33;40m"REG"[34;49m[34;49m 3 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 11.1 :> [39;49m"REG"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8dab[34;49m.
Literal :> 0x00007ffff72c8dab <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 011.008 : <literal> :> [33;40m3[34;49m <: 0x00007ffff5cf5c88 :> [34;49m"REG" [34;49m[33;40m3[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 11.8 :> [39;49m3[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000003[34;49m.
Literal :> 0x0000000000000003 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 011.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"REG" 3 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 11.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 012.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mMEM8" 1 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 012.006 : <literal> :> [33;40m"MEM8"[34;49m <: 0x00007ffff5cf5e50 :> [34;49m[34;49m[33;40m"MEM8"[34;49m[34;49m 1 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 12.1 :> [39;49m"MEM8"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8dd1[34;49m.
Literal :> 0x00007ffff72c8dd1 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 012.009 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cf6018 :> [34;49m"MEM8" [34;49m[33;40m1[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 12.9 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 012.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"MEM8" 1 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 12.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 013.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mMEM32" 2 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 013.007 : <literal> :> [33;40m"MEM32"[34;49m <: 0x00007ffff5cf61e0 :> [34;49m[34;49m[33;40m"MEM32"[34;49m[34;49m 2 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 13.1 :> [39;49m"MEM32"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8dfc[34;49m.
Literal :> 0x00007ffff72c8dfc <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 013.010 : <literal> :> [33;40m2[34;49m <: 0x00007ffff5cf63a8 :> [34;49m"MEM32" [34;49m[33;40m2[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 13.10 :> [39;49m2[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
Literal :> 0x0000000000000002 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 013.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"MEM32" 2 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 13.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 014.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mMEM0" 0 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 014.006 : <literal> :> [33;40m"MEM0"[34;49m <: 0x00007ffff5cf6570 :> [34;49m[34;49m[33;40m"MEM0"[34;49m[34;49m 0 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 14.1 :> [39;49m"MEM0"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8e2a[34;49m.
Literal :> 0x00007ffff72c8e2a <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 014.009 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cf6738 :> [34;49m"MEM0" [34;49m[33;40m0[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 14.9 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 014.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"MEM0" 0 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 14.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 015.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mMEM" MEM0 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 015.005 : <literal> :> [33;40m"MEM"[34;49m <: 0x00007ffff5cf6900 :> [34;49m[34;49m[33;40m"MEM"[34;49m[34;49m MEM0 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 15.1 :> [39;49m"MEM"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8e53[34;49m.
Literal :> 0x00007ffff72c8e53 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 015.011 : X64 :> [33;40mMEM0[34;49m <: 0x00007ffff74b4478 :> [34;49m"MEM" [34;49m[33;40mMEM0[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 15.11 :> [39;49mMEM0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
dbg[i]  :: [34;49m...[34;49m : 015.017 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"MEM" MEM0 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 15.17 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 016.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m registers [34;49m 
dbg[i]  :: [34;49m...[34;49m : 017.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mRAX" 0 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 017.005 : <literal> :> [33;40m"RAX"[34;49m <: 0x00007ffff5cf6ac8 :> [34;49m[34;49m[33;40m"RAX"[34;49m[34;49m 0 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 17.1 :> [39;49m"RAX"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8e79[34;49m.
Literal :> 0x00007ffff72c8e79 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 017.008 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cf6c90 :> [34;49m"RAX" [34;49m[33;40m0[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 17.8 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 017.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"RAX" 0 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 17.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 018.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mRCX" 1 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 018.005 : <literal> :> [33;40m"RCX"[34;49m <: 0x00007ffff5cf6e58 :> [34;49m[34;49m[33;40m"RCX"[34;49m[34;49m 1 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 18.1 :> [39;49m"RCX"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8e9e[34;49m.
Literal :> 0x00007ffff72c8e9e <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 018.008 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cf7020 :> [34;49m"RCX" [34;49m[33;40m1[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 18.8 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 018.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"RCX" 1 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 18.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 019.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mRDX" 2 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 019.005 : <literal> :> [33;40m"RDX"[34;49m <: 0x00007ffff5cf71e8 :> [34;49m[34;49m[33;40m"RDX"[34;49m[34;49m 2 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 19.1 :> [39;49m"RDX"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8ec3[34;49m.
Literal :> 0x00007ffff72c8ec3 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 019.008 : <literal> :> [33;40m2[34;49m <: 0x00007ffff5cf73b0 :> [34;49m"RDX" [34;49m[33;40m2[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 19.8 :> [39;49m2[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
Literal :> 0x0000000000000002 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 019.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"RDX" 2 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 19.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 020.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mRBX" 3 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 020.005 : <literal> :> [33;40m"RBX"[34;49m <: 0x00007ffff5cf7578 :> [34;49m[34;49m[33;40m"RBX"[34;49m[34;49m 3 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 20.1 :> [39;49m"RBX"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8ee8[34;49m.
Literal :> 0x00007ffff72c8ee8 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 020.008 : <literal> :> [33;40m3[34;49m <: 0x00007ffff5cf7740 :> [34;49m"RBX" [34;49m[33;40m3[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 20.8 :> [39;49m3[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000003[34;49m.
Literal :> 0x0000000000000003 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 020.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"RBX" 3 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 20.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 021.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mRSP" 4 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 021.005 : <literal> :> [33;40m"RSP"[34;49m <: 0x00007ffff5cf7908 :> [34;49m[34;49m[33;40m"RSP"[34;49m[34;49m 4 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 21.1 :> [39;49m"RSP"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8f0d[34;49m.
Literal :> 0x00007ffff72c8f0d <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 021.008 : <literal> :> [33;40m4[34;49m <: 0x00007ffff5cf7ad0 :> [34;49m"RSP" [34;49m[33;40m4[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 21.8 :> [39;49m4[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000004[34;49m.
Literal :> 0x0000000000000004 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 021.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"RSP" 4 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 21.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 022.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mRBP" 5 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 022.005 : <literal> :> [33;40m"RBP"[34;49m <: 0x00007ffff5cf7c98 :> [34;49m[34;49m[33;40m"RBP"[34;49m[34;49m 5 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 22.1 :> [39;49m"RBP"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8f32[34;49m.
Literal :> 0x00007ffff72c8f32 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 022.008 : <literal> :> [33;40m5[34;49m <: 0x00007ffff5cf7e60 :> [34;49m"RBP" [34;49m[33;40m5[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 22.8 :> [39;49m5[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000005[34;49m.
Literal :> 0x0000000000000005 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 022.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"RBP" 5 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 22.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS set to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 023.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mRSI" 6 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 023.005 : <literal> :> [33;40m"RSI"[34;49m <: 0x00007ffff5cf8028 :> [34;49m[34;49m[33;40m"RSI"[34;49m[34;49m 6 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 23.1 :> [39;49m"RSI"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8f57[34;49m.
Literal :> 0x00007ffff72c8f57 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 023.008 : <literal> :> [33;40m6[34;49m <: 0x00007ffff5cf81f0 :> [34;49m"RSI" [34;49m[33;40m6[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 23.8 :> [39;49m6[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000006[34;49m.
Literal :> 0x0000000000000006 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 023.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"RSI" 6 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 23.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 024.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mRDI" 7 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 024.005 : <literal> :> [33;40m"RDI"[34;49m <: 0x00007ffff5cf83b8 :> [34;49m[34;49m[33;40m"RDI"[34;49m[34;49m 7 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 24.1 :> [39;49m"RDI"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8f7c[34;49m.
Literal :> 0x00007ffff72c8f7c <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 024.008 : <literal> :> [33;40m7[34;49m <: 0x00007ffff5cf8580 :> [34;49m"RDI" [34;49m[33;40m7[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 24.8 :> [39;49m7[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000007[34;49m.
Literal :> 0x0000000000000007 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 024.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"RDI" 7 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 24.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 025.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mR8D" 8 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 025.005 : <literal> :> [33;40m"R8D"[34;49m <: 0x00007ffff5cf8748 :> [34;49m[34;49m[33;40m"R8D"[34;49m[34;49m 8 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 25.1 :> [39;49m"R8D"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8fa1[34;49m.
Literal :> 0x00007ffff72c8fa1 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 025.008 : <literal> :> [33;40m8[34;49m <: 0x00007ffff5cf8910 :> [34;49m"R8D" [34;49m[33;40m8[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 25.8 :> [39;49m8[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000008[34;49m.
Literal :> 0x0000000000000008 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 025.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"R8D" 8 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 25.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 026.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mR9D" 9 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 026.005 : <literal> :> [33;40m"R9D"[34;49m <: 0x00007ffff5cf8ad8 :> [34;49m[34;49m[33;40m"R9D"[34;49m[34;49m 9 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 26.1 :> [39;49m"R9D"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8fc6[34;49m.
Literal :> 0x00007ffff72c8fc6 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 026.008 : <literal> :> [33;40m9[34;49m <: 0x00007ffff5cf8ca0 :> [34;49m"R9D" [34;49m[33;40m9[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 26.8 :> [39;49m9[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000009[34;49m.
Literal :> 0x0000000000000009 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 026.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"R9D" 9 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 26.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 027.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mR10D" 10 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 027.006 : <literal> :> [33;40m"R10D"[34;49m <: 0x00007ffff5cf8e68 :> [34;49m[34;49m[33;40m"R10D"[34;49m[34;49m 10 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 27.1 :> [39;49m"R10D"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c8fec[34;49m.
Literal :> 0x00007ffff72c8fec <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 027.010 : <literal> :> [33;40m10[34;49m <: 0x00007ffff5cf9030 :> [34;49m"R10D" [34;49m[33;40m10[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 27.10 :> [39;49m10[34;49m <: 1 cell pushed. TOS changed to [39;49m0x000000000000000a[34;49m.
Literal :> 0x000000000000000a <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 027.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"R10D" 10 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 27.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 028.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mR11D" 11 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 028.006 : <literal> :> [33;40m"R11D"[34;49m <: 0x00007ffff5cf91f8 :> [34;49m[34;49m[33;40m"R11D"[34;49m[34;49m 11 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 28.1 :> [39;49m"R11D"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9018[34;49m.
Literal :> 0x00007ffff72c9018 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 028.010 : <literal> :> [33;40m11[34;49m <: 0x00007ffff5cf93c0 :> [34;49m"R11D" [34;49m[33;40m11[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 28.10 :> [39;49m11[34;49m <: 1 cell pushed. TOS changed to [39;49m0x000000000000000b[34;49m.
Literal :> 0x000000000000000b <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 028.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"R11D" 11 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 28.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 029.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mR12D" 12 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 029.006 : <literal> :> [33;40m"R12D"[34;49m <: 0x00007ffff5cf9588 :> [34;49m[34;49m[33;40m"R12D"[34;49m[34;49m 12 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 29.1 :> [39;49m"R12D"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9044[34;49m.
Literal :> 0x00007ffff72c9044 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 029.010 : <literal> :> [33;40m12[34;49m <: 0x00007ffff5cf9750 :> [34;49m"R12D" [34;49m[33;40m12[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 29.10 :> [39;49m12[34;49m <: 1 cell pushed. TOS changed to [39;49m0x000000000000000c[34;49m.
Literal :> 0x000000000000000c <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 029.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"R12D" 12 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 29.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 030.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mR13D" 13 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 030.006 : <literal> :> [33;40m"R13D"[34;49m <: 0x00007ffff5cf9918 :> [34;49m[34;49m[33;40m"R13D"[34;49m[34;49m 13 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 30.1 :> [39;49m"R13D"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9070[34;49m.
Literal :> 0x00007ffff72c9070 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 030.010 : <literal> :> [33;40m13[34;49m <: 0x00007ffff5cf9ae0 :> [34;49m"R13D" [34;49m[33;40m13[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 30.10 :> [39;49m13[34;49m <: 1 cell pushed. TOS changed to [39;49m0x000000000000000d[34;49m.
Literal :> 0x000000000000000d <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 030.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"R13D" 13 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 30.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 031.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mR14D" 14 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 031.006 : <literal> :> [33;40m"R14D"[34;49m <: 0x00007ffff5cf9ca8 :> [34;49m[34;49m[33;40m"R14D"[34;49m[34;49m 14 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 31.1 :> [39;49m"R14D"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c909c[34;49m.
Literal :> 0x00007ffff72c909c <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 031.010 : <literal> :> [33;40m14[34;49m <: 0x00007ffff5cf9e70 :> [34;49m"R14D" [34;49m[33;40m14[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 31.10 :> [39;49m14[34;49m <: 1 cell pushed. TOS changed to [39;49m0x000000000000000e[34;49m.
Literal :> 0x000000000000000e <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 031.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"R14D" 14 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 31.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 032.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mR15D" 15 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 032.006 : <literal> :> [33;40m"R15D"[34;49m <: 0x00007ffff5cfa038 :> [34;49m[34;49m[33;40m"R15D"[34;49m[34;49m 15 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 32.1 :> [39;49m"R15D"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c90c8[34;49m.
Literal :> 0x00007ffff72c90c8 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 032.010 : <literal> :> [33;40m15[34;49m <: 0x00007ffff5cfa200 :> [34;49m"R15D" [34;49m[33;40m15[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 32.10 :> [39;49m15[34;49m <: 1 cell pushed. TOS changed to [39;49m0x000000000000000f[34;49m.
Literal :> 0x000000000000000f <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 032.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"R15D" 15 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 32.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 034.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mDSP" R14D const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 034.005 : <literal> :> [33;40m"DSP"[34;49m <: 0x00007ffff5cfa3c8 :> [34;49m[34;49m[33;40m"DSP"[34;49m[34;49m R14D const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 34.1 :> [39;49m"DSP"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c90f3[34;49m.
Literal :> 0x00007ffff72c90f3 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 034.011 : X64 :> [33;40mR14D[34;49m <: 0x00007ffff5c7be50 :> [34;49m"DSP" [34;49m[33;40mR14D[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 34.11 :> [39;49mR14D[34;49m <: 1 cell pushed. TOS changed to [39;49m0x000000000000000e[34;49m.
dbg[i]  :: [34;49m...[34;49m : 034.017 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"DSP" R14D [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 34.17 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 035.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mFP" R15D const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 035.004 : <literal> :> [33;40m"FP"[34;49m <: 0x00007ffff5cfa590 :> [34;49m[34;49m[33;40m"FP"[34;49m[34;49m R15D const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 35.1 :> [39;49m"FP"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9118[34;49m.
Literal :> 0x00007ffff72c9118 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 035.010 : X64 :> [33;40mR15D[34;49m <: 0x00007ffff5c7c018 :> [34;49m"FP" [34;49m[33;40mR15D[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 35.10 :> [39;49mR15D[34;49m <: 1 cell pushed. TOS changed to [39;49m0x000000000000000f[34;49m.
dbg[i]  :: [34;49m...[34;49m : 035.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"FP" R15D [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 35.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 037.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m ttt codes [34;49m 
dbg[i]  :: [34;49m...[34;49m : 038.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mBELOW" 1 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 038.007 : <literal> :> [33;40m"BELOW"[34;49m <: 0x00007ffff5cfa758 :> [34;49m[34;49m[33;40m"BELOW"[34;49m[34;49m 1 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 38.1 :> [39;49m"BELOW"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c913c[34;49m.
Literal :> 0x00007ffff72c913c <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 038.010 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cfa920 :> [34;49m"BELOW" [34;49m[33;40m1[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 38.10 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 038.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"BELOW" 1 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 38.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 039.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mEQUAL" 2 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 039.007 : <literal> :> [33;40m"EQUAL"[34;49m <: 0x00007ffff5cfaae8 :> [34;49m[34;49m[33;40m"EQUAL"[34;49m[34;49m 2 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 39.1 :> [39;49m"EQUAL"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c916b[34;49m.
Literal :> 0x00007ffff72c916b <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 039.010 : <literal> :> [33;40m2[34;49m <: 0x00007ffff5cfacb0 :> [34;49m"EQUAL" [34;49m[33;40m2[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 39.10 :> [39;49m2[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
Literal :> 0x0000000000000002 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 039.016 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"EQUAL" 2 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 39.16 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 040.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mEQ" 2 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 040.004 : <literal> :> [33;40m"EQ"[34;49m <: 0x00007ffff5cfae78 :> [34;49m[34;49m[33;40m"EQ"[34;49m[34;49m 2 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 40.1 :> [39;49m"EQ"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9197[34;49m.
Literal :> 0x00007ffff72c9197 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 040.007 : <literal> :> [33;40m2[34;49m <: 0x00007ffff5cfb040 :> [34;49m"EQ" [34;49m[33;40m2[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 40.7 :> [39;49m2[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
Literal :> 0x0000000000000002 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 040.013 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"EQ" 2 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 40.13 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 041.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mZERO" 2 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 041.006 : <literal> :> [33;40m"ZERO"[34;49m <: 0x00007ffff5cfb208 :> [34;49m[34;49m[33;40m"ZERO"[34;49m[34;49m 2 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 41.1 :> [39;49m"ZERO"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c91b9[34;49m.
Literal :> 0x00007ffff72c91b9 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 041.009 : <literal> :> [33;40m2[34;49m <: 0x00007ffff5cfb3d0 :> [34;49m"ZERO" [34;49m[33;40m2[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 41.9 :> [39;49m2[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
Literal :> 0x0000000000000002 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 041.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"ZERO" 2 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 41.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 042.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mZ" 2 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 042.003 : <literal> :> [33;40m"Z"[34;49m <: 0x00007ffff5cfb598 :> [34;49m[34;49m[33;40m"Z"[34;49m[34;49m 2 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 42.1 :> [39;49m"Z"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c91e0[34;49m.
Literal :> 0x00007ffff72c91e0 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 042.006 : <literal> :> [33;40m2[34;49m <: 0x00007ffff5cfb760 :> [34;49m"Z" [34;49m[33;40m2[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 42.6 :> [39;49m2[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
Literal :> 0x0000000000000002 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 042.012 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"Z" 2 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 42.12 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 043.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mBE" 3 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 043.004 : <literal> :> [33;40m"BE"[34;49m <: 0x00007ffff5cfb928 :> [34;49m[34;49m[33;40m"BE"[34;49m[34;49m 3 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 43.1 :> [39;49m"BE"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c91fc[34;49m.
Literal :> 0x00007ffff72c91fc <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 043.007 : <literal> :> [33;40m3[34;49m <: 0x00007ffff5cfbaf0 :> [34;49m"BE" [34;49m[33;40m3[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 43.7 :> [39;49m3[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000003[34;49m.
Literal :> 0x0000000000000003 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 043.013 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"BE" 3 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 43.13 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 044.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mNA" 3 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 044.004 : <literal> :> [33;40m"NA"[34;49m <: 0x00007ffff5cfbcb8 :> [34;49m[34;49m[33;40m"NA"[34;49m[34;49m 3 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 44.1 :> [39;49m"NA"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c921c[34;49m.
Literal :> 0x00007ffff72c921c <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 044.007 : <literal> :> [33;40m3[34;49m <: 0x00007ffff5cfbe80 :> [34;49m"NA" [34;49m[33;40m3[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 44.7 :> [39;49m3[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000003[34;49m.
Literal :> 0x0000000000000003 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 044.013 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"NA" 3 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 44.13 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 045.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mLESS" 6 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 045.006 : <literal> :> [33;40m"LESS"[34;49m <: 0x00007ffff5cfc048 :> [34;49m[34;49m[33;40m"LESS"[34;49m[34;49m 6 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 45.1 :> [39;49m"LESS"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c923e[34;49m.
Literal :> 0x00007ffff72c923e <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 045.009 : <literal> :> [33;40m6[34;49m <: 0x00007ffff5cfc210 :> [34;49m"LESS" [34;49m[33;40m6[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 45.9 :> [39;49m6[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000006[34;49m.
Literal :> 0x0000000000000006 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 045.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"LESS" 6 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 45.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 046.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mLE" 7 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 046.004 : <literal> :> [33;40m"LE"[34;49m <: 0x00007ffff5cfc3d8 :> [34;49m[34;49m[33;40m"LE"[34;49m[34;49m 7 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 46.1 :> [39;49m"LE"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9266[34;49m.
Literal :> 0x00007ffff72c9266 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 046.007 : <literal> :> [33;40m7[34;49m <: 0x00007ffff5cfc5a0 :> [34;49m"LE" [34;49m[33;40m7[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 46.7 :> [39;49m7[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000007[34;49m.
Literal :> 0x0000000000000007 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 046.013 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"LE" 7 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 46.13 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 047.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mNG" 7 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 047.004 : <literal> :> [33;40m"NG"[34;49m <: 0x00007ffff5cfc768 :> [34;49m[34;49m[33;40m"NG"[34;49m[34;49m 7 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 47.1 :> [39;49m"NG"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9286[34;49m.
Literal :> 0x00007ffff72c9286 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 047.007 : <literal> :> [33;40m7[34;49m <: 0x00007ffff5cfc930 :> [34;49m"NG" [34;49m[33;40m7[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 47.7 :> [39;49m7[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000007[34;49m.
Literal :> 0x0000000000000007 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 047.013 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"NG" 7 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 47.13 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 049.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mADD" 0 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 049.005 : <literal> :> [33;40m"ADD"[34;49m <: 0x00007ffff5cfcaf8 :> [34;49m[34;49m[33;40m"ADD"[34;49m[34;49m 0 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 49.1 :> [39;49m"ADD"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c92a7[34;49m.
Literal :> 0x00007ffff72c92a7 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 049.008 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cfccc0 :> [34;49m"ADD" [34;49m[33;40m0[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 49.8 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 049.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"ADD" 0 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 49.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 050.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mSUB" 5 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 050.005 : <literal> :> [33;40m"SUB"[34;49m <: 0x00007ffff5cfce88 :> [34;49m[34;49m[33;40m"SUB"[34;49m[34;49m 5 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 50.1 :> [39;49m"SUB"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c92cc[34;49m.
Literal :> 0x00007ffff72c92cc <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 050.008 : <literal> :> [33;40m5[34;49m <: 0x00007ffff5cfd050 :> [34;49m"SUB" [34;49m[33;40m5[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 50.8 :> [39;49m5[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000005[34;49m.
Literal :> 0x0000000000000005 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 050.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"SUB" 5 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 50.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS set to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 051.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mCMP" 7 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 051.005 : <literal> :> [33;40m"CMP"[34;49m <: 0x00007ffff5cfd218 :> [34;49m[34;49m[33;40m"CMP"[34;49m[34;49m 7 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 51.1 :> [39;49m"CMP"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c92f1[34;49m.
Literal :> 0x00007ffff72c92f1 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 051.008 : <literal> :> [33;40m7[34;49m <: 0x00007ffff5cfd3e0 :> [34;49m"CMP" [34;49m[33;40m7[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 51.8 :> [39;49m7[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000007[34;49m.
Literal :> 0x0000000000000007 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 051.014 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"CMP" 7 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 51.14 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 052.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mCALL" 2 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 052.006 : <literal> :> [33;40m"CALL"[34;49m <: 0x00007ffff5cfd5a8 :> [34;49m[34;49m[33;40m"CALL"[34;49m[34;49m 2 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 52.1 :> [39;49m"CALL"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9317[34;49m.
Literal :> 0x00007ffff72c9317 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 052.009 : <literal> :> [33;40m2[34;49m <: 0x00007ffff5cfd770 :> [34;49m"CALL" [34;49m[33;40m2[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 52.9 :> [39;49m2[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
Literal :> 0x0000000000000002 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 052.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"CALL" 2 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 52.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 053.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mBYTE" 1 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 053.006 : <literal> :> [33;40m"BYTE"[34;49m <: 0x00007ffff5cfd938 :> [34;49m[34;49m[33;40m"BYTE"[34;49m[34;49m 1 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 53.1 :> [39;49m"BYTE"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9341[34;49m.
Literal :> 0x00007ffff72c9341 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 053.009 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cfdb00 :> [34;49m"BYTE" [34;49m[33;40m1[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 53.9 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 053.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"BYTE" 1 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 53.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 054.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mCELL" 8 const [34;49m 
dbg[i]  :: [34;49m...[34;49m : 054.006 : <literal> :> [33;40m"CELL"[34;49m <: 0x00007ffff5cfdcc8 :> [34;49m[34;49m[33;40m"CELL"[34;49m[34;49m 8 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 54.1 :> [39;49m"CELL"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c936b[34;49m.
Literal :> 0x00007ffff72c936b <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 054.009 : <literal> :> [33;40m8[34;49m <: 0x00007ffff5cfde90 :> [34;49m"CELL" [34;49m[33;40m8[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 54.9 :> [39;49m8[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000008[34;49m.
Literal :> 0x0000000000000008 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 054.015 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"CELL" 8 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 54.15 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 055.001 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m[34;49m[33;40m"[34;49m[34;49mN" 1 const // used with JCC n/ttt notation [34;49m 
dbg[i]  :: [34;49m...[34;49m : 055.003 : <literal> :> [33;40m"N"[34;49m <: 0x00007ffff5cfe058 :> [34;49m[34;49m[33;40m"N"[34;49m[34;49m 1 const // used with JCC n/ttt notation [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 55.1 :> [39;49m"N"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72c9392[34;49m.
Literal :> 0x00007ffff72c9392 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 055.006 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cfe220 :> [34;49m"N" [34;49m[33;40m1[34;49m[34;49m const // used with JCC n/ttt notation [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 55.6 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 055.012 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m"N" 1 [34;49m[33;40mconst[34;49m[34;49m // used with JCC n/ttt notation [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 55.12 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 055.014 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m"N" 1 const [34;49m[33;40m//[34;49m[34;49m used with JCC n/ttt notation [34;49m 
dbg[i]  :: [34;49m...[34;49m : 060.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mINC 0 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 60.5 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7463f20[34;49m.
dbg[i]  :: [34;49m...[34;49m : 060.007 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cfe3e8 :> [34;49m'INC [34;49m[33;40m0[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 60.7 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 060.013 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m'INC 0 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 60.13 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 061.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mDEC 1 const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 61.5 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff7463f2e[34;49m.
dbg[i]  :: [34;49m...[34;49m : 061.007 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cfe5b0 :> [34;49m'DEC [34;49m[33;40m1[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 61.7 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 061.013 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m'DEC 1 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 61.13 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 062.003 : X64 :> [33;40msp[34;49m <: 0x00007ffff74b3638 :> [34;49m[34;49m[33;40msp[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 063.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif 1 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 063.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m 1 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 063.006 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cfe778 :> [34;49m#if [34;49m[33;40m1[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 63.6 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 064.011 : Compiler :> [33;40mc_syntaxOn[34;49m <: cprimitive :> [34;49m[34;49m[33;40mc_syntaxOn[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 065.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine REX_B           ( 1 << 0 ) // 2 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 065.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m REX_B           ( 1 << 0 ) // 2 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 065.025 : C :> [33;40m([34;49m <: cprimitive :> [34;49m#define REX_B           [34;49m[33;40m([34;49m[34;49m 1 << 0 ) // 2 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 065.028 : <literal> :> [33;40m1[34;49m <: 0x00007ffff737d03e :> [34;49m#define REX_B           ( [34;49m[33;40m1[34;49m[34;49m << 0 ) // 2 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 65.28[32;49m
0x7ffff72fd1e0    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd1ea    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd1ee    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 065.031 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define REX_B           ( 1 [34;49m[33;40m<<[34;49m[34;49m 0 ) // 2 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 065.033 : <literal> :> [33;40m0[34;49m <: 0x00007ffff737d239 :> [34;49m#define REX_B           ( 1 << [34;49m[33;40m0[34;49m[34;49m ) // 2 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 65.33[32;49m
0x7ffff72fd1f1    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fd1fb    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd1ff    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 065.033 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define REX_B           ( 1 [34;49m[33;40m<<[34;49m[34;49m 0 ) // 2 [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/asmConstants.cft : 65.33[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737d239	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff737d03e	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Bits.<< :: type expected : Integer  :: type recorded : Integer  : namespaces/compiler/asmConstants.cft : 65.33
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<<[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 65.33[32;49m
0x7ffff72fd1e0    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd1ea    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd1ee    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 065.034 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m#define REX_B           ( 1 << 0 [34;49m[33;40m)[34;49m[34;49m // 2 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 065.037 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m#define REX_B           ( 1 << 0 ) [34;49m[33;40m//[34;49m[34;49m 2 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 066.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine MODRM_B         ( 1 << 1 ) // 2 backwards compatibility [34;49m 
dbg[i]  :: [34;49m...[34;49m : 066.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m MODRM_B         ( 1 << 1 ) // 2 backwards compatibility [34;49m 
dbg[c]  :: [34;49m...[34;49m : 066.025 : C :> [33;40m([34;49m <: cprimitive :> [34;49m#define MODRM_B         [34;49m[33;40m([34;49m[34;49m 1 << 1 ) // 2 backwards compatibility [34;49m 
dbg[c]  :: [34;49m...[34;49m : 066.028 : <literal> :> [33;40m1[34;49m <: 0x00007ffff737d434 :> [34;49m#define MODRM_B         ( [34;49m[33;40m1[34;49m[34;49m << 1 ) // 2 backwards compatibility [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 66.28
[34;49m ..                                    // [34;49m[33;40m1[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd206    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd210    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd214    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 066.031 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define MODRM_B         ( 1 [34;49m[33;40m<<[34;49m[34;49m 1 ) // 2 backwards compatibility [34;49m 
dbg[c]  :: [34;49m...[34;49m : 066.033 : <literal> :> [33;40m1[34;49m <: 0x00007ffff737d62f :> [34;49m#define MODRM_B         ( 1 << [34;49m[33;40m1[34;49m[34;49m ) // 2 backwards compatibility [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 66.33
[34;49m ..                                    // [34;49m[33;40m1[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd217    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd221    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd225    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 066.033 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define MODRM_B         ( 1 [34;49m[33;40m<<[34;49m[34;49m 1 ) // 2 backwards compatibility [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/asmConstants.cft : 66.33[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737d62f	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff737d434	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Bits.<< :: type expected : Integer  :: type recorded : Integer  : namespaces/compiler/asmConstants.cft : 66.33
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<<[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 66.33
[34;49m ..                                    // [34;49m[33;40m<<[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd206    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fd210    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd214    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 066.034 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m#define MODRM_B         ( 1 << 1 [34;49m[33;40m)[34;49m[34;49m // 2 backwards compatibility [34;49m 
dbg[c]  :: [34;49m...[34;49m : 066.037 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m#define MODRM_B         ( 1 << 1 ) [34;49m[33;40m//[34;49m[34;49m 2 backwards compatibility [34;49m 
dbg[i]  :: [34;49m...[34;49m : 067.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine SIB_B           ( 1 << 2 ) // 4 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 067.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m SIB_B           ( 1 << 2 ) // 4 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 067.025 : C :> [33;40m([34;49m <: cprimitive :> [34;49m#define SIB_B           [34;49m[33;40m([34;49m[34;49m 1 << 2 ) // 4 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 067.028 : <literal> :> [33;40m1[34;49m <: 0x00007ffff737d82a :> [34;49m#define SIB_B           ( [34;49m[33;40m1[34;49m[34;49m << 2 ) // 4 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 67.28
[34;49m ..                                    // [34;49m[33;40m1[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd22c    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd236    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd23a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 067.031 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define SIB_B           ( 1 [34;49m[33;40m<<[34;49m[34;49m 2 ) // 4 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 067.033 : <literal> :> [33;40m2[34;49m <: 0x00007ffff737da25 :> [34;49m#define SIB_B           ( 1 << [34;49m[33;40m2[34;49m[34;49m ) // 4 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m2[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 67.33
[34;49m ..                                    // [34;49m[33;40m2[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd23d    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fd247    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd24b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 067.033 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define SIB_B           ( 1 [34;49m[33;40m<<[34;49m[34;49m 2 ) // 4 [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/asmConstants.cft : 67.33[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737da25	< word : <literal>.[34;49m2[39;49m : value = 0x0000000000000002 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff737d82a	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Bits.<< :: type expected : Integer  :: type recorded : Integer  : namespaces/compiler/asmConstants.cft : 67.33
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<<[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 67.33
[34;49m ..                                    // [34;49m[33;40m<<[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd22c    48b80400000000000000    mov rax, 0x4                                           [34;49m[32;49m
0x7ffff72fd236    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd23a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 067.034 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m#define SIB_B           ( 1 << 2 [34;49m[33;40m)[34;49m[34;49m // 4 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 067.037 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m#define SIB_B           ( 1 << 2 ) [34;49m[33;40m//[34;49m[34;49m 4 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 068.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine DISP_B          ( 1 << 3 ) // 8 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 068.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m DISP_B          ( 1 << 3 ) // 8 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 068.025 : C :> [33;40m([34;49m <: cprimitive :> [34;49m#define DISP_B          [34;49m[33;40m([34;49m[34;49m 1 << 3 ) // 8 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 068.028 : <literal> :> [33;40m1[34;49m <: 0x00007ffff737dc20 :> [34;49m#define DISP_B          ( [34;49m[33;40m1[34;49m[34;49m << 3 ) // 8 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 68.28
[34;49m ..                                    // [34;49m[33;40m1[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd252    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd25c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd260    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 068.031 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define DISP_B          ( 1 [34;49m[33;40m<<[34;49m[34;49m 3 ) // 8 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 068.033 : <literal> :> [33;40m3[34;49m <: 0x00007ffff737de1b :> [34;49m#define DISP_B          ( 1 << [34;49m[33;40m3[34;49m[34;49m ) // 8 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m3[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 68.33
[34;49m ..                                    // [34;49m[33;40m3[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd263    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fd26d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd271    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 068.033 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define DISP_B          ( 1 [34;49m[33;40m<<[34;49m[34;49m 3 ) // 8 [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/asmConstants.cft : 68.33[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737de1b	< word : <literal>.[34;49m3[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff737dc20	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Bits.<< :: type expected : Integer  :: type recorded : Integer  : namespaces/compiler/asmConstants.cft : 68.33
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<<[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 68.33
[34;49m ..                                    // [34;49m[33;40m<<[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd252    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fd25c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd260    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 068.034 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m#define DISP_B          ( 1 << 3 [34;49m[33;40m)[34;49m[34;49m // 8 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 068.037 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m#define DISP_B          ( 1 << 3 ) [34;49m[33;40m//[34;49m[34;49m 8 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 069.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine IMM_B           ( 1 << 4 ) // 16 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 069.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m IMM_B           ( 1 << 4 ) // 16 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 069.025 : C :> [33;40m([34;49m <: cprimitive :> [34;49m#define IMM_B           [34;49m[33;40m([34;49m[34;49m 1 << 4 ) // 16 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 069.028 : <literal> :> [33;40m1[34;49m <: 0x00007ffff737e016 :> [34;49m#define IMM_B           ( [34;49m[33;40m1[34;49m[34;49m << 4 ) // 16 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 69.28
[34;49m ..                                    // [34;49m[33;40m1[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd278    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd282    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd286    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 069.031 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define IMM_B           ( 1 [34;49m[33;40m<<[34;49m[34;49m 4 ) // 16 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 069.033 : <literal> :> [33;40m4[34;49m <: 0x00007ffff737e211 :> [34;49m#define IMM_B           ( 1 << [34;49m[33;40m4[34;49m[34;49m ) // 16 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m4[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 69.33
[34;49m ..                                    // [34;49m[33;40m4[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd289    48b80400000000000000    mov rax, 0x4                                           [34;49m[32;49m
0x7ffff72fd293    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd297    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 069.033 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m#define IMM_B           ( 1 [34;49m[33;40m<<[34;49m[34;49m 4 ) // 16 [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/asmConstants.cft : 69.33[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737e211	< word : <literal>.[34;49m4[39;49m : value = 0x0000000000000004 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff737e016	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Bits.<< :: type expected : Integer  :: type recorded : Integer  : namespaces/compiler/asmConstants.cft : 69.33
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<<[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 69.33
[34;49m ..                                    // [34;49m[33;40m<<[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd278    48b81000000000000000    mov rax, 0x10                                          [34;49m[32;49m
0x7ffff72fd282    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd286    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 069.034 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m#define IMM_B           ( 1 << 4 [34;49m[33;40m)[34;49m[34;49m // 16 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 069.037 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m#define IMM_B           ( 1 << 4 ) [34;49m[33;40m//[34;49m[34;49m 16 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 070.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine REX_W_B         REX_B //( 1 << 0 ) // 2 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 070.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m REX_W_B         REX_B //( 1 << 0 ) // 2 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 070.030 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7e748 :> [34;49m#define REX_W_B         [34;49m[33;40mREX_B[34;49m[34;49m //( 1 << 0 ) // 2 [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/asmConstants.cft : 70.30[39;49m :
TypeWordStack depth =   0 :  = Top = 0x00007ffff7fc1a20, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
type match :: X64.REX_B :: type expected :  :: type recorded :  : namespaces/compiler/asmConstants.cft : 70.30
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/asmConstants.cft : 70.30[32;49m
0x7ffff72fd29e    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd2a8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd2ac    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 070.032 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m#define REX_W_B         REX_B [34;49m[33;40m//[34;49m[34;49m( 1 << 0 ) // 2 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 071.012 : Compiler :> [33;40mc_syntaxOff[34;49m <: cprimitive :> [34;49m[34;49m[33;40mc_syntaxOff[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 072.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49melse [34;49m 
dbg[i]  :: [34;49m...[34;49m : 072.006 : PreProcessor :> [33;40melse[34;49m <: cprimitive :> [34;49m#[34;49m[33;40melse[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 080.003 : X64 :> [33;40msp[34;49m <: 0x00007ffff74b3638 :> [34;49m[34;49m[33;40msp[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 081.002 : <literal> :> [33;40m2[34;49m <: 0x00007ffff5cfe940 :> [34;49m[34;49m[33;40m2[34;49m[34;49m + 7 assertStkChk // stack checking [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 81.2 :> [39;49m2[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000002[34;49m.
Literal :> 0x0000000000000002 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 081.004 : Int :> [33;40m+[34;49m <: cprimitive :> [34;49m2 [34;49m[33;40m+[34;49m[34;49m 7 assertStkChk // stack checking [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/asmConstants.cft : 81.4[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5cfe940	< word : <literal>.[34;49m2[39;49m : value = 0x0000000000000002 > : [34;49mInteger [39;49m
type match :: Int.+ :: type expected : Integer . Integer  :: type recorded : Integer  : namespaces/compiler/asmConstants.cft : 81.4
Stack : word at namespaces/compiler/asmConstants.cft : 81.4 :> [39;49m+[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000007[34;49m.
dbg[i]  :: [34;49m...[34;49m : 081.006 : <literal> :> [33;40m7[34;49m <: 0x00007ffff5cfeb08 :> [34;49m2 + [34;49m[33;40m7[34;49m[34;49m assertStkChk // stack checking [34;49m 
Stack : word at namespaces/compiler/asmConstants.cft : 81.6 :> [39;49m7[34;49m <: 1 cell pushed. TOS set to [39;49m0x0000000000000007[34;49m.
Literal :> 0x0000000000000007 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 081.019 : System :> [33;40massertStkChk[34;49m <: 0x00007ffff7202810 :> [34;49m2 + 7 [34;49m[33;40massertStkChk[34;49m[34;49m // stack checking [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/asmConstants.cft : 81.19[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5cfeb08	< word : <literal>.[34;49m7[39;49m : value = 0x0000000000000007 > : [34;49mInteger [39;49m
type match :: System.assertStkChk :: type expected :  :: type recorded : Integer  : namespaces/compiler/asmConstants.cft : 81.19
Stack : word at namespaces/compiler/asmConstants.cft : 81.19 :> [39;49massertStkChk[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 081.021 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m2 + 7 assertStkChk [34;49m[33;40m//[34;49m[34;49m stack checking [34;49m 
dbg[i]  :: [34;49mnamespaces/compiler/x64.cft[34;49m : 058.004 : System :> [33;40mhex[34;49m <: cprimitive :> [34;49m[34;49m[33;40mhex[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 059.006 : Root :> [33;40mLogic[34;49m <: 0x00007ffff7faf5f8 :> [34;49m[34;49m[33;40mLogic[34;49m[34;49m Bits Combinators X64 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 059.011 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49mLogic [34;49m[33;40mBits[34;49m[34;49m Combinators X64 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 059.023 : Root :> [33;40mCombinators[34;49m <: 0x00007ffff7fa76a0 :> [34;49mLogic Bits [34;49m[33;40mCombinators[34;49m[34;49m X64 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 059.027 : Asm :> [33;40mX64[34;49m <: 0x00007ffff74b3438 :> [34;49mLogic Bits Combinators [34;49m[33;40mX64[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 061.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mx64_dbg 1 const [34;49m 
Stack : word at namespaces/compiler/x64.cft : 61.9 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff74645b5[34;49m.
dbg[i]  :: [34;49m...[34;49m : 061.011 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cf51d8 :> [34;49m'x64_dbg [34;49m[33;40m1[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/x64.cft : 61.11 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 061.017 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m'x64_dbg 1 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 61.17 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 062.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49mDBI 1 const [34;49m 
Stack : word at namespaces/compiler/x64.cft : 62.5 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff74645c7[34;49m.
dbg[i]  :: [34;49m...[34;49m : 062.007 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cf53a0 :> [34;49m'DBI [34;49m[33;40m1[34;49m[34;49m const [34;49m 
Stack : word at namespaces/compiler/x64.cft : 62.7 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 062.013 : User :> [33;40mconst[34;49m <: cprimitive :> [34;49m'DBI 1 [34;49m[33;40mconst[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 62.13 :> [39;49mconst[34;49m <: 2 cells popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 063.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine x64_dbg 1 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 063.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m x64_dbg 1 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdefine[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 63.18[32;49m
0x7ffff72fd2b0    e900000000              jmp 0x7ffff72fd2b5         	< C compiler code >        [34;49m[32;49m
0x7ffff72fd2b5    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd2b9    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd2bd    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 63.18 :> [39;49mdefine[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c80038[34;49m.
Literal :> 0x00007ffff5c80038 <: was pushed onto the stack ...
dbg[c]  :: [34;49m...[34;49m : 063.018 : <literal> :> [33;40m1[34;49m <: 0x00007ffff737e53e :> [34;49m#define x64_dbg [34;49m[33;40m1[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 63.18[32;49m
0x7ffff72fd2c4    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd2ce    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd2d2    498906                  mov [r14], rax                                         [34;49m
dbg[i]  :: [34;49m...[34;49m : 064.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif x64_dbg [34;49m 
dbg[i]  :: [34;49m...[34;49m : 064.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m x64_dbg [34;49m 
dbg[i]  :: [34;49m...[34;49m : 064.012 : X64 :> [33;40mx64_dbg[34;49m <: 0x00007ffff5c80038 :> [34;49m#if [34;49m[33;40mx64_dbg[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 64.12 :> [39;49mx64_dbg[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
dbg[i]  :: [34;49m...[34;49m : 065.006 : Debug :> [33;40mdscOn[34;49m <: cprimitive :> [34;49m[34;49m[33;40mdscOn[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 066.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49mverbosity 3 = [34;49m 
dbg[i]  :: [34;49m...[34;49m : 067.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mendif [34;49m 
dbg[i]  :: [34;49m...[34;49m : 067.007 : PreProcessor :> [33;40mendif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mendif[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 068.002 : Interpreter :> [33;40m:[34;49m <: 0x00007ffff72952f0 :> [34;49m[34;49m[33;40m:[34;49m[34;49m apause ; // pause ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 68.9[32;49m
0x7ffff72fd2d6    e900000000              jmp 0x7ffff72fd2db         	< C compiler code >        [34;49m
[34;49m ..                                     : [34;49m[33;40mapause[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd2db    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd2df    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd2e3    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 68.9 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c80200[34;49m.
dbg[c]  :: [34;49m...[34;49m : 068.011 : Interpreter :> [33;40m;[34;49m <: 0x00007ffff7294bd0 :> [34;49m: apause [34;49m[33;40m;[34;49m[34;49m // pause ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 68.11
[34;49m ..                              : apause [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd2ea    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 68.11 :> [39;49m;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 068.013 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m: apause ; [34;49m[33;40m//[34;49m[34;49m pause ; [34;49m 
dbg[i]  :: [34;49m...[34;49m : 069.002 : Interpreter :> [33;40m:[34;49m <: 0x00007ffff72952f0 :> [34;49m[34;49m[33;40m:[34;49m[34;49m sp ; //stack using pause ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 69.5[32;49m
0x7ffff72fd2eb    e900000000              jmp 0x7ffff72fd2f0         	< C compiler code >        [34;49m
[34;49m ..                                     : [34;49m[33;40msp[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd2f0    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd2f4    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd2f8    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 69.5 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c803c8[34;49m.
dbg[c]  :: [34;49m...[34;49m : 069.007 : Interpreter :> [33;40m;[34;49m <: 0x00007ffff7294bd0 :> [34;49m: sp [34;49m[33;40m;[34;49m[34;49m //stack using pause ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 69.7
[34;49m ..                                  : sp [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd2ff    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 69.7 :> [39;49m;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 069.009 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m: sp ; [34;49m[33;40m//[34;49m[34;49mstack using pause ; [34;49m 
dbg[i]  :: [34;49m...[34;49m : 070.003 : X64 :> [33;40msp[34;49m <: 0x00007ffff5c803c8 :> [34;49m[34;49m[33;40msp[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 072.011 : Compiler :> [33;40mc_syntaxOn[34;49m <: cprimitive :> [34;49m[34;49m[33;40mc_syntaxOn[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 073.004 : char :> [33;40mint[34;49m <: 0x00007ffff72979e0 :> [34;49m[34;49m[33;40mint[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 074.059 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49megardingDisplacement ( _mod,  disp | rmod ) [34;49m[33;40m//[34;49m[34;49m _mod/rmod avoid name class with 'mod' funct[34;49m 
dbg[c]  :: [34;49m...[34;49m : 078.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( _mod != REG ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 078.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m _mod != REG ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 78.8
[34;49m .. splacement ( _mod, disp | rmod ) { if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fd314    e900000000              jmp 0x7ffff72fd319         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 078.014 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c80958 :> [34;49m    if ( [34;49m[33;40m_mod[34;49m[34;49m != REG ) [34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 78.14
[34;49m .. lacement ( _mod, disp | rmod ) { if ( [34;49m[33;40m_mod[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd319    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd31d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd321    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 078.017 : Logic :> [33;40m!=[34;49m <: cprimitive :> [34;49m    if ( _mod [34;49m[33;40m!=[34;49m[34;49m REG ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 078.021 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b3f20 :> [34;49m    if ( _mod != [34;49m[33;40mREG[34;49m[34;49m ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 78.21
[34;49m ..  ( _mod, disp | rmod ) { if ( _mod != [34;49m[33;40mREG[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd324    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fd32e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd332    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 078.021 : Logic :> [33;40m!=[34;49m <: cprimitive :> [34;49m    if ( _mod [34;49m[33;40m!=[34;49m[34;49m REG ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 78.21[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b3f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c80958	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.!= :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 78.21
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m!=[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 78.21
[34;49m .. ent ( _mod, disp | rmod ) { if ( _mod [34;49m[33;40m!=[34;49m[34;49m REG [34;49m[32;49m
0x7ffff72fd31d    48b90300000000000000    mov rcx, 0x3                                           [34;49m[32;49m
0x7ffff72fd327    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd32a    0f95c0                  setnz al                                               [34;49m[32;49m
0x7ffff72fd32d    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd331    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd335    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 078.022 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( _mod != REG [34;49m[33;40m)[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 78.22
[34;49m .. mod, disp | rmod ) { if ( _mod != REG [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd338    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 78.22 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd319[34;49m.
dbg[c]  :: [34;49m...[34;49m : 079.006 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 79.6
[34;49m .. d, disp | rmod ) { if ( _mod != REG ) [34;49m[33;40m{[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd339    e900000000              jmp 0x7ffff72fd33e         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 080.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif 1 // c_syntax/preprocessor tesing [34;49m 
dbg[c]  :: [34;49m...[34;49m : 080.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m 1 // c_syntax/preprocessor tesing [34;49m 
dbg[i]  :: [34;49m...[34;49m : 080.006 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cf5568 :> [34;49m#if [34;49m[33;40m1[34;49m[34;49m // c_syntax/preprocessor tesing [34;49m 
Stack : word at namespaces/compiler/x64.cft : 80.6 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 080.008 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m#if 1 [34;49m[33;40m//[34;49m[34;49m c_syntax/preprocessor tesing [34;49m 
dbg[c]  :: [34;49m...[34;49m : 081.011 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m        [34;49m[33;40mif[34;49m[34;49m ( disp == 0 ) rmod = 0 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 081.012 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m        if [34;49m[33;40m([34;49m[34;49m disp == 0 ) rmod = 0 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 81.12
[34;49m .. sp | rmod ) { if ( _mod != REG ) { if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fd33e    e900000000              jmp 0x7ffff72fd343         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 081.018 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c80b20 :> [34;49m        if ( [34;49m[33;40mdisp[34;49m[34;49m == 0 ) rmod = 0 ; [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 81.18
[34;49m ..  | rmod ) { if ( _mod != REG ) { if ( [34;49m[33;40mdisp[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd343    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fd347    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd34b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 081.021 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m        if ( disp [34;49m[33;40m==[34;49m[34;49m 0 ) rmod = 0 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 081.023 : <literal> :> [33;40m0[34;49m <: 0x00007ffff737e838 :> [34;49m        if ( disp == [34;49m[33;40m0[34;49m[34;49m ) rmod = 0 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 81.23
[34;49m .. ) { if ( _mod != REG ) { if ( disp == [34;49m[33;40m0[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd34e    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fd358    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd35c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 081.023 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m        if ( disp [34;49m[33;40m==[34;49m[34;49m 0 ) rmod = 0 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 81.23[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff737e838	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c80b20	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5cf5568	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Logic.== :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 81.23
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m==[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 81.23
[34;49m .. od ) { if ( _mod != REG ) { if ( disp [34;49m[33;40m==[34;49m[34;49m 0 [34;49m[32;49m
0x7ffff72fd347    48b90000000000000000    mov rcx, 0x0                                           [34;49m[32;49m
0x7ffff72fd351    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd354    0f94c0                  setz al                                                [34;49m[32;49m
0x7ffff72fd357    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd35b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd35f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 081.024 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m        if ( disp == 0 [34;49m[33;40m)[34;49m[34;49m rmod = 0 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 81.24
[34;49m .. { if ( _mod != REG ) { if ( disp == 0 [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd362    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 81.24 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd343[34;49m.
dbg[c]  :: [34;49m...[34;49m : 081.030 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m        if ( disp == 0 ) [34;49m[33;40m{[34;49m[34;49mmod = 0 ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 81.30
[34;49m ..  if ( _mod != REG ) { if ( disp == 0 )[34;49m[33;40m{[34;49m[34;49mrmod [34;49m[32;49m
0x7ffff72fd363    e900000000              jmp 0x7ffff72fd368         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 081.030 : locals_0 :> [33;40mrmod[34;49m <: 0x00007ffff5c80ce8 :> [34;49m        if ( disp == 0 ) [34;49m[33;40mrmod[34;49m[34;49m = 0 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 081.032 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m        if ( disp == 0 ) rmod [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 081.034 : <literal> :> [33;40m0[34;49m <: 0x00007ffff737ea33 :> [34;49m        if ( disp == 0 ) rmod = [34;49m[33;40m0[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 81.34
[34;49m .. od != REG ) { if ( disp == 0 ) rmod = [34;49m[33;40m0[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd368    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fd372    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd376    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 081.036 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m        if ( disp == 0 ) rmod [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 81.36[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737ea33	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c80ce8	< word : locals_0.[34;49mrmod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 81.36
dbg[c]  :: [34;49m...[34;49m : 081.036 : locals_0 :> [33;40mrmod[34;49m <: 0x00007ffff5c81b28 :> [34;49m        if ( disp == 0 ) [34;49m[33;40mrmod[34;49m[34;49m = 0 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrmod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 81.36
[34;49m .. if ( _mod != REG ) { if ( disp == 0 ) [34;49m[33;40mrmod[34;49m[34;49m = 0 ; [34;49m[32;49m
0x7ffff72fd379    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd37d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd381    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 081.036 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m        if ( disp == 0 ) rmod [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 81.36[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c81b28	< word : locals_0.[34;49mrmod[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 81.36
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 81.36
[34;49m .. _mod != REG ) { if ( disp == 0 ) rmod [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m[32;49m
0x7ffff72fd372    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd376    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 081.036 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m        if ( disp == 0 ) rmod = 0 [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 083.010 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m        [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 83.10
[34;49m .. ) { if ( disp == 0 ) rmod = 0 ; else  [34;49m[33;40m{[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd37a    e900000000              jmp 0x7ffff72fd37f         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 084.015 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m            [34;49m[33;40mif[34;49m[34;49m ( disp <= 0xff ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 084.016 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m            if [34;49m[33;40m([34;49m[34;49m disp <= 0xff ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 84.16
[34;49m ..  ( disp == 0 ) rmod = 0 ; else  {  if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fd37f    e900000000              jmp 0x7ffff72fd384         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 084.022 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c80b20 :> [34;49m            if ( [34;49m[33;40mdisp[34;49m[34;49m <= 0xff ) [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 84.22
[34;49m ..  disp == 0 ) rmod = 0 ; else  {  if ( [34;49m[33;40mdisp[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd384    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fd388    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd38c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 084.025 : Logic :> [33;40m<=[34;49m <: cprimitive :> [34;49m            if ( disp [34;49m[33;40m<=[34;49m[34;49m 0xff ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 084.030 : <literal> :> [33;40m0xff[34;49m <: 0x00007ffff737ec2e :> [34;49m            if ( disp <= [34;49m[33;40m0xff[34;49m[34;49m ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0xff[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 84.30
[34;49m ..  0 ) rmod = 0 ; else  {  if ( disp <= [34;49m[33;40m0xff[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd38f    48b8ff00000000000000    mov rax, 0xff                                          [34;49m[32;49m
0x7ffff72fd399    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd39d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 084.030 : Logic :> [33;40m<=[34;49m <: cprimitive :> [34;49m            if ( disp [34;49m[33;40m<=[34;49m[34;49m 0xff ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 84.30[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737ec2e	< word : <literal>.[34;49m0xff[39;49m : value = 0x00000000000000ff > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c82410	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Logic.<= :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 84.30
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<=[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 84.30
[34;49m ..  == 0 ) rmod = 0 ; else  {  if ( disp [34;49m[33;40m<=[34;49m[34;49m 0xff [34;49m[32;49m
0x7ffff72fd388    48b9ff00000000000000    mov rcx, 0xff                                          [34;49m[32;49m
0x7ffff72fd392    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd395    0f9ec0                  setle al                                               [34;49m[32;49m
0x7ffff72fd398    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd39c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3a0    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 084.031 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m            if ( disp <= 0xff [34;49m[33;40m)[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 84.31
[34;49m .. rmod = 0 ; else  {  if ( disp <= 0xff [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd3a3    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 84.31 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd384[34;49m.
dbg[c]  :: [34;49m...[34;49m : 085.021 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m                [34;49m[33;40m{[34;49m[34;49mmod = 1 ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 85.21
[34;49m .. mod = 0 ; else  {  if ( disp <= 0xff )[34;49m[33;40m{[34;49m[34;49m rmod [34;49m[32;49m
0x7ffff72fd3a4    e900000000              jmp 0x7ffff72fd3a9         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 085.021 : locals_0 :> [33;40mrmod[34;49m <: 0x00007ffff5c80ce8 :> [34;49m                [34;49m[33;40mrmod[34;49m[34;49m = 1 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 085.023 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m                rmod [34;49m[33;40m=[34;49m[34;49m 1 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 085.025 : <literal> :> [33;40m1[34;49m <: 0x00007ffff737ee29 :> [34;49m                rmod = [34;49m[33;40m1[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 85.25
[34;49m ..  else  {  if ( disp <= 0xff )  rmod = [34;49m[33;40m1[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd3a9    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd3b3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3b7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 085.027 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m                rmod [34;49m[33;40m=[34;49m[34;49m 1 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 85.27[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737ee29	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c82b30	< word : locals_0.[34;49mrmod[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 85.27
dbg[c]  :: [34;49m...[34;49m : 085.027 : locals_0 :> [33;40mrmod[34;49m <: 0x00007ffff5c82cf8 :> [34;49m                [34;49m[33;40mrmod[34;49m[34;49m = 1 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrmod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 85.27
[34;49m .. d = 0 ; else  {  if ( disp <= 0xff )  [34;49m[33;40mrmod[34;49m[34;49m = 1 ; [34;49m[32;49m
0x7ffff72fd3ba    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd3be    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3c2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 085.027 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m                rmod [34;49m[33;40m=[34;49m[34;49m 1 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 85.27[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c82cf8	< word : locals_0.[34;49mrmod[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 85.27
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 85.27
[34;49m ..  ; else  {  if ( disp <= 0xff )  rmod [34;49m[33;40m=[34;49m[34;49m 1 ; [34;49m[32;49m
0x7ffff72fd3b3    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd3b7    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 085.027 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m                rmod = 1 [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 087.014 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m            [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 87.14
[34;49m .. f ( disp <= 0xff )  rmod = 1 ;  else  [34;49m[33;40m{[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd3bb    e900000000              jmp 0x7ffff72fd3c0         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 088.021 : locals_0 :> [33;40mrmod[34;49m <: 0x00007ffff5c80ce8 :> [34;49m                [34;49m[33;40mrmod[34;49m[34;49m = 2 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 088.023 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m                rmod [34;49m[33;40m=[34;49m[34;49m 2 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 088.025 : <literal> :> [33;40m2[34;49m <: 0x00007ffff737f024 :> [34;49m                rmod = [34;49m[33;40m2[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m2[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 88.25
[34;49m .. <= 0xff )  rmod = 1 ;  else  { rmod = [34;49m[33;40m2[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd3c0    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fd3ca    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3ce    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 088.027 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m                rmod [34;49m[33;40m=[34;49m[34;49m 2 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 88.27[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737f024	< word : <literal>.[34;49m2[39;49m : value = 0x0000000000000002 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c835e0	< word : locals_0.[34;49mrmod[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 88.27
dbg[c]  :: [34;49m...[34;49m : 088.027 : locals_0 :> [33;40mrmod[34;49m <: 0x00007ffff5c837a8 :> [34;49m                [34;49m[33;40mrmod[34;49m[34;49m = 2 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrmod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 88.27
[34;49m .. ( disp <= 0xff )  rmod = 1 ;  else  { [34;49m[33;40mrmod[34;49m[34;49m = 2 ;  .. [34;49m[32;49m
0x7ffff72fd3d1    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd3d5    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3d9    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 088.027 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m                rmod [34;49m[33;40m=[34;49m[34;49m 2 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 88.27[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c837a8	< word : locals_0.[34;49mrmod[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 88.27
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 88.27
[34;49m .. p <= 0xff )  rmod = 1 ;  else  { rmod [34;49m[33;40m=[34;49m[34;49m 2 ;  .. [34;49m[32;49m
0x7ffff72fd3ca    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd3ce    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 088.027 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m                rmod = 2 [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 089.014 : Reserved :> [33;40m}[34;49m <: cprimitive :> [34;49m            [34;49m[33;40m}[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 89.14
[34;49m .. ff )  rmod = 1 ;  else  { rmod = 2 ;  [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd3d1    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 89.14 :> [39;49m}[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd3c0[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 89.14[34;49m :
DataStack depth =   8 : Dsp (R14) = Top = 0x00007ffff7269238, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269238 > = 0x00007ffff72fd368	
  DataStack   [  -1 ] < 0x00007ffff7269230 > = 0x00007ffff72fd343	
  DataStack   [  -2 ] < 0x00007ffff7269228 > = 0x00007ffff72fd319	
  DataStack   [  -3 ] < 0x00007ffff7269220 > = 0x00007ffff5c80590	< word : int.[39;49mCalculateModRegardingDisplacement[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -4 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -5 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -6 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -7 ] < 0x00007ffff7269200 > = 0x0000000000000005	
DataStack at : [39;49mnamespaces/compiler/x64.cft : 90.10[34;49m :
DataStack depth =   6 : Dsp (R14) = Top = 0x00007ffff7269228, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269228 > = 0x00007ffff72fd319	
  DataStack   [  -1 ] < 0x00007ffff7269220 > = 0x00007ffff5c80590	< word : int.[39;49mCalculateModRegardingDisplacement[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -2 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -5 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 091.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49melif 0 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 091.006 : PreProcessor :> [33;40melif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40melif[34;49m[34;49m 0 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 091.008 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cf5730 :> [34;49m#elif [34;49m[33;40m0[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 91.8 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[c]  :: [34;49m...[34;49m : 114.006 : Reserved :> [33;40m}[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m}[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 114.6
[34;49m ..   rmod = 1 ;  else  { rmod = 2 ;  } } [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd3a9    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 114.6 :> [39;49m}[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd33e[34;49m.
dbg[c]  :: [34;49m...[34;49m : 115.014 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    else [34;49m[33;40m{[34;49m[34;49mmod = _mod ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 115.14
[34;49m .. = 1 ;  else  { rmod = 2 ;  } } } else [34;49m[33;40m{[34;49m[34;49mmod  .. [34;49m[32;49m
0x7ffff72fd3aa    e900000000              jmp 0x7ffff72fd3af         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 115.014 : locals_0 :> [33;40mrmod[34;49m <: 0x00007ffff5c80ce8 :> [34;49m    else [34;49m[33;40mrmod[34;49m[34;49m = _mod ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 115.016 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    else rmod [34;49m[33;40m=[34;49m[34;49m _mod ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 115.021 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c80958 :> [34;49m    else rmod = [34;49m[33;40m_mod[34;49m[34;49m ; [34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 115.21
[34;49m .. else  { rmod = 2 ;  } } } else rmod = [34;49m[33;40m_mod[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd3af    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd3b3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3b7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 115.023 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    else rmod [34;49m[33;40m=[34;49m[34;49m _mod ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 115.23[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c845e8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c84420	< word : locals_0.[34;49mrmod[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 115.23
dbg[c]  :: [34;49m...[34;49m : 115.023 : locals_0 :> [33;40mrmod[34;49m <: 0x00007ffff5c84978 :> [34;49m    else [34;49m[33;40mrmod[34;49m[34;49m = _mod ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrmod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 115.23
[34;49m .. = 1 ;  else  { rmod = 2 ;  } } } else [34;49m[33;40mrmod[34;49m[34;49m = _mod ;  .. [34;49m[32;49m
0x7ffff72fd3ba    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd3be    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3c2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 115.023 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    else rmod [34;49m[33;40m=[34;49m[34;49m _mod ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 115.23[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c84978	< word : locals_0.[34;49mrmod[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 115.23
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 115.23
[34;49m ..   else  { rmod = 2 ;  } } } else rmod [34;49m[33;40m=[34;49m[34;49m _mod ;  .. [34;49m[32;49m
0x7ffff72fd3b3    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd3b7    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 115.023 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    else rmod = _mod [34;49m[33;40m;[34;49m[34;49m [34;49m 
DataStack at : [39;49mnamespaces/compiler/x64.cft : 115.23[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c80590	< word : int.[39;49mCalculateModRegardingDisplacement[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 116.011 : Compiler :> [33;40mreturn[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mreturn[34;49m[34;49m rmod ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 116.018 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    return rmod [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 117.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 117.2
[34;49m ..  rmod = 2 ;  } } } else rmod = _mod ; [34;49m[33;40mreturn[34;49m[34;49m rmod ; }  .. [34;49m[32;49m
0x7ffff72fd3a6    498b4708                mov rax, [r15+0x8]                                     [34;49m
[34;49m ..  } } else rmod = _mod ; return rmod ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd3aa    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fd3ae    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd3b2    4983ee08                sub r14, 0x8                                           [34;49m
[34;49m ..  2 ;  } } } else rmod = _mod ; return [34;49m[33;40mrmod[34;49m[34;49m ; }  .. [34;49m[32;49m
0x7ffff72fd3b6    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fd3b9    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 117.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 117.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 118.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m'CalculateModRegardingDisplacement find wdiss apause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 120.005 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49m[34;49m[33;40mBits[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 121.004 : char :> [33;40mint[34;49m <: 0x00007ffff72979e0 :> [34;49m[34;49m[33;40mint[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mint[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 123.2
[34;49m ..                                       [34;49m[33;40mint[34;49m[34;49m CalculateModRmByte ( _mod, _reg, rm, sib, disp | modRm ) {  .. [34;49m[32;49m
0x7ffff72fd3ba    e900000000              jmp 0x7ffff72fd3bf         	< C compiler code >        [34;49m[32;49m
0x7ffff72fd3bf    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd3c3    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd3c7    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 123.2 :> [39;49mint[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c85098[34;49m.
dbg[c]  :: [34;49m...[34;49m : 124.009 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c84d08 :> [34;49m    [34;49m[33;40m_mod[34;49m[34;49m = CalculateModRegardingDisplacement ( _mod, disp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 124.011 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    _mod [34;49m[33;40m=[34;49m[34;49m CalculateModRegardingDisplacement ( _mod, disp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 124.045 : int :> [33;40mCalculateModRegardingDisplacement[34;49m <: 0x00007ffff5c80590 :> [34;49m    _mod = [34;49m[33;40mCalculateModRegardingDisplacement[34;49m[34;49m ( _mod, disp )[34;49m 
dbg[c]  :: [34;49m...[34;49m : 124.051 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c84d08 :> [34;49m    _mod = CalculateModRegardingDisplacement ( [34;49m[33;40m_mod[34;49m[34;49m, disp ) ; [34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
dbg[c]  :: [34;49m...[34;49m : 124.058 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c845e8 :> [34;49m    _mod = CalculateModRegardingDisplacement ( _mod, [34;49m[33;40mdisp[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 124.58
[34;49m .. ulateModRegardingDisplacement ( _mod, [34;49m[33;40mdisp[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd3d9    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fd3dd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3e1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 124.059 : int :> [33;40mCalculateModRegardingDisplacement[34;49m <: 0x00007ffff5c80590 :> [34;49m    _mod = [34;49m[33;40mCalculateModRegardingDisplacement[34;49m[34;49m ( _mod, disp )[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCalculateModRegardingDisplacement[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 124.59
[34;49m .. reg, rm, sib, disp | modRm ) { _mod = [34;49m[33;40mCalculateModRegardingDisplacement[34;49m[34;49m ( _mod, disp )[34;49m[32;49m
0x7ffff72fd3e4    49b905d32ff7ff7f0000    mov r9, 0x7ffff72fd305                                 [34;49m[32;49m
0x7ffff72fd3ee    49ffd1                  call r9                    	< int.[39;49mCalculateModRegardingDisplacement[34;49m : 0x00007ffff72fd305 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 124.062 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    _mod [34;49m[33;40m=[34;49m[34;49m CalculateModRegardingDisplacement ( _mod, disp ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 124.62[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c845e8	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c84090	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c84d08	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Undefined . Undefined  : namespaces/compiler/x64.cft : 124.62
dbg[c]  :: [34;49m...[34;49m : 124.062 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c83ec8 :> [34;49m    _mod = CalculateModRegardingDisplacement ( [34;49m[33;40m_mod[34;49m[34;49m, disp ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 124.62
[34;49m .. = CalculateModRegardingDisplacement ( [34;49m[33;40m_mod[34;49m[34;49m, disp ) ; [34;49m[32;49m
0x7ffff72fd3f1    498d47d8                lea rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fd3f5    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3f9    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 124.062 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    _mod [34;49m[33;40m=[34;49m[34;49m CalculateModRegardingDisplacement ( _mod, disp ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 124.62[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c83ec8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c84d08	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Undefined . Undefined  : namespaces/compiler/x64.cft : 124.62
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 124.62
[34;49m ..  _reg, rm, sib, disp | modRm ) { _mod [34;49m[33;40m=[34;49m[34;49m CalculateModRegardingDisplacement ( _mod, disp ) ; [34;49m[32;49m
0x7ffff72fd3f5    488bc8                  mov rcx, rax                                           [34;49m[32;49m
0x7ffff72fd3f8    498b06                  mov rax, [r14]                                         [34;49m[32;49m
0x7ffff72fd3fb    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd3ff    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 124.062 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    _mod = CalculateModRegardingDisplacement ( _mod, disp ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( ( _mod < 3 ) && ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m ( _mod < 3 ) && ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 125.8
[34;49m .. rdingDisplacement ( _mod, disp ) ; if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fd402    e900000000              jmp 0x7ffff72fd407         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 125.010 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    if ( [34;49m[33;40m([34;49m[34;49m _mod < 3 ) && ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.016 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c84d08 :> [34;49m    if ( ( [34;49m[33;40m_mod[34;49m[34;49m < 3 ) && ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 125.16
[34;49m .. gDisplacement ( _mod, disp ) ; if ( ( [34;49m[33;40m_mod[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd407    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fd40b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd40f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 125.018 : Logic :> [33;40m<[34;49m <: cprimitive :> [34;49m    if ( ( _mod [34;49m[33;40m<[34;49m[34;49m 3 ) && ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.020 : <literal> :> [33;40m3[34;49m <: 0x00007ffff5c83970 :> [34;49m    if ( ( _mod < [34;49m[33;40m3[34;49m[34;49m ) && ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m3[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 125.20
[34;49m .. cement ( _mod, disp ) ; if ( ( _mod < [34;49m[33;40m3[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd412    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fd41c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd420    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 125.020 : Logic :> [33;40m<[34;49m <: cprimitive :> [34;49m    if ( ( _mod [34;49m[33;40m<[34;49m[34;49m 3 ) && ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 125.20[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c83970	< word : <literal>.[34;49m3[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c83b38	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.< :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 125.20
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 125.20
[34;49m .. lacement ( _mod, disp ) ; if ( ( _mod [34;49m[33;40m<[34;49m[34;49m 3 [34;49m[32;49m
0x7ffff72fd40b    48b90300000000000000    mov rcx, 0x3                                           [34;49m[32;49m
0x7ffff72fd415    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd418    0f9cc0                  setl al                                                [34;49m[32;49m
0x7ffff72fd41b    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd41f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd423    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 125.021 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 [34;49m[33;40m)[34;49m[34;49m && ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.025 : Logic :> [33;40m&&[34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 ) [34;49m[33;40m&&[34;49m[34;49m ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.026 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 ) && [34;49m[33;40m([34;49m[34;49m rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.030 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c84978 :> [34;49m    if ( ( _mod < 3 ) && ( [34;49m[33;40mrm[34;49m[34;49m == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 125.30
[34;49m .. _mod, disp ) ; if ( ( _mod < 3 ) && ( [34;49m[33;40mrm[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd426    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd42a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd42e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 125.033 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 ) && ( rm [34;49m[33;40m==[34;49m[34;49m 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.035 : <literal> :> [33;40m4[34;49m <: 0x00007ffff5c83250 :> [34;49m    if ( ( _mod < 3 ) && ( rm == [34;49m[33;40m4[34;49m[34;49m ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m4[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 125.35
[34;49m .. disp ) ; if ( ( _mod < 3 ) && ( rm == [34;49m[33;40m4[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd431    48b80400000000000000    mov rax, 0x4                                           [34;49m[32;49m
0x7ffff72fd43b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd43f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 125.035 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 ) && ( rm [34;49m[33;40m==[34;49m[34;49m 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 125.35[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c83250	< word : <literal>.[34;49m4[39;49m : value = 0x0000000000000004 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c84978	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c837a8	< word : Logic.[34;49m<[39;49m : value = 0x00005555555b7d22 > : [34;49mInteger . Integer -> Boolean [39;49m
type match :: Logic.== :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 125.35
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m==[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 125.35
[34;49m .. d, disp ) ; if ( ( _mod < 3 ) && ( rm [34;49m[33;40m==[34;49m[34;49m 4 [34;49m[32;49m
0x7ffff72fd42a    48b90400000000000000    mov rcx, 0x4                                           [34;49m[32;49m
0x7ffff72fd434    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd437    0f94c0                  setz al                                                [34;49m[32;49m
0x7ffff72fd43a    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd43e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd442    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 125.036 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 ) && ( rm == 4 [34;49m[33;40m)[34;49m[34;49m ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 125.036 : Logic :> [33;40m&&[34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 ) [34;49m[33;40m&&[34;49m[34;49m ( rm == 4 ) ) //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m&&[34;49m <:   61 bytes : at namespaces/compiler/x64.cft : 125.36
[34;49m .. nt ( _mod, disp ) ; if ( ( _mod < 3 ) [34;49m[33;40m&&[34;49m[34;49m ( rm == 4 )[34;49m[32;49m
0x7ffff72fd445    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fd448    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fd44c    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fd450    4885c9                  test rcx, rcx                                          [34;49m[32;49m
0x7ffff72fd453    0f8409000000            jz 0x7ffff72fd462          	< C compiler code >        [34;49m[32;49m
0x7ffff72fd459    4885c0                  test rax, rax                                          [34;49m[32;49m
0x7ffff72fd45c    0f850f000000            jnz 0x7ffff72fd471         	< C compiler code >        [34;49m[32;49m
0x7ffff72fd462    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fd46c    e90a000000              jmp 0x7ffff72fd47b         	< C compiler code >        [34;49m[32;49m
0x7ffff72fd471    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd47b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd47f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 125.038 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 ) && ( rm == 4 ) [34;49m[33;40m)[34;49m[34;49m //|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 125.38
[34;49m ..  ) ; if ( ( _mod < 3 ) && ( rm == 4 ) [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd482    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 125.38 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd407[34;49m.
dbg[c]  :: [34;49m...[34;49m : 125.041 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    if ( ( _mod < 3 ) && ( rm == 4 ) ) [34;49m[33;40m//[34;49m[34;49m|| ( ( rm == 5 ) && ( disp == 0 ) ) ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 127.006 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 127.6
[34;49m ..  ; if ( ( _mod < 3 ) && ( rm == 4 ) ) [34;49m[33;40m{[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd483    e900000000              jmp 0x7ffff72fd488         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 128.010 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m        [34;49m[33;40m//[34;49m[34;49m cf. InstructionSet-A-M-253666.pdf Table 2-2 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 129.009 : Lexer :> [33;40m"[34;49m <: cprimitive :> [34;49m        [34;49m[33;40m"[34;49m[34;49m\n\nCalculateModRmByte : MACHINE_CODE_ERROR\n\n" ps ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 129.057 : <literal> :> [33;40m"\n\nCalculateModRmByte : MACHINE_CODE_ERROR\n\n"[34;49m <: 0x00007ffff5c82968 :> [34;49m[34;49m[33;40m"\n\nCalculateModRmByte : MACHINE_CODE_ERROR\n\n"[34;49m[34;49m[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m"\n\nCalculateModRmByte : MACHINE_CODE_ERROR\n\n"[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 129.9
[34;49m ..  if ( ( _mod < 3 ) && ( rm == 4 ) ) { [34;49m[33;40m"\n\nCalculateModRmByte : MACHINE_CODE_ERROR\n\n"[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd488    48b842962cf7ff7f0000    mov rax, 0x7ffff72c9642    	< string : '[39;49m\n\nCalculateModRmByte : MACHINE_CODE_ERROR\n\n[34;49m' >[34;49m[32;49m
0x7ffff72fd492    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd496    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 129.061 : Int :> [33;40mps[34;49m <: 0x00007ffff728e7d8 :> [34;49m        "\n\nCalculateModRmByte : MACHINE_CODE_ERROR\n\n" [34;49m[33;40mps[34;49m[34;49m ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 129.61[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c82968	< word : <literal>.[34;49m"\n\nCalculateModRmByte : MACHINE_CODE_ERROR\n\n"[39;49m : value = 0x00007ffff72c9642 > : [34;49mString [39;49m
type match :: Int.ps :: type expected : String  :: type recorded : String  : namespaces/compiler/x64.cft : 129.61
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mps[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 129.61
[34;49m .. teModRmByte : MACHINE_CODE_ERROR\n\n" [34;49m[33;40mps[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd499    49b909332ff7ff7f0000    mov r9, 0x7ffff72f3309                                 [34;49m[32;49m
0x7ffff72fd4a3    49ffd1                  call r9                    	< Int.[39;49mps[34;49m : 0x00007ffff72f3309 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 130.014 : User :> [33;40mpause[34;49m <: 0x00007ffff72010e8 :> [34;49m        [34;49m[33;40mpause[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mpause[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 130.14
[34;49m .. RmByte : MACHINE_CODE_ERROR\n\n" ps ; [34;49m[33;40mpause[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4a6    49b98a502ff7ff7f0000    mov r9, 0x7ffff72f508a                                 [34;49m[32;49m
0x7ffff72fd4b0    49ffd1                  call r9                    	< User.[39;49mpause[34;49m : 0x00007ffff72f508a >[34;49m
dbg[c]  :: [34;49m...[34;49m : 131.013 : System :> [33;40mquit[34;49m <: cprimitive :> [34;49m        [34;49m[33;40mquit[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mquit[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 131.13
[34;49m ..  MACHINE_CODE_ERROR\n\n" ps ; pause ; [34;49m[33;40mquit[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4b3    49b83aa65b5555550000    mov r8, 0x5555555ba63a                                 [34;49m[32;49m
0x7ffff72fd4bd    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd4c7    49ffd1                  call r9                    	< System.[39;49mquit[34;49m : 0x00005555555ba63a >[34;49m
dbg[c]  :: [34;49m...[34;49m : 132.006 : Reserved :> [33;40m}[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m}[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 132.6
[34;49m .. E_CODE_ERROR\n\n" ps ; pause ; quit ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4ca    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 132.6 :> [39;49m}[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd488[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 133.7[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c85098	< word : int.[39;49mCalculateModRmByte[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 133.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( sib ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 133.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m sib ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 133.8
[34;49m .. E_ERROR\n\n" ps ; pause ; quit ; } if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd4be    e900000000              jmp 0x7ffff72fd4c3         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 133.013 : locals_0 :> [33;40msib[34;49m <: 0x00007ffff5c847b0 :> [34;49m    if ( [34;49m[33;40msib[34;49m[34;49m ) [34;49m 
_Do_C_Syntax_Variable : word = sib :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msib[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 133.13
[34;49m .. ERROR\n\n" ps ; pause ; quit ; } if ( [34;49m[33;40msib[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4c3    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd4c7    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd4cb    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 133.014 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( sib [34;49m[33;40m)[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 133.14
[34;49m .. R\n\n" ps ; pause ; quit ; } if ( sib [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd4ce    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 133.14 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd4c3[34;49m.
dbg[c]  :: [34;49m...[34;49m : 134.006 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 134.6
[34;49m .. n\n" ps ; pause ; quit ; } if ( sib ) [34;49m[33;40m{[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4cf    e900000000              jmp 0x7ffff72fd4d4         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 135.011 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c84978 :> [34;49m        [34;49m[33;40mrm[34;49m[34;49m = 4 ; // from intel _mod tables [34;49m 
dbg[c]  :: [34;49m...[34;49m : 135.013 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m        rm [34;49m[33;40m=[34;49m[34;49m 4 ; // from intel _mod tables [34;49m 
dbg[c]  :: [34;49m...[34;49m : 135.015 : <literal> :> [33;40m4[34;49m <: 0x00007ffff5c81b28 :> [34;49m        rm = [34;49m[33;40m4[34;49m[34;49m ; // from intel _mod tables [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m4[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 135.15
[34;49m ..  ; pause ; quit ; } if ( sib ) { rm = [34;49m[33;40m4[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4d4    48b80400000000000000    mov rax, 0x4                                           [34;49m[32;49m
0x7ffff72fd4de    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd4e2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 135.017 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m        rm [34;49m[33;40m=[34;49m[34;49m 4 ; // from intel _mod tables [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 135.17[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c81b28	< word : <literal>.[34;49m4[39;49m : value = 0x0000000000000004 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c81cf0	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 135.17
dbg[c]  :: [34;49m...[34;49m : 135.017 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c81960 :> [34;49m        [34;49m[33;40mrm[34;49m[34;49m = 4 ; // from intel _mod tables [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 135.17
[34;49m .. n" ps ; pause ; quit ; } if ( sib ) { [34;49m[33;40mrm[34;49m[34;49m = 4 ;  .. [34;49m[32;49m
0x7ffff72fd4e5    498d47e8                lea rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd4e9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd4ed    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 135.017 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m        rm [34;49m[33;40m=[34;49m[34;49m 4 ; // from intel _mod tables [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 135.17[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c81960	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 135.17
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 135.17
[34;49m .. ps ; pause ; quit ; } if ( sib ) { rm [34;49m[33;40m=[34;49m[34;49m 4 ;  .. [34;49m[32;49m
0x7ffff72fd4de    498d4fe8                lea rcx, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd4e2    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 135.017 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m        rm = 4 [34;49m[33;40m;[34;49m[34;49m // from intel _mod tables [34;49m 
dbg[c]  :: [34;49m...[34;49m : 135.019 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m        rm = 4 ; [34;49m[33;40m//[34;49m[34;49m from intel _mod tables [34;49m 
dbg[c]  :: [34;49m...[34;49m : 136.013 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c84b40 :> [34;49m        [34;49m[33;40m_reg[34;49m[34;49m = 0 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 136.015 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m        _reg [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 136.017 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c81240 :> [34;49m        _reg = [34;49m[33;40m0[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 136.17
[34;49m .. quit ; } if ( sib ) { rm = 4 ; _reg = [34;49m[33;40m0[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4e5    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fd4ef    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd4f3    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 136.019 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m        _reg [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 136.19[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c81240	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c84b40	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 136.19
dbg[c]  :: [34;49m...[34;49m : 136.019 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c81078 :> [34;49m        [34;49m[33;40m_reg[34;49m[34;49m = 0 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 136.19
[34;49m .. ause ; quit ; } if ( sib ) { rm = 4 ; [34;49m[33;40m_reg[34;49m[34;49m = 0 ;  .. [34;49m[32;49m
0x7ffff72fd4f6    498d47e0                lea rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fd4fa    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd4fe    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 136.019 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m        _reg [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 136.19[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c81078	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 136.19
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 136.19
[34;49m .. ; quit ; } if ( sib ) { rm = 4 ; _reg [34;49m[33;40m=[34;49m[34;49m 0 ;  .. [34;49m[32;49m
0x7ffff72fd4ef    498d4fe0                lea rcx, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fd4f3    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 136.019 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m        _reg = 0 [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 137.006 : Reserved :> [33;40m}[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m}[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 137.6
[34;49m ..  ; } if ( sib ) { rm = 4 ; _reg = 0 ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4f6    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 137.6 :> [39;49m}[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd4d4[34;49m.
dbg[c]  :: [34;49m...[34;49m : 138.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49mmodRm = ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // on[34;49m 
DataStack at : [39;49mnamespaces/compiler/x64.cft : 139.10[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c85098	< word : int.[39;49mCalculateModRmByte[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 139.010 : locals_0 :> [33;40mmodRm[34;49m <: 0x00007ffff5c84258 :> [34;49m    [34;49m[33;40mmodRm[34;49m[34;49m = ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ;[34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.012 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    modRm [34;49m[33;40m=[34;49m[34;49m ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.013 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    modRm = [34;49m[33;40m([34;49m[34;49m _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 bits[34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.019 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c84d08 :> [34;49m    modRm = ( [34;49m[33;40m_mod[34;49m[34;49m << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; [34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 139.19
[34;49m .. b ) { rm = 4 ; _reg = 0 ; } modRm = ( [34;49m[33;40m_mod[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4ed    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fd4f1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd4f5    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.022 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m    modRm = ( _mod [34;49m[33;40m<<[34;49m[34;49m 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.024 : <literal> :> [33;40m6[34;49m <: 0x00007ffff737f4b6 :> [34;49m    modRm = ( _mod << [34;49m[33;40m6[34;49m[34;49m ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; //[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m6[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 139.24
[34;49m ..  = 4 ; _reg = 0 ; } modRm = ( _mod << [34;49m[33;40m6[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd4f8    48b80600000000000000    mov rax, 0x6                                           [34;49m[32;49m
0x7ffff72fd502    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd506    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.024 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49m    modRm = ( _mod [34;49m[33;40m<<[34;49m[34;49m 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 139.24[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff737f4b6	< word : <literal>.[34;49m6[39;49m : value = 0x0000000000000006 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c859b8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c84258	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Bits.<< :: type expected : Integer  :: type recorded : Integer  : namespaces/compiler/x64.cft : 139.24
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<<[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 139.24
[34;49m ..  rm = 4 ; _reg = 0 ; } modRm = ( _mod [34;49m[33;40m<<[34;49m[34;49m 6  .. [34;49m[32;49m
0x7ffff72fd4f1    48b90600000000000000    mov rcx, 0x6                                           [34;49m[32;49m
0x7ffff72fd4fb    48d3e0                  shl rax, cl                                            [34;49m[32;49m
0x7ffff72fd4fe    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd502    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.025 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    modRm = ( _mod << 6 [34;49m[33;40m)[34;49m[34;49m + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use[34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.028 : Int :> [33;40m+[34;49m <: cprimitive :> [34;49m    modRm = ( _mod << 6 ) [34;49m[33;40m+[34;49m[34;49m ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 bi[34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.029 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    modRm = ( _mod << 6 ) + [34;49m[33;40m([34;49m[34;49m ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 bits[34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.039 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c84b40 :> [34;49m    modRm = ( _mod << 6 ) + ( ( ( [34;49m[33;40m_reg[34;49m[34;49m Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; [34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 139.39
[34;49m .. = 0 ; } modRm = ( _mod << 6 ) + ( ( ( [34;49m[33;40m_reg[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd505    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fd509    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd50d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.043 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49m    modRm = ( _mod << 6 ) + ( ( ( _reg [34;49m[33;40mBits[34;49m[34;49m.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mBits[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 139.43[32;49m
0x7ffff72fd510    49b96ef533f7ff7f0000    mov r9, 0x7ffff733f56e                                 [34;49m[32;49m
0x7ffff72fd51a    49ffd1                  call r9                    	< Logic.[39;49mBits[34;49m : 0x00007ffff733f56e >[34;49m
dbg[c]  :: [34;49m...[34;49m : 139.044 : Class :> [33;40m.[34;49m <: cprimitive :> [34;49m    modRm = ( _mod << 6 ) + ( ( ( _reg Bits[34;49m[33;40m.[34;49m[34;49m& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.046 : C_Syntax :> [33;40m&[34;49m <: cprimitive :> [34;49m    modRm = ( _mod << 6 ) + ( ( ( _reg Bits.[34;49m[33;40m&[34;49m[34;49m 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use[34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.050 : <literal> :> [33;40m0x7[34;49m <: 0x00007ffff737f6b1 :> [34;49mdRm = ( _mod << 6 ) + ( ( ( _reg Bits.& [34;49m[33;40m0x7[34;49m[34;49m ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // onl[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x7[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 139.50
[34;49m .. m = ( _mod << 6 ) + ( ( ( _reg Bits.& [34;49m[33;40m0x7[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd51d    48b80700000000000000    mov rax, 0x7                                           [34;49m[32;49m
0x7ffff72fd527    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd52b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.051 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49mmodRm = ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 [34;49m[33;40m)[34;49m[34;49m << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 b[34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.055 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49modRm = ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) [34;49m[33;40m<<[34;49m[34;49m 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 bits [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.057 : <literal> :> [33;40m3[34;49m <: 0x00007ffff737f8ac :> [34;49m _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << [34;49m[33;40m3[34;49m[34;49m ) + ( rm Bits.& 0x7 ) ) ; // only use 3 b[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m3[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 139.57
[34;49m .. d << 6 ) + ( ( ( _reg Bits.& 0x7 ) << [34;49m[33;40m3[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd52e    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fd538    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd53c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.057 : Bits :> [33;40m<<[34;49m <: cprimitive :> [34;49modRm = ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) [34;49m[33;40m<<[34;49m[34;49m 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 bits [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 139.57[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff737f8ac	< word : <literal>.[34;49m3[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff737f6b1	< word : <literal>.[34;49m0x7[39;49m : value = 0x0000000000000007 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c86468	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c85b80	< word : Bits.[34;49m<<[39;49m : value = 0x00005555555b7658 > : [34;49mInteger -> Integer [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c859b8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c84258	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Bits.<< :: type expected : Integer  :: type recorded : Integer  : namespaces/compiler/x64.cft : 139.57
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<<[34;49m <:   34 bytes : at namespaces/compiler/x64.cft : 139.57
[34;49m .. _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) [34;49m[33;40m<<[34;49m[34;49m 3  .. [34;49m[32;49m
0x7ffff72fd51d    48b80700000000000000    mov rax, 0x7                                           [34;49m[32;49m
0x7ffff72fd527    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd52b    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fd52e    48b8b826ddaaaaaa0200    mov rax, 0x2aaaaaadd26b8                               [34;49m[32;49m
0x7ffff72fd538    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd53c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.058 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 [34;49m[33;40m)[34;49m[34;49m + ( rm Bits.& 0x7 ) ) ; // only use 3 bits of [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.061 : Int :> [33;40m+[34;49m <: cprimitive :> [34;49m= ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) [34;49m[33;40m+[34;49m[34;49m ( rm Bits.& 0x7 ) ) ; // only use 3 bits of reg/[34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.062 : C :> [33;40m([34;49m <: cprimitive :> [34;49m ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + [34;49m[33;40m([34;49m[34;49m rm Bits.& 0x7 ) ) ; // only use 3 bits of reg/rm [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.066 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c84978 :> [34;49m6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( [34;49m[33;40mrm[34;49m[34;49m Bits.& 0x7 ) ) ; // only use 3 bits of re[34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 139.66
[34;49m ..  + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( [34;49m[33;40mrm[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd53f    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd543    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd547    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.070 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49m + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm [34;49m[33;40mBits[34;49m[34;49m.& 0x7 ) ) ; // only use 3 bits of reg/rm[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mBits[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 139.70[32;49m
0x7ffff72fd54a    49b96ef533f7ff7f0000    mov r9, 0x7ffff733f56e                                 [34;49m[32;49m
0x7ffff72fd554    49ffd1                  call r9                    	< Logic.[39;49mBits[34;49m : 0x00007ffff733f56e >[34;49m
dbg[c]  :: [34;49m...[34;49m : 139.071 : Class :> [33;40m.[34;49m <: cprimitive :> [34;49mmod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits[34;49m[33;40m.[34;49m[34;49m& 0x7 ) ) ; // only use 3 bits of reg/rm [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.073 : C_Syntax :> [33;40m&[34;49m <: cprimitive :> [34;49m << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.[34;49m[33;40m&[34;49m[34;49m 0x7 ) ) ; // only use 3 bits of reg/rm [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.077 : <literal> :> [33;40m0x7[34;49m <: 0x00007ffff737faa7 :> [34;49m ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& [34;49m[33;40m0x7[34;49m[34;49m ) ) ; // only use 3 bits of reg/rm [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x7[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 139.77
[34;49m .. reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& [34;49m[33;40m0x7[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd557    48b80700000000000000    mov rax, 0x7                                           [34;49m[32;49m
0x7ffff72fd561    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd565    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.078 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 [34;49m[33;40m)[34;49m[34;49m ) ; // only use 3 bits of reg/rm [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.078 : Int :> [33;40m+[34;49m <: cprimitive :> [34;49m= ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) [34;49m[33;40m+[34;49m[34;49m ( rm Bits.& 0x7 ) ) ; // only use 3 bits of reg/[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 139.78[39;49m :
TypeWordStack depth =   7 :  = Top = 0x00007ffff7fc1a58, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a58 > = 0x00007ffff737faa7	< word : <literal>.[34;49m0x7[39;49m : value = 0x0000000000000007 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c86f18	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a48 > = 0x00007ffff737f6b1	< word : <literal>.[34;49m0x7[39;49m : value = 0x0000000000000007 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c86468	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c85b80	< word : Bits.[34;49m<<[39;49m : value = 0x00005555555b7658 > : [34;49mInteger -> Integer [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c859b8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -6 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c84258	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Int.+ :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 139.78
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m+[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 139.78
[34;49m ..  6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) [34;49m[33;40m+[34;49m[34;49m ( rm Bits.& 0x7 ) .. [34;49m[32;49m
0x7ffff72fd557    498b06                  mov rax, [r14]                                         [34;49m[32;49m
0x7ffff72fd55a    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd55e    48b90700000000000000    mov rcx, 0x7                                           [34;49m[32;49m
0x7ffff72fd568    4803c1                  add rax, rcx                                           [34;49m[32;49m
0x7ffff72fd56b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd56f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.080 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) [34;49m[33;40m)[34;49m[34;49m ; // only use 3 bits of reg/rm [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.080 : Int :> [33;40m+[34;49m <: cprimitive :> [34;49m= ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) [34;49m[33;40m+[34;49m[34;49m ( rm Bits.& 0x7 ) ) ; // only use 3 bits of reg/[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 139.80[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c87470	< word : Int.[34;49m+[39;49m : value = 0x00005555555b785f > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff737f6b1	< word : <literal>.[34;49m0x7[39;49m : value = 0x0000000000000007 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c86468	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c85b80	< word : Bits.[34;49m<<[39;49m : value = 0x00005555555b7658 > : [34;49mInteger -> Integer [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c859b8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c84258	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Int.+ :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 139.80
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m+[34;49m <:   21 bytes : at namespaces/compiler/x64.cft : 139.80
[34;49m ..  6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) [34;49m[33;40m+[34;49m[34;49m ( rm Bits.& 0x7 ) ) .. [34;49m[32;49m
0x7ffff72fd572    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fd575    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fd579    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fd57d    4803c1                  add rax, rcx                                           [34;49m[32;49m
0x7ffff72fd580    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd584    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.083 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    modRm [34;49m[33;40m=[34;49m[34;49m ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use 3 [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 139.83[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c879c8	< word : Int.[34;49m+[39;49m : value = 0x00005555555b785f > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c86468	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c85b80	< word : Bits.[34;49m<<[39;49m : value = 0x00005555555b7658 > : [34;49mInteger -> Integer [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c859b8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c84258	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 139.83
dbg[c]  :: [34;49m...[34;49m : 139.083 : locals_0 :> [33;40mmodRm[34;49m <: 0x00007ffff5c87d58 :> [34;49m    [34;49m[33;40mmodRm[34;49m[34;49m = ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ;[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mmodRm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 139.83
[34;49m ..  } if ( sib ) { rm = 4 ; _reg = 0 ; } [34;49m[33;40mmodRm[34;49m[34;49m = ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ;  .. [34;49m[32;49m
0x7ffff72fd587    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd58b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd58f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.083 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    modRm [34;49m[33;40m=[34;49m[34;49m ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; // only use[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 139.83[39;49m :
TypeWordStack depth =   4 :  = Top = 0x00007ffff7fc1a40, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c87d58	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c85b80	< word : Bits.[34;49m<<[39;49m : value = 0x00005555555b7658 > : [34;49mInteger -> Integer [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c859b8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c84258	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer . Undefined  : namespaces/compiler/x64.cft : 139.83
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 139.83
[34;49m .. ( sib ) { rm = 4 ; _reg = 0 ; } modRm [34;49m[33;40m=[34;49m[34;49m ( _mod << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ;  .. [34;49m[32;49m
0x7ffff72fd580    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fd584    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 139.083 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m << 6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) [34;49m[33;40m;[34;49m[34;49m // only use 3 bits of reg/rm [34;49m 
dbg[c]  :: [34;49m...[34;49m : 139.085 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m6 ) + ( ( ( _reg Bits.& 0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; [34;49m[33;40m//[34;49m[34;49m only use 3 bits of reg/rm [34;49m 
dbg[c]  :: [34;49m...[34;49m : 140.011 : Compiler :> [33;40mreturn[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mreturn[34;49m[34;49m modRm ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 140.019 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    return modRm [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 141.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 141.2
[34;49m ..  0x7 ) << 3 ) + ( rm Bits.& 0x7 ) ) ; [34;49m[33;40mreturn[34;49m[34;49m modRm ; }  .. [34;49m[32;49m
0x7ffff72fd587    498b4708                mov rax, [r15+0x8]                                     [34;49m
[34;49m ..  ( rm Bits.& 0x7 ) ) ; return modRm ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd58b    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fd58f    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd593    4983ee20                sub r14, 0x20                                          [34;49m
[34;49m .. << 3 ) + ( rm Bits.& 0x7 ) ) ; return [34;49m[33;40mmodRm[34;49m[34;49m ; }  .. [34;49m[32;49m
0x7ffff72fd597    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fd59a    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 141.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 141.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 143.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m'CalculateModRmByte find wdiss apause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 160.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif 0 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 160.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m 0 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 160.006 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cf58f8 :> [34;49m#if [34;49m[33;40m0[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 160.6 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 210.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 212.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_ImmDispData ( immDisp, immSize, forceFlag ) {  .. [34;49m[32;49m
0x7ffff72fd59b    e900000000              jmp 0x7ffff72fd5a0         	< C compiler code >        [34;49m[32;49m
0x7ffff72fd5a0    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd5a4    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd5a8    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 212.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c88478[34;49m.
dbg[c]  :: [34;49m...[34;49m : 213.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49m the opcode probably is all that needs to be adjusted for this to not be necessary [34;49m 
dbg[c]  :: [34;49m...[34;49m : 215.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( immSize > 0 ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 215.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m immSize > 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 215.8
[34;49m ..  ( immDisp, immSize, forceFlag ) { if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fd5af    e900000000              jmp 0x7ffff72fd5b4         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 215.017 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c87f20 :> [34;49m    if ( [34;49m[33;40mimmSize[34;49m[34;49m > 0 ) [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 215.17
[34;49m ..  immDisp, immSize, forceFlag ) { if ( [34;49m[33;40mimmSize[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd5b4    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd5b8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd5bc    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 215.019 : Logic :> [33;40m>[34;49m <: cprimitive :> [34;49m    if ( immSize [34;49m[33;40m>[34;49m[34;49m 0 ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 215.021 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c87b90 :> [34;49m    if ( immSize > [34;49m[33;40m0[34;49m[34;49m ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 215.21
[34;49m .. immSize, forceFlag ) { if ( immSize > [34;49m[33;40m0[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd5bf    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fd5c9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd5cd    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 215.021 : Logic :> [33;40m>[34;49m <: cprimitive :> [34;49m    if ( immSize [34;49m[33;40m>[34;49m[34;49m 0 ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 215.21[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c87b90	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c87f20	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.> :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 215.21
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m>[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 215.21
[34;49m .. , immSize, forceFlag ) { if ( immSize [34;49m[33;40m>[34;49m[34;49m 0 [34;49m[32;49m
0x7ffff72fd5b8    48b90000000000000000    mov rcx, 0x0                                           [34;49m[32;49m
0x7ffff72fd5c2    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd5c5    0f9fc0                  setg al                                                [34;49m[32;49m
0x7ffff72fd5c8    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd5cc    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd5d0    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 215.022 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( immSize > 0 [34;49m[33;40m)[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 215.22
[34;49m .. mSize, forceFlag ) { if ( immSize > 0 [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd5d3    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 215.22 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd5b4[34;49m.
dbg[c]  :: [34;49m...[34;49m : 216.006 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 216.6
[34;49m .. ize, forceFlag ) { if ( immSize > 0 ) [34;49m[33;40m{[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd5d4    e900000000              jmp 0x7ffff72fd5d9         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 217.011 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m        [34;49m[33;40mif[34;49m[34;49m ( immSize == BYTE ) compile1 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 217.012 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m        if [34;49m[33;40m([34;49m[34;49m immSize == BYTE ) compile1 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 217.12
[34;49m .. forceFlag ) { if ( immSize > 0 ) { if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fd5d9    e900000000              jmp 0x7ffff72fd5de         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 217.021 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c87f20 :> [34;49m        if ( [34;49m[33;40mimmSize[34;49m[34;49m == BYTE ) compile1 (immDisp)  ; [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 217.21
[34;49m .. rceFlag ) { if ( immSize > 0 ) { if ( [34;49m[33;40mimmSize[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd5de    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd5e2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd5e6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 217.024 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m        if ( immSize [34;49m[33;40m==[34;49m[34;49m BYTE ) compile1 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 217.029 : X64 :> [33;40mBYTE[34;49m <: 0x00007ffff5c7de60 :> [34;49m        if ( immSize == [34;49m[33;40mBYTE[34;49m[34;49m ) compile1 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mBYTE[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 217.29
[34;49m ..  if ( immSize > 0 ) { if ( immSize == [34;49m[33;40mBYTE[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd5e9    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd5f3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd5f7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 217.029 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m        if ( immSize [34;49m[33;40m==[34;49m[34;49m BYTE ) compile1 (immDisp)  ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 217.29[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c7de60	< word : X64.[34;49mBYTE[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c86f18	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Logic.== :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 217.29
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m==[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 217.29
[34;49m .. ) { if ( immSize > 0 ) { if ( immSize [34;49m[33;40m==[34;49m[34;49m BYTE [34;49m[32;49m
0x7ffff72fd5e2    48b90100000000000000    mov rcx, 0x1                                           [34;49m[32;49m
0x7ffff72fd5ec    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd5ef    0f94c0                  setz al                                                [34;49m[32;49m
0x7ffff72fd5f2    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd5f6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd5fa    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 217.030 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m        if ( immSize == BYTE [34;49m[33;40m)[34;49m[34;49m compile1 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 217.30
[34;49m ..  immSize > 0 ) { if ( immSize == BYTE [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd5fd    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 217.30 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd5de[34;49m.
dbg[c]  :: [34;49m...[34;49m : 217.040 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m        if ( immSize == BYTE ) [34;49m[33;40m{[34;49m[34;49mompile1 (immDisp)  ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 217.40
[34;49m .. immSize > 0 ) { if ( immSize == BYTE )[34;49m[33;40m{[34;49m[34;49mcompile1 [34;49m[32;49m
0x7ffff72fd5fe    e900000000              jmp 0x7ffff72fd603         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 217.040 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m        if ( immSize == BYTE ) [34;49m[33;40mcompile1[34;49m[34;49m (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 217.048 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c880e8 :> [34;49m        if ( immSize == BYTE ) compile1 ([34;49m[33;40mimmDisp[34;49m[34;49m)  ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 217.48
[34;49m ..  ) { if ( immSize == BYTE ) compile1 ([34;49m[33;40mimmDisp[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd603    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd607    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd60b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 217.049 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m        if ( immSize == BYTE ) [34;49m[33;40mcompile1[34;49m[34;49m (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile1[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 217.49
[34;49m .. mmSize > 0 ) { if ( immSize == BYTE ) [34;49m[33;40mcompile1[34;49m[34;49m (immDisp)[34;49m[32;49m
0x7ffff72fd60e    49b87da85b5555550000    mov r8, 0x5555555ba87d                                 [34;49m[32;49m
0x7ffff72fd618    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd622    49ffd1                  call r9                    	< Asm.[39;49mcompile1[34;49m : 0x00005555555ba87d >[34;49m
dbg[c]  :: [34;49m...[34;49m : 217.053 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m        if ( immSize == BYTE ) compile1 (immDisp)  [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 217.53
[34;49m ..  immSize == BYTE ) compile1 (immDisp) [34;49m[33;40m;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd625    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 217.53 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd603[34;49m.
dbg[c]  :: [34;49m...[34;49m : 219.010 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m        [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 219.10
[34;49m .. == BYTE ) compile1 (immDisp) ;  else  [34;49m[33;40m{[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd626    e900000000              jmp 0x7ffff72fd62b         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 220.015 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m            [34;49m[33;40mif[34;49m[34;49m ( immSize == 4 ) compile4 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 220.016 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m            if [34;49m[33;40m([34;49m[34;49m immSize == 4 ) compile4 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 220.16
[34;49m .. E ) compile1 (immDisp) ;  else  {  if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fd62b    e900000000              jmp 0x7ffff72fd630         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 220.025 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c87f20 :> [34;49m            if ( [34;49m[33;40mimmSize[34;49m[34;49m == 4 ) compile4 (immDisp)  ; [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 220.25
[34;49m .. ) compile1 (immDisp) ;  else  {  if ( [34;49m[33;40mimmSize[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd630    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd634    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd638    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 220.028 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m            if ( immSize [34;49m[33;40m==[34;49m[34;49m 4 ) compile4 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 220.030 : <literal> :> [33;40m4[34;49m <: 0x00007ffff5c85d48 :> [34;49m            if ( immSize == [34;49m[33;40m4[34;49m[34;49m ) compile4 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m4[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 220.30
[34;49m .. (immDisp) ;  else  {  if ( immSize == [34;49m[33;40m4[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd63b    48b80400000000000000    mov rax, 0x4                                           [34;49m[32;49m
0x7ffff72fd645    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd649    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 220.030 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m            if ( immSize [34;49m[33;40m==[34;49m[34;49m 4 ) compile4 (immDisp)  ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 220.30[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c85d48	< word : <literal>.[34;49m4[39;49m : value = 0x0000000000000004 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c85f10	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Logic.== :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 220.30
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m==[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 220.30
[34;49m .. e1 (immDisp) ;  else  {  if ( immSize [34;49m[33;40m==[34;49m[34;49m 4 [34;49m[32;49m
0x7ffff72fd634    48b90400000000000000    mov rcx, 0x4                                           [34;49m[32;49m
0x7ffff72fd63e    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd641    0f94c0                  setz al                                                [34;49m[32;49m
0x7ffff72fd644    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd648    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd64c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 220.031 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m            if ( immSize == 4 [34;49m[33;40m)[34;49m[34;49m compile4 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 220.31
[34;49m .. mmDisp) ;  else  {  if ( immSize == 4 [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd64f    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 220.31 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd630[34;49m.
dbg[c]  :: [34;49m...[34;49m : 220.041 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m            if ( immSize == 4 ) [34;49m[33;40m{[34;49m[34;49mompile4 (immDisp)  ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 220.41
[34;49m .. mDisp) ;  else  {  if ( immSize == 4 )[34;49m[33;40m{[34;49m[34;49mcompile4  .. [34;49m[32;49m
0x7ffff72fd650    e900000000              jmp 0x7ffff72fd655         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 220.041 : Asm :> [33;40mcompile4[34;49m <: cprimitive :> [34;49m            if ( immSize == 4 ) [34;49m[33;40mcompile4[34;49m[34;49m (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 220.049 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c880e8 :> [34;49m            if ( immSize == 4 ) compile4 ([34;49m[33;40mimmDisp[34;49m[34;49m)  ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 220.49
[34;49m .. lse  {  if ( immSize == 4 ) compile4 ([34;49m[33;40mimmDisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd655    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd659    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd65d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 220.050 : Asm :> [33;40mcompile4[34;49m <: cprimitive :> [34;49m            if ( immSize == 4 ) [34;49m[33;40mcompile4[34;49m[34;49m (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile4[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 220.50
[34;49m .. Disp) ;  else  {  if ( immSize == 4 ) [34;49m[33;40mcompile4[34;49m[34;49m (immDisp) .. [34;49m[32;49m
0x7ffff72fd660    49b819a85b5555550000    mov r8, 0x5555555ba819                                 [34;49m[32;49m
0x7ffff72fd66a    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd674    49ffd1                  call r9                    	< Asm.[39;49mcompile4[34;49m : 0x00005555555ba819 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 220.054 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m            if ( immSize == 4 ) compile4 (immDisp)  [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 220.54
[34;49m .. f ( immSize == 4 ) compile4 (immDisp) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd677    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 220.54 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd655[34;49m.
dbg[c]  :: [34;49m...[34;49m : 221.020 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m            else [34;49m[33;40m{[34;49m[34;49mf ( immSize == CELL ) compile8 (immDisp) ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 221.20
[34;49m .. ize == 4 ) compile4 (immDisp) ;  else [34;49m[33;40m{[34;49m[34;49mf  .. [34;49m[32;49m
0x7ffff72fd678    e900000000              jmp 0x7ffff72fd67d         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 221.020 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m            else [34;49m[33;40mif[34;49m[34;49m ( immSize == CELL ) compile8 (immDisp) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 221.021 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m            else if [34;49m[33;40m([34;49m[34;49m immSize == CELL ) compile8 (immDisp) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 221.21
[34;49m ..  == 4 ) compile4 (immDisp) ;  else if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd67d    e900000000              jmp 0x7ffff72fd682         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 221.030 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c87f20 :> [34;49m            else if ( [34;49m[33;40mimmSize[34;49m[34;49m == CELL ) compile8 (immDisp) ; [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 221.30
[34;49m .. = 4 ) compile4 (immDisp) ;  else if ( [34;49m[33;40mimmSize[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd682    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd686    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd68a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 221.033 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m            else if ( immSize [34;49m[33;40m==[34;49m[34;49m CELL ) compile8 (immDisp) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 221.038 : X64 :> [33;40mCELL[34;49m <: 0x00007ffff5c7e028 :> [34;49m            else if ( immSize == [34;49m[33;40mCELL[34;49m[34;49m ) compile8 (immDisp) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCELL[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 221.38
[34;49m .. le4 (immDisp) ;  else if ( immSize == [34;49m[33;40mCELL[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd68d    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fd697    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd69b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 221.038 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m            else if ( immSize [34;49m[33;40m==[34;49m[34;49m CELL ) compile8 (immDisp) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 221.38[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c7e028	< word : X64.[34;49mCELL[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c81eb8	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Logic.== :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 221.38
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m==[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 221.38
[34;49m .. mpile4 (immDisp) ;  else if ( immSize [34;49m[33;40m==[34;49m[34;49m CELL  .. [34;49m[32;49m
0x7ffff72fd686    48b90800000000000000    mov rcx, 0x8                                           [34;49m[32;49m
0x7ffff72fd690    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd693    0f94c0                  setz al                                                [34;49m[32;49m
0x7ffff72fd696    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd69a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd69e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 221.039 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m            else if ( immSize == CELL [34;49m[33;40m)[34;49m[34;49m compile8 (immDisp) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 221.39
[34;49m .. immDisp) ;  else if ( immSize == CELL [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd6a1    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 221.39 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd682[34;49m.
dbg[c]  :: [34;49m...[34;49m : 221.049 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m            else if ( immSize == CELL ) [34;49m[33;40m{[34;49m[34;49mompile8 (immDisp) ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 221.49
[34;49m .. mmDisp) ;  else if ( immSize == CELL )[34;49m[33;40m{[34;49m[34;49mcompile8  .. [34;49m[32;49m
0x7ffff72fd6a2    e900000000              jmp 0x7ffff72fd6a7         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 221.049 : Asm :> [33;40mcompile8[34;49m <: cprimitive :> [34;49m            else if ( immSize == CELL ) [34;49m[33;40mcompile8[34;49m[34;49m (immDisp) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 221.057 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c880e8 :> [34;49m            else if ( immSize == CELL ) compile8 ([34;49m[33;40mimmDisp[34;49m[34;49m) ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 221.57
[34;49m .. else if ( immSize == CELL ) compile8 ([34;49m[33;40mimmDisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd6a7    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd6ab    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd6af    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 221.058 : Asm :> [33;40mcompile8[34;49m <: cprimitive :> [34;49m            else if ( immSize == CELL ) [34;49m[33;40mcompile8[34;49m[34;49m (immDisp) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile8[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 221.58
[34;49m .. mDisp) ;  else if ( immSize == CELL ) [34;49m[33;40mcompile8[34;49m[34;49m (immDisp) .. [34;49m[32;49m
0x7ffff72fd6b2    49b8f2a75b5555550000    mov r8, 0x5555555ba7f2                                 [34;49m[32;49m
0x7ffff72fd6bc    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd6c6    49ffd1                  call r9                    	< Asm.[39;49mcompile8[34;49m : 0x00005555555ba7f2 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 221.061 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m            else if ( immSize == CELL ) compile8 (immDisp) [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 221.61
[34;49m ..  immSize == CELL ) compile8 (immDisp) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd6c9    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 221.61 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd6a7[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 222.10[34;49m :
DataStack depth =  10 : Dsp (R14) = Top = 0x00007ffff7269248, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269248 > = 0x00007ffff72fd655	
  DataStack   [  -1 ] < 0x00007ffff7269240 > = 0x00007ffff72fd630	
  DataStack   [  -2 ] < 0x00007ffff7269238 > = 0x00007ffff72fd603	
  DataStack   [  -3 ] < 0x00007ffff7269230 > = 0x00007ffff72fd5de	
  DataStack   [  -4 ] < 0x00007ffff7269228 > = 0x00007ffff72fd5b4	
  DataStack   [  -5 ] < 0x00007ffff7269220 > = 0x00007ffff5c88478	< word : void.[39;49m_Compile_ImmDispData[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -6 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -7 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -8 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -9 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 222.010 : Reserved :> [33;40m}[34;49m <: cprimitive :> [34;49m        [34;49m[33;40m}[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 222.10
[34;49m .. mSize == CELL ) compile8 (immDisp) ;  [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd6b6    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 222.10 :> [39;49m}[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd67d[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 222.10[34;49m :
DataStack depth =   8 : Dsp (R14) = Top = 0x00007ffff7269238, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269238 > = 0x00007ffff72fd603	
  DataStack   [  -1 ] < 0x00007ffff7269230 > = 0x00007ffff72fd5de	
  DataStack   [  -2 ] < 0x00007ffff7269228 > = 0x00007ffff72fd5b4	
  DataStack   [  -3 ] < 0x00007ffff7269220 > = 0x00007ffff5c88478	< word : void.[39;49m_Compile_ImmDispData[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -4 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -5 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -6 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -7 ] < 0x00007ffff7269200 > = 0x0000000000000005	
DataStack at : [39;49mnamespaces/compiler/x64.cft : 222.10[34;49m :
DataStack depth =   6 : Dsp (R14) = Top = 0x00007ffff7269228, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269228 > = 0x00007ffff72fd5b4	
  DataStack   [  -1 ] < 0x00007ffff7269220 > = 0x00007ffff5c88478	< word : void.[39;49m_Compile_ImmDispData[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -2 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -5 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 224.011 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    else [34;49m[33;40m//[34;49m[34;49m with operandSize == 0 let the compiler use the minimal size ; nb. can't be imm[34;49m 
dbg[c]  :: [34;49m...[34;49m : 225.006 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 225.6
[34;49m .. ELL ) compile8 (immDisp) ;  }  } else [34;49m[33;40m{[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd68f    e900000000              jmp 0x7ffff72fd694         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 226.011 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m        [34;49m[33;40mif[34;49m[34;49m ( immDisp >= 0x100000000 ) compile8 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 226.012 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m        if [34;49m[33;40m([34;49m[34;49m immDisp >= 0x100000000 ) compile8 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 226.12
[34;49m ..  compile8 (immDisp) ;  }  } else { if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd694    e900000000              jmp 0x7ffff72fd699         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 226.021 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c880e8 :> [34;49m        if ( [34;49m[33;40mimmDisp[34;49m[34;49m >= 0x100000000 ) compile8 (immDisp)  ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 226.21
[34;49m .. ompile8 (immDisp) ;  }  } else { if ( [34;49m[33;40mimmDisp[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd699    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd69d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd6a1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 226.024 : Logic :> [33;40m>=[34;49m <: cprimitive :> [34;49m        if ( immDisp [34;49m[33;40m>=[34;49m[34;49m 0x100000000 ) compile8 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 226.036 : <literal> :> [33;40m0x100000000[34;49m <: 0x00007ffff737fe07 :> [34;49m        if ( immDisp >= [34;49m[33;40m0x100000000[34;49m[34;49m ) compile8 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x100000000[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 226.36
[34;49m .. mDisp) ;  }  } else { if ( immDisp >= [34;49m[33;40m0x100000000[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd6a4    48b80000000001000000    mov rax, 0x100000000                                   [34;49m[32;49m
0x7ffff72fd6ae    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd6b2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 226.036 : Logic :> [33;40m>=[34;49m <: cprimitive :> [34;49m        if ( immDisp [34;49m[33;40m>=[34;49m[34;49m 0x100000000 ) compile8 (immDisp)  ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 226.36[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff737fe07	< word : <literal>.[34;49m0x100000000[39;49m : value = 0x0000000100000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c88840	< word : locals_0.[34;49mimmDisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.>= :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 226.36
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m>=[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 226.36
[34;49m .. (immDisp) ;  }  } else { if ( immDisp [34;49m[33;40m>=[34;49m[34;49m 0x100000000  .. [34;49m[32;49m
0x7ffff72fd69d    48b90000000001000000    mov rcx, 0x100000000                                   [34;49m[32;49m
0x7ffff72fd6a7    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd6aa    0f9dc0                  setge al                                               [34;49m[32;49m
0x7ffff72fd6ad    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd6b1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd6b5    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 226.037 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m        if ( immDisp >= 0x100000000 [34;49m[33;40m)[34;49m[34;49m compile8 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 226.37
[34;49m ..  } else { if ( immDisp >= 0x100000000 [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd6b8    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 226.37 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd699[34;49m.
dbg[c]  :: [34;49m...[34;49m : 226.047 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m        if ( immDisp >= 0x100000000 ) [34;49m[33;40m{[34;49m[34;49mompile8 (immDisp)  ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 226.47
[34;49m .. } else { if ( immDisp >= 0x100000000 )[34;49m[33;40m{[34;49m[34;49mcompile8  .. [34;49m[32;49m
0x7ffff72fd6b9    e900000000              jmp 0x7ffff72fd6be         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 226.047 : Asm :> [33;40mcompile8[34;49m <: cprimitive :> [34;49m        if ( immDisp >= 0x100000000 ) [34;49m[33;40mcompile8[34;49m[34;49m (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 226.055 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c880e8 :> [34;49m        if ( immDisp >= 0x100000000 ) compile8 ([34;49m[33;40mimmDisp[34;49m[34;49m)  ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 226.55
[34;49m ..  ( immDisp >= 0x100000000 ) compile8 ([34;49m[33;40mimmDisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd6be    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd6c2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd6c6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 226.056 : Asm :> [33;40mcompile8[34;49m <: cprimitive :> [34;49m        if ( immDisp >= 0x100000000 ) [34;49m[33;40mcompile8[34;49m[34;49m (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile8[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 226.56
[34;49m ..  else { if ( immDisp >= 0x100000000 ) [34;49m[33;40mcompile8[34;49m[34;49m (immDisp) .. [34;49m[32;49m
0x7ffff72fd6c9    49b8f2a75b5555550000    mov r8, 0x5555555ba7f2                                 [34;49m[32;49m
0x7ffff72fd6d3    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd6dd    49ffd1                  call r9                    	< Asm.[39;49mcompile8[34;49m : 0x00005555555ba7f2 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 226.060 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m        if ( immDisp >= 0x100000000 ) compile8 (immDisp)  [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 226.60
[34;49m .. p >= 0x100000000 ) compile8 (immDisp) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd6e0    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 226.60 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd6be[34;49m.
dbg[c]  :: [34;49m...[34;49m : 228.010 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m        [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 228.10
[34;49m .. 00000000 ) compile8 (immDisp) ; else  [34;49m[33;40m{[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd6e1    e900000000              jmp 0x7ffff72fd6e6         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 229.015 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m            [34;49m[33;40mif[34;49m[34;49m ( immDisp >= 0x100 ) compile4 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 229.016 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m            if [34;49m[33;40m([34;49m[34;49m immDisp >= 0x100 ) compile4 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 229.16
[34;49m .. 000 ) compile8 (immDisp) ; else  { if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd6e6    e900000000              jmp 0x7ffff72fd6eb         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 229.025 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c880e8 :> [34;49m            if ( [34;49m[33;40mimmDisp[34;49m[34;49m >= 0x100 ) compile4 (immDisp)  ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 229.25
[34;49m .. 0 ) compile8 (immDisp) ; else  { if ( [34;49m[33;40mimmDisp[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd6eb    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd6ef    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd6f3    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 229.028 : Logic :> [33;40m>=[34;49m <: cprimitive :> [34;49m            if ( immDisp [34;49m[33;40m>=[34;49m[34;49m 0x100 ) compile4 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 229.034 : <literal> :> [33;40m0x100[34;49m <: 0x00007ffff7380002 :> [34;49m            if ( immDisp >= [34;49m[33;40m0x100[34;49m[34;49m ) compile4 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x100[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 229.34
[34;49m .. 8 (immDisp) ; else  { if ( immDisp >= [34;49m[33;40m0x100[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd6f6    48b80001000000000000    mov rax, 0x100                                         [34;49m[32;49m
0x7ffff72fd700    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd704    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 229.034 : Logic :> [33;40m>=[34;49m <: cprimitive :> [34;49m            if ( immDisp [34;49m[33;40m>=[34;49m[34;49m 0x100 ) compile4 (immDisp)  ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 229.34[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff7380002	< word : <literal>.[34;49m0x100[39;49m : value = 0x0000000000000100 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c89a10	< word : locals_0.[34;49mimmDisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.>= :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 229.34
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m>=[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 229.34
[34;49m .. ile8 (immDisp) ; else  { if ( immDisp [34;49m[33;40m>=[34;49m[34;49m 0x100  .. [34;49m[32;49m
0x7ffff72fd6ef    48b90001000000000000    mov rcx, 0x100                                         [34;49m[32;49m
0x7ffff72fd6f9    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd6fc    0f9dc0                  setge al                                               [34;49m[32;49m
0x7ffff72fd6ff    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd703    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd707    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 229.035 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m            if ( immDisp >= 0x100 [34;49m[33;40m)[34;49m[34;49m compile4 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 229.35
[34;49m .. Disp) ; else  { if ( immDisp >= 0x100 [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd70a    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 229.35 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd6eb[34;49m.
dbg[c]  :: [34;49m...[34;49m : 229.045 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m            if ( immDisp >= 0x100 ) [34;49m[33;40m{[34;49m[34;49mompile4 (immDisp)  ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 229.45
[34;49m .. isp) ; else  { if ( immDisp >= 0x100 )[34;49m[33;40m{[34;49m[34;49mcompile4  .. [34;49m[32;49m
0x7ffff72fd70b    e900000000              jmp 0x7ffff72fd710         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 229.045 : Asm :> [33;40mcompile4[34;49m <: cprimitive :> [34;49m            if ( immDisp >= 0x100 ) [34;49m[33;40mcompile4[34;49m[34;49m (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 229.053 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c880e8 :> [34;49m            if ( immDisp >= 0x100 ) compile4 ([34;49m[33;40mimmDisp[34;49m[34;49m)  ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 229.53
[34;49m ..   { if ( immDisp >= 0x100 ) compile4 ([34;49m[33;40mimmDisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd710    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd714    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd718    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 229.054 : Asm :> [33;40mcompile4[34;49m <: cprimitive :> [34;49m            if ( immDisp >= 0x100 ) [34;49m[33;40mcompile4[34;49m[34;49m (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile4[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 229.54
[34;49m .. sp) ; else  { if ( immDisp >= 0x100 ) [34;49m[33;40mcompile4[34;49m[34;49m (immDisp) .. [34;49m[32;49m
0x7ffff72fd71b    49b819a85b5555550000    mov r8, 0x5555555ba819                                 [34;49m[32;49m
0x7ffff72fd725    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd72f    49ffd1                  call r9                    	< Asm.[39;49mcompile4[34;49m : 0x00005555555ba819 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 229.058 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m            if ( immDisp >= 0x100 ) compile4 (immDisp)  [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 229.58
[34;49m .. immDisp >= 0x100 ) compile4 (immDisp) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd732    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 229.58 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd710[34;49m.
dbg[c]  :: [34;49m...[34;49m : 230.020 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m            else [34;49m[33;40m{[34;49m[34;49mf ( immDisp || forceFlag ) compile1 (immDisp)  ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 230.20
[34;49m ..  >= 0x100 ) compile4 (immDisp) ; else [34;49m[33;40m{[34;49m[34;49mf  .. [34;49m[32;49m
0x7ffff72fd733    e900000000              jmp 0x7ffff72fd738         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 230.020 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m            else [34;49m[33;40mif[34;49m[34;49m ( immDisp || forceFlag ) compile1 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 230.021 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m            else if [34;49m[33;40m([34;49m[34;49m immDisp || forceFlag ) compile1 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 230.21
[34;49m ..  0x100 ) compile4 (immDisp) ; else if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd738    e900000000              jmp 0x7ffff72fd73d         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 230.030 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c880e8 :> [34;49m            else if ( [34;49m[33;40mimmDisp[34;49m[34;49m || forceFlag ) compile1 (immDisp)  ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 230.30
[34;49m .. x100 ) compile4 (immDisp) ; else if ( [34;49m[33;40mimmDisp[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd73d    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd741    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd745    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 230.033 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m            else if ( immDisp [34;49m[33;40m||[34;49m[34;49m forceFlag ) compile1 (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 230.043 : locals_0 :> [33;40mforceFlag[34;49m <: 0x00007ffff5c87d58 :> [34;49m            else if ( immDisp || [34;49m[33;40mforceFlag[34;49m[34;49m ) compile1 (immDisp)  ; [34;49m 
_Do_C_Syntax_Variable : word = forceFlag :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mforceFlag[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 230.43
[34;49m .. ile4 (immDisp) ; else if ( immDisp || [34;49m[33;40mforceFlag[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd748    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fd74c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd750    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 230.043 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m            else if ( immDisp [34;49m[33;40m||[34;49m[34;49m forceFlag ) compile1 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m||[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 230.43
[34;49m .. ompile4 (immDisp) ; else if ( immDisp [34;49m[33;40m||[34;49m[34;49m forceFlag  .. [34;49m[32;49m
0x7ffff72fd741    498b4ff8                mov rcx, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fd745    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fd748    4885c0                  test rax, rax                                          [34;49m[32;49m
0x7ffff72fd74b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd74f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 230.044 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m            else if ( immDisp || forceFlag [34;49m[33;40m)[34;49m[34;49m compile1 (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 230.44
[34;49m .. isp) ; else if ( immDisp || forceFlag [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd752    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 230.44 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd73d[34;49m.
dbg[c]  :: [34;49m...[34;49m : 230.054 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m            else if ( immDisp || forceFlag ) [34;49m[33;40m{[34;49m[34;49mompile1 (immDisp)  ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 230.54
[34;49m .. sp) ; else if ( immDisp || forceFlag )[34;49m[33;40m{[34;49m[34;49mcompile1  .. [34;49m[32;49m
0x7ffff72fd753    e900000000              jmp 0x7ffff72fd758         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 230.054 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m            else if ( immDisp || forceFlag ) [34;49m[33;40mcompile1[34;49m[34;49m (immDisp)  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 230.062 : locals_0 :> [33;40mimmDisp[34;49m <: 0x00007ffff5c880e8 :> [34;49m            else if ( immDisp || forceFlag ) compile1 ([34;49m[33;40mimmDisp[34;49m[34;49m)  ; [34;49m 
_Do_C_Syntax_Variable : word = immDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 230.62
[34;49m .. if ( immDisp || forceFlag ) compile1 ([34;49m[33;40mimmDisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd758    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd75c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd760    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 230.063 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m            else if ( immDisp || forceFlag ) [34;49m[33;40mcompile1[34;49m[34;49m (immDisp)  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile1[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 230.63
[34;49m .. p) ; else if ( immDisp || forceFlag ) [34;49m[33;40mcompile1[34;49m[34;49m (immDisp) .. [34;49m[32;49m
0x7ffff72fd763    49b87da85b5555550000    mov r8, 0x5555555ba87d                                 [34;49m[32;49m
0x7ffff72fd76d    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd777    49ffd1                  call r9                    	< Asm.[39;49mcompile1[34;49m : 0x00005555555ba87d >[34;49m
dbg[c]  :: [34;49m...[34;49m : 230.067 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m            else if ( immDisp || forceFlag ) compile1 (immDisp)  [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 230.67
[34;49m .. isp || forceFlag ) compile1 (immDisp) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd77a    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 230.67 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd758[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 231.10[34;49m :
DataStack depth =  11 : Dsp (R14) = Top = 0x00007ffff7269250, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269250 > = 0x00007ffff72fd710	
  DataStack   [  -1 ] < 0x00007ffff7269248 > = 0x00007ffff72fd6eb	
  DataStack   [  -2 ] < 0x00007ffff7269240 > = 0x00007ffff72fd6be	
  DataStack   [  -3 ] < 0x00007ffff7269238 > = 0x00007ffff72fd699	
  DataStack   [  -4 ] < 0x00007ffff7269230 > = 0x00007ffff72fd5d9	
  DataStack   [  -5 ] < 0x00007ffff7269228 > = 0x00007ffff72fd5b4	
  DataStack   [  -6 ] < 0x00007ffff7269220 > = 0x00007ffff5c88478	< word : void.[39;49m_Compile_ImmDispData[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -7 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -8 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -9 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [ -10 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 231.010 : Reserved :> [33;40m}[34;49m <: cprimitive :> [34;49m        [34;49m[33;40m}[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 231.10
[34;49m .. p || forceFlag ) compile1 (immDisp) ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd76e    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 231.10 :> [39;49m}[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd738[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 231.10[34;49m :
DataStack depth =   9 : Dsp (R14) = Top = 0x00007ffff7269240, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269240 > = 0x00007ffff72fd6be	
  DataStack   [  -1 ] < 0x00007ffff7269238 > = 0x00007ffff72fd699	
  DataStack   [  -2 ] < 0x00007ffff7269230 > = 0x00007ffff72fd5d9	
  DataStack   [  -3 ] < 0x00007ffff7269228 > = 0x00007ffff72fd5b4	
  DataStack   [  -4 ] < 0x00007ffff7269220 > = 0x00007ffff5c88478	< word : void.[39;49m_Compile_ImmDispData[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -5 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -6 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -7 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -8 ] < 0x00007ffff7269200 > = 0x0000000000000005	
DataStack at : [39;49mnamespaces/compiler/x64.cft : 231.10[34;49m :
DataStack depth =   7 : Dsp (R14) = Top = 0x00007ffff7269230, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269230 > = 0x00007ffff72fd5d9	
  DataStack   [  -1 ] < 0x00007ffff7269228 > = 0x00007ffff72fd5b4	
  DataStack   [  -2 ] < 0x00007ffff7269220 > = 0x00007ffff5c88478	< word : void.[39;49m_Compile_ImmDispData[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -3 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -5 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -6 ] < 0x00007ffff7269200 > = 0x0000000000000005	
DataStack at : [39;49mnamespaces/compiler/x64.cft : 232.6[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c88478	< word : void.[39;49m_Compile_ImmDispData[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
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
0x7ffff72fd73f    e900000000              jmp 0x7ffff72fd744         	< C compiler code >        [34;49m[32;49m
0x7ffff72fd744    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fd748    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fd74c    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 263.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c8bbe8[34;49m.
dbg[c]  :: [34;49m...[34;49m : 264.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif DBI [34;49m 
dbg[c]  :: [34;49m...[34;49m : 264.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m DBI [34;49m 
dbg[i]  :: [34;49m...[34;49m : 264.008 : X64 :> [33;40mDBI[34;49m <: 0x00007ffff5c7fe70 :> [34;49m#if [34;49m[33;40mDBI[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 264.8 :> [39;49mDBI[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
dbg[c]  :: [34;49m...[34;49m : 265.008 : char :> [33;40mint[34;49m <: 0x00007ffff72979e0 :> [34;49m    [34;49m[33;40mint[34;49m[34;49m nbytes, _here  ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 265.025 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    int nbytes, _here  [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 266.010 : locals_0 :> [33;40m_here[34;49m <: 0x00007ffff5c8a688 :> [34;49m    [34;49m[33;40m_here[34;49m[34;49m = Here ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 266.012 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    _here [34;49m[33;40m=[34;49m[34;49m Here ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 266.017 : Compiler :> [33;40mHere[34;49m <: cprimitive :> [34;49m    _here = [34;49m[33;40mHere[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mHere[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 266.17
[34;49m .. mSize ) { int nbytes, _here ; _here = [34;49m[33;40mHere[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd753    49b88ea75b5555550000    mov r8, 0x5555555ba78e                                 [34;49m[32;49m
0x7ffff72fd75d    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd767    49ffd1                  call r9                    	< Compiler.[39;49mHere[34;49m : 0x00005555555ba78e >[34;49m
dbg[c]  :: [34;49m...[34;49m : 266.019 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    _here [34;49m[33;40m=[34;49m[34;49m Here ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 266.19[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8a688	< word : locals_0.[34;49m_here[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7fe70	< word : X64.[34;49mDBI[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Undefined  : namespaces/compiler/x64.cft : 266.19
dbg[c]  :: [34;49m...[34;49m : 266.019 : locals_0 :> [33;40m_here[34;49m <: 0x00007ffff5c8a4c0 :> [34;49m    [34;49m[33;40m_here[34;49m[34;49m = Here ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_here[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 266.19
[34;49m ..  imm, immSize ) { int nbytes, _here ; [34;49m[33;40m_here[34;49m[34;49m = Here ; [34;49m[32;49m
0x7ffff72fd76a    498d4710                lea rax, [r15+0x10]                                    [34;49m[32;49m
0x7ffff72fd76e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd772    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 266.019 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    _here [34;49m[33;40m=[34;49m[34;49m Here ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 266.19[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8a4c0	< word : locals_0.[34;49m_here[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Undefined  : namespaces/compiler/x64.cft : 266.19
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 266.19
[34;49m .. immSize ) { int nbytes, _here ; _here [34;49m[33;40m=[34;49m[34;49m Here ; [34;49m[32;49m
0x7ffff72fd76e    488bc8                  mov rcx, rax                                           [34;49m[32;49m
0x7ffff72fd771    498b06                  mov rax, [r14]                                         [34;49m[32;49m
0x7ffff72fd774    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd778    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 266.019 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    _here = Here [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 267.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mendif [34;49m 
dbg[c]  :: [34;49m...[34;49m : 267.007 : PreProcessor :> [33;40mendif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mendif[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 268.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( rex ) compile1 ( rex ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 268.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m rex ) compile1 ( rex ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 268.8
[34;49m .. int nbytes, _here ; _here = Here ; if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fd77b    e900000000              jmp 0x7ffff72fd780         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 268.013 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8b858 :> [34;49m    if ( [34;49m[33;40mrex[34;49m[34;49m ) compile1 ( rex ) ; [34;49m 
_Do_C_Syntax_Variable : word = rex :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 268.13
[34;49m .. t nbytes, _here ; _here = Here ; if ( [34;49m[33;40mrex[34;49m[34;49m [34;49m[32;49m
0x7ffff72fd780    498b47b8                mov rax, [r15-0x48]                                    [34;49m[32;49m
0x7ffff72fd784    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd788    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 268.014 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( rex [34;49m[33;40m)[34;49m[34;49m compile1 ( rex ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 268.14
[34;49m .. ytes, _here ; _here = Here ; if ( rex [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fd78b    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 268.14 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd780[34;49m.
dbg[c]  :: [34;49m...[34;49m : 268.024 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    if ( rex ) [34;49m[33;40m{[34;49m[34;49mompile1 ( rex ) ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 268.24
[34;49m .. tes, _here ; _here = Here ; if ( rex )[34;49m[33;40m{[34;49m[34;49mcompile1  .. [34;49m[32;49m
0x7ffff72fd78c    e900000000              jmp 0x7ffff72fd791         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 268.024 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m    if ( rex ) [34;49m[33;40mcompile1[34;49m[34;49m ( rex ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 268.030 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8b858 :> [34;49m    if ( rex ) compile1 ( [34;49m[33;40mrex[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = rex :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 268.30
[34;49m ..  _here = Here ; if ( rex ) compile1 ( [34;49m[33;40mrex[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd791    498b47b8                mov rax, [r15-0x48]                                    [34;49m[32;49m
0x7ffff72fd795    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd799    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 268.031 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m    if ( rex ) [34;49m[33;40mcompile1[34;49m[34;49m ( rex ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile1[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 268.31
[34;49m .. es, _here ; _here = Here ; if ( rex ) [34;49m[33;40mcompile1[34;49m[34;49m ( rex ) .. [34;49m[32;49m
0x7ffff72fd79c    49b87da85b5555550000    mov r8, 0x5555555ba87d                                 [34;49m[32;49m
0x7ffff72fd7a6    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd7b0    49ffd1                  call r9                    	< Asm.[39;49mcompile1[34;49m : 0x00005555555ba87d >[34;49m
dbg[c]  :: [34;49m...[34;49m : 268.034 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m    if ( rex ) compile1 ( rex ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 268.34
[34;49m ..  = Here ; if ( rex ) compile1 ( rex ) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd7b3    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 268.34 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd791[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 269.7[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8bbe8	< word : void.[39;49m_Compile_Write_Instruction_X64[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 269.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( opCode >= 0x100 ) compile2 ( opCode ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 269.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m opCode >= 0x100 ) compile2 ( opCode ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 269.8
[34;49m .. e ; if ( rex ) compile1 ( rex ) ;  if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd7aa    e900000000              jmp 0x7ffff72fd7af         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 269.016 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8b690 :> [34;49m    if ( [34;49m[33;40mopCode[34;49m[34;49m >= 0x100 ) compile2 ( opCode ) ; [34;49m 
_Do_C_Syntax_Variable : word = opCode :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 269.16
[34;49m .. ; if ( rex ) compile1 ( rex ) ;  if ( [34;49m[33;40mopCode[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd7af    498b47c0                mov rax, [r15-0x40]                                    [34;49m[32;49m
0x7ffff72fd7b3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd7b7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 269.019 : Logic :> [33;40m>=[34;49m <: cprimitive :> [34;49m    if ( opCode [34;49m[33;40m>=[34;49m[34;49m 0x100 ) compile2 ( opCode ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 269.025 : <literal> :> [33;40m0x100[34;49m <: 0x00007ffff5c894b8 :> [34;49m    if ( opCode >= [34;49m[33;40m0x100[34;49m[34;49m ) compile2 ( opCode ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x100[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 269.25
[34;49m ..  ) compile1 ( rex ) ;  if ( opCode >= [34;49m[33;40m0x100[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd7ba    48b80001000000000000    mov rax, 0x100                                         [34;49m[32;49m
0x7ffff72fd7c4    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd7c8    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 269.025 : Logic :> [33;40m>=[34;49m <: cprimitive :> [34;49m    if ( opCode [34;49m[33;40m>=[34;49m[34;49m 0x100 ) compile2 ( opCode ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 269.25[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c894b8	< word : <literal>.[34;49m0x100[39;49m : value = 0x0000000000000100 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8b690	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.>= :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 269.25
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m>=[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 269.25
[34;49m .. rex ) compile1 ( rex ) ;  if ( opCode [34;49m[33;40m>=[34;49m[34;49m 0x100  .. [34;49m[32;49m
0x7ffff72fd7b3    48b90001000000000000    mov rcx, 0x100                                         [34;49m[32;49m
0x7ffff72fd7bd    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fd7c0    0f9dc0                  setge al                                               [34;49m[32;49m
0x7ffff72fd7c3    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fd7c7    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd7cb    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 269.026 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( opCode >= 0x100 [34;49m[33;40m)[34;49m[34;49m compile2 ( opCode ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 269.26
[34;49m .. pile1 ( rex ) ;  if ( opCode >= 0x100 [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd7ce    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 269.26 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd7af[34;49m.
dbg[c]  :: [34;49m...[34;49m : 269.036 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    if ( opCode >= 0x100 ) [34;49m[33;40m{[34;49m[34;49mompile2 ( opCode ) ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 269.36
[34;49m .. ile1 ( rex ) ;  if ( opCode >= 0x100 )[34;49m[33;40m{[34;49m[34;49mcompile2  .. [34;49m[32;49m
0x7ffff72fd7cf    e900000000              jmp 0x7ffff72fd7d4         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 269.036 : Asm :> [33;40mcompile2[34;49m <: cprimitive :> [34;49m    if ( opCode >= 0x100 ) [34;49m[33;40mcompile2[34;49m[34;49m ( opCode ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 269.045 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8b690 :> [34;49m    if ( opCode >= 0x100 ) compile2 ( [34;49m[33;40mopCode[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = opCode :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 269.45
[34;49m ..  ;  if ( opCode >= 0x100 ) compile2 ( [34;49m[33;40mopCode[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd7d4    498b47c0                mov rax, [r15-0x40]                                    [34;49m[32;49m
0x7ffff72fd7d8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd7dc    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 269.046 : Asm :> [33;40mcompile2[34;49m <: cprimitive :> [34;49m    if ( opCode >= 0x100 ) [34;49m[33;40mcompile2[34;49m[34;49m ( opCode ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile2[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 269.46
[34;49m .. le1 ( rex ) ;  if ( opCode >= 0x100 ) [34;49m[33;40mcompile2[34;49m[34;49m ( opCode ) .. [34;49m[32;49m
0x7ffff72fd7df    49b849a85b5555550000    mov r8, 0x5555555ba849                                 [34;49m[32;49m
0x7ffff72fd7e9    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd7f3    49ffd1                  call r9                    	< Asm.[39;49mcompile2[34;49m : 0x00005555555ba849 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 269.049 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m    if ( opCode >= 0x100 ) compile2 ( opCode ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 269.49
[34;49m .. opCode >= 0x100 ) compile2 ( opCode ) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd7f6    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 269.49 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd7d4[34;49m.
dbg[c]  :: [34;49m...[34;49m : 270.018 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    else [34;49m[33;40m{[34;49m[34;49mompile1 ( opCode ) ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 270.18
[34;49m .. = 0x100 ) compile2 ( opCode ) ;  else [34;49m[33;40m{[34;49m[34;49mompile1  .. [34;49m[32;49m
0x7ffff72fd7f7    e900000000              jmp 0x7ffff72fd7fc         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 270.018 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m    else [34;49m[33;40mcompile1[34;49m[34;49m ( opCode ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 270.027 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8b690 :> [34;49m    else compile1 ( [34;49m[33;40mopCode[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = opCode :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 270.27
[34;49m .. ompile2 ( opCode ) ;  else compile1 ( [34;49m[33;40mopCode[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd7fc    498b47c0                mov rax, [r15-0x40]                                    [34;49m[32;49m
0x7ffff72fd800    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd804    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 270.028 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m    else [34;49m[33;40mcompile1[34;49m[34;49m ( opCode ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile1[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 270.28
[34;49m .. = 0x100 ) compile2 ( opCode ) ;  else [34;49m[33;40mcompile1[34;49m[34;49m ( opCode ) .. [34;49m[32;49m
0x7ffff72fd807    49b87da85b5555550000    mov r8, 0x5555555ba87d                                 [34;49m[32;49m
0x7ffff72fd811    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd81b    49ffd1                  call r9                    	< Asm.[39;49mcompile1[34;49m : 0x00005555555ba87d >[34;49m
dbg[c]  :: [34;49m...[34;49m : 270.031 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m    else compile1 ( opCode ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 270.31
[34;49m ..  opCode ) ;  else compile1 ( opCode ) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd81e    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 270.31 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd7fc[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 270.31[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8bbe8	< word : void.[39;49m_Compile_Write_Instruction_X64[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 271.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( controlFlags Bits.& MODRM_B ) compile1 ( modRm ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 271.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m controlFlags Bits.& MODRM_B ) compile1 ( modRm ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 271.8
[34;49m .. e ) ;  else compile1 ( opCode ) ;  if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd80a    e900000000              jmp 0x7ffff72fd80f         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 271.022 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c8b300 :> [34;49m    if ( [34;49m[33;40mcontrolFlags[34;49m[34;49m Bits.& MODRM_B ) compile1 ( modRm ) ; [34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 271.22
[34;49m .. ) ;  else compile1 ( opCode ) ;  if ( [34;49m[33;40mcontrolFlags[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd80f    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fd813    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd817    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 271.026 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49m    if ( controlFlags [34;49m[33;40mBits[34;49m[34;49m.& MODRM_B ) compile1 ( modRm ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mBits[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 271.26[32;49m
0x7ffff72fd81a    49b96ef533f7ff7f0000    mov r9, 0x7ffff733f56e                                 [34;49m[32;49m
0x7ffff72fd824    49ffd1                  call r9                    	< Logic.[39;49mBits[34;49m : 0x00007ffff733f56e >[34;49m
dbg[c]  :: [34;49m...[34;49m : 271.027 : Class :> [33;40m.[34;49m <: cprimitive :> [34;49m    if ( controlFlags Bits[34;49m[33;40m.[34;49m[34;49m& MODRM_B ) compile1 ( modRm ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 271.029 : C_Syntax :> [33;40m&[34;49m <: cprimitive :> [34;49m    if ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m MODRM_B ) compile1 ( modRm ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 271.037 : X64 :> [33;40mMODRM_B[34;49m <: 0x00007ffff5c7ead8 :> [34;49m    if ( controlFlags Bits.& [34;49m[33;40mMODRM_B[34;49m[34;49m ) compile1 ( modRm ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 271.37[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8b300	< word : locals_0.[34;49mcontrolFlags[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: X64.MODRM_B :: type expected :  :: type recorded : Undefined  : namespaces/compiler/x64.cft : 271.37
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMODRM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 271.37[32;49m
0x7ffff72fd827    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fd831    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd835    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 271.038 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( controlFlags Bits.& MODRM_B [34;49m[33;40m)[34;49m[34;49m compile1 ( modRm ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 271.38
[34;49m .. ) ;  if ( controlFlags Bits.& MODRM_B [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd838    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 271.38 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd80f[34;49m.
dbg[c]  :: [34;49m...[34;49m : 271.048 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    if ( controlFlags Bits.& MODRM_B ) [34;49m[33;40m{[34;49m[34;49mompile1 ( modRm ) ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 271.48
[34;49m ..  ;  if ( controlFlags Bits.& MODRM_B )[34;49m[33;40m{[34;49m[34;49mcompile1  .. [34;49m[32;49m
0x7ffff72fd839    e900000000              jmp 0x7ffff72fd83e         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 271.048 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m    if ( controlFlags Bits.& MODRM_B ) [34;49m[33;40mcompile1[34;49m[34;49m ( modRm ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 271.056 : locals_0 :> [33;40mmodRm[34;49m <: 0x00007ffff5c8b4c8 :> [34;49m    if ( controlFlags Bits.& MODRM_B ) compile1 ( [34;49m[33;40mmodRm[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = modRm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mmodRm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 271.56
[34;49m .. trolFlags Bits.& MODRM_B ) compile1 ( [34;49m[33;40mmodRm[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd83e    498b47c8                mov rax, [r15-0x38]                                    [34;49m[32;49m
0x7ffff72fd842    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd846    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 271.057 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m    if ( controlFlags Bits.& MODRM_B ) [34;49m[33;40mcompile1[34;49m[34;49m ( modRm ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile1[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 271.57
[34;49m .. ;  if ( controlFlags Bits.& MODRM_B ) [34;49m[33;40mcompile1[34;49m[34;49m ( modRm ) .. [34;49m[32;49m
0x7ffff72fd849    49b87da85b5555550000    mov r8, 0x5555555ba87d                                 [34;49m[32;49m
0x7ffff72fd853    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd85d    49ffd1                  call r9                    	< Asm.[39;49mcompile1[34;49m : 0x00005555555ba87d >[34;49m
dbg[c]  :: [34;49m...[34;49m : 271.060 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m    if ( controlFlags Bits.& MODRM_B ) compile1 ( modRm ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 271.60
[34;49m .. s Bits.& MODRM_B ) compile1 ( modRm ) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd860    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 271.60 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd83e[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 272.7[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8bbe8	< word : void.[39;49m_Compile_Write_Instruction_X64[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 272.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( sib && ( controlFlags Bits.& SIB_B ) ) compile1 ( sib ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 272.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m sib && ( controlFlags Bits.& SIB_B ) ) compile1 ( sib ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 272.8
[34;49m .. s.& MODRM_B ) compile1 ( modRm ) ; if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd857    e900000000              jmp 0x7ffff72fd85c         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 272.013 : locals_0 :> [33;40msib[34;49m <: 0x00007ffff5c8b138 :> [34;49m    if ( [34;49m[33;40msib[34;49m[34;49m && ( controlFlags Bits.& SIB_B ) ) compile1 ( sib ) ; [34;49m 
_Do_C_Syntax_Variable : word = sib :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msib[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 272.13
[34;49m .. & MODRM_B ) compile1 ( modRm ) ; if ( [34;49m[33;40msib[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd85c    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fd860    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd864    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 272.016 : Logic :> [33;40m&&[34;49m <: cprimitive :> [34;49m    if ( sib [34;49m[33;40m&&[34;49m[34;49m ( controlFlags Bits.& SIB_B ) ) compile1 ( sib ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 272.017 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    if ( sib && [34;49m[33;40m([34;49m[34;49m controlFlags Bits.& SIB_B ) ) compile1 ( sib ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 272.031 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c8b300 :> [34;49m    if ( sib && ( [34;49m[33;40mcontrolFlags[34;49m[34;49m Bits.& SIB_B ) ) compile1 ( sib ) ; [34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 272.31
[34;49m ..  ) compile1 ( modRm ) ; if ( sib && ( [34;49m[33;40mcontrolFlags[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd867    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fd86b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd86f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 272.035 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49m    if ( sib && ( controlFlags [34;49m[33;40mBits[34;49m[34;49m.& SIB_B ) ) compile1 ( sib ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mBits[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 272.35
[34;49m ..  modRm ) ; if ( sib && ( controlFlags [34;49m[33;40mBits[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd872    49b96ef533f7ff7f0000    mov r9, 0x7ffff733f56e                                 [34;49m[32;49m
0x7ffff72fd87c    49ffd1                  call r9                    	< Logic.[39;49mBits[34;49m : 0x00007ffff733f56e >[34;49m
dbg[c]  :: [34;49m...[34;49m : 272.036 : Class :> [33;40m.[34;49m <: cprimitive :> [34;49m    if ( sib && ( controlFlags Bits[34;49m[33;40m.[34;49m[34;49m& SIB_B ) ) compile1 ( sib ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 272.038 : C_Syntax :> [33;40m&[34;49m <: cprimitive :> [34;49m    if ( sib && ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m SIB_B ) ) compile1 ( sib ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 272.044 : X64 :> [33;40mSIB_B[34;49m <: 0x00007ffff5c7ee68 :> [34;49m    if ( sib && ( controlFlags Bits.& [34;49m[33;40mSIB_B[34;49m[34;49m ) ) compile1 ( sib ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mSIB_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 272.44[32;49m
0x7ffff72fd87f    48b80400000000000000    mov rax, 0x4                                           [34;49m[32;49m
0x7ffff72fd889    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd88d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 272.045 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( sib && ( controlFlags Bits.& SIB_B [34;49m[33;40m)[34;49m[34;49m ) compile1 ( sib ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 272.045 : Logic :> [33;40m&&[34;49m <: cprimitive :> [34;49m    if ( sib [34;49m[33;40m&&[34;49m[34;49m ( controlFlags Bits.& SIB_B ) ) compile1 ( sib ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m&&[34;49m <:   78 bytes : at namespaces/compiler/x64.cft : 272.45
[34;49m .. DRM_B ) compile1 ( modRm ) ; if ( sib [34;49m[33;40m&&[34;49m[34;49m ( controlFlags Bits.& SIB_B ) .. [34;49m[32;49m
0x7ffff72fd87f    48b80400000000000000    mov rax, 0x4                                           [34;49m[32;49m
0x7ffff72fd889    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd88d    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fd890    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fd893    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fd897    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fd89b    4885c9                  test rcx, rcx                                          [34;49m[32;49m
0x7ffff72fd89e    0f8409000000            jz 0x7ffff72fd8ad          	< C compiler code >        [34;49m[32;49m
0x7ffff72fd8a4    4885c0                  test rax, rax                                          [34;49m[32;49m
0x7ffff72fd8a7    0f850f000000            jnz 0x7ffff72fd8bc         	< C compiler code >        [34;49m[32;49m
0x7ffff72fd8ad    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fd8b7    e90a000000              jmp 0x7ffff72fd8c6         	< C compiler code >        [34;49m[32;49m
0x7ffff72fd8bc    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fd8c6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd8ca    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 272.047 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( sib && ( controlFlags Bits.& SIB_B ) [34;49m[33;40m)[34;49m[34;49m compile1 ( sib ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 272.47
[34;49m ..  sib && ( controlFlags Bits.& SIB_B ) [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd8cd    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 272.47 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd85c[34;49m.
dbg[c]  :: [34;49m...[34;49m : 272.057 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    if ( sib && ( controlFlags Bits.& SIB_B ) ) [34;49m[33;40m{[34;49m[34;49mompile1 ( sib ) ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 272.57
[34;49m .. sib && ( controlFlags Bits.& SIB_B ) )[34;49m[33;40m{[34;49m[34;49mcompile1  .. [34;49m[32;49m
0x7ffff72fd8ce    e900000000              jmp 0x7ffff72fd8d3         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 272.057 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m    if ( sib && ( controlFlags Bits.& SIB_B ) ) [34;49m[33;40mcompile1[34;49m[34;49m ( sib ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 272.063 : locals_0 :> [33;40msib[34;49m <: 0x00007ffff5c8b138 :> [34;49m    if ( sib && ( controlFlags Bits.& SIB_B ) ) compile1 ( [34;49m[33;40msib[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = sib :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msib[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 272.63
[34;49m .. trolFlags Bits.& SIB_B ) ) compile1 ( [34;49m[33;40msib[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd8d3    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fd8d7    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd8db    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 272.064 : Asm :> [33;40mcompile1[34;49m <: cprimitive :> [34;49m    if ( sib && ( controlFlags Bits.& SIB_B ) ) [34;49m[33;40mcompile1[34;49m[34;49m ( sib ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcompile1[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 272.64
[34;49m .. ib && ( controlFlags Bits.& SIB_B ) ) [34;49m[33;40mcompile1[34;49m[34;49m ( sib ) .. [34;49m[32;49m
0x7ffff72fd8de    49b87da85b5555550000    mov r8, 0x5555555ba87d                                 [34;49m[32;49m
0x7ffff72fd8e8    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fd8f2    49ffd1                  call r9                    	< Asm.[39;49mcompile1[34;49m : 0x00005555555ba87d >[34;49m
dbg[c]  :: [34;49m...[34;49m : 272.067 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m    if ( sib && ( controlFlags Bits.& SIB_B ) ) compile1 ( sib ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 272.67
[34;49m .. ags Bits.& SIB_B ) ) compile1 ( sib ) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd8f5    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 272.67 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd8d3[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 273.7[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8bbe8	< word : void.[39;49m_Compile_Write_Instruction_X64[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 273.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( disp || ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, dispS[34;49m 
dbg[c]  :: [34;49m...[34;49m : 273.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m disp || ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, 0 ) ;[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 273.8
[34;49m .. its.& SIB_B ) ) compile1 ( sib ) ; if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd8e9    e900000000              jmp 0x7ffff72fd8ee         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.014 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c8af70 :> [34;49m    if ( [34;49m[33;40mdisp[34;49m[34;49m || ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, disp[34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 273.14
[34;49m .. s.& SIB_B ) ) compile1 ( sib ) ; if ( [34;49m[33;40mdisp[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd8ee    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fd8f2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd8f6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.017 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m    if ( disp [34;49m[33;40m||[34;49m[34;49m ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, 0 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 273.018 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    if ( disp || [34;49m[33;40m([34;49m[34;49m controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, 0 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 273.032 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c8b300 :> [34;49m    if ( disp || ( [34;49m[33;40mcontrolFlags[34;49m[34;49m Bits.& DISP_B ) ) _Compile_ImmDispData ( di[34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 273.32
[34;49m .. ) ) compile1 ( sib ) ; if ( disp || ( [34;49m[33;40mcontrolFlags[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd8f9    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fd8fd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd901    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.036 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49m    if ( disp || ( controlFlags [34;49m[33;40mBits[34;49m[34;49m.& DISP_B ) ) _Compile_ImmDispData ( disp, dispSiz[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mBits[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 273.36[32;49m
0x7ffff72fd904    49b96ef533f7ff7f0000    mov r9, 0x7ffff733f56e                                 [34;49m[32;49m
0x7ffff72fd90e    49ffd1                  call r9                    	< Logic.[39;49mBits[34;49m : 0x00007ffff733f56e >[34;49m
dbg[c]  :: [34;49m...[34;49m : 273.037 : Class :> [33;40m.[34;49m <: cprimitive :> [34;49m    if ( disp || ( controlFlags Bits[34;49m[33;40m.[34;49m[34;49m& DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, 0 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 273.039 : C_Syntax :> [33;40m&[34;49m <: cprimitive :> [34;49m    if ( disp || ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, 0 ) ;[34;49m 
dbg[c]  :: [34;49m...[34;49m : 273.046 : X64 :> [33;40mDISP_B[34;49m <: 0x00007ffff5c7f1f8 :> [34;49m    if ( disp || ( controlFlags Bits.& [34;49m[33;40mDISP_B[34;49m[34;49m ) ) _Compile_ImmDispData ( disp, dispSiz[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDISP_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 273.46[32;49m
0x7ffff72fd911    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fd91b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd91f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.047 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( disp || ( controlFlags Bits.& DISP_B [34;49m[33;40m)[34;49m[34;49m ) _Compile_ImmDispData ( disp, dispSize, 0 ) ;[34;49m 
dbg[c]  :: [34;49m...[34;49m : 273.047 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m    if ( disp [34;49m[33;40m||[34;49m[34;49m ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m||[34;49m <:   41 bytes : at namespaces/compiler/x64.cft : 273.47
[34;49m .. IB_B ) ) compile1 ( sib ) ; if ( disp [34;49m[33;40m||[34;49m[34;49m ( controlFlags Bits.& DISP_B ) .. [34;49m[32;49m
0x7ffff72fd911    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fd91b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd91f    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fd922    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fd925    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fd929    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fd92d    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fd930    4885c0                  test rax, rax                                          [34;49m[32;49m
0x7ffff72fd933    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd937    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.049 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m  if ( disp || ( controlFlags Bits.& DISP_B ) [34;49m[33;40m)[34;49m[34;49m _Compile_ImmDispData ( disp, dispSize, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 273.49
[34;49m .. isp || ( controlFlags Bits.& DISP_B ) [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd93a    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 273.49 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd8ee[34;49m.
dbg[c]  :: [34;49m...[34;49m : 273.071 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m   if ( disp || ( controlFlags Bits.& DISP_B ) ) [34;49m[33;40m{[34;49m[34;49mCompile_ImmDispData ( disp, dispSize, 0 ) ;  ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 273.71
[34;49m .. sp || ( controlFlags Bits.& DISP_B ) )[34;49m[33;40m{[34;49m[34;49m_Compile_ImmDispData  .. [34;49m[32;49m
0x7ffff72fd93b    e900000000              jmp 0x7ffff72fd940         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.071 : void :> [33;40m_Compile_ImmDispData[34;49m <: 0x00007ffff5c88478 :> [34;49mlFlags Bits.& DISP_B ) ) [34;49m[33;40m_Compile_ImmDispData[34;49m[34;49m ( disp, dispSize, 0 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 273.077 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c8af70 :> [34;49mp || ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( [34;49m[33;40mdisp[34;49m[34;49m, dispSize, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 273.77
[34;49m .. s.& DISP_B ) ) _Compile_ImmDispData ( [34;49m[33;40mdisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd940    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fd944    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd948    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.087 : locals_0 :> [33;40mdispSize[34;49m <: 0x00007ffff5c8ada8 :> [34;49m ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, [34;49m[33;40mdispSize[34;49m[34;49m, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = dispSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdispSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 273.87
[34;49m .. SP_B ) ) _Compile_ImmDispData ( disp, [34;49m[33;40mdispSize[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd94b    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fd94f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd953    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.091 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7380494 :> [34;49misp || ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, [34;49m[33;40m0[34;49m[34;49m ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 273.91
[34;49m .. Compile_ImmDispData ( disp, dispSize, [34;49m[33;40m0[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd956    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fd960    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd964    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 273.092 : void :> [33;40m_Compile_ImmDispData[34;49m <: 0x00007ffff5c88478 :> [34;49mlFlags Bits.& DISP_B ) ) [34;49m[33;40m_Compile_ImmDispData[34;49m[34;49m ( disp, dispSize, 0 ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 273.92[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff7380494	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8ada8	< word : locals_0.[34;49mdispSize[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c87638	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: void._Compile_ImmDispData :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 273.92
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_ImmDispData[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 273.92
[34;49m .. p || ( controlFlags Bits.& DISP_B ) ) [34;49m[33;40m_Compile_ImmDispData[34;49m[34;49m ( disp, dispSize, 0 ) .. [34;49m[32;49m
0x7ffff72fd967    49b9a0d52ff7ff7f0000    mov r9, 0x7ffff72fd5a0                                 [34;49m[32;49m
0x7ffff72fd971    49ffd1                  call r9                    	< void.[39;49m_Compile_ImmDispData[34;49m : 0x00007ffff72fd5a0 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 273.095 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49m   if ( disp || ( controlFlags Bits.& DISP_B ) ) _Compile_ImmDispData ( disp, dispSize, 0 ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 273.95
[34;49m .. ile_ImmDispData ( disp, dispSize, 0 ) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd974    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 273.95 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd940[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 274.7[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8bbe8	< word : void.[39;49m_Compile_Write_Instruction_X64[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 274.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( imm || ( controlFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize,[34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m imm || ( controlFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( control[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 274.8
[34;49m .. mmDispData ( disp, dispSize, 0 ) ; if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd968    e900000000              jmp 0x7ffff72fd96d         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.013 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5c8abe0 :> [34;49m    if ( [34;49m[33;40mimm[34;49m[34;49m || ( controlFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize,[34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 274.13
[34;49m .. DispData ( disp, dispSize, 0 ) ; if ( [34;49m[33;40mimm[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd96d    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd971    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd975    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.016 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m    if ( imm [34;49m[33;40m||[34;49m[34;49m ( controlFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFl[34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.017 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    if ( imm || [34;49m[33;40m([34;49m[34;49m controlFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlags B[34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.031 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c8b300 :> [34;49m    if ( imm || ( [34;49m[33;40mcontrolFlags[34;49m[34;49m Bits.& IMM_B ) ) _Compile_ImmDispData ( imm,[34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 274.31
[34;49m .. ( disp, dispSize, 0 ) ; if ( imm || ( [34;49m[33;40mcontrolFlags[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd978    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fd97c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd980    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.035 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49m    if ( imm || ( controlFlags [34;49m[33;40mBits[34;49m[34;49m.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ([34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mBits[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 274.35[32;49m
0x7ffff72fd983    49b96ef533f7ff7f0000    mov r9, 0x7ffff733f56e                                 [34;49m[32;49m
0x7ffff72fd98d    49ffd1                  call r9                    	< Logic.[39;49mBits[34;49m : 0x00007ffff733f56e >[34;49m
dbg[c]  :: [34;49m...[34;49m : 274.036 : Class :> [33;40m.[34;49m <: cprimitive :> [34;49m    if ( imm || ( controlFlags Bits[34;49m[33;40m.[34;49m[34;49m& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFla[34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.038 : C_Syntax :> [33;40m&[34;49m <: cprimitive :> [34;49m    if ( imm || ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( control[34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.044 : X64 :> [33;40mIMM_B[34;49m <: 0x00007ffff5c7f588 :> [34;49m    if ( imm || ( controlFlags Bits.& [34;49m[33;40mIMM_B[34;49m[34;49m ) ) _Compile_ImmDispData ( imm, immSize, ( [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mIMM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 274.44[32;49m
0x7ffff72fd990    48b81000000000000000    mov rax, 0x10                                          [34;49m[32;49m
0x7ffff72fd99a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd99e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.045 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( imm || ( controlFlags Bits.& IMM_B [34;49m[33;40m)[34;49m[34;49m ) _Compile_ImmDispData ( imm, immSize, ( control[34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.045 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m    if ( imm [34;49m[33;40m||[34;49m[34;49m ( controlFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFl[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m||[34;49m <:   41 bytes : at namespaces/compiler/x64.cft : 274.45
[34;49m .. Data ( disp, dispSize, 0 ) ; if ( imm [34;49m[33;40m||[34;49m[34;49m ( controlFlags Bits.& IMM_B ) .. [34;49m[32;49m
0x7ffff72fd990    48b81000000000000000    mov rax, 0x10                                          [34;49m[32;49m
0x7ffff72fd99a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd99e    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fd9a1    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fd9a4    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fd9a8    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fd9ac    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fd9af    4885c0                  test rax, rax                                          [34;49m[32;49m
0x7ffff72fd9b2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd9b6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.047 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( imm || ( controlFlags Bits.& IMM_B ) [34;49m[33;40m)[34;49m[34;49m _Compile_ImmDispData ( imm, immSize, ( control[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 274.47
[34;49m ..  imm || ( controlFlags Bits.& IMM_B ) [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd9b9    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 274.47 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd96d[34;49m.
dbg[c]  :: [34;49m...[34;49m : 274.069 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m   if ( imm || ( controlFlags Bits.& IMM_B ) )[34;49m[33;40m{[34;49m[34;49m_Compile_ImmDispData ( imm, immSize, ( con ) ) .. [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 274.69
[34;49m .. imm || ( controlFlags Bits.& IMM_B ) )[34;49m[33;40m{[34;49m[34;49m_Compile_ImmDispData  .. [34;49m[32;49m
0x7ffff72fd9ba    e900000000              jmp 0x7ffff72fd9bf         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.069 : void :> [33;40m_Compile_ImmDispData[34;49m <: 0x00007ffff5c88478 :> [34;49molFlags Bits.& IMM_B ) ) [34;49m[33;40m_Compile_ImmDispData[34;49m[34;49m ( imm, immSize, ( control[34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.074 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5c8abe0 :> [34;49mBits.& IMM_B ) ) _Compile_ImmDispData ( [34;49m[33;40mimm[34;49m[34;49m, immSize, ( controlFlags Bits.& IMM_B ) [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 274.74
[34;49m .. ts.& IMM_B ) ) _Compile_ImmDispData ( [34;49m[33;40mimm[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fd9bf    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fd9c3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd9c7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.083 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c8aa18 :> [34;49mM_B ) ) _Compile_ImmDispData ( imm, [34;49m[33;40mimmSize[34;49m[34;49m, ( controlFlags Bits.& IMM_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.085 : C_Syntax :> [33;40m,[34;49m <: cprimitive :> [34;49mFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize[34;49m[33;40m,[34;49m[34;49m ( controlFlags Bits.& IMM_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.085 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c8aa18 :> [34;49mM_B ) ) _Compile_ImmDispData ( imm, [34;49m[33;40mimmSize[34;49m[34;49m, ( controlFlags Bits.& IMM_B ) ) ; [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 274.85
[34;49m .. IMM_B ) ) _Compile_ImmDispData ( imm, [34;49m[33;40mimmSize[34;49m[34;49m,  .. [34;49m[32;49m
0x7ffff72fd9ca    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fd9ce    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd9d2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.086 : C :> [33;40m([34;49m <: cprimitive :> [34;49mcontrolFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, [34;49m[33;40m([34;49m[34;49m controlFlags Bits.& IMM_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.100 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c8b300 :> [34;49m) ) _Compile_ImmDispData ( imm, immSize, ( [34;49m[33;40mcontrolFlags[34;49m[34;49m Bits.& IMM_B ) ) ; [34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 274.100
[34;49m .. Compile_ImmDispData ( imm, immSize, ( [34;49m[33;40mcontrolFlags[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd9d5    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fd9d9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd9dd    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.104 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49mts.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlags [34;49m[33;40mBits[34;49m[34;49m.& IMM_B ) ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mBits[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 274.104[32;49m
0x7ffff72fd9e0    49b96ef533f7ff7f0000    mov r9, 0x7ffff733f56e                                 [34;49m[32;49m
0x7ffff72fd9ea    49ffd1                  call r9                    	< Logic.[39;49mBits[34;49m : 0x00007ffff733f56e >[34;49m
dbg[c]  :: [34;49m...[34;49m : 274.105 : Class :> [33;40m.[34;49m <: cprimitive :> [34;49mrolFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlags Bits[34;49m[33;40m.[34;49m[34;49m& IMM_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.107 : C_Syntax :> [33;40m&[34;49m <: cprimitive :> [34;49mFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m IMM_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.113 : X64 :> [33;40mIMM_B[34;49m <: 0x00007ffff5c7f588 :> [34;49mits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlags Bits.& [34;49m[33;40mIMM_B[34;49m[34;49m ) ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 274.113[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c8d6d8	< word : locals_0.[34;49mcontrolFlags[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8aa18	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8d348	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: X64.IMM_B :: type expected :  :: type recorded : Undefined  : namespaces/compiler/x64.cft : 274.113
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mIMM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 274.113[32;49m
0x7ffff72fd9ed    48b81000000000000000    mov rax, 0x10                                          [34;49m[32;49m
0x7ffff72fd9f7    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fd9fb    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 274.114 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49mFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlags Bits.& IMM_B [34;49m[33;40m)[34;49m[34;49m ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 274.116 : void :> [33;40m_Compile_ImmDispData[34;49m <: 0x00007ffff5c8e188 :> [34;49molFlags Bits.& IMM_B ) ) [34;49m[33;40m_Compile_ImmDispData[34;49m[34;49m ( imm, immSize, ( control[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 274.116[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8aa18	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8d348	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: void._Compile_ImmDispData :: type expected : Integer . Integer  :: type recorded : Undefined . Undefined  : namespaces/compiler/x64.cft : 274.116
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_ImmDispData[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 274.116
[34;49m .. mm || ( controlFlags Bits.& IMM_B ) ) [34;49m[33;40m_Compile_ImmDispData[34;49m[34;49m ( imm, immSize, ( controlFlags Bits.& IMM_B ) ) .. [34;49m[32;49m
0x7ffff72fd9fe    49b9a0d52ff7ff7f0000    mov r9, 0x7ffff72fd5a0                                 [34;49m[32;49m
0x7ffff72fda08    49ffd1                  call r9                    	< void.[39;49m_Compile_ImmDispData[34;49m : 0x00007ffff72fd5a0 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 274.119 : Reserved :> [33;40m;[34;49m <: cprimitive :> [34;49mFlags Bits.& IMM_B ) ) _Compile_ImmDispData ( imm, immSize, ( controlFlags Bits.& IMM_B ) ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 274.119
[34;49m .. Size, ( controlFlags Bits.& IMM_B ) ) [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fda0b    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 274.119 :> [39;49m;[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fd9bf[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 275.1[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8bbe8	< word : void.[39;49m_Compile_Write_Instruction_X64[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 275.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif DBI [34;49m 
dbg[c]  :: [34;49m...[34;49m : 275.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m DBI [34;49m 
dbg[i]  :: [34;49m...[34;49m : 275.008 : X64 :> [33;40mDBI[34;49m <: 0x00007ffff5c7fe70 :> [34;49m#if [34;49m[33;40mDBI[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 275.8 :> [39;49mDBI[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
dbg[c]  :: [34;49m...[34;49m : 276.011 : locals_0 :> [33;40mnbytes[34;49m <: 0x00007ffff5c8a850 :> [34;49m    [34;49m[33;40mnbytes[34;49m[34;49m = Here - _here ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 276.013 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    nbytes [34;49m[33;40m=[34;49m[34;49m Here - _here ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 276.018 : Compiler :> [33;40mHere[34;49m <: cprimitive :> [34;49m    nbytes = [34;49m[33;40mHere[34;49m[34;49m - _here ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mHere[34;49m <:   23 bytes : at namespaces/compiler/x64.cft : 276.18
[34;49m .. trolFlags Bits.& IMM_B ) ) ; nbytes = [34;49m[33;40mHere[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fd9ff    49b88ea75b5555550000    mov r8, 0x5555555ba78e                                 [34;49m[32;49m
0x7ffff72fda09    49b9190034f7ff7f0000    mov r9, 0x7ffff7340019                                 [34;49m[32;49m
0x7ffff72fda13    49ffd1                  call r9                    	< Compiler.[39;49mHere[34;49m : 0x00005555555ba78e >[34;49m
dbg[c]  :: [34;49m...[34;49m : 276.020 : Int :> [33;40m-[34;49m <: cprimitive :> [34;49m    nbytes = Here [34;49m[33;40m-[34;49m[34;49m _here ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 276.026 : locals_0 :> [33;40m_here[34;49m <: 0x00007ffff5c8a688 :> [34;49m    nbytes = Here - [34;49m[33;40m_here[34;49m[34;49m ; [34;49m 
_Do_C_Syntax_Variable : word = _here :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_here[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 276.26
[34;49m .. gs Bits.& IMM_B ) ) ; nbytes = Here - [34;49m[33;40m_here[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fda16    498b4710                mov rax, [r15+0x10]                                    [34;49m[32;49m
0x7ffff72fda1a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fda1e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 276.026 : Int :> [33;40m-[34;49m <: cprimitive :> [34;49m    nbytes = Here [34;49m[33;40m-[34;49m[34;49m _here ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 276.26[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c8e6e0	< word : locals_0.[34;49m_here[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8a850	< word : locals_0.[34;49mnbytes[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7fe70	< word : X64.[34;49mDBI[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
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
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8e8a8	< word : Int.[34;49m-[39;49m : value = 0x00005555555b7b1e > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7fe70	< word : X64.[34;49mDBI[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 276.28
dbg[c]  :: [34;49m...[34;49m : 276.028 : locals_0 :> [33;40mnbytes[34;49m <: 0x00007ffff5c8ec38 :> [34;49m    [34;49m[33;40mnbytes[34;49m[34;49m = Here - _here ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mnbytes[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 276.28
[34;49m .. ze, ( controlFlags Bits.& IMM_B ) ) ; [34;49m[33;40mnbytes[34;49m[34;49m = Here - _here ;  .. [34;49m[32;49m
0x7ffff72fda2e    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fda32    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fda36    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 276.028 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    nbytes [34;49m[33;40m=[34;49m[34;49m Here - _here ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 276.28[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8ec38	< word : locals_0.[34;49mnbytes[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
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
0x7ffff72fda2e    48b83567cbf5ff7f0000    mov rax, 0x7ffff5cb6735    	< string : '[39;49m\n_Compile_Write_Instruction_X64 : %lx : %d bytes : ...[34;49m' >[34;49m[32;49m
0x7ffff72fda38    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fda3c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 277.087 : locals_0 :> [33;40m_here[34;49m <: 0x00007ffff5c8f358 :> [34;49mtruction_X64 : %lx : %d bytes : ...", [34;49m[33;40m_here[34;49m[34;49m, nbytes ) ; dis ( _here, nbytes ) ; //[34;49m 
_Do_C_Syntax_Variable : word = _here :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_here[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 277.87
[34;49m .. truction_X64 : %lx : %d bytes : ...", [34;49m[33;40m_here[34;49m[34;49m, nbytes ) .. [34;49m[32;49m
0x7ffff72fda3b    498b4710                mov rax, [r15+0x10]                                    [34;49m[32;49m
0x7ffff72fda3f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fda43    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 277.087 : locals_0 :> [33;40mnbytes[34;49m <: 0x00007ffff5c8f520 :> [34;49m_X64 : %lx : %d bytes : ...", _here, [34;49m[33;40mnbytes[34;49m[34;49m ) ; dis ( _here, nbytes ) ; //pause ([34;49m 
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
dbg[c]  :: [34;49m...[34;49m : 277.101 : locals_0 :> [33;40m_here[34;49m <: 0x00007ffff5c8a688 :> [34;49m%d bytes : ...", _here, nbytes ) ; dis ( [34;49m[33;40m_here[34;49m[34;49m, nbytes ) ; //pause () ; nl ; nl ; [34;49m 
_Do_C_Syntax_Variable : word = _here :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_here[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 277.101
[34;49m .. bytes : ...", _here, nbytes ) ; dis ( [34;49m[33;40m_here[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fda6a    498b4710                mov rax, [r15+0x10]                                    [34;49m[32;49m
0x7ffff72fda6e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fda72    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 277.110 : locals_0 :> [33;40mnbytes[34;49m <: 0x00007ffff5c8a850 :> [34;49md bytes : ...", _here, nbytes ) ; dis ( _here, [34;49m[33;40mnbytes[34;49m[34;49m ) ; //pause () ; nl ; nl ; [34;49m 
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
Stack : word at namespaces/compiler/x64.cft : 284.2 :> [39;49mint[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c8fc40[34;49m.
dbg[c]  :: [34;49m...[34;49m : 285.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif 1 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 285.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m 1 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 285.006 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5c8f190 :> [34;49m#if [34;49m[33;40m1[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 285.6 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[c]  :: [34;49m...[34;49m : 286.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49m  0100    WRXB [34;49m 
dbg[c]  :: [34;49m...[34;49m : 287.008 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8f358 :> [34;49m    [34;49m[33;40mrex[34;49m[34;49m = 0 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 287.010 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    rex [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 287.012 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c8efc8 :> [34;49m    rex = [34;49m[33;40m0[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 287.12
[34;49m ..  ( _reg rm rex_w_flag | rex ) { rex = [34;49m[33;40m0[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdab8    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fdac2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdac6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 287.014 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    rex [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 287.14[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c8efc8	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8f358	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8f190	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 287.14
dbg[c]  :: [34;49m...[34;49m : 287.014 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8ee00 :> [34;49m    [34;49m[33;40mrex[34;49m[34;49m = 0 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 287.14
[34;49m .. ateRex ( _reg rm rex_w_flag | rex ) { [34;49m[33;40mrex[34;49m[34;49m = 0 ; [34;49m[32;49m
0x7ffff72fdac9    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdacd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdad1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 287.014 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    rex [34;49m[33;40m=[34;49m[34;49m 0 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 287.14[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8ee00	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8f190	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
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
dbg[c]  :: [34;49m...[34;49m : 288.020 : locals_0 :> [33;40mrex_w_flag[34;49m <: 0x00007ffff5c8f520 :> [34;49m    if ( [34;49m[33;40mrex_w_flag[34;49m[34;49m ) rex = 8 ; [34;49m 
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
dbg[c]  :: [34;49m...[34;49m : 288.026 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8f358 :> [34;49m    if ( rex_w_flag ) [34;49m[33;40mrex[34;49m[34;49m = 8 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 288.028 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    if ( rex_w_flag ) rex [34;49m[33;40m=[34;49m[34;49m 8 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 288.030 : <literal> :> [33;40m8[34;49m <: 0x00007ffff5c8e518 :> [34;49m    if ( rex_w_flag ) rex = [34;49m[33;40m8[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m8[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 288.30
[34;49m .. ) { rex = 0 ; if ( rex_w_flag ) rex = [34;49m[33;40m8[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdadf    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fdae9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdaed    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 288.032 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    if ( rex_w_flag ) rex [34;49m[33;40m=[34;49m[34;49m 8 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 288.32[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8e518	< word : <literal>.[34;49m8[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8e6e0	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 288.32
dbg[c]  :: [34;49m...[34;49m : 288.032 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8e350 :> [34;49m    if ( rex_w_flag ) [34;49m[33;40mrex[34;49m[34;49m = 8 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 288.32
[34;49m .. | rex ) { rex = 0 ; if ( rex_w_flag ) [34;49m[33;40mrex[34;49m[34;49m = 8 ; [34;49m[32;49m
0x7ffff72fdaf0    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdaf4    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdaf8    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 288.032 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    if ( rex_w_flag ) rex [34;49m[33;40m=[34;49m[34;49m 8 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 288.32[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8e350	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 288.32
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 288.32
[34;49m .. x ) { rex = 0 ; if ( rex_w_flag ) rex [34;49m[33;40m=[34;49m[34;49m 8 ; [34;49m[32;49m
0x7ffff72fdae9    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdaed    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 288.032 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    if ( rex_w_flag ) rex = 8 [34;49m[33;40m;[34;49m[34;49m [34;49m 
DataStack at : [39;49mnamespaces/compiler/x64.cft : 289.7[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8fc40	< word : int.[39;49m_CalculateRex[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 289.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( _reg > 0x7 ) rex += 4 ; // (1 << 2) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 289.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m _reg > 0x7 ) rex += 4 ; // (1 << 2) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 289.8
[34;49m ..  = 0 ; if ( rex_w_flag ) rex = 8 ; if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fdae7    e900000000              jmp 0x7ffff72fdaec         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 289.014 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c8f8b0 :> [34;49m    if ( [34;49m[33;40m_reg[34;49m[34;49m > 0x7 ) rex += 4 ; // (1 << 2) ; [34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 289.14
[34;49m ..  0 ; if ( rex_w_flag ) rex = 8 ; if ( [34;49m[33;40m_reg[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdaec    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fdaf0    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdaf4    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 289.016 : Logic :> [33;40m>[34;49m <: cprimitive :> [34;49m    if ( _reg [34;49m[33;40m>[34;49m[34;49m 0x7 ) rex += 4 ; // (1 << 2) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 289.020 : <literal> :> [33;40m0x7[34;49m <: 0x00007ffff5c8d8a0 :> [34;49m    if ( _reg > [34;49m[33;40m0x7[34;49m[34;49m ) rex += 4 ; // (1 << 2) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x7[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 289.20
[34;49m ..  ( rex_w_flag ) rex = 8 ; if ( _reg > [34;49m[33;40m0x7[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdaf7    48b80700000000000000    mov rax, 0x7                                           [34;49m[32;49m
0x7ffff72fdb01    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb05    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 289.020 : Logic :> [33;40m>[34;49m <: cprimitive :> [34;49m    if ( _reg [34;49m[33;40m>[34;49m[34;49m 0x7 ) rex += 4 ; // (1 << 2) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 289.20[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8d8a0	< word : <literal>.[34;49m0x7[39;49m : value = 0x0000000000000007 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8f8b0	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
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
dbg[c]  :: [34;49m...[34;49m : 289.026 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8f358 :> [34;49m    if ( _reg > 0x7 ) [34;49m[33;40mrex[34;49m[34;49m += 4 ; // (1 << 2) ; [34;49m 
_Do_C_Syntax_Variable : word = rex :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 289.26
[34;49m .. _w_flag ) rex = 8 ; if ( _reg > 0x7 ) [34;49m[33;40mrex[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdb11    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdb15    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb19    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 289.029 : Int :> [33;40m+=[34;49m <: cprimitive :> [34;49m    if ( _reg > 0x7 ) rex [34;49m[33;40m+=[34;49m[34;49m 4 ; // (1 << 2) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 289.031 : <literal> :> [33;40m4[34;49m <: 0x00007ffff5c8cfb8 :> [34;49m    if ( _reg > 0x7 ) rex += [34;49m[33;40m4[34;49m[34;49m ; // (1 << 2) ; [34;49m 
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
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8fc40	< word : int.[39;49m_CalculateRex[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 291.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( rm > 0x7 ) rex += 1 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 291.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m rm > 0x7 ) rex += 1 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 291.8
[34;49m .. = 8 ; if ( _reg > 0x7 ) rex += 4 ; if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fdb16    e900000000              jmp 0x7ffff72fdb1b         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 291.012 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c8f6e8 :> [34;49m    if ( [34;49m[33;40mrm[34;49m[34;49m > 0x7 ) rex += 1 ; [34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 291.12
[34;49m .. 8 ; if ( _reg > 0x7 ) rex += 4 ; if ( [34;49m[33;40mrm[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdb1b    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fdb1f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb23    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 291.014 : Logic :> [33;40m>[34;49m <: cprimitive :> [34;49m    if ( rm [34;49m[33;40m>[34;49m[34;49m 0x7 ) rex += 1 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 291.018 : <literal> :> [33;40m0x7[34;49m <: 0x00007ffff5c8c6d0 :> [34;49m    if ( rm > [34;49m[33;40m0x7[34;49m[34;49m ) rex += 1 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x7[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 291.18
[34;49m .. f ( _reg > 0x7 ) rex += 4 ; if ( rm > [34;49m[33;40m0x7[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdb26    48b80700000000000000    mov rax, 0x7                                           [34;49m[32;49m
0x7ffff72fdb30    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb34    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 291.018 : Logic :> [33;40m>[34;49m <: cprimitive :> [34;49m    if ( rm [34;49m[33;40m>[34;49m[34;49m 0x7 ) rex += 1 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 291.18[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8c6d0	< word : <literal>.[34;49m0x7[39;49m : value = 0x0000000000000007 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8f6e8	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
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
dbg[c]  :: [34;49m...[34;49m : 291.024 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8f358 :> [34;49m    if ( rm > 0x7 ) [34;49m[33;40mrex[34;49m[34;49m += 1 ; [34;49m 
_Do_C_Syntax_Variable : word = rex :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 291.24
[34;49m .. eg > 0x7 ) rex += 4 ; if ( rm > 0x7 ) [34;49m[33;40mrex[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdb40    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdb44    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb48    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 291.027 : Int :> [33;40m+=[34;49m <: cprimitive :> [34;49m    if ( rm > 0x7 ) rex [34;49m[33;40m+=[34;49m[34;49m 1 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 291.029 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5c87638 :> [34;49m    if ( rm > 0x7 ) rex += [34;49m[33;40m1[34;49m[34;49m ; [34;49m 
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
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8fc40	< word : int.[39;49m_CalculateRex[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 292.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( rex ) rex |= 0x40 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 292.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m rex ) rex |= 0x40 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 292.8
[34;49m ..  += 4 ; if ( rm > 0x7 ) rex += 1 ; if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fdb45    e900000000              jmp 0x7ffff72fdb4a         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 292.013 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8f358 :> [34;49m    if ( [34;49m[33;40mrex[34;49m[34;49m ) rex |= 0x40 ; [34;49m 
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
dbg[c]  :: [34;49m...[34;49m : 292.019 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c8f358 :> [34;49m    if ( rex ) [34;49m[33;40mrex[34;49m[34;49m |= 0x40 ; [34;49m 
_Do_C_Syntax_Variable : word = rex :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 292.19
[34;49m .. if ( rm > 0x7 ) rex += 1 ; if ( rex ) [34;49m[33;40mrex[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdb5b    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdb5f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb63    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 292.022 : Bits :> [33;40m|=[34;49m <: cprimitive :> [34;49m    if ( rex ) rex [34;49m[33;40m|=[34;49m[34;49m 0x40 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 292.027 : <literal> :> [33;40m0x40[34;49m <: 0x00007ffff5c85f10 :> [34;49m    if ( rex ) rex |= [34;49m[33;40m0x40[34;49m[34;49m ; [34;49m 
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
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c8fc40	< word : int.[39;49m_CalculateRex[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
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
Stack : word at namespaces/compiler/x64.cft : 306.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c85298[34;49m.
dbg[c]  :: [34;49m...[34;49m : 307.008 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c81408 :> [34;49m    [34;49m[33;40mrex[34;49m[34;49m = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.010 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    rex [34;49m[33;40m=[34;49m[34;49m _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.024 : int :> [33;40m_CalculateRex[34;49m <: 0x00007ffff5c8fc40 :> [34;49m    rex = [34;49m[33;40m_CalculateRex[34;49m[34;49m ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& R[34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.030 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c81eb8 :> [34;49m    rex = _CalculateRex ( [34;49m[33;40m_reg[34;49m[34;49m, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B[34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 307.30
[34;49m .. ize | modRm ) { rex = _CalculateRex ( [34;49m[33;40m_reg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fdb92    498b47c0                mov rax, [r15-0x40]                                    [34;49m[32;49m
0x7ffff72fdb96    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdb9a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.034 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c82080 :> [34;49m    rex = _CalculateRex ( _reg, [34;49m[33;40mrm[34;49m[34;49m, ( immSize == 8 ) || ( controlFlags Bits.& REX_B )[34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.036 : C_Syntax :> [33;40m,[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm[34;49m[33;40m,[34;49m[34;49m ( immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.036 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c82080 :> [34;49m    rex = _CalculateRex ( _reg, [34;49m[33;40mrm[34;49m[34;49m, ( immSize == 8 ) || ( controlFlags Bits.& REX_B )[34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 307.36
[34;49m .. modRm ) { rex = _CalculateRex ( _reg, [34;49m[33;40mrm[34;49m[34;49m,  .. [34;49m[32;49m
0x7ffff72fdb9d    498b47c8                mov rax, [r15-0x38]                                    [34;49m[32;49m
0x7ffff72fdba1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdba5    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.037 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, [34;49m[33;40m([34;49m[34;49m immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.046 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c83b38 :> [34;49m  rex = _CalculateRex ( _reg, rm, ( [34;49m[33;40mimmSize[34;49m[34;49m == 8 ) || ( controlFlags Bits.& REX_[34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 307.46
[34;49m .. ) { rex = _CalculateRex ( _reg, rm, ( [34;49m[33;40mimmSize[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdba8    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fdbac    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdbb0    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.049 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize [34;49m[33;40m==[34;49m[34;49m 8 ) || ( controlFlags Bits.& REX_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.051 : <literal> :> [33;40m8[34;49m <: 0x00007ffff5c83ec8 :> [34;49mex = _CalculateRex ( _reg, rm, ( immSize == [34;49m[33;40m8[34;49m[34;49m ) || ( controlFlags Bits.& REX_B ) ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m8[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 307.51
[34;49m .. CalculateRex ( _reg, rm, ( immSize == [34;49m[33;40m8[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdbb3    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fdbbd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdbc1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.051 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize [34;49m[33;40m==[34;49m[34;49m 8 ) || ( controlFlags Bits.& REX_B ) ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 307.51[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c83ec8	< word : <literal>.[34;49m8[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c83b38	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c82080	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c81eb8	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c81408	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
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
dbg[c]  :: [34;49m...[34;49m : 307.071 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c82410 :> [34;49mulateRex ( _reg, rm, ( immSize == 8 ) || ( [34;49m[33;40mcontrolFlags[34;49m[34;49m Bits.& REX_B ) ) ; [34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 307.71
[34;49m .. Rex ( _reg, rm, ( immSize == 8 ) || ( [34;49m[33;40mcontrolFlags[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdbc7    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fdbcb    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdbcf    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.075 : Logic :> [33;40mBits[34;49m <: 0x00007ffff7fb3130 :> [34;49mrex = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags [34;49m[33;40mBits[34;49m[34;49m.& REX_B ) ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mBits[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 307.75[32;49m
0x7ffff72fdbd2    49b96ef533f7ff7f0000    mov r9, 0x7ffff733f56e                                 [34;49m[32;49m
0x7ffff72fdbdc    49ffd1                  call r9                    	< Logic.[39;49mBits[34;49m : 0x00007ffff733f56e >[34;49m
dbg[c]  :: [34;49m...[34;49m : 307.076 : Class :> [33;40m.[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits[34;49m[33;40m.[34;49m[34;49m& REX_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.078 : C_Syntax :> [33;40m&[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.[34;49m[33;40m&[34;49m[34;49m REX_B ) ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.084 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7e748 :> [34;49m rex = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& [34;49m[33;40mREX_B[34;49m[34;49m ) ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 307.84[32;49m
0x7ffff72fdbdf    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fdbe9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdbed    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.085 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B [34;49m[33;40m)[34;49m[34;49m ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 307.085 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize == 8 ) [34;49m[33;40m||[34;49m[34;49m ( controlFlags Bits.& REX_B ) ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m||[34;49m <:   41 bytes : at namespaces/compiler/x64.cft : 307.85
[34;49m .. ulateRex ( _reg, rm, ( immSize == 8 ) [34;49m[33;40m||[34;49m[34;49m ( controlFlags Bits.& REX_B ) .. [34;49m[32;49m
0x7ffff72fdbdf    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fdbe9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdbed    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fdbf0    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fdbf3    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fdbf7    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fdbfb    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fdbfe    4885c0                  test rax, rax                                          [34;49m[32;49m
0x7ffff72fdc01    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc05    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.087 : int :> [33;40m_CalculateRex[34;49m <: 0x00007ffff5c8fc40 :> [34;49m    rex = [34;49m[33;40m_CalculateRex[34;49m[34;49m ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& R[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 307.87[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c82410	< word : locals_0.[34;49mcontrolFlags[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c84090	< word : Logic.[34;49m==[39;49m : value = 0x00005555555b7f2a > : [34;49mInteger . Integer -> Boolean [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c82080	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c81eb8	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c81408	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: int._CalculateRex :: type expected : Integer . Integer  :: type recorded : Undefined . Boolean . Undefined  : namespaces/compiler/x64.cft : 307.87
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_CalculateRex[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 307.87
[34;49m .. pSize, imm, immSize | modRm ) { rex = [34;49m[33;40m_CalculateRex[34;49m[34;49m ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) .. [34;49m[32;49m
0x7ffff72fdc08    49b9a9da2ff7ff7f0000    mov r9, 0x7ffff72fdaa9                                 [34;49m[32;49m
0x7ffff72fdc12    49ffd1                  call r9                    	< int.[39;49m_CalculateRex[34;49m : 0x00007ffff72fdaa9 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 307.090 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    rex [34;49m[33;40m=[34;49m[34;49m _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 307.90[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c88bd0	< word : int.[34;49m_CalculateRex[39;49m : value = 0x00007ffff72fdaa9 > : [34;49mInteger . Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c81eb8	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c81408	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 307.90
dbg[c]  :: [34;49m...[34;49m : 307.090 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c88d98 :> [34;49m    [34;49m[33;40mrex[34;49m[34;49m = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 307.90
[34;49m .. p, dispSize, imm, immSize | modRm ) { [34;49m[33;40mrex[34;49m[34;49m = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) ;  .. [34;49m[32;49m
0x7ffff72fdc15    498d47a8                lea rax, [r15-0x58]                                    [34;49m[32;49m
0x7ffff72fdc19    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc1d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.090 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    rex [34;49m[33;40m=[34;49m[34;49m _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 307.90[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c88d98	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c81408	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Undefined . Undefined  : namespaces/compiler/x64.cft : 307.90
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 307.90
[34;49m .. ispSize, imm, immSize | modRm ) { rex [34;49m[33;40m=[34;49m[34;49m _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) ;  .. [34;49m[32;49m
0x7ffff72fdc19    488bc8                  mov rcx, rax                                           [34;49m[32;49m
0x7ffff72fdc1c    498b06                  mov rax, [r14]                                         [34;49m[32;49m
0x7ffff72fdc1f    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc23    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 307.090 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    rex = _CalculateRex ( _reg, rm, ( immSize == 8 ) || ( controlFlags Bits.& REX_B ) ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 308.010 : locals_0 :> [33;40mmodRm[34;49m <: 0x00007ffff5c83d00 :> [34;49m    [34;49m[33;40mmodRm[34;49m[34;49m = CalculateModRmByte ( _mod, _reg, rm, sib, disp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 308.012 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    modRm [34;49m[33;40m=[34;49m[34;49m CalculateModRmByte ( _mod, _reg, rm, sib, disp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 308.031 : int :> [33;40mCalculateModRmByte[34;49m <: 0x00007ffff5c85098 :> [34;49m    modRm = [34;49m[33;40mCalculateModRmByte[34;49m[34;49m ( _mod, _reg, rm, sib, disp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 308.037 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c81960 :> [34;49m    modRm = CalculateModRmByte ( [34;49m[33;40m_mod[34;49m[34;49m, _reg, rm, sib, disp ) ; [34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 308.37
[34;49m .. _B ) ) ; modRm = CalculateModRmByte ( [34;49m[33;40m_mod[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdc26    498b47b8                mov rax, [r15-0x48]                                    [34;49m[32;49m
0x7ffff72fdc2a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc2e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 308.043 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c81eb8 :> [34;49m    modRm = CalculateModRmByte ( _mod, [34;49m[33;40m_reg[34;49m[34;49m, rm, sib, disp ) ; [34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 308.43
[34;49m ..  ; modRm = CalculateModRmByte ( _mod, [34;49m[33;40m_reg[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdc31    498b47c0                mov rax, [r15-0x40]                                    [34;49m[32;49m
0x7ffff72fdc35    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc39    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 308.047 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c82080 :> [34;49m    modRm = CalculateModRmByte ( _mod, _reg, [34;49m[33;40mrm[34;49m[34;49m, sib, disp ) ; [34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 308.47
[34;49m .. Rm = CalculateModRmByte ( _mod, _reg, [34;49m[33;40mrm[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdc3c    498b47c8                mov rax, [r15-0x38]                                    [34;49m[32;49m
0x7ffff72fdc40    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc44    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 308.052 : locals_0 :> [33;40msib[34;49m <: 0x00007ffff5c827a0 :> [34;49m    modRm = CalculateModRmByte ( _mod, _reg, rm, [34;49m[33;40msib[34;49m[34;49m, disp ) ; [34;49m 
_Do_C_Syntax_Variable : word = sib :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msib[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 308.52
[34;49m ..  CalculateModRmByte ( _mod, _reg, rm, [34;49m[33;40msib[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdc47    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fdc4b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc4f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 308.059 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c82cf8 :> [34;49m    modRm = CalculateModRmByte ( _mod, _reg, rm, sib, [34;49m[33;40mdisp[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 308.59
[34;49m .. ulateModRmByte ( _mod, _reg, rm, sib, [34;49m[33;40mdisp[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdc52    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fdc56    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc5a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 308.060 : int :> [33;40mCalculateModRmByte[34;49m <: 0x00007ffff5c85098 :> [34;49m    modRm = [34;49m[33;40mCalculateModRmByte[34;49m[34;49m ( _mod, _reg, rm, sib, disp ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCalculateModRmByte[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 308.60
[34;49m .. ntrolFlags Bits.& REX_B ) ) ; modRm = [34;49m[33;40mCalculateModRmByte[34;49m[34;49m ( _mod, _reg, rm, sib, disp ) .. [34;49m[32;49m
0x7ffff72fdc5d    49b9bfd32ff7ff7f0000    mov r9, 0x7ffff72fd3bf                                 [34;49m[32;49m
0x7ffff72fdc67    49ffd1                  call r9                    	< int.[39;49mCalculateModRmByte[34;49m : 0x00007ffff72fd3bf >[34;49m
dbg[c]  :: [34;49m...[34;49m : 308.063 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    modRm [34;49m[33;40m=[34;49m[34;49m CalculateModRmByte ( _mod, _reg, rm, sib, disp ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 308.63[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c82cf8	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c827a0	< word : locals_0.[34;49msib[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c89680	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c89128	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c81960	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c83d00	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Undefined . Undefined  : namespaces/compiler/x64.cft : 308.63
dbg[c]  :: [34;49m...[34;49m : 308.063 : locals_0 :> [33;40mmodRm[34;49m <: 0x00007ffff5c89848 :> [34;49m    [34;49m[33;40mmodRm[34;49m[34;49m = CalculateModRmByte ( _mod, _reg, rm, sib, disp ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mmodRm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 308.63
[34;49m ..  || ( controlFlags Bits.& REX_B ) ) ; [34;49m[33;40mmodRm[34;49m[34;49m = CalculateModRmByte ( _mod, _reg, rm, sib, disp ) ;  .. [34;49m[32;49m
0x7ffff72fdc6a    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdc6e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc72    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 308.063 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    modRm [34;49m[33;40m=[34;49m[34;49m CalculateModRmByte ( _mod, _reg, rm, sib, disp ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 308.63[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c89848	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c89680	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c89128	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c81960	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c83d00	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer . Undefined  : namespaces/compiler/x64.cft : 308.63
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 308.63
[34;49m .. controlFlags Bits.& REX_B ) ) ; modRm [34;49m[33;40m=[34;49m[34;49m CalculateModRmByte ( _mod, _reg, rm, sib, disp ) ;  .. [34;49m[32;49m
0x7ffff72fdc6e    488bc8                  mov rcx, rax                                           [34;49m[32;49m
0x7ffff72fdc71    498b06                  mov rax, [r14]                                         [34;49m[32;49m
0x7ffff72fdc74    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc78    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 308.063 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    modRm = CalculateModRmByte ( _mod, _reg, rm, sib, disp ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 309.035 : void :> [33;40m_Compile_Write_Instruction_X64[34;49m <: 0x00007ffff5c8bbe8 :> [34;49m    [34;49m[33;40m_Compile_Write_Instruction_X64[34;49m[34;49m ( rex, opCode, modRm, cont[34;49m 
dbg[c]  :: [34;49m...[34;49m : 309.040 : locals_0 :> [33;40mrex[34;49m <: 0x00007ffff5c81408 :> [34;49m    _Compile_Write_Instruction_X64 ( [34;49m[33;40mrex[34;49m[34;49m, opCode, modRm, controlFlags, sib, disp, di[34;49m 
_Do_C_Syntax_Variable : word = rex :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.40
[34;49m ..  ) ; _Compile_Write_Instruction_X64 ( [34;49m[33;40mrex[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdc7b    498b47a8                mov rax, [r15-0x58]                                    [34;49m[32;49m
0x7ffff72fdc7f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc83    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.048 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c81798 :> [34;49mCompile_Write_Instruction_X64 ( rex, [34;49m[33;40mopCode[34;49m[34;49m, modRm, controlFlags, sib, disp, disp[34;49m 
_Do_C_Syntax_Variable : word = opCode :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.48
[34;49m .. _Compile_Write_Instruction_X64 ( rex, [34;49m[33;40mopCode[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdc86    498b47b0                mov rax, [r15-0x50]                                    [34;49m[32;49m
0x7ffff72fdc8a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc8e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.055 : locals_0 :> [33;40mmodRm[34;49m <: 0x00007ffff5c83d00 :> [34;49m_Write_Instruction_X64 ( rex, opCode, [34;49m[33;40mmodRm[34;49m[34;49m, controlFlags, sib, disp, dispSize, im[34;49m 
_Do_C_Syntax_Variable : word = modRm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mmodRm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.55
[34;49m .. _Write_Instruction_X64 ( rex, opCode, [34;49m[33;40mmodRm[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdc91    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdc95    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdc99    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.069 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c82410 :> [34;49mtion_X64 ( rex, opCode, modRm, [34;49m[33;40mcontrolFlags[34;49m[34;49m, sib, disp, dispSize, imm, immS[34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.69
[34;49m .. Instruction_X64 ( rex, opCode, modRm, [34;49m[33;40mcontrolFlags[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdc9c    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fdca0    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdca4    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.074 : locals_0 :> [33;40msib[34;49m <: 0x00007ffff5c827a0 :> [34;49mction_X64 ( rex, opCode, modRm, controlFlags, [34;49m[33;40msib[34;49m[34;49m, disp, dispSize, imm, immSize ) ; [34;49m 
_Do_C_Syntax_Variable : word = sib :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msib[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.74
[34;49m .. 4 ( rex, opCode, modRm, controlFlags, [34;49m[33;40msib[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdca7    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fdcab    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdcaf    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.080 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c82cf8 :> [34;49mtion_X64 ( rex, opCode, modRm, controlFlags, sib, [34;49m[33;40mdisp[34;49m[34;49m, dispSize, imm, immSize ) ; [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.80
[34;49m .. ex, opCode, modRm, controlFlags, sib, [34;49m[33;40mdisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdcb2    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fdcb6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdcba    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.090 : locals_0 :> [33;40mdispSize[34;49m <: 0x00007ffff5c82ec0 :> [34;49m_X64 ( rex, opCode, modRm, controlFlags, sib, disp, [34;49m[33;40mdispSize[34;49m[34;49m, imm, immSize ) ; [34;49m 
_Do_C_Syntax_Variable : word = dispSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdispSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.90
[34;49m .. Code, modRm, controlFlags, sib, disp, [34;49m[33;40mdispSize[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdcbd    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fdcc1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdcc5    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.095 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5c83418 :> [34;49mction_X64 ( rex, opCode, modRm, controlFlags, sib, disp, dispSize, [34;49m[33;40mimm[34;49m[34;49m, immSize ) ; [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.95
[34;49m .. m, controlFlags, sib, disp, dispSize, [34;49m[33;40mimm[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdcc8    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fdccc    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdcd0    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.105 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c83b38 :> [34;49mn_X64 ( rex, opCode, modRm, controlFlags, sib, disp, dispSize, imm, [34;49m[33;40mimmSize[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 309.105
[34;49m .. ntrolFlags, sib, disp, dispSize, imm, [34;49m[33;40mimmSize[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdcd3    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fdcd7    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdcdb    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 309.106 : void :> [33;40m_Compile_Write_Instruction_X64[34;49m <: 0x00007ffff5c8bbe8 :> [34;49m    [34;49m[33;40m_Compile_Write_Instruction_X64[34;49m[34;49m ( rex, opCode, modRm, cont[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 309.106[39;49m :
TypeWordStack depth =  12 :  = Top = 0x00007ffff7fc1a80, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a80 > = 0x00007ffff5c859b8	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a78 > = 0x00007ffff5c83418	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a70 > = 0x00007ffff5c82ec0	< word : locals_0.[34;49mdispSize[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a68 > = 0x00007ffff5c85628	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a60 > = 0x00007ffff5c85460	< word : locals_0.[34;49msib[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a58 > = 0x00007ffff5c8a4c0	< word : locals_0.[34;49mcontrolFlags[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -6 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c8a2f8	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -7 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c81798	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -8 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c8a130	< word : locals_0.[34;49mrex[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -9 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c89128	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [ -10 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c81960	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [ -11 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c83d00	< word : locals_0.[34;49mmodRm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: void._Compile_Write_Instruction_X64 :: type expected :  :: type recorded : Undefined . Undefined . Undefined . Undefined . Undefined . Undefined . Undefined . Undefined . Integer  : namespaces/compiler/x64.cft : 309.106
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Write_Instruction_X64[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 309.106
[34;49m .. mByte ( _mod, _reg, rm, sib, disp ) ; [34;49m[33;40m_Compile_Write_Instruction_X64[34;49m[34;49m ( rex, opCode, modRm, controlFlags, sib, disp, dispSize, imm, immSize ) .. [34;49m[32;49m
0x7ffff72fdcde    49b944d72ff7ff7f0000    mov r9, 0x7ffff72fd744                                 [34;49m[32;49m
0x7ffff72fdce8    49ffd1                  call r9                    	< void.[39;49m_Compile_Write_Instruction_X64[34;49m : 0x00007ffff72fd744 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 309.109 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49mite_Instruction_X64 ( rex, opCode, modRm, controlFlags, sib, disp, dispSize, imm, immSize ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 310.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 310.2
[34;49m .. sib, disp, dispSize, imm, immSize ) ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdceb    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fdcef    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fdcf3    4983ee58                sub r14, 0x58                                          [34;49m[32;49m
0x7ffff72fdcf7    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 310.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 310.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 311.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m'Compile_CalcWrite_Instruction_X64 find wdiss apause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 313.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 315.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m  _Compile_Move ( toRegOrMem _mod _reg rm controlFlags disp | opCode )  {  .. [34;49m[32;49m
0x7ffff72fdcf8    e900000000              jmp 0x7ffff72fdcfd         	< C compiler code >        [34;49m[32;49m
0x7ffff72fdcfd    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fdd01    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fdd05    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 315.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c862a0[34;49m.
dbg[c]  :: [34;49m...[34;49m : 316.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( toRegOrMem == REG ) opCode = #x8b ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 316.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m toRegOrMem == REG ) opCode = #x8b ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 316.8
[34;49m .. rm controlFlags disp | opCode )  { if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fdd0c    e900000000              jmp 0x7ffff72fdd11         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 316.020 : locals_0 :> [33;40mtoRegOrMem[34;49m <: 0x00007ffff5c86630 :> [34;49m    if ( [34;49m[33;40mtoRegOrMem[34;49m[34;49m == REG ) opCode = #x8b ; [34;49m 
_Do_C_Syntax_Variable : word = toRegOrMem :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mtoRegOrMem[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 316.20
[34;49m ..  controlFlags disp | opCode )  { if ( [34;49m[33;40mtoRegOrMem[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdd11    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fdd15    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd19    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 316.023 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m    if ( toRegOrMem [34;49m[33;40m==[34;49m[34;49m REG ) opCode = #x8b ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 316.027 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b3f20 :> [34;49m    if ( toRegOrMem == [34;49m[33;40mREG[34;49m[34;49m ) opCode = #x8b ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 316.27
[34;49m .. disp | opCode )  { if ( toRegOrMem == [34;49m[33;40mREG[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdd1c    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fdd26    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd2a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 316.027 : Logic :> [33;40m==[34;49m <: cprimitive :> [34;49m    if ( toRegOrMem [34;49m[33;40m==[34;49m[34;49m REG ) opCode = #x8b ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 316.27[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b3f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c86630	< word : locals_0.[34;49mtoRegOrMem[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.== :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 316.27
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m==[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 316.27
[34;49m .. gs disp | opCode )  { if ( toRegOrMem [34;49m[33;40m==[34;49m[34;49m REG [34;49m[32;49m
0x7ffff72fdd15    48b90300000000000000    mov rcx, 0x3                                           [34;49m[32;49m
0x7ffff72fdd1f    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fdd22    0f94c0                  setz al                                                [34;49m[32;49m
0x7ffff72fdd25    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fdd29    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd2d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 316.028 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( toRegOrMem == REG [34;49m[33;40m)[34;49m[34;49m opCode = #x8b ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 316.28
[34;49m ..  | opCode )  { if ( toRegOrMem == REG [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fdd30    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 316.28 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fdd11[34;49m.
dbg[c]  :: [34;49m...[34;49m : 316.036 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    if ( toRegOrMem == REG ) [34;49m[33;40m{[34;49m[34;49mpCode = #x8b ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 316.36
[34;49m .. | opCode )  { if ( toRegOrMem == REG )[34;49m[33;40m{[34;49m[34;49mopCode [34;49m[32;49m
0x7ffff72fdd31    e900000000              jmp 0x7ffff72fdd36         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 316.036 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8bde8 :> [34;49m    if ( toRegOrMem == REG ) [34;49m[33;40mopCode[34;49m[34;49m = #x8b ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 316.038 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    if ( toRegOrMem == REG ) opCode [34;49m[33;40m=[34;49m[34;49m #x8b ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 316.043 : <literal> :> [33;40m#x8b[34;49m <: 0x00007ffff5c8c508 :> [34;49m    if ( toRegOrMem == REG ) opCode = [34;49m[33;40m#x8b[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m#x8b[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 316.43
[34;49m ..   { if ( toRegOrMem == REG ) opCode = [34;49m[33;40m#x8b[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdd36    48b88b00000000000000    mov rax, 0x8b                                          [34;49m[32;49m
0x7ffff72fdd40    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd44    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 316.045 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    if ( toRegOrMem == REG ) opCode [34;49m[33;40m=[34;49m[34;49m #x8b ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 316.45[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8c508	< word : <literal>.[34;49m#x8b[39;49m : value = 0x000000000000008b > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8bde8	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 316.45
dbg[c]  :: [34;49m...[34;49m : 316.045 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8c898 :> [34;49m    if ( toRegOrMem == REG ) [34;49m[33;40mopCode[34;49m[34;49m = #x8b ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 316.45
[34;49m ..  opCode )  { if ( toRegOrMem == REG ) [34;49m[33;40mopCode[34;49m[34;49m = #x8b ; [34;49m[32;49m
0x7ffff72fdd47    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdd4b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd4f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 316.045 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    if ( toRegOrMem == REG ) opCode [34;49m[33;40m=[34;49m[34;49m #x8b ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 316.45[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8c898	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 316.45
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 316.45
[34;49m ..  )  { if ( toRegOrMem == REG ) opCode [34;49m[33;40m=[34;49m[34;49m #x8b ; [34;49m[32;49m
0x7ffff72fdd40    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdd44    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 316.045 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    if ( toRegOrMem == REG ) opCode = #x8b [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 317.016 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    else [34;49m[33;40m{[34;49m[34;49mpCode = #x89 ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 317.16
[34;49m .. gOrMem == REG ) opCode = #x8b ;  else [34;49m[33;40m{[34;49m[34;49mpCode [34;49m[32;49m
0x7ffff72fdd48    e900000000              jmp 0x7ffff72fdd4d         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 317.016 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8bde8 :> [34;49m    else [34;49m[33;40mopCode[34;49m[34;49m = #x89 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 317.018 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    else opCode [34;49m[33;40m=[34;49m[34;49m #x89 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 317.023 : <literal> :> [33;40m#x89[34;49m <: 0x00007ffff5c8d180 :> [34;49m    else opCode = [34;49m[33;40m#x89[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m#x89[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 317.23
[34;49m ..  REG ) opCode = #x8b ;  else opCode = [34;49m[33;40m#x89[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdd4d    48b88900000000000000    mov rax, 0x89                                          [34;49m[32;49m
0x7ffff72fdd57    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd5b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 317.025 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    else opCode [34;49m[33;40m=[34;49m[34;49m #x89 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 317.25[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8d180	< word : <literal>.[34;49m#x89[39;49m : value = 0x0000000000000089 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8cdf0	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 317.25
dbg[c]  :: [34;49m...[34;49m : 317.025 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8d348 :> [34;49m    else [34;49m[33;40mopCode[34;49m[34;49m = #x89 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 317.25
[34;49m .. gOrMem == REG ) opCode = #x8b ;  else [34;49m[33;40mopCode[34;49m[34;49m = #x89 ; [34;49m[32;49m
0x7ffff72fdd5e    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdd62    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd66    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 317.025 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    else opCode [34;49m[33;40m=[34;49m[34;49m #x89 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 317.25[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8d348	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 317.25
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 317.25
[34;49m .. == REG ) opCode = #x8b ;  else opCode [34;49m[33;40m=[34;49m[34;49m #x89 ; [34;49m[32;49m
0x7ffff72fdd57    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdd5b    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 317.025 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    else opCode = #x89 [34;49m[33;40m;[34;49m[34;49m [34;49m 
DataStack at : [39;49mnamespaces/compiler/x64.cft : 317.25[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c862a0	< word : void.[39;49m_Compile_Move[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 318.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49mCompile_CalcWrite_Instruction_X64 ( rex,  opCode,  _mod,  _reg,  rm, controlFlags,  [34;49m 
dbg[c]  :: [34;49m...[34;49m : 319.038 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c85298 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, opCode, _mod, _[34;49m 
dbg[c]  :: [34;49m...[34;49m : 319.041 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c8ddf8 :> [34;49m    Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m, opCode, _mod, _reg, rm, controlFlags, 0, d[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 319.41
[34;49m .. ; Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdd4a    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fdd54    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd58    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.049 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8bde8 :> [34;49mmpile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40mopCode[34;49m[34;49m, _mod, _reg, rm, controlFlags, 0, dis[34;49m 
_Do_C_Syntax_Variable : word = opCode :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 319.49
[34;49m .. ompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40mopCode[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdd5b    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdd5f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd63    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.055 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c867f8 :> [34;49mCalcWrite_Instruction_X64 ( 0, opCode, [34;49m[33;40m_mod[34;49m[34;49m, _reg, rm, controlFlags, 0, disp, 0, 0,[34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 319.55
[34;49m .. alcWrite_Instruction_X64 ( 0, opCode, [34;49m[33;40m_mod[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdd66    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fdd6a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd6e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.061 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c86b88 :> [34;49mite_Instruction_X64 ( 0, opCode, _mod, [34;49m[33;40m_reg[34;49m[34;49m, rm, controlFlags, 0, disp, 0, 0, 0 ) ;[34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 319.61
[34;49m .. te_Instruction_X64 ( 0, opCode, _mod, [34;49m[33;40m_reg[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdd71    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fdd75    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd79    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.065 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c86f18 :> [34;49mrite_Instruction_X64 ( 0, opCode, _mod, _reg, [34;49m[33;40mrm[34;49m[34;49m, controlFlags, 0, disp, 0, 0, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 319.65
[34;49m .. truction_X64 ( 0, opCode, _mod, _reg, [34;49m[33;40mrm[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdd7c    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fdd80    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd84    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.079 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c870e0 :> [34;49muction_X64 ( 0, opCode, _mod, _reg, rm, [34;49m[33;40mcontrolFlags[34;49m[34;49m, 0, disp, 0, 0, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 319.79
[34;49m .. tion_X64 ( 0, opCode, _mod, _reg, rm, [34;49m[33;40mcontrolFlags[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdd87    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fdd8b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdd8f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.082 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c8e188 :> [34;49mrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags, [34;49m[33;40m0[34;49m[34;49m, disp, 0, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 319.82
[34;49m .. opCode, _mod, _reg, rm, controlFlags, [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdd92    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fdd9c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdda0    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.088 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c872a8 :> [34;49mte_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags, 0, [34;49m[33;40mdisp[34;49m[34;49m, 0, 0, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 319.88
[34;49m .. ode, _mod, _reg, rm, controlFlags, 0, [34;49m[33;40mdisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdda3    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fdda7    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fddab    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.091 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c8e350 :> [34;49mrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags, 0, disp, [34;49m[33;40m0[34;49m[34;49m, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 319.91
[34;49m .. mod, _reg, rm, controlFlags, 0, disp, [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fddae    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fddb8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fddbc    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 319.099 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c85298 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, opCode, _mod, _[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 319.99[39;49m :
TypeWordStack depth =  11 :  = Top = 0x00007ffff7fc1a78, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a78 > = 0x00007ffff5c8ec38	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a70 > = 0x00007ffff5c8ea70	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a68 > = 0x00007ffff5c8e350	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a60 > = 0x00007ffff5c872a8	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a58 > = 0x00007ffff5c8e188	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c870e0	< word : locals_0.[34;49mcontrolFlags[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -6 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c86f18	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -7 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c86b88	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -8 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c867f8	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -9 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8dfc0	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [ -10 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8ddf8	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: void.Compile_CalcWrite_Instruction_X64 :: type expected :  :: type recorded : Integer . Integer . Undefined . Undefined . Undefined . Undefined . Integer . Undefined . Integer . Integer . Integer  : namespaces/compiler/x64.cft : 319.99
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 319.99
[34;49m .. opCode = #x8b ;  else opCode = #x89 ; [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, opCode, _mod, _reg, rm, controlFlags, 0, disp, 0, 0, 0 ) .. [34;49m[32;49m
0x7ffff72fdde1    49b983db2ff7ff7f0000    mov r9, 0x7ffff72fdb83                                 [34;49m[32;49m
0x7ffff72fddeb    49ffd1                  call r9                    	< void.[39;49mCompile_CalcWrite_Instruction_X64[34;49m : 0x00007ffff72fdb83 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 319.102 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49mile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags, 0, disp, 0, 0, 0 ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 320.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 320.2
[34;49m .. m, controlFlags, 0, disp, 0, 0, 0 ) ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fddee    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fddf2    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fddf6    4983ee30                sub r14, 0x30                                          [34;49m[32;49m
0x7ffff72fddfa    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 320.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 320.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 321.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49m_Compile_Move find wdiss //pause [34;49m 
Stack : word at namespaces/compiler/x64.cft : 321.15 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff6ef2b82[34;49m.
dbg[i]  :: [34;49m...[34;49m : 321.020 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m'_Compile_Move [34;49m[33;40mfind[34;49m[34;49m wdiss //pause [34;49m 
Stack : word at namespaces/compiler/x64.cft : 321.20 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff5c862a0[34;49m.
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
starting at address : 0xf72fdcfd -- code size = 254 bytes
TypeSignature : Integer 
Word :: void.[34;49m_Compile_Move[39;49m : definition = 0x00007ffff72fdcfd : disassembly at namespaces/compiler/x64.cft : 321.26 :[32;49m
0x7ffff72fdcfd    4d897e08                mov [r14+0x8], r15                                     [39;49m[32;49m
0x7ffff72fdd01    4d8d7e08                lea r15, [r14+0x8]                                     [39;49m[32;49m
0x7ffff72fdd05    4981c610000000          add r14, 0x10                                          [39;49m
[34;49m ..  controlFlags disp | opCode )  { if ( [39;49m[33;40mtoRegOrMem[39;49m[34;49m == REG ) opCode = #x8b ;  else opCode = #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, .. [39;49m[32;49m
0x7ffff72fdd0c    498b47d0                mov rax, [r15-0x30]                                    [39;49m
[34;49m .. disp | opCode )  { if ( toRegOrMem == [39;49m[33;40mREG[39;49m[34;49m ) opCode = #x8b ;  else opCode = #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, r .. [39;49m[32;49m
0x7ffff72fdd10    48b90300000000000000    mov rcx, 0x3                                           [39;49m
[34;49m .. gs disp | opCode )  { if ( toRegOrMem [39;49m[33;40m==[39;49m[34;49m REG ) opCode = #x8b ;  else opCode = #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg .. [39;49m[32;49m
0x7ffff72fdd1a    483bc1                  cmp rax, rcx                                           [39;49m[32;49m
0x7ffff72fdd1d    0f8516000000            jnz 0x7ffff72fdd39         	< void.[34;49m_Compile_Move[39;49m+60 >[39;49m
[34;49m ..   { if ( toRegOrMem == REG ) opCode = [39;49m[33;40m#x8b[39;49m[34;49m ;  else opCode = #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags .. [39;49m[32;49m
0x7ffff72fdd23    48b88b00000000000000    mov rax, 0x8b                                          [39;49m
[34;49m ..  opCode )  { if ( toRegOrMem == REG ) [39;49m[33;40mopCode[39;49m[34;49m = #x8b ;  else opCode = #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, con .. [39;49m[32;49m
0x7ffff72fdd2d    498d4f08                lea rcx, [r15+0x8]                                     [39;49m
[34;49m ..  )  { if ( toRegOrMem == REG ) opCode [39;49m[33;40m=[39;49m[34;49m #x8b ;  else opCode = #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFla .. [39;49m[32;49m
0x7ffff72fdd31    488901                  mov [rcx], rax                                         [39;49m
[34;49m .. f ( toRegOrMem == REG ) opCode = #x8b [39;49m[33;40m;[39;49m[34;49m  else opCode = #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags, 0,  .. [39;49m[32;49m
0x7ffff72fdd34    e911000000              jmp 0x7ffff72fdd4a         	< void.[34;49m_Compile_Move[39;49m+77 >[39;49m
[34;49m ..  REG ) opCode = #x8b ;  else opCode = [39;49m[33;40m#x89[39;49m[34;49m ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags, 0, disp, 0, 0, 0 ) ; .. [39;49m[32;49m
0x7ffff72fdd39    48b88900000000000000    mov rax, 0x89                                          [39;49m
[34;49m .. gOrMem == REG ) opCode = #x8b ;  else [39;49m[33;40mopCode[39;49m[34;49m = #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags, 0, disp, 0, .. [39;49m[32;49m
0x7ffff72fdd43    498d4f08                lea rcx, [r15+0x8]                                     [39;49m
[34;49m .. == REG ) opCode = #x8b ;  else opCode [39;49m[33;40m=[39;49m[34;49m #x89 ; Compile_CalcWrite_Instruction_X64 ( 0, opCode, _mod, _reg, rm, controlFlags, 0, disp, 0, 0, 0 ) .. [39;49m[32;49m
0x7ffff72fdd47    488901                  mov [rcx], rax                                         [39;49m
[34;49m .. ; Compile_CalcWrite_Instruction_X64 ( [39;49m[33;40m0[39;49m[34;49m, opCode, _mod, _reg, rm, controlFlags, 0, disp, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fdd4a    48b80000000000000000    mov rax, 0x0                                           [39;49m[32;49m
0x7ffff72fdd54    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fdd58    498906                  mov [r14], rax                                         [39;49m
[34;49m .. ompile_CalcWrite_Instruction_X64 ( 0, [39;49m[33;40mopCode[39;49m[34;49m, _mod, _reg, rm, controlFlags, 0, disp, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fdd5b    498b4708                mov rax, [r15+0x8]                                     [39;49m[32;49m
0x7ffff72fdd5f    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fdd63    498906                  mov [r14], rax                                         [39;49m
[34;49m .. alcWrite_Instruction_X64 ( 0, opCode, [39;49m[33;40m_mod[39;49m[34;49m, _reg, rm, controlFlags, 0, disp, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fdd66    498b47d8                mov rax, [r15-0x28]                                    [39;49m[32;49m
0x7ffff72fdd6a    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fdd6e    498906                  mov [r14], rax                                         [39;49m
[34;49m .. te_Instruction_X64 ( 0, opCode, _mod, [39;49m[33;40m_reg[39;49m[34;49m, rm, controlFlags, 0, disp, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fdd71    498b47e0                mov rax, [r15-0x20]                                    [39;49m[32;49m
0x7ffff72fdd75    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fdd79    498906                  mov [r14], rax                                         [39;49m
[34;49m .. truction_X64 ( 0, opCode, _mod, _reg, [39;49m[33;40mrm[39;49m[34;49m, controlFlags, 0, disp, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fdd7c    498b47e8                mov rax, [r15-0x18]                                    [39;49m[32;49m
0x7ffff72fdd80    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fdd84    498906                  mov [r14], rax                                         [39;49m
[34;49m .. tion_X64 ( 0, opCode, _mod, _reg, rm, [39;49m[33;40mcontrolFlags[39;49m[34;49m, 0, disp, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fdd87    498b47f0                mov rax, [r15-0x10]                                    [39;49m[32;49m
0x7ffff72fdd8b    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fdd8f    498906                  mov [r14], rax                                         [39;49m
[34;49m .. opCode, _mod, _reg, rm, controlFlags, [39;49m[33;40m0[39;49m[34;49m, disp, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fdd92    48b80000000000000000    mov rax, 0x0                                           [39;49m[32;49m
0x7ffff72fdd9c    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fdda0    498906                  mov [r14], rax                                         [39;49m
[34;49m .. ode, _mod, _reg, rm, controlFlags, 0, [39;49m[33;40mdisp[39;49m[34;49m, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fdda3    498b47f8                mov rax, [r15-0x8]                                     [39;49m[32;49m
0x7ffff72fdda7    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fddab    498906                  mov [r14], rax                                         [39;49m
[34;49m .. mod, _reg, rm, controlFlags, 0, disp, [39;49m[33;40m0[39;49m[34;49m, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fddae    48b80000000000000000    mov rax, 0x0                                           [39;49m[32;49m
0x7ffff72fddb8    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fddbc    498906                  mov [r14], rax                                         [39;49m
[34;49m .. , _reg, rm, controlFlags, 0, disp, 0, [39;49m[33;40m0[39;49m[34;49m, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fddbf    48b80000000000000000    mov rax, 0x0                                           [39;49m[32;49m
0x7ffff72fddc9    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fddcd    498906                  mov [r14], rax                                         [39;49m
[34;49m .. reg, rm, controlFlags, 0, disp, 0, 0, [39;49m[33;40m0[39;49m[34;49m ) ; }  .. [39;49m[32;49m
0x7ffff72fddd0    48b80000000000000000    mov rax, 0x0                                           [39;49m[32;49m
0x7ffff72fddda    4983c608                add r14, 0x8                                           [39;49m[32;49m
0x7ffff72fddde    498906                  mov [r14], rax                                         [39;49m
[34;49m .. opCode = #x8b ;  else opCode = #x89 ; [39;49m[33;40mCompile_CalcWrite_Instruction_X64[39;49m[34;49m ( 0, opCode, _mod, _reg, rm, controlFlags, 0, disp, 0, 0, 0 ) ; }  .. [39;49m[32;49m
0x7ffff72fdde1    49b983db2ff7ff7f0000    mov r9, 0x7ffff72fdb83                                 [39;49m[32;49m
0x7ffff72fddeb    49ffd1                  call r9                    	< void.[34;49mCompile_CalcWrite_Instruction_X64[39;49m : 0x00007ffff72fdb83 >[39;49m
[34;49m .. m, controlFlags, 0, disp, 0, 0, 0 ) ; [39;49m[33;40m}[39;49m[34;49m  .. [39;49m[32;49m
0x7ffff72fddee    4d8d77f8                lea r14, [r15-0x8]                                     [39;49m[32;49m
0x7ffff72fddf2    4d8b7e08                mov r15, [r14+0x8]                                     [39;49m[32;49m
0x7ffff72fddf6    4983ee30                sub r14, 0x30                                          [39;49m[32;49m
0x7ffff72fddfa    c3                      ret                                                    [39;49m
Word_Disassemble : word - '_Compile_Move' :: codeSize = 2530x00007ffff72692380x00007ffff72fdcfd32126
Stack : word at namespaces/compiler/x64.cft : 321.26 :> [39;49mwdiss[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 321.028 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m'_Compile_Move find wdiss [34;49m[33;40m//[34;49m[34;49mpause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 324.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m _Compile_Move_DataStackN_ToReg ( _reg n ) { _Compile_Move ( REG, MEM, _reg, DSP, [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 324.49
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_Move_DataStackN_ToReg ( _reg n ) {  .. [34;49m[32;49m
0x7ffff72fddfb    e900000000              jmp 0x7ffff72fde00         	< C compiler code >        [34;49m[32;49m
0x7ffff72fde00    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fde04    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fde08    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 324.49 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c860d8[34;49m.
dbg[c]  :: [34;49m...[34;49m : 324.063 : void :> [33;40m_Compile_Move[34;49m <: 0x00007ffff5c862a0 :> [34;49me_DataStackN_ToReg ( _reg n ) { [34;49m[33;40m_Compile_Move[34;49m[34;49m ( REG, MEM, _reg, DSP, (REX_B | [34;49m 
dbg[c]  :: [34;49m...[34;49m : 324.068 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b3f20 :> [34;49maStackN_ToReg ( _reg n ) { _Compile_Move ( [34;49m[33;40mREG[34;49m[34;49m, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 324.68
[34;49m .. kN_ToReg ( _reg n ) { _Compile_Move ( [34;49m[33;40mREG[34;49m[34;49m[34;49m[32;49m
0x7ffff72fde0f    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fde19    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde1d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.073 : X64 :> [33;40mMEM[34;49m <: 0x00007ffff74b4640 :> [34;49mkN_ToReg ( _reg n ) { _Compile_Move ( REG, [34;49m[33;40mMEM[34;49m[34;49m, _reg, DSP, (REX_B | MODRM_B | DISP_B), n [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMEM[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 324.73
[34;49m .. Reg ( _reg n ) { _Compile_Move ( REG, [34;49m[33;40mMEM[34;49m[34;49m[34;49m[32;49m
0x7ffff72fde20    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fde2a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde2e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.079 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c85628 :> [34;49m( _reg n ) { _Compile_Move ( REG, MEM, [34;49m[33;40m_reg[34;49m[34;49m, DSP, (REX_B | MODRM_B | DISP_B), n * C[34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 324.79
[34;49m ..  _reg n ) { _Compile_Move ( REG, MEM, [34;49m[33;40m_reg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fde31    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fde35    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde39    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.084 : X64 :> [33;40mDSP[34;49m <: 0x00007ffff5c7c1e0 :> [34;49m_reg n ) { _Compile_Move ( REG, MEM, _reg, [34;49m[33;40mDSP[34;49m[34;49m, (REX_B | MODRM_B | DISP_B), n * CELL ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 324.086 : C_Syntax :> [33;40m,[34;49m <: cprimitive :> [34;49m_reg n ) { _Compile_Move ( REG, MEM, _reg, DSP[34;49m[33;40m,[34;49m[34;49m (REX_B | MODRM_B | DISP_B), n * CELL ) ; } pre[34;49m 
dbg[c]  :: [34;49m...[34;49m : 324.086 : X64 :> [33;40mDSP[34;49m <: 0x00007ffff5c7c1e0 :> [34;49m_reg n ) { _Compile_Move ( REG, MEM, _reg, [34;49m[33;40mDSP[34;49m[34;49m, (REX_B | MODRM_B | DISP_B), n * CELL ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDSP[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 324.86
[34;49m .. n ) { _Compile_Move ( REG, MEM, _reg, [34;49m[33;40mDSP[34;49m[34;49m, [34;49m[32;49m
0x7ffff72fde3c    48b80e00000000000000    mov rax, 0xe                                           [34;49m[32;49m
0x7ffff72fde46    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde4a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.087 : C :> [33;40m([34;49m <: cprimitive :> [34;49m ( _reg n ) { _Compile_Move ( REG, MEM, _reg, DSP, [34;49m[33;40m([34;49m[34;49mREX_B | MODRM_B | DISP_B), n * CELL ) ; } prefix [34;49m 
dbg[c]  :: [34;49m...[34;49m : 324.093 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7e748 :> [34;49m { _Compile_Move ( REG, MEM, _reg, DSP, ([34;49m[33;40mREX_B[34;49m[34;49m | MODRM_B | DISP_B), n * CELL ) ; } pref[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 324.93[39;49m :
TypeWordStack depth =   4 :  = Top = 0x00007ffff7fc1a40, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c7c1e0	< word : X64.[34;49mDSP[39;49m : value = 0x000000000000000e > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c85628	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b4640	< word : X64.[34;49mMEM[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a28 > = 0x00007ffff74b3f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
type match :: X64.REX_B :: type expected :  :: type recorded : Integer  : namespaces/compiler/x64.cft : 324.93
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 324.93[32;49m
0x7ffff72fde4d    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fde57    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde5b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.095 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m_reg n ) { _Compile_Move ( REG, MEM, _reg, DSP, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | DISP_B), n * CELL ) ; } prefix [34;49m 
dbg[c]  :: [34;49m...[34;49m : 324.103 : X64 :> [33;40mMODRM_B[34;49m <: 0x00007ffff5c7ead8 :> [34;49mompile_Move ( REG, MEM, _reg, DSP, (REX_B | [34;49m[33;40mMODRM_B[34;49m[34;49m | DISP_B), n * CELL ) ; } prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMODRM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 324.103[32;49m
0x7ffff72fde5e    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fde68    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde6c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.103 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m_reg n ) { _Compile_Move ( REG, MEM, _reg, DSP, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | DISP_B), n * CELL ) ; } prefix [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 324.103[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c85628	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b4640	< word : X64.[34;49mMEM[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff74b3f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Integer . Undefined  : namespaces/compiler/x64.cft : 324.103
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 324.103
[34;49m .. le_Move ( REG, MEM, _reg, DSP, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B [34;49m[32;49m
0x7ffff72fde5e    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fde68    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde6c    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fde6f    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fde72    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fde76    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fde7a    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fde7d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde81    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.111 : X64 :> [33;40mDISP_B[34;49m <: 0x00007ffff5c7f1f8 :> [34;49mCompile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | [34;49m[33;40mDISP_B[34;49m[34;49m), n * CELL ) ; } prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDISP_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 324.111[32;49m
0x7ffff72fde84    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fde8e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde92    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.111 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m_reg n ) { _Compile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m DISP_B), n * CELL ) ; } prefix [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 324.111[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8a4c0	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff74b3f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 324.111
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 324.111
[34;49m .. REG, MEM, _reg, DSP, (REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m DISP_B[34;49m[32;49m
0x7ffff72fde84    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fde8e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fde92    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fde95    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fde98    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fde9c    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fdea0    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fdea3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdea7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.112 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m n ) { _Compile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B[34;49m[33;40m)[34;49m[34;49m, n * CELL ) ; } prefix [34;49m 
dbg[c]  :: [34;49m...[34;49m : 324.116 : locals_0 :> [33;40mn[34;49m <: 0x00007ffff5c85460 :> [34;49mCompile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B), [34;49m[33;40mn[34;49m[34;49m * CELL ) ; } prefix [34;49m 
_Do_C_Syntax_Variable : word = n :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mn[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 324.116
[34;49m .. reg, DSP, (REX_B | MODRM_B | DISP_B), [34;49m[33;40mn[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdeaa    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fdeae    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdeb2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.118 : Int :> [33;40m*[34;49m <: cprimitive :> [34;49m _reg n ) { _Compile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B), n [34;49m[33;40m*[34;49m[34;49m CELL ) ; } prefix [34;49m 
dbg[c]  :: [34;49m...[34;49m : 324.123 : X64 :> [33;40mCELL[34;49m <: 0x00007ffff5c7e028 :> [34;49m _Compile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B), n * [34;49m[33;40mCELL[34;49m[34;49m ) ; } prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCELL[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 324.123
[34;49m ..  DSP, (REX_B | MODRM_B | DISP_B), n * [34;49m[33;40mCELL[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdeb5    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fdebf    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdec3    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.123 : Int :> [33;40m*[34;49m <: cprimitive :> [34;49m _reg n ) { _Compile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B), n [34;49m[33;40m*[34;49m[34;49m CELL ) ; } prefix [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 324.123[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c7e028	< word : X64.[34;49mCELL[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c85460	< word : locals_0.[34;49mn[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8a130	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
type match :: Int.* :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 324.123
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m*[34;49m <:   21 bytes : at namespaces/compiler/x64.cft : 324.123
[34;49m .. g, DSP, (REX_B | MODRM_B | DISP_B), n [34;49m[33;40m*[34;49m[34;49m CELL [34;49m[32;49m
0x7ffff72fdeae    48b90800000000000000    mov rcx, 0x8                                           [34;49m[32;49m
0x7ffff72fdeb8    480fafc1                imul rax, rcx                                          [34;49m[32;49m
0x7ffff72fdebc    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdec0    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 324.124 : void :> [33;40m_Compile_Move[34;49m <: 0x00007ffff5c862a0 :> [34;49me_DataStackN_ToReg ( _reg n ) { [34;49m[33;40m_Compile_Move[34;49m[34;49m ( REG, MEM, _reg, DSP, (REX_B | [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 324.124[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c89f68	< word : Int.[34;49m*[39;49m : value = 0x00005555555b7ba9 > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8a130	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
type match :: void._Compile_Move :: type expected : Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 324.124
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 324.124
[34;49m .. le_Move_DataStackN_ToReg ( _reg n ) { [34;49m[33;40m_Compile_Move[34;49m[34;49m ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B), n * CELL )[34;49m[32;49m
0x7ffff72fdec3    49b9fddc2ff7ff7f0000    mov r9, 0x7ffff72fdcfd                                 [34;49m[32;49m
0x7ffff72fdecd    49ffd1                  call r9                    	< void.[39;49m_Compile_Move[34;49m : 0x00007ffff72fdcfd >[34;49m
dbg[c]  :: [34;49m...[34;49m : 324.127 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m n ) { _Compile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B), n * CELL ) [34;49m[33;40m;[34;49m[34;49m } prefix [34;49m 
dbg[c]  :: [34;49m...[34;49m : 324.129 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m n ) { _Compile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B), n * CELL ) ; [34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 324.129
[34;49m .. X_B | MODRM_B | DISP_B), n * CELL ) ; [34;49m[33;40m}[34;49m[34;49m [34;49m[32;49m
0x7ffff72fded0    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fded4    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fded8    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fdedc    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 324.129 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 324.136 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m{ _Compile_Move ( REG, MEM, _reg, DSP, (REX_B | MODRM_B | DISP_B), n * CELL ) ; } [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 326.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m group1 : ADD OR ADC SBB AND_OPCODE SUB XOR CMP : with immediate data [34;49m 
dbg[i]  :: [34;49m...[34;49m : 327.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 328.071 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m_Compile_Group1_Immediate ( code _mod rm disp imm immSize | opCode ) [34;49m[33;40m//[34;49m[34;49mcontrolFlags ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 332.011 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c88678 :> [34;49m    [34;49m[33;40mopCode[34;49m[34;49m = #x80 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 332.013 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    opCode [34;49m[33;40m=[34;49m[34;49m #x80 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 332.018 : <literal> :> [33;40m#x80[34;49m <: 0x00007ffff5c8ee00 :> [34;49m    opCode = [34;49m[33;40m#x80[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m#x80[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 332.18
[34;49m .. isp imm immSize | opCode ) { opCode = [34;49m[33;40m#x80[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdef1    48b88000000000000000    mov rax, 0x80                                          [34;49m[32;49m
0x7ffff72fdefb    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdeff    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 332.020 : Infix :> [33;40m=[34;49m <: cprimitive :> [34;49m    opCode [34;49m[33;40m=[34;49m[34;49m #x80 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 332.20[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c8ee00	< word : <literal>.[34;49m#x80[39;49m : value = 0x0000000000000080 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c88678	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Infix.= :: type expected : TypeVariable . Any  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 332.20
dbg[c]  :: [34;49m...[34;49m : 332.020 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c8dfc0 :> [34;49m    [34;49m[33;40mopCode[34;49m[34;49m = #x80 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 332.20
[34;49m .. _mod rm disp imm immSize | opCode ) { [34;49m[33;40mopCode[34;49m[34;49m = #x80 ; [34;49m[32;49m
0x7ffff72fdf02    498d4708                lea rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdf06    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf0a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 332.020 : Compiler :> [33;40m=[34;49m <: cprimitive :> [34;49m    opCode [34;49m[33;40m=[34;49m[34;49m #x80 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 332.20[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8dfc0	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Compiler.= :: type expected : Any . TypeVariable  :: type recorded : Integer  : namespaces/compiler/x64.cft : 332.20
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m=[34;49m <:    7 bytes : at namespaces/compiler/x64.cft : 332.20
[34;49m ..  disp imm immSize | opCode ) { opCode [34;49m[33;40m=[34;49m[34;49m #x80 ; [34;49m[32;49m
0x7ffff72fdefb    498d4f08                lea rcx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdeff    488901                  mov [rcx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 332.020 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    opCode = #x80 [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 333.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49mopCode = ( code << 3 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.007 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m    [34;49m[33;40mif[34;49m[34;49m ( ( immSize > BYTE ) || ( imm >= 0x100 ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.008 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m    if [34;49m[33;40m([34;49m[34;49m ( immSize > BYTE ) || ( imm >= 0x100 ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 336.8
[34;49m .. Size | opCode ) { opCode = #x80 ;  if [34;49m[33;40m([34;49m[34;49m[34;49m[32;49m
0x7ffff72fdf02    e900000000              jmp 0x7ffff72fdf07         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 336.010 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    if ( [34;49m[33;40m([34;49m[34;49m immSize > BYTE ) || ( imm >= 0x100 ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.019 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c88840 :> [34;49m    if ( ( [34;49m[33;40mimmSize[34;49m[34;49m > BYTE ) || ( imm >= 0x100 ) ) [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 336.19
[34;49m ..  | opCode ) { opCode = #x80 ;  if ( ( [34;49m[33;40mimmSize[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdf07    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fdf0b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf0f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 336.021 : Logic :> [33;40m>[34;49m <: cprimitive :> [34;49m    if ( ( immSize [34;49m[33;40m>[34;49m[34;49m BYTE ) || ( imm >= 0x100 ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.026 : X64 :> [33;40mBYTE[34;49m <: 0x00007ffff5c7de60 :> [34;49m    if ( ( immSize > [34;49m[33;40mBYTE[34;49m[34;49m ) || ( imm >= 0x100 ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mBYTE[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 336.26
[34;49m .. ) { opCode = #x80 ;  if ( ( immSize > [34;49m[33;40mBYTE[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdf12    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fdf1c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf20    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 336.026 : Logic :> [33;40m>[34;49m <: cprimitive :> [34;49m    if ( ( immSize [34;49m[33;40m>[34;49m[34;49m BYTE ) || ( imm >= 0x100 ) ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 336.26[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c7de60	< word : X64.[34;49mBYTE[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c88840	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: Logic.> :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 336.26
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m>[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 336.26
[34;49m .. e ) { opCode = #x80 ;  if ( ( immSize [34;49m[33;40m>[34;49m[34;49m BYTE [34;49m[32;49m
0x7ffff72fdf0b    48b90100000000000000    mov rcx, 0x1                                           [34;49m[32;49m
0x7ffff72fdf15    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fdf18    0f9fc0                  setg al                                                [34;49m[32;49m
0x7ffff72fdf1b    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fdf1f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf23    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 336.027 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( ( immSize > BYTE [34;49m[33;40m)[34;49m[34;49m || ( imm >= 0x100 ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.031 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m    if ( ( immSize > BYTE ) [34;49m[33;40m||[34;49m[34;49m ( imm >= 0x100 ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.032 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    if ( ( immSize > BYTE ) || [34;49m[33;40m([34;49m[34;49m imm >= 0x100 ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.037 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5c88d98 :> [34;49m    if ( ( immSize > BYTE ) || ( [34;49m[33;40mimm[34;49m[34;49m >= 0x100 ) ) [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 336.37
[34;49m ..  #x80 ;  if ( ( immSize > BYTE ) || ( [34;49m[33;40mimm[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdf26    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fdf2a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf2e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 336.040 : Logic :> [33;40m>=[34;49m <: cprimitive :> [34;49m    if ( ( immSize > BYTE ) || ( imm [34;49m[33;40m>=[34;49m[34;49m 0x100 ) ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.046 : <literal> :> [33;40m0x100[34;49m <: 0x00007ffff5c8d348 :> [34;49m    if ( ( immSize > BYTE ) || ( imm >= [34;49m[33;40m0x100[34;49m[34;49m ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x100[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 336.46
[34;49m ..   if ( ( immSize > BYTE ) || ( imm >= [34;49m[33;40m0x100[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdf31    48b80001000000000000    mov rax, 0x100                                         [34;49m[32;49m
0x7ffff72fdf3b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf3f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 336.046 : Logic :> [33;40m>=[34;49m <: cprimitive :> [34;49m    if ( ( immSize > BYTE ) || ( imm [34;49m[33;40m>=[34;49m[34;49m 0x100 ) ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 336.46[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c8d348	< word : <literal>.[34;49m0x100[39;49m : value = 0x0000000000000100 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c88d98	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c8da68	< word : Logic.[34;49m>[39;49m : value = 0x00005555555b7e26 > : [34;49mInteger . Integer -> Boolean [39;49m
type match :: Logic.>= :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 336.46
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m>=[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 336.46
[34;49m .. 0 ;  if ( ( immSize > BYTE ) || ( imm [34;49m[33;40m>=[34;49m[34;49m 0x100 [34;49m[32;49m
0x7ffff72fdf2a    48b90001000000000000    mov rcx, 0x100                                         [34;49m[32;49m
0x7ffff72fdf34    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fdf37    0f9dc0                  setge al                                               [34;49m[32;49m
0x7ffff72fdf3a    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fdf3e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf42    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 336.047 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( ( immSize > BYTE ) || ( imm >= 0x100 [34;49m[33;40m)[34;49m[34;49m ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 336.047 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m    if ( ( immSize > BYTE ) [34;49m[33;40m||[34;49m[34;49m ( imm >= 0x100 ) ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m||[34;49m <:   24 bytes : at namespaces/compiler/x64.cft : 336.47
[34;49m .. ode = #x80 ;  if ( ( immSize > BYTE ) [34;49m[33;40m||[34;49m[34;49m ( imm >= 0x100 )[34;49m[32;49m
0x7ffff72fdf45    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fdf48    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fdf4c    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fdf50    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fdf53    4885c0                  test rax, rax                                          [34;49m[32;49m
0x7ffff72fdf56    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf5a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 336.049 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m    if ( ( immSize > BYTE ) || ( imm >= 0x100 ) [34;49m[33;40m)[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 336.49
[34;49m ..  immSize > BYTE ) || ( imm >= 0x100 ) [34;49m[33;40m)[34;49m[34;49m[34;49m[32;49m
0x7ffff72fdf5d    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 336.49 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fdf07[34;49m.
dbg[c]  :: [34;49m...[34;49m : 337.006 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 337.6
[34;49m .. mmSize > BYTE ) || ( imm >= 0x100 ) ) [34;49m[33;40m{[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdf5e    e900000000              jmp 0x7ffff72fdf63         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 338.015 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c88678 :> [34;49m        [34;49m[33;40mopCode[34;49m[34;49m |= 1 ; [34;49m 
_Do_C_Syntax_Variable : word = opCode :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 338.15
[34;49m .. ize > BYTE ) || ( imm >= 0x100 ) ) {  [34;49m[33;40mopCode[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdf63    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdf67    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf6b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 338.018 : Bits :> [33;40m|=[34;49m <: cprimitive :> [34;49m        opCode [34;49m[33;40m|=[34;49m[34;49m 1 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 338.020 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5c8a2f8 :> [34;49m        opCode |= [34;49m[33;40m1[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 338.20
[34;49m ..  ) || ( imm >= 0x100 ) ) {  opCode |= [34;49m[33;40m1[34;49m[34;49m [34;49m[32;49m
0x7ffff72fdf6e    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fdf78    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf7c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 338.022 : Bits :> [33;40m|=[34;49m <: cprimitive :> [34;49m        opCode [34;49m[33;40m|=[34;49m[34;49m 1 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|=[34;49m <:   24 bytes : at namespaces/compiler/x64.cft : 338.22
[34;49m .. YTE ) || ( imm >= 0x100 ) ) {  opCode [34;49m[33;40m|=[34;49m[34;49m 1 ; [34;49m[32;49m
0x7ffff72fdf63    48b90100000000000000    mov rcx, 0x1                                           [34;49m[32;49m
0x7ffff72fdf6d    498d5f08                lea rbx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdf71    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdf75    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fdf78    488903                  mov [rbx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 338.022 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m        opCode |= 1 [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 339.006 : Reserved :> [33;40m}[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m}[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 339.6
[34;49m .. | ( imm >= 0x100 ) ) {  opCode |= 1 ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdf7b    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 339.6 :> [39;49m}[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fdf63[34;49m.
dbg[c]  :: [34;49m...[34;49m : 341.006 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m{[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 341.6
[34;49m ..  >= 0x100 ) ) {  opCode |= 1 ; } else [34;49m[33;40m{[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdf7c    e900000000              jmp 0x7ffff72fdf81         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.011 : PrefixCombinators :> [33;40mif[34;49m <: cprimitive :> [34;49m        [34;49m[33;40mif[34;49m[34;49m ( ( immSize <= BYTE ) || ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 342.012 : Reserved :> [33;40m([34;49m <: cprimitive :> [34;49m        if [34;49m[33;40m([34;49m[34;49m ( immSize <= BYTE ) || ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m([34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 342.12
[34;49m .. 100 ) ) {  opCode |= 1 ; } else {  if [34;49m[33;40m([34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdf81    e900000000              jmp 0x7ffff72fdf86         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.023 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c88840 :> [34;49m        if ( ( [34;49m[33;40mimmSize[34;49m[34;49m <= BYTE ) || ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 342.23
[34;49m .. ) ) {  opCode |= 1 ; } else {  if ( ( [34;49m[33;40mimmSize[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdf86    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fdf8a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf8e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.026 : Logic :> [33;40m<=[34;49m <: cprimitive :> [34;49m        if ( ( immSize [34;49m[33;40m<=[34;49m[34;49m BYTE ) || ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 342.031 : X64 :> [33;40mBYTE[34;49m <: 0x00007ffff5c7de60 :> [34;49m        if ( ( immSize <= [34;49m[33;40mBYTE[34;49m[34;49m ) || ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mBYTE[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 342.31
[34;49m .. de |= 1 ; } else {  if ( ( immSize <= [34;49m[33;40mBYTE[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdf91    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fdf9b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdf9f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.031 : Logic :> [33;40m<=[34;49m <: cprimitive :> [34;49m        if ( ( immSize [34;49m[33;40m<=[34;49m[34;49m BYTE ) || ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 342.31[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c90b98	< word : X64.[34;49mBYTE[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c909d0	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Logic.<= :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 342.31
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<=[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 342.31
[34;49m .. pCode |= 1 ; } else {  if ( ( immSize [34;49m[33;40m<=[34;49m[34;49m BYTE  .. [34;49m[32;49m
0x7ffff72fdf8a    48b90100000000000000    mov rcx, 0x1                                           [34;49m[32;49m
0x7ffff72fdf94    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fdf97    0f9ec0                  setle al                                               [34;49m[32;49m
0x7ffff72fdf9a    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fdf9e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdfa2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.032 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE [34;49m[33;40m)[34;49m[34;49m || ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 342.036 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) [34;49m[33;40m||[34;49m[34;49m ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 342.037 : C :> [33;40m([34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || [34;49m[33;40m([34;49m[34;49m imm < 0x100 ) ) opCode |= 3 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 342.042 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5c88d98 :> [34;49m        if ( ( immSize <= BYTE ) || ( [34;49m[33;40mimm[34;49m[34;49m < 0x100 ) ) opCode |= 3 ; [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 342.42
[34;49m .. else {  if ( ( immSize <= BYTE ) || ( [34;49m[33;40mimm[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdfa5    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fdfa9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdfad    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.044 : Logic :> [33;40m<[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || ( imm [34;49m[33;40m<[34;49m[34;49m 0x100 ) ) opCode |= 3 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 342.050 : <literal> :> [33;40m0x100[34;49m <: 0x00007ffff738131c :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < [34;49m[33;40m0x100[34;49m[34;49m ) ) opCode |= 3 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x100[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 342.50
[34;49m ..   if ( ( immSize <= BYTE ) || ( imm < [34;49m[33;40m0x100[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdfb0    48b80001000000000000    mov rax, 0x100                                         [34;49m[32;49m
0x7ffff72fdfba    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdfbe    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.050 : Logic :> [33;40m<[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || ( imm [34;49m[33;40m<[34;49m[34;49m 0x100 ) ) opCode |= 3 ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 342.50[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff738131c	< word : <literal>.[34;49m0x100[39;49m : value = 0x0000000000000100 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c912b8	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c90d60	< word : Logic.[34;49m<=[39;49m : value = 0x00005555555b7da4 > : [34;49mInteger . Integer -> Boolean [39;49m
type match :: Logic.< :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 342.50
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m<[34;49m <:   27 bytes : at namespaces/compiler/x64.cft : 342.50
[34;49m ..  {  if ( ( immSize <= BYTE ) || ( imm [34;49m[33;40m<[34;49m[34;49m 0x100  .. [34;49m[32;49m
0x7ffff72fdfa9    48b90001000000000000    mov rcx, 0x100                                         [34;49m[32;49m
0x7ffff72fdfb3    483bc1                  cmp rax, rcx                                           [34;49m[32;49m
0x7ffff72fdfb6    0f9cc0                  setl al                                                [34;49m[32;49m
0x7ffff72fdfb9    480fb6c0                movzx rax, al                                          [34;49m[32;49m
0x7ffff72fdfbd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdfc1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.051 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < 0x100 [34;49m[33;40m)[34;49m[34;49m ) opCode |= 3 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 342.051 : Logic :> [33;40m||[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) [34;49m[33;40m||[34;49m[34;49m ( imm < 0x100 ) ) opCode |= 3 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m||[34;49m <:   24 bytes : at namespaces/compiler/x64.cft : 342.51
[34;49m ..  ; } else {  if ( ( immSize <= BYTE ) [34;49m[33;40m||[34;49m[34;49m ( imm < 0x100 ) .. [34;49m[32;49m
0x7ffff72fdfc4    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fdfc7    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fdfcb    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fdfcf    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fdfd2    4885c0                  test rax, rax                                          [34;49m[32;49m
0x7ffff72fdfd5    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdfd9    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.053 : Reserved :> [33;40m)[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < 0x100 ) [34;49m[33;40m)[34;49m[34;49m opCode |= 3 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m)[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 342.53
[34;49m ..  immSize <= BYTE ) || ( imm < 0x100 ) [34;49m[33;40m)[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdfdc    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 342.53 :> [39;49m)[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fdf86[34;49m.
dbg[c]  :: [34;49m...[34;49m : 342.061 : Reserved :> [33;40m{[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < 0x100 ) ) [34;49m[33;40m{[34;49m[34;49mpCode |= 3 ; ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m{[34;49m <:    5 bytes : at namespaces/compiler/x64.cft : 342.61
[34;49m .. immSize <= BYTE ) || ( imm < 0x100 ) )[34;49m[33;40m{[34;49m[34;49mopCode  .. [34;49m[32;49m
0x7ffff72fdfdd    e900000000              jmp 0x7ffff72fdfe2         	< C compiler code >        [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.061 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c88678 :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < 0x100 ) ) [34;49m[33;40mopCode[34;49m[34;49m |= 3 ; [34;49m 
_Do_C_Syntax_Variable : word = opCode :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 342.61
[34;49m .. mmSize <= BYTE ) || ( imm < 0x100 ) ) [34;49m[33;40mopCode[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdfe2    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdfe6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdfea    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.064 : Bits :> [33;40m|=[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < 0x100 ) ) opCode [34;49m[33;40m|=[34;49m[34;49m 3 ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 342.066 : <literal> :> [33;40m3[34;49m <: 0x00007ffff7381517 :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < 0x100 ) ) opCode |= [34;49m[33;40m3[34;49m[34;49m ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m3[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 342.66
[34;49m .. BYTE ) || ( imm < 0x100 ) ) opCode |= [34;49m[33;40m3[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdfed    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fdff7    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdffb    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.068 : Bits :> [33;40m|=[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < 0x100 ) ) opCode [34;49m[33;40m|=[34;49m[34;49m 3 ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|=[34;49m <:   24 bytes : at namespaces/compiler/x64.cft : 342.68
[34;49m .. <= BYTE ) || ( imm < 0x100 ) ) opCode [34;49m[33;40m|=[34;49m[34;49m 3 ;  .. [34;49m[32;49m
0x7ffff72fdfe2    48b90300000000000000    mov rcx, 0x3                                           [34;49m[32;49m
0x7ffff72fdfec    498d5f08                lea rbx, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdff0    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdff4    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fdff7    488903                  mov [rbx], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 342.068 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m        if ( ( immSize <= BYTE ) || ( imm < 0x100 ) ) opCode |= 3 [34;49m[33;40m;[34;49m[34;49m [34;49m 
DataStack at : [39;49mnamespaces/compiler/x64.cft : 343.6[34;49m :
DataStack depth =   7 : Dsp (R14) = Top = 0x00007ffff7269230, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269230 > = 0x00007ffff72fdf63	
  DataStack   [  -1 ] < 0x00007ffff7269228 > = 0x00007ffff72fdf07	
  DataStack   [  -2 ] < 0x00007ffff7269220 > = 0x00007ffff5c89bd8	< word : void.[39;49m_Compile_Group1_Immediate[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -3 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -5 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -6 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 343.006 : Reserved :> [33;40m}[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m}[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 343.6
[34;49m .. ) || ( imm < 0x100 ) ) opCode |= 3 ;  [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fdfee    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 343.6 :> [39;49m}[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72fdf81[34;49m.
DataStack at : [39;49mnamespaces/compiler/x64.cft : 343.6[34;49m :
DataStack depth =   5 : Dsp (R14) = Top = 0x00007ffff7269220, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269220 > = 0x00007ffff5c89bd8	< word : void.[39;49m_Compile_Group1_Immediate[34;49m : value = 0x0000000000000000 > : [39;49m[34;49m
  DataStack   [  -1 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -4 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[c]  :: [34;49m...[34;49m : 344.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49mCompile_CalcWrite_Instruction_X64 (  rex,  opCode,  _mod,  _reg,  rm, controlFlags, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 345.038 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c85298 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m (  0,  opCode,  _mod[34;49m 
dbg[c]  :: [34;49m...[34;49m : 345.042 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7381712 :> [34;49m    Compile_CalcWrite_Instruction_X64 (  [34;49m[33;40m0[34;49m[34;49m,  opCode,  _mod,  code, rm, (REX_B | MODRM[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 345.42
[34;49m .. } Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdfe1    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fdfeb    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdfef    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.051 : locals_0 :> [33;40mopCode[34;49m <: 0x00007ffff5c88678 :> [34;49mile_CalcWrite_Instruction_X64 (  0,  [34;49m[33;40mopCode[34;49m[34;49m,  _mod,  code, rm, (REX_B | MODRM_B |[34;49m 
_Do_C_Syntax_Variable : word = opCode :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mopCode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 345.51
[34;49m .. ompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40mopCode[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdff2    498b4708                mov rax, [r15+0x8]                                     [34;49m[32;49m
0x7ffff72fdff6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fdffa    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.058 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c89680 :> [34;49mcWrite_Instruction_X64 (  0,  opCode,  [34;49m[33;40m_mod[34;49m[34;49m,  code, rm, (REX_B | MODRM_B | DISP_B |[34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 345.58
[34;49m .. alcWrite_Instruction_X64 ( 0, opCode, [34;49m[33;40m_mod[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fdffd    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fe001    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe005    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.065 : locals_0 :> [33;40mcode[34;49m <: 0x00007ffff5c89848 :> [34;49mInstruction_X64 (  0,  opCode,  _mod,  [34;49m[33;40mcode[34;49m[34;49m, rm, (REX_B | MODRM_B | DISP_B | IMM_B)[34;49m 
_Do_C_Syntax_Variable : word = code :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 345.65
[34;49m .. te_Instruction_X64 ( 0, opCode, _mod, [34;49m[33;40mcode[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe008    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fe00c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe010    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.069 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c89128 :> [34;49mruction_X64 (  0,  opCode,  _mod,  code, [34;49m[33;40mrm[34;49m[34;49m, (REX_B | MODRM_B | DISP_B | IMM_B),  0, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 345.071 : C_Syntax :> [33;40m,[34;49m <: cprimitive :> [34;49mnstruction_X64 (  0,  opCode,  _mod,  code, rm[34;49m[33;40m,[34;49m[34;49m (REX_B | MODRM_B | DISP_B | IMM_B),  0,  disp,[34;49m 
dbg[c]  :: [34;49m...[34;49m : 345.071 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c89128 :> [34;49mruction_X64 (  0,  opCode,  _mod,  code, [34;49m[33;40mrm[34;49m[34;49m, (REX_B | MODRM_B | DISP_B | IMM_B),  0, [34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 345.71
[34;49m .. truction_X64 ( 0, opCode, _mod, code, [34;49m[33;40mrm[34;49m[34;49m,  .. [34;49m[32;49m
0x7ffff72fe013    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fe017    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe01b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.072 : C :> [33;40m([34;49m <: cprimitive :> [34;49m_Instruction_X64 (  0,  opCode,  _mod,  code, rm, [34;49m[33;40m([34;49m[34;49mREX_B | MODRM_B | DISP_B | IMM_B),  0,  disp,  0, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 345.078 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7e748 :> [34;49mon_X64 (  0,  opCode,  _mod,  code, rm, ([34;49m[33;40mREX_B[34;49m[34;49m | MODRM_B | DISP_B | IMM_B),  0,  disp, [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 345.78[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c89128	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c89848	< word : locals_0.[34;49mcode[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c89680	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c92650	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff7381712	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: X64.REX_B :: type expected :  :: type recorded : Undefined  : namespaces/compiler/x64.cft : 345.78
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 345.78[32;49m
0x7ffff72fe01e    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe028    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe02c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.080 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49mion_X64 (  0,  opCode,  _mod,  code, rm, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | DISP_B | IMM_B),  0,  disp,  0,  imm, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 345.088 : X64 :> [33;40mMODRM_B[34;49m <: 0x00007ffff5c7ead8 :> [34;49m0,  opCode,  _mod,  code, rm, (REX_B | [34;49m[33;40mMODRM_B[34;49m[34;49m | DISP_B | IMM_B),  0,  disp,  0,  imm[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMODRM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 345.88[32;49m
0x7ffff72fe02f    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe039    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe03d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.088 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49mion_X64 (  0,  opCode,  _mod,  code, rm, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | DISP_B | IMM_B),  0,  disp,  0,  imm, [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 345.88[39;49m :
TypeWordStack depth =   4 :  = Top = 0x00007ffff7fc1a40, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c89848	< word : locals_0.[34;49mcode[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c89680	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c92650	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a28 > = 0x00007ffff7381712	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Undefined . Undefined  : namespaces/compiler/x64.cft : 345.88
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 345.88
[34;49m .. 4 ( 0, opCode, _mod, code, rm, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B  .. [34;49m[32;49m
0x7ffff72fe02f    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe039    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe03d    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe040    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe043    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe047    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe04b    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe04e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe052    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.097 : X64 :> [33;40mDISP_B[34;49m <: 0x00007ffff5c7f1f8 :> [34;49me,  _mod,  code, rm, (REX_B | MODRM_B | [34;49m[33;40mDISP_B[34;49m[34;49m | IMM_B),  0,  disp,  0,  imm,  immSize[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDISP_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 345.97[32;49m
0x7ffff72fe055    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe05f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe063    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.097 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m 0,  opCode,  _mod,  code, rm, (REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m DISP_B | IMM_B),  0,  disp,  0,  imm,  immSize )[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 345.97[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c929e0	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c92650	< word : locals_0.[34;49mopCode[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff7381712	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 345.97
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 345.97
[34;49m .. ode, _mod, code, rm, (REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m DISP_B  .. [34;49m[32;49m
0x7ffff72fe055    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe05f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe063    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe066    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe069    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe06d    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe071    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe074    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe078    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.104 : X64 :> [33;40mIMM_B[34;49m <: 0x00007ffff5c7f588 :> [34;49m_mod,  code, rm, (REX_B | MODRM_B | DISP_B | [34;49m[33;40mIMM_B[34;49m[34;49m),  0,  disp,  0,  imm,  immSize ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mIMM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 345.104[32;49m
0x7ffff72fe07b    48b81000000000000000    mov rax, 0x10                                          [34;49m[32;49m
0x7ffff72fe085    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe089    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.104 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m  opCode,  _mod,  code, rm, (REX_B | MODRM_B | DISP_B [34;49m[33;40m|[34;49m[34;49m IMM_B),  0,  disp,  0,  imm,  immSize ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 345.104[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c92d70	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff7381712	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 345.104
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 345.104
[34;49m .. , code, rm, (REX_B | MODRM_B | DISP_B [34;49m[33;40m|[34;49m[34;49m IMM_B .. [34;49m[32;49m
0x7ffff72fe07b    48b81000000000000000    mov rax, 0x10                                          [34;49m[32;49m
0x7ffff72fe085    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe089    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe08c    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe08f    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe093    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe097    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe09a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe09e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.105 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49mCode,  _mod,  code, rm, (REX_B | MODRM_B | DISP_B | IMM_B[34;49m[33;40m)[34;49m[34;49m,  0,  disp,  0,  imm,  immSize ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 345.109 : <literal> :> [33;40m0[34;49m <: 0x00007ffff738190d :> [34;49mod,  code, rm, (REX_B | MODRM_B | DISP_B | IMM_B),  [34;49m[33;40m0[34;49m[34;49m,  disp,  0,  imm,  immSize ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 345.109
[34;49m .. , (REX_B | MODRM_B | DISP_B | IMM_B), [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe0a1    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe0ab    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe0af    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.116 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c88f60 :> [34;49m,  code, rm, (REX_B | MODRM_B | DISP_B | IMM_B),  0,  [34;49m[33;40mdisp[34;49m[34;49m,  0,  imm,  immSize ) ; [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 345.116
[34;49m .. REX_B | MODRM_B | DISP_B | IMM_B), 0, [34;49m[33;40mdisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe0b2    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe0b6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe0ba    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.120 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7381b08 :> [34;49mod,  code, rm, (REX_B | MODRM_B | DISP_B | IMM_B),  0,  disp,  [34;49m[33;40m0[34;49m[34;49m,  imm,  immSize ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 345.120
[34;49m .. | MODRM_B | DISP_B | IMM_B), 0, disp, [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe0bd    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe0c7    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe0cb    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.126 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5c88d98 :> [34;49md,  code, rm, (REX_B | MODRM_B | DISP_B | IMM_B),  0,  disp,  0,  [34;49m[33;40mimm[34;49m[34;49m,  immSize ) ; [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 345.126
[34;49m .. ODRM_B | DISP_B | IMM_B), 0, disp, 0, [34;49m[33;40mimm[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe0ce    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe0d2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe0d6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.137 : locals_0 :> [33;40mimmSize[34;49m <: 0x00007ffff5c88840 :> [34;49mcode, rm, (REX_B | MODRM_B | DISP_B | IMM_B),  0,  disp,  0,  imm,  [34;49m[33;40mimmSize[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = immSize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimmSize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 345.137
[34;49m .. B | DISP_B | IMM_B), 0, disp, 0, imm, [34;49m[33;40mimmSize[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fe0d9    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe0dd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe0e1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 345.138 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c85298 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m (  0,  opCode,  _mod[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 345.138[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c93658	< word : locals_0.[34;49mimmSize[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c93490	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff7381b08	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c88f60	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff738190d	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c93100	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
type match :: void.Compile_CalcWrite_Instruction_X64 :: type expected :  :: type recorded : Integer . Integer . Undefined . Integer . Integer . Integer  : namespaces/compiler/x64.cft : 345.138
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 345.138
[34;49m .. || ( imm < 0x100 ) ) opCode |= 3 ;  } [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, opCode, _mod, code, rm, (REX_B | MODRM_B | DISP_B | IMM_B), 0, di .. [34;49m[32;49m
0x7ffff72fe0e4    49b983db2ff7ff7f0000    mov r9, 0x7ffff72fdb83                                 [34;49m[32;49m
0x7ffff72fe0ee    49ffd1                  call r9                    	< void.[39;49mCompile_CalcWrite_Instruction_X64[34;49m : 0x00007ffff72fdb83 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 345.141 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49mCode,  _mod,  code, rm, (REX_B | MODRM_B | DISP_B | IMM_B),  0,  disp,  0,  imm,  immSize ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 346.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 346.2
[34;49m ..  IMM_B), 0, disp, 0, imm, immSize ) ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fe0f1    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe0f5    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe0f9    4983ee30                sub r14, 0x30                                          [34;49m[32;49m
0x7ffff72fe0fd    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 346.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 346.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 348.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 350.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_Group5 ( code, mod, rm, sib, disp, size ) {  .. [34;49m[32;49m
0x7ffff72fe0fe    e900000000              jmp 0x7ffff72fe103         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe103    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe107    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe10b    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 350.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c93820[34;49m.
dbg[c]  :: [34;49m...[34;49m : 351.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49mCompile_CalcWrite_Instruction_X64 ( 0, 0xff, mod, code, rm, REX_B | MODRM_B | DISP_B[34;49m 
dbg[c]  :: [34;49m...[34;49m : 352.038 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c85298 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xff, mod, code[34;49m 
dbg[c]  :: [34;49m...[34;49m : 352.041 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c92488 :> [34;49m    Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m, 0xff, mod, code, rm, (REX_B | MODRM_B | DI[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 352.41
[34;49m .. { Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe112    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe11c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe120    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.047 : <literal> :> [33;40m0xff[34;49m <: 0x00007ffff5c922c0 :> [34;49mCompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40m0xff[34;49m[34;49m, mod, code, rm, (REX_B | MODRM_B | DIS[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0xff[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 352.47
[34;49m .. ompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40m0xff[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe123    48b8ff00000000000000    mov rax, 0xff                                          [34;49m[32;49m
0x7ffff72fe12d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe131    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.052 : locals_0 :> [33;40mmod[34;49m <: 0x00007ffff5c932c8 :> [34;49mle_CalcWrite_Instruction_X64 ( 0, 0xff, [34;49m[33;40mmod[34;49m[34;49m, code, rm, (REX_B | MODRM_B | DISP_B), s[34;49m 
_Do_C_Syntax_Variable : word = mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mmod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 352.52
[34;49m .. _CalcWrite_Instruction_X64 ( 0, 0xff, [34;49m[33;40mmod[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe134    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fe138    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe13c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.058 : locals_0 :> [33;40mcode[34;49m <: 0x00007ffff5c93490 :> [34;49mcWrite_Instruction_X64 ( 0, 0xff, mod, [34;49m[33;40mcode[34;49m[34;49m, rm, (REX_B | MODRM_B | DISP_B), sib, d[34;49m 
_Do_C_Syntax_Variable : word = code :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcode[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 352.58
[34;49m .. Write_Instruction_X64 ( 0, 0xff, mod, [34;49m[33;40mcode[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe13f    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fe143    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe147    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.062 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c92f38 :> [34;49mte_Instruction_X64 ( 0, 0xff, mod, code, [34;49m[33;40mrm[34;49m[34;49m, (REX_B | MODRM_B | DISP_B), sib, disp, s[34;49m 
dbg[c]  :: [34;49m...[34;49m : 352.064 : C_Syntax :> [33;40m,[34;49m <: cprimitive :> [34;49mWrite_Instruction_X64 ( 0, 0xff, mod, code, rm[34;49m[33;40m,[34;49m[34;49m (REX_B | MODRM_B | DISP_B), sib, disp, size, 0[34;49m 
dbg[c]  :: [34;49m...[34;49m : 352.064 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c92f38 :> [34;49mte_Instruction_X64 ( 0, 0xff, mod, code, [34;49m[33;40mrm[34;49m[34;49m, (REX_B | MODRM_B | DISP_B), sib, disp, s[34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 352.64
[34;49m .. Instruction_X64 ( 0, 0xff, mod, code, [34;49m[33;40mrm[34;49m[34;49m, [34;49m[32;49m
0x7ffff72fe14a    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fe14e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe152    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.065 : C :> [33;40m([34;49m <: cprimitive :> [34;49mlcWrite_Instruction_X64 ( 0, 0xff, mod, code, rm, [34;49m[33;40m([34;49m[34;49mREX_B | MODRM_B | DISP_B), sib, disp, size, 0, 0 )[34;49m 
dbg[c]  :: [34;49m...[34;49m : 352.071 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7e748 :> [34;49mstruction_X64 ( 0, 0xff, mod, code, rm, ([34;49m[33;40mREX_B[34;49m[34;49m | MODRM_B | DISP_B), sib, disp, size, 0,[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 352.71[39;49m :
TypeWordStack depth =   5 :  = Top = 0x00007ffff7fc1a48, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c92f38	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c93490	< word : locals_0.[34;49mcode[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c932c8	< word : locals_0.[34;49mmod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c922c0	< word : <literal>.[34;49m0xff[39;49m : value = 0x00000000000000ff > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c92488	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: X64.REX_B :: type expected :  :: type recorded : Undefined  : namespaces/compiler/x64.cft : 352.71
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 352.71[32;49m
0x7ffff72fe155    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe15f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe163    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.073 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49me_Instruction_X64 ( 0, 0xff, mod, code, rm, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | DISP_B), sib, disp, size, 0, 0 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 352.081 : X64 :> [33;40mMODRM_B[34;49m <: 0x00007ffff5c7ead8 :> [34;49m_X64 ( 0, 0xff, mod, code, rm, (REX_B | [34;49m[33;40mMODRM_B[34;49m[34;49m | DISP_B), sib, disp, size, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMODRM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 352.81[32;49m
0x7ffff72fe166    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe170    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe174    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.081 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49me_Instruction_X64 ( 0, 0xff, mod, code, rm, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | DISP_B), sib, disp, size, 0, 0 ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 352.81[39;49m :
TypeWordStack depth =   4 :  = Top = 0x00007ffff7fc1a40, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c93490	< word : locals_0.[34;49mcode[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c932c8	< word : locals_0.[34;49mmod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c922c0	< word : <literal>.[34;49m0xff[39;49m : value = 0x00000000000000ff > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c92488	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Undefined . Undefined  : namespaces/compiler/x64.cft : 352.81
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 352.81
[34;49m .. _X64 ( 0, 0xff, mod, code, rm, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B [34;49m[32;49m
0x7ffff72fe166    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe170    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe174    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe177    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe17a    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe17e    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe182    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe185    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe189    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.089 : X64 :> [33;40mDISP_B[34;49m <: 0x00007ffff5c7f1f8 :> [34;49mn_X64 ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B | [34;49m[33;40mDISP_B[34;49m[34;49m), sib, disp, size, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDISP_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 352.89[32;49m
0x7ffff72fe18c    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe196    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe19a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.089 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49me_Instruction_X64 ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m DISP_B), sib, disp, size, 0, 0 ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 352.89[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c920f8	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c922c0	< word : <literal>.[34;49m0xff[39;49m : value = 0x00000000000000ff > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c92488	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 352.89
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 352.89
[34;49m .. 0xff, mod, code, rm, (REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m DISP_B[34;49m[32;49m
0x7ffff72fe18c    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe196    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe19a    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe19d    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe1a0    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe1a4    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe1a8    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe1ab    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe1af    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.090 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49mstruction_X64 ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B | DISP_B[34;49m[33;40m)[34;49m[34;49m, sib, disp, size, 0, 0 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 352.095 : locals_0 :> [33;40msib[34;49m <: 0x00007ffff5c92ba8 :> [34;49mX64 ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B | DISP_B), [34;49m[33;40msib[34;49m[34;49m, disp, size, 0, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = sib :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msib[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 352.95
[34;49m .. code, rm, (REX_B | MODRM_B | DISP_B), [34;49m[33;40msib[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe1b2    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe1b6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe1ba    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.101 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c92818 :> [34;49m64 ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B | DISP_B), sib, [34;49m[33;40mdisp[34;49m[34;49m, size, 0, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 352.101
[34;49m ..  rm, (REX_B | MODRM_B | DISP_B), sib, [34;49m[33;40mdisp[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe1bd    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe1c1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe1c5    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.107 : locals_0 :> [33;40msize[34;49m <: 0x00007ffff5c92650 :> [34;49m64 ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B | DISP_B), sib, disp, [34;49m[33;40msize[34;49m[34;49m, 0, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = size :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 352.107
[34;49m .. REX_B | MODRM_B | DISP_B), sib, disp, [34;49m[33;40msize[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe1c8    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe1cc    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe1d0    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.110 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c91ba0 :> [34;49m_X64 ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B | DISP_B), sib, disp, size, [34;49m[33;40m0[34;49m[34;49m, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 352.110
[34;49m .. | MODRM_B | DISP_B), sib, disp, size, [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe1d3    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe1dd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe1e1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 352.115 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c85298 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xff, mod, code[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 352.115[39;49m :
TypeWordStack depth =   7 :  = Top = 0x00007ffff7fc1a58, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a58 > = 0x00007ffff5c919d8	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c91ba0	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c92650	< word : locals_0.[34;49msize[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c92818	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c92ba8	< word : locals_0.[34;49msib[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c91d68	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -6 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c92488	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: void.Compile_CalcWrite_Instruction_X64 :: type expected :  :: type recorded : Integer . Integer . Undefined . Undefined . Undefined . Integer . Integer  : namespaces/compiler/x64.cft : 352.115
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 352.115
[34;49m ..  ( code, mod, rm, sib, disp, size ) { [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B | DISP_B), sib, disp, size, .. [34;49m[32;49m
0x7ffff72fe1f5    49b983db2ff7ff7f0000    mov r9, 0x7ffff72fdb83                                 [34;49m[32;49m
0x7ffff72fe1ff    49ffd1                  call r9                    	< void.[39;49mCompile_CalcWrite_Instruction_X64[34;49m : 0x00007ffff72fdb83 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 352.118 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49mstruction_X64 ( 0, 0xff, mod, code, rm, (REX_B | MODRM_B | DISP_B), sib, disp, size, 0, 0 ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 353.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 353.2
[34;49m ..  | DISP_B), sib, disp, size, 0, 0 ) ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fe202    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe206    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe20a    4983ee30                sub r14, 0x30                                          [34;49m[32;49m
0x7ffff72fe20e    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 353.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 353.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 355.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 357.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_CallThruReg ( _reg ) {  .. [34;49m[32;49m
0x7ffff72fe20f    e900000000              jmp 0x7ffff72fe214         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe214    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe218    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe21c    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 357.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c91810[34;49m.
dbg[c]  :: [34;49m...[34;49m : 358.020 : void :> [33;40m_Compile_Group5[34;49m <: 0x00007ffff5c93820 :> [34;49m    [34;49m[33;40m_Compile_Group5[34;49m[34;49m ( CALL, REG, _reg, 0, 0, 0 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 358.026 : X64 :> [33;40mCALL[34;49m <: 0x00007ffff5c7dc98 :> [34;49m    _Compile_Group5 ( [34;49m[33;40mCALL[34;49m[34;49m, REG, _reg, 0, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCALL[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 358.26
[34;49m .. lThruReg ( _reg ) { _Compile_Group5 ( [34;49m[33;40mCALL[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe223    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe22d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe231    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 358.031 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b3f20 :> [34;49m    _Compile_Group5 ( CALL, [34;49m[33;40mREG[34;49m[34;49m, _reg, 0, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 358.31
[34;49m .. eg ( _reg ) { _Compile_Group5 ( CALL, [34;49m[33;40mREG[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe234    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fe23e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe242    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 358.037 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c912b8 :> [34;49m    _Compile_Group5 ( CALL, REG, [34;49m[33;40m_reg[34;49m[34;49m, 0, 0, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 358.37
[34;49m .. _reg ) { _Compile_Group5 ( CALL, REG, [34;49m[33;40m_reg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe245    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe249    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe24d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 358.040 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c910f0 :> [34;49m    _Compile_Group5 ( CALL, REG, _reg, [34;49m[33;40m0[34;49m[34;49m, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 358.40
[34;49m ..  { _Compile_Group5 ( CALL, REG, _reg, [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe250    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe25a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe25e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 358.048 : void :> [33;40m_Compile_Group5[34;49m <: 0x00007ffff5c93820 :> [34;49m    [34;49m[33;40m_Compile_Group5[34;49m[34;49m ( CALL, REG, _reg, 0, 0, 0 ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 358.48[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c90b98	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c90f28	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c910f0	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c912b8	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b3f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7dc98	< word : X64.[34;49mCALL[39;49m : value = 0x0000000000000002 > : [34;49mInteger [39;49m
type match :: void._Compile_Group5 :: type expected : Integer . Integer  :: type recorded : Integer . Integer . Undefined . Integer . Integer . Integer  : namespaces/compiler/x64.cft : 358.48
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Group5[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 358.48
[34;49m ..  void _Compile_CallThruReg ( _reg ) { [34;49m[33;40m_Compile_Group5[34;49m[34;49m ( CALL, REG, _reg, 0, 0, 0 ) .. [34;49m[32;49m
0x7ffff72fe283    49b903e12ff7ff7f0000    mov r9, 0x7ffff72fe103                                 [34;49m[32;49m
0x7ffff72fe28d    49ffd1                  call r9                    	< void.[39;49m_Compile_Group5[34;49m : 0x00007ffff72fe103 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 358.051 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    _Compile_Group5 ( CALL, REG, _reg, 0, 0, 0 ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 359.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 359.2
[34;49m .. Group5 ( CALL, REG, _reg, 0, 0, 0 ) ; [34;49m[33;40m}[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe290    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe294    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe298    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe29c    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 359.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 359.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 361.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m                          _Compile_Group1_Immediate ( code toRegOrMem _mod rm disp imm i[34;49m 
dbg[i]  :: [34;49m...[34;49m : 362.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m _Compile_SUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, REG, DSP, 0, imm, 1 [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 362.33
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_SUBI_DSP ( imm ) {  .. [34;49m[32;49m
0x7ffff72fe29d    e900000000              jmp 0x7ffff72fe2a2         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe2a2    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe2a6    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe2aa    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 362.33 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c909d0[34;49m.
dbg[c]  :: [34;49m...[34;49m : 362.059 : void :> [33;40m_Compile_Group1_Immediate[34;49m <: 0x00007ffff5c89bd8 :> [34;49m_SUBI_DSP ( imm ) { [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( SUB, REG, DSP, 0, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 362.064 : X64 :> [33;40mSUB[34;49m <: 0x00007ffff5c7d908 :> [34;49mile_SUBI_DSP ( imm ) { _Compile_Group1_Immediate ( [34;49m[33;40mSUB[34;49m[34;49m, REG, DSP, 0, imm, 1 ) ; } prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mSUB[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 362.64
[34;49m .. ( imm ) { _Compile_Group1_Immediate ( [34;49m[33;40mSUB[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe2b1    48b80500000000000000    mov rax, 0x5                                           [34;49m[32;49m
0x7ffff72fe2bb    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe2bf    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 362.069 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b3f20 :> [34;49mile_SUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, [34;49m[33;40mREG[34;49m[34;49m, DSP, 0, imm, 1 ) ; } prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 362.69
[34;49m ..  ) { _Compile_Group1_Immediate ( SUB, [34;49m[33;40mREG[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe2c2    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fe2cc    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe2d0    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 362.074 : X64 :> [33;40mDSP[34;49m <: 0x00007ffff5c7c1e0 :> [34;49mile_SUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, REG, [34;49m[33;40mDSP[34;49m[34;49m, 0, imm, 1 ) ; } prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDSP[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 362.74
[34;49m .. _Compile_Group1_Immediate ( SUB, REG, [34;49m[33;40mDSP[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe2d3    48b80e00000000000000    mov rax, 0xe                                           [34;49m[32;49m
0x7ffff72fe2dd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe2e1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 362.077 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c90478 :> [34;49mSUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, REG, DSP, [34;49m[33;40m0[34;49m[34;49m, imm, 1 ) ; } prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 362.77
[34;49m .. ile_Group1_Immediate ( SUB, REG, DSP, [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe2e4    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe2ee    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe2f2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 362.082 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5c90640 :> [34;49mUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, REG, DSP, 0, [34;49m[33;40mimm[34;49m[34;49m, 1 ) ; } prefix [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 362.82
[34;49m .. _Group1_Immediate ( SUB, REG, DSP, 0, [34;49m[33;40mimm[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe2f5    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe2f9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe2fd    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 362.086 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5c902b0 :> [34;49mSUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, REG, DSP, 0, imm, [34;49m[33;40m1[34;49m[34;49m ) ; } prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 362.86
[34;49m .. p1_Immediate ( SUB, REG, DSP, 0, imm, [34;49m[33;40m1[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe300    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe30a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe30e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 362.087 : void :> [33;40m_Compile_Group1_Immediate[34;49m <: 0x00007ffff5c89bd8 :> [34;49m_SUBI_DSP ( imm ) { [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( SUB, REG, DSP, 0, [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 362.87[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c902b0	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c90640	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c90478	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c7c1e0	< word : X64.[34;49mDSP[39;49m : value = 0x000000000000000e > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b3f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7d908	< word : X64.[34;49mSUB[39;49m : value = 0x0000000000000005 > : [34;49mInteger [39;49m
type match :: void._Compile_Group1_Immediate :: type expected : Integer . Integer  :: type recorded : Integer . Integer . Integer . Undefined . Integer  : namespaces/compiler/x64.cft : 362.87
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Group1_Immediate[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 362.87
[34;49m ..      void _Compile_SUBI_DSP ( imm ) { [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( SUB, REG, DSP, 0, imm, 1 ) .. [34;49m[32;49m
0x7ffff72fe311    49b9e2de2ff7ff7f0000    mov r9, 0x7ffff72fdee2                                 [34;49m[32;49m
0x7ffff72fe31b    49ffd1                  call r9                    	< void.[39;49m_Compile_Group1_Immediate[34;49m : 0x00007ffff72fdee2 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 362.090 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m_Compile_SUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, REG, DSP, 0, imm, 1 ) [34;49m[33;40m;[34;49m[34;49m } prefix [34;49m 
dbg[c]  :: [34;49m...[34;49m : 362.092 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m_Compile_SUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, REG, DSP, 0, imm, 1 ) ; [34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 362.92
[34;49m .. ediate ( SUB, REG, DSP, 0, imm, 1 ) ; [34;49m[33;40m}[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe31e    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe322    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe326    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe32a    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 362.92 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 362.099 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49mile_SUBI_DSP ( imm ) { _Compile_Group1_Immediate ( SUB, REG, DSP, 0, imm, 1 ) ; } [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 364.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 366.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_Test ( _mod, _reg, rm, controlFlags, disp, imm ) {  .. [34;49m[32;49m
0x7ffff72fe32b    e900000000              jmp 0x7ffff72fe330         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe330    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe334    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe338    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 366.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c900e8[34;49m.
dbg[c]  :: [34;49m...[34;49m : 367.038 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c85298 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xf7, _mod, _re[34;49m 
dbg[c]  :: [34;49m...[34;49m : 367.041 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5c91f30 :> [34;49m    Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m, 0xf7, _mod, _reg, rm, REX_B | MODRM_B | co[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 367.41
[34;49m .. { Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe33f    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe349    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe34d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.047 : <literal> :> [33;40m0xf7[34;49m <: 0x00007ffff7382297 :> [34;49mCompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40m0xf7[34;49m[34;49m, _mod, _reg, rm, REX_B | MODRM_B | con[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0xf7[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 367.47
[34;49m .. ompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40m0xf7[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe350    48b8f700000000000000    mov rax, 0xf7                                          [34;49m[32;49m
0x7ffff72fe35a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe35e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.053 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5c8c178 :> [34;49me_CalcWrite_Instruction_X64 ( 0, 0xf7, [34;49m[33;40m_mod[34;49m[34;49m, _reg, rm, REX_B | MODRM_B | controlFla[34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 367.53
[34;49m .. _CalcWrite_Instruction_X64 ( 0, 0xf7, [34;49m[33;40m_mod[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe361    498b47d0                mov rax, [r15-0x30]                                    [34;49m[32;49m
0x7ffff72fe365    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe369    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.059 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c8c898 :> [34;49mWrite_Instruction_X64 ( 0, 0xf7, _mod, [34;49m[33;40m_reg[34;49m[34;49m, rm, REX_B | MODRM_B | controlFlags, 0,[34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 367.59
[34;49m .. rite_Instruction_X64 ( 0, 0xf7, _mod, [34;49m[33;40m_reg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe36c    498b47d8                mov rax, [r15-0x28]                                    [34;49m[32;49m
0x7ffff72fe370    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe374    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.063 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5c8ca60 :> [34;49me_Instruction_X64 ( 0, 0xf7, _mod, _reg, [34;49m[33;40mrm[34;49m[34;49m, REX_B | MODRM_B | controlFlags, 0, disp,[34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 367.63
[34;49m .. nstruction_X64 ( 0, 0xf7, _mod, _reg, [34;49m[33;40mrm[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe377    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fe37b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe37f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.071 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7e748 :> [34;49mstruction_X64 ( 0, 0xf7, _mod, _reg, rm, [34;49m[33;40mREX_B[34;49m[34;49m | MODRM_B | controlFlags, 0, disp, 0, im[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 367.71[32;49m
0x7ffff72fe382    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe38c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe390    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.073 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49mnstruction_X64 ( 0, 0xf7, _mod, _reg, rm, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | controlFlags, 0, disp, 0, imm, 0 ) ; /[34;49m 
dbg[c]  :: [34;49m...[34;49m : 367.081 : X64 :> [33;40mMODRM_B[34;49m <: 0x00007ffff5c7ead8 :> [34;49mX64 ( 0, 0xf7, _mod, _reg, rm, REX_B | [34;49m[33;40mMODRM_B[34;49m[34;49m | controlFlags, 0, disp, 0, imm, 0 ) ;[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMODRM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 367.81[32;49m
0x7ffff72fe393    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe39d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3a1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.081 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49mnstruction_X64 ( 0, 0xf7, _mod, _reg, rm, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | controlFlags, 0, disp, 0, imm, 0 ) ; /[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 367.81
[34;49m .. _X64 ( 0, 0xf7, _mod, _reg, rm, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B [34;49m[32;49m
0x7ffff72fe393    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe39d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3a1    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe3a4    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe3a7    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe3ab    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe3af    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe3b2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3b6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.095 : locals_0 :> [33;40mcontrolFlags[34;49m <: 0x00007ffff5c8d510 :> [34;49mmod, _reg, rm, REX_B | MODRM_B | [34;49m[33;40mcontrolFlags[34;49m[34;49m, 0, disp, 0, imm, 0 ) ; //?? [34;49m 
_Do_C_Syntax_Variable : word = controlFlags :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mcontrolFlags[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 367.95
[34;49m .. f7, _mod, _reg, rm, REX_B | MODRM_B | [34;49m[33;40mcontrolFlags[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe3b9    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe3bd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3c1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.095 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49muction_X64 ( 0, 0xf7, _mod, _reg, rm, REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m controlFlags, 0, disp, 0, imm, 0 ) ; //?? [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   14 bytes : at namespaces/compiler/x64.cft : 367.95
[34;49m .. 0xf7, _mod, _reg, rm, REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m controlFlags[34;49m[32;49m
0x7ffff72fe3b2    498b4fe8                mov rcx, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe3b6    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe3b9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3bd    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.098 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7382492 :> [34;49m0, 0xf7, _mod, _reg, rm, REX_B | MODRM_B | controlFlags, [34;49m[33;40m0[34;49m[34;49m, disp, 0, imm, 0 ) ; //?? [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 367.98
[34;49m .. , rm, REX_B | MODRM_B | controlFlags, [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe3c0    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe3ca    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3ce    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.104 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5c8dc30 :> [34;49m 0xf7, _mod, _reg, rm, REX_B | MODRM_B | controlFlags, 0, [34;49m[33;40mdisp[34;49m[34;49m, 0, imm, 0 ) ; //?? [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 367.104
[34;49m .. m, REX_B | MODRM_B | controlFlags, 0, [34;49m[33;40mdisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe3d1    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe3d5    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3d9    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.107 : <literal> :> [33;40m0[34;49m <: 0x00007ffff738268d :> [34;49m0, 0xf7, _mod, _reg, rm, REX_B | MODRM_B | controlFlags, 0, disp, [34;49m[33;40m0[34;49m[34;49m, imm, 0 ) ; //?? [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 367.107
[34;49m .. _B | MODRM_B | controlFlags, 0, disp, [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe3dc    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe3e6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3ea    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.112 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5c8dfc0 :> [34;49m, 0xf7, _mod, _reg, rm, REX_B | MODRM_B | controlFlags, 0, disp, 0, [34;49m[33;40mimm[34;49m[34;49m, 0 ) ; //?? [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 367.112
[34;49m .. | MODRM_B | controlFlags, 0, disp, 0, [34;49m[33;40mimm[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe3ed    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe3f1    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe3f5    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.116 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7382888 :> [34;49m0, 0xf7, _mod, _reg, rm, REX_B | MODRM_B | controlFlags, 0, disp, 0, imm, [34;49m[33;40m0[34;49m[34;49m ) ; //?? [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 367.116
[34;49m .. RM_B | controlFlags, 0, disp, 0, imm, [34;49m[33;40m0[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fe3f8    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe402    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe406    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 367.117 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c85298 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xf7, _mod, _re[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 367.117[39;49m :
TypeWordStack depth =  11 :  = Top = 0x00007ffff7fc1a78, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a78 > = 0x00007ffff7382888	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a70 > = 0x00007ffff5c8dfc0	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a68 > = 0x00007ffff738268d	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a60 > = 0x00007ffff5c8dc30	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a58 > = 0x00007ffff7382492	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5c8d510	< word : locals_0.[34;49mcontrolFlags[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -6 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c8ca60	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -7 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c8c898	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -8 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c8c178	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -9 ] < 0x00007ffff7fc1a30 > = 0x00007ffff7382297	< word : <literal>.[34;49m0xf7[39;49m : value = 0x00000000000000f7 > : [34;49mInteger [39;49m
  TypeWordStack   [ -10 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c91f30	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: void.Compile_CalcWrite_Instruction_X64 :: type expected :  :: type recorded : Integer . Integer . Undefined . Undefined . Undefined . Undefined . Integer . Undefined . Integer . Undefined . Integer  : namespaces/compiler/x64.cft : 367.117
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 367.117
[34;49m .. _reg, rm, controlFlags, disp, imm ) { [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xf7, _mod, _reg, rm, REX_B | MODRM_B | controlFlags, 0, disp, 0, .. [34;49m[32;49m
0x7ffff72fe409    49b983db2ff7ff7f0000    mov r9, 0x7ffff72fdb83                                 [34;49m[32;49m
0x7ffff72fe413    49ffd1                  call r9                    	< void.[39;49mCompile_CalcWrite_Instruction_X64[34;49m : 0x00007ffff72fdb83 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 367.120 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49mon_X64 ( 0, 0xf7, _mod, _reg, rm, REX_B | MODRM_B | controlFlags, 0, disp, 0, imm, 0 ) [34;49m[33;40m;[34;49m[34;49m //?? [34;49m 
dbg[c]  :: [34;49m...[34;49m : 367.122 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m64 ( 0, 0xf7, _mod, _reg, rm, REX_B | MODRM_B | controlFlags, 0, disp, 0, imm, 0 ) ; [34;49m[33;40m//[34;49m[34;49m?? [34;49m 
dbg[c]  :: [34;49m...[34;49m : 368.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 368.2
[34;49m ..  controlFlags, 0, disp, 0, imm, 0 ) ; [34;49m[33;40m}[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72fe416    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe41a    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe41e    4983ee30                sub r14, 0x30                                          [34;49m[32;49m
0x7ffff72fe422    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 368.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 368.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 370.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 372.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_Move_Reg_To_Rm ( dstRmReg, srcReg, rmRegDisp ) {  .. [34;49m[32;49m
0x7ffff72fe423    e900000000              jmp 0x7ffff72fe428         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe428    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe42c    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe430    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 372.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c93ac8[34;49m.
dbg[c]  :: [34;49m...[34;49m : 373.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49m_Compile_Move ( toRegOrMem _mod _reg rm controlFlags disp | opCode ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 374.018 : void :> [33;40m_Compile_Move[34;49m <: 0x00007ffff5c862a0 :> [34;49m    [34;49m[33;40m_Compile_Move[34;49m[34;49m ( MEM, MEM, srcReg, dstRmReg, (REX_B | MODRM_B | DISP_B), rm[34;49m 
dbg[c]  :: [34;49m...[34;49m : 374.023 : X64 :> [33;40mMEM[34;49m <: 0x00007ffff74b4640 :> [34;49m    _Compile_Move ( [34;49m[33;40mMEM[34;49m[34;49m, MEM, srcReg, dstRmReg, (REX_B | MODRM_B | DISP_B), rmRegDisp ) ;[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMEM[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 374.23
[34;49m .. srcReg, rmRegDisp ) { _Compile_Move ( [34;49m[33;40mMEM[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe437    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe441    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe445    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.036 : locals_0 :> [33;40msrcReg[34;49m <: 0x00007ffff5c94058 :> [34;49m    _Compile_Move ( MEM, MEM, [34;49m[33;40msrcReg[34;49m[34;49m, dstRmReg, (REX_B | MODRM_B | DISP_B), rmReg[34;49m 
_Do_C_Syntax_Variable : word = srcReg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msrcReg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 374.36
[34;49m .. RegDisp ) { _Compile_Move ( MEM, MEM, [34;49m[33;40msrcReg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe459    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe45d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe461    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.046 : locals_0 :> [33;40mdstRmReg[34;49m <: 0x00007ffff5c93e90 :> [34;49m _Compile_Move ( MEM, MEM, srcReg, [34;49m[33;40mdstRmReg[34;49m[34;49m, (REX_B | MODRM_B | DISP_B), rmRegD[34;49m 
dbg[c]  :: [34;49m...[34;49m : 374.048 : C_Syntax :> [33;40m,[34;49m <: cprimitive :> [34;49m    _Compile_Move ( MEM, MEM, srcReg, dstRmReg[34;49m[33;40m,[34;49m[34;49m (REX_B | MODRM_B | DISP_B), rmRegDisp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 374.048 : locals_0 :> [33;40mdstRmReg[34;49m <: 0x00007ffff5c93e90 :> [34;49m _Compile_Move ( MEM, MEM, srcReg, [34;49m[33;40mdstRmReg[34;49m[34;49m, (REX_B | MODRM_B | DISP_B), rmRegD[34;49m 
_Do_C_Syntax_Variable : word = dstRmReg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdstRmReg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 374.48
[34;49m .. ) { _Compile_Move ( MEM, MEM, srcReg, [34;49m[33;40mdstRmReg[34;49m[34;49m, [34;49m[32;49m
0x7ffff72fe464    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe468    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe46c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.049 : C :> [33;40m([34;49m <: cprimitive :> [34;49m    _Compile_Move ( MEM, MEM, srcReg, dstRmReg, [34;49m[33;40m([34;49m[34;49mREX_B | MODRM_B | DISP_B), rmRegDisp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 374.055 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7e748 :> [34;49m _Compile_Move ( MEM, MEM, srcReg, dstRmReg, ([34;49m[33;40mREX_B[34;49m[34;49m | MODRM_B | DISP_B), rmRegDisp ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 374.55[39;49m :
TypeWordStack depth =   4 :  = Top = 0x00007ffff7fc1a40, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c93e90	< word : locals_0.[34;49mdstRmReg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c94058	< word : locals_0.[34;49msrcReg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c943e8	< word : X64.[34;49mMEM[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a28 > = 0x00007ffff74b4640	< word : X64.[34;49mMEM[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: X64.REX_B :: type expected :  :: type recorded : Undefined  : namespaces/compiler/x64.cft : 374.55
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 374.55[32;49m
0x7ffff72fe46f    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe479    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe47d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.057 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m    _Compile_Move ( MEM, MEM, srcReg, dstRmReg, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | DISP_B), rmRegDisp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 374.065 : X64 :> [33;40mMODRM_B[34;49m <: 0x00007ffff5c7ead8 :> [34;49mCompile_Move ( MEM, MEM, srcReg, dstRmReg, (REX_B | [34;49m[33;40mMODRM_B[34;49m[34;49m | DISP_B), rmRegDisp ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMODRM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 374.65[32;49m
0x7ffff72fe480    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe48a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe48e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.065 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m    _Compile_Move ( MEM, MEM, srcReg, dstRmReg, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B | DISP_B), rmRegDisp ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 374.65[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c94058	< word : locals_0.[34;49msrcReg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c943e8	< word : X64.[34;49mMEM[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff74b4640	< word : X64.[34;49mMEM[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Integer . Undefined  : namespaces/compiler/x64.cft : 374.65
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 374.65
[34;49m ..  ( MEM, MEM, srcReg, dstRmReg, (REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B [34;49m[32;49m
0x7ffff72fe480    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe48a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe48e    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe491    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe494    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe498    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe49c    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe49f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe4a3    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.073 : X64 :> [33;40mDISP_B[34;49m <: 0x00007ffff5c7f1f8 :> [34;49m_Compile_Move ( MEM, MEM, srcReg, dstRmReg, (REX_B | MODRM_B | [34;49m[33;40mDISP_B[34;49m[34;49m), rmRegDisp ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDISP_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 374.73[32;49m
0x7ffff72fe4a6    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe4b0    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe4b4    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.073 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m    _Compile_Move ( MEM, MEM, srcReg, dstRmReg, (REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m DISP_B), rmRegDisp ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 374.73[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c945b0	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff74b4640	< word : X64.[34;49mMEM[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: Bits.| :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 374.73
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 374.73
[34;49m .. M, srcReg, dstRmReg, (REX_B | MODRM_B [34;49m[33;40m|[34;49m[34;49m DISP_B[34;49m[32;49m
0x7ffff72fe4a6    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe4b0    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe4b4    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe4b7    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe4ba    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe4be    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe4c2    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe4c5    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe4c9    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.074 : Compiler :> [33;40m)[34;49m <: cprimitive :> [34;49m    _Compile_Move ( MEM, MEM, srcReg, dstRmReg, (REX_B | MODRM_B | DISP_B[34;49m[33;40m)[34;49m[34;49m, rmRegDisp ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 374.086 : locals_0 :> [33;40mrmRegDisp[34;49m <: 0x00007ffff5c94220 :> [34;49m_Move ( MEM, MEM, srcReg, dstRmReg, (REX_B | MODRM_B | DISP_B), [34;49m[33;40mrmRegDisp[34;49m[34;49m ) ; [34;49m 
_Do_C_Syntax_Variable : word = rmRegDisp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrmRegDisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 374.86
[34;49m .. dstRmReg, (REX_B | MODRM_B | DISP_B), [34;49m[33;40mrmRegDisp[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe4cc    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe4d0    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe4d4    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 374.087 : void :> [33;40m_Compile_Move[34;49m <: 0x00007ffff5c862a0 :> [34;49m    [34;49m[33;40m_Compile_Move[34;49m[34;49m ( MEM, MEM, srcReg, dstRmReg, (REX_B | MODRM_B | DISP_B), rm[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 374.87[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c94220	< word : locals_0.[34;49mrmRegDisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c94940	< word : Bits.[34;49m|[39;49m : value = 0x00005555555b732b > : [34;49mInteger . Integer -> Integer [39;49m
type match :: void._Compile_Move :: type expected : Integer  :: type recorded : Integer . Undefined  : namespaces/compiler/x64.cft : 374.87
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 374.87
[34;49m .. _Rm ( dstRmReg, srcReg, rmRegDisp ) { [34;49m[33;40m_Compile_Move[34;49m[34;49m ( MEM, MEM, srcReg, dstRmReg, (REX_B | MODRM_B | DISP_B), rmRegDisp )[34;49m[32;49m
0x7ffff72fe4d7    49b9fddc2ff7ff7f0000    mov r9, 0x7ffff72fdcfd                                 [34;49m[32;49m
0x7ffff72fe4e1    49ffd1                  call r9                    	< void.[39;49m_Compile_Move[34;49m : 0x00007ffff72fdcfd >[34;49m
dbg[c]  :: [34;49m...[34;49m : 374.090 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    _Compile_Move ( MEM, MEM, srcReg, dstRmReg, (REX_B | MODRM_B | DISP_B), rmRegDisp ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 375.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 375.2
[34;49m .. _B | MODRM_B | DISP_B), rmRegDisp ) ; [34;49m[33;40m}[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe4e4    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe4e8    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe4ec    4983ee18                sub r14, 0x18                                          [34;49m[32;49m
0x7ffff72fe4f0    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 375.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 375.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 377.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 379.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_Move_Reg_To_StackN ( stackReg, index, _reg ) {  .. [34;49m[32;49m
0x7ffff72fe4f1    e900000000              jmp 0x7ffff72fe4f6         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe4f6    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe4fa    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe4fe    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 379.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c94778[34;49m.
dbg[c]  :: [34;49m...[34;49m : 380.028 : void :> [33;40m_Compile_Move_Reg_To_Rm[34;49m <: 0x00007ffff5c93ac8 :> [34;49m    [34;49m[33;40m_Compile_Move_Reg_To_Rm[34;49m[34;49m ( stackReg, _reg, index * CELL ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 380.038 : locals_0 :> [33;40mstackReg[34;49m <: 0x00007ffff5c94b40 :> [34;49m    _Compile_Move_Reg_To_Rm ( [34;49m[33;40mstackReg[34;49m[34;49m, _reg, index * CELL ) ; [34;49m 
_Do_C_Syntax_Variable : word = stackReg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mstackReg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 380.38
[34;49m .. x, _reg ) { _Compile_Move_Reg_To_Rm ( [34;49m[33;40mstackReg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe505    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe509    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe50d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 380.044 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5c94ed0 :> [34;49m    _Compile_Move_Reg_To_Rm ( stackReg, [34;49m[33;40m_reg[34;49m[34;49m, index * CELL ) ; [34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 380.44
[34;49m .. { _Compile_Move_Reg_To_Rm ( stackReg, [34;49m[33;40m_reg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe510    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe514    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe518    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 380.052 : locals_0 :> [33;40mindex[34;49m <: 0x00007ffff5c94d08 :> [34;49m    _Compile_Move_Reg_To_Rm ( stackReg, _reg, [34;49m[33;40mindex[34;49m[34;49m * CELL ) ; [34;49m 
_Do_C_Syntax_Variable : word = index :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mindex[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 380.52
[34;49m .. pile_Move_Reg_To_Rm ( stackReg, _reg, [34;49m[33;40mindex[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe51b    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe51f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe523    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 380.054 : Int :> [33;40m*[34;49m <: cprimitive :> [34;49m    _Compile_Move_Reg_To_Rm ( stackReg, _reg, index [34;49m[33;40m*[34;49m[34;49m CELL ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 380.059 : X64 :> [33;40mCELL[34;49m <: 0x00007ffff5c7e028 :> [34;49m    _Compile_Move_Reg_To_Rm ( stackReg, _reg, index * [34;49m[33;40mCELL[34;49m[34;49m ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCELL[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 380.59
[34;49m .. e_Reg_To_Rm ( stackReg, _reg, index * [34;49m[33;40mCELL[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe526    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe530    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe534    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 380.059 : Int :> [33;40m*[34;49m <: cprimitive :> [34;49m    _Compile_Move_Reg_To_Rm ( stackReg, _reg, index [34;49m[33;40m*[34;49m[34;49m CELL ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m*[34;49m <:   21 bytes : at namespaces/compiler/x64.cft : 380.59
[34;49m .. ove_Reg_To_Rm ( stackReg, _reg, index [34;49m[33;40m*[34;49m[34;49m CELL [34;49m[32;49m
0x7ffff72fe51f    48b90800000000000000    mov rcx, 0x8                                           [34;49m[32;49m
0x7ffff72fe529    480fafc1                imul rax, rcx                                          [34;49m[32;49m
0x7ffff72fe52d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe531    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 380.060 : void :> [33;40m_Compile_Move_Reg_To_Rm[34;49m <: 0x00007ffff5c93ac8 :> [34;49m    [34;49m[33;40m_Compile_Move_Reg_To_Rm[34;49m[34;49m ( stackReg, _reg, index * CELL ) ; [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 380.60[39;49m :
TypeWordStack depth =   4 :  = Top = 0x00007ffff7fc1a40, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5c7e028	< word : X64.[34;49mCELL[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c94d08	< word : locals_0.[34;49mindex[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5c94ed0	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c94b40	< word : locals_0.[34;49mstackReg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: void._Compile_Move_Reg_To_Rm :: type expected :  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 380.60
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move_Reg_To_Rm[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 380.60
[34;49m .. To_StackN ( stackReg, index, _reg ) { [34;49m[33;40m_Compile_Move_Reg_To_Rm[34;49m[34;49m ( stackReg, _reg, index * CELL )[34;49m[32;49m
0x7ffff72fe534    49b928e42ff7ff7f0000    mov r9, 0x7ffff72fe428                                 [34;49m[32;49m
0x7ffff72fe53e    49ffd1                  call r9                    	< void.[39;49m_Compile_Move_Reg_To_Rm[34;49m : 0x00007ffff72fe428 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 380.063 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49m    _Compile_Move_Reg_To_Rm ( stackReg, _reg, index * CELL ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 381.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 381.2
[34;49m .. Rm ( stackReg, _reg, index * CELL ) ; [34;49m[33;40m}[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe541    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe545    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe549    4983ee18                sub r14, 0x18                                          [34;49m[32;49m
0x7ffff72fe54d    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 381.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 381.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 383.005 : int64 :> [33;40mvoid[34;49m <: 0x00007ffff7296ec0 :> [34;49m[34;49m[33;40mvoid[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mvoid[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 385.2
[34;49m ..                                       [34;49m[33;40mvoid[34;49m[34;49m _Compile_TEST_Reg_To_Reg ( dstReg, srcReg ) {  .. [34;49m[32;49m
0x7ffff72fe54e    e900000000              jmp 0x7ffff72fe553         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe553    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe557    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe55b    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 385.2 :> [39;49mvoid[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5c95098[34;49m.
dbg[c]  :: [34;49m...[34;49m : 386.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49m_Compile_Op_Special_Reg_To_Reg ( TEST_R_TO_R, dstReg, srcReg ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 387.038 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c85298 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0x85, 3, srcReg[34;49m 
dbg[c]  :: [34;49m...[34;49m : 387.041 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7382cb4 :> [34;49m    Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m, 0x85, 3, srcReg, dstReg, REX_B | MODRM_B, [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 387.41
[34;49m .. { Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe562    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe56c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe570    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.047 : <literal> :> [33;40m0x85[34;49m <: 0x00007ffff7382eaf :> [34;49mCompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40m0x85[34;49m[34;49m, 3, srcReg, dstReg, REX_B | MODRM_B, 0[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0x85[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 387.47
[34;49m .. ompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40m0x85[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe573    48b88500000000000000    mov rax, 0x85                                          [34;49m[32;49m
0x7ffff72fe57d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe581    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.050 : <literal> :> [33;40m3[34;49m <: 0x00007ffff73830aa :> [34;49mpile_CalcWrite_Instruction_X64 ( 0, 0x85, [34;49m[33;40m3[34;49m[34;49m, srcReg, dstReg, REX_B | MODRM_B, 0, 0, 0[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m3[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 387.50
[34;49m .. _CalcWrite_Instruction_X64 ( 0, 0x85, [34;49m[33;40m3[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe584    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fe58e    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe592    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.058 : locals_0 :> [33;40msrcReg[34;49m <: 0x00007ffff5bbd1d8 :> [34;49mcWrite_Instruction_X64 ( 0, 0x85, 3, [34;49m[33;40msrcReg[34;49m[34;49m, dstReg, REX_B | MODRM_B, 0, 0, 0, 0,[34;49m 
_Do_C_Syntax_Variable : word = srcReg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msrcReg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 387.58
[34;49m .. lcWrite_Instruction_X64 ( 0, 0x85, 3, [34;49m[33;40msrcReg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe595    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe599    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe59d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.066 : locals_0 :> [33;40mdstReg[34;49m <: 0x00007ffff5c95460 :> [34;49mnstruction_X64 ( 0, 0x85, 3, srcReg, [34;49m[33;40mdstReg[34;49m[34;49m, REX_B | MODRM_B, 0, 0, 0, 0, 0 ) ; [34;49m 
_Do_C_Syntax_Variable : word = dstReg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdstReg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 387.66
[34;49m .. Instruction_X64 ( 0, 0x85, 3, srcReg, [34;49m[33;40mdstReg[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe5a0    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe5a4    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe5a8    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.074 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7e748 :> [34;49mWrite_Instruction_X64 ( 0, 0x85, 3, srcReg, dstReg, [34;49m[33;40mREX_B[34;49m[34;49m | MODRM_B, 0, 0, 0, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 387.74[32;49m
0x7ffff72fe5ab    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe5b5    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe5b9    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.076 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49mompile_CalcWrite_Instruction_X64 ( 0, 0x85, 3, srcReg, dstReg, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B, 0, 0, 0, 0, 0 ) ; [34;49m 
dbg[c]  :: [34;49m...[34;49m : 387.083 : X64 :> [33;40mMODRM_B[34;49m <: 0x00007ffff5c7ead8 :> [34;49mite_Instruction_X64 ( 0, 0x85, 3, srcReg, dstReg, REX_B | [34;49m[33;40mMODRM_B[34;49m[34;49m, 0, 0, 0, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMODRM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 387.83[32;49m
0x7ffff72fe5bc    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe5c6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe5ca    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.083 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49mompile_CalcWrite_Instruction_X64 ( 0, 0x85, 3, srcReg, dstReg, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B, 0, 0, 0, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 387.83
[34;49m .. 4 ( 0, 0x85, 3, srcReg, dstReg, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B[34;49m[32;49m
0x7ffff72fe5bc    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe5c6    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe5ca    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe5cd    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe5d0    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe5d4    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe5d8    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe5db    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe5df    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.086 : <literal> :> [33;40m0[34;49m <: 0x00007ffff73832a5 :> [34;49mite_Instruction_X64 ( 0, 0x85, 3, srcReg, dstReg, REX_B | MODRM_B, [34;49m[33;40m0[34;49m[34;49m, 0, 0, 0, 0 ) ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 387.86
[34;49m .. , 3, srcReg, dstReg, REX_B | MODRM_B, [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe5e2    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe5ec    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe5f0    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 387.100 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c85298 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0x85, 3, srcReg[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 387.100[39;49m :
TypeWordStack depth =  10 :  = Top = 0x00007ffff7fc1a70, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a70 > = 0x00007ffff7383a91	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a68 > = 0x00007ffff7383896	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a60 > = 0x00007ffff738369b	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a58 > = 0x00007ffff73834a0	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a50 > = 0x00007ffff73832a5	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5c95460	< word : locals_0.[34;49mdstReg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -6 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5bbd1d8	< word : locals_0.[34;49msrcReg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -7 ] < 0x00007ffff7fc1a38 > = 0x00007ffff73830aa	< word : <literal>.[34;49m3[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -8 ] < 0x00007ffff7fc1a30 > = 0x00007ffff7382eaf	< word : <literal>.[34;49m0x85[39;49m : value = 0x0000000000000085 > : [34;49mInteger [39;49m
  TypeWordStack   [  -9 ] < 0x00007ffff7fc1a28 > = 0x00007ffff7382cb4	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: void.Compile_CalcWrite_Instruction_X64 :: type expected :  :: type recorded : Integer . Integer . Integer . Undefined . Undefined . Integer . Integer . Integer . Integer . Integer  : namespaces/compiler/x64.cft : 387.100
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 387.100
[34;49m .. _TEST_Reg_To_Reg ( dstReg, srcReg ) { [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0x85, 3, srcReg, dstReg, REX_B | MODRM_B, 0, 0, 0, 0, 0 )[34;49m[32;49m
0x7ffff72fe637    49b983db2ff7ff7f0000    mov r9, 0x7ffff72fdb83                                 [34;49m[32;49m
0x7ffff72fe641    49ffd1                  call r9                    	< void.[39;49mCompile_CalcWrite_Instruction_X64[34;49m : 0x00007ffff72fdb83 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 387.103 : C_Syntax :> [33;40m;[34;49m <: cprimitive :> [34;49mle_CalcWrite_Instruction_X64 ( 0, 0x85, 3, srcReg, dstReg, REX_B | MODRM_B, 0, 0, 0, 0, 0 ) [34;49m[33;40m;[34;49m[34;49m [34;49m 
dbg[c]  :: [34;49m...[34;49m : 389.002 : C_Syntax :> [33;40m}[34;49m <: cprimitive :> [34;49m[34;49m[33;40m}[34;49m[34;49m prefix [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m}[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 389.2
[34;49m .. , REX_B | MODRM_B, 0, 0, 0, 0, 0 ) ;  [34;49m[33;40m}[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe644    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe648    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe64c    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe650    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 389.2 :> [39;49m}[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 389.009 : Compiler :> [33;40mprefix[34;49m <: cprimitive :> [34;49m} [34;49m[33;40mprefix[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 391.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine Compile_INC( mod, rm, sib, disp ) _Compile_Group5 ( INC, mod, rm, sib, disp, 0  ) [34;49m 
dbg[i]  :: [34;49m...[34;49m : 391.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m Compile_INC( mod, rm, sib, disp ) _Compile_Group5 ( INC, mod, rm, sib, disp, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 391.020 : C :> [33;40m([34;49m <: cprimitive :> [34;49m#define Compile_INC[34;49m[33;40m([34;49m[34;49m mod, rm, sib, disp ) _Compile_Group5 ( INC, mod, rm, sib, disp, 0  ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 391.058 : void :> [33;40m_Compile_Group5[34;49m <: 0x00007ffff5c93820 :> [34;49mile_INC( mod, rm, sib, disp ) [34;49m[33;40m_Compile_Group5[34;49m[34;49m ( INC, mod, rm, sib, disp, 0  [34;49m 
dbg[c]  :: [34;49m...[34;49m : 391.063 : X64 :> [33;40mINC[34;49m <: 0x00007ffff5c7e3b8 :> [34;49mdefine Compile_INC( mod, rm, sib, disp ) _Compile_Group5 ( [34;49m[33;40mINC[34;49m[34;49m, mod, rm, sib, disp, 0  ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mINC[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 391.63[32;49m
0x7ffff72fe665    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe66f    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe673    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 391.068 : locals_0 :> [33;40mmod[34;49m <: 0x00007ffff5bbd768 :> [34;49me Compile_INC( mod, rm, sib, disp ) _Compile_Group5 ( INC, [34;49m[33;40mmod[34;49m[34;49m, rm, sib, disp, 0  ) [34;49m 
_Do_C_Syntax_Variable : word = mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mmod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 391.68[32;49m
0x7ffff72fe676    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fe67a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe67e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 391.072 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5bbd930 :> [34;49mne Compile_INC( mod, rm, sib, disp ) _Compile_Group5 ( INC, mod, [34;49m[33;40mrm[34;49m[34;49m, sib, disp, 0  ) [34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 391.72[32;49m
0x7ffff72fe681    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe685    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe689    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 391.077 : locals_0 :> [33;40msib[34;49m <: 0x00007ffff5bbdaf8 :> [34;49me Compile_INC( mod, rm, sib, disp ) _Compile_Group5 ( INC, mod, rm, [34;49m[33;40msib[34;49m[34;49m, disp, 0  ) [34;49m 
_Do_C_Syntax_Variable : word = sib :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msib[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 391.77[32;49m
0x7ffff72fe68c    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe690    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe694    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 391.083 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5bbdcc0 :> [34;49m Compile_INC( mod, rm, sib, disp ) _Compile_Group5 ( INC, mod, rm, sib, [34;49m[33;40mdisp[34;49m[34;49m, 0  ) [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 391.83[32;49m
0x7ffff72fe697    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe69b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe69f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 391.087 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7383d8b :> [34;49mne Compile_INC( mod, rm, sib, disp ) _Compile_Group5 ( INC, mod, rm, sib, disp, [34;49m[33;40m0[34;49m[34;49m  ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 391.87[32;49m
0x7ffff72fe6a2    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe6ac    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe6b0    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 391.089 : void :> [33;40m_Compile_Group5[34;49m <: 0x00007ffff5c93820 :> [34;49mile_INC( mod, rm, sib, disp ) [34;49m[33;40m_Compile_Group5[34;49m[34;49m ( INC, mod, rm, sib, disp, 0  [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 391.89[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff7383d8b	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5bbdcc0	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5bbdaf8	< word : locals_0.[34;49msib[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5bbd930	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5bbd768	< word : locals_0.[34;49mmod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7e3b8	< word : X64.[34;49mINC[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: void._Compile_Group5 :: type expected : Integer . Integer  :: type recorded : Integer . Undefined . Undefined . Undefined . Undefined . Integer  : namespaces/compiler/x64.cft : 391.89
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Group5[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 391.89[32;49m
0x7ffff72fe6b3    49b903e12ff7ff7f0000    mov r9, 0x7ffff72fe103                                 [34;49m[32;49m
0x7ffff72fe6bd    49ffd1                  call r9                    	< void.[39;49m_Compile_Group5[34;49m : 0x00007ffff72fe103 >[34;49m
dbg[i]  :: [34;49m...[34;49m : 392.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mdefine Compile_DEC( mod, rm, sib, disp ) _Compile_Group5 ( DEC, mod, rm, sib, disp, 0  ) [34;49m 
dbg[i]  :: [34;49m...[34;49m : 392.008 : PreProcessor :> [33;40mdefine[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mdefine[34;49m[34;49m Compile_DEC( mod, rm, sib, disp ) _Compile_Group5 ( DEC, mod, rm, sib, disp, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 392.020 : C :> [33;40m([34;49m <: cprimitive :> [34;49m#define Compile_DEC[34;49m[33;40m([34;49m[34;49m mod, rm, sib, disp ) _Compile_Group5 ( DEC, mod, rm, sib, disp, 0  ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 392.058 : void :> [33;40m_Compile_Group5[34;49m <: 0x00007ffff5c93820 :> [34;49mile_DEC( mod, rm, sib, disp ) [34;49m[33;40m_Compile_Group5[34;49m[34;49m ( DEC, mod, rm, sib, disp, 0  [34;49m 
dbg[c]  :: [34;49m...[34;49m : 392.063 : X64 :> [33;40mDEC[34;49m <: 0x00007ffff5c7e580 :> [34;49mdefine Compile_DEC( mod, rm, sib, disp ) _Compile_Group5 ( [34;49m[33;40mDEC[34;49m[34;49m, mod, rm, sib, disp, 0  ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDEC[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 392.63
[34;49m ..                      _Compile_Group5  [34;49m[33;40mDEC[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe6cd    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe6d7    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe6db    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 392.068 : locals_0 :> [33;40mmod[34;49m <: 0x00007ffff5bbe250 :> [34;49me Compile_DEC( mod, rm, sib, disp ) _Compile_Group5 ( DEC, [34;49m[33;40mmod[34;49m[34;49m, rm, sib, disp, 0  ) [34;49m 
_Do_C_Syntax_Variable : word = mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mmod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 392.68
[34;49m ..                      _Compile_Group5  [34;49m[33;40mmod[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe6de    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fe6e2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe6e6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 392.072 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5bbe418 :> [34;49mne Compile_DEC( mod, rm, sib, disp ) _Compile_Group5 ( DEC, mod, [34;49m[33;40mrm[34;49m[34;49m, sib, disp, 0  ) [34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 392.72
[34;49m ..                      _Compile_Group5  [34;49m[33;40mrm[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe6e9    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe6ed    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe6f1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 392.077 : locals_0 :> [33;40msib[34;49m <: 0x00007ffff5bbe5e0 :> [34;49me Compile_DEC( mod, rm, sib, disp ) _Compile_Group5 ( DEC, mod, rm, [34;49m[33;40msib[34;49m[34;49m, disp, 0  ) [34;49m 
_Do_C_Syntax_Variable : word = sib :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40msib[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 392.77
[34;49m ..                      _Compile_Group5  [34;49m[33;40msib[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe6f4    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe6f8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe6fc    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 392.083 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5bbe7a8 :> [34;49m Compile_DEC( mod, rm, sib, disp ) _Compile_Group5 ( DEC, mod, rm, sib, [34;49m[33;40mdisp[34;49m[34;49m, 0  ) [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 392.83
[34;49m ..                      _Compile_Group5  [34;49m[33;40mdisp[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe6ff    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe703    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe707    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 392.087 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7384085 :> [34;49mne Compile_DEC( mod, rm, sib, disp ) _Compile_Group5 ( DEC, mod, rm, sib, disp, [34;49m[33;40m0[34;49m[34;49m  ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 392.87
[34;49m ..                      _Compile_Group5  [34;49m[33;40m0[34;49m[34;49m .. [34;49m[32;49m
0x7ffff72fe70a    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe714    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe718    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 392.089 : void :> [33;40m_Compile_Group5[34;49m <: 0x00007ffff5c93820 :> [34;49mile_DEC( mod, rm, sib, disp ) [34;49m[33;40m_Compile_Group5[34;49m[34;49m ( DEC, mod, rm, sib, disp, 0  [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 392.89[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff7384085	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5bbe7a8	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5bbe5e0	< word : locals_0.[34;49msib[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5bbe418	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5bbe250	< word : locals_0.[34;49mmod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7e580	< word : X64.[34;49mDEC[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
type match :: void._Compile_Group5 :: type expected : Integer . Integer  :: type recorded : Integer . Undefined . Undefined . Undefined . Undefined . Integer  : namespaces/compiler/x64.cft : 392.89
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Group5[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 392.89
[34;49m ..                                       [34;49m[33;40m_Compile_Group5[34;49m[34;49m   .. [34;49m[32;49m
0x7ffff72fe71b    49b903e12ff7ff7f0000    mov r9, 0x7ffff72fe103                                 [34;49m[32;49m
0x7ffff72fe725    49ffd1                  call r9                    	< void.[39;49m_Compile_Group5[34;49m : 0x00007ffff72fe103 >[34;49m
dbg[i]  :: [34;49m...[34;49m : 393.012 : Compiler :> [33;40mc_syntaxOff[34;49m <: cprimitive :> [34;49m[34;49m[33;40mc_syntaxOff[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 394.008 : Compiler :> [33;40minfixOn[34;49m <: cprimitive :> [34;49m[34;49m[33;40minfixOn[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 395.002 : Root :> [33;40mC[34;49m <: 0x00007ffff7fa0dc8 :> [34;49m[34;49m[33;40mC[34;49m[34;49m X64 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 395.006 : Asm :> [33;40mX64[34;49m <: 0x00007ffff74b3438 :> [34;49mC [34;49m[33;40mX64[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 396.003 : X64 :> [33;40msp[34;49m <: 0x00007ffff5c803c8 :> [34;49m[34;49m[33;40msp[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 397.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m _Compile_Stack_PopToReg ( _reg ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 397.34[32;49m
0x7ffff72fe721    e900000000              jmp 0x7ffff72fe726         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe726    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe72a    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe72e    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 397.34 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bbe970[34;49m.
dbg[c]  :: [34;49m...[34;49m : 398.035 : void :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <: 0x00007ffff5c860d8 :> [34;49m    [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( _reg @, 0 ) // 4d8b06   [34;49m 
dbg[c]  :: [34;49m...[34;49m : 398.042 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5bbed38 :> [34;49m    _Compile_Move_DataStackN_ToReg ( [34;49m[33;40m_reg[34;49m[34;49m @, 0 ) // 4d8b06                  mov r8,[34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 398.42
[34;49m .. g )  _Compile_Move_DataStackN_ToReg ( [34;49m[33;40m_reg[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe735    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe739    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe73d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 398.043 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Move_DataStackN_ToReg ( _reg [34;49m[33;40m@[34;49m[34;49m, 0 ) // 4d8b06                  mov r8, [r14] [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 398.43
[34;49m .. _Compile_Move_DataStackN_ToReg ( _reg [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe735    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe739    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe73d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 398.047 : <literal> :> [33;40m0[34;49m <: 0x00007ffff73842e6 :> [34;49m _Compile_Move_DataStackN_ToReg ( _reg @, [34;49m[33;40m0[34;49m[34;49m ) // 4d8b06                  mov r8, [r14[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 398.47
[34;49m .. mpile_Move_DataStackN_ToReg ( _reg @, [34;49m[33;40m0[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe740    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe74a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe74e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 398.048 : void :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <: 0x00007ffff5c860d8 :> [34;49m    [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( _reg @, 0 ) // 4d8b06   [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 398.48[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff73842e6	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5bbed38	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: void._Compile_Move_DataStackN_ToReg :: type expected : Integer . Integer  :: type recorded : Undefined . Integer  : namespaces/compiler/x64.cft : 398.48
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 398.48
[34;49m ..   : _Compile_Stack_PopToReg ( _reg )  [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( _reg @, 0 ) .. [34;49m[32;49m
0x7ffff72fe751    49b900de2ff7ff7f0000    mov r9, 0x7ffff72fde00                                 [34;49m[32;49m
0x7ffff72fe75b    49ffd1                  call r9                    	< void.[39;49m_Compile_Move_DataStackN_ToReg[34;49m : 0x00007ffff72fde00 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 398.051 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    _Compile_Move_DataStackN_ToReg ( _reg @, 0 ) [34;49m[33;40m//[34;49m[34;49m 4d8b06                  mov r8, [r14] [34;49m 
dbg[c]  :: [34;49m...[34;49m : 400.022 : void :> [33;40m_Compile_SUBI_DSP[34;49m <: 0x00007ffff5c909d0 :> [34;49m    [34;49m[33;40m_Compile_SUBI_DSP[34;49m[34;49m ( CELL )                   // 4983ee08              [34;49m 
dbg[c]  :: [34;49m...[34;49m : 400.029 : X64 :> [33;40mCELL[34;49m <: 0x00007ffff5c7e028 :> [34;49m    _Compile_SUBI_DSP ( [34;49m[33;40mCELL[34;49m[34;49m )                   // 4983ee08                sub r14, 0x8[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCELL[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 400.29
[34;49m .. Reg ( _reg @, 0 ) _Compile_SUBI_DSP ( [34;49m[33;40mCELL[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe75e    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe768    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe76c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 400.030 : void :> [33;40m_Compile_SUBI_DSP[34;49m <: 0x00007ffff5c909d0 :> [34;49m    [34;49m[33;40m_Compile_SUBI_DSP[34;49m[34;49m ( CELL )                   // 4983ee08              [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 400.30[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7e028	< word : X64.[34;49mCELL[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
type match :: void._Compile_SUBI_DSP :: type expected :  :: type recorded : Integer  : namespaces/compiler/x64.cft : 400.30
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_SUBI_DSP[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 400.30
[34;49m .. e_Move_DataStackN_ToReg ( _reg @, 0 ) [34;49m[33;40m_Compile_SUBI_DSP[34;49m[34;49m ( CELL )[34;49m[32;49m
0x7ffff72fe76f    49b9a2e22ff7ff7f0000    mov r9, 0x7ffff72fe2a2                                 [34;49m[32;49m
0x7ffff72fe779    49ffd1                  call r9                    	< void.[39;49m_Compile_SUBI_DSP[34;49m : 0x00007ffff72fe2a2 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 400.051 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    _Compile_SUBI_DSP ( CELL )                   [34;49m[33;40m//[34;49m[34;49m 4983ee08                sub r14, 0x8 [34;49m 
dbg[c]  :: [34;49m...[34;49m : 402.003 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b2d18 :> [34;49m[34;49m[33;40m;;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 402.3
[34;49m .. reg @, 0 ) _Compile_SUBI_DSP ( CELL ) [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe77c    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe780    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe784    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe788    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 402.3 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 403.003 : X64 :> [33;40msp[34;49m <: 0x00007ffff5c803c8 :> [34;49m[34;49m[33;40msp[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 404.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49m'_Compile_Stack_PopToReg find wdiss //pause [34;49m 
dbg[i]  :: [34;49m...[34;49m : 405.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif 0 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 405.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m 0 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 405.006 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cf5c88 :> [34;49m#if [34;49m[33;40m0[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 405.6 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 423.002 : Root :> [33;40mC[34;49m <: 0x00007ffff7fa0dc8 :> [34;49m[34;49m[33;40mC[34;49m[34;49m X64 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 423.006 : Asm :> [33;40mX64[34;49m <: 0x00007ffff74b3438 :> [34;49mC [34;49m[33;40mX64[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 424.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif x64_dbg [34;49m 
dbg[i]  :: [34;49m...[34;49m : 424.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m x64_dbg [34;49m 
dbg[i]  :: [34;49m...[34;49m : 424.012 : X64 :> [33;40mx64_dbg[34;49m <: 0x00007ffff5c80038 :> [34;49m#if [34;49m[33;40mx64_dbg[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 424.12 :> [39;49mx64_dbg[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
dbg[i]  :: [34;49m...[34;49m : 425.002 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m[34;49m[33;40m//[34;49m[34;49mverbosity 3 = [34;49m 
dbg[i]  :: [34;49m...[34;49m : 426.012 : Root :> [33;40mCombinators[34;49m <: 0x00007ffff7fa76a0 :> [34;49m[34;49m[33;40mCombinators[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 428.003 : X64 :> [33;40msp[34;49m <: 0x00007ffff5c803c8 :> [34;49m[34;49m[33;40msp[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 429.005 : Asm :> [33;40m:asm[34;49m <: 0x00007ffff74b2268 :> [34;49m[34;49m[33;40m:asm[34;49m[34;49m iax [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:asm[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 429.9[32;49m
0x7ffff72fe789    e900000000              jmp 0x7ffff72fe78e         	< C compiler code >        [34;49m
[34;49m ..                                       [34;49m[33;40miax[34;49m[34;49mCompile_Stack_PopToReg ( _reg )  _Compile_Move_DataStackN_ToReg ( _reg @, 0 ) _Compile_SUBI_DSP ( CEL .. [34;49m[32;49m
0x7ffff72fe78e    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe792    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe796    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 429.9 :> [39;49m:asm[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bbef00[34;49m.
dbg[i]  :: [34;49m...[34;49m : 430.028 : X64 :> [33;40m_Compile_Stack_PopToReg[34;49m <: 0x00007ffff5bbe970 :> [34;49m    [34;49m[33;40m_Compile_Stack_PopToReg[34;49m[34;49m ( R8D )             //4d8b06             [34;49m 
dbg[i]  :: [34;49m...[34;49m : 430.034 : X64 :> [33;40mR8D[34;49m <: 0x00007ffff5c7b3a0 :> [34;49m    _Compile_Stack_PopToReg ( [34;49m[33;40mR8D[34;49m[34;49m )             //4d8b06                  mov r8, [r14] [34;49m 
Stack : word at namespaces/compiler/x64.cft : 430.34 :> [39;49mR8D[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000008[34;49m.
dbg[i]  :: [34;49m...[34;49m : 430.035 : X64 :> [33;40m_Compile_Stack_PopToReg[34;49m <: 0x00007ffff5bbe970 :> [34;49m    [34;49m[33;40m_Compile_Stack_PopToReg[34;49m[34;49m ( R8D )             //4d8b06             [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 430.35[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7b3a0	< word : X64.[34;49mR8D[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
type match :: X64._Compile_Stack_PopToReg :: type expected : Integer  :: type recorded : Integer  : namespaces/compiler/x64.cft : 430.35
_Compile_Write_Instruction_X64 : 7ffff72fe79d : 4 bytes : ...
[34;49m ..                                     : [39;49m[33;40m_Compile_Stack_PopToReg[39;49m[34;49m ( _reg )  _Compile_Move_DataStackN_ToReg ( _reg @, 0 ) _Compile_SUBI_DSP ( CELL  .. [39;49m[32;49m
0x7ffff72fe79d    4c8bcd                  mov r9, rbp                                            [39;49m[32;49m
0x7ffff72fe7a0    00                      invalid                                                [39;49m
_Compile_Write_Instruction_X64 : 7ffff72fe7a1 : 4 bytes : ...[32;49m
0x7ffff72fe7a1    4c83cd00                or rbp, 0x0                                            [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Stack_PopToReg[34;49m <:    8 bytes : at namespaces/compiler/x64.cft : 430.35[32;49m
0x7ffff72fe79d    4c8bcd                  mov r9, rbp                                            [34;49m[32;49m
0x7ffff72fe7a0    004c83cd                add [rbx+rax*4-0x33], cl                               [34;49m[32;49m
0x7ffff72fe7a4    00                      invalid                                                [34;49m
Stack : word at namespaces/compiler/x64.cft : 430.35 :> [39;49m_Compile_Stack_PopToReg[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff5bbef00[34;49m.
dbg[i]  :: [34;49m...[34;49m : 430.050 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    _Compile_Stack_PopToReg ( R8D )             [34;49m[33;40m//[34;49m[34;49m4d8b06                  mov r8, [r14] [34;49m 
dbg[i]  :: [34;49m...[34;49m : 431.025 : void :> [33;40m_Compile_CallThruReg[34;49m <: 0x00007ffff5c91810 :> [34;49m    [34;49m[33;40m_Compile_CallThruReg[34;49m[34;49m ( R8D )                //4983ee08             [34;49m 
dbg[i]  :: [34;49m...[34;49m : 431.031 : X64 :> [33;40mR8D[34;49m <: 0x00007ffff5c7b3a0 :> [34;49m    _Compile_CallThruReg ( [34;49m[33;40mR8D[34;49m[34;49m )                //4983ee08                sub r14, 0x8 [34;49m 
Stack : word at namespaces/compiler/x64.cft : 431.31 :> [39;49mR8D[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000008[34;49m.
dbg[i]  :: [34;49m...[34;49m : 431.032 : void :> [33;40m_Compile_CallThruReg[34;49m <: 0x00007ffff5c91810 :> [34;49m    [34;49m[33;40m_Compile_CallThruReg[34;49m[34;49m ( R8D )                //4983ee08             [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 431.32[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7b3a0	< word : X64.[34;49mR8D[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
type match :: void._Compile_CallThruReg :: type expected :  :: type recorded : Integer  : namespaces/compiler/x64.cft : 431.32
_Compile_Write_Instruction_X64 : 7ffff72fe7a5 : 4 bytes : ...
[34;49m : _Compile_Stack_PopToReg ( _reg )  _Comp[39;49m[33;40m_Compile_CallThruReg[39;49m[34;49mToReg ( _reg @, 0 ) _Compile_SUBI_DSP ( CELL ) ;;  .. [39;49m[32;49m
0x7ffff72fe7a5    4cffc7                  inc rdi                                                [39;49m[32;49m
0x7ffff72fe7a8    00                      invalid                                                [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_CallThruReg[34;49m <:    4 bytes : at namespaces/compiler/x64.cft : 431.32[32;49m
0x7ffff72fe7a5    4cffc7                  inc rdi                                                [34;49m[32;49m
0x7ffff72fe7a8    00                      invalid                                                [34;49m
Stack : word at namespaces/compiler/x64.cft : 431.32 :> [39;49m_Compile_CallThruReg[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff5bbef00[34;49m.
dbg[i]  :: [34;49m...[34;49m : 431.050 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    _Compile_CallThruReg ( R8D )                [34;49m[33;40m//[34;49m[34;49m4983ee08                sub r14, 0x8 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 434.005 : Asm :> [33;40masm;[34;49m <: 0x00007ffff74b2430 :> [34;49m[34;49m[33;40masm;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40masm;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 434.5
[34;49m ..  ( R8D ) _Compile_CallThruReg ( R8D ) [34;49m[33;40masm;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe7a9    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 434.5 :> [39;49masm;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 436.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49m iax find wdiss //pause // sp [34;49m 
Stack : word at namespaces/compiler/x64.cft : 436.6 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff6ec49b0[34;49m.
dbg[i]  :: [34;49m...[34;49m : 436.011 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m' iax [34;49m[33;40mfind[34;49m[34;49m wdiss //pause // sp [34;49m 
Stack : word at namespaces/compiler/x64.cft : 436.11 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff5bbef00[34;49m.
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
starting at address : 0xf72fe79d -- code size = 13 bytes
Word :: Combinators.[34;49miax[39;49m : definition = 0x00007ffff72fe79d : disassembly at namespaces/compiler/x64.cft : 436.17 :
[34;49m ..                              :asm iax [39;49m[33;40m_Compile_Stack_PopToReg[39;49m[34;49m ( R8D ) _Compile_CallThruReg ( R8D ) asm;  .. [39;49m[32;49m
0x7ffff72fe79d    4c8bcd                  mov r9, rbp                                            [39;49m[32;49m
0x7ffff72fe7a0    004c83cd                add [rbx+rax*4-0x33], cl                               [39;49m[32;49m
0x7ffff72fe7a4    004cffc7                add [rdi+rdi*8-0x39], cl                               [39;49m[32;49m
0x7ffff72fe7a8    00c3                    add bl, al                                             [39;49m
Word_Disassemble : word - 'iax' :: codeSize = 110x00007ffff72692380x00007ffff72fe79d43617
Stack : word at namespaces/compiler/x64.cft : 436.17 :> [39;49mwdiss[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 436.019 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m' iax find wdiss [34;49m[33;40m//[34;49m[34;49mpause // sp [34;49m 
dbg[i]  :: [34;49m...[34;49m : 438.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m _Compile_Test_Imm (  _mod, rm, disp, imm ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 438.44[32;49m
0x7ffff72fe7aa    e900000000              jmp 0x7ffff72fe7af         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe7af    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe7b3    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe7b7    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 438.44 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bbf0c8[34;49m.
dbg[c]  :: [34;49m...[34;49m : 439.018 : void :> [33;40m_Compile_Test[34;49m <: 0x00007ffff5c900e8 :> [34;49m    [34;49m[33;40m_Compile_Test[34;49m[34;49m ( _mod @, rm @, IMM_B, disp @, imm @ ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 439.025 : locals_0 :> [33;40m_mod[34;49m <: 0x00007ffff5bbf490 :> [34;49m    _Compile_Test ( [34;49m[33;40m_mod[34;49m[34;49m @, rm @, IMM_B, disp @, imm @ ) [34;49m 
_Do_C_Syntax_Variable : word = _mod :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_mod[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 439.25
[34;49m .. _mod, rm, disp, imm ) _Compile_Test ( [34;49m[33;40m_mod[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe7be    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fe7c2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7c6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.026 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Test ( _mod [34;49m[33;40m@[34;49m[34;49m, rm @, IMM_B, disp @, imm @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 439.26
[34;49m ..  rm, disp, imm ) _Compile_Test ( _mod [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe7be    498b47e0                mov rax, [r15-0x20]                                    [34;49m[32;49m
0x7ffff72fe7c2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7c6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.031 : locals_0 :> [33;40mrm[34;49m <: 0x00007ffff5bbf658 :> [34;49m    _Compile_Test ( _mod @, [34;49m[33;40mrm[34;49m[34;49m @, IMM_B, disp @, imm @ ) [34;49m 
_Do_C_Syntax_Variable : word = rm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mrm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 439.31
[34;49m .. , disp, imm ) _Compile_Test ( _mod @, [34;49m[33;40mrm[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe7c9    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe7cd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7d1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.032 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Test ( _mod @, rm [34;49m[33;40m@[34;49m[34;49m, IMM_B, disp @, imm @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 439.32
[34;49m .. isp, imm ) _Compile_Test ( _mod @, rm [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe7c9    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fe7cd    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7d1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.039 : X64 :> [33;40mIMM_B[34;49m <: 0x00007ffff5c7f588 :> [34;49m    _Compile_Test ( _mod @, rm @, [34;49m[33;40mIMM_B[34;49m[34;49m, disp @, imm @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mIMM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 439.39[32;49m
0x7ffff72fe7d4    48b81000000000000000    mov rax, 0x10                                          [34;49m[32;49m
0x7ffff72fe7de    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7e2    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.046 : locals_0 :> [33;40mdisp[34;49m <: 0x00007ffff5bbf820 :> [34;49m    _Compile_Test ( _mod @, rm @, IMM_B, [34;49m[33;40mdisp[34;49m[34;49m @, imm @ ) [34;49m 
_Do_C_Syntax_Variable : word = disp :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mdisp[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 439.46
[34;49m ..  _Compile_Test ( _mod @, rm @, IMM_B, [34;49m[33;40mdisp[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe7e5    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe7e9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7ed    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.047 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Test ( _mod @, rm @, IMM_B, disp [34;49m[33;40m@[34;49m[34;49m, imm @ ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 439.47
[34;49m .. pile_Test ( _mod @, rm @, IMM_B, disp [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe7e5    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe7e9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7ed    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.053 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5bbf9e8 :> [34;49m    _Compile_Test ( _mod @, rm @, IMM_B, disp @, [34;49m[33;40mimm[34;49m[34;49m @ ) [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 439.53
[34;49m .. e_Test ( _mod @, rm @, IMM_B, disp @, [34;49m[33;40mimm[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe7f0    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe7f4    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7f8    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.055 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m    _Compile_Test ( _mod @, rm @, IMM_B, disp @, imm [34;49m[33;40m@[34;49m[34;49m ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 439.55
[34;49m .. st ( _mod @, rm @, IMM_B, disp @, imm [34;49m[33;40m@[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe7f0    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe7f4    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe7f8    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 439.056 : void :> [33;40m_Compile_Test[34;49m <: 0x00007ffff5c900e8 :> [34;49m    [34;49m[33;40m_Compile_Test[34;49m[34;49m ( _mod @, rm @, IMM_B, disp @, imm @ ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 439.56[39;49m :
TypeWordStack depth =   4 :  = Top = 0x00007ffff7fc1a40, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5bbf9e8	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5bbf820	< word : locals_0.[34;49mdisp[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5bbf658	< word : locals_0.[34;49mrm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5bbf490	< word : locals_0.[34;49m_mod[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
type match :: void._Compile_Test :: type expected :  :: type recorded : Undefined . Undefined . Undefined . Undefined  : namespaces/compiler/x64.cft : 439.56
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Test[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 439.56
[34;49m .. pile_Test_Imm ( _mod, rm, disp, imm ) [34;49m[33;40m_Compile_Test[34;49m[34;49m ( _mod @, rm @, IMM_B, disp @, imm @ )[34;49m[32;49m
0x7ffff72fe7fb    49b930e32ff7ff7f0000    mov r9, 0x7ffff72fe330                                 [34;49m[32;49m
0x7ffff72fe805    49ffd1                  call r9                    	< void.[39;49m_Compile_Test[34;49m : 0x00007ffff72fe330 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 440.003 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b2d18 :> [34;49m[34;49m[33;40m;;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 440.3
[34;49m ..  _mod @, rm @, IMM_B, disp @, imm @ ) [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe808    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe80c    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe810    4983ee20                sub r14, 0x20                                          [34;49m[32;49m
0x7ffff72fe814    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 440.3 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 442.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m _Compile_IncDec_Reg ( op, _reg ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 442.34[32;49m
0x7ffff72fe815    e900000000              jmp 0x7ffff72fe81a         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe81a    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe81e    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe822    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 442.34 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc0108[34;49m.
dbg[c]  :: [34;49m...[34;49m : 443.006 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m    [34;49m[33;40m//[34;49m[34;49m_Compile_Group5 ( op @, REG, _reg @, 0, 0, 0  ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 444.038 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c85298 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xff, REG, op @[34;49m 
dbg[c]  :: [34;49m...[34;49m : 444.041 : <literal> :> [33;40m0[34;49m <: 0x00007ffff73846df :> [34;49m    Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m, 0xff, REG, op @, _reg @, REX_B | MODRM_B, [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 444.41
[34;49m .. ) Compile_CalcWrite_Instruction_X64 ( [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe829    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe833    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe837    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.047 : <literal> :> [33;40m0xff[34;49m <: 0x00007ffff73848da :> [34;49mCompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40m0xff[34;49m[34;49m, REG, op @, _reg @, REX_B | MODRM_B, 0[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0xff[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 444.47
[34;49m .. ompile_CalcWrite_Instruction_X64 ( 0, [34;49m[33;40m0xff[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe83a    48b8ff00000000000000    mov rax, 0xff                                          [34;49m[32;49m
0x7ffff72fe844    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe848    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.052 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b3f20 :> [34;49mmpile_CalcWrite_Instruction_X64 ( 0, 0xff, [34;49m[33;40mREG[34;49m[34;49m, op @, _reg @, REX_B | MODRM_B, 0, 0, 0, 0[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 444.52
[34;49m .. _CalcWrite_Instruction_X64 ( 0, 0xff, [34;49m[33;40mREG[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe84b    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fe855    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe859    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.057 : locals_0 :> [33;40mop[34;49m <: 0x00007ffff5bbfd78 :> [34;49malcWrite_Instruction_X64 ( 0, 0xff, REG, [34;49m[33;40mop[34;49m[34;49m @, _reg @, REX_B | MODRM_B, 0, 0, 0, 0, 0[34;49m 
_Do_C_Syntax_Variable : word = op :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mop[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 444.57
[34;49m .. Write_Instruction_X64 ( 0, 0xff, REG, [34;49m[33;40mop[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe85c    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe860    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe864    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.058 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49mpile_CalcWrite_Instruction_X64 ( 0, 0xff, REG, op [34;49m[33;40m@[34;49m[34;49m, _reg @, REX_B | MODRM_B, 0, 0, 0, 0, 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 444.58
[34;49m .. te_Instruction_X64 ( 0, 0xff, REG, op [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe85c    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fe860    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe864    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.065 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5bbfbb0 :> [34;49mite_Instruction_X64 ( 0, 0xff, REG, op @, [34;49m[33;40m_reg[34;49m[34;49m @, REX_B | MODRM_B, 0, 0, 0, 0, 0 ) [34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 444.65
[34;49m .. Instruction_X64 ( 0, 0xff, REG, op @, [34;49m[33;40m_reg[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe867    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe86b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe86f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.066 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49mpile_CalcWrite_Instruction_X64 ( 0, 0xff, REG, op @, _reg [34;49m[33;40m@[34;49m[34;49m, REX_B | MODRM_B, 0, 0, 0, 0, 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 444.66
[34;49m .. uction_X64 ( 0, 0xff, REG, op @, _reg [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe867    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe86b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe86f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.074 : X64 :> [33;40mREX_B[34;49m <: 0x00007ffff5c7e748 :> [34;49mlcWrite_Instruction_X64 ( 0, 0xff, REG, op @, _reg @, [34;49m[33;40mREX_B[34;49m[34;49m | MODRM_B, 0, 0, 0, 0, 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREX_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 444.74[32;49m
0x7ffff72fe872    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe87c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe880    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.076 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m Compile_CalcWrite_Instruction_X64 ( 0, 0xff, REG, op @, _reg @, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B, 0, 0, 0, 0, 0 ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 444.083 : X64 :> [33;40mMODRM_B[34;49m <: 0x00007ffff5c7ead8 :> [34;49mWrite_Instruction_X64 ( 0, 0xff, REG, op @, _reg @, REX_B | [34;49m[33;40mMODRM_B[34;49m[34;49m, 0, 0, 0, 0, 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mMODRM_B[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 444.83[32;49m
0x7ffff72fe883    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe88d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe891    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.083 : Bits :> [33;40m|[34;49m <: cprimitive :> [34;49m Compile_CalcWrite_Instruction_X64 ( 0, 0xff, REG, op @, _reg @, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B, 0, 0, 0, 0, 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m|[34;49m <:   38 bytes : at namespaces/compiler/x64.cft : 444.83
[34;49m .. 4 ( 0, 0xff, REG, op @, _reg @, REX_B [34;49m[33;40m|[34;49m[34;49m MODRM_B[34;49m[32;49m
0x7ffff72fe883    48b80200000000000000    mov rax, 0x2                                           [34;49m[32;49m
0x7ffff72fe88d    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe891    498906                  mov [r14], rax                                         [34;49m[32;49m
0x7ffff72fe894    498b0e                  mov rcx, [r14]                                         [34;49m[32;49m
0x7ffff72fe897    498b46f8                mov rax, [r14-0x8]                                     [34;49m[32;49m
0x7ffff72fe89b    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe89f    480bc1                  or rax, rcx                                            [34;49m[32;49m
0x7ffff72fe8a2    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe8a6    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.086 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7384ad5 :> [34;49mWrite_Instruction_X64 ( 0, 0xff, REG, op @, _reg @, REX_B | MODRM_B, [34;49m[33;40m0[34;49m[34;49m, 0, 0, 0, 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 444.86
[34;49m .. , REG, op @, _reg @, REX_B | MODRM_B, [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe8a9    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe8b3    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe8b7    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 444.100 : void :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <: 0x00007ffff5c85298 :> [34;49m    [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xff, REG, op @[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 444.100[39;49m :
TypeWordStack depth =  10 :  = Top = 0x00007ffff7fc1a70, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a70 > = 0x00007ffff73852c1	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a68 > = 0x00007ffff73850c6	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a60 > = 0x00007ffff7384ecb	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a58 > = 0x00007ffff7384cd0	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a50 > = 0x00007ffff7384ad5	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5bbfbb0	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -6 ] < 0x00007ffff7fc1a40 > = 0x00007ffff5bbfd78	< word : locals_0.[34;49mop[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -7 ] < 0x00007ffff7fc1a38 > = 0x00007ffff74b3f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -8 ] < 0x00007ffff7fc1a30 > = 0x00007ffff73848da	< word : <literal>.[34;49m0xff[39;49m : value = 0x00000000000000ff > : [34;49mInteger [39;49m
  TypeWordStack   [  -9 ] < 0x00007ffff7fc1a28 > = 0x00007ffff73846df	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: void.Compile_CalcWrite_Instruction_X64 :: type expected :  :: type recorded : Integer . Integer . Integer . Undefined . Undefined . Integer . Integer . Integer . Integer . Integer  : namespaces/compiler/x64.cft : 444.100
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCompile_CalcWrite_Instruction_X64[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 444.100
[34;49m ..    : _Compile_IncDec_Reg ( op, _reg ) [34;49m[33;40mCompile_CalcWrite_Instruction_X64[34;49m[34;49m ( 0, 0xff, REG, op @, _reg @, REX_B | MODRM_B, 0, 0, 0, 0, 0 ) .. [34;49m[32;49m
0x7ffff72fe8fe    49b983db2ff7ff7f0000    mov r9, 0x7ffff72fdb83                                 [34;49m[32;49m
0x7ffff72fe908    49ffd1                  call r9                    	< void.[39;49mCompile_CalcWrite_Instruction_X64[34;49m : 0x00007ffff72fdb83 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 445.003 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b2d18 :> [34;49m[34;49m[33;40m;;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 445.3
[34;49m ..  @, REX_B | MODRM_B, 0, 0, 0, 0, 0 )  [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe90b    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe90f    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe913    4983ee10                sub r14, 0x10                                          [34;49m[32;49m
0x7ffff72fe917    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 445.3 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 447.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m _Compile_MoveTOS_To_R8D () _Compile_Move_DataStackN_ToReg ( R8D, 0 ) ;; // _Compile_Move ( REG,[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 447.28[32;49m
0x7ffff72fe918    e900000000              jmp 0x7ffff72fe91d         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe91d    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe921    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe925    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 447.28 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc04d0[34;49m.
dbg[c]  :: [34;49m...[34;49m : 447.060 : void :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <: 0x00007ffff5c860d8 :> [34;49meTOS_To_R8D () [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( R8D, 0 ) ;; /[34;49m 
dbg[c]  :: [34;49m...[34;49m : 447.065 : X64 :> [33;40mR8D[34;49m <: 0x00007ffff5c7b3a0 :> [34;49mTo_R8D () _Compile_Move_DataStackN_ToReg ( [34;49m[33;40mR8D[34;49m[34;49m, 0 ) ;; // _Compile_Move ( REG, 0, EAX, DS[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mR8D[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 447.65
[34;49m .. D () _Compile_Move_DataStackN_ToReg ( [34;49m[33;40mR8D[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe92c    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fe936    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe93a    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 447.069 : <literal> :> [33;40m0[34;49m <: 0x00007ffff73854ef :> [34;49m () _Compile_Move_DataStackN_ToReg ( R8D, [34;49m[33;40m0[34;49m[34;49m ) ;; // _Compile_Move ( REG, 0, EAX, DSP,[34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 447.69
[34;49m .. _Compile_Move_DataStackN_ToReg ( R8D, [34;49m[33;40m0[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe93d    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe947    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe94b    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 447.070 : void :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <: 0x00007ffff5c860d8 :> [34;49meTOS_To_R8D () [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( R8D, 0 ) ;; /[34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 447.70[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff73854ef	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7b3a0	< word : X64.[34;49mR8D[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
type match :: void._Compile_Move_DataStackN_ToReg :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 447.70
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 447.70
[34;49m ..          : _Compile_MoveTOS_To_R8D () [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( R8D, 0 ) .. [34;49m[32;49m
0x7ffff72fe94e    49b900de2ff7ff7f0000    mov r9, 0x7ffff72fde00                                 [34;49m[32;49m
0x7ffff72fe958    49ffd1                  call r9                    	< void.[39;49m_Compile_Move_DataStackN_ToReg[34;49m : 0x00007ffff72fde00 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 447.074 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b2d18 :> [34;49m () _Compile_Move_DataStackN_ToReg ( R8D, 0 ) [34;49m[33;40m;;[34;49m[34;49m // _Compile_Move ( REG, 0, EAX, DSP, 0 ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 447.74
[34;49m .. pile_Move_DataStackN_ToReg ( R8D, 0 ) [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe95b    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 447.74 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 447.076 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m () _Compile_Move_DataStackN_ToReg ( R8D, 0 ) ;; [34;49m[33;40m//[34;49m[34;49m _Compile_Move ( REG, 0, EAX, DSP, 0 ) [34;49m 
dbg[i]  :: [34;49m...[34;49m : 450.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m _Compile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( ADD, REG, DSP, 0, imm @, 1 ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 450.27[32;49m
0x7ffff72fe95c    e900000000              jmp 0x7ffff72fe961         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe961    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe965    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe969    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 450.27 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc06d0[34;49m.
dbg[c]  :: [34;49m...[34;49m : 450.054 : void :> [33;40m_Compile_Group1_Immediate[34;49m <: 0x00007ffff5c89bd8 :> [34;49mle_ADDI_DSP ( imm ) [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( ADD, REG, DSP, 0, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 450.059 : X64 :> [33;40mADD[34;49m <: 0x00007ffff5c7d740 :> [34;49m: _Compile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( [34;49m[33;40mADD[34;49m[34;49m, REG, DSP, 0, imm @, 1 ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mADD[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 450.59
[34;49m .. P ( imm ) _Compile_Group1_Immediate ( [34;49m[33;40mADD[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe970    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe97a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe97e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 450.064 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b3f20 :> [34;49m: _Compile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( ADD, [34;49m[33;40mREG[34;49m[34;49m, DSP, 0, imm @, 1 ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 450.64
[34;49m .. mm ) _Compile_Group1_Immediate ( ADD, [34;49m[33;40mREG[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe981    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fe98b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe98f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 450.069 : X64 :> [33;40mDSP[34;49m <: 0x00007ffff5c7c1e0 :> [34;49m: _Compile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( ADD, REG, [34;49m[33;40mDSP[34;49m[34;49m, 0, imm @, 1 ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDSP[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 450.69
[34;49m .. _Compile_Group1_Immediate ( ADD, REG, [34;49m[33;40mDSP[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe992    48b80e00000000000000    mov rax, 0xe                                           [34;49m[32;49m
0x7ffff72fe99c    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe9a0    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 450.072 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7385750 :> [34;49mCompile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( ADD, REG, DSP, [34;49m[33;40m0[34;49m[34;49m, imm @, 1 ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 450.72
[34;49m .. ile_Group1_Immediate ( ADD, REG, DSP, [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe9a3    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fe9ad    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe9b1    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 450.078 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5bc0a98 :> [34;49mompile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( ADD, REG, DSP, 0, [34;49m[33;40mimm[34;49m[34;49m @, 1 ) ;; [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 450.78
[34;49m .. _Group1_Immediate ( ADD, REG, DSP, 0, [34;49m[33;40mimm[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe9b4    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe9b8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe9bc    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 450.079 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49m: _Compile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( ADD, REG, DSP, 0, imm [34;49m[33;40m@[34;49m[34;49m, 1 ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 450.79
[34;49m .. up1_Immediate ( ADD, REG, DSP, 0, imm [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe9b4    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe9b8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe9bc    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 450.083 : <literal> :> [33;40m1[34;49m <: 0x00007ffff738594b :> [34;49mCompile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( ADD, REG, DSP, 0, imm @, [34;49m[33;40m1[34;49m[34;49m ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m1[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 450.83
[34;49m .. _Immediate ( ADD, REG, DSP, 0, imm @, [34;49m[33;40m1[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe9bf    48b80100000000000000    mov rax, 0x1                                           [34;49m[32;49m
0x7ffff72fe9c9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe9cd    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 450.084 : void :> [33;40m_Compile_Group1_Immediate[34;49m <: 0x00007ffff5c89bd8 :> [34;49mle_ADDI_DSP ( imm ) [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( ADD, REG, DSP, 0, [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 450.84[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff738594b	< word : <literal>.[34;49m1[39;49m : value = 0x0000000000000001 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5bc0a98	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff7385750	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c7c1e0	< word : X64.[34;49mDSP[39;49m : value = 0x000000000000000e > : [34;49mInteger [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b3f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7d740	< word : X64.[34;49mADD[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
type match :: void._Compile_Group1_Immediate :: type expected : Integer . Integer  :: type recorded : Integer . Integer . Integer . Undefined . Integer  : namespaces/compiler/x64.cft : 450.84
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Group1_Immediate[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 450.84
[34;49m ..           : _Compile_ADDI_DSP ( imm ) [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( ADD, REG, DSP, 0, imm @, 1 ) .. [34;49m[32;49m
0x7ffff72fe9d0    49b9e2de2ff7ff7f0000    mov r9, 0x7ffff72fdee2                                 [34;49m[32;49m
0x7ffff72fe9da    49ffd1                  call r9                    	< void.[39;49m_Compile_Group1_Immediate[34;49m : 0x00007ffff72fdee2 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 450.088 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b2d18 :> [34;49m: _Compile_ADDI_DSP ( imm ) _Compile_Group1_Immediate ( ADD, REG, DSP, 0, imm @, 1 ) [34;49m[33;40m;;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 450.88
[34;49m .. ediate ( ADD, REG, DSP, 0, imm @, 1 ) [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fe9dd    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fe9e1    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe9e5    4983ee08                sub r14, 0x8                                           [34;49m[32;49m
0x7ffff72fe9e9    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 450.88 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 452.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m _Compile_CMP_REG_IMM ( _reg, imm, isize ) _Compile_Group1_Immediate ( CMP, REG, _reg @, 0, imm [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 452.43[32;49m
0x7ffff72fe9ea    e900000000              jmp 0x7ffff72fe9ef         	< C compiler code >        [34;49m[32;49m
0x7ffff72fe9ef    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fe9f3    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fe9f7    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 452.43 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc0c60[34;49m.
dbg[c]  :: [34;49m...[34;49m : 452.070 : void :> [33;40m_Compile_Group1_Immediate[34;49m <: 0x00007ffff5c89bd8 :> [34;49m _reg, imm, isize ) [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( CMP, REG, _reg @, [34;49m 
dbg[c]  :: [34;49m...[34;49m : 452.075 : X64 :> [33;40mCMP[34;49m <: 0x00007ffff5c7dad0 :> [34;49m _reg, imm, isize ) _Compile_Group1_Immediate ( [34;49m[33;40mCMP[34;49m[34;49m, REG, _reg @, 0, imm @, isize @ ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCMP[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 452.75
[34;49m .. , isize ) _Compile_Group1_Immediate ( [34;49m[33;40mCMP[34;49m[34;49m[34;49m[32;49m
0x7ffff72fe9fe    48b80700000000000000    mov rax, 0x7                                           [34;49m[32;49m
0x7ffff72fea08    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea0c    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.080 : X64 :> [33;40mREG[34;49m <: 0x00007ffff74b3f20 :> [34;49m _reg, imm, isize ) _Compile_Group1_Immediate ( CMP, [34;49m[33;40mREG[34;49m[34;49m, _reg @, 0, imm @, isize @ ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mREG[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 452.80
[34;49m .. ze ) _Compile_Group1_Immediate ( CMP, [34;49m[33;40mREG[34;49m[34;49m[34;49m[32;49m
0x7ffff72fea0f    48b80300000000000000    mov rax, 0x3                                           [34;49m[32;49m
0x7ffff72fea19    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea1d    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.087 : locals_0 :> [33;40m_reg[34;49m <: 0x00007ffff5bc1028 :> [34;49m imm, isize ) _Compile_Group1_Immediate ( CMP, REG, [34;49m[33;40m_reg[34;49m[34;49m @, 0, imm @, isize @ ) ;; [34;49m 
_Do_C_Syntax_Variable : word = _reg :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_reg[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 452.87
[34;49m .. _Compile_Group1_Immediate ( CMP, REG, [34;49m[33;40m_reg[34;49m[34;49m [34;49m[32;49m
0x7ffff72fea20    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fea24    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea28    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.088 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49mIMM ( _reg, imm, isize ) _Compile_Group1_Immediate ( CMP, REG, _reg [34;49m[33;40m@[34;49m[34;49m, 0, imm @, isize @ ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 452.88
[34;49m .. ile_Group1_Immediate ( CMP, REG, _reg [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fea20    498b47e8                mov rax, [r15-0x18]                                    [34;49m[32;49m
0x7ffff72fea24    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea28    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.091 : <literal> :> [33;40m0[34;49m <: 0x00007ffff7385c12 :> [34;49mg, imm, isize ) _Compile_Group1_Immediate ( CMP, REG, _reg @, [34;49m[33;40m0[34;49m[34;49m, imm @, isize @ ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 452.91
[34;49m .. _Group1_Immediate ( CMP, REG, _reg @, [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72fea2b    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72fea35    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea39    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.097 : locals_0 :> [33;40mimm[34;49m <: 0x00007ffff5bc11f0 :> [34;49m, imm, isize ) _Compile_Group1_Immediate ( CMP, REG, _reg @, 0, [34;49m[33;40mimm[34;49m[34;49m @, isize @ ) ;; [34;49m 
_Do_C_Syntax_Variable : word = imm :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mimm[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 452.97
[34;49m .. oup1_Immediate ( CMP, REG, _reg @, 0, [34;49m[33;40mimm[34;49m[34;49m [34;49m[32;49m
0x7ffff72fea3c    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fea40    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea44    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.098 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49mIMM ( _reg, imm, isize ) _Compile_Group1_Immediate ( CMP, REG, _reg @, 0, imm [34;49m[33;40m@[34;49m[34;49m, isize @ ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 452.98
[34;49m .. _Immediate ( CMP, REG, _reg @, 0, imm [34;49m[33;40m@[34;49m[34;49m[34;49m[32;49m
0x7ffff72fea3c    498b47f0                mov rax, [r15-0x10]                                    [34;49m[32;49m
0x7ffff72fea40    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea44    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.106 : locals_0 :> [33;40misize[34;49m <: 0x00007ffff5bc13b8 :> [34;49mimm, isize ) _Compile_Group1_Immediate ( CMP, REG, _reg @, 0, imm @, [34;49m[33;40misize[34;49m[34;49m @ ) ;; [34;49m 
_Do_C_Syntax_Variable : word = isize :: rvalue compiled
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40misize[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 452.106
[34;49m .. mediate ( CMP, REG, _reg @, 0, imm @, [34;49m[33;40misize[34;49m[34;49m [34;49m[32;49m
0x7ffff72fea47    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fea4b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea4f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.108 : Compiler :> [33;40m@[34;49m <: cprimitive :> [34;49mIMM ( _reg, imm, isize ) _Compile_Group1_Immediate ( CMP, REG, _reg @, 0, imm @, isize [34;49m[33;40m@[34;49m[34;49m ) ;; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m@[34;49m <:   11 bytes : at namespaces/compiler/x64.cft : 452.108
[34;49m .. e ( CMP, REG, _reg @, 0, imm @, isize [34;49m[33;40m@[34;49m[34;49m [34;49m[32;49m
0x7ffff72fea47    498b47f8                mov rax, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fea4b    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea4f    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 452.109 : void :> [33;40m_Compile_Group1_Immediate[34;49m <: 0x00007ffff5c89bd8 :> [34;49m _reg, imm, isize ) [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( CMP, REG, _reg @, [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 452.109[39;49m :
TypeWordStack depth =   6 :  = Top = 0x00007ffff7fc1a50, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a50 > = 0x00007ffff5bc13b8	< word : locals_0.[34;49misize[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a48 > = 0x00007ffff5bc11f0	< word : locals_0.[34;49mimm[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a40 > = 0x00007ffff7385c12	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -3 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5bc1028	< word : locals_0.[34;49m_reg[39;49m : value = 0x0000000000000000 > : [34;49mUndefined [39;49m
  TypeWordStack   [  -4 ] < 0x00007ffff7fc1a30 > = 0x00007ffff74b3f20	< word : X64.[34;49mREG[39;49m : value = 0x0000000000000003 > : [34;49mInteger [39;49m
  TypeWordStack   [  -5 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7dad0	< word : X64.[34;49mCMP[39;49m : value = 0x0000000000000007 > : [34;49mInteger [39;49m
type match :: void._Compile_Group1_Immediate :: type expected : Integer . Integer  :: type recorded : Integer . Undefined . Integer . Undefined . Undefined  : namespaces/compiler/x64.cft : 452.109
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Group1_Immediate[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 452.109
[34;49m .. pile_CMP_REG_IMM ( _reg, imm, isize ) [34;49m[33;40m_Compile_Group1_Immediate[34;49m[34;49m ( CMP, REG, _reg @, 0, imm @, isize @ )[34;49m[32;49m
0x7ffff72fea52    49b9e2de2ff7ff7f0000    mov r9, 0x7ffff72fdee2                                 [34;49m[32;49m
0x7ffff72fea5c    49ffd1                  call r9                    	< void.[39;49m_Compile_Group1_Immediate[34;49m : 0x00007ffff72fdee2 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 452.113 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b2d18 :> [34;49m( _reg, imm, isize ) _Compile_Group1_Immediate ( CMP, REG, _reg @, 0, imm @, isize @ ) [34;49m[33;40m;;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 452.113
[34;49m .. CMP, REG, _reg @, 0, imm @, isize @ ) [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72fea5f    4d8d77f8                lea r14, [r15-0x8]                                     [34;49m[32;49m
0x7ffff72fea63    4d8b7e08                mov r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fea67    4983ee18                sub r14, 0x18                                          [34;49m[32;49m
0x7ffff72fea6b    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 452.113 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 454.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m Compile_Stack_Push_R8D () [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 454.27[32;49m
0x7ffff72fea6c    e900000000              jmp 0x7ffff72fea71         	< C compiler code >        [34;49m[32;49m
0x7ffff72fea71    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72fea75    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72fea79    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 454.27 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc1910[34;49m.
dbg[c]  :: [34;49m...[34;49m : 455.022 : Bits :> [33;40m_Compile_ADDI_DSP[34;49m <: 0x00007ffff5bc06d0 :> [34;49m    [34;49m[33;40m_Compile_ADDI_DSP[34;49m[34;49m ( CELL ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 455.029 : X64 :> [33;40mCELL[34;49m <: 0x00007ffff5c7e028 :> [34;49m    _Compile_ADDI_DSP ( [34;49m[33;40mCELL[34;49m[34;49m ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCELL[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 455.29
[34;49m .. Stack_Push_R8D () _Compile_ADDI_DSP ( [34;49m[33;40mCELL[34;49m[34;49m [34;49m[32;49m
0x7ffff72fea80    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72fea8a    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72fea8e    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 455.030 : Bits :> [33;40m_Compile_ADDI_DSP[34;49m <: 0x00007ffff5bc06d0 :> [34;49m    [34;49m[33;40m_Compile_ADDI_DSP[34;49m[34;49m ( CELL ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 455.30[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7e028	< word : X64.[34;49mCELL[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
type match :: Bits._Compile_ADDI_DSP :: type expected :  :: type recorded : Integer  : namespaces/compiler/x64.cft : 455.30
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_ADDI_DSP[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 455.30
[34;49m ..           : Compile_Stack_Push_R8D () [34;49m[33;40m_Compile_ADDI_DSP[34;49m[34;49m ( CELL ) .. [34;49m[32;49m
0x7ffff72fea91    49b961e92ff7ff7f0000    mov r9, 0x7ffff72fe961                                 [34;49m[32;49m
0x7ffff72fea9b    49ffd1                  call r9                    	< Bits.[39;49m_Compile_ADDI_DSP[34;49m : 0x00007ffff72fe961 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 456.032 : void :> [33;40m_Compile_Move_Reg_To_StackN[34;49m <: 0x00007ffff5c94778 :> [34;49m    [34;49m[33;40m_Compile_Move_Reg_To_StackN[34;49m[34;49m ( DSP, 0, R8D ) [34;49m 
dbg[c]  :: [34;49m...[34;49m : 456.037 : X64 :> [33;40mDSP[34;49m <: 0x00007ffff5c7c1e0 :> [34;49m    _Compile_Move_Reg_To_StackN ( [34;49m[33;40mDSP[34;49m[34;49m, 0, R8D ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mDSP[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 456.37
[34;49m .. CELL )  _Compile_Move_Reg_To_StackN ( [34;49m[33;40mDSP[34;49m[34;49m[34;49m[32;49m
0x7ffff72fea9e    48b80e00000000000000    mov rax, 0xe                                           [34;49m[32;49m
0x7ffff72feaa8    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72feaac    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 456.040 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5bc1580 :> [34;49m    _Compile_Move_Reg_To_StackN ( DSP, [34;49m[33;40m0[34;49m[34;49m, R8D ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m0[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 456.40
[34;49m .. )  _Compile_Move_Reg_To_StackN ( DSP, [34;49m[33;40m0[34;49m[34;49m[34;49m[32;49m
0x7ffff72feaaf    48b80000000000000000    mov rax, 0x0                                           [34;49m[32;49m
0x7ffff72feab9    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72feabd    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 456.046 : X64 :> [33;40mR8D[34;49m <: 0x00007ffff5c7b3a0 :> [34;49m    _Compile_Move_Reg_To_StackN ( DSP, 0, [34;49m[33;40mR8D[34;49m[34;49m ) [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mR8D[34;49m <:   17 bytes : at namespaces/compiler/x64.cft : 456.46
[34;49m .. _Compile_Move_Reg_To_StackN ( DSP, 0, [34;49m[33;40mR8D[34;49m[34;49m [34;49m[32;49m
0x7ffff72feac0    48b80800000000000000    mov rax, 0x8                                           [34;49m[32;49m
0x7ffff72feaca    4983c608                add r14, 0x8                                           [34;49m[32;49m
0x7ffff72feace    498906                  mov [r14], rax                                         [34;49m
dbg[c]  :: [34;49m...[34;49m : 456.047 : void :> [33;40m_Compile_Move_Reg_To_StackN[34;49m <: 0x00007ffff5c94778 :> [34;49m    [34;49m[33;40m_Compile_Move_Reg_To_StackN[34;49m[34;49m ( DSP, 0, R8D ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 456.47[39;49m :
TypeWordStack depth =   3 :  = Top = 0x00007ffff7fc1a38, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a38 > = 0x00007ffff5c7b3a0	< word : X64.[34;49mR8D[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5bc1580	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -2 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7c1e0	< word : X64.[34;49mDSP[39;49m : value = 0x000000000000000e > : [34;49mInteger [39;49m
type match :: void._Compile_Move_Reg_To_StackN :: type expected :  :: type recorded : Integer  : namespaces/compiler/x64.cft : 456.47
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move_Reg_To_StackN[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 456.47
[34;49m .. sh_R8D () _Compile_ADDI_DSP ( CELL )  [34;49m[33;40m_Compile_Move_Reg_To_StackN[34;49m[34;49m ( DSP, 0, R8D )[34;49m[32;49m
0x7ffff72fead1    49b9f6e42ff7ff7f0000    mov r9, 0x7ffff72fe4f6                                 [34;49m[32;49m
0x7ffff72feadb    49ffd1                  call r9                    	< void.[39;49m_Compile_Move_Reg_To_StackN[34;49m : 0x00007ffff72fe4f6 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 457.003 : Asm :> [33;40m;;[34;49m <: 0x00007ffff74b2d18 :> [34;49m[34;49m[33;40m;;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 457.3
[34;49m .. e_Move_Reg_To_StackN ( DSP, 0, R8D )  [34;49m[33;40m;;[34;49m[34;49m [34;49m[32;49m
0x7ffff72feade    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 457.3 :> [39;49m;;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 459.005 : Root :> [33;40mUser[34;49m <: 0x00007ffff728e410 :> [34;49m[34;49m[33;40mUser[34;49m[34;49m [34;49m 
dbg[i]  :: [34;49m...[34;49m : 460.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m sp ; [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 460.7[32;49m
0x7ffff72feadf    e900000000              jmp 0x7ffff72feae4         	< C compiler code >        [34;49m
[34;49m ..                                     : [34;49m[33;40msp[34;49m[34;49m ;  .. [34;49m[32;49m
0x7ffff72feae4    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72feae8    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72feaec    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 460.7 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc1b10[34;49m.
dbg[c]  :: [34;49m...[34;49m : 460.007 : Interpreter :> [33;40m;[34;49m <: 0x00007ffff7294bd0 :> [34;49m: sp [34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 460.7
[34;49m ..                                  : sp [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72feaf3    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 460.7 :> [39;49m;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 461.002 : Infix :> [33;40m:[34;49m <: cprimitive :> [34;49m[34;49m[33;40m:[34;49m[34;49m qeval [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 462.8[32;49m
0x7ffff72feaf4    e900000000              jmp 0x7ffff72feaf9         	< C compiler code >        [34;49m
[34;49m ..                                     : [34;49m[33;40mqeval[34;49m[34;49m stk  .. [34;49m[32;49m
0x7ffff72feaf9    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72feafd    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72feb01    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 462.8 :> [39;49m:[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc1cd8[34;49m.
dbg[c]  :: [34;49m...[34;49m : 462.008 : System :> [33;40mstk[34;49m <: 0x00007ffff71f5540 :> [34;49m    [34;49m[33;40mstk[34;49m[34;49m iax [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mstk[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 462.8
[34;49m ..                               : qeval [34;49m[33;40mstk[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72feb08    49b9a7442ff7ff7f0000    mov r9, 0x7ffff72f44a7                                 [34;49m[32;49m
0x7ffff72feb12    49ffd1                  call r9                    	< System.[39;49mstk[34;49m : 0x00007ffff72f44a7 >[34;49m
dbg[c]  :: [34;49m...[34;49m : 462.012 : Combinators :> [33;40miax[34;49m <: 0x00007ffff5bbef00 :> [34;49m    stk [34;49m[33;40miax[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40miax[34;49m <:   13 bytes : at namespaces/compiler/x64.cft : 462.12
[34;49m ..                           : qeval stk [34;49m[33;40miax[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72feb15    49b99de72ff7ff7f0000    mov r9, 0x7ffff72fe79d                                 [34;49m[32;49m
0x7ffff72feb1f    49ffd1                  call r9                    	< Combinators.[39;49miax[34;49m : 0x00007ffff72fe79d >[34;49m
dbg[c]  :: [34;49m...[34;49m : 463.002 : Interpreter :> [33;40m;[34;49m <: 0x00007ffff7294bd0 :> [34;49m[34;49m[33;40m;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 463.2
[34;49m ..                       : qeval stk iax [34;49m[33;40m;[34;49m[34;49m  .. [34;49m[32;49m
0x7ffff72feb22    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 463.2 :> [39;49m;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 464.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49m qeval find wdiss // sp [34;49m 
Stack : word at namespaces/compiler/x64.cft : 464.8 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff6ec52c2[34;49m.
dbg[i]  :: [34;49m...[34;49m : 464.013 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m' qeval [34;49m[33;40mfind[34;49m[34;49m wdiss // sp [34;49m 
Stack : word at namespaces/compiler/x64.cft : 464.13 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff5bc1cd8[34;49m.
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
starting at address : 0xf72feb08 -- code size = 27 bytes
Word :: User.[34;49mqeval[39;49m : definition = 0x00007ffff72feb08 : disassembly at namespaces/compiler/x64.cft : 464.19 :
[34;49m ..                               : qeval [39;49m[33;40mstk[39;49m[34;49m iax ;  .. [39;49m[32;49m
0x7ffff72feb08    49b9a7442ff7ff7f0000    mov r9, 0x7ffff72f44a7                                 [39;49m[32;49m
0x7ffff72feb12    49ffd1                  call r9                    	< System.[34;49mstk[39;49m : 0x00007ffff72f44a7 >[39;49m
[34;49m ..                           : qeval stk [39;49m[33;40miax[39;49m[34;49m ;  .. [39;49m[32;49m
0x7ffff72feb15    49b99de72ff7ff7f0000    mov r9, 0x7ffff72fe79d                                 [39;49m[32;49m
0x7ffff72feb1f    49ffd1                  call r9                    	< Combinators.[34;49miax[39;49m : 0x00007ffff72fe79d >[39;49m
[34;49m ..                       : qeval stk iax [39;49m[33;40m;[39;49m[34;49m  .. [39;49m[32;49m
0x7ffff72feb22    c3                      ret                                                    [39;49m
Word_Disassemble : word - 'qeval' :: codeSize = 260x00007ffff72692380x00007ffff72feb0846419
Stack : word at namespaces/compiler/x64.cft : 464.19 :> [39;49mwdiss[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 464.021 : Interpreter :> [33;40m//[34;49m <: cprimitive :> [34;49m' qeval find wdiss [34;49m[33;40m//[34;49m[34;49m sp [34;49m 
dbg[i]  :: [34;49m...[34;49m : 466.005 : Asm :> [33;40m:asm[34;49m <: 0x00007ffff74b2268 :> [34;49m[34;49m[33;40m:asm[34;49m[34;49m stest [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m:asm[34;49m <:   20 bytes : at namespaces/compiler/x64.cft : 466.11[32;49m
0x7ffff72feb23    e900000000              jmp 0x7ffff72feb28         	< C compiler code >        [34;49m
[34;49m ..                                       [34;49m[33;40mstest[34;49m[34;49mal stk iax ;  .. [34;49m[32;49m
0x7ffff72feb28    4d897e08                mov [r14+0x8], r15                                     [34;49m[32;49m
0x7ffff72feb2c    4d8d7e08                lea r15, [r14+0x8]                                     [34;49m[32;49m
0x7ffff72feb30    4981c608000000          add r14, 0x8                                           [34;49m
Stack : word at namespaces/compiler/x64.cft : 466.11 :> [39;49m:asm[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff5bc1ea0[34;49m.
dbg[i]  :: [34;49m...[34;49m : 467.028 : Bits :> [33;40m_Compile_MoveTOS_To_R8D[34;49m <: 0x00007ffff5bc04d0 :> [34;49m    [34;49m[33;40m_Compile_MoveTOS_To_R8D[34;49m[34;49m ( ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 467.31[39;49m :
TypeWordStack depth =   0 :  = Top = 0x00007ffff7fc1a20, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
type match :: Bits._Compile_MoveTOS_To_R8D :: type expected :  :: type recorded :  : namespaces/compiler/x64.cft : 467.31
_Compile_Write_Instruction_X64 : 7ffff72feb37 : 4 bytes : ...
[34;49m ..                            : qeval stk[39;49m[33;40m_Compile_MoveTOS_To_R8D[39;49m[34;49m .. [39;49m[32;49m
0x7ffff72feb37    4c8bcd                  mov r9, rbp                                            [39;49m[32;49m
0x7ffff72feb3a    00                      invalid                                                [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_MoveTOS_To_R8D[34;49m <:    4 bytes : at namespaces/compiler/x64.cft : 467.31[32;49m
0x7ffff72feb37    4c8bcd                  mov r9, rbp                                            [34;49m[32;49m
0x7ffff72feb3a    00                      invalid                                                [34;49m
dbg[i]  :: [34;49m...[34;49m : 468.035 : void :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <: 0x00007ffff5c860d8 :> [34;49m    [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( R8D, 0 ) [34;49m 
dbg[i]  :: [34;49m...[34;49m : 468.040 : X64 :> [33;40mR8D[34;49m <: 0x00007ffff5c7b3a0 :> [34;49m    _Compile_Move_DataStackN_ToReg ( [34;49m[33;40mR8D[34;49m[34;49m, 0 ) [34;49m 
Stack : word at namespaces/compiler/x64.cft : 468.40 :> [39;49mR8D[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000008[34;49m.
dbg[i]  :: [34;49m...[34;49m : 468.044 : <literal> :> [33;40m0[34;49m <: 0x00007ffff5cf6018 :> [34;49m    _Compile_Move_DataStackN_ToReg ( R8D, [34;49m[33;40m0[34;49m[34;49m ) [34;49m 
Stack : word at namespaces/compiler/x64.cft : 468.44 :> [39;49m0[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000000[34;49m.
Literal :> 0x0000000000000000 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 468.045 : void :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <: 0x00007ffff5c860d8 :> [34;49m    [34;49m[33;40m_Compile_Move_DataStackN_ToReg[34;49m[34;49m ( R8D, 0 ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 468.45[39;49m :
TypeWordStack depth =   2 :  = Top = 0x00007ffff7fc1a30, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a30 > = 0x00007ffff5cf6018	< word : <literal>.[34;49m0[39;49m : value = 0x0000000000000000 > : [34;49mInteger [39;49m
  TypeWordStack   [  -1 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7b3a0	< word : X64.[34;49mR8D[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
type match :: void._Compile_Move_DataStackN_ToReg :: type expected : Integer . Integer  :: type recorded : Integer . Integer  : namespaces/compiler/x64.cft : 468.45
_Compile_Write_Instruction_X64 : 7ffff72feb3b : 4 bytes : ...
[34;49m .. : qeval stk iax ; [39;49m[33;40m_Compile_Move_DataStackN_ToReg[39;49m[34;49m .. [39;49m[32;49m
0x7ffff72feb3b    4c8bcd                  mov r9, rbp                                            [39;49m[32;49m
0x7ffff72feb3e    00                      invalid                                                [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_Move_DataStackN_ToReg[34;49m <:    4 bytes : at namespaces/compiler/x64.cft : 468.45[32;49m
0x7ffff72feb3b    4c8bcd                  mov r9, rbp                                            [34;49m[32;49m
0x7ffff72feb3e    00                      invalid                                                [34;49m
Stack : word at namespaces/compiler/x64.cft : 468.45 :> [39;49m_Compile_Move_DataStackN_ToReg[34;49m <: 2 cells popped. TOS changed to [39;49m0x00007ffff5bc1ea0[34;49m.
dbg[i]  :: [34;49m...[34;49m : 469.027 : Bits :> [33;40mCompile_Stack_Push_R8D[34;49m <: 0x00007ffff5bc1910 :> [34;49m    [34;49m[33;40mCompile_Stack_Push_R8D[34;49m[34;49m ( ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 469.30[39;49m :
TypeWordStack depth =   0 :  = Top = 0x00007ffff7fc1a20, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
type match :: Bits.Compile_Stack_Push_R8D :: type expected :  :: type recorded :  : namespaces/compiler/x64.cft : 469.30
_Compile_Write_Instruction_X64 : 7ffff72feb3f : 4 bytes : ...
[34;49m: qeval stk iax ; [39;49m[33;40mCompile_Stack_Push_R8D[39;49m[34;49m .. [39;49m[32;49m
0x7ffff72feb3f    4c83cd00                or rbp, 0x0                                            [39;49m
_Compile_Write_Instruction_X64 : 7ffff72feb43 : 4 bytes : ...[32;49m
0x7ffff72feb43    4c89cd                  mov rbp, r9                                            [39;49m[32;49m
0x7ffff72feb46    00                      invalid                                                [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40mCompile_Stack_Push_R8D[34;49m <:    8 bytes : at namespaces/compiler/x64.cft : 469.30[32;49m
0x7ffff72feb3f    4c83cd00                or rbp, 0x0                                            [34;49m[32;49m
0x7ffff72feb43    4c89cd                  mov rbp, r9                                            [34;49m[32;49m
0x7ffff72feb46    00                      invalid                                                [34;49m
dbg[i]  :: [34;49m...[34;49m : 470.022 : void :> [33;40m_Compile_SUBI_DSP[34;49m <: 0x00007ffff5c909d0 :> [34;49m    [34;49m[33;40m_Compile_SUBI_DSP[34;49m[34;49m ( CELL ) [34;49m 
dbg[i]  :: [34;49m...[34;49m : 470.029 : X64 :> [33;40mCELL[34;49m <: 0x00007ffff5c7e028 :> [34;49m    _Compile_SUBI_DSP ( [34;49m[33;40mCELL[34;49m[34;49m ) [34;49m 
Stack : word at namespaces/compiler/x64.cft : 470.29 :> [39;49mCELL[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000008[34;49m.
dbg[i]  :: [34;49m...[34;49m : 470.030 : void :> [33;40m_Compile_SUBI_DSP[34;49m <: 0x00007ffff5c909d0 :> [34;49m    [34;49m[33;40m_Compile_SUBI_DSP[34;49m[34;49m ( CELL ) [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 470.30[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5c7e028	< word : X64.[34;49mCELL[39;49m : value = 0x0000000000000008 > : [34;49mInteger [39;49m
type match :: void._Compile_SUBI_DSP :: type expected :  :: type recorded : Integer  : namespaces/compiler/x64.cft : 470.30
_Compile_Write_Instruction_X64 : 7ffff72feb47 : 4 bytes : ...
[34;49m: qeval stk iax ; [39;49m[33;40m_Compile_SUBI_DSP[39;49m[34;49m .. [39;49m[32;49m
0x7ffff72feb47    4c83cd00                or rbp, 0x0                                            [39;49m
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40m_Compile_SUBI_DSP[34;49m <:    4 bytes : at namespaces/compiler/x64.cft : 470.30[32;49m
0x7ffff72feb47    4c83cd00                or rbp, 0x0                                            [34;49m
Stack : word at namespaces/compiler/x64.cft : 470.30 :> [39;49m_Compile_SUBI_DSP[34;49m <: 1 cell popped. TOS changed to [39;49m0x00007ffff5bc1ea0[34;49m.
dbg[i]  :: [34;49m...[34;49m : 471.005 : Asm :> [33;40masm;[34;49m <: 0x00007ffff74b2430 :> [34;49m[34;49m[33;40masm;[34;49m[34;49m [34;49m 
Code compiled to [39;49mCodeSpace[34;49m for word :> [33;40masm;[34;49m <:    1 bytes : at namespaces/compiler/x64.cft : 471.5
[34;49m .. _R8D ( )  _Compile_SUBI_DSP ( CELL )  [34;49m[33;40masm;[34;49m[34;49m [34;49m[32;49m
0x7ffff72feb4b    c3                      ret                                                    [34;49m
Stack : word at namespaces/compiler/x64.cft : 471.5 :> [39;49masm;[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 473.001 : Root :> [33;40m'[34;49m <: 0x00007ffff728db28 :> [34;49m[34;49m[33;40m'[34;49m[34;49m stest find wdiss //pause [34;49m 
Stack : word at namespaces/compiler/x64.cft : 473.8 :> [39;49m'[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff6ec5363[34;49m.
dbg[i]  :: [34;49m...[34;49m : 473.013 : Root :> [33;40mfind[34;49m <: 0x00007ffff728dcf0 :> [34;49m' stest [34;49m[33;40mfind[34;49m[34;49m wdiss //pause [34;49m 
Stack : word at namespaces/compiler/x64.cft : 473.13 :> [39;49mfind[34;49m <: TOS changed to [39;49m0x00007ffff5bc1ea0[34;49m.
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
starting at address : 0xf72feb37 -- code size = 21 bytes
Word :: User.[34;49mstest[39;49m : definition = 0x00007ffff72feb37 : disassembly at namespaces/compiler/x64.cft : 473.19 :
[34;49m ..                            :asm stest [39;49m[33;40m_Compile_MoveTOS_To_R8D[39;49m[34;49m ( )  _Compile_Move_DataStackN_ToReg ( R8D, 0 )  Compile_Stack_Push_R8D ( )  _Com .. [39;49m[32;49m
0x7ffff72feb37    4c8bcd                  mov r9, rbp                                            [39;49m[32;49m
0x7ffff72feb3a    004c8bcd                add [rbx+rcx*4-0x33], cl                               [39;49m[32;49m
0x7ffff72feb3e    004c83cd                add [rbx+rax*4-0x33], cl                               [39;49m[32;49m
0x7ffff72feb42    004c89cd                add [rcx+rcx*4-0x33], cl                               [39;49m[32;49m
0x7ffff72feb46    004c83cd                add [rbx+rax*4-0x33], cl                               [39;49m[32;49m
0x7ffff72feb4a    00c3                    add bl, al                                             [39;49m
Word_Disassemble : word - 'stest' :: codeSize = 190x00007ffff72692380x00007ffff72feb3747319
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
dbg[i]  :: [34;49m...[34;49m : 475.054 : <literal> :> [33;40m"\nthis is some purposefully funky code for testing\n"[34;49m <: 0x00007ffff5cf61e0 :> [34;49m[34;49m[33;40m"\nthis is some purposefully funky code for testing\n"[34;49m[34;49m[34;49m 
Stack : word at namespaces/compiler/x64.cft : 475.1 :> [39;49m"\nthis is some purposefully funky code for testing\n"[34;49m <: 1 cell pushed. TOS changed to [39;49m0x00007ffff72cafe9[34;49m.
Literal :> 0x00007ffff72cafe9 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 475.058 : Int :> [33;40mps[34;49m <: 0x00007ffff728e7d8 :> [34;49m"\nthis is some purposefully funky code for testing\n" [34;49m[33;40mps[34;49m[34;49m [34;49m 
TypeWordStack at : [34;49mnamespaces/compiler/x64.cft : 475.58[39;49m :
TypeWordStack depth =   1 :  = Top = 0x00007ffff7fc1a28, InitialTos = 0x00007ffff7fc1a20, Size = 0x0000000000000400
  TypeWordStack   [   0 ] < 0x00007ffff7fc1a28 > = 0x00007ffff5cf61e0	< word : <literal>.[34;49m"\nthis is some purposefully funky code for testing\n"[39;49m : value = 0x00007ffff72cafe9 > : [34;49mString [39;49m
type match :: Int.ps :: type expected : String  :: type recorded : String  : namespaces/compiler/x64.cft : 475.58
Stack : word at namespaces/compiler/x64.cft : 475.58 :> [39;49mps[34;49m <: 1 cell popped. TOS changed to [39;49m0x0000000000000005[34;49m.
dbg[i]  :: [34;49m...[34;49m : 477.001 : Interpreter :> [33;40m#[34;49m <: cprimitive :> [34;49m[34;49m[33;40m#[34;49m[34;49mif 1 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 477.004 : PreProcessor :> [33;40mif[34;49m <: cprimitive :> [34;49m#[34;49m[33;40mif[34;49m[34;49m 1 [34;49m 
dbg[i]  :: [34;49m...[34;49m : 477.006 : <literal> :> [33;40m1[34;49m <: 0x00007ffff5cf63a8 :> [34;49m#if [34;49m[33;40m1[34;49m[34;49m [34;49m 
Stack : word at namespaces/compiler/x64.cft : 477.6 :> [39;49m1[34;49m <: 1 cell pushed. TOS changed to [39;49m0x0000000000000001[34;49m.
Literal :> 0x0000000000000001 <: was pushed onto the stack ...
dbg[i]  :: [34;49m...[34;49m : 478.002 : User :> [33;40ms[34;49m <: cprimitive :> [34;49m[34;49m[33;40ms[34;49m[34;49m stest sp [34;49m 
DataStack at : [34;49mnamespaces/compiler/x64.cft : 478.2[39;49m :
DataStack depth =   4 : Dsp (R14) = Top = 0x00007ffff7269218, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -1 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269200 > = 0x0000000000000005	
dbg[i]  :: [34;49m...[34;49m : 478.008 : User :> [33;40mstest[34;49m <: 0x00007ffff5bc1ea0 :> [34;49ms [34;49m[33;40mstest[34;49m[34;49m sp [34;49m 
DataStack at : [34;49mnamespaces/compiler/x64.cft : 478.8[39;49m :
DataStack depth =   4 : Dsp (R14) = Top = 0x00007ffff7269218, InitialTos = 0x00007ffff72691f8, Size = 0x0000000000002000
  DataStack   [   0 ] < 0x00007ffff7269218 > = 0x0000000000000005	
  DataStack   [  -1 ] < 0x00007ffff7269210 > = 0x0000000000000005	
  DataStack   [  -2 ] < 0x00007ffff7269208 > = 0x0000000000000005	
  DataStack   [  -3 ] < 0x00007ffff7269200 > = 0x0000000000000005	
[i] Error : signal 11:: attempting address : 
0x0000000000000000:: [34;49m...[34;49m : 478.008 : User :> [33;40mstest[34;49m <: 0x00007ffff5bc1ea0 :> [34;49ms [34;49m[33;40mstest[34;49m[34;49m sp [34;49m 
OpenVmTil_SignalAction : address = 0x0000000000000000 : 
_OVT_Pause : Signals Handled = 1 : signal = 11 : restart condition = 1024

[i] Error : signal 11:: attempting address : 
0x0000000000000000:: [34;49m...[34;49m : 478.008 : User :> [33;40mstest[34;49m <: 0x00007ffff5bc1ea0 :> [34;49ms [34;49m[33;40mstest[34;49m[34;49m sp [34;49m 

[34;49mpause[39;49m : at namespaces/compiler/x64.cft : 478.8 :: [34;49m[39;49m'd' (d)ebugger, 't' s(t)ack, c' (c)ontinue, 'q' (q)uit, 'x' e(x)it, 'i' '\' or <key> (i)interpret, <return> loop[34;49m
-> [39;49m