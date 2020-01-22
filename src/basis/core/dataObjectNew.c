
#include "../../include/cfrtil64.h"

// Dynamic Object New : Word = Namespace = DObject : have a s_Symbol

// we run all new objects thru here ; good for debugging and understanding 

Word *
DataObject_New ( uint64 type, Word * word, byte * name, uint64 morphismAttributes, uint64 objectAttributes, uint64 lispAttributes,
    int64 index, int64 value, int allocType, int64 tsrli, int64 scwi )
{
    Context * cntx = _Context_ ;
    Word_SetTsrliScwi ( word, tsrli, scwi )
    if ( word && ( ! ( type & ( T_LC_NEW | T_LC_LITERAL ) ) ) ) Word_Recycle ( word ) ;
    switch ( type )
    {
        case T_LC_NEW:
        {
            word = _LO_New ( lispAttributes, morphismAttributes, objectAttributes, name, ( byte* ) value, word, ( allocType ? allocType : LISP_TEMP ), 0, tsrli, scwi ) ; // all words are symbols
            break ;
        }
        case T_LC_DEFINE:
        {
            word = _LO_New ( lispAttributes, morphismAttributes, objectAttributes, name, ( byte* ) value, word, LISP, _LC_->LispDefinesNamespace, tsrli, scwi ) ; // all words are symbols
            break ;
        }
        case T_LC_LITERAL:
        {
            word = _LO_New_RawStringOrLiteral ( _Context_->Lexer0, name, index, tsrli, scwi ) ;
            break ;
        }
        case CFRTIL_WORD:
        {
            word = _DObject_New ( name, value, morphismAttributes | BLOCK, objectAttributes, lispAttributes | BLOCK, BLOCK, 0, 0, 1, 0, DICTIONARY ) ;
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
            word = _DObject_New ( name, value, ( IMMEDIATE ), CONSTANT | objectAttributes, 0, CONSTANT, ( byte* ) _DataObject_Run, 0, 1, 0, DICTIONARY ) ;
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
            //if ( GetState ( cntx, C_SYNTAX ) ) 
            Compiler_Get_C_BackgroundNamespace ( cntx->Compiler0 ) ;
            word = _Class_New ( name, C_TYPE, 0 ) ;
            Type_Create ( ) ;
            //if ( GetState ( cntx, C_SYNTAX ) ) 
            Compiler_SetAs_InNamespace_C_BackgroundNamespace ( cntx->Compiler0 ) ;
            break ;
        }
        case C_TYPEDEF:
        {
            _CfrTil_TypeDef ( ) ;
            break ;
        }
        case PARAMETER_VARIABLE: case LOCAL_VARIABLE: case (PARAMETER_VARIABLE | REGISTER_VARIABLE ): case (LOCAL_VARIABLE | REGISTER_VARIABLE ):
        {
            word = _Compiler_LocalWord ( _Compiler_, name, morphismAttributes, objectAttributes, lispAttributes, DICTIONARY ) ;
            break ;
        }
        default: case (T_LISP_SYMBOL | PARAMETER_VARIABLE ): case (T_LISP_SYMBOL | LOCAL_VARIABLE ): // REGISTER_VARIABLE combinations with others in this case
        {
            word = Compiler_LocalWord ( _Compiler_, name, type, objectAttributes, lispAttributes, DICTIONARY ) ;
            break ;
        }
    }
    return word ;
}

byte *
_CfrTil_NamelessObjectNew ( int64 size, int64 allocType )
{
    byte * obj = 0 ;
    if ( size ) obj = Mem_Allocate ( size, allocType ) ;
    return obj ;
}

Word *
_CfrTil_ObjectNew ( int64 size, byte * name, uint64 category, int64 allocType )
{
    byte * obj = _CfrTil_NamelessObjectNew ( size, allocType ) ; 
    Word * word = _DObject_New ( name, ( int64 ) obj, ( IMMEDIATE | CPRIMITIVE ), OBJECT | category, 0, OBJECT, ( byte* ) _DataObject_Run, 0, 0, 0, DICTIONARY ) ;
    word->ObjectByteSize = size ;
    return word ;
}

void
_Class_Object_Init ( Word * word, Namespace * ins )
{
    Namespace * ns = ins ;
    Stack * nsstack = _Context_->Compiler0->InternalNamespacesStack ;
    Stack_Init ( nsstack ) ; 
    // init needs to be done by the most super/internal class first successively down to the current/sub class 
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
    for ( i = Stack_Depth ( nsstack ) ; i > 0 ; i -- )
    {
        Word * initWord = ( Word* ) _Stack_Pop ( nsstack ) ;
        DataStack_Push ( ( int64 ) word->W_Value ) ;
        Word_Eval ( initWord ) ; // nb. must be Word_Eval (not Word_Run) because sigsetjmp is there and needed re. 'new' else active debugger will crash in/after 'new'
    }
    SetState ( _Debugger_, DEBUG_SHTL_OFF, false ) ;
    word->TypeNamespace = ins ;
    if ( ins->W_ObjectAttributes & STRUCT ) word->W_ObjectAttributes |= STRUCT ;
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
    word = _CfrTil_ObjectNew ( size, name, category, CompileMode ? DICTIONARY : OBJECT_MEM ) ;
    object = (byte*) word->W_Value ;
    _Class_Object_Init ( word, ns ) ;
    _Namespace_VariableValueSet ( ns, ( byte* ) "this", ( int64 ) object ) ;
    _Word_Add ( word, 0, ns ) ;
    return word ;
}

Namespace *
_Class_New ( byte * name, uint64 objectType, int64 cloneFlag )
{
    Context * cntx = _Context_ ;
    if ( GetState ( cntx, C_SYNTAX ) ) Compiler_Get_C_BackgroundNamespace ( cntx->Compiler0 ) ;
    Namespace * ns = _Namespace_Find ( name, 0, 0 ), * sns ;
    int64 size = 0 ;
    if ( ! ns )
    {
        sns = _CfrTil_Namespace_InNamespaceGet ( ) ;
        if ( cloneFlag )
        {
            size = _Namespace_VariableValueGet ( sns, ( byte* ) "size" ) ;
        }
        ns = _DObject_New ( name, 0, IMMEDIATE, CLASS | objectType, 0, objectType, ( byte* ) _DataObject_Run, 0, 0, sns, DICTIONARY ) ;
        Namespace_DoNamespace (ns, 0) ; // before "size", "this"
        Word *ws = _CfrTil_Variable_New ( ( byte* ) "size", size ) ; // start with size of the prototype for clone
        _Context_->Interpreter0->ThisNamespace = ns ;
        Word *wt = _CfrTil_Variable_New ( ( byte* ) "this", size ) ; // start with size of the prototype for clone
        wt->W_ObjectAttributes |= THIS | OBJECT ;
    }
    else
    {
        _Printf ( ( byte* ) "\nNamespace Error at %s ? : \'%s\' already exists! : %s : size = %d\n",
            Context_Location ( ), ns->Name, _Word_SourceCodeLocation_pbyte ( ns ), ns->ObjectByteSize ) ;
        Namespace_DoNamespace (ns, 0) ;
    }
    CfrTil_WordList_Init (0) ;
    //Compiler_SetAs_InNamespace_C_BackgroundNamespace ( cntx->Compiler0 ) ;
    return ns ;
}

Word *
_CfrTil_ClassField_New ( byte * token, Class * aclass, int64 size, int64 offset )
{
    //int64 attribute = 0 ;
    Word * word = _DObject_New ( token, 0, ( IMMEDIATE | CPRIMITIVE ), OBJECT_FIELD , 0, OBJECT_FIELD, ( byte* ) _DataObject_Run, 0, 1, 0, DICTIONARY ) ;
    word->TypeNamespace = aclass ;
    word->ObjectByteSize = size ;
    if ( size == 1 ) word->W_ObjectAttributes |= T_BYTE ;
    else if ( size == 8 ) word->W_ObjectAttributes |= T_INT64 ;
    else if ( size == 4 ) word->W_ObjectAttributes |= T_INT32 ;
    else if ( size == 2 ) word->W_ObjectAttributes |= T_INT16 ;
    word->Offset = offset ;
    return word ;
}

// this maybe should be in primitives/dobject.c

Word *
_CfrTil_Variable_New ( byte * name, int64 value )
{
    Word * word ;
    if ( CompileMode )
    {
        word = Compiler_LocalWord ( _Compiler_, name, 0, LOCAL_VARIABLE, 0, DICTIONARY ) ;
        SetState ( _Compiler_, VARIABLE_FRAME, true ) ;
    }
    else word = _DObject_New ( name, value, ( IMMEDIATE ), NAMESPACE_VARIABLE, 0, NAMESPACE_VARIABLE, ( byte* ) _DataObject_Run, 0, 1, 0, DICTIONARY ) ;
    word->ObjectByteSize = 8 ;
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
    Word * word = _DObject_New ( lname, ( int64 ) gotoInfo, IMMEDIATE, CONSTANT, 0, CONSTANT, ( byte* ) _DataObject_Run, 0, 0, ns, DICTIONARY ) ;

    return word->Name ;
}

Word *
Literal_New ( Lexer * lexer, uint64 uliteral )
{
    // nb.! : remember the compiler optimizes with the WordStack so everything has to be converted to a Word
    // _DObject_New : calls _Do_Literal which pushes the literal on the data stack or compiles a push ...
    Word * word ;
    byte _name [ 64 ], *name ;
    if ( ! ( lexer->L_ObjectAttributes & ( T_STRING | T_RAW_STRING | T_CHAR | T_INT | T_INT16 | T_INT32 | KNOWN_OBJECT ) ) )
    {
        snprintf ( ( char* ) _name, 64, "<unknown object type> : %lx", ( uint64 ) uliteral ) ;
        name = String_New ( _name, STRING_MEM ) ;
    }
    else
    {
        if ( lexer->L_ObjectAttributes & ( T_STRING | T_RAW_STRING ) )
        {
            uliteral = ( int64 ) String_New ( lexer->LiteralString, STRING_MEM ) ;
        }
        name = lexer->OriginalToken ;
    }
    word = _DObject_New ( name, uliteral, ( IMMEDIATE | lexer->L_MorphismAttributes ), ( LITERAL | CONSTANT | lexer->L_ObjectAttributes), 0, LITERAL, ( byte* ) _DataObject_Run, 0, 0, 0, ( CompileMode ? INTERNAL_OBJECT_MEM : OBJECT_MEM ) ) ;

    return word ;
}

Namespace *
_Namespace_New ( byte * name, Namespace * containingNs )
{
    Namespace * ns = _DObject_New ( name, 0, ( IMMEDIATE ), NAMESPACE, 0, NAMESPACE, ( byte* ) _DataObject_Run, 0, 0, containingNs, DICTIONARY ) ;
    //Namespace * ns = _DObject_New ( name, 0, ( NAMESPACE ), 0, 0, NAMESPACE, ( byte* ) _DataObject_Run, 0, 0, containingNs, DICTIONARY ) ;
    return ns ;
}

