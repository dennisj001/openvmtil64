
#include "../../include/cfrtil64.h"

// Dynamic Object New : Word = Namespace = DObject : have a s_Symbol

// we run all new objects thru here ; good for debugging and understanding 

Word *
_DataObject_New (uint64 type, Word * word, byte * name, uint64 ctype, uint64 ctype2, uint64 ltype, int64 index, int64 value, int allocType, int64 tsrli, int64 scwi )
{
    tsrli = ( tsrli != - 1 ) ? tsrli : _Lexer_->TokenStart_ReadLineIndex ;
    scwi = ( scwi != - 1 ) ? scwi : _Lexer_->SC_Index ;
    if ( word && ( ! ( type & ( T_LC_NEW ) ) ) ) 
    {
        Word_Recycle ( word ) ;
    }
    switch ( type )
    {
        case T_LC_NEW:
        {
            word = _LO_New ( ltype, ctype, ctype2, ( byte* ) value, word, (allocType ? allocType : LISP_TEMP), tsrli, scwi ) ; // all words are symbols
            break ;
        }
        case T_LC_LITERAL:
        {
            word = _LO_New_RawStringOrLiteral ( _Context_->Lexer0, name, index ) ;
            break ;
        }
        case CFRTIL_WORD:
        {
            word = _DObject_New ( name, value, ctype | BLOCK, ctype2, ltype | BLOCK, BLOCK, 0, 0, 1, 0, DICTIONARY ) ;
            break ;
        }
        case NAMESPACE:
        {
            word = _Namespace_New ( name, ( Namespace * ) value ) ;
            break ;
        }
        case NAMESPACE_VARIABLE:
        {
            word = _CfrTil_Variable_New ( name, value ) ;
            break ;
        }
        case LITERAL:
        {
            word = Literal_New ( _Context_->Lexer0, value ) ;
            break ;
        }
        case CONSTANT:
        {
            word = _DObject_New ( name, value, ( CONSTANT | IMMEDIATE | CPRIMITIVE ), ctype2, 0, CONSTANT, ( byte* ) _DataObject_Run, 0, 1, 0, DICTIONARY ) ;
            break ;
        }
        case OBJECT:
        {
            word = _Class_Object_New ( name, type ) ;
            break ;
        }
        case DOBJECT:
        {
            DObject_New ( ) ;
            break ;
        }
        case CLASS:
        {
            word = _Class_New ( name, CLASS, 0 ) ;
            break ;
        }
        case CLASS_CLONE:
        {
            word = _Class_New ( name, CLASS_CLONE, 1 ) ;
            break ;
        }
        case C_CLASS:
        {
            word = _Class_New ( name, C_CLASS, 0 ) ;
            break ;
        }
        case C_TYPE:
        {
            word = _Class_New ( name, C_TYPE, 0 ) ;
            Type_Create ( ) ;
            break ;
        }
        case C_TYPEDEF:
        {
            _CfrTil_TypeDef ( ) ;
            break ;
        }
        default: case PARAMETER_VARIABLE: case LOCAL_VARIABLE: case T_LISP_SYMBOL | PARAMETER_VARIABLE: case T_LISP_SYMBOL | LOCAL_VARIABLE: // REGISTER_VARIABLE combinations with others in this case
        {
            word = CfrTil_LocalWord ( name, type ) ;
            break ;
        }
    }
    return word ;
}

byte *
_CfrTil_NamelessObjectNew ( int64 size, int64 allocType )
{
    byte * obj = 0 ;
    if ( size )
    {

        obj = Mem_Allocate ( size, allocType ) ;
    }
    return obj ;
}

Word *
_CfrTil_ObjectNew ( int64 size, byte * name, uint64 category, int64 allocType )
{
    byte * obj = _CfrTil_NamelessObjectNew ( size, allocType ) ; //OBJECT_MEMORY ) ;
    Word * word = _DObject_New ( name, ( int64 ) obj, ( OBJECT | IMMEDIATE | CPRIMITIVE | category ), 0, 0, OBJECT, ( byte* ) _DataObject_Run, 0, 0, 0, DICTIONARY ) ;
    word->Size = size ;

    return word ;
}

void
_Class_Object_Init ( Word * word, Namespace * ns )
{
    DebugShow_Off ;
    Stack * nsstack = _Context_->Compiler0->NamespacesStack ;
    Stack_Init ( nsstack ) ; // !! ?? put this in Compiler ?? !!
    // init needs to be done by the most super class first successively down to the current class 
    do
    {
        Word * initWord ;
        if ( ( initWord = _Finder_FindWord_InOneNamespace ( _Finder_, ns, ( byte* ) "init" ) ) )
        {
            _Stack_Push ( nsstack, ( int64 ) initWord ) ;
        }
        ns = ns->ContainingNamespace ;
    }
    while ( ns ) ;
    int64 i ;
    SetState ( _Debugger_, DEBUG_SHTL_OFF, true ) ;
    for ( i = Stack_Depth ( nsstack ) ; i > 0 ; i -- )
    {

        Word * initWord = ( Word* ) _Stack_Pop ( nsstack ) ;
        DataStack_Push ( ( int64 ) word->W_Object ) ;
        d0 ( CfrTil_PrintDataStack ( ) ) ;
        Word_Eval ( initWord ) ;
        d0 ( CfrTil_PrintDataStack ( ) ) ;
    }
    SetState ( _Debugger_, DEBUG_SHTL_OFF, false ) ;
    DebugShow_On ;
}

// class object new

Word *
_Class_Object_New ( byte * name, uint64 category )
{
    int64 size ;
    byte * object ;
    Word * word ;
    Namespace * ns = _CfrTil_Namespace_InNamespaceGet ( ) ;
    size = _Namespace_VariableValueGet ( ns, ( byte* ) "size" ) ;
    word = _CfrTil_ObjectNew ( size, name, category, OBJECT_MEMORY ) ;
    _Class_Object_Init ( word, ns ) ;
    _Namespace_VariableValueSet ( ns, ( byte* ) "this", ( int64 ) object ) ;
    _Word_Add ( word, 0, ns ) ;

    return word ;
}

Namespace *
_Class_New ( byte * name, uint64 type, int64 cloneFlag )
{
    Namespace * ns = _Namespace_Find ( name, 0, 0 ), * sns ;
    int64 size = 0 ;
    if ( ! ns )
    {
        sns = _CfrTil_Namespace_InNamespaceGet ( ) ;
        if ( cloneFlag )
        {
            size = _Namespace_VariableValueGet ( sns, ( byte* ) "size" ) ;
        }
        ns = _DObject_New ( name, 0, CPRIMITIVE | CLASS | IMMEDIATE | type, 0, 0, type, ( byte* ) _DataObject_Run, 0, 0, sns, DICTIONARY ) ;
        _Namespace_DoNamespace ( ns, 1 ) ; // before "size", "this"
        Word *ws = _CfrTil_Variable_New ( ( byte* ) "size", size ) ; // start with size of the prototype for clone
        //ws->CAttribute |= NAMESPACE_VARIABLE ;
        _Context_->Interpreter0->ThisNamespace = ns ;
        Word *wt = _CfrTil_Variable_New ( ( byte* ) "this", size ) ; // start with size of the prototype for clone
        wt->CAttribute |= THIS ;
    }
    else
    {
        _Printf ( ( byte* ) "\nNamespace Error ? : \'%s\' already exists! : %s : size = %d\n", ns->Name, _Word_SourceCodeLocation_pbyte ( ns ), ns->Size ) ;
        _Namespace_DoNamespace ( ns, 1 ) ;
    }
    CfrTil_WordList_Init (_CfrTil_, 0, 0) ;

    return ns ;
}

Word *
_CfrTil_ClassField_New ( byte * token, Class * aclass, int64 size, int64 offset )
{
    Word * word = _DObject_New ( token, 0, ( IMMEDIATE | OBJECT_FIELD | CPRIMITIVE ), 0, 0, OBJECT_FIELD, ( byte* ) _DataObject_Run, 0, 1, 0, DICTIONARY ) ;
    word->ClassFieldTypeNamespace = aclass ;
    word->Size = size ;
    word->Offset = offset ;

    return word ;
}

// this maybe should be in primitives/dobject.c

Word *
_CfrTil_Variable_New ( byte * name, int64 value )
{
    Word * word ;
    if ( CompileMode ) //&& ( ! GetState ( _Context_, C_SYNTAX ) ) ) // we're not using this yet but it may be useful to some
    {
        word = CfrTil_LocalWord ( name, LOCAL_VARIABLE ) ; // svf : flag - whether stack variables are in the frame
        SetState ( _Compiler_, VARIABLE_FRAME, true ) ;
    }
    else word = _DObject_New ( name, value, ( CPRIMITIVE | NAMESPACE_VARIABLE | IMMEDIATE ), 0, 0, NAMESPACE_VARIABLE, ( byte* ) _DataObject_Run, 0, 1, 0, DICTIONARY ) ;

    return word ;
}

byte *
_CfrTil_Label ( byte * lname )
{
    GotoInfo * gotoInfo = GotoInfo_New ( lname, GI_LABEL ) ;
    gotoInfo->LabeledAddress = Here ;
    Namespace * ns = Namespace_FindOrNew_SetUsing ( ( byte* ) "__labels__", _CfrTil_->Namespaces, 1 ) ;
    if ( _Finder_FindWord_InOneNamespace ( _Finder_, ns, lname ) )
    {
        byte bufferData [ 32 ] ;
        sprintf ( ( char* ) bufferData, "%s%d", lname, rand ( ) ) ;
        lname = bufferData ;
    }
    Word * word = _DObject_New ( lname, ( int64 ) gotoInfo, CONSTANT | IMMEDIATE, 0, 0, CONSTANT, ( byte* ) _DataObject_Run, 0, 0, ns, DICTIONARY ) ;

    return word->Name ;
}

Word *
_CfrTil_LocalWord ( byte * name, int64 index, int64 ctype, int64 ctype2, int64 ltype ) // svf : flag - whether stack variables are in the frame
{
    Word *word ;
    {
        word = _DObject_New ( name, 0, ( ctype | IMMEDIATE ), ctype2, ltype, LOCAL_VARIABLE, ( byte* ) _DataObject_Run, 0, 1, 0, COMPILER_TEMP ) ;
        word->Index = index ; 
    }
    return word ;
}

int64
ParameterVarOffset ( Word * word )
{
    int64 offset = ( - ( _Context_->Compiler0->NumberOfArgs - word->Index + 1 ) ) ; //??
    return offset ;
}

Word *
CfrTil_LocalWord ( byte * name, int64 ctype ) // svf : flag - whether stack variables are in the frame
{
    _Namespace_FindOrNew_Local ( _Compiler_->LocalsCompilingNamespacesStack ) ;
    Finder_SetQualifyingNamespace ( _Finder_, 0 ) ;
    Word * word = _CfrTil_LocalWord ( name, ( ctype & LOCAL_VARIABLE ) ? ++ _Compiler_->NumberOfLocals : ++ _Compiler_->NumberOfArgs, ctype, 0, 0 ) ; // svf : flag - whether stack variables are in the frame
    return word ;
}

Word *
Literal_New ( Lexer * lexer, uint64 uliteral )
{
    // nb.! : remember the compiler optimizes with the WordStack so everything has to be converted to a Word
    // _DObject_New : calls _Do_Literal which pushes the literal on the data stack or compiles a push ...
    Word * word ;
    byte _name [ 256 ], *name ;
    if ( ! ( lexer->TokenType & ( T_STRING | T_RAW_STRING | T_CHAR | KNOWN_OBJECT ) ) )
    {
        snprintf ( ( char* ) _name, 256, "<unknown object type> : %lx", ( uint64 ) uliteral ) ;
        name = String_New ( _name, STRING_MEM ) ;
    }
    else
    {
        if ( lexer->TokenType & ( T_STRING | T_RAW_STRING ) ) 
        {
            uliteral = ( int64 ) String_New ( lexer->LiteralString, STRING_MEM ) ;
        }
        name = lexer->OriginalToken ;
    }
    word = _DObject_New ( name, uliteral, LITERAL | CONSTANT | IMMEDIATE, 0, 0, LITERAL, ( byte* ) _DataObject_Run, 0, 0, 0, OBJECT_MEMORY ) ;

    return word ;
}

Namespace *
_Namespace_New ( byte * name, Namespace * containingNs )
{
    Namespace * ns = _DObject_New ( name, 0, ( CPRIMITIVE | NAMESPACE | IMMEDIATE ), 0, 0, NAMESPACE, ( byte* ) _DataObject_Run, 0, 0, containingNs, DICTIONARY ) ;
    return ns ;
}

void
_CfrTil_MachineCodePrimitive_NewAdd ( const char * name, uint64 cType, int64 ctype2, block * callHook, byte * function, int64 functionArg, const char *nameSpace, const char * superNamespace )
{
    //_DObject_New ( byte * name, uint64 value, uint64 ctype, uint64 ltype, uint64 ftype, byte * function, int64 arg, int64 addToInNs, Namespace * addToNs, uint64 allocType )
    Word * word = _DObject_New ( ( byte* ) name, ( uint64 ) function, ( cType | CPRIMITIVE ), ctype2, 0, 0, function, functionArg, 0, 0, DICTIONARY ) ;
    if ( callHook ) *callHook = word->Definition ;
    _CfrTil_InitialAddWordToNamespace ( word, ( byte* ) nameSpace, ( byte* ) superNamespace ) ;
}
