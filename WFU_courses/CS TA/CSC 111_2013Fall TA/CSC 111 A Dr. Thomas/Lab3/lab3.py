#-------------------------------------------------------------------------------
# Name:        lab3
# Purpose:
#
# Author:      weis11
#
# Created:     11/09/2013
# Copyright:   (c) weis11 2013
# Licence:     <your licence>
#-------------------------------------------------------------------------------

# Get the amount of the bill
amount_due = eval(input("How much was the bill? "))
# and the amount paid
amount_paid = eval(input("How much was paid? "))
c = amount_paid - amount_due
print (c)
r = round(c * 100)
print(r)

ll = r // 100
r = r % 100
q = r // 25
r = r % 25
d = r // 10
r = r % 10
n= r // 5
r = r % 5
p = r
print("Amount tendered: $", amount_paid)
print(" Bill: $", amount_due)
print("Give back:")
print(ll,"dollars")
print(q, "quarters")
print(d, "dimes")
print(n, "nickels")
print(p, "pennies")


