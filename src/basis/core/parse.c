#include "../../include/cfrtil64.h"

// ?? seems way to complicated and maybe should be integrated with Lexer_ParseObject

void
_CfrTil_SingleQuote ( )
{
    ReadLiner * rl = _ReadLiner_ ;
    Lexer * lexer = _Lexer_ ;
    Word *word, * sqWord = _CfrTil_WordList_TopWord ( ) ; //single quote word
    byte buffer [5] ;
    byte c0, c1, c2 ;
    uint64 charLiteral = 0 ;

    //if ( ! Compiling ) _CfrTil_InitSourceCode_WithName ( _CfrTil_, lexer->OriginalToken ) ;
    // remember : _ReadLine_PeekIndexedChar ( rl, 0 ) is the *next* char to be read
    //if ( sqWord && sqWord->Name[0] == '\'' && ( ( ( c1 = _ReadLine_PeekIndexedChar ( rl, 1 ) ) == '\'' ) || ( ( c0 = _ReadLine_PeekIndexedChar ( rl, 0 ) ) == '\\' ) ) )// parse a char type, eg. 'c' 
    c0 = _ReadLine_PeekOffsetChar ( rl, 0 ) ; // parse a char type, eg. 'c' 
    c1 = _ReadLine_PeekOffsetChar ( rl, 1 ) ;
    if ( sqWord && sqWord->Name[0] == '\'' && ( c1 == '\'' ) || ( c0 == '\\' ) ) // parse a char type, eg. 'c' 
    {
        // notation :: c0 = original ' ; c1 = next char, etc.
        c0 = _ReadLine_GetNextChar ( rl ) ;
        c1 = _ReadLine_GetNextChar ( rl ) ;
        buffer[0] = '\'' ;
        buffer[1] = c0 ;
        if ( c0 == '\\' )
        {
            c2 = _ReadLine_GetNextChar ( rl ) ; // the closing '\''
            if ( c1 == 't' ) charLiteral = 0x9 ;
            else if ( c1 == 'n' ) charLiteral = 0xa ;
            else if ( c1 == 'r' ) charLiteral = 0xd ;
            else if ( c1 == 'b' ) charLiteral = 0x8 ;
            buffer[2] = c1 ;
            buffer[3] = '\'' ; // c3
            buffer[4] = 0 ;
        }
        else
        {
            charLiteral = c0 ;
            buffer[2] = '\'' ; // c2
            buffer[3] = 0 ;
        }
done:
        CfrTil_WordLists_PopWord ( ) ; // pop the "'" token
        word = _DObject_New ( buffer, charLiteral, LITERAL | CONSTANT | IMMEDIATE, 0, 0, LITERAL, ( byte* ) _DataObject_Run, 0, 0, 0, DICTIONARY ) ;
        word->ObjectByteSize = 1 ;
        Interpreter_DoWord ( _Interpreter_, word, - 1, - 1 ) ; //_Lexer_->TokenStart_ReadLineIndex ) ;
    }
    else
    {
        if ( ! Compiling ) CfrTil_InitSourceCode_WithName ( _CfrTil_, lexer->OriginalToken, 0 ) ;
        byte * token = ( byte* ) "" ;
        while ( 1 )
        {
            int64 i = lexer->TokenEnd_ReadLineIndex ;
            while ( ( i < rl->MaxEndPosition ) && ( rl->InputLine [ i ] == ' ' ) ) i ++ ;
            if ( _Lexer_IsTokenForwardDotted ( _Lexer_, i + 1 ) ) // 1 : pre-adjust for an adjustment in _Lexer_IsTokenForwardDotted
            {
                token = Lexer_ReadToken ( lexer ) ;
                if ( String_Equal ( ".", ( char* ) token ) ) continue ;
                word = _Interpreter_TokenToWord ( _Interpreter_, token, - 1, - 1 ) ;
                word->ObjectByteSize = 8 ;
                if ( word && ( word->CAttribute & ( C_TYPE | C_CLASS | NAMESPACE ) ) ) Finder_SetQualifyingNamespace ( _Finder_, word ) ;
                else
                {
                    DataStack_Push ( ( int64 ) token ) ;
                    return ;
                }
            }
            else break ;
        }
        if ( ( ! AtCommandLine ( rl ) ) && ( ! GetState ( _CfrTil_, SOURCE_CODE_STARTED ) ) ) CfrTil_InitSourceCode_WithName ( _CfrTil_, lexer->OriginalToken, 0 ) ;
        CfrTil_Token ( ) ;
    }
}

// assuming we are using "Class" namespace
// syntax : ':{' ( classId identifer ( '[' integer ']' )* ';' ? )* '};'

int64
_CfrTil_Parse_ClassStructure ( int64 cloneFlag )
{
    int64 size = 0, offset = 0, sizeOf = 0, i, arrayDimensionSize ;
    Namespace *ns, *classNs = _CfrTil_Namespace_InNamespaceGet ( ), *baseObject ;
    byte * token ;
    int64 arrayDimensions [ 32 ] ; // 32 : max dimensions for now
    memset ( arrayDimensions, 0, sizeof (arrayDimensions ) ) ;
    if ( cloneFlag )
    {
        offset = _Namespace_VariableValueGet ( classNs, ( byte* ) "size" ) ; // allows for cloning - prototyping
        sizeOf = offset ;
    }
    //Namespace_AddToNamespaces_SetUsing ( Namespace_Find ( (byte*) "C_Typedef" ), 1, USING ) ;
    while ( 1 )
    {
        // each name/word is an increasing offset from object address on stack
        // first name is at 0 offset
        _CfrTil_Namespace_InNamespaceSet ( classNs ) ; // parsing arrays changes namespace so reset it here
        token = _Lexer_ReadToken ( _Context_->Lexer0, ( byte* ) " ,\n\r\t" ) ;
gotNextToken:
        if ( String_Equal ( ( char* ) token, "};" ) ) break ;
        if ( ( String_Equal ( ( char* ) token, "}" ) ) && GetState ( _Context_, C_SYNTAX ) )
        {
            CfrTil_TypedefStructEnd ( ) ;
            break ;
        }
        if ( String_Equal ( ( char* ) token, ";" ) ) continue ;
        if ( String_Equal ( ( char* ) token, "//" ) )
        {
            ReadLiner_CommentToEndOfLine ( _Context_->ReadLiner0 ) ;
            continue ;
        }
        ns = _Namespace_Find ( token, 0, 0 ) ;
        if ( ns && ( size = _Namespace_VariableValueGet ( ns, ( byte* ) "size" ) ) )
        {
            token = Lexer_ReadToken ( _Context_->Lexer0 ) ;
            baseObject = _CfrTil_ClassField_New ( token, ns, size, offset ) ; // nb! : in case there is an array so it will be there for ArrayDimensions
            baseObject->ObjectByteSize = size ;
            token = Lexer_Peek_Next_NonDebugTokenWord ( _Context_->Lexer0, 1, 0 ) ;
            if ( token [0] != '[' )
            {
                offset += size ;
                sizeOf += size ;
                continue ;
            }
        }
        else
        {
            Word * word = Finder_Word_FindUsing ( _Finder_, token, 0 ) ;
            if ( word && word->CAttribute & DEBUG_WORD ) Interpreter_DoWord ( _Interpreter_, word, _Lexer_->TokenStart_ReadLineIndex, _Lexer_->SC_Index ) ;
            else
            {
                byte * buffer = Buffer_Data_Cleared ( _CfrTil_->ScratchB1 ) ;
                byte * msg = word ? ( byte* ) "namespace has no size" : ( byte* ) "can't find namespace" ;
                sprintf ( ( char* ) buffer, "\n_CfrTil_Parse_ClassStructure : %s : \'%s\'", ( char* ) msg, token ) ;
                _SyntaxError ( ( byte* ) buffer, 1 ) ; // else structure component size error
            }
        }
        for ( i = 0 ; 1 ; )
        {
            token = Lexer_ReadToken ( _Context_->Lexer0 ) ;
            if ( token && String_Equal ( ( char* ) token, "[" ) )
            {
                CfrTil_InterpretNextToken ( ) ; // next token must be an integer for the array dimension size
                arrayDimensionSize = DataStack_Pop ( ) ;
                size = size * arrayDimensionSize ;
                offset += size ;
                sizeOf += size ;
                token = Lexer_ReadToken ( _Context_->Lexer0 ) ;
                arrayDimensions [ i ] = arrayDimensionSize ;
                if ( ! String_Equal ( ( char* ) token, "]" ) ) CfrTil_Exception ( SYNTAX_ERROR, 0, 1 ) ;
                i ++ ;
            }
            else
            {
                if ( i )
                {
                    //arrayBaseObject->CAttribute |= VARIABLE ;
                    baseObject->ArrayDimensions = ( int64 * ) Mem_Allocate ( i * sizeof (int64 ), DICTIONARY ) ;
                    MemCpy ( baseObject->ArrayDimensions, arrayDimensions, i * sizeof (int64 ) ) ;
                    baseObject->ArrayNumberOfDimensions = i ;
                }
                if ( token ) goto gotNextToken ;
                else break ;
            }
        }
    }
    _Namespace_VariableValueSet ( classNs, ( byte* ) "size", sizeOf ) ;
    classNs->ObjectByteSize = sizeOf ;
    classNs->CAttribute2 |= STRUCTURE ;
    //Namespace_AddToNamespaces_SetUsing (  Namespace_Find ( (byte*) "C_Typedef" ), 0, NOT_USING ) ;
    return sizeOf ;
}

void
Compiler_TypedObjectInit ( Word * word, Namespace * typeNamespace )
{
    word->TypeNamespace = typeNamespace ;
    word->CAttribute |= typeNamespace->CAttribute ;
    if ( typeNamespace->CAttribute & CLASS ) word->CAttribute |= OBJECT ;
    word->LAttribute |= LOCAL_OBJECT ;
    word->Size = _Namespace_VariableValueGet ( word, ( byte* ) "size" ) ;
    //_DObject_Init ( Word * word, uint64 value, uint64 ftype, byte * function, int64 arg )
    _DObject_Init ( word, ( int64 ) 0, LOCAL_OBJECT, ( byte* ) _DataObject_Run, 0 ) ;
    _Word_Add ( word, 1, 0 ) ;
}

// old docs :
// parse local variable notation to a temporary "_locals_" namespace
// calculate necessary frame size
// the stack frame (Fsp) will be just above TOS -- at higer addresses
// save entry Dsp in a CfrTil variable (or at Fsp [ 0 ]). Dsp will be reset to just
// above the framestack during duration of the function and at the end of the function
// will be reset to its original value on entry stored in the CfrTil variable (Fsp [ 0 ])
// so that DataStack pushes and pops during the function will be accessing above the top of the new Fsp
// initialize the words to access a slot in the framesize so that the
// compiler can use the slot number in the function being compiled
// compile a local variable such that when used at runtime it pushes
// the slot address on the DataStack

Namespace *
_CfrTil_Parse_LocalsAndStackVariables ( int64 svf, int64 lispMode, ListObject * args, Stack * nsStack, Namespace * localsNs ) // stack variables flag
{
    // number of stack variables, number of locals, stack variable flag
    Context * cntx = _Context_ ;
    Compiler * compiler = cntx->Compiler0 ;
    Lexer * lexer = cntx->Lexer0 ;
    Finder * finder = cntx->Finder0 ;
    int64 scm = IsSourceCodeOn ;
    byte * svDelimiters = lexer->TokenDelimiters ;
    Word * word ;
    int64 ctype = 0, ltype = 0, numberOfRegisterVariables = 0, numberOfVariables = 0 ;
    int64 svff = 0, addWords, getReturn = 0, getReturnFlag = 0, regToUseIndex = 0 ;
    Boolean regFlag = false ;
    byte *token, *returnVariable = 0 ;
    Namespace *typeNamespace = 0, *saveInNs = _CfrTil_->InNamespace ;
    CfrTil_DbgSourceCodeOff ( ) ;
    if ( ! CompileMode ) Compiler_Init ( compiler, 0, 0 ) ;

    if ( svf ) svff = 1 ;
    addWords = 1 ;
    if ( lispMode ) args = ( ListObject * ) args->Lo_List->head ;

    while ( ( lispMode ? ( int64 ) _LO_Next ( args ) : 1 ) )
    {
        if ( lispMode )
        {
            args = _LO_Next ( args ) ;
            if ( args->LAttribute & ( LIST | LIST_NODE ) ) args = _LO_First ( args ) ;
            token = ( byte* ) args->Lo_Name ;
            CfrTil_AddStringToSourceCode ( _CfrTil_, token ) ;
        }
        else token = _Lexer_ReadToken ( lexer, ( byte* ) " ,\n\r\t" ) ;
        if ( token )
        {
            if ( String_Equal ( token, "(" ) ) continue ;
            if ( String_Equal ( ( char* ) token, "|" ) )
            {
                svff = 0 ; // set stack variable flag to off -- no more stack variables ; begin local variables
                continue ; // don't add a node to our temporary list for this token
            }
            if ( String_Equal ( ( char* ) token, "-t" ) ) // for setting W_TypeSignatureString
            {
                if ( lispMode )
                {
                    args = _LO_Next ( args ) ;
                    if ( args->LAttribute & ( LIST | LIST_NODE ) ) args = _LO_First ( args ) ;
                    token = ( byte* ) args->Lo_Name ;
                    CfrTil_AddStringToSourceCode ( _CfrTil_, token ) ;
                }
                else token = _Lexer_LexNextToken_WithDelimiters ( lexer, 0, 1, 0, 1, LEXER_ALLOW_DOT ) ;
                strncpy ( ( char* ) _Context_->CurrentWordBeingCompiled->W_TypeSignatureString, ( char* ) token, 8 ) ;
                continue ; // don't add a node to our temporary list for this token
            }
            if ( String_Equal ( ( char* ) token, "--" ) ) // || ( String_Equal ( ( char* ) token, "|-" ) == 0 ) || ( String_Equal ( ( char* ) token, "|--" ) == 0 ) )
            {
                if ( ! svf ) break ;
                else
                {
                    addWords = 0 ;
                    getReturnFlag = 1 ;
                    continue ;
                }
            }
            if ( String_Equal ( ( char* ) token, ")" ) ) break ;
            if ( String_Equal ( ( char* ) token, "REG" ) || String_Equal ( ( char* ) token, "REGISTER" ) )
            {
                if ( GetState ( _CfrTil_, OPTIMIZE_ON ) ) regFlag = true ;
                continue ;
            }
            if ( ( ! GetState ( _Context_, C_SYNTAX ) ) && ( String_Equal ( ( char* ) token, "{" ) ) || ( String_Equal ( ( char* ) token, ";" ) ) )
            {
                //_Printf ( ( byte* ) "\nLocal variables syntax error : no closing parenthesis ')' found" ) ;
                //CfrTil_Exception ( SYNTAX_ERROR, 0, 1 ) ;
                break ;
            }
            word = Finder_Word_FindUsing ( finder, token, 1 ) ; // ?? find after Literal - eliminate making strings or numbers words ??
            if ( word && ( word->CAttribute & ( NAMESPACE | CLASS ) ) && ( CharTable_IsCharType ( ReadLine_PeekNextChar ( lexer->ReadLiner0 ), CHAR_ALPHA ) ) )
            {
                if ( word->CAttribute2 & STRUCTURE ) typeNamespace = word ;
                continue ;
            }
            if ( getReturnFlag )
            {
                addWords = 0 ;
                if ( Stringi_Equal ( token, ( byte* ) "ACC" ) ) getReturn |= RETURN_ACCUM ;
                else if ( Stringi_Equal ( token, ( byte* ) "EAX" ) ) getReturn |= RETURN_ACCUM ;
                else if ( Stringi_Equal ( token, ( byte* ) "RAX" ) ) getReturn |= RETURN_ACCUM ;
                else if ( Stringi_Equal ( token, ( byte* ) "TOS" ) ) getReturn |= RETURN_TOS ;
                else returnVariable = token ; //nb. if there is a return variable it must have already been declared as a parameter of local variable else it is an error
                continue ;
            }
            if ( addWords )
            {
                if ( ! localsNs ) localsNs = Namespace_FindOrNew_Local ( nsStack ? nsStack : compiler->LocalsCompilingNamespacesStack, 1 ) ; //! debugFlag ) ;
                if ( svff )
                {
                    ctype = PARAMETER_VARIABLE ; // aka an arg
                    if ( lispMode ) ctype |= T_LISP_SYMBOL ;
                }
                else
                {
                    ctype = LOCAL_VARIABLE ;
                    if ( lispMode ) ltype |= T_LISP_SYMBOL ; // no ltype yet for _CfrTil_LocalWord
                }
                if ( regFlag == true )
                {
                    ctype |= REGISTER_VARIABLE ;
                    numberOfRegisterVariables ++ ;
                }
                word = DataObject_New ( ctype, 0, token, ctype, 0, 0, 0, 0, DICTIONARY, - 1, - 1 ) ;
                if ( _Context_->CurrentWordBeingCompiled ) _Context_->CurrentWordBeingCompiled->W_TypeSignatureString [numberOfVariables ++] = '_' ;
                if ( regFlag == true )
                {
                    word->RegToUse = RegParameterOrder ( regToUseIndex ++ ) ;
                    if ( word->CAttribute & PARAMETER_VARIABLE )
                    {
                        if ( ! compiler->RegisterParameterList ) compiler->RegisterParameterList = _dllist_New ( TEMPORARY ) ;
                        _List_PushNew_ForWordList ( compiler->RegisterParameterList, word, 1 ) ;
                    }
                    regFlag = false ;
                }
                if ( typeNamespace )
                {
                    Compiler_TypedObjectInit ( word, typeNamespace ) ;
                    Word_TypeChecking_SetInfoForAnObject ( word ) ;
                }
                typeNamespace = 0 ;
                if ( String_Equal ( token, "this" ) ) word->CAttribute |= THIS ;
            }
        }
        else return 0 ; // Syntax Error or no local or parameter variables
    }
    compiler->State |= getReturn ;

    // we support nested locals and may have locals in other blocks so the indexes are cumulative
    //if ( numberOfRegisterVariables && ( ! debugFlag ) ) Compile_Init_LocalRegisterParamenterVariables ( compiler ) ;
    if ( numberOfRegisterVariables ) Compile_Init_LocalRegisterParamenterVariables ( compiler ) ;
    if ( returnVariable ) compiler->ReturnVariableWord = _Finder_FindWord_InOneNamespace ( _Finder_, localsNs, returnVariable ) ;

    _CfrTil_->InNamespace = saveInNs ;
    finder->FoundWord = 0 ;
    Lexer_SetTokenDelimiters ( lexer, svDelimiters, COMPILER_TEMP ) ;
    compiler->LocalsNamespace = localsNs ;
    SetState ( compiler, VARIABLE_FRAME, true ) ;
    SetState ( _CfrTil_, DEBUG_SOURCE_CODE_MODE, scm ) ;
    return localsNs ;
}

void
Lexer_ParseAsAString ( Lexer * lexer )
{
    if ( lexer->OriginalToken [ 0 ] == '"' )
    {
        lexer->TokenType = ( T_STRING | KNOWN_OBJECT ) ;
        lexer->LiteralString = _String_UnBox ( lexer->OriginalToken ) ;
    }
    else if ( ( lexer->OriginalToken [ 0 ] == ( byte ) '\'' ) && ( strlen ( ( char* ) lexer->OriginalToken ) > 1 ) )
    {
        //char buffer [4] ; buffer[0]= '\'' ; buffer[1]= lexer->OriginalToken [ 1 ] ; buffer[2]= '\'' ; buffer[3]= 0 ;
        lexer->TokenType = ( T_CHAR | KNOWN_OBJECT ) ;
        lexer->Literal = ( int64 ) lexer->OriginalToken [ 1 ] ; //buffer  ;
    }
    else
    {
        lexer->TokenType = ( T_RAW_STRING | KNOWN_OBJECT ) ;
        lexer->LiteralString = lexer->OriginalToken ;
    }
    SetState ( lexer, KNOWN_OBJECT, true ) ;
}

void
_Lexer_ParseBinary ( Lexer * lexer, int64 offset )
{
    byte * token = & lexer->OriginalToken [offset] ;
    int64 cc = 0, i, l = Strlen ( ( char* ) token ) ; // 8 bits/byte
    byte current ;
    for ( i = 0 ; i < l ; i ++ )
    {
        current = token [ l - i - 1 ] ; // 1 : remember zero based array indexing
        if ( current == '1' )
            cc += ( 1 << i ) ;
        else if ( current == '0' )
            continue ;
        else if ( current == ' ' )
            continue ;
        else
        {
            SetState ( lexer, KNOWN_OBJECT, false ) ;
            Lexer_Exception ( token, NOT_A_KNOWN_OBJECT, "\n_Lexer_ParseBinary : non binary digits with number base 2" ) ;
        }
    }
    SetState ( lexer, KNOWN_OBJECT, true ) ;
    lexer->Literal = cc ;
}

void
Lexer_ParseBinary ( Lexer * lexer, byte * token, int64 offset )
{
    _Lexer_ParseBinary ( lexer, offset ) ;
    if ( GetState ( lexer, KNOWN_OBJECT ) )
    {
        lexer->TokenType = ( T_INT | KNOWN_OBJECT ) ;
        SetState ( lexer, KNOWN_OBJECT, true ) ;
        Lexer_ParseBigNum ( lexer, token ) ;
    }
    //else Lexer_ParseAsAString ( lexer ) ;
}

void
Lexer_ParseBigNum ( Lexer * lexer, byte * token )
{
    if ( Namespace_IsUsing ( ( byte* ) "BigNum" ) ) //String_Equal ( ( char* ) name, "BigNum" ) )
    {
        mpfr_t *bfr = ( mpfr_t* ) _BigNum_New ( token ) ;
        lexer->Literal = ( int64 ) bfr ;
        lexer->TokenType = ( T_BIG_NUM | KNOWN_OBJECT ) ;
        lexer->TokenObjectSize = 8 ;
        SetState ( lexer, KNOWN_OBJECT, true ) ;
    }
}
// return boolean 0 or 1 if lexer->Literal value is pushed

Boolean
Lexer_ScanForHexInt ( Lexer * lexer, byte * token )
{
    int64 i, sr, scrap, slt = Strlen ( token ) ;
    if ( sr = sscanf ( ( char* ) token, HEX_INT_FRMT, ( uint64* ) & lexer->Literal ) )
    {
        for ( i = 1 ; sr && i < slt ; i ++ )
        {
            sr = sscanf ( ( char* ) &token[i], HEX_INT_FRMT, ( int64* ) & scrap ) ;
        }
        if ( ! sr ) lexer->Literal = 0 ;
    }
    return sr ;
}

void
_Lexer_ParseHex ( Lexer * lexer, byte * token )
{
    int64 scrap ;
    // use 0d format for decimal numbers with hex NumberBase state
    if ( sscanf ( ( char* ) token, INT_FRMT_FOR_HEX, ( int64* ) & lexer->Literal ) )
    {
        lexer->TokenType = ( T_INT | KNOWN_OBJECT ) ;
        SetState ( lexer, KNOWN_OBJECT, true ) ;
        Lexer_ParseBigNum ( lexer, token ) ;
    }
    else if ( Lexer_ScanForHexInt ( lexer, token ) ) //sscanf ( ( char* ) token, HEX_INT_FRMT, ( uint64* ) & lexer->Literal ) && sscanf ( ( char* ) &token[1], HEX_INT_FRMT, ( int64* ) & scrap ))
    {
        lexer->TokenType = ( T_INT | KNOWN_OBJECT ) ;
        SetState ( lexer, KNOWN_OBJECT, true ) ;
        Lexer_ParseBigNum ( lexer, token ) ;
    }
    else if ( sscanf ( ( char* ) token, HEX_UINT_FRMT, ( uint64* ) & lexer->Literal ) )
    {
        lexer->TokenType = ( T_INT | KNOWN_OBJECT ) ;
        SetState ( lexer, KNOWN_OBJECT, true ) ;
        Lexer_ParseBigNum ( lexer, token ) ;
    }
    else if ( sscanf ( ( char* ) token, LISP_HEX_FRMT, ( uint64* ) & lexer->Literal ) )
    {
        lexer->TokenType = ( T_INT | KNOWN_OBJECT ) ;
        SetState ( lexer, KNOWN_OBJECT, true ) ;
        Lexer_ParseBigNum ( lexer, token ) ;
    }
    else Lexer_ParseAsAString ( lexer ) ;
}

void
_Lexer_ParseDecimal ( Lexer * lexer, byte * token )
{
    float f ;
    // use 0x format for hex numbers with decimal NumberBase state
    //D1 (String_Equal (_ReadLiner_->Filename, "namespaces/test/math.cft") ? CfrTil_CpuState_Current_Show ( ) : 0 ) ; //Debugger_CfrTilRegisters (_Debugger_) : 0 ) ;
    if ( sscanf ( ( char* ) token, HEX_UINT_FRMT, ( uint64* ) & lexer->Literal ) ||
        sscanf ( ( char* ) token, INT_FRMT_FOR_HEX, ( uint64* ) & lexer->Literal ) ||
        sscanf ( ( char* ) token, INT_FRMT, ( uint64* ) & lexer->Literal ) ||
        sscanf ( ( char* ) token, LISP_DECIMAL_FRMT, ( uint64* ) & lexer->Literal ) )
    {
        if ( lexer->Literal < 256 )
        {
            lexer->TokenType = ( T_BYTE | KNOWN_OBJECT ) ;
            lexer->TokenObjectSize = 1 ;
        }
        else if ( lexer->Literal <= 65535 )
        {
            lexer->TokenType = ( KNOWN_OBJECT ) ;
            lexer->TokenType2 |= ( T_INT16 ) ;
            lexer->TokenObjectSize = 2 ;
        }
        else if ( lexer->Literal <= 2147483647 )
        {
            lexer->TokenType = ( KNOWN_OBJECT ) ;
            lexer->TokenType2 = ( T_INT32 ) ;
            lexer->TokenObjectSize = 4 ;
        }
        else
        {
            lexer->TokenType = ( T_INT | KNOWN_OBJECT ) ;
            lexer->TokenObjectSize = 8 ;
        }
        SetState ( lexer, KNOWN_OBJECT, true ) ;
        Lexer_ParseBigNum ( lexer, token ) ;
    }
    else if ( sscanf ( ( char* ) token, "%f", &f ) )
    {
        lexer->TokenType = ( T_FLOAT | KNOWN_OBJECT ) ;
        SetState ( lexer, KNOWN_OBJECT, true ) ;
        Lexer_ParseBigNum ( lexer, token ) ;
    }
    else Lexer_ParseAsAString ( lexer ) ;
}

void
Lexer_ParseObject ( Lexer * lexer, byte * token )
{
    Context * cntx = _Context_ ;
    int64 offset = 0 ;
    lexer->OriginalToken = token ;
    lexer->Literal = 0 ;
    lexer->TokenType = 0 ;
    lexer->TokenType2 = 0 ;
    if ( token )
    {
        if ( ( token [0] == '0' ) || ( token [0] == '#' ) ) // following scheme notation
        {
            char c ;
            if ( ( c = tolower ( token [1] ) ) == 'x' )
            {
                token [1] = c ;
                //if ( token [0] == '#' ) token [0] = '0' ; // Scheme format to C format
                //_Lexer_ParseHex ( lexer, token[0] == '#' ? &token[1] : token ) ; // #x
                _Lexer_ParseHex ( lexer, token ) ; // #x
                return ;
            }
            else if ( ( c = tolower ( token [1] ) ) == 'b' )
            {
                if ( token [0] == '#' ) // following scheme notation
                {
                    offset = 2 ;
                    Lexer_ParseBinary ( lexer, token, offset ) ; // #b
                    return ;
                }
            }
            else if ( tolower ( token [1] ) == 'd' )
            {
                _Lexer_ParseDecimal ( lexer, token ) ; // #d
                return ;
            }
            //else if ( tolower ( token [1] ) == 'o' ) goto doOctal ; // #o
        }
        if ( cntx->System0->NumberBase == 10 ) _Lexer_ParseDecimal ( lexer, token ) ;
        else if ( cntx->System0->NumberBase == 2 ) Lexer_ParseBinary ( lexer, token, 0 ) ;
        else if ( cntx->System0->NumberBase == 16 ) _Lexer_ParseHex ( lexer, token ) ;
    }
}

byte *
Parse_Macro ( int64 type )
{
    byte * value ;
    Lexer * lexer = _Context_->Lexer0 ;
    if ( type == STRING_MACRO )
    {
        value = Lexer_ReadToken ( lexer ) ;
        while ( ! String_Equal ( ";", ( char* ) Lexer_ReadToken ( lexer ) ) ) ; // nb. we take only the first string all else ignored
    }
    else if ( type == TEXT_MACRO )
    {
        int64 n = 0 ;
        byte nc, *buffer = Buffer_Data ( _CfrTil_->ScratchB1 ) ;
        buffer [0] = 0 ;
        do
        {
            nc = _ReadLine_GetNextChar ( _Context_->ReadLiner0 ) ;
            if ( nc == ';' )
            {
                buffer [ n ] = 0 ;
                break ;
            }
            buffer [ n ++ ] = nc ;
        }
        while ( nc ) ;
        value = String_New ( ( byte* ) buffer, TEMPORARY ) ;
        //Buffer_SetAsUnused ( b ) ;
    }
    return value ;
}

void
Lexer_ParseDoubleQuoteMacro ( Lexer * lexer )
{
    ReadLiner * rl = _ReadLiner_ ;
    if ( ! GetState ( _CfrTil_, SOURCE_CODE_STARTED ) ) CfrTil_InitSourceCode_WithCurrentInputChar ( _CfrTil_, 0 ) ; // must be here for wdiss and add addToHistory
    _CfrTil_->SC_QuoteMode = true ;
    do
    {
        lexer->TokenInputByte = ReadLine_NextChar ( rl ) ;
        if ( lexer->TokenInputByte == '\\' )
            _BackSlash ( lexer, 1 ) ;
        else Lexer_Append_ConvertedCharacterToTokenBuffer ( lexer ) ;
    }
    while ( lexer->TokenInputByte != '"' ) ;
    _CfrTil_->SC_QuoteMode = false ;
    SetState ( lexer, LEXER_DONE, true ) ;
    if ( GetState ( _CfrTil_, STRING_MACROS_ON ) && GetState ( &_CfrTil_->Sti, STI_INITIALIZED ) ) _CfrTil_StringMacros_Do ( lexer->TokenBuffer ) ;
    Word * word = Lexer_ObjectToken_New ( lexer, String_New ( lexer->TokenBuffer, STRING_MEM ), - 1, - 1 ) ;
    Interpreter_DoWord ( _Interpreter_, word, - 1, - 1 ) ;
}



