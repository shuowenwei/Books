# -*- coding: utf-8 -*-
"""
Created on Wed Apr 16 18:32:30 2014

@author: weis11
"""

from numpy import *
import numpy as np

links = {}
url = {}

filehandle = open("UCB_links.txt","rt")
for aline in filehandle:
    data_links = aline.split(":")
    fr = int(data_links[0])
    to = int(data_links[1])
    if links.has_key(fr):
        links[fr].append(to)
    else:
        links[fr] = [to]
filehandle.close()

filehandle = open("UCB_URLs.txt","rt")
for aline in filehandle:
    data_url = aline.split(":")
    k = int(data_url[0])
    u = data_url[1] + data_url[2]
    url[k] = u    
filehandle.close()


r = max(links)
c = max(links)
M = np.zeros((r,c))

for key,value in links.iteritems():
    denomi = len( links[key] )
    for i in range(denomi):
        M[ value[i]-1, key-1 ] = 1.0/denomi

rows = M.shape[0]
v = array([[1.0/rows for i in range(rows)]]).transpose() 


# part 1

v1 = v
for i in range(50):
   v1 = dot(M, v1)

index = sorted(range(len(v1)), key=lambda i: v1[i])[-10:]
print  v1[index], index
for i in range(len(index)):
    print index[i]+1,"\t: ",url[ index[i]+1 ]


# part 2a
#  for taxation/transport/topic specificity/ etc.    

v2 = v
BETA = 0.9     # for magic transport
n = v2.size    

for i in range(50):
   v2 = BETA * dot(M, v2) + array([(1 - BETA) * 1.0/n for i in range(n)]).reshape(n,1) 

index = sorted(range(len(v2)), key=lambda i: v2[i])[-10:]
print  v2[index], index
for i in range(len(index)):
    print index[i]+1,"\t: ",url[ index[i]+1 ]


# part 2b

v3 = v
BETA = 0.8    
n = v3.size    

for i in range(50):
   v3 = BETA * dot(M, v3) + array([(1 - BETA) * 1.0/n for i in range(n)]).reshape(n,1) 

index = sorted(range(len(v3)), key=lambda i: v3[i])[-10:]
print  v3[index], index
for i in range(len(index)):
    print index[i]+1,"\t: ",url[ index[i]+1 ]



# part 3

rows = M.shape[0]
v4 = array([[ 0.0 for i in range(rows)]]).transpose()  
for i in range(len(index)-1):
    v4[ index[i] ] = 1.0/9

BETA = 0.9

N = array([[ 0.0 for i in range(rows)]]).transpose()  

for i in range(len(index)-1):
	N[ index[i] ]=(1 - BETA) * 1.0/9 


for i in range(50):
   v4 = BETA * dot(M, v4) + N 


print ( max(v1) - max(v4) ) / max(v1) # the spam mass of the highest ranked page
 


    