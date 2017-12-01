
#include "../include/cfrtil64.h"

void
CfrTil_Class_New ( void )
{
    byte * name = ( byte* ) DataStack_Pop ( ) ;
    //_Class_New ( name, CLASS, 0, ( byte* ) _Namespace_DoNamespace ) ;
    _DataObject_New (CLASS, 0, name, 0, 0, 0, 0, 0, 0 ) ;
}

void //Word *
CfrTil_Class_Value_New ( )
{
    byte * name = ( byte* ) DataStack_Pop ( ) ;
    Word * word = _DataObject_New (OBJECT, 0, name, 0, 0, 0, 0, 0, 0 ) ;
}

void
CfrTil_Class_Clone ( void )
{
    byte * name = ( byte* ) DataStack_Pop ( ) ;
    _DataObject_New (CLASS_CLONE, 0, name, 0, 0, 0, 0, 0, 0 ) ;
}

void
CfrTil_DObject_New ( )
{
    // clone DObject -- create an object with DObject as it's prototype (but not necessarily as it's namespace)
    _DataObject_New (DOBJECT, 0, 0, 0, 0, 0, 0, 0, 0 ) ;
}

Namespace *
CfrTil_Type_New ( )
{
    CfrTil_Token ( ) ;
    byte * name = ( byte* ) DataStack_Pop ( ) ;
    return _DataObject_New (C_TYPE, 0, name, 0, 0, 0, 0, 0, 0 ) ;
}

void
CfrTil_Typedef ( )
{
    //_CfrTil_Attributedef ( ) ;
    _DataObject_New (C_TYPEDEF, 0, 0, 0, 0, 0, 0, 0, 0 ) ;
}

