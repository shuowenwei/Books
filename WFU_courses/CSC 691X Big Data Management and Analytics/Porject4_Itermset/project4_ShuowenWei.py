# -*- coding: utf-8 -*-
"""
Spyder Editor

This temporary script file is located here:
C:\Users\weis11\.spyder2\.temp.py
"""

import numpy as np

#filehandle = open("test.txt","rt")

filehandle = open("mxm_dataset_train.txt","rt")

one = [] 
two = [] 
three = []

lyrics = {}
workds = {} 

for i in range(5001):
    workds[str(i+1)] = 0 

num1 = 0
for aline in filehandle:    #print type(aline[0]) # <type 'str'> 
    #print "num1 = ", num1   # for process control
    #num1 = num1 + 1         # for process control       
    if ( aline[0] in 'T'):
        asong = aline.split(",") # <type 'list'>
        i = 1 
        for e in asong:
            if( i == 2 ):
                mxmid = e
                lyrics[mxmid] = []                
            if (i > 2):
                sub_e = e.split(':')    
                if ( int( sub_e[0] ) > 100 ):  
                    lyrics[mxmid].append( sub_e[0] )
                    workds[ sub_e[0] ] += 1 
            i = i + 1
            
filehandle.close()        

#   210519/20 = 10525.95
for key,value in workds.iteritems():    
    if(value > 8420): 
        one += [key]
        
# len(one) = 271
print len(one)        


statTwo = {} 
for a in one:
    for b in one:
        if( a < b ):
            statTwo[ a,b ] = 0

num2 = 0
for key,value in lyrics.iteritems():
    print "num2", num2
    num2 = num2 + 1
    for a in value:
        for b in value:
            if( statTwo.has_key( (a,b) ) ):
                statTwo[ a,b ] = statTwo[ a,b ] + 1


for key,value in statTwo.iteritems():
    if(value > 8420):
        two += [key]

print two, len(two)
#[('101', '141'), ('102', '117'), ('106', '126'), ('101', '115'), ('103', '115'), ('101', '103'), ('101', '113'), ('115', '141'), ('103', '106'), ('101', '135'), ('101', '110')]
# len(two) = 11 



statThree = {}
for a in one:
    for b in two:
        if( a < b[0] ):
            statThree[ a, b[0], b[1] ] = 0   
        if ( a > b[0] and a < b[1] ):
            statThree[ b[0], a, b[1] ] = 0
        if( a > b[1] ):
            statThree[ b[0], b[1], a ] = 0
            
            
num3 = 0
for key,value in lyrics.iteritems():
    print "num3", num3
    num3 = num3 + 1
    for aa in value:
        for bb in value:
            for cc in value:
                if( aa < bb and bb < cc):
                    if(statThree.has_key( (aa,bb,cc) ) ):
                        statThree[ aa,bb,cc ] = statThree[ aa,bb,cc ] + 1


for key,value in statThree.iteritems():
    if(value > 8420):
        print "hahah", key
        three += [key]
        
print len(three)

# len(three), 0


"""
three=[]
for aa in two:
    for bb in two:
        for cc in two:
            if( aa!=bb and bb!=cc and aa!=cc):
                if( aa[0]==cc[0] and aa[1] == bb[1] and bb[0]==cc[1]):
                    three += [ [ aa[0],aa[1],cc[1] ] ]   
print three, len(three)
            
# [['101', '141', '115'], ['101', '115', '103']] 2            

Numof103 = 0 
Numof141 = 0


num3 = 0
for key,value in lyrics.iteritems():
    print "num3", num3
    num3 = num3 + 1
    if('101' in value and '115' in value):
        if('103' in value):
            Numof103 = Numof103 + 1
        if('141' in value):
            Numof141 = Numof141 + 1
        
print Numof103, Numof141
       
                        
#print statTwo['101','115'], statTwo['101','103'], statTwo['101','141']    
"""
                        
                        
