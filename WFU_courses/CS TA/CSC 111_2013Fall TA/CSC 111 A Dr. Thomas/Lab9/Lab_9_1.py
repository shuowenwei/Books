#-------------------------------------------------------------------------------
# Name:        Lab_9_1.py
# Purpose:     This program helps a person practice their anagram solving skills.
#              It chooses a random word from a large list, scrambles it, and gives
#              the user a chance to unscramble the anagram.
#
# Author:      xxx
#
# Created:     10/23/2013
#
#-------------------------------------------------------------------------------

import random

def scramble( word ):
    """This function doesn't currently do anything useful.  Fix it!"""
    return word

def readWords():
    """Reads a file of words and returns a list of the words"""

    # Read a file containing one word per line and create a list
    filehandle = open("wordlist.txt", mode='r')
    words = []
    # Strip off extraneous characters at the end of each string
    for word in filehandle.readlines():
        words.append(word.strip())
    return words

# Main program starts here

# Read a list of words and store it in a list named words
words = readWords()

userinput = ''
while userinput != 'q':
    
    # get a random integer to use as an index
    randomIndex = random.randint(0, len(words))
    
    # grab a word at random from the list
    randomWord = words[ randomIndex ]
    
    # scramble the word randomly
    scr = scramble( randomWord )
    
    # see if user can figure it out
    userGuess = input("Scramble: " + scr + "  Your solution: ")
    
    if userGuess == randomWord:
        print("Good job.  You are almost as clever as me.\n")
    else:
        print("No, the word was " + randomWord + ".  Let's try another word.\n")
        
    # Prompt for the next round
    userinput = input("Type 'n' to try another scramble or 'q' to quit. ")
    