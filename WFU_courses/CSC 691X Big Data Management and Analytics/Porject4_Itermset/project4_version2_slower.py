# -*- coding: utf-8 -*-
"""
Spyder Editor

This temporary script file is located here:
C:\Users\weis11\.spyder2\.temp.py
"""

import numpy as np

"""  
def Jaccard(a,b):
    
    same = 0
    total =  len(a)*2
    
    for i in range(len(a)):
        if(a[i] == b[i]):
            same = same + 1       
    total = total - same    
    return float(same/total)
    

def firstOne(initial,p):
    
    new = np.r_[0:5000]*0    
    for i in range( 5000 ):
        new[ p[i] ] =  initial[i]
        
    for i in range( 5000 ):
        if( new[i] == 1):
            return i      
      
def pertmutation(initial):
    b = []
    for i in range(numofPert):
        p = permt[i]        
        first = firstOne(initial,p)
        b.append(first)
    
    return b

def HashValue(v):
    return (3*v[0] + 7*v[1] + 11*v[2] + 13*v[3] + 19*v[4])%2000 
    

def MinHashing(vector, SID):
    
    for j in range(5):
        f = HashValue( vector[i*5,i*5+5] )
        if buckets[j][f].haskey(f):
            buckets[j][f].append(SID)
        else:
            buckets[j][f] = [f]
"""

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

    print "num1 = ", num1   # for process control
    num1 = num1 + 1         # for process control
        
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
    if(value > 10525): 
        one += [key]

print len(one)        


num2 = 0
tol = 0
for a in one:
    for b in one:
        if (a<b):
            print "num2", num2, tol
            num2 = num2 + 1
            tol = 0            
            for k,v in lyrics.iteritems():
                if ( a in v and b in v):
                    tol = tol + 1
                    
            if(tol > 10525):
                two += [ [a,b] ]
            
        
print len(two)
      
# two: [['101', '135']]          
                


