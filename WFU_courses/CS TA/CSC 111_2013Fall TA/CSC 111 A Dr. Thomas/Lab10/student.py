#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      yingrc13
#
# Created:     12/11/2013
# Copyright:   (c) yingrc13 2013
# Licence:     <your licence>
#-------------------------------------------------------------------------------
import math
import os

# ----------- STRIP PUNCTUATION ----------- #

def stripPunctuation( word ):
    """remove punctuation and digits from a word and return a copy"""
    punctuation = "',.?!()[]:;+-=" + '"'
    digits = "0123456789"
    newWord = ""
    for c in word:
        if c not in punctuation and c not in digits:
            newWord = newWord + c
    return newWord

# ----------- WORD COUNT ----------- #

def wordcount():
    """Count the total number of words"""
    infileHandle = open( infilename, "r" )
    wordcount = 0
    for line in infileHandle:
        line = line.strip()
        for word in line.split():
            word = stripPunctuation( word )
            if len(word) > 0:
                word = word.lower()
                wordcount = wordcount + 1
    return wordcount

# ----------- SENTENCE COUNT ----------- #

def sentencecount():
    """Count the total number of sentences"""
    infileHandle = open( infilename, "r" )
    count = 0
    for line in infileHandle:
        line = line.strip()
        count = count + line.count(".")
        count = count + line.count("?")
        count = count + line.count(";")
    return count

# ----------- AVERAGE LENGTH OF WORDS ----------- #

def findaverage():
    """Find the average length of words"""
    infileHandle = open( infilename, "r" )
    count = []
    for line in infileHandle:
        line = line.strip()
        for word in line.split():
            word = stripPunctuation(word)
            count.append(len(word))
    average = sum(count)/len(count)
    average = round(average, 1)
    return average

# ----------- STANDARD DEVIATION ----------- #

def stddev():
    """Find the standard deviation of the average length of words"""
    infileHandle = open( infilename, "r" )
    total = 0
    for line in infileHandle:
        line = line.strip()
        for word in line.split():
            word = stripPunctuation(word)
            length = len(word)
            point = (length - average) ** 2
            total = total + point
    std = math.sqrt(total/wordcount)
    std = round(std, 1)
    return std

# ----------- FLESCH KINCAID GRADE LEVEL ----------- #

def syllables():
    """Approximates the number of syllables"""
    infileHandle = open( infilename, "r" )
    total = 0
    for line in infileHandle:
        line = line.strip()
        for word in line.split():
            word = stripPunctuation(word)
            length = len(word)
            total = total + length
    syllables = total / 3
    return syllables

def fkgl():
    """Calculates the Flesch-Kincaid Grade Level"""
    level = (0.39 * (wordcount/sentence)) + (11.8 * (syllables/wordcount)) - 15.59
    level = round(level, 1)
    return level

# ----------- INPUT ----------- #

infilename = input("What .txt file would you like to evaluate? ")
while not os.path.exists(infilename):
    print("File not found.")
    infilename = input("What .txt file would you like to evaluate? ")
infileHandle = open( infilename, "r" )

# ----------- VARIABLES ----------- #

wordcount = wordcount()
sentence = sentencecount()
average = findaverage()
stddev = stddev()
syllables = syllables()
fkgl = fkgl()

# ----------- PRINT RESULTS ----------- #

print(infilename, "contains", wordcount, "words in", sentence, "sentences.")
print("Average word length:", average)
print("Std dev of word length:", stddev)
print("Flesch-Kincaid Grade Level:", fkgl)


