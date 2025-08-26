TYPE GameData
  playername AS STRING * 16
  arcadename AS STRING * 8
  money AS DOUBLE
  day AS INTEGER
  cabinets AS INTEGER
  cabmax AS INTEGER
END TYPE

COMMON MonthList()   AS INTEGER
MonthList.0 = 31
MonthList.1 = 28
MonthList.2 = 31
MonthList.3 = 30
MonthList.4 = 31
MonthList.5 = 30
MonthList.6 = 31
MonthList.7 = 31
MonthList.8 = 30
MonthList.9 = 31
MonthList.10 = 30
MonthList.11 = 31

