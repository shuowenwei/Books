#-------------------------------------------------------------------------------
# Name:        Lab_8.py
# Purpose:     Program does initial validation on credit card numbers using
#              Luhn's algorithm.
#
# Author:      sjt
#
# Created:     14/10/2013
# Copyright:   (c) sjt 2013
#
#-------------------------------------------------------------------------------

def checkVisa( CCN ):
   # to be completed
    output = CCN
    return output

#   pass  # remove this line

def stripHyphens( astring ):
   # to be completed
   pass  # remove this line

def allDigits( astring ):
   # to be completed
   pass # remove this line

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


