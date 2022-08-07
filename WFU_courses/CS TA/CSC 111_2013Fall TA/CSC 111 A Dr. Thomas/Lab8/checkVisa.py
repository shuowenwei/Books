#-------------------------------------------------------------------------------
# Name:        Lab_8.py
# Purpose:     Program does initial validation on credit card numbers using
#              Luhn's algorithm.
#
# Author:      xxx
#
# Created:     14/10/2013
# Copyright:   (c) sjt 2013
#
#-------------------------------------------------------------------------------

def checkVisa( ccn ):
    """Take a ccn and compute the Luhn's sum.  If it's a multiple of
       10 then return true, else return false"""
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
    digits = "0123456789"
    for c in astring:
        if c not in digits:
            return False
    return True

def promptAndRead():
    """Prompt the user to type in a credit card number"""
    response = input("\nGive me your credit card number (with or without hyphens)\n" +
                     "or enter q to stop: ")
    return response

# main
def main():

    CCN = promptAndRead()
    # loop until the user wants to quit
    while CCN != 'q':
        CCN = stripHyphens( CCN )     # get rid of hyphens

        # process the user's input
        if len(CCN) != 16:                # length must be 16
            print("\nValid numbers must contain 16 digits.  Try again.")
        elif allDigits( CCN ) == False:   # must contain only digits
            print("\nInput contains non-digit character.  Try again.")
        elif checkVisa( CCN ) == True:    # check the number
            print("\nOK.  We will accept your credit card.\n" +
                  "Thank you for shopping at Deac-Mart.")
        else:
            print("\nTry again.  That is not a valid credit card number.")

        # get another input
        CCN = promptAndRead()

main()



