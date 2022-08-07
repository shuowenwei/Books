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

def transformWordList( wordlist ):
    """Take a list of actual words; create a new list where
       each word has its letters in alphabetical order."""
    newWordlist = []
    for word in wordlist:
        newWord = wordToLetters( word )
        newWordlist.append( newWord )
    return newWordlist

def getInput():
    userinput = input("Enter a scrambled word or 'q' to quit. ")
    return userinput

def wordToLetters( word ):
    """Takes a word as a parameter; turns it into a list of
       letters which are then sorted alphabetically.  Returns
       a new word containing the letters in alphabetical order."""
    ltrlist = list(word)        # Turn word into a list of letters
    ltrlist.sort()              # Sort the list of letters
    newWord = ''.join(ltrlist)  # Construct a new word from the letters
    return newWord

# Main program starts here.  Place new functions above this line.

# Read a list of words and store it in a list named words
words = readWords()

# Create a second list of words containing the letters in alphabetical order
wordsTransformed = transformWordList( words )

userinput = getInput()
while userinput != 'q':

    # Take user input and put letters in alphaetical order
    userinputTransformed = wordToLetters( userinput )
    
    # Make sure it's a word in the list, otherwise punt
    if userinputTransformed not in wordsTransformed:
        print( "That word is not in the word list.\n" )
    else:
        index = wordsTransformed.index( userinputTransformed )
        print( "One answer is " + words[index] + "\n")
     
    userinput = getInput()
    
    




