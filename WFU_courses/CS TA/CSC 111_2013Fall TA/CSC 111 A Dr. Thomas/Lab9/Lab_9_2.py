#-------------------------------------------------------------------------------
# Name:        Lab_9_2.py
# Purpose:     This program takes an anagram or scrambled word and finds a word
#              from a word list that it could have been derived from.
#
# Author:      xxx
#
# Created:     10/23/2013
#
#-------------------------------------------------------------------------------

def readWords():
    """Read a file of words and return a list of the words"""

    # Read a file containing one word per line and create a list

    filehandle = open("wordlist.txt", mode='r')

    words = []
    for word in filehandle.readlines():
        words.append(word.strip())
    return words

def getInput():
    userinput = input("Enter a scrambled word or 'q' to quit. ")
    return userinput


# Main program starts here.  Place new functions above this line.

# Read a list of words and store it in a list named words
words = readWords()

userinput = getInput()
while userinput != 'q':

    # Find a word in the list of words named words that could have
    # been the initial word corresponding to "userinput".  If no
    # such word is found, print an appropriate message.

    userinput = getInput()






