'by default QB64 Phoenix edition always use current dir of the editor, so we need to change the work directory for assets
'using CHDIR (Change directory) command
CHDIR "/home/aji/Programming/Game Development/QB64 Project/dvd_bounce/assets"

TYPE vec2
    x AS INTEGER
    y AS INTEGER
END TYPE

TYPE rect
    width AS INTEGER
    height AS INTEGER
END TYPE

CONST SWIDTH = 1280
CONST SHEIGHT = 720
CONST FPS = 60

CONST FALSE = 0, TRUE = NOT FALSE

CONST WHITE = _RGB32(255, 250, 250)
CONST BLACK = _RGB32(0, 0, 0)
CONST YELLOW = _RGB32(255, 255, 0)
CONST GREEN = _RGB32(0, 255, 0)
CONST RED = _RGB32(255, 0, 0)

SCREEN _NEWIMAGE(SWIDTH, SHEIGHT, 32)
_TITLE "DVD BOUNCE"

TYPE DVD
    pos AS vec2
    img AS LONG
    speed AS vec2
END TYPE

'game variabel

DIM dvdImgs(7) AS LONG
FOR i = 0 TO 7
    dvdImgs(i) = _LOADIMAGE("dvdlogo-0" + _TRIM$(STR$(i) + ".png"))
NEXT i

DIM d AS DVD
DIM idx AS INTEGER

d.img = dvdImgs(idx)
d.speed.x = 3
d.speed.y = 3


_SCREENMOVE _MIDDLE

DO
    CLS
    _LIMIT FPS

    IF d.pos.x > SWIDTH - _WIDTH(d.img) - 1 OR d.pos.x < 0 THEN
        IF idx = 7 THEN idx = 0
        idx = idx + 1
        d.img = dvdImgs(idx)
        d.speed.x = d.speed.x * -1
    END IF

    IF d.pos.y > SHEIGHT - _HEIGHT(d.img) - 1 OR d.pos.y < 0 THEN
        IF idx = 7 THEN idx = 0
        idx = idx + 1
        d.img = dvdImgs(idx)
        d.speed.y = d.speed.y * -1
    END IF


    d.pos.x = d.pos.x + d.speed.x
    d.pos.y = d.pos.y + d.speed.y

    _PUTIMAGE (d.pos.x, d.pos.y), d.img
    _DISPLAY
LOOP UNTIL _KEYDOWN(27)
SYSTEM

FOR i = 0 TO 7
    _FREEIMAGE dvdImgs(i)
NEXT i

