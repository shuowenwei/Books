# -*- coding: utf-8 -*-
"""
Spyder Editor

This temporary script file is located here:
C:\Users\weis11\.spyder2\.temp.py
"""

import numpy as np
   
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
    
"""  
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

initial = np.r_[0:5000]*0   # initial[0], initial[1] .... initial[4999]

numofPert = 25  # r = 5 b = 5

buckets = [{},{},{},{},{}]

numofbuckets = 2000
   
data = []
permt = []
for i in range(numofPert):     
    permt.append( np.random.permutation(5000) ) 

num1 = 0
for aline in filehandle:    #print type(aline[0]) #  <type 'str'> 

    print "num1 = ", num1   # for process control
    num1 = num1 + 1         # for process control
    
    initial = np.r_[0:5000]*0
    
    if ( aline[0] in 'T'):        
        asong = aline.split(",") # <type 'list'>
        i = 1        
        for e in asong:

            if (i > 2):
                sub_e = e.split(':')                
                initial[ int( sub_e[0] )-1 ] = 1
            i = i + 1
            
        sign = pertmutation(initial)
        data.append(sign)
        
filehandle.close()        


for i in range(len(data)):
    #print "i = ", i     # for process control
    vector = data[i]
    for j in range(5):
        f = HashValue( vector[j*5 : j*5+5] )
        if buckets[j].has_key(f):
            buckets[j][f].append(i)
        else:
            buckets[j][f] = [i]

master = []
masternum = 0

num2 = 0
for i in range(5):
    for key,value in buckets[i].iteritems():
        if len(value) > 1:
            print "num2 = ",num2  # for process control,  num2 will be more than 10,000
            num2 = num2 +1 
            for can1 in range(len(value)):
                for can2 in range(len(value)):
                    if (can1 < can2):
                        if Jaccard( data[ value[can1] ], data[ value[can2] ] ) > 0.95: #  >= ???
                            #print "haha",Jaccard( data[ value[can1] ], data[ value[can2] ])    
                            if (value[can1] < value[can2] ):
                                if ( [ value[can1],value[can2] ] not in master):
                                    master.append( [ value[can1],value[can2] ] ) 
                                    masternum = masternum + 1
                            else:
                                if ( [ value[can2],value[can1] ] not in master):
                                    master.append( [ value[can2],value[can1] ] )
                                    masternum = masternum + 1

print masternum # 10713

# the result in the end is 10713







