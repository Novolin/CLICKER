DECLARE FUNCTION NextInteract ( CurrentInteract AS INTEGER, Direction AS INTEGER)


TYPE Interactable
  Text as STRING * 20   ' What is written to screen
  XPos AS INTEGER       ' Where
  YPos As INTEGER
  DisplayMe AS INTEGER  ' 0 = don't print it, 1 = print it, 2 = print it, highlighted?
END TYPE
$DYNAMIC
DIM SHARED InteractList(5) AS Interactable