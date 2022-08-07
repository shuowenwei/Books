# s = 0.95, row = 50, band = 100

import sys 
import string
import numpy as np


def hash_func_demo1(x):
    return x % 5

def hash_func_demo2(x):
    return (2 * x  + 1) % 5

def hash_func_demo3(x):
    return (3 * x  + 7) % 32

def hash_func_demo4(x):
    return (4 * x ) % 32

def min_hash(data, hash_funcs):
    MAX = 100000000
    M, N, R = len(data), len(data[0]), len(hash_funcs)
   
    rt = []
    for i in range(0,M):
	rt.append([10000000] * R)
   
    for r in range(0, N):  
        hashes = map(lambda x : x(r + 1), hash_funcs)
        for col in range(0, M):   
            if data[col][r] == 0:
                continue            
            for k in range(0, R):   
                rt[col][k] = min(rt[col][k], hashes[k])
    return rt

# txtfile=open(sys.argv[1],'r')

filehandle = open("partaa.txt","rt")

totalnum = 210519
band = 100
row= 50
wordnum = 5000 
MS = []
#allnames = []
#allids = []

hash_funcs = [hash_func_demo1,hash_func_demo2,hash_func_demo3,hash_func_demo4]

jj = 0
for aline in filehandle: 
	print jj
	MM = [0]*wordnum
        if ( aline[0] not in '#%'):   
		line=aline.split(",") 
		i = 1
		for field in line:
		        #if (i == 1):
				#name = field
				#allnames.append(name)
			#if (i == 2):
				#ID = field
				#allids.append(ID)                    
			if (i > 2):				
				splitfield = field.split(':')
				MM[int(splitfield[0])-1] = 1 #int(splitfield[1])					 											
			i = i+1
		data = np.reshape(MM,(band,row))
		hasheddata =  min_hash(data, hash_funcs)
		MS.append(hasheddata)
  
  		jj = jj + 1

txtfile.close()	

with open ('hasheddata.txt', 'w') as fp:
	for item in MS:
  		fp.write("%s\n" % item)


