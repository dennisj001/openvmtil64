
#include "../include/cfrtil64.h"
// the codes are in the Tsi_ConvertTypeSigCodeToAttribute function below
// the logic here is still in an alpha prototype stage

Boolean
TSI_TypeCheck_NonTypeVariableSigCode ( TSI * tsi, Word * stackWord, int64 ti )
{
    byte owtsSigCode = tsi->OpWordTypeSignature [ti] ;
    tsi->TypeErrorStatus = false ;
    if ( stackWord && stackWord->Name )
    {
        uint64 attribute = Tsi_ConvertTypeSigCodeToAttribute ( owtsSigCode ) ;
        uint64 attribute2 = Tsi_ConvertTypeSigCodeToAttribute2 ( owtsSigCode ) ;
        if ( ( ! ( stackWord->CAttribute & attribute ) ) || ( ! ( stackWord->CAttribute2 & attribute2 ) ) )
        {
            if ( ( ( owtsSigCode != 'A' ) && ( owtsSigCode != '_' ) && ( owtsSigCode != 'U' ) )
                || ( stackWord->CAttribute & ( PARAMETER_VARIABLE | NAMESPACE_VARIABLE | LOCAL_VARIABLE | REGISTER_VARIABLE | T_LISP_SYMBOL | DOBJECT ) )
                || ( ( owtsSigCode == 'I' ) && ( stackWord->CAttribute & ( OBJECT | OBJECT_FIELD | T_BYTE | T_BOOLEAN ) ) ) ) // same type "kind"
            {
                // this is only initial alpha prototype logic, ie. needs to be refined/changed !!??!!
                // infering that ...
                stackWord->CAttribute |= attribute ;
                stackWord->CAttribute2 |= attribute2 ;
                if ( ! ( ( owtsSigCode == 'I' ) && ( stackWord->CAttribute & ( OBJECT | OBJECT_FIELD | T_BOOLEAN ) ) ) ) // same type "kind" for now ; should be more precise ??
                {
                    if ( ( tsi->WordBeingCompiled && ( stackWord->CAttribute & PARAMETER_VARIABLE ) ) ) //&& ( ! (tsi->WordBeingCompiled->W_TypeSignatureString [stackWord->Index - 1])))
                        tsi->WordBeingCompiled->W_TypeSignatureString [stackWord->Index - 1] = owtsSigCode ;
                    //tsi->WordBeingCompiled->W_TypeSignatureString [ti] = sigCode ;
                }
#if 0                
                if ( tsi->WordBeingCompiled && ( stackWord->CAttribute & ( OBJECT | OBJECT_FIELD ) ) ) //( sigCode == 'O' ) 
                {
                    tsi->WordBeingCompiled->W_TypeObjectsNamespaces [ti] = stackWord->TypeNamespace ; // ??
                    //tsi->WordBeingCompiled->W_TypeSignatureString [ti] = sigCode ;
                }
#endif                
                //return false ; // it will fall thru to return false
            }
        }
        else return tsi->TypeErrorStatus |= TSE_ERROR ;
    }
    return tsi->TypeErrorStatus ; // 
}

Boolean
TSI_TypeCheck_TypeVariableSigCodesAndSizes ( TSI * tsi )
{
    // word1 correlates with the type variable so it can anything
    // word0 is closer to top of stack than word1; word1 is lower in the stack than word 0
    // eg. if word0 is TOS word1 would be NOS
    // word1 was parsed and pushed before word0
    // in the case of equal ('=' : word1 = word0 , word1 word0 = , word0 word1 store) word1 can be a type variable and word0 can be any fixed type
    // word1 is lvalue, word0 = rvalue with =/store opWord, word1 can be a type variable and word0 can be any fixed type
    uint64 stackWord0_CAttribute, stackWord0_CAttribute2 ;
    Word * stackWord0 = tsi->StackWord0, *stackWord1 = tsi->StackWord1 ;
    tsi->TypeErrorStatus = false ; // default 
    //if ( tsi->OpWord->CAttribute & CATEGORY_OP_STORE ) needs to be considered ??
    if ( stackWord0 && stackWord1 && stackWord1->Name && stackWord0->Name )
    {
        if ( stackWord1->ObjectByteSize && ( stackWord0->ObjectByteSize > stackWord1->ObjectByteSize ) ) tsi->TypeErrorStatus |= ( TSE_SIZE_MISMATCH ) ;
#if 1       
        else if ( stackWord1->TypeNamespace )
        {
            if ( ! stackWord0->TypeNamespace )
#if 0                
            {
                //if ( stackWord0->TypeNamespace != stackWord1->TypeNamespace ) tsi->TypeErrorStatus |= TSE_ERROR ;
            }
            else
#endif                
            {
                stackWord0->TypeNamespace = stackWord1->TypeNamespace ;
            }
        }
        else if ( stackWord0->TypeNamespace )
        {
            stackWord1->TypeNamespace = stackWord0->TypeNamespace ;
            //tsi->TypeErrorStatus = false ;
        }
#endif        
        else
        {
            stackWord0_CAttribute = ( stackWord0->CAttribute & ( T_BYTE | T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT | T_UNDEFINED | T_VOID ) ) ;
            stackWord0_CAttribute2 = ( stackWord0->CAttribute2 & ( T_INT16 | T_INT32 | T_ANY ) ) ;
            if ( stackWord0_CAttribute || stackWord0_CAttribute2 )
            {
                //if ( ( stackWord1->CAttribute2 & ( T_INT16 | T_INT32 | T_ANY | T_TYPE_VARIABLE ) )
                //    || ( ! ( stackWord1->CAttribute & ( T_BYTE | T_INT | T_BIG_NUM | T_STRING | T_BOOLEAN | OBJECT | T_ANY | T_UNDEFINED | T_VOID ) ) ) )
                //if ( ( ! ( stackWord1->CAttribute & stackWord0_CAttribute ) ) && ( ! ( stackWord1->CAttribute2 & T_TYPE_VARIABLE ) ) && ( ! ( stackWord0->CAttribute & ( T_ANY | T_UNDEFINED ) ) ) )
                //    tsi->TypeErrorStatus |= TSE_ERROR ;
                //else
                {
                    // we infer that ...
                    stackWord1->CAttribute |= stackWord0_CAttribute ;
                    stackWord1->CAttribute2 |= stackWord0_CAttribute2 ;
                    Word_SetTypeNamespace ( stackWord1, stackWord1->CAttribute ) ;
                    if ( stackWord1->Name && tsi->WordBeingCompiled && ( stackWord1->CAttribute & PARAMETER_VARIABLE ) )
                    {
                        tsi->WordBeingCompiled->W_TypeSignatureString [stackWord1->Index - 1] = Tsi_Convert_Word_TypeAttributeToTypeLetterCode ( stackWord0 ) ;
                        if ( stackWord0->CAttribute & OBJECT )
                            tsi->WordBeingCompiled->W_TypeObjectsNamespaces [stackWord1->Index - 1] = stackWord0->TypeNamespace ; // ??
                    }
                }
            }
        }
    }
    return tsi->TypeErrorStatus ;
}

Boolean
TSI_TypeCheckAndInfer ( TSI * tsi )
{
    int64 tsl, si, ti ;
    Word * stackWord, *stackWord0, *stackWord1 ;
    for ( tsi->OpWord_ReturnsACodedValue_Flag = false, si = 0 ; si < 7 ; si ++ )
    {
        if ( tsi->OpWordTypeSignature [si] == '.' )
        {
            tsi->OpWordReturnSignatureLetterCode = tsi->OpWordTypeSignature [si + 1] ;
            if ( ( tsi->OpWordReturnSignatureLetterCode != 'V' ) && ( tsi->OpWordReturnSignatureLetterCode != '_' ) ) tsi->OpWord_ReturnsACodedValue_Flag = true ;
            break ;
        }
    }
    tsi->OpWordFunctionTypeSignatureLength = Word_TypeSignatureLength ( tsi->OpWord, 1 ) ;
    if ( tsi->WordBeingCompiled && ( ! tsi->WordBeingCompiled->W_TypeSignatureString [0] ) ) strncpy ( ( char* ) tsi->WordBeingCompiled->W_TypeSignatureString, "_______", 8 ) ;
    tsl = ( tsi->OpWordFunctionTypeSignatureLength <= tsi->TypeStackDepth ) ? tsi->OpWordFunctionTypeSignatureLength : tsi->TypeStackDepth ;
    if ( Is_DebugOn )
    {
        TSI_Debug_PreTypeStatus_Print ( tsi ) ;
        CfrTil_TypeStackPrint ( ) ;
    }
    for ( si = 0, ti = tsl - 1 ; si < tsl ; si ++, ti -- ) // si stack index : 0 : top of stack ; ti type string index :  - 1 : zero indexed byte arrays
        // the type signature is a string that correlates with the typeStack in a rpn way where letters earlier in the string correlate with lower in the typeStack
        // so si = 0, stack index, correlates with the top of the type stack; ti = tsl - 1, type index, correlates with last character in the typeSignature code string
        // i've chosen to start with the top of the stack and its correlate in the type string
    {
        stackWord = ( Word * ) tsi->TypeWordStack->StackPointer [ - si ] ; // lower in stack (greater index) corresponds to earlier sigCode (lesser index)
        TSI_UpdateActualTypeStackRecordingBuffer ( tsi, stackWord, si ) ;
        if ( ! tsi->TypeErrorStatus )
        {
            if ( ( tsi->OpWordTypeSignature [ti] == 'X' ) && ( tsi->OpWord->CAttribute & ( CATEGORY_OP_EQUAL | CATEGORY_OP_STORE ) ) ) // 'X' is code for a type variable
            {
                // word1 correlates with the type variable so it can anything
                // word0 is closer to top of stack than word1; word1 is lower in the stack than word 0
                // word1 was parsed and pushed before word0
                // in the case of equal ('=' : word1 = word0 , word1 word0 = , word0 word1 store) word1 will be a type variable and word0 can be any fixed type
                if ( tsi->OpWord->CAttribute & CATEGORY_OP_EQUAL )
                {
                    tsi->StackWord0 = ( Word * ) tsi->TypeWordStack->StackPointer [ 0 ], tsi->StackWord1 = ( Word * ) tsi->TypeWordStack->StackPointer [ - 1 ] ; // this idea seems right ??
                }
                else if ( tsi->OpWord->CAttribute & CATEGORY_OP_STORE )
                {
                    tsi->StackWord1 = ( Word * ) tsi->TypeWordStack->StackPointer [ 0 ], tsi->StackWord0 = ( Word * ) tsi->TypeWordStack->StackPointer [ - 1 ] ; // this idea seems right ??
                }
                TSI_TypeCheck_TypeVariableSigCodesAndSizes ( tsi ) ;
            }
            else //  case 'A': case 'N': case 'I': case 'Y' : case 'S': case 'B': case 'O': case 'V': case '_': 
                //if ( TSI_TypeCheck_NonTypeVariableSigCode ( tsi, stackWord, tsi->OpWordTypeSignature [ti] ) ) tsi->TypeErrorStatus |= TSE_ERROR ;
                TSI_TypeCheck_NonTypeVariableSigCode ( tsi, stackWord, ti ) ;
        }
        else break ;
    }
    return tsi->TypeErrorStatus ;
}

TSI *
TSI_Init ( TSI *tsi, Word* opWord )
{
    tsi->TypeWordStack = _CfrTil_->TypeWordStack ;
    tsi->OpWord = opWord ;
    tsi->OpWordTypeSignature = opWord->W_TypeSignatureString ;
    tsi->TypeStackDepth = Stack_Depth ( tsi->TypeWordStack ) ; //depth ;
    tsi->TypeErrorStatus = false ;
    tsi->WordBeingCompiled = Compiling ? _CfrTil_->CurrentWordBeingCompiled : 0 ;
    return tsi ;
}

TSI *
TSI_New ( Word* opWord, uint64 allocType )
{
    TypeStatusInfo *tsi = ( TypeStatusInfo * ) Mem_Allocate ( sizeof (TypeStatusInfo ), allocType ) ;
    tsi = TSI_Init ( tsi, opWord ) ;
    return tsi ;
}

void
CfrTil_Typecheck ( Word * opWord )
{
    //if ( ! GetState ( _Compiler_, C_INFIX_EQUAL ) )
    {
        if ( GetState ( _CfrTil_, ( TYPECHECK_ON | DBG_TYPECHECK_ON ) ) && ( opWord->W_TypeSignatureString[0] ) ) //&& ( depth = Stack_Depth ( _CfrTil_->TypeWordStack ) ) ) // 0 depth with a 
        {
            if ( ! GetState ( _Compiler_, ( DOING_BEFORE_AN_INFIX_WORD | DOING_BEFORE_A_PREFIX_WORD ) ) )
            {
                TSI * tsi = TSI_New ( opWord, COMPILER_TEMP ) ;
                TSI_TypeCheckAndInfer ( tsi ) ;
                if ( tsi->TypeErrorStatus ) TSI_ShowTypeErrorStatus ( tsi ) ;
            }
            //else if ( ( opWord->W_TypeSignatureString[0] == '.' ) && ( opWord->W_TypeSignatureString[0] != 'V' ) ) CfrTil_TypeStackPush ( Context_CurrentWord ( ) ) ;
            if ( Word_DoesTypeSignatureShowAReturnValue ( opWord ) ) CfrTil_TypeStackPush ( opWord ) ; //Context_CurrentWord ( ) ) ;
        }
    }
}

void
TSI_Debug_PreTypeStatus_Print ( TSI *tsi )
{
    _Printf ( ( byte* ) "\n%s.%s :: type expected : %s : at %s",
        tsi->OpWord->S_ContainingNamespace ? tsi->OpWord->S_ContainingNamespace->Name : ( byte* ) "<literal>", tsi->OpWord->Name,
        Word_ExpandTypeLetterSignature ( tsi->OpWord, 1 ), Context_Location ( ) ) ;
}

Boolean
_TypeMismatch_CheckError_Print ( Word * lvalueWord, Word *rvalueWord, Boolean quitFlag )
{
    int64 lvalueSize = lvalueWord->ObjectByteSize, rvalueSize = rvalueWord->ObjectByteSize ;
    if ( ( lvalueSize > 0 ) && ( rvalueSize > lvalueSize ) ) // for C internal lvalue size may be 0
    {
        _Printf ( "\nTypeError : Wrong data sizes :: lvalue : %s : size == %ld :: rvalue : %s : size == %ld",
            lvalueWord->Name, lvalueSize, rvalueWord->Name, rvalueSize ) ;
        if ( quitFlag ) Error ( "\nType Error", "", QUIT ) ;
        return true ;
    }
    return false ;
}

void
TSI_TypeMismatchError_Print ( TSI *tsi )
{
    Word * lvalueWord = tsi->StackWord1, *rvalueWord = tsi->StackWord0 ;
    _TypeMismatch_CheckError_Print ( lvalueWord, rvalueWord, 0 ) ;
}

void
TSI_TypeStatus_Print ( TSI *tsi )
{
    if ( tsi->TypeErrorStatus & TSE_SIZE_MISMATCH ) TSI_TypeMismatchError_Print ( tsi ) ;
    _Printf ( ( byte* ) "\n%s :: %s.%s :: type expected : %s :: type recorded : %s : at %s", tsi->TypeErrorStatus ? "apparent type mismatch" : "type match",
        tsi->OpWord->S_ContainingNamespace ? tsi->OpWord->S_ContainingNamespace->Name : ( byte* ) "<literal>",
        tsi->OpWord->Name, Word_ExpandTypeLetterSignature ( tsi->OpWord, 1 ), tsi->ActualTypeStackRecordingBuffer, Context_Location ( ) ) ;
    //if ( GetState ( _CfrTil_, DBG_TYPECHECK_ON ) )
    {
        CfrTil_TypeStackPrint ( ) ;
        //if ( _Q_->Verbosity > 1 ) 
        Pause ( ) ;
        //byte * warning = "Apparent TypeMismatch : " ;
        //Warning ( warning, Context_Location ( ), 0 ) ;
    }
}

void
TSI_ShowTypeErrorStatus ( TSI *tsi )
{
    byte * warning = "Apparent TypeMismatch : " ;
    CfrTil_ShowInfo ( tsi->OpWord, warning, 0 ) ;
    TSI_TypeStatus_Print ( tsi ) ;
    CfrTil_TypeStackReset ( ) ;
}

void
TSI_UpdateActualTypeStackRecordingBuffer ( TSI * tsi, Word * word, Boolean prefixWithSeparatorFlag )
{
    byte *atsrb ;
    if ( word )
    {
        // we want to insert in at the beginning because of how they were pushed 
        byte _buffer [128], *buffer ;
        atsrb = tsi->ActualTypeStackRecordingBuffer ;
        _buffer[0] = 0 ;
        buffer = _buffer ;
        tsi->ExpandedTypeCodeBuffer [0] = 0 ; // init
        byte wtlc = Tsi_Convert_Word_TypeAttributeToTypeLetterCode ( word ) ;
        byte *etlc = Tsi_ExpandTypeLetterCode ( wtlc, tsi->ExpandedTypeCodeBuffer ) ;
        Strncat ( buffer, etlc, 127 ) ;
        if ( prefixWithSeparatorFlag ) strcat ( ( char* ) buffer, ". " ) ;
        //strncat ( buffer, tsi->ActualTypeStackRecordingBuffer, 128 ) ;
        //strncpy ( tsi->ActualTypeStackRecordingBuffer, buffer, 128 ) ;
        Strncat ( buffer, atsrb, 127 ) ;
        Strncpy ( atsrb, buffer, 127 ) ;
    }
}

byte *
Tsi_ExpandTypeLetterCode ( byte typeCode, byte * buffer )
{
    byte * letterCode = "" ;
    switch ( typeCode )
    {
        case 'I':
        {
            letterCode = "Integer " ;
            break ;
        }
        case 'X':
        {
            letterCode = "TypeVariable " ; // or a type unknown or unset as of now
            break ;
        }
        case 'S':
        {
            letterCode = "String " ;
            break ;
        }
        case 'N':
        {
            letterCode = "BigNum " ;
            break ;
        }
        case 'Y':
        {
            letterCode = "Byte " ;
            break ;
        }
        case '2':
        {
            letterCode = "Int16 " ;
            break ;
        }
        case '4':
        {
            letterCode = "Int32 " ;
            break ;
        }
        case 'B':
        {
            letterCode = "Boolean " ;
            break ;
        }
        case 'O':
        {
            letterCode = "Object " ;
            break ;
        }
        case 'A':
        {
            letterCode = "Any " ; // Any fixed, non variable type
            break ;
        }
        case '_':
        {
            letterCode = "Undefined " ; // == Any or TypeVariable
            break ;
        }
        case 'V':
        {
            letterCode = "Void " ;
            break ;
        }
        case '.':
        {
            letterCode = "-> " ;
            //tsi->dot = true ;
            break ;
        }
        default: break ;
    }
    strcpy ( ( char* ) buffer, ( char* ) letterCode ) ;
    return buffer ;
}

void
Word_TypeChecking_SetInfoForAnObject ( Word * word )
{
    Word * cwbc = _CfrTil_->CurrentWordBeingCompiled ;
    cwbc->W_TypeSignatureString [word->Index - 1] = 'O' ;
    cwbc->W_TypeObjectsNamespaces [word->Index - 1] = word->TypeNamespace ;
}

byte
Word_DoesTypeSignatureShowAReturnValue ( Word * word )
{
    byte * ts = word->W_TypeSignatureString ;
    int64 i, slts = Strlen ( ts ) ;
    for ( i = 0 ; ( i > slts ) ; i ++ ) // -1 : 0 indexing byte array 
    {
        if ( ( ts[i] == '.' ) && ( ts[i + 1] ) ) return ts[i + 1] ;
    }
    return false ;
}

int64
Word_TypeSignatureLength ( Word * word, Boolean numberOfParametersOnly )
{
    byte * ts = word->W_TypeSignatureString ;
    int64 slts = Strlen ( ts ), length, l0, i ;
    for ( i = slts ; i && ts[i] ; i -- ) // -1 : 0 indexing byte array 
    {
        if ( ( ts[i] != '_' ) ) break ; //&& ( ts[i - 1] != '_' ) ) break ;
    }
    length = i ; // + 1 : back to string length
    if ( numberOfParametersOnly )
    {
        for ( l0 = length ; i >= 0 ; i -- )
        {
            if ( ts[i] == '.' )
            {
                l0 = ( i < 0 ) ? 0 : i ;
                break ;
            }
        }
        length = l0 ;
    }
    return length ;
}

byte *
Word_TypeSignature ( Word * word, byte * buffer )
{
    if ( word->CAttribute2 & T_INT16 ) Strncat ( buffer, "Int16 ", 7 ) ;
    else if ( word->CAttribute2 & T_INT32 ) Strncat ( buffer, "Int32 ", 7 ) ;
    else if ( word->CAttribute & T_BYTE ) Strncat ( buffer, "Byte ", 6 ) ;
    else if ( word->CAttribute & T_STRING ) Strncat ( buffer, "String ", 8 ) ;
    else if ( word->CAttribute & T_BIG_NUM ) Strncat ( buffer, "BigNum ", 8 ) ;
    else if ( word->CAttribute & T_BOOLEAN ) Strncat ( buffer, "Boolean ", 9 ) ;
    else if ( word->CAttribute2 & T_ANY ) Strncat ( buffer, "Any ", 5 ) ;
    else if ( word->CAttribute & OBJECT ) Strncat ( buffer, "Object ", 8 ) ;
    else if ( word->CAttribute & T_INT ) Strncat ( buffer, "Integer ", 9 ) ;
    else Strncat ( buffer, "Undefined ", 11 ) ;
    return buffer ;
}

byte *
Word_ExpandTypeLetterSignature ( Word * word, Boolean parametersOnly )
{
    byte tsLetterCode, *ts = word->W_TypeSignatureString, abuffer [64] ;
    byte *buffer = Buffer_Data_Cleared ( _CfrTil_->StrCatBuffer ) ;
    int64 i, tsl = Word_TypeSignatureLength ( word, parametersOnly ) ;
    buffer [0] = 0 ; // init
    for ( i = 0 ; i < tsl ; i ++ )
    {
        tsLetterCode = ts [i] ;
        Tsi_ExpandTypeLetterCode ( tsLetterCode, abuffer ) ;
        if ( ( tsLetterCode != '_' ) && abuffer[0] )
        {
            if ( String_Equal ( abuffer, "-> " ) )
            {
                if ( ! parametersOnly ) strcat ( ( char* ) buffer, ( char* ) abuffer ) ;
                continue ;
            }
            strcat ( ( char* ) buffer, ( char* ) abuffer ) ;
            if ( ( ( i + 1 ) == tsl ) || ( ( ts [i + 1] == '.' ) || ( ts [i + 1] == '_' ) ) ) continue ;
            else strcat ( ( char* ) buffer, ". " ) ; // == cartesian product symbol
        }
        else break ;
    }
    return buffer ;
}

uint64
Tsi_ConvertTypeSigCodeToAttribute ( byte signatureCode )
{
    switch ( signatureCode )
    {
        case 'I': return T_INT ;
        case 'Y': return T_BYTE ;
        case 'O': return OBJECT ;
        case 'B': return T_BOOLEAN ;
        case 'N': return T_BIG_NUM ;
        case 'S': return T_STRING ;
        case 'V': return T_VOID ;
        case 'U': case '_': default: return 0 ;
    }
}

uint64
Tsi_ConvertTypeSigCodeToAttribute2 ( byte signatureCode )
{
    switch ( signatureCode )
    {
        case 'A': return T_ANY ;
        case 'X': return T_TYPE_VARIABLE ;
        case 'Z': return T_SIZE_CHECK ;
        case '2': return T_INT16 ;
        case '4': return T_INT32 ;
        case 'U': case '_': default: return 0 ;
    }
}

byte
Tsi_Convert_Word_TypeAttributeToTypeLetterCode ( Word * word )
{
    if ( word->CAttribute & T_BIG_NUM ) return 'N' ;
    else if ( word->CAttribute & T_STRING ) return 'S' ;
    else if ( word->CAttribute & T_BYTE ) return 'Y' ;
    else if ( word->CAttribute2 & T_INT32 ) return '4' ; // 4 bytes long
    else if ( word->CAttribute2 & T_INT16 ) return '2' ; // 2 bytes long
    else if ( word->CAttribute & T_INT ) return 'I' ;
    else if ( word->CAttribute & T_BOOLEAN ) return 'B' ;
    else if ( word->CAttribute & OBJECT ) return 'O' ;
    else if ( word->CAttribute & T_VOID ) return 'V' ;
    else if ( word->CAttribute2 & T_ANY ) return 'A' ;
    else if ( word->CAttribute2 & T_TYPE_VARIABLE ) return 'X' ;
        //else if ( word->CAttribute & T_UNDEFINED ) return '_' ;
    else return '_' ;
}

void
Word_SetTypeNamespace ( Word * word, int64 attribute )
{
    if ( _Compiler_->AutoVarTypeNamespace ) word->TypeNamespace = _Compiler_->AutoVarTypeNamespace ;
    else if ( attribute & T_INT ) word->TypeNamespace = _CfrTil_->IntegerNamespace ;
    else if ( attribute & T_STRING ) word->TypeNamespace = _CfrTil_->StringNamespace ;
    else if ( attribute & T_BIG_NUM ) word->TypeNamespace = _CfrTil_->BigNumNamespace ;
    else if ( attribute & T_RAW_STRING ) word->TypeNamespace = _CfrTil_->RawStringNamespace ;
}

void
_CfrTil_TypeStackReset ( )
{
#if 0 // while not this ??
    Stack * stack = _CfrTil_->TypeWordStack ;
    int64 i, i0 = Stack_Depth ( stack ) ;
    while ( i = Stack_Depth ( stack ) )
    {
        Word * tword = ( Word * ) Stack_Pop ( stack ) ;
        _CheckRecycleWord ( tword ) ;
    }
#endif    
    Stack_Init ( _CfrTil_->TypeWordStack ) ;
}

void
CfrTil_TypeStackPrint ( )
{
    Stack_Print ( _CfrTil_->TypeWordStack, ( byte* ) "TypeWordStack", 1 ) ;
}

void
CfrTil_TypeStackReset ( )
{
    //if ( GetState ( _CfrTil_, TYPECHECK_ON ) ) 
    _CfrTil_TypeStackReset ( ) ;
}

void
CfrTil_TypeStackPush ( Word * word )
{
    //if ( GetState ( _CfrTil_, TYPECHECK_ON ) ) 
    Stack_Push ( _CfrTil_->TypeWordStack, ( int64 ) word ) ;
}

void
CfrTil_TypeStack_SetTop ( Word * word )
{
    //if ( GetState ( _CfrTil_, TYPECHECK_ON ) ) 
    Stack_SetTop ( _CfrTil_->TypeWordStack, ( int64 ) word ) ;
}

Word *
CfrTil_TypeStack_Pop ( )
{
    //if ( GetState ( _CfrTil_, TYPECHECK_ON ) && Stack_Depth ( _CfrTil_->TypeWordStack ) )
    if ( Stack_Depth ( _CfrTil_->TypeWordStack ) )
    {
        Word * tword = ( Word * ) Stack_Pop ( _CfrTil_->TypeWordStack ) ;
        return tword ;
    }
    return 0 ;
}

void
CfrTil_TypeStack_Drop ( )
{
    //if ( GetState ( _CfrTil_, TYPECHECK_ON ) && Stack_Depth ( _CfrTil_->TypeWordStack ) )
    if ( Stack_Depth ( _CfrTil_->TypeWordStack ) )
    {
        _Stack_Drop ( _CfrTil_->TypeWordStack ) ;
    }
}

void
CfrTil_TypeStack_Dup ( )
{
    if ( GetState ( _CfrTil_, TYPECHECK_ON ) )
    {
        if ( Stack_Depth ( _CfrTil_->TypeWordStack ) ) Stack_Dup ( _CfrTil_->TypeWordStack ) ;
        else CfrTil_TypeStackPush ( CfrTil_WordList ( 0 ) ) ;
    }
}

void
CfrTil_TypeCheckOn ( )
{
    SetState ( _CfrTil_, TYPECHECK_ON, true ) ;
}

void
CfrTil_TypeCheckOff ( )
{
    CfrTil_TypeStackReset ( ) ;
    SetState ( _CfrTil_, TYPECHECK_ON, false ) ;
}

void
CfrTil_DbgTypecheckOff ( )
{
    SetState ( _CfrTil_, DBG_TYPECHECK_ON, false ) ;
}

void
CfrTil_DbgTypecheckOn ( )
{
    SetState ( _CfrTil_, DBG_TYPECHECK_ON, true ) ;
}

void
CfrTil_ShowTypeWordStack ( )
{
    //if ( GetState ( _CfrTil_, TYPECHECK_ON ) ) 
    Stack_Print ( _CfrTil_->TypeWordStack, ( byte* ) "TypeWordStack", 1 ) ;
    //else _Printf ( (byte*)"\ntypeChecking is off" ) ;
}

