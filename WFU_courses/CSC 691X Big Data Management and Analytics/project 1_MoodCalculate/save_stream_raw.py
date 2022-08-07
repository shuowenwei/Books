# -*- coding: utf-8 -*-

from twython import TwythonStreamer
import mysql.connector
import string
from datetime import date

# connect to the database server
connection = mysql.connector.connect(user='DEACdoer', password='student2014',
                                     host='homer.cs.wfu.edu', database='tweetLog')
# we use a cursor to reference specific values in the database
cursor = connection.cursor()

# secret keys
CONSUMER_KEY = ''
CONSUMER_SECRET = ''
ACCESS_TOKEN_KEY = ''
ACCESS_TOKEN_SECRET = ''

# used later in program to replace punctuation characters by spaces using translate()
REPLACEMENTS = string.maketrans( string.punctuation, ' '*len( string.punctuation ))

# dictionary to translate Month names to numbers
MONTHDICT = {'':0, 'Jan':1, 'Feb':2, 'Mar':3, 'Apr':4, 'May':5, 'Jun':6,
             'Jul':7, 'Aug':8, 'Sep':9, 'Oct':10,'Nov':11, 'Dec':12}

# template for the SQL INSERT statement
SQLInsert = ("INSERT INTO tweets "
             "VALUES (%s, %s, %s, %s, %s, %s, %s)") 

def doInsert( data ):
    # Break out the interesting fields from the data
    ID = data['id_str'].encode('utf-8')
    creation = data['created_at'].encode('utf-8')
    creationDay  = creation[0:3]
    creationDate = date(int(creation[26:30]), MONTHDICT[creation[4:7]], int(creation[8:10]))
    creationTime = creation[11:19]
    # convert tweet text from unicode to printable ascii
    asciiText    = filter(lambda x: x in string.printable, data['text']).encode('utf-8', errors='ignore')    
    
    if  data['coordinates'] != None:	# a lot of tweets have no localization data    	    
       lon = data['coordinates']['coordinates'][0]
       lat = data['coordinates']['coordinates'][1]
       tweetData = (ID, creationDay, creationDate, creationTime, lon, lat, asciiText)
    else:
       tweetData = (ID, creationDay, creationDate, creationTime, None, None, asciiText)

    # twitter occasionally sends duplicate IDs in their streaming data, so be careful
    try:
        cursor.execute( SQLInsert, tweetData)
    except mysql.connector.IntegrityError as err:
        print err
    
    connection.commit()
   
# Required class for providing callbacks for handling twitter stream
class MyStreamer(TwythonStreamer):

    def on_success(self, data):
	if 'text' in data:
	    doInsert( data )
                     
    def on_error(self, status_code, data):
        print status_code
        # stop trying to get data if there is an error
        self.disconnect()

# main
if __name__=="__main__":	
    stream = MyStreamer( CONSUMER_KEY, CONSUMER_SECRET,
                         ACCESS_TOKEN_KEY, ACCESS_TOKEN_SECRET ) 
    # get tweets containing breakfast				 
    #stream.statuses.filter(track="football", language='en')
    # get tweets originating in the continental US - roughly
    stream.statuses.filter(language='en', locations='-125, 25, -65, 50')

    
