#include "../include/cfrtil64.h"

// lib : full library path

#define RTLD_DEFAULT ((void *) 0)

void *
_dlsym ( byte * sym, byte * lib )
{
    void *fp, * hLibrary = dlopen ( ( char* ) lib, RTLD_GLOBAL | RTLD_LAZY ) ;
    if ( hLibrary )
    {
        fp = ( void* ) dlsym ( hLibrary, ( char* ) sym ) ;
        //fp = ( void* ) dlsym ( RTLD_DEFAULT, ( char* ) sym ) ; // either work after dlopen
    }
    if ( ( ! hLibrary ) || ( ! fp ) )
    {
        _Printf ( ( byte* ) c_ad ( "\ndlsym : dlerror = %s\n" ), dlerror ( ) ) ;
        return 0 ;
    }
    return fp ;
}

void *
_Dlsym ( byte * sym, byte * lib )
{
    void *functionPointer = _dlsym ( sym, lib ) ;
    if ( ( ! functionPointer ) )
    {
        char buffer [256], *sharedLib = ( char* ) lib ;
        int64 ll ;
        for ( ll = Strlen ( sharedLib ) ; sharedLib [ ll ] != '/' ; ll -- ) ;
        strcpy ( buffer, "./lib32" ) ;
        strcat ( buffer, &sharedLib [ll] ) ;
        functionPointer = _dlsym ( sym, ( byte* ) buffer ) ;
        if ( ! functionPointer )
        {
            _Printf ( ( byte* ) c_ad ( "\ndlsym : dlerror = %s\n" ), dlerror ( ) ) ;
            return 0 ;
        }
    }
    return functionPointer ;
}

Word *
Dlsym ( byte * sym, byte * lib )
{
    block b = ( block ) _Dlsym ( sym, lib ) ;
    Word * word = DataObject_New (CFRTIL_WORD, 0, sym, CPRIMITIVE | DLSYM_WORD | C_PREFIX | C_RETURN | C_PREFIX_RTL_ARGS, 0, 0, 0, ( int64 ) b, 0, 0, 0, - 1 ) ;
    word->W_TypeAttributes |= WT_C_PREFIX_RTL_ARGS ;
    return word ;
}

void
CFT_Dlsym ( )
{
    byte * sym = Lexer_ReadToken ( _Context_->Lexer0 ) ;
    byte * lib = _Lexer_LexNextToken_WithDelimiters ( _Context_->Lexer0, 0, 1, 0, 1, LEXER_ALLOW_DOT ) ;
    byte * semi = Lexer_ReadToken ( _Context_->Lexer0 ) ; // drop the semi
    Word * word = Dlsym ( sym, lib ) ;
    _Word_Finish ( word ) ;
}

// callNumber | errno

void
CFT_system0 ( )
{
    _Compile_Stack_PopToReg ( DSP, ACC ) ;
    _Compile_INT80 ( ) ;
    _Compile_Stack_PushReg ( DSP, ACC ) ;
}

void
CFT_system1 ( )
{
    _Compile_Stack_PopToReg ( DSP, ACC ) ;
    _Compile_Stack_PopToReg ( DSP, OREG ) ;
    _Compile_INT80 ( ) ;
    _Compile_Stack_PushReg ( DSP, ACC ) ;
}

void
CFT_system2 ( )
{
    _Compile_Stack_PopToReg ( DSP, ACC ) ;
    _Compile_Stack_PopToReg ( DSP, OREG ) ;
    _Compile_Stack_PopToReg ( DSP, OREG ) ;
    _Compile_INT80 ( ) ;
    _Compile_Stack_PushReg ( DSP, ACC ) ;
}

void
CFT_system3 ( )
{
    _Compile_Stack_PopToReg ( DSP, ACC ) ;
    _Compile_Stack_PopToReg ( DSP, OREG ) ;
    _Compile_Stack_PopToReg ( DSP, OREG ) ;
    _Compile_Stack_PopToReg ( DSP, RDX ) ;
    _Compile_INT80 ( ) ;
    _Compile_Stack_PushReg ( DSP, ACC ) ;
}

void
_CFT_WordAccounting_Print ( byte * functionName )
{
    _Printf ( ( byte* ) "\n%s :: DObjectCreateCount = %d : WordCreateCount = %d : WordsAdded = %d : FindWordCount = %d : FindWordMaxCount = %d",
        functionName, _CFT_->DObjectCreateCount, _CFT_->WordCreateCount, _CFT_->WordsAdded, _CFT_->FindWordCount, _CFT_->FindWordMaxCount ) ;
    _Printf ( ( byte* ) "\nRecycledWordCount : %d", _O_->MemorySpace0->RecycledWordCount ) ;
    Buffer_PrintBuffers ( ) ;
}

void
CFT_WordAccounting ( byte * functionName )
{
    if ( _CFT_->FindWordCount > _CFT_->FindWordMaxCount ) _CFT_->FindWordMaxCount = _CFT_->FindWordCount ;
    if ( _O_->Verbosity > 4 )
        _CFT_WordAccounting_Print ( functionName ) ;
}

byte *
_CFT_GetSystemState_String0 ( byte * buf )
{
    strcpy ( ( char* ) buf, "\ntypeChecking is " ) ;
    if ( GetState ( _CFT_, TYPECHECK_ON ) ) strcat ( ( char* ) buf, "on, " ) ;
    else strcat ( ( char* ) buf, "off, " ) ;
    strcat ( ( char* ) buf, "optimize is " ) ;
    if ( GetState ( _CFT_, OPTIMIZE_ON ) ) strcat ( ( char* ) buf, "on, " ) ;
    else strcat ( ( char* ) buf, "off, " ) ;
    strcat ( ( char* ) buf, "inlining is " ) ;
    if ( GetState ( _CFT_, INLINE_ON ) ) strcat ( ( char* ) buf, "on, " ) ;
    else strcat ( ( char* ) buf, "off, " ) ;
    strcat ( ( char* ) buf, "infixMode is " ) ;
    if ( GetState ( _Context_, INFIX_MODE ) ) strcat ( ( char* ) buf, "on, " ) ;
    else strcat ( ( char* ) buf, "off, " ) ;
    strcat ( ( char* ) buf, "\nprefixMode is " ) ;
    if ( GetState ( _Context_, PREFIX_MODE ) ) strcat ( ( char* ) buf, "on, " ) ;
    else strcat ( ( char* ) buf, "off, " ) ;
    strcat ( ( char* ) buf, "c_syntax is " ) ;
    if ( GetState ( _Context_, C_SYNTAX ) ) strcat ( ( char* ) buf, "on, " ) ;
    else strcat ( ( char* ) buf, "off, " ) ;
    if ( ! GetState ( _Context_, PREFIX_MODE | INFIX_MODE ) ) strcat ( ( char* ) buf, "postfixMode is on" ) ;
#if 0    
    strcat ( ( char* ) buf, "LHS is " ) ;
    if ( GetState ( _Context_, C_LHS ) ) strcat ( ( char* ) buf, "on, " ) ;
    else strcat ( ( char* ) buf, "off, " ) ;
    strcat ( ( char* ) buf, "RHS is " ) ;
    if ( GetState ( _Context_, C_RHS ) ) strcat ( ( char* ) buf, "on. " ) ;
    else strcat ( ( char* ) buf, "off. " ) ;
#endif    
    return buf ;
}

byte *
_CFT_GetSystemState_String1 ( byte *buf )
{
    strcat ( ( char* ) buf, "\nReadLine echo is " ) ;
    if ( GetState ( _CFT_, READLINE_ECHO_ON ) ) strcat ( ( char* ) buf, "on. " ) ;
    else strcat ( ( char* ) buf, "off. " ) ;
    strcpy ( ( char* ) buf, "\nDebug is " ) ;
    if ( GetState ( _CFT_, DEBUG_MODE ) ) strcat ( ( char* ) buf, "on. " ) ;
    else strcat ( ( char* ) buf, "off. " ) ;
    sprintf ( ( char* ) &buf[Strlen ( ( char* ) buf )], "Verbosity = %ld. ", _O_->Verbosity ) ;
    sprintf ( ( char* ) &buf[Strlen ( ( char* ) buf )], "Console = %ld, ", _O_->Console ) ;
    sprintf ( ( char* ) &buf[Strlen ( ( char* ) buf )], "NumberBase = %ld.", _Context_->System0->NumberBase ) ;
    return buf ;
}

byte *
Convert_RestartCondtion ( int64 restartCondition )
{
    switch ( restartCondition )
    {
        case ( ( uint64 ) 1 << 10 ): return "INITIAL_START" ;
        case ( ( uint64 ) 1 << 9 ): return "FULL_RESTART" ;
        case ( ( uint64 ) 1 << 8 ): return "RESTART" ;
        case ( ( uint64 ) 1 << 7 ): return "RESET_ALL" ;
        case ( ( uint64 ) 1 << 6 ): return "ABORT" ;
        case ( ( uint64 ) 1 << 5 ): return "QUIT" ;
        case ( ( uint64 ) 1 << 4 ): return "CFRTIL_RUN_INIT" ;
        case ( ( uint64 ) 1 << 3 ): return "STOP" ;
        case ( ( uint64 ) 1 << 2 ): return "BREAK" ;
        case ( ( uint64 ) 1 << 1 ): return "CONTINUE" ;
        case ( ( uint64 ) 1 << 0 ): return "ON" ;
        case ( ( uint64 ) 0 ): return "OFF" ;
        default: return "Unknown Condition" ;
    }
}

void
_CFT_SystemState_Print ( int64 pflag )
{
    byte * buf = Buffer_Data ( _CFT_->ScratchB1 ) ;
    buf = _CFT_GetSystemState_String0 ( buf ) ;
    _Printf ( ( byte* ) buf ) ;
    buf = _CFT_GetSystemState_String1 ( buf ) ;
    _Printf ( ( byte* ) buf ) ;
    Boolean dsc = GetState ( _CFT_, DEBUG_SOURCE_CODE_MODE ) ;
    _Printf ( ( byte* ) "\nDebugSourceCode %s", dsc ? "on" : "off" ) ;
    Boolean bno = Namespace_IsUsing ( ( byte* ) "BigNum" ) ;
    _Printf ( ( byte* ) " : BigNum %s", bno ? "on" : "off" ) ;
    Boolean lo = Namespace_IsUsing ( ( byte* ) "Lisp" ) ;
    _Printf ( ( byte* ) " : Lisp %s", lo ? "on" : "off" ) ;
    _Printf ( ( byte* ) "\n%s : at %s", Compiling ? "compiling" : "interpreting", Context_Location ( ) ) ;
    OVT_ExceptionState_Print ( ) ;
    if ( pflag || ( _O_->Verbosity > 1 ) )
    {
        OpenVmTil_Print_DataSizeofInfo ( pflag ) ;
        _CFT_WordAccounting_Print ( ( byte* ) "_CFT_SystemState_Print" ) ;
        BigNum_StateShow ( ) ;
    }
}

void
__CFT_Dump ( byte * address, int64 number, int64 dumpMod )
{
    if ( address && number )
    {
        byte * nformat ;
        int64 i, n ;
        if ( _Context_->System0->NumberBase == 16 ) nformat = ( byte* ) "\nDump : Address = " UINT_FRMT " : Number = " UINT_FRMT " :: (little endian dump)" ;
        else nformat = ( byte* ) "\nDump : Address = " UINT_FRMT " : Number = " INT_FRMT " :: (little endian dump)" ;
        _Printf ( nformat, ( int64 ) address, number ) ;
        for ( i = 0 ; i < number ; )
        {
            _Printf ( ( byte* ) "\n" UINT_FRMT " : ", address + i ) ;
            if ( ! ( i % dumpMod ) )
            {
                for ( n = 0 ; n < dumpMod ; n += CELL_SIZE ) _Printf ( ( byte* ) UINT_FRMT " ", *( int64* ) ( address + i + n ) ) ;
                _Printf ( ( byte* ) " " ) ;
                for ( n = 0 ; n < dumpMod ; n += CELL_SIZE ) CFT_NByteDump ( ( byte* ) ( address + i + n ), CELL_SIZE ) ;
                for ( n = 0 ; n < dumpMod ; n += CELL_SIZE ) CFT_CharacterDump ( ( byte* ) ( address + i + n ), CELL_SIZE ) ;
                i += dumpMod ;
            }
            else i ++ ;
        }
    }
    //_Compiler_->LHS_Word = 0 ;
}

void
_CFT_Source ( Word *word, int64 addToHistoryFlag )
{
    if ( word )
    {
        Word * aword = 0 ;
        byte * name = c_gd ( word->Name ) ;
        if ( word->ContainingNamespace ) _Printf ( ( byte* ) "\n%s.", word->ContainingNamespace->Name ) ;
        if ( word->W_ObjectAttributes & OBJECT )
        {
            _Printf ( ( byte* ) "%s <:> %s", name, "object" ) ;
        }
        else if ( word->W_ObjectAttributes & NAMESPACE )
        {
            _Printf ( ( byte* ) "%s <:> %s", name, "namespace" ) ;
        }
        else if ( word->W_ObjectAttributes & TEXT_MACRO )
        {
            _Printf ( ( byte* ) "%s <:> %s", name, "macro" ) ;
        }
        else if ( word->W_ObjectAttributes & LOCAL_VARIABLE )
        {
            _Printf ( ( byte* ) "%s <:> %s", name, "local variable" ) ;
        }
        else if ( word->W_ObjectAttributes & PARAMETER_VARIABLE )
        {
            _Printf ( ( byte* ) "%s <:> %s", name, "stack variable" ) ;
        }
        else if ( word->W_ObjectAttributes & NAMESPACE_VARIABLE )
        {
            _Printf ( ( byte* ) "%s <:> %s", name, "variable" ) ;
        }
        else if ( word->W_ObjectAttributes & CONSTANT )
        {
            _Printf ( ( byte* ) "%s <:> %s", name, "constant" ) ;
        }
        else if ( word->W_MorphismAttributes & ALIAS )
        {
            aword = Word_UnAlias ( word ) ; //word->W_AliasOf ;
            if ( aword ) _Printf ( ( byte* ) "%s alias for %s", name, ( char* ) c_gd ( aword->Name ) ) ;
        }
        else if ( word->W_MorphismAttributes & CPRIMITIVE )
        {
            _Printf ( ( byte* ) "%s <:> %s", name, "C compiled primitive" ) ;
        }
        else if ( word->W_LispAttributes & T_LISP_COMPILED_WORD )
        {
            _Printf ( ( byte* ) "%s <:> %s", name, "lambdaCalculus compiled word" ) ;
        }
        else if ( word->W_MorphismAttributes & CFRTIL_WORD )
        {
            _Printf ( ( byte* ) "%s <:> %s", name, "cfrTil compiled word" ) ;
        }
        else if ( word->W_LispAttributes & T_LC_DEFINE )
        {
            _Printf ( ( byte* ) "%s <:> %s", name, "lambdaCalculus defined word" ) ;
        }
        else if ( word->W_MorphismAttributes & BLOCK )
        {
            _Printf ( ( byte* ) "%s <:> %s", name, "cfrTil compiled code block" ) ;
        }
        if ( word->W_MorphismAttributes & INLINE ) _Printf ( ( byte* ) ", %s", "inline" ) ;
        if ( word->W_MorphismAttributes & IMMEDIATE ) _Printf ( ( byte* ) ", %s", "immediate" ) ;
        if ( word->W_MorphismAttributes & PREFIX ) _Printf ( ( byte* ) ", %s", "prefix" ) ;
        if ( word->W_MorphismAttributes & C_PREFIX ) _Printf ( ( byte* ) ", %s", "c_prefix" ) ;
        if ( word->W_MorphismAttributes & C_RETURN ) _Printf ( ( byte* ) ", %s", "c_return" ) ;
        if ( word->W_MorphismAttributes & INFIXABLE ) _Printf ( ( byte* ) ", %s", "infixable" ) ;
        if ( word->S_WordData )
        {
            _Word_ShowSourceCode ( word ) ; // source code has newlines for multiline history
            if ( aword && ( aword != Word_UnAlias ( aword ) ) ) 
            {
                _Word_ShowSourceCode ( aword ) ;
            }
            if ( addToHistoryFlag ) _OpenVmTil_AddStringToHistoryList ( word->W_SourceCode ) ;
            if ( word->S_WordData->Filename ) _Printf ( ( byte* ) "\nSource code file location of %s : \"%s\" : %d.%d :: we are now at : %s", name, word->S_WordData->Filename, word->S_WordData->LineNumber, word->W_TokenEnd_ReadLineIndex, Context_IsInFile ( _Context_ ) ? Context_Location ( ) : ( byte* ) "command line" ) ;
            if ( ( word->W_LispAttributes & T_LC_DEFINE ) && ( ! ( word->W_LispAttributes & T_LISP_COMPILED_WORD ) ) ) _Printf ( ( byte* ) "\nLambda Calculus word : interpreted not compiled" ) ; // do nothing here
            else if ( ! ( word->W_MorphismAttributes & CPRIMITIVE ) )
            {
                _Printf ( ( byte* ) "\nCompiled with : %s%s%s%s",
                    GetState ( word, COMPILED_OPTIMIZED ) ? "optimizeOn" : "optimizeOff", GetState ( word, COMPILED_INLINE ) ? ", inlineOn" : ", inlineOff",
                    ( ( word->W_TypeAttributes & WT_C_SYNTAX ) || GetState ( word, W_C_SYNTAX ) ) ? ", c_syntaxOn" : "", GetState ( word, W_INFIX_MODE ) ? ", infixOn" : "" ) ;
                Boolean dsc = GetState ( _CFT_, DEBUG_SOURCE_CODE_MODE ) ;
                _Printf ( ( byte* ) "\nDebug Source Code %s", dsc ? "on" : "off" ) ;
                Boolean bno = Namespace_IsUsing ( ( byte* ) "BigNum" ) ;
                _Printf ( ( byte* ) " : BigNum %s", bno ? "on" : "off" ) ;
                Boolean lo = Namespace_IsUsing ( ( byte* ) "Lisp" ) ;
                _Printf ( ( byte* ) " : Lisp %s", lo ? "on" : "off" ) ;
                Boolean wsc = GetState ( word, W_SOURCE_CODE_MODE ) ;
                _Printf ( ( byte* ) " : Word Source Code %s", wsc ? "on" : "off" ) ;
            }
            if ( word->Definition && word->S_CodeSize ) _Printf ( ( byte* ) "\nstarting at address : 0x%x -- code size = %d bytes", word->Definition, word->S_CodeSize ) ;
            if ( word->W_TypeSignatureString[0] ) _Printf ( ( byte* ) "\nTypeSignature : %s", Word_ExpandTypeLetterSignature ( word, 0 ) ) ;
        }
    }
}

void
_CFT_Dump ( int64 dumpMod )
{
    int64 number = DataStack_Pop ( ) ;
    byte * address = ( byte* ) DataStack_Pop ( ) ;
    __CFT_Dump ( address, number, dumpMod ) ;
}

Boolean
_AtCommandLine ( )
{
    return ( ! _Context_->System0->IncludeFileStackNumber ) ;
}

Boolean
AtCommandLine ( ReadLiner *rl )
{
    return ( ( GetState ( _Debugger_, DBG_COMMAND_LINE ) || GetState ( _Context_, AT_COMMAND_LINE ) ) ||
        ( GetState ( rl, CHAR_ECHO ) && ( _AtCommandLine ( ) ) ) ) ;
}
#if 0
// example from : http://www.kernel.org/doc/man-pages/online/pages/man3/dlsym.3.html

Load the math library, and _print the cosine of 2.0 :

#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

int64
main ( int64 argc, char **argv )
{
    void *handle ;
    double (*cosine )( double ) ;
    char *error ;

    handle = dlopen ( "libm.so", RTLD_LAZY ) ;
    if ( ! handle )
    {
        fprintf ( stderr, "%s\n", dlerror ( ) ) ;
        exit ( EXIT_FAILURE ) ;
    }

    dlerror ( ) ; /* Clear any existing error */

    /* Writing: cosine = (double (*)(double)) dlsym(handle, "cos");
       would seem more natural, but the C99 standard leaves
       casting from "void *" to a function pointer undefined.
       The assignment used below is the POSIX.1-2003 (Technical
       Corrigendum 1) workaround; see the Rationale for the
       POSIX specification of dlsym(). */

    *( void ** ) ( &cosine ) = dlsym ( handle, "cos" ) ;

    if ( ( error = dlerror ( ) ) != NULL )
    {
        fprintf ( stderr, "%s\n", error ) ;
        exit ( EXIT_FAILURE ) ;
    }

    printf ( "%f\n", ( *cosine )( 2.0 ) ) ;
    dlclose ( handle ) ;
    exit ( EXIT_SUCCESS ) ;
}
/*
       If this program were in a file named "foo.c", you would build the program with
       the following command:

           gcc -rdynamic -o foo foo.c -ldl

       Libraries exporting _init() and _fini() will want to be compiled as follows,
       using bar.c as the example name:

           gcc -shared -nostartfiles -o bar bar.c
 */

#endif
// lib sym | addr
#if 0

void
_CFT_Dlsym ( )
{
    byte * sym = ( byte* ) DataStack_Pop ( ) ;
    byte * lib = ( byte* ) DataStack_Pop ( ) ;
    DataStack_Push ( ( int64 ) _Dlsym ( sym, lib ) ) ;
}

void
CFT_DlsymWord ( )
{
    byte * lib = ( byte* ) DataStack_Pop ( ) ;
    byte * sym = ( byte* ) DataStack_Pop ( ) ;
    Dlsym ( sym, lib ) ;
}
#endif
// takes semi - ";" - after the definition

#if 0

void *
dlOpen_Dlsym ( char * lib, char * sym )
{
    void * hLibrary, *fp ;
    char * error, buffer [1024] ;

    sprintf ( buffer, "./%s.so", lib ) ;
    hLibrary = dlopen ( buffer, RTLD_GLOBAL | RTLD_LAZY ) ;
    if ( ! hLibrary )
    {
        sprintf ( buffer, "/usr/lib32/%s.so", lib ) ;
        hLibrary = dlopen ( buffer, RTLD_GLOBAL | RTLD_LAZY ) ;
    }
    if ( ! hLibrary )
    {
        sprintf ( buffer, "/usr/local/lib/%s.so", lib ) ;
        hLibrary = dlopen ( buffer, RTLD_GLOBAL | RTLD_LAZY ) ;
    }
    if ( ! hLibrary )
    {
        sprintf ( buffer, "/usr/lib/%s.so", lib ) ;
        hLibrary = dlopen ( buffer, RTLD_GLOBAL | RTLD_LAZY ) ;
    }
    if ( ! hLibrary )
    {
        _Printf ( ( byte* ) "\nCannot open %s - cannot import library\n", buffer ) ;
        return 0 ;
    }
    fp = ( void* ) dlsym ( RTLD_DEFAULT /*hLibrary*/, ( char* ) sym ) ;
    //if ( ( error = dlerror ( ) ) != NULL )
    if ( ( ! fp ) || ( ( error = dlerror ( ) ) != NULL ) )
    {
        _Printf ( ( byte* ) "dlOpen_Dlsym : dlerror: %s\n", error ) ;
        return 0 ;
    }

    //void * hLibrary = dlopen ( lib, RTLD_DEFAULT |RTLD_GLOBAL | RTLD_LAZY ) ;
    void * fp = _Dlsym ( lib, sym ) ;

    return fp ;
}
#endif



