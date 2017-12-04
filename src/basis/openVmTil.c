
#include "../include/cfrtil64.h"
#define VERSION ((byte*) "0.825.300" ) // 0.823.200 series is x86 ; the 0.823.300 series is x64 : 0.823.300.600+ series is with new x64 compiler
// 824.800 is with improves from 824.

OpenVmTil * _Q_ ; 
//uint64 * _Dsp_, *_Rsp_ ; // internal stack pointers
uint64 *_Rsp_ ; // internal stack pointers

int
main ( int argc, char * argv [ ] )
{
    openvmtil ( argc, argv ) ;
}

void
openvmtil ( int64 argc, char * argv [ ] )
{
    LinuxInit () ;
    _OpenVmTil ( _Q_ = 0, argc, argv ) ;
}

void
_OpenVmTil ( OpenVmTil * ovt, int64 argc, char * argv [ ] )
{
    int64 restartCondition = INITIAL_START ;
    while ( 1 )
    {
        ovt = _Q_ = _OpenVmTil_New ( _Q_, argc, argv ) ;
        ovt->RestartCondition = restartCondition ;
        if ( ! sigsetjmp ( ovt->JmpBuf0, 0 ) )
        {
            _OpenVmTil_Run ( ovt ) ;
        }
        restartCondition = ovt->RestartCondition ;
    }
}

void
_OpenVmTil_Run ( OpenVmTil * ovt )
{
    _CfrTil_Run ( ovt->OVT_CfrTil, ovt->RestartCondition ) ;
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
    if ( _File_Exists ( ( byte* ) "./.init.cft" ) )
    {
        ovt->InitString = ( byte* ) "\"./.init.cft\" include" ; // could allow override with a startup parameter
        SetState ( ovt, OVT_IN_USEFUL_DIRECTORY, true ) ;
    }
    else
    {
        ovt->InitString = ( byte* ) "\"/usr/local/lib/cfrTil64/.init.cft\" include" ; // could allow override with a startup parameter
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
#define _CFRTIL_SIZE (24 * K)

void
_OpenVmTil_CalculateMemSpaceSizes ( OpenVmTil * ovt, int64 restartCondition, int64 totalMemSizeTarget )
{
    int64 minimalCoreMemorySize, minStaticMemSize, coreMemTargetSize, exceptionsHandled, verbosity, objectsSize, tempObjectsSize,
        sessionObjectsSize, sessionCodeSize, dataStackSize, historySize, lispTempSize, compilerTempObjectsSize, contextSize, bufferSpaceSize, stringSpaceSize,
        openVmTilSize, cfrTilSize, codeSize, dictionarySize ;

    if ( restartCondition < RESTART )
    {
        verbosity = ovt->Verbosity ;
        // preserve values across partial restarts
        sessionObjectsSize = ovt->SessionObjectsSize ;
        sessionCodeSize = ovt->SessionCodeSize ;
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
        verbosity = 1 ;

        // volatile mem sizes
        tempObjectsSize = 10 * K ; //TEMP_OBJECTS_SIZE ;
        sessionObjectsSize = 50 * K ; //SESSION_OBJECTS_SIZE ;
        sessionCodeSize = 50 * K ; //SESSION_OBJECTS_SIZE ;
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
        verbosity = 1 ;

        tempObjectsSize = 1 * MB ; //TEMP_OBJECTS_SIZE ;
        sessionObjectsSize = 1 * MB ; // SESSION_OBJECTS_SIZE ;
        sessionCodeSize = 1 * MB ; // SESSION_CODE_SIZE ;
        lispTempSize = 1 * MB ; // LISP_TEMP_SIZE ;
        compilerTempObjectsSize = 1 * MB ; //COMPILER_TEMP_OBJECTS_SIZE ;
        contextSize = 5 * K ; // CONTEXT_SIZE ;
        bufferSpaceSize = 35 * ( sizeof ( Buffer ) + BUFFER_SIZE ) ;
        ; //1 * MB ; //BUFFER_SPACE_SIZE ;
        stringSpaceSize = 1 * MB ; //BUFFER_SPACE_SIZE ;
        historySize = 1 * MB ; //HISTORY_SIZE ;

        dataStackSize = 8 * KB ; //STACK_SIZE ;
        openVmTilSize = 2 * KB ; //OPENVMTIL_SIZE ;
        cfrTilSize = _CFRTIL_SIZE ; //( dataStackSize * sizeof (int64 ) ) + ( 5 * KB ) ; //CFRTIL_SIZE ;

        exceptionsHandled = 0 ;
    }
    minStaticMemSize = tempObjectsSize + sessionObjectsSize + dataStackSize + historySize + lispTempSize + compilerTempObjectsSize +
        contextSize + bufferSpaceSize + openVmTilSize + cfrTilSize, stringSpaceSize ;

    minimalCoreMemorySize = 150 * K, coreMemTargetSize = totalMemSizeTarget - minStaticMemSize ;
    coreMemTargetSize = ( coreMemTargetSize > minimalCoreMemorySize ) ? coreMemTargetSize : minimalCoreMemorySize ;
    // core memory
    objectsSize = ( int64 ) ( 0.333 * ( ( double ) coreMemTargetSize ) ) ; // we can easily allocate more object and dictionary space but not code space
    dictionarySize = ( int64 ) ( 0.333 * ( ( double ) coreMemTargetSize ) ) ;
    codeSize = ( int64 ) ( 0.333 * ( ( double ) coreMemTargetSize ) ) ;
    //codeSize = ( codeSize > ( 500 * K ) ) ? codeSize : 100 * K ;
    codeSize = ( codeSize < ( 100 * K ) ) ? 100 * K : codeSize ;

    ovt->SignalExceptionsHandled = exceptionsHandled ;
    ovt->Verbosity = verbosity ;
    ovt->MachineCodeSize = codeSize ;
    ovt->DictionarySize = dictionarySize ;
    ovt->ObjectsSize = objectsSize ;
    ovt->TempObjectsSize = tempObjectsSize ;
    ovt->SessionObjectsSize = sessionObjectsSize ;
    ovt->SessionCodeSize = sessionCodeSize ;
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

void
OVT_GetStartupOptions ( OpenVmTil * ovt )
{
    int64 i ;
    for ( i = 0 ; i < ovt->Argc ; i ++ )
    {
        if ( String_Equal ( "-m", ovt->Argv [ i ] ) )
        {
            ovt->TotalMemSizeTarget = ( atoi ( ovt->Argv [ ++ i ] ) * MB ) ;
        }
            // -s : a script file with "#! cfrTil -s" -- as first line includes the script file, the #! whole line is treated as a comment
        else if ( String_Equal ( "-f", ovt->Argv [ i ] ) || ( String_Equal ( "-s", ovt->Argv [ i ] ) ) )
        {
            ovt->StartupFilename = ( byte* ) ovt->Argv [ ++ i ] ;
        }
        else if ( String_Equal ( "-e", ovt->Argv [ i ] ) ) ovt->StartupString = ( byte* ) ovt->Argv [ ++ i ] ;
    }
    d0 (
        _Printf ( ( byte* ) "\n\nOVT_GetStartupOptions :: ovt->Argv [0] = %s\n\n", ovt->Argv [0] ) ;
        _Printf ( ( byte* ) "\n\nOVT_GetStartupOptions :: ovt->Argv [1] = %s\n\n", ovt->Argv [1] ) ;
        _Printf ( ( byte* ) "\n\nOVT_GetStartupOptions :: ovt->Argv [2] = %s\n\n", ovt->Argv [2] ) ;
        _Printf ( ( byte* ) "\n\nOVT_GetStartupOptions :: ovt->StartupFilename = %s\n\n", ovt->StartupFilename ) ;
        Pause ( ) ;
        ) ;
}

OpenVmTil *
_OpenVmTil_New ( OpenVmTil * ovt, int64 argc, char * argv [ ] )
{
    char errorFilename [256] ;
    int64 fullRestart, restartCondition, startIncludeTries, exceptionsHandled ;
    if ( ! ovt )
    {
        fullRestart = INITIAL_START ;
    }
    else fullRestart = ( ovt->RestartCondition == INITIAL_START ) ;


    startIncludeTries = ( ovt && ( ! fullRestart ) ) ? ovt->StartIncludeTries : 0 ;
    if ( startIncludeTries )
    {
        if ( ovt && ovt->OVT_Context && ovt->OVT_Context->ReadLiner0 && ovt->OVT_Context->ReadLiner0->Filename ) strcpy ( errorFilename, ( char* ) ovt->OVT_Context->ReadLiner0->Filename ) ;
        else strcpy ( errorFilename, "Debug Context" ) ;
    }
    else errorFilename [ 0 ] = 0 ;
    restartCondition = ( ! fullRestart ) && ( startIncludeTries < 2 ) ? ovt->RestartCondition : RESTART ;

    int64 ium = ovt ? ovt->OVT_InitialUnAccountedMemory : 0, ovtv = ovt ? ovt->Verbosity : 0 ;

    OpenVmTil_Delete ( ovt ) ;
    d0 ( if ( ovtv > 1 )
    {
        printf ( ( byte* ) "\nTotal Mem Remaining = %9lld : <=: mmap_TotalMemAllocated - mmap_TotalMemFreed - ovt->OVT_InitialUnAccountedMemory", mmap_TotalMemAllocated - mmap_TotalMemFreed - ium ) ;
            fflush ( stdout ) ;
    } )
    _Q_ = ovt = _OpenVmTil_Allocate ( ) ;

    ovt->RestartCondition = FULL_RESTART ;
    ovt->Argc = argc ;
    ovt->Argv = argv ;
    //ovt->SavedTerminalAttributes = savedTerminalAttributes ;

    OVT_GetStartupOptions ( ovt ) ;
    int64 MIN_TotalMemSizeTarget = ( 300 * K ) ;
    if ( ovt->TotalMemSizeTarget < MIN_TotalMemSizeTarget ) ovt->TotalMemSizeTarget = MIN_TotalMemSizeTarget ;
    int64 totalMemSizeTarget = ( ovt->TotalMemSizeTarget < 5 * M ) ? ovt->TotalMemSizeTarget : - 1 ; // 0 or -1 : gets default values     
    _OpenVmTil_CalculateMemSpaceSizes ( ovt, restartCondition, totalMemSizeTarget ) ;

    _OpenVmTil_Init ( ovt, exceptionsHandled > 1 ) ; // try to keep history if we can
    Linux_SetupSignals ( &ovt->JmpBuf0, 1 ) ;
    if ( startIncludeTries ) ovt->ErrorFilename = String_New ( ( byte* ) errorFilename, STRING_MEM ) ;
    return ovt ;
}

