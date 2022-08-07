# -*- coding: utf-8 -*-
"""
Spyder Editor

This temporary script file is located here:
C:\Users\weis11\.spyder2\.temp.py
"""

import numpy as np
import pylab as pl
import string

import math

# filehandle = open("partaa.txt","rt")

filehandle = open("mxm_dataset_train.txt","rt")

D = 210519

dictionary_word = {}
dictionary_song = {}

wordlist = [] 

for i in range(5001):
    dictionary_word[str(i)] = 0 

num1 = 0
for aline in filehandle:  #print type(aline[0]) #  <type 'str'> 

    print "num1 = ", num1
    num1 = num1 +1   
    if ( aline[0] in '%'):      
        words = aline.split(",") # <type 'list'>
        for e in words:
            wordlist += [e]

            
    max_word = 0     
    if ( aline[0] not in '#%'):        
        asong = aline.split(",") # <type 'list'>
        i = 1
        #print asong.split()
        # asont_array = np.asarray(asong)  
        maxk = 0
        for e in asong:
            if( i ==1 ):
                sid = e
                dictionary_song[sid] = max_word
                # TID.append( tid )
                # print e
            if( i == 2 ):
                mxmid = e
                # MXMID.append( mxmid )
                #print e
            if (i > 2):
                #print e
                sub_e = e.split(':')
                dictionary_word[ sub_e[0] ] = dictionary_word[ sub_e[0] ] + 1
                
                if ( int(sub_e[1]) >  max_word ):
                     max_word = int( sub_e[1] )
                     dictionary_song[ sid ] = max_word 
            i = i + 1
            
filehandle.close()

# filehandle = open("partaa.txt","rt")

filehandle = open("mxm_dataset_train.txt","rt")

max_tf_idf = 0


num2 = 0
for aline in filehandle:

    print "num2 = ", num2
    num2 = num2 +1   
    
    if ( aline[0] not in '#%'):        
        asong = aline.split(",") # <type 'list'>
        i = 1
        
        for e in asong:
            if( i ==1 ):
                sid = e
                # TID.append( tid )
                # print e
            if( i == 2 ):
                mxmid = e
                # MXMID.append( mxmid )
                #print e
            if (i > 2):
                #print e
                sub_e = e.split(':')
                
                f = int( sub_e[1] )
                tf_idf=( f/dictionary_song[sid] ) * math.log( D/dictionary_word[sub_e[0]],2)
                
                if ( tf_idf >= max_tf_idf ): 
                    max_tf_idf = tf_idf
                    max_sid = sid
                    max_word = sub_e[0]
                    max_mxmid = mxmid   
                    print  max_sid, max_mxmid, max_word, max_tf_idf, 
            i = i + 1


print max_sid, max_mxmid, max_word, max_tf_idf, wordlist[int(max_word)-1]

# xin: ('TRKOBGR128F425D53C', '2529869', '4854'):9.99709039417

# mine: TRAYDZS128F4288459 7636056 4797 11.6608872703
    
filehandle.close()


# filehandle = open("partaa.txt","rt")

    
    
        
print wordlist[4796]        

# print max_sid, max_mxmid, max_word, max_tf_idf










