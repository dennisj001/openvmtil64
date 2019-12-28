
//#define myprintf(a, b, rest...) printf (a, b, ## rest)
#define Exception( type, response ) CfrTil_Exception (type, 0, response )

#define _Context_ _Q_->OVT_Context
#define _CfrTil_ _Q_->OVT_CfrTil
#define _Compiler_ _Context_->Compiler0
#define _Interpreter_ _Context_->Interpreter0
#define _ReadLiner_ _Context_->ReadLiner0
#define _Lexer_ _Context_->Lexer0
#define _Finder_ _Context_->Finder0
#define _DataStack_ _CfrTil_->DataStack
#define _DataStackPointer_ _DataStack_->StackPointer
#define _DSP_ _DataStackPointer_ 
#define _ReturnStack_ _CfrTil_->ReturnStack
#define _ReturnStack_ _CfrTil_->ReturnStack
#define _ReturnStackPointer_ _ReturnStack_->StackPointer
#define _RSP_ _ReturnStackPointer_ 
#define _Q_CodeByteArray _Q_->CodeByteArray
#define _Q_CodeSpace _Q_->MemorySpace0->CodeSpace
#define _LC_ _Q_->OVT_LC 
#define _Compile_Int8( value ) ByteArray_AppendCopyItem ( _Q_CodeByteArray, 1, value )
#define _Compile_Int16( value ) ByteArray_AppendCopyItem ( _Q_CodeByteArray, 2, value )
#define _Compile_Int32( value ) ByteArray_AppendCopyItem ( _Q_CodeByteArray, 4, value )
#define _Compile_Int64( value ) ByteArray_AppendCopyItem ( _Q_CodeByteArray, 8, value )
#define _Compile_Cell( value ) ByteArray_AppendCopyItem ( _Q_CodeByteArray, sizeof(int64), value )
#define Here ( _ByteArray_Here ( _Q_CodeByteArray ) )
#define _SetHere( address )  _ByteArray_SetHere ( _Q_CodeByteArray, address ) 
#define SetDebuggerPreHere( address ) _Debugger_->PreHere = (address) 
#define Set_CompilerSpace( byteArray ) (_Q_CodeByteArray = (byteArray))
#define Get_CompilerSpace( ) _Q_CodeByteArray

//#define abs( x ) ((int64) (((x) >= 0) ? (x) : (-x))) 
#define TOS _Dsp_[0]
#define _TOS_ ( _Dsp_ ? _Dsp_ [ 0 ] : CfrTil_Exception (STACK_ERROR, 0, QUIT ), (uint64)-1 )
#define DSP_Top( ) TOS 
#define _DataStack_Top( ) TOS 
#define _DataStack_GetTop( ) TOS
#define _DataStack_SetTop( v ) _Dsp_ [ 0 ] = v ;
#define DataStack_SetTop( v ) { if ( _Dsp_ ) { _DataStack_SetTop( v ) } else { CfrTil_Exception (STACK_ERROR, 0, QUIT ) ; } }
#define _GetTop( ) TOS
#define _SetTop( v ) (TOS = v)
#define Stack() CfrTil_PrintDataStack ( )
#define DataStack( n ) _Dsp_ [ - (n) ] 
#define Dsp( n ) DataStack( n ) 

#define Calculate_FrameSize( numberOfLocals )  ( ( numberOfLocals + 1 ) * CELL ) // 1 : space for fp

#define _GetState( aState, state ) ( (aState) & (state) ) 
#define GetState( obj, state ) ((obj) && _GetState( (obj)->State, (state) )) 
#define _SetState( state, newState, flag ) ( ( (flag) > 0 ) ? ( (state) |= (newState) ) : ( (state) &= ~ (newState) ) ) 
#define SetState_TrueFalse( obj, _true, _false )  (obj) ? ( ( (obj)->State |= (_true) ), ( (obj)->State &= ~ (_false) ) ) : 0
#define SetState( obj, state, flag ) (obj) ? _SetState ( ((obj)->State), (state), flag ) : 0
#define SaveAndSetState( obj, state, flag ) (obj)->SavedState = ((obj)->State & (state)), _SetState ( ((obj)->State), (state), flag )
#define RestoreSavedState( obj, state ) SetState_TrueFalse ( obj, state, (obj)->SavedState )
#define Debugger_IsStepping( debugger ) GetState ( debugger, DBG_STEPPING )
#define Debugger_SetStepping( debugger, flag ) SetState ( debugger, DBG_STEPPING, flag )  
#define Debugger_SetMenu( debugger, flag ) SetState ( debugger, DBG_MENU, flag )
#define Debugger_IsNewLine( debugger ) GetState ( debugger, DBG_NEWLINE )
#define Debugger_SetNewLine( debugger, flag ) SetState ( debugger, DBG_NEWLINE, flag ) 

#define Set_CompileMode( tf ) SetState ( _Compiler_, (COMPILE_MODE), tf ) //; _LC_ ? SetState ( _LC_, LC_COMPILE_MODE, tf ) : 0 ; 
#define Get_CompileMode() GetState ( _Compiler_, (COMPILE_MODE) )  //|| ( _LC_ ? GetState ( _LC_, LC_COMPILE_MODE ) : 0 ) ) 
#define CompileMode GetState ( _Compiler_, (COMPILE_MODE) )  //|| ( _LC_ && GetState ( _LC_, ( LC_COMPILE_MODE ) ) ) ) : 0)
#define Compiling CompileMode
#define ImmediateWord( word) (word->CAttribute & IMMEDIATE)
#define CPrimitiveWord( word) (word->CAttribute & CPRIMITIVE)

#define Stack_N( stack, offset ) ((stack)->StackPointer [ (offset) ] )
#define Stack_OffsetValue( stack, offset ) ((stack)->StackPointer [ (offset) ] )
#define WordsBack( n ) CfrTil_WordList( (n) )
#define WordStack( n ) CfrTil_WordList( (n) )
#define N_FREE  1
#define N_UNLOCKED 2
#define N_LOCKED  4
#define N_IN_USE N_LOCKED
#define N_PERMANENT 8
#define Buffer_Data( b ) b->B_Data
#define Buffer_DataCleared( b ) Buffer_Data_Cleared (b) 
#define Buffer_Size( b ) b->B_Size
#define SetBuffersUnused( force ) Buffers_SetAsUnused ( force ) 
#define Buffer_MakePermanent( b ) b->InUseFlag = N_PERMANENT
#define Buffer_Lock( b ) b->InUseFlag = N_LOCKED
#define Buffer_Unlock( b ) b->InUseFlag = N_UNLOCKED
//#define Buffer_AllowReUse( b ) b->InUseFlag = B_FREE 
#define _Buffer_SetAsFree( b )  b->InUseFlag = N_FREE 

#define Attribute_FromWord( word ) (( Attribute * ) (word)->This )

// formatting
// ansi/vt102 escape code
#define ClearLine _ReadLine_PrintfClearTerminalLine ( )
#define Cursor_Up( n ) _Printf ( (byte*) "%c[%dA", ESC, n )
#define Color_Black 0
#define Color_Red 1
#define Color_Green 2
#define Color_Yellow 3
#define Color_Blue 4
#define Color_Magenta 5
#define Color_Cyan 6
#define Color_White 7
#define Color_Default 9

#define Colors_Setup6( c, fr, fg, fb, br, bg, bb )\
    int64 fr, fg, fb, br, bg, bb ;\
    fr = c->rgbcs_RgbColors.rgbc_Fg.Red, fg = c->rgbcs_RgbColors.rgbc_Fg.Green, fb = c->rgbcs_RgbColors.rgbc_Fg.Blue ;\
    br = c->rgbcs_RgbColors.rgbc_Bg.Red, bg = c->rgbcs_RgbColors.rgbc_Bg.Green, bb = c->rgbcs_RgbColors.rgbc_Bg.Blue ;

#define Colors_Get6( c, fr, fg, fb, br, bg, bb )\
    c->rgbcs_RgbColors.rgbc_Fg.Red = fr, c->rgbcs_RgbColors.rgbc_Fg.Green = fg, c->rgbcs_RgbColors.rgbc_Fg.Blue = fb ;\
    c->rgbcs_RgbColors.rgbc_Bg.Red = br, c->rgbcs_RgbColors.rgbc_Bg.Green = bg, c->rgbcs_RgbColors.rgbc_Bg.Blue = bb ;

#define _Show2Colors( fg, bg ) printf ( "%c[%ld;%ldm", ESC, fg, bg )
#define _ShowColors( fg, bg ) _Show2Colors( fg + 30, bg + 40 )
#define _String_Show2( buf, fg, bg ) sprintf ( (char*) buf, "%c[%ld;%ldm", ESC, fg, bg )
#define _String_ShowColors( buf, fg, bg ) _String_Show2 ( buf, fg + 30, bg + 40 )

#define DefaultColors Ovt_DefaultColors () 
#define AlertColors Ovt_AlertColors () 
#define DebugColors Ovt_DebugColors () 
#define NoticeColors Ovt_NoticeColors () 

// Change Colors
// code :: cc change colors : u user : d  default : a alert : g debug
#define cc( s, c ) (byte*) _String_InsertColors ( (byte*) ( (byte*) s ? (byte*) s : (byte*) "" ), (c) ) 
#define c_ud( s ) cc ( (byte*) s, (_Q_->Current == &_Q_->User) ? &_Q_->Default : &_Q_->User ) 
#define c_ad( s ) cc ( (byte*) s, (_Q_->Current == &_Q_->Alert) ? &_Q_->Default : &_Q_->Alert ) 
#define c_da( s ) cc ( (byte*) s, (_Q_->Current == &_Q_->Default) ? &_Q_->Alert : &_Q_->Default ) 
#define c_gd( s ) cc ( (byte*) s, (_Q_->Current == &_Q_->Debug) ? &_Q_->Default : &_Q_->Debug ) 
#define c_gu( s ) cc ( (byte*) s, (_Q_->Current == &_Q_->Debug) ? &_Q_->User : &_Q_->Debug ) 
#define c_ug( s ) cc ( (byte*) s, (_Q_->Current == &_Q_->User) ? &_Q_->Debug : &_Q_->User ) 
#define c_gn( s ) cc ( (byte*) s, (_Q_->Current == &_Q_->Debug) ? &_Q_->Notice : &_Q_->Debug ) 
#define c_g( s ) cc ( (byte*) s, &_Q_->Debug ) 
#define c_a( s ) cc ( (byte*) s, &_Q_->Alert ) 
#define c_d( s ) cc ( (byte*) s, &_Q_->Default ) 
#define c_u( s ) cc ( (byte*) s, &_Q_->User ) 
#define c_n( s ) cc ( (byte*) s, &_Q_->Notice ) 

#define TemporaryString_New( string ) String_New ( string, TEMPORARY ) 
#define IsWordRecursive CfrTil_CheckForGotoPoints ( GI_RECURSE )
#define AppendCharToSourceCode( c ) //_Lexer_AppendCharToSourceCode ( lexer, c ) 
#define ReadLine_Nl (ReadLine_PeekNextChar ( _Context_->ReadLiner0 ) == '\n')
#define ReadLine_Eof (ReadLine_PeekNextChar ( _Context_->ReadLiner0 ) == eof)
#define ReadLine_ClearLineQuick _Context_->ReadLiner0->InputLine [ 0 ] = 0 
#define _ReadLine_CursorPosition( rl ) (rl->CursorPosition)
#define ReadLine_GetCursorChar( rl ) (rl->InputLine [ _ReadLine_CursorPosition (rl) ])
#define ReadLine_SetCursorChar( rl, c ) (rl->InputLine [ _ReadLine_CursorPosition (rl) ] = c )
#define Stack_Clear( stk ) Stack_Init ( stk )

// exception handling
#define _try( object ) if ( _OpenVmTil_Try ( &object->JmpBuf0 ) ) 
//#define _catch( e ) if ( _OpenVmTil_Catch () ) // nb. : if no _throw in _catch block don't use 'return'
#define _finally _OpenVmTil_Finally () // nb. : ! use only once and after the first _try block !
#define _throw( e ) _Throw (e) // _longjmp( *(jmp_buf*) _Stack_PopOrTop ( _Q_->ExceptionStack ), e ) 
#define _Throw( e ) OpenVmTil_Throw ((e == QUIT) ? (byte*) "\nQuit?\n" : (e == ABORT) ? (byte*) "\nAbort?\n" : (byte*) "", 0, e, 1 )
#define _ThrowIt OpenVmTil_Throw ((byte*) "", (byte*) "", 0,  _Q_->Thrown, 1 )
#define Throw( emsg, smsg, e ) OpenVmTil_Throw (((byte*) emsg), ((byte*) smsg), (e), 1 )
#define ThrowIt( msg ) OpenVmTil_Throw (((byte*) msg),  _Q_->Thrown, 1 )
#define catchAll if ( _OpenVmTil_Catch () ) 
#define _SyntaxError( message, abortFlag ) CfrTil_Exception (SYNTAX_ERROR, message, abortFlag )
#define SyntaxError( abortFlag ) _SyntaxError( 0, abortFlag ) 
#define stopThisTry _OVT_PopExceptionStack ( )
#define stopTrying _OVT_ClearExceptionStack ( )

#define Assert( testBoolean ) d1 ({ if ( ! (testBoolean) ) { _Printf ( (byte*) "\n\nAssert failed : %s\n\n", _Context_Location ( _Context_ ) ) ; _throw ( QUIT ) ; }})
#define Pause() OpenVmTil_Pause ()
#define _Pause( msg ) _OpenVmTil_Pause ( msg )
#define Pause_1( msg ) AlertColors; _Printf ( (byte*)"\n%s", msg ) ; OpenVmTil_Pause () ;
#define Pause_2( msg, arg ) AlertColors; _Printf ( (byte*)msg, arg ) ; OpenVmTil_Pause () ;

#define Error_Abort( emsg, smsg ) Throw ( emsg, smsg, ABORT )
#define Error( emsg, smsg, state ) { AlertColors; if ((state) & PAUSE ) Pause () ; if ((state) >= QUIT ) Throw ( emsg, smsg, state ) ; }
#define Error_1( msg, arg, state ) AlertColors; if (state & PAUSE ) Pause () ; if (state >= QUIT ) Throw ( (byte*) msg, state ) ; 
#define Warning2( msg, str ) _Printf ( (byte*)"\n%s : %s", (byte*) msg, str ) ; 
#define Warning( msg, str, pauseFlag ) _Printf ( (byte*)"\n%s : %s", (byte*) msg, str ) ; if ( pauseFlag ) Pause () ;
#define ErrorWithContinuation( msg, continuation ) Throw ( (byte*) msg, continuation )
#define Error_Quit( msg ) ErrorWithContinuation( msg, QUIT )
#define ErrorN( n ) Throw ( (byte*) "", n )
#define ClearLine _ReadLine_PrintfClearTerminalLine ( )

// !! Get - Set - Exec !!
#define Get( obj, field ) obj->field
#define Set( obj, field, value ) (obj)->(field) = (value) 

#define Stringn_Equal( string1, string2, n ) (Strncmp ( (byte *) string1, (byte *) string2, n ) == 0 )
#define Stringni_Equal( string1, string2, n ) (Strnicmp ( (byte *) string1, (byte *) string2, n ) == 0 )
#define Stringi_Equal( string1, string2 ) (Stricmp ( (byte *) string1, (byte *) string2 ) == 0 )
#define String_Equal( string1, string2 ) (Strcmp ( (byte *) string1, (byte *) string2 ) == 0 )
#define sconvbs( d, s ) (byte*) _String_ConvertStringToBackSlash ( d, s, -1 )
#define String_CB( string0 ) String_ConvertToBackSlash ( string0 )

#define DEBUG_PRINTSTACK if ( GetState ( _CfrTil_, DEBUG_MODE )  ) CfrTil_PrintDataStack () ;
#define TypeNamespace_Get( object ) (object->TypeNamespace ? object->TypeNamespace : object->ContainingNamespace)
#define _Lexer_IsCharDelimiter( lexer, c ) lexer->DelimiterCharSet [ c ]
#define _Lexer_IsCharDelimiterOrDot( lexer, c ) lexer->DelimiterOrDotCharSet [ c ]

#define NAMESPACE_TYPE ( NAMESPACE | DOBJECT | CLASS | C_TYPE | C_CLASS | CLASS_CLONE )
#define NAMESPACE_RELATED_TYPE ( NAMESPACE_TYPE | OBJECT_FIELD )
#define OBJECT_TYPE ( LITERAL | CONSTANT | NAMESPACE_VARIABLE | LOCAL_VARIABLE | OBJECT | DOBJECT | PARAMETER_VARIABLE | T_LISP_SYMBOL ) // | T_LISP_SYMBOL
#define VARIABLE_TYPE ( NAMESPACE_VARIABLE | LOCAL_VARIABLE | OBJECT | OBJECT_FIELD | DOBJECT | PARAMETER_VARIABLE | T_LISP_SYMBOL )
#define NON_MORPHISM_TYPE ( OBJECT_TYPE | NAMESPACE_RELATED_TYPE )
#define IS_NON_MORPHISM_TYPE(word) (word->CAttribute & NON_MORPHISM_TYPE)
#define IS_MORPHISM_TYPE( word ) ( ( ( ! ( word->CAttribute & ( NON_MORPHISM_TYPE | DEBUG_WORD | OBJECT_OPERATOR ) ) ) && ( ! ( word->LAttribute & (T_LISP_SYMBOL ) ) ) && ( ! ( word->CAttribute2 & (ADDRESS_OF_OP) ) ) ) || ( word->CAttribute & ( CATEGORY_OP|KEYWORD|BLOCK ) ))

#define Is_NamespaceType( w ) ( w ? (( ( Namespace* ) w )->CAttribute & NAMESPACE_TYPE) : 0 )
#define Is_ValueType( w ) ( w ? ( ( Namespace* ) w )->CAttribute & (NON_MORPHISM_TYPE (w)) : 0 )
#define String_Init( s ) s[0]=0 ; 

// memory allocation
#define _Allocate( size, nba ) _ByteArray_AppendSpace ( nba->ba_CurrentByteArray, size ) 
#define object_Allocate( type, slots, allocType ) (type *) _object_Allocate ( sizeof ( type ) * slots, allocType ) 
#define _listObject_Allocate( nodeType, slotType, slots, allocType ) (type *) object_Allocate ( sizeof ( nodeType ) + (sizeof ( slotType ) * slots), allocType ) 

#define Get_NBA_Symbol_To_NBA( s )  ( NamedByteArray* ) ( ( ( Symbol* ) s )->S_pb_Data2 ) 
#define Get_NBA_Node_To_NBA( node )  ( NamedByteArray* ) ( ( ( Symbol* ) node )->S_pb_Data2 ) 
#define Get_BA_Symbol_To_BA( s )  ( ByteArray* ) ( ( ( Symbol* ) s )->S_pb_Data2 ) 
#define Set_NBA_Symbol_To_NBA( nba )  nba->NBA_Symbol.S_pb_Data2 = ( byte* ) nba
#define Set_BA_Symbol_To_BA( ba )  ba->BA_Symbol.S_pb_Data2 = ( byte* ) ba
#define MemCheck( block ) { Calculate_TotalNbaAccountedMemAllocated ( 1 ) ; block ; Calculate_TotalNbaAccountedMemAllocated ( 1 ) ; }

#define _Debugger_ _CfrTil_->Debugger0
#define DebugOff SetState ( _CfrTil_, DEBUG_MODE|_DEBUG_SHOW_, false )
#define DebugOn SetState ( _CfrTil_, DEBUG_MODE|_DEBUG_SHOW_, true ) 
#define DebugModeOff SetState ( _CfrTil_, DEBUG_MODE, false )
#define DebugShow_Off SetState ( _CfrTil_, _DEBUG_SHOW_, false ) 
#define DebugShow_On SetState ( _CfrTil_, _DEBUG_SHOW_, true ) 
#define Is_DebugModeOn ( _CfrTil_ && GetState ( _CfrTil_, DEBUG_MODE ) ) 
#define Is_DebugShowOn ( _CfrTil_ && GetState ( _CfrTil_, _DEBUG_SHOW_ ) ) 
#define _Is_DebugOn GetState ( _CfrTil_, _DEBUG_SHOW_ )
#define Is_DebugOn (Is_DebugShowOn && Is_DebugModeOn)
//#define _DEBUG_SETUP( word, token, address, force )  ( (word || token) && Is_DebugModeOn ) ? Debugger_PreSetup (_Debugger_, word, token, address, force ) : 0 
#define __DEBUG_SETUP( word, token, address, force )  ( (word || token) && Is_DebugModeOn ) ? _Debugger_PreSetup (_Debugger_, word, token, address, force ) : 0 
#define DEBUG_SETUP_TOKEN( token ) _DEBUG_SETUP( 0, token, 0 ) ;
#define DEBUG_SETUP_ADDRESS( address, force ) if ( (address) && Is_DebugModeOn ) Debugger_PreSetup (_Debugger_, 0, 0, address, force ) ;
#define DEBUG_SETUP( word ) _DEBUG_SETUP( word, 0, 0, 0 )
#define _DEBUG_SHOW( word, force ) _Debugger_PostShow ( _Debugger_, word, force ) ; //, token, word ) ;
#define DEBUG_SHOW Debugger_PostShow ( _Debugger_ ) ; //, token, word ) ;
#define DEBUG_ASM_SHOW_ON SetState ( _Debugger_, DBG_ASM_SHOW_ON, true ) 
#define DEBUG_ASM_SHOW_OFF SetState ( _Debugger_, DBG_ASM_SHOW_ON, false ) 
#define _DBI GetState ( _Debugger_, DBG_ASM_SHOW_ON ) 
#define DBI_ON DEBUG_ASM_SHOW_ON
#define DBI_OFF DEBUG_ASM_SHOW_OFF
#define DBI ( Is_DebugOn & _DBI )
#define Is_DebugOn_DBI ( Is_DebugOn ? DBI : 0 )
#define DBI_N( n ) (GetState ( _Debugger_, DBG_ASM_SHOW_ON ) && ( _Q_->Verbosity > n ) )
//#define TYPECHECK( word ) CfrTil_Typecheck ( word ) ;
#define IS_INCLUDING_FILES _Context_->System0->IncludeFileStackNumber

#define List_Init( list ) _dllist_Init ( list )
#define List_DropN( list, n ) _dllist_DropN ( list, n )
#define List_Pick_N_M( list, n ) List_Get_N_Node_M_Slot( list, n, 0 )  
#define List_New( allocType ) _dllist_New ( allocType ) 

#define _WordList_Pop( list ) _dllist_PopNode ( list )
#define DebugWordList_Push( dobj ) _dllist_AddNodeToHead ( _CfrTil_->DebugWordList, ( dlnode* ) dobj )
#define DbgWL_Push( node ) DebugWordList_Push( node )  
#define CfrTil_WordList_Push( word, inUseFlag ) _List_PushNew_ForWordList ( _CfrTil_->Compiler_N_M_Node_WordList, word, inUseFlag ) 
#define IsGlobalsSourceCodeOn ( GetState ( _CfrTil_, GLOBAL_SOURCE_CODE_MODE ))
#define _IsSourceCodeOn ( GetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE ) )
#define IsSourceCodeOn ( _IsSourceCodeOn || IsGlobalsSourceCodeOn )
#define IsSourceCodeOff (!IsSourceCodeOn) //( GetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE ) || IsGlobalsSourceCodeOn ))
#define Compiler_Word_SCHCPUSCA( word, clearFlag ) Compiler_SCA_Word_SetCodingHere_And_ClearPreviousUse ( word, clearFlag) 
#define Compiler_WordStack_SCHCPUSCA( index, clearFlag ) Compiler_Word_SCHCPUSCA (CfrTil_WordList ( index ), clearFlag) 
#define _SC_Global_On SetState ( _CfrTil_, GLOBAL_SOURCE_CODE_MODE, true )
#define SC_Global_On if ( GetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE ) ) { _SC_Global_On ; }
#define SC_Global_Off SetState ( _CfrTil_, GLOBAL_SOURCE_CODE_MODE, false )
//#define _Block_SCA( index ) _CfrTil_Block_SetSourceCodeAddress( index )
//#define _Block_SCA_Clear _Block_SCA( -1 ) ;
//#define L_SCI _Lexer_->SC_Index
#define Compiler_OptimizerWordList_Reset( compiler ) List_Init ( _CfrTil_->CompilerWordList ) 
#if 1
#define Word_SetTsrliScwi( word, tsrli, scwi ) \
    if ( word )\
    {\
    word->W_RL_Index = tsrli = ( tsrli != - 1 ) ? tsrli : _Lexer_->TokenStart_ReadLineIndex ;\
    word->W_SC_Index = scwi = ( scwi != - 1 ) ? scwi : _Lexer_->SC_Index ;\
    }
#else
#define _Word_SetTsrliScwi( word, tsrli, scwi ) Lexer_Set_ScIndex_RlIndex ( _Lexer_, word, (tsrli), (scwi) ) 
#define Word_SetTsrliScwi( word, tsrli, scwi ) Lexer_Set_ScIndex_RlIndex ( _Lexer_, word, (tsrli), (scwi) ) 
#endif

#define Strncat( dst, src, n ) strncat ( (char *__restrict) dst, (const char *__restrict) src, (size_t) n )
#define Strlen( s ) ( s ? strlen ( (const char *) s ) : 0 )
#define StringLength( s ) Strlen ( s )
//#define Strncpy( dst, src, n ) strncpy ( (char *__restrict) dst, (const char *__restrict) src, (size_t) n )
#define Map0( dllist, mf ) dllist_Map ( dllist, (MapFunction0) mf )

//#define MemCpy(dst, src, size) memcpy ((byte*)dst, (byte*)src, (int64) size)  //_MemCpy ((byte*)dst, (byte*)src, (int64) size)
#define MemCpy(dst, src, size) _MemCpy ((byte*)dst, (byte*)src, (int64) size)
#define ReadLiner_GetLastChar() _ReadLiner_->InputKeyedCharacter
#define ReadLiner_SetLastChar( chr ) if (_ReadLiner_) _ReadLiner_->InputKeyedCharacter = chr


