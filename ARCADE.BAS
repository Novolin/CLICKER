DECLARE SUB DayLoop ( gdata as GameData)
DECLARE SUB DrawCalendar (currday AS LONG)
DECLARE SUB DrawWindowBorder (x AS INTEGER, y AS INTEGER, sizeX AS INTEGER, sizeY AS INTEGER)
DECLARE SUB DrawLeftPane (gdata as GameData)
DECLARE SUB GetPlayerInfo (dataTarget as GameData)
DECLARE SUB DrawInteractables (CurrentInteract as INTEGER)

' this is an arcade simulator game
' Version 0.0.0 - the start

TYPE GameData
  ArcadeName AS STRING * 16
  PlayerName AS STRING * 8
  DayCount AS LONG
  Cash AS DOUBLE
  Cabinets as INTEGER
  MaxCabs as INTEGER
  PlayPrice as single
END TYPE

TYPE Interactable
  Text as STRING * 20   ' What is written to screen
  XPos AS INTEGER       ' Where
  YPos As INTEGER
  DisplayMe AS INTEGER  ' 0 = don't print it, 1 = print it, 2 = print it, highlighted?
END TYPE
$DYNAMIC
DIM SHARED InteractList(5) AS Interactable
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
CALL GetPlayerInfo(CurrentGame)


SUB DrawCalendar (currday AS LONG)
' all months have 28 days, because that's easier
' Determine the Year/Month/Day:

calendarday = currday MOD 28
longmonth = currday \ 28
calendaryear = longmonth \ 12
calendarmonth = longmonth MOD 12

SELECT CASE calendarmonth
  CASE IS = 0
   textmonth$ = "JAN"
  CASE IS = 1
   textmonth$ = "FEB"
  CASE IS = 2
   textmonth$ = "MAR"
  CASE IS = 3
   textmonth$ = "APR"
  CASE IS = 4
   textmonth$ = "MAY"
  CASE IS = 5
   textmonth$ = "JUN"
  CASE IS = 6
   textmonth$ = "JUL"
  CASE IS = 7
   textmonth$ = "AUG"
  CASE IS = 8
   textmonth$ = "SEP"
  CASE IS = 9
   textmonth$ = "OCT"
  CASE IS = 10
   textmonth$ = "NOV"
  CASE ELSE
   textmonth$ = "DEC"
END SELECT

LOCATE 3, 3
PRINT textmonth$; ", Year "; calendaryear

LOCATE 4, 3
PRINT "SU MO TU WE TH FR SA"
firstrow% = 5
firstcol% = 3
LOCATE firstrow%, firstcol%
FOR i = 1 TO 28
  IF i = calendarday THEN
    COLOR 0, 7
  ELSE
    COLOR 7, 0
  END IF
  LOCATE firstrow%, firstcol%
  PRINT USING "##"; i
  firstcol% = firstcol% + 3
  IF firstcol% > 23 THEN
    firstcol% = 3
    firstrow% = firstrow% + 1
    END IF
  NEXT


END SUB

SUB DrawLeftPane (gdata as GameData)
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
  PRINT USING "You have #### Cabinets!" ; gdata.Cabinets
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

SUB RunDay

END SUB

SUB GetPlayerInfo (dataTarget as GameData)
  DrawWindowBorder(40, 5, 30, 5)
  LOCATE 6,50
  PRINT: "ENTER YOUR NAME:"
  LOCATE 7,50
  COLOR 2,0
  PRINT: "        "
  LOCATE 7,50
  COLOR 0,7
  INPUT; "";  DataTarget.PlayerName
END SUB

SUB DrawInteractables (CurrentInteract as INTEGER)
FOR i = 1 to UBOUND(InteractList)
  LOCATE InteractList(i).YPos, InteractList(i).XPos
  IF i = CurrentInteract THEN
    COLOR 4, 0
  ELSE
    COLOR 0,7
  END IF
  If InteractList(i).DisplayMe > 0 THEN
    PRINT InteractList(i).Text
  END IF
COLOR 0,7     ' Reset our colour to default

END SUB

