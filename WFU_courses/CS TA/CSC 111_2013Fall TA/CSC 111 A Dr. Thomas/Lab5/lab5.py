#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      weis11
#
# Created:     25/09/2013
# Copyright:   (c) weis11 2013
# Licence:     <your licence>
#-------------------------------------------------------------------------------

def isLeapYear(year):
    if (year % 4 == 0):
        if ( year % 100 == 0):
            if (year % 400 == 0):
                return True
            else:
                return False
        else:
            return True
    else:
        return False


year = eval (input ("type a year after 1582: ") )

if isLeapYear(year) == True:
    print("leap year")
else:
    print("not a leap year")