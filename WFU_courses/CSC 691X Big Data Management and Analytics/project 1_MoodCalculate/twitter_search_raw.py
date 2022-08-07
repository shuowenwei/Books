# -*- coding: utf-8 -*-

from twython import Twython

# Plug in the keys you receive from twitter/dev
CONSUMER_KEY = ''
CONSUMER_SECRET = ''
ACCESS_TOKEN_KEY = ''
ACCESS_TOKEN_SECRET = ''

if __name__=="__main__":
		
    twitterHandle = Twython( CONSUMER_KEY, CONSUMER_SECRET,
                             ACCESS_TOKEN_KEY, ACCESS_TOKEN_SECRET ) 
    # twitterHandle is an object with several associated methods,
    # only the search method is illustrated here. See API documentation at
	# https://dev.twitter.com/docs/api/1.1/get/search/tweets
    
    searchResult = twitterHandle.search( q='Super Bowl', count=180 )
    # searchResult is a dictionary with two keys:  'search_metadata', 'statuses'
   
    # searchResult['search_metadata'] will retrieve the metadata
    # searchResult['statuses'] is a list of up to "count" dictionaries,
	# each dictionary stores a tweet with all of its metadata
    print "\nSearch returned", len(searchResult['statuses']), "tweets"

    # here's a list of keys associated with the first result, other
    # tweets should have the same keys
    print "\nKeys associated with first result:  ", searchResult['statuses'][0].keys()
    print "'text' is the content most people associate with a tweet"
	
	# This is just the text of tweet[1]
    print "\nTweet 1 text:  ", searchResult['statuses'][1]['text'].encode('utf-8')
	
	# Here is the entire content of tweet[2]
    print "\nTweet dump:"
    for key, value in searchResult['statuses'][2].items():
	    print "[", key, "]  ", value
		
       

