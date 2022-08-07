# -*- coding: utf-8 -*-

import mysql.connector
import string

# read the AFINN_111 wordlist and store in a Python dictionary
# format:   word or phrase  sentiment value (-5 .. 5)
worddict = {}
filehandle = open("AFINN_111.txt", "rt")
for aline in filehandle:
    fields = aline.split()             # split line into a list of words
    mood = int(fields[len(fields)-1])  # the last one is the mood rating
    key = ' '.join(fields[0:len(fields)-1])        # join the other fields back together as a string
    worddict[key] = int(mood)          # create a dictionary entry (key,val)

# connect to the database server
connection = mysql.connector.connect(user='DEACdoer', password='student2014',
                                     host='homer.cs.wfu.edu', database='tweetLog',
                                     use_unicode=False)

# we use a cursor to reference specific values in the database
cursor = connection.cursor()

# template for the SQL SELECT statement
CountQuery = ("SELECT COUNT(*) as count "
              "FROM tweets"     ) 
getallQuery = ("SELECT rawText "
               "FROM tweets "
               "WHERE latitude > %s" )
     
# main
if __name__=="__main__":	
    
    cursor.execute( CountQuery )
    size = cursor.fetchone()
    print "There are currently", size[0] , "tweets in the database."

    # going to read tweets from the database and calculate the mood/sentiment values
    tweetCount = 0
    overallMoodSum = 0  
    
    cursor.execute( getallQuery, (40.0,) )
    for (tweet) in cursor:
        tweetText = tweet[0].lower()                               # lower case
        tweetText = tweetText.translate(None, string.punctuation)  # remove punctuation
        wordlist  = tweetText.split(' ')   # split on blanks to create a list of words

        moodsum = 0
        keywordFound = False        
    
        for w in wordlist:                          # iterate over words in the tweet
            if w in worddict:                       # if the word is in the dictionary
                keywordFound = True
                moodsum = moodsum + worddict[w]     # add in the mood value       
                
        if keywordFound:
            tweetCount = tweetCount + 1
            overallMoodSum = overallMoodSum + moodsum
            print moodsum, tweetText    

    print "\n\n", tweetCount, "tweets processed."
    print "Average mood: ", overallMoodSum/float(tweetCount)
 
    connection.close()   