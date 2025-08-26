DECLARE FUNCTION AskName! ()

DECLARE SUB DrawCalendar (currday AS LONG)
DECLARE SUB DrawWindowBorder (x AS INTEGER, y AS INTEGER, sizeX AS INTEGER, sizeY AS INTEGER)
DECLARE SUB DrawLeftPane (money AS DOUBLE, cabinets AS INTEGER, cabmax AS INTEGER)

' this is an arcade simulator game
' Version 0.0.0 - the start




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
DAYSTART:
DO
test$ = INKEY$
LOOP UNTIL test$ = CHR$(32)
LOCATE 4, 20
test = AskName
PRINT test

DAYEND:

FUNCTION AskName
INPUT ; "What is your name", fart
AskName = fart
EXIT FUNCTION

END FUNCTION

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

SUB DrawLeftPane (money AS DOUBLE, cabinets AS INTEGER, cabmax AS INTEGER)
' Draws the information on the left side, starting with the border

FOR i = 0 TO 20
  LOCATE 3 + i, 30
  PRINT CHR$(&HBA)
  NEXT
' do the other stuff next
LOCATE 14, 2
PRINT USING "Money: $####.##"; money
LOCATE 15, 2
IF cabinets > 1 THEN
 PRINT USING "You Have #### Cabinets."; cabinets
END IF
IF cabinets = 1 THEN
 PRINT "You Have 1 Cabinet."
 END IF
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

