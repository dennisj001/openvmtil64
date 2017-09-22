
#include "../include/cfrtil.h"

#if 0 // not used yet -- maybe replaced by better DObject functionality
Attribute *
_Type_Create ( )
{
    Attribute * attribute ;
#if 0    
    if ( category & ( LOCAL_VARIABLE | PARAMETER_VARIABLE ) )
    {
        attribute = ( Attribute* ) Mem_Allocate_AddToList ( sizeof (Attribute ), COMPILER_TEMP, 0 ) ;
    }
    else
#endif        
    {
        attribute = ( Attribute * ) Mem_Allocate ( sizeof (Attribute ), DICTIONARY ) ;
    }
    return attribute ;
}

Attribute *
_Attribute_Init ( Attribute * attribute, byte * name, int64 value, uint64 category )
{
    //attribute->Symbol = ( Symbol * ) Mem_Allocate ( sizeof ( Symbol ), DICTIONARY ) ;
    _Symbol_Init_AllocName ( (Symbol*) attribute, name, DICTIONARY ) ;
    attribute->W_Value = value ;
    return attribute ;
}

Attribute *
_Attribute_New ( byte * name, int64 value )
{
    Attribute * attribute = _Type_Create ( ) ;
    _Attribute_Init ( attribute, name, value, attribute | NAMESPACE_VARIABLE ) ;
    return attribute ;
}

void
_Attribute_SetValue ( Attribute * attribute, int64 value )
{
    if ( attribute ) attribute->W_Value = value ;
}

int64
_Attribute_GetValue ( Attribute * attribute )
{
    if ( attribute ) return attribute->W_Value ;
    else return 0 ;
}

void
CfrTil_Attribute_New ( )
{
    byte * name = ( byte * ) _DataStack_Pop ( ) ;
    int64 value = ( int64 ) _DataStack_Pop ( ) ;
    Attribute * attribute = _Attribute_New ( name, value ) ;
    _CfrTil_AddSymbol ( (Symbol*) attribute ) ;
}

Attribute *
_DObject_FindAttribute ( DObject * dobject, byte * name )
{
    Word * word = Finder_FindWord_InOneNamespace ( _Finder_, dobject, name ) ;
    if ( word ) return ( (Attribute*) word ) ;
    else return 0 ;
}

Attribute *
_DObject_Attribute_New ( DObject * dobject, byte * name, int64 value )
{
    Attribute * attribute = _Attribute_New ( name, value ) ;
    Namespace_DoAddSymbol ( dobject, (Symbol*) attribute ) ;
    dobject->Slots ++ ;
    return attribute ;
}

int64
_DObject_GetAttributeValue ( DObject * dobject, byte * name )
{
    Attribute * attribute = _DObject_FindAttribute ( dobject, name ) ;
    return _Attribute_GetValue ( attribute ) ;
}

Attribute *
_DObject_SetAttributeValue ( DObject * dobject, byte * name, int64 value )
{
    Attribute * attribute = _DObject_FindAttribute ( dobject, name ) ;
    if ( attribute ) _Attribute_SetValue ( attribute, value ) ;
    else attribute = _DObject_Attribute_New ( dobject, name, value ) ;
    return attribute ;
}

Attribute *
_DObject_FindAttribute_BottomUp ( DObject * dobject, byte * name )
{
    Word * word = 0 ;
    do
    {
        if ( ( word = Finder_FindWord_InOneNamespace ( _Finder_, dobject, name ) ) ) break ;
    }
    while ( ( dobject = dobject->ContainingNamespace ) ) ;
    if ( word ) return (Attribute*) ( word ) ;
    else return 0 ;
}
#endif


