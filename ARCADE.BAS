DECLARE SUB DrawCalendar (currday AS LONG)
TYPE GameData
  ArcadeName AS STRING * 16
  PlayerName AS STRING * 8
  DayCount AS LONG
  Cash AS DOUBLE
  Cabinets AS INTEGER
  MaxCabs AS INTEGER
  PlayPrice AS SINGLE

END TYPE

DECLARE SUB DrawWindowBorder (x AS INTEGER, y AS INTEGER, sizeX AS INTEGER, sizeY AS INTEGER)
DECLARE SUB DrawLeftPane (gdata AS GameData)
DECLARE SUB GetPlayerInfo (DataTarget AS GameData)


' this is an arcade simulator game
' Version 0.0.0 - the start

CurrentInteract% = 0     ' Which item should be highlighted



BOOT:

' Set up our basic screen:
CLS
VIEW PRINT 1 TO 24
SCREEN 0
windowName$ = "ARCADE SIMULATOR GAME THING"
LOCATE 2, 1
PRINT STRING$(80, CHR$(&HCD))
LOCATE 1, 3
PRINT windowName$
LOCATE 2, 24
PRINT CHR$(203)
LOCATE 9, 1
PRINT STRING$(23, CHR$(&HCD))
LOCATE 9, 24
PRINT CHR$(185)

' Draw our constant UI elements:
CALL DrawCalendar(12)
DIM CurrentGame AS GameData
CALL DrawWindowBorder(40, 5, 30, 5)
CALL GetPlayerInfo(CurrentGame)
LOCATE 5, 20
COLOR 5, 2
PRINT CurrentGame.PlayerName

SUB DrawLeftPane (gdata AS GameData)
' Draws the information on the left side, starting with the border

FOR i = 0 TO 20
  LOCATE 3 + i, 30
  PRINT CHR$(&HBA)
  NEXT
' do the other stuff next
LOCATE 14, 2
PRINT USING "Money: $####.##"; gdata.Cash
LOCATE 15, 2
SELECT CASE gdata.Cabinets
  CASE IS = 0
  PRINT "You have no Cabinets!"
  CASE IS = 1
  PRINT "You have 1 Cabinet!"
  CASE ELSE
  PRINT USING "You have #### Cabinets!"; gdata.Cabinets
  END SELECT
END SUB

SUB DrawWindowBorder (x AS INTEGER, y AS INTEGER, sizeX AS INTEGER, sizeY AS INTEGER)
' Determine what character to draw:
topleft = &HDA          ' u250c
topright = &HBF         ' u2510
bottomleft = &HC0       ' u2514
bottomright = &HD9      ' u2518
left = &HB3             ' u2502
right = &HB3            '
bot = &HC4              ' u2500
top = &HC4              ' single bar

FOR i = 0 TO sizeY - 1
 LOCATE y + i, x
 PRINT CHR$(left)
 LOCATE y + i, x + sizeX - 1
 PRINT CHR$(right)
 NEXT
FOR i = 1 TO sizeX - 2
 LOCATE y, x + i
 PRINT CHR$(top)
 LOCATE y + sizeY - 1, x + i
 PRINT CHR$(bot)
 NEXT
LOCATE y, x
PRINT CHR$(topleft)
LOCATE y + sizeY - 1, x
PRINT CHR$(bottomleft)
LOCATE y, x + sizeX - 1
PRINT CHR$(topright)
LOCATE y + sizeY - 1, x + sizeX - 1
PRINT CHR$(bottomright)
END SUB

SUB GetPlayerInfo (DataTarget AS GameData)
  LOCATE 6, 50
  PRINT "ENTER YOUR NAME:"
  LOCATE 7, 50
  COLOR 2, 0
  PRINT "        "
  LOCATE 7, 50
  COLOR 0, 7
  INPUT ; ""; DataTarget.PlayerName
END SUB

