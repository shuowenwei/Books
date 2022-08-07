#-------------------------------------------------------------------------------
# Name:        Easterdate
# Purpose:     Determines the month and day of easter in any year
#
# Author:      sjt
#
# Created:     24/09/2013
# Copyright:   (c) sjt 2013
#
#-------------------------------------------------------------------------------

def WhatMonth(year):
    a = year % 19
    b = year // 100
    c = year % 100
    d = b // 4
    e = b % 4
    f = ( b + 8 ) // 25
    g = ( b - f + 1 ) // 3
    h = ( 19 * a + b - d - g + 15 ) % 30
    i = c // 4
    k = c % 4
    l = ( 32 + 2 * e + 2 * i - h - k ) % 7
    m = ( a + 11 * h + 22 * l ) // 451
    p = ( h + l - 7 * m + 114 ) % 31
    month = ( h + l - 7 * m + 114 ) // 31
    date = p + 1
    return month


def WhatDate(year):
    a = year % 19
    b = year // 100
    c = year % 100
    d = b // 4
    e = b % 4
    f = ( b + 8 ) // 25
    g = ( b - f + 1 ) // 3
    h = ( 19 * a + b - d - g + 15 ) % 30
    i = c // 4
    k = c % 4
    l = ( 32 + 2 * e + 2 * i - h - k ) % 7
    m = ( a + 11 * h + 22 * l ) // 451
    p = ( h + l - 7 * m + 114 ) % 31
    month = ( h + l - 7 * m + 114 ) // 31
    date = p + 1
    return date


# Get the input
year = eval(input("Type a year after 1582:"))

'''
# Do the calculations
a = year % 19
b = year // 100
c = year % 100
d = b // 4
e = b % 4
f = ( b + 8 ) // 25
g = ( b - f + 1 ) // 3
h = ( 19 * a + b - d - g + 15 ) % 30
i = c // 4
k = c % 4
l = ( 32 + 2 * e + 2 * i - h - k ) % 7
m = ( a + 11 * h + 22 * l ) // 451
p = ( h + l - 7 * m + 114 ) % 31
month = ( h + l - 7 * m + 114 ) // 31
date = p + 1
'''


# report results
print("The date of Easter in", year, "is", WhatMonth(year), "/", WhatDate(year), "/", year)


