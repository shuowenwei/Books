#### This script can be used to generate IF*IDF for all the data or part of the data
#### But firstly generate the countall.txt to calculate the IDF (use "Count.py") 
#### Xin Zhou, 23-Mar-2014

#!/usr/local/bin/python 

import sys 
import string
import math

txtfile=open(sys.argv[1],'r')
countfile=open(sys.argv[2],'r')
totalnum = 210519
row=[] 
allnames = []
allids = []
newDict = {}
newDict2 = {}
newDict3 = {}

for aline in txtfile.readlines(): 
	line=aline.split(",") 
	i = 1
	for field in line:
		if (i == 1):
			name = field
			allnames.append(name)
		if (i == 2):
			ID = field
			allids.append(ID)
		if (i > 2):
			splitfield = field.split(':')	
			newDict[name,ID,splitfield[0]] = splitfield[1]		
		i = i+1			

allnames.pop()  # pop out the \n in the end

for aline in countfile.readlines(): 
	splitline = aline.split(':')	
	newDict2[splitline[0]] = splitline[1]				

#allnames.pop()  # pop out the \n in the end

#print(newDict)
#print(allids)
#print(newDict['TRAAABD128F429CF47','6477168','1'])

# find the max word frequence of each file
jj = 0
allmaxf = []
for name in allnames:
	allf = []
	for k in range(5000):
                #import pdb
                #pdb.set_trace() 
		try:
			ID = allids[jj]
			value = newDict[name,ID,str(k+1)]
			allf.append(int(value))
		except:
			pass
	jj = jj+1	
        maxf = max(allf)
	allmaxf.append(maxf)

#print(allmaxf)
 
			
# calculate the f/maxf (TF) * IDF for each word of each song
jj = 0

for name in allnames:
	for k in range(5000):
		try:
			ID = allids[jj]
			maxf = allmaxf[jj]
			value = newDict[name,ID,str(k+1)] 
			value1= float(value)/float(maxf)
			value3 = newDict2[str(k+1)]
			value2= math.log(totalnum/float(value3))/math.log(2) 
                        #import pdb
                        #pdb.set_trace()          
			newDict3[name,ID,str(k+1)]= value1*value2
		except:
			pass
	jj = jj+1

#print(newDict3) 


#print(sorted(newDict3.values()))

with open ('ffac.txt', 'w') as fp:
	for p in newDict3.items():
		fp.write("%s:%s\n" % p)

# find the key and value which is the maximum IF*IDF
inverse = [(value, key) for key, value in newDict3.items()]
print max(inverse)[1]
print max(inverse)[0]



	
	
