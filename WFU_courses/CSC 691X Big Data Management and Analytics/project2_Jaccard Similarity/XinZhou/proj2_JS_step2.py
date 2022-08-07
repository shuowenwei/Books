import sys 
import string
from collections import defaultdict
import itertools

def list_duplicates(seq):
    tally = defaultdict(list)
    for i,item in enumerate(seq):
        tally[item].append(i)
    return ((key,locs) for key,locs in tally.items() 
                            if len(locs)>1)

txtfile=open(sys.argv[1],'r')    # hasheddata.txt
totalnum = 210519
band = 100
MS = []
NN = []
i = 0
jj = 0
for aline in txtfile.readlines(): 
	print jj	  	
	line=aline.split("], [") 
	for field in line:
		NN.append(field)
		i = i+1
	if i == band:
		MS.append(NN)
		NN = []
		i = 0 
	jj = jj+1
	

txtfile.close()	
KK =[]
PP = []
for i in range(0,band):
	for j in range(0,totalnum):
		KK.append(MS[j][i])
	PP.append(KK)
	KK = []

countpairs = 0
newDict={}
for i in range(0,band):
	print i
	for dup in list_duplicates(PP[i]):
		pairs = []
		if ([dup[0][4:6]]==['00']):
			countpairs = countpairs
		else:
			#print [dup[0]], len(dup[1])
			#print sorted(dup[1])
			pairs = list(itertools.combinations(sorted(dup[1]), 2))
			for jj in range(0,len(pairs)):
				#print jj
				newDict[pairs[jj]] = 1
			#countpairs = countpairs + len(dup[1])

#print countpairs
with open ('uniquepairs.txt', 'w') as fp:
	for p in newDict.items():
		fp.write("%s:%s\n" % p)
			
 
