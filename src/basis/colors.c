#include "../include/cfrtil64.h"

#if 0

void
_OpenVmTil_ColorsInit ( OpenVmTil * ovt )
{
    Colors_Init6 ( &_O_->Alert, 0, 0, 0, 255, 0, 0 ) ;
    Colors_Init6 ( &_O_->Debug, 255, 255, 255, 0, 0, 255 ) ;
    Colors_Init6 ( &_O_->Default, 0, 0, 0, 64, 64, 64 ) ;
    Colors_Init6 ( &_O_->Notice, 255, 255, 255, 0, 255, 0 ) ; // grey, cyan
    Colors_Init6 ( &_O_->User, 0, 0, 0, 255, 255, 255 ) ; // grey, cyan

    _Colors_Init2 ( &_O_->Alert, Color_Black, Color_Red ) ;
    _Colors_Init2 ( &_O_->Debug, Color_Black, Color_Blue ) ;
    _Colors_Init2 ( &_O_->Default, Color_Default, Color_Default ) ;
    _Colors_Init2 ( &_O_->Notice, Color_Green, Color_Black ) ;
    _Colors_Init2 ( &_O_->User, Color_Black, Color_White ) ;
}
#else

void
_OpenVmTil_ColorsInit ( OpenVmTil * ovt )
{
    Colors_Init6 ( &ovt->Alert, 255, 0, 0, 0, 0, 0 ) ;
    Colors_Init6 ( &ovt->Debug, 0, 0, 255, 0, 0, 0 ) ;
    Colors_Init6 ( &ovt->Default, 0, 255, 0, 0, 0, 0 ) ;
    Colors_Init6 ( &ovt->Notice, 127, 127, 0, 255, 255, 255 ) ;
    Colors_Init6 ( &ovt->User, 0, 255, 0, 255, 255, 255 ) ;

    _Colors_Init2 ( &ovt->Alert, Color_Magenta, Color_Black ) ; //Color_Red, Color_Default ) ;
    _Colors_Init2 ( &ovt->Debug, Color_Blue, Color_Default ) ;
    _Colors_Init2 ( &ovt->Default, Color_Default, Color_Default ) ;
    _Colors_Init2 ( &ovt->Notice, Color_Yellow, Color_Black ) ;
    _Colors_Init2 ( &ovt->User, Color_Green, Color_Default ) ;
    ovt->Current = & ovt->Default ;
}
#endif

void
Console ( )
{
    DataStack_Push ( ( int64 ) & _O_->Console ) ;
}

void
_ShowRGB ( int64 fr, int64 fg, int64 fb, int64 br, int64 bg, int64 bb )
{
    if ( _O_->Console == 1 ) _Printf ( (byte*) "%c[38;2;%d;%d;%dm %c[48;2;%d;%d;%dm", ESC, fr, fg, fb, ESC, br, bg, bb ) ; // Konsole mode
    else if ( _O_->Console == 2 ) _Printf ( (byte*) "%c[38;5;%d;%d;%dm%c[48;5;%d;%d;%dm", ESC, fr, fg, fb, ESC, br, bg, bb ) ; // 'xterm' mode
}

void
_String_ShowRGB ( byte * buf, int64 fr, int64 fg, int64 fb, int64 br, int64 bg, int64 bb )
{
    if ( _O_->Console == 1 ) sprintf ( (char*) buf, "%c[38;2;%ld;%ld;%ldm %c[48;2;%ld;%ld;%ldm", ESC, fr, fg, fb, ESC, br, bg, bb ) ; // Konsole mode
    else if ( _O_->Console == 2 ) sprintf ( (char*) buf, "%c[38;5;%ld;%ld;%ldm%c[48;5;%ld;%ld;%ldm", ESC, fr, fg, fb, ESC, br, bg, bb ) ; // 'xterm' mode
}

void
_ShowRgbColors ( Colors *c )
{
    Colors_Setup6 ( c, fr, fg, fb, br, bg, bb ) ;
    _ShowRGB ( fr, fg, fb, br, bg, bb ) ;
}

void
_String_ShowRgbColors ( byte * buf, Colors *c )
{
    Colors_Setup6 ( c, fr, fg, fb, br, bg, bb ) ;
    _String_ShowRGB ( buf, fr, fg, fb, br, bg, bb ) ;
}

void
Colors_Init6 ( Colors *c, int64 fr, int64 fg, int64 fb, int64 br, int64 bg, int64 bb )
{
    Colors_Get6 ( c, fr, fg, fb, br, bg, bb ) ;
}

void
ShowColors ( Colors * c )
{
    if ( _O_->Console ) _ShowRgbColors ( c ) ;
    else _ShowColors ( c->ics_IntColors.Fg, c->ics_IntColors.Bg ) ;
    if ( c ) _O_->Current = c ;
}

void
String_ShowColors ( byte * buf, Colors * c )
{
    if ( _O_->Console ) _String_ShowRgbColors ( buf, c ) ;
    else _String_ShowColors ( buf, c->ics_IntColors.Fg, c->ics_IntColors.Bg ) ;
    if ( c ) _O_->Current = c ;
}

void
_Colors_Init2 ( Colors * c, int64 fg, int64 bg )
{
    c->ics_IntColors.Fg = fg, c->ics_IntColors.Bg = bg ;
}

void
_CfrTil_SetRGBColor ( Colors * c )
{
    int64 fr, fg, fb, br, bg, bb ;
    bb = DataStack_Pop ( ) ;
    bg = DataStack_Pop ( ) ;
    br = DataStack_Pop ( ) ;
    fb = DataStack_Pop ( ) ;
    fg = DataStack_Pop ( ) ;
    fr = DataStack_Pop ( ) ;
    Colors_Get6 ( c, fr, fg, fb, br, bg, bb ) ;
}

void
_CfrTil_SetColors ( Colors * c )
{
    int64 fg, bg ;
    bg = DataStack_Pop ( ) ;
    fg = DataStack_Pop ( ) ;
    _Colors_Init2 ( c, fg, bg ) ;
}

void
Ovt_UserColors ( )
{
    ShowColors ( &_O_->User ) ;
}

void
Ovt_AlertColors ( )
{
    ShowColors ( &_O_->Alert ) ;
}

void
Ovt_DefaultColors ( )
{
    ShowColors ( &_O_->Default ) ;
}

void
Ovt_DebugColors ( )
{
    ShowColors ( &_O_->Debug ) ;
}

void
Ovt_NoticeColors ( )
{
    ShowColors ( &_O_->Notice ) ;
}

void
CfrTil_SetDefaultColors ( )
{
    _CfrTil_SetColors ( &_O_->Default ) ;
}

void
CfrTil_SetAlertColors ( )
{
    _CfrTil_SetColors ( &_O_->Alert ) ;
}

void
CfrTil_SetDebugColors ( )
{
    _CfrTil_SetColors ( &_O_->Debug ) ;
}

void
CfrTil_SetUserColors ( )
{
    _CfrTil_SetColors ( &_O_->User ) ;
}

void
CfrTil_SetNoticeColors ( )
{
    _CfrTil_SetColors ( &_O_->Notice ) ;
}

void
CfrTil_SetDefaultRGB ( )
{
    _CfrTil_SetRGBColor ( &_O_->Default ) ;
}

void
CfrTil_SetUserRGB ( )
{
    _CfrTil_SetRGBColor ( &_O_->User ) ;
}

void
CfrTil_SetAlertRGB ( )
{
    _CfrTil_SetRGBColor ( &_O_->Alert ) ;
}

void
CfrTil_SetDebugRGB ( )
{
    _CfrTil_SetRGBColor ( &_O_->Debug ) ;
}

void
CfrTil_SetNoticeRGB ( )
{
    _CfrTil_SetRGBColor ( &_O_->Notice ) ;
}


