#-------------------------------------------------------------------------------
# Name:        Project_3
# Purpose:     This program reads transaction files from a restaurant and does
#              several calculations that a restaurant might do at the end of
#              each business day.
#
# Author:      sjt
#
# Created:     24/09/2013
# Copyright:   (c) sjt 2013
#
#-------------------------------------------------------------------------------

import os

def checkVisa( ccn ):
    """Take a ccn and compute the Luhn's sum.  If it's a multiple of
       10 then return true, else return false"""

    ccn = stripHyphens( ccn )
    if not allDigits( ccn ):
        return False

    sum = 0
    for ndx in range(0,15,2):
        next = 2 * eval( ccn[ndx] )
        sum = sum + next // 10 + next % 10
        sum = sum + eval( ccn[ndx+1] )

    # return True if sum is a multiple of 10
    return sum % 10 == 0

def stripHyphens( astring ):
    """remove hyphens from the user's input"""
    result = ""
    for c in astring:
        if c != '-':
            result = result + c
    return result

def allDigits( astring ):
    """check a string to make sure it only contains digits,
       return True or False, appropriately"""
    digits = "0123456789"
    for c in astring:
        if c not in digits:
            return False
    return True

def computeTax( rate, total ):
    """determines how much tax was paid on a total amount given a
       tax rate as a fraction"""
    bill = total/(1+rate)
    taxpaid = total - bill
    return taxpaid

# Main program steps begin here
infilename = input("What receipt file would you like to process? ")
# Ensure that the file exists and then open it
while not os.path.exists(infilename):
    print("File not found.")
    infilename = input("What receipt file would you like to process? ")
infileHandle = open( infilename, "r" )

# create an output file to write bad CCNs
outfilename = "badnumbers-" + infilename[-12:]
date = infilename[-12:-4]
print("\nDeacon Dew Drop Bistro - Closing stats for " + date)
outfileHandle = open( outfilename, "w" )

# variables for computing various sums
cashtotal = 0
cardtotal = 0
tiptotal = 0
badcount = 0
totalpatrons = 0

totalmealswithwine = 0
totaltipswithwine = 0
totalmealswowine = 0
totaltipswowine = 0

# Extra Credit
#smallgrouptips = 0
#smallgroupmeals = 0
#largegrouptips = 0
#largegroupmeals = 0

# Process a single line at a time
for aline in infileHandle:
    # split out the fields
    fields = aline.split(':')
    #print(fields)

    #print("lalalalalalalalalalalalalalalalalalalalala",fields)

    # check fields[0] to see if it's a bad CCN, otherwise get to work
    if( fields[0] != "cash" and not checkVisa( fields[0] )):
        badcount = badcount + 1
        outfileHandle.write( aline )

    # how much was paid?
    amountpaid = eval(fields[1][1:])

    # sum up the amount of cash received and the credit card receipts
    if fields[0] == "cash":
        cashtotal = cashtotal + amountpaid
    else:
        cardtotal = cardtotal + amountpaid
    totaltake = cashtotal + cardtotal

    # how much was the tip?
    tip  = eval(fields[2][1:])
    tiptotal = tiptotal + tip

    # now we know how much the meal cost
    mealcost = amountpaid - tip

    # we want to see if people who bought wine were better tippers
    food = fields[4]
    if "wine" in food:
        totalmealswithwine = totalmealswithwine + mealcost
        totaltipswithwine = totaltipswithwine + tip
    else:
        totalmealswowine = totalmealswowine + mealcost
        totaltipswowine = totaltipswowine + tip

    # summing the number of patrons so average meal cost can be computed
    totalpatrons = totalpatrons + eval( fields[3] )

# Extra Credit
#    if patrons>4:
#        largegroupmeals = largegroupmeals + mealcost
#        largegrouptips = largegrouptips + tip
#    else:
#        smallgroupmeals = smallgroupmeals + mealcost
#        smallgrouptips = smallgrouptips + tip

print("Total take: $", format( totaltake, ".2f" ))
print(" Cash take: $", format( cashtotal, ".2f" ))
print(" Card take: $", format( cardtotal, ".2f" ))
print()
print("Tips to disburse: $", format( tiptotal, ".2f" ))
print()

taxtoremit = computeTax( 0.07, totaltake - tiptotal )
print("Tax owed to NC: $", format( taxtoremit, ".2f" ))
print()
if totalpatrons > 0 :
    print("There were " + str(totalpatrons) +
          " patrons who spent an average of $" + format(totaltake/totalpatrons,".2f") +
          " each.")
print()
if totalmealswithwine > 0:
    print("Bills with wine averaged a " +
          format(totaltipswithwine/totalmealswithwine*100,".1f")+ "% tip.")
if totalmealswowine > 0:
    print("Bills without wine averaged a " +
          format(totaltipswowine/totalmealswowine*100,".1f")+ "% tip.")

# Extra Credit
#if largegroupmeals > 0:
#    print("Groups with more than 4 people averaged a tip of " +
#          format(largegrouptips/largegroupmeals*100,".1f") + "%")

#if smallgroupmeals > 0:
#    print("Groups with no more than 4 people averaged a tip of " +
#          format(smallgrouptips/smallgroupmeals*100,".1f") + "%")

print()
if badcount != 1:
    print("There were " + str(badcount) + " bad credit card numbers.")
else:
    print("There was " + str(badcount) + " bad credit card numbers.")

infileHandle.close()
outfileHandle.close()






