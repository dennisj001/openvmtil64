#include "../include/cfrtil64.h"
#define VERSION ((byte*) "0.888.000" ) 
// Logic/Foml (Foundations of Mathematical Logic by Haskell Curry), Oop (Object Oriented Programming ), 
// C, Lisp, Rpn/Lag : Reverse Polish Notation, (Left Associative Grammar), Pda : Push Down Automata, Tm : Turing Machine :: 
// [a toolkit for implementing languages (maybe evean a compiler compiler) based in these]
OpenVmTil * _Q_ ;

int
main ( int argc, char * argv [ ] )
{
    openvmtil ( argc, argv ) ;
}

void
openvmtil ( int64 argc, char * argv [ ] )
{
    LinuxInit ( ) ;
    OpenVmTil_Run ( argc, argv ) ;
}

void
OpenVmTil_Run ( int64 argc, char * argv [ ] )
{
    int64 restartCondition = INITIAL_START, restarts = 0, sigSegvs = 0 ;
    while ( 1 )
    {
        OpenVmTil * ovt = _Q_ = _OpenVmTil_New ( _Q_, argc, argv ) ;
        ovt->RestartCondition = restartCondition ;
        ovt->SigSegvs = sigSegvs ;
        if ( ! sigsetjmp ( ovt->JmpBuf0, 0 ) ) CfrTil_Run ( ovt->OVT_CfrTil, ovt->RestartCondition ) ;
        restartCondition = ovt->RestartCondition ;
        sigSegvs = ovt->SigSegvs ;
        ovt->Restarts = restarts ++ ;
    }
}

OpenVmTil *
_OpenVmTil_Allocate ( )
{
    OpenVmTil * ovt = ( OpenVmTil* ) mmap_AllocMem ( sizeof ( OpenVmTil ) ) ; //_Mem_Allocate ( 0, sizeof ( OpenVmTil ), 0, ( RETURN_CHUNK_HEADER ) ) ; // don't add this to mem alloc system ; ummap it when done
    dllist_Init ( &ovt->PermanentMemList, &ovt->PML_HeadNode, &ovt->PML_TailNode ) ;
    ovt->OVT_InitialUnAccountedMemory = sizeof ( OpenVmTil ) ; // needed here because 'ovt' was not initialized yet for MemChunk accounting
    return ovt ;
}

void
_OpenVmTil_Init ( OpenVmTil * ovt, int64 resetHistory )
{
    MemorySpace_New ( ) ; // nb : memory must be after we set Size values and before lists; list are allocated from memory
    _HistorySpace_New ( ovt, resetHistory ) ;
    //ovt->psi_PrintStateInfo = PrintStateInfo_New ( ) ; // variable init needed by any allocation which call _Printf
    ovt->VersionString = VERSION ;
    // ? where do we want the init file ?
    if ( _File_Exists ( ( byte* ) "./init.cft" ) )
    {
        ovt->InitString = ( byte* ) "\"./init.cft\" include" ; // could allow override with a startup parameter
        SetState ( ovt, OVT_IN_USEFUL_DIRECTORY, true ) ;
    }
    else
    {
        ovt->InitString = ( byte* ) "\"/usr/local/lib/cfrTil64/init.cft\" include" ; // could allow override with a startup parameter
        SetState ( ovt, OVT_IN_USEFUL_DIRECTORY, false ) ;
    }
    if ( ovt->Verbosity > 1 )
    {
        _Printf ( ( byte* ) "\nRestart : All memory freed, allocated and initialized as at startup. "
            "termios, verbosity and memory category allocation sizes preserved. verbosity = %d.", ovt->Verbosity ) ;
        OpenVmTil_Print_DataSizeofInfo ( 0 ) ;
    }
    _OpenVmTil_ColorsInit ( ovt ) ;
}

void
Ovt_RunInit ( OpenVmTil * ovt )
{
    //ovt->SignalExceptionsHandled = 0 ;
    ovt->StartedTimes ++ ;
    ovt->RestartCondition = STOP ;
}

void
OpenVmTil_Delete ( OpenVmTil * ovt )
{
    if ( ovt )
    {
        if ( ovt->Verbosity > 2 ) _Printf ( ( byte* ) "\nAll allocated memory is being freed.\nRestart : verbosity = %d.", ovt->Verbosity ) ;
        FreeChunkList ( &ovt->PermanentMemList ) ;
        mmap_FreeMem ( ( byte* ) ovt->MemorySpace0, sizeof ( MemorySpace ) ) ;
        mmap_FreeMem ( ( byte* ) ovt, sizeof ( OpenVmTil ) ) ;
    }
    _Q_ = 0 ;
}
#define USE_OpenVmTil_CalculateMemSpaceSizes 0
#define _CFRTIL_SIZE (82 * K) // data stack included here
#if USE_OpenVmTil_CalculateMemSpaceSizes
// _OpenVmTil_CalculateMemSpaceSizes is convoluted and needs rework

void
_OpenVmTil_CalculateMemSpaceSizes ( OpenVmTil * ovt, int64 restartCondition, int64 totalMemSizeTarget )
{
    int64 minimalCoreMemorySize, minStaticMemSize, coreMemTargetSize, exceptionsHandled, verbosity, objectsSize, tempObjectsSize,
        sessionObjectsSize, dataStackSize, historySize, lispTempSize, compilerTempObjectsSize, contextSize, bufferSpaceSize, stringSpaceSize,
        openVmTilSize, cfrTilSize, codeSize, dictionarySize ; //, sessionCodeSize ;

    if ( restartCondition < RESTART )
    {
        verbosity = ovt->Verbosity ;
        // preserve values across partial restarts
        sessionObjectsSize = ovt->SessionObjectsSize ;
        dictionarySize = ovt->DictionarySize ;
        lispTempSize = ovt->LispTempSize ;
        codeSize = ovt->MachineCodeSize ;
        objectsSize = ovt->ObjectsSize ;
        tempObjectsSize = ovt->TempObjectsSize ;
        compilerTempObjectsSize = ovt->CompilerTempObjectsSize ;
        dataStackSize = ovt->DataStackSize ;
        historySize = ovt->HistorySize ;
        contextSize = ovt->ContextSize ;
        bufferSpaceSize = ovt->BufferSpaceSize ;
        openVmTilSize = ovt->OpenVmTilSize ;
        cfrTilSize = ovt->CfrTilSize ;
        stringSpaceSize = ovt->StringSpaceSize ;
        exceptionsHandled = ovt->SignalExceptionsHandled ;
    }
    else if ( totalMemSizeTarget > 0 )
    {
        verbosity = 0 ;

        // volatile mem sizes
        tempObjectsSize = 10 * K ; //TEMP_OBJECTS_SIZE ;
        sessionObjectsSize = 50 * K ; //SESSION_OBJECTS_SIZE ;
        lispTempSize = 10 * K ; //LISP_TEMP_SIZE ;
        compilerTempObjectsSize = 10 * K ; //COMPILER_TEMP_OBJECTS_SIZE ;
        historySize = 1 * K ; //HISTORY_SIZE ;
        contextSize = 5 * FULL_CONTEXT_SIZE ; //CONTEXT_SIZE ;
        bufferSpaceSize = 35 * ( sizeof ( Buffer ) + BUFFER_SIZE ) ; //2153 ; //K ; //BUFFER_SPACE_SIZE ;
        stringSpaceSize = 10 * K ; //BUFFER_SPACE_SIZE ;

        // static mem sizes
        dataStackSize = 2 * K ; // STACK_SIZE
        openVmTilSize = 2 * K ; //OPENVMTIL_SIZE ;
        cfrTilSize = _CFRTIL_SIZE ; //( dataStackSize * 4 ) + ( 12.5 * K ) ; // CFRTIL_SIZE
        exceptionsHandled = 0 ;
    }
    else // 0 or -1 get default
    {
        verbosity = 0 ;

        tempObjectsSize = 1 * MB ; //TEMP_OBJECTS_SIZE ;
        sessionObjectsSize = 1 * MB ; // SESSION_OBJECTS_SIZE ;
        lispTempSize = 1 * MB ; // LISP_TEMP_SIZE ;
        compilerTempObjectsSize = 1 * MB ; //COMPILER_TEMP_OBJECTS_SIZE ;
        contextSize = 5 * K ; // CONTEXT_SIZE ;
        bufferSpaceSize = 35 * ( sizeof ( Buffer ) + BUFFER_SIZE ) ;
        stringSpaceSize = 1 * MB ; //BUFFER_SPACE_SIZE ;
        historySize = 1 * MB ; //HISTORY_SIZE ;

        dataStackSize = 8 * KB ; //STACK_SIZE ;
        openVmTilSize = 15 * KB ; //OPENVMTIL_SIZE ;
        cfrTilSize = _CFRTIL_SIZE ; //( dataStackSize * sizeof (int64 ) ) + ( 5 * KB ) ; //CFRTIL_SIZE ;

        exceptionsHandled = 0 ;
    }
    minStaticMemSize = tempObjectsSize + sessionObjectsSize + dataStackSize + historySize + lispTempSize + compilerTempObjectsSize +
        contextSize + bufferSpaceSize + openVmTilSize + cfrTilSize, stringSpaceSize ;

    minimalCoreMemorySize = 150 * K, coreMemTargetSize = totalMemSizeTarget - minStaticMemSize ;
    coreMemTargetSize = ( coreMemTargetSize > minimalCoreMemorySize ) ? coreMemTargetSize : minimalCoreMemorySize ;
    // core memory
    objectsSize = 1 * M ; //( int64 ) ( 0.333 * ( ( double ) coreMemTargetSize ) ) ; // we can easily allocate more object and dictionary space but not code space
    dictionarySize = ( int64 ) ( 0.333 * ( ( double ) coreMemTargetSize ) ) ;
    codeSize = ( int64 ) ( 0.333 * ( ( double ) coreMemTargetSize ) ) ;
    codeSize = ( codeSize < ( 500 * K ) ) ? 500 * K : codeSize ;

    ovt->SignalExceptionsHandled = exceptionsHandled ;
    ovt->Verbosity = verbosity ;
    ovt->MachineCodeSize = codeSize ;
    ovt->DictionarySize = dictionarySize ;
    ovt->ObjectsSize = objectsSize ;
    ovt->TempObjectsSize = tempObjectsSize ;
    ovt->SessionObjectsSize = sessionObjectsSize ;
    ovt->DataStackSize = dataStackSize ;
    ovt->HistorySize = historySize ;
    ovt->LispTempSize = lispTempSize ;
    ovt->ContextSize = contextSize ;
    ovt->CompilerTempObjectsSize = compilerTempObjectsSize ;
    ovt->BufferSpaceSize = bufferSpaceSize ;
    ovt->CfrTilSize = cfrTilSize ;
    ovt->StringSpaceSize = stringSpaceSize ;
    ovt->OpenVmTilSize = openVmTilSize ;
}
#endif

void
OVT_PrintStartupOptions ( OpenVmTil * ovt )
{
    _Printf ( ( byte* ) "\n\nOVT_GetStartupOptions :: ovt->Argv [0] = %s\n\n", ovt->Argv [0] ) ;
    _Printf ( ( byte* ) "\n\nOVT_GetStartupOptions :: ovt->Argv [1] = %s\n\n", ovt->Argv [1] ) ;
    _Printf ( ( byte* ) "\n\nOVT_GetStartupOptions :: ovt->Argv [2] = %s\n\n", ovt->Argv [2] ) ;
    _Printf ( ( byte* ) "\n\nOVT_GetStartupOptions :: ovt->StartupFilename = %s\n\n", ovt->StartupFilename ) ;
    //if ( ovt->Verbosity > 1 ) Pause ( ) ;
}

void
OVT_GetStartupOptions ( OpenVmTil * ovt )
{
    int64 i ;
    for ( i = 0 ; i < ovt->Argc ; i ++ )
    {
        if ( String_Equal ( "-m", ovt->Argv [ i ] ) ) ovt->TotalMemSizeTarget = ( atoi ( ovt->Argv [ ++ i ] ) * MB ) ;
        // -s : a script file with "#! cfrTil -s" -- as first line includes the script file, the #! whole line is treated as a comment
        else if ( String_Equal ( "-f", ovt->Argv [ i ] ) || ( String_Equal ( "-s", ovt->Argv [ i ] ) ) ) ovt->StartupFilename = ( byte* ) ovt->Argv [ ++ i ] ;
        else if ( String_Equal ( "-e", ovt->Argv [ i ] ) ) ovt->StartupString = ( byte* ) ovt->Argv [ ++ i ] ;
    }
}

OpenVmTil *
_OpenVmTil_New ( OpenVmTil * ovt, int64 argc, char * argv [ ] )
{
    //char errorFilename [256] ;
    int64 restartCondition, exceptionsHandled, startedTimes = 0 ; //, startIncludeTries
    if ( ! ovt ) restartCondition = INITIAL_START ;
    else restartCondition = FULL_RESTART ;
#if 0
    startIncludeTries = ovt ? ovt->StartIncludeTries ++ : 0 ;
    if ( startIncludeTries < 2 )
    {
        if ( ovt && ovt->OVT_Context && ovt->OVT_Context->ReadLiner0 && ovt->OVT_Context->ReadLiner0->Filename )
            strcpy ( errorFilename, ( char* ) ovt->OVT_Context->ReadLiner0->Filename ) ;
        else strcpy ( errorFilename, "Debug Context" ) ;
    }
    else errorFilename [ 0 ] = 0 ;
    //restartCondition = ( ovt && ( restartCondition || ( startIncludeTries < 2 ) ) ) ? ovt->RestartCondition : RESTART ;
    int64 ium = ovt ? ovt->OVT_InitialUnAccountedMemory : 0, ovtv = ovt ? ovt->Verbosity : 0 ;
    if ( ovt && ( restartCondition < INITIAL_START ) && ( ovt->Restarts < 2 ) ) OpenVmTil_Delete ( ovt ) ;
    else if ( ovt )
    {
        printf ( ( byte* ) "\nUnable to reliably delete memory from previous system - rebooting into a new system. 'mem' for more detail on memory.\n" ) ;
        fflush ( stdout ) ;
        if ( ovt->Restarts < 2 ) OpenVmTil_Pause ( ) ; // we may crash here
    }
    d0 ( if ( ovtv > 1 )
    {
        printf ( ( byte* ) "\nTotal Mem Remaining = %9lld : <=: mmap_TotalMemAllocated - mmap_TotalMemFreed - ovt->OVT_InitialUnAccountedMemory", mmap_TotalMemAllocated - mmap_TotalMemFreed - ium ) ;
            fflush ( stdout ) ;
    } )
#else
    if ( ovt ) startedTimes = ovt->StartedTimes, OpenVmTil_Delete ( ovt ) ;
#endif        
    _Q_ = ovt = _OpenVmTil_Allocate ( ) ;

    ovt->RestartCondition = restartCondition ;
    ovt->Argc = argc ;
    ovt->Argv = argv ;
    ovt->StartedTimes = startedTimes ;
    //ovt->SavedTerminalAttributes = savedTerminalAttributes ;

    OVT_GetStartupOptions ( ovt ) ;
#if USE_OpenVmTil_CalculateMemSpaceSizes 
    int64 MIN_TotalMemSizeTarget = ( 300 * K ) ;
    if ( ovt->TotalMemSizeTarget < MIN_TotalMemSizeTarget ) ovt->TotalMemSizeTarget = MIN_TotalMemSizeTarget ;
    int64 totalMemSizeTarget = ( ovt->TotalMemSizeTarget < 5 * M ) ? ovt->TotalMemSizeTarget : - 1 ; // 0 or -1 : gets default values     
    _OpenVmTil_CalculateMemSpaceSizes ( ovt, restartCondition, - 1 ) ; //totalMemSizeTarget ) ;
#else    
    ovt->InternalObjectsSize = 1 * M ; 
    ovt->ObjectsSize = 1 * M ; 
    ovt->BufferSpaceSize = 100 * K ; //35 * ( sizeof ( Buffer ) + BUFFER_SIZE ) ;
    ovt->StringSpaceSize = 100 * K ;
    ovt->MachineCodeSize = 300 * K ;
    ovt->DictionarySize = 100 * K ;
    ovt->CfrTilSize = ( 23 * K ) ;
    ovt->OpenVmTilSize = ( 9 * K ) ;
    ovt->DataStackSize = 8 * KB ;
#endif    

    _OpenVmTil_Init ( ovt, exceptionsHandled > 1 ) ; // try to keep history if we can
    Linux_SetupSignals ( &ovt->JmpBuf0, 1 ) ;
    //if ( startIncludeTries ) ovt->ErrorFilename = String_New ( ( byte* ) errorFilename, STRING_MEM ) ;
    return ovt ;
}

