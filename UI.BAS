DECLARE FUNCTION NextInteract ( CurrentInteract AS INTEGER, Direction AS INTEGER)
DECLARE SUB DrawCalendar (currday AS LONG)
DECLARE SUB SortInteracts

$STATIC
DIM SHARED MonthNames(12,3) AS STRING
MonthNames(1) = "JAN"
MonthNames(2) = "FEB"
MonthNames(3) = "MAR"
MonthNames(4) = "APR"
MonthNames(5) = "MAY"
MonthNames(6) = "JUN"
MonthNames(7) = "JUL"
MonthNames(8) = "AUG"
MonthNames(9) = "SEP"
MonthNames(10) = "OCT"
MonthNames(11) = "NOV"
MonthNames(12) = "DEC"

DIM SHARED MonthLens(12) AS INTEGER
MonthLens(1) = 31
MonthLens(2) = 28
MonthLens(3) = 31
MonthLens(4) = 30
MonthLens(5) = 31
MonthLens(6) = 30
MonthLens(7) = 31
MonthLens(8) = 31
MonthLens(9) = 30
MonthLens(10) = 31
MonthLens(11) = 30
MonthLens(12) = 31

TYPE Interactable
  Text as STRING * 20   ' What is written to screen
  XPos AS INTEGER       ' Where
  YPos As INTEGER
  DisplayMe AS INTEGER  ' 0 = don't print it, 1 = print it, 2 = print it, highlighted?
END TYPE
$DYNAMIC
DIM SHARED InteractList(5) AS Interactable


FUNCTION NextInteract (CurrentInteract AS INTEGER, Direction AS INTEGER)



END FUNCTION

SUB SortInteracts

END SUB

SUB DrawCalendar (currday AS LONG)
' Re-implementing Variable lengths for months
' Challenge you self!!!
' leap years can take a hike tho
EmptyOffset = 0     ' How many days to offset our calendar start by
ThisYear = 1
ThisMonth = 1
DayCounter = currday
DO WHILE DayCounter > 365
  ThisYear = ThisYear + 1 ' Would some kind of division be easier? And faster? Sure. But i dont care.
  DayCounter = DayCounter - 365
  EmptyOffset = EmptyOffset + 1
LOOP
DO WHILE DayCounter > MonthLens(ThisMonth) ' Same deal here. This is slow but more likely to work 
  DayCounter = DayCounter - MonthLens(ThisMonth)
  EmptyOffset = EmptyOffset + (MonthLens(ThisMonth) - 28) ' Modulo division? What do i look like, a nerd?
  ThisMonth = ThisMonth + 1
LOOP    ' i mean buddy, you're running a dos game written in qb4.5 in 2025, slowness is just part of the charm.

EmptyOffset = EmptyOffset MOD 7   ' ok yeah fine i *am* writing a qb 4.5 program in 2025, I am a nerd.

LOCATE 3, 3
PRINT MonthNames(ThisMonth); ", Year "; ThisYear

LOCATE 4, 3
PRINT "SU MO TU WE TH FR SA"
firstrow% = 3 + (3 * EmptyOffset)
firstcol% = 3
FOR i = 1 TO MonthLens(ThisMonth)
  IF i = DayCounter THEN
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