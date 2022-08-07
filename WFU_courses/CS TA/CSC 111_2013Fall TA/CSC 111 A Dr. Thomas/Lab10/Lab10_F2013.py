#-------------------------------------------------------------------------------
# Name:        Lab10_F2013
# Purpose:     Reads a text file and counts number of words, sentences, letters,
#              etc. in order to compute some basic statistics on the text.
#
# Author:      sjt
#
# Created:     28/10/2013
# Copyright:   (c) sjt 2013
# 
#-------------------------------------------------------------------------------

import os

def stripPunctuation( word ):
    """remove punctuation and digits from a word and return a copy"""
    punctuation = "',.?!()[]:;+-=" + '"'
    digits = "0123456789"
    newWord = ""
    for c in word:
        if c not in punctuation and c not in digits:
            newWord = newWord + c
    return newWord

def basicStats( list ):
    """Takes a list of numbers and returns the sum, mean, and stddev of the values"""
    sum = 0
    avg = 0
    stddev = 0
    if len(list) == 0:   # take care of an empty list
        return (None, None, None)
    
    sumSquaredDiffs = 0
    for item in list:
        sum = sum + item
    avg = sum / len(list)
    for item in list:
        sumSquaredDiffs = sumSquaredDiffs + ( item - avg ) ** 2
    stddev = ( sumSquaredDiffs / len(list)) ** 0.5

    return (sum, avg, stddev)

def main():
    # main program steps begin here    
    infilename = input("What .txt file would you like to analyze? ")
    
    # Ensure that the file exists and then open it
    while not os.path.exists(infilename):
        print("File not found.")
        infilename = input("What .txt file would you like to analyze? ")
        
    infileHandle = open( infilename, "r" )

    # start count at 0
    wordcount = 0
    sentences = 0
    wordlengths = []

    # process each line of a file
    for aline in infileHandle:
        aline = aline.strip()
        sentences = sentences + aline.count('.') + aline.count(';') + aline.count('?')
               
        # process each word in a line
        for word in aline.split():
            # use a function to get rid of punctuation marks
            word = stripPunctuation( word )
            
            if len(word) > 0:   # make sure there are characters remaining   
                wordcount = wordcount + 1        # count it!
                wordlengths.append(len(word))    # append the length to a list

    (lettercount, avgLength, stddevLength) = basicStats( wordlengths )
    
    # report the results
    print("\n" + infilename + " contains " + str( wordcount ) + " words in " +
           str(sentences) + " sentences." )
    print("Average word length:  " + format(avgLength, ".1f") )
    print("Std Dev of word length:  " + format(stddevLength, ".1f"))

    syllables = lettercount/3
    FKGL = 0.39 * (wordcount/sentences) + 11.8 * (syllables/wordcount) - 15.59
    print( "Flesch-Kincaid Grade Level: " + format(FKGL, ".1f") + "\n" )

main()

