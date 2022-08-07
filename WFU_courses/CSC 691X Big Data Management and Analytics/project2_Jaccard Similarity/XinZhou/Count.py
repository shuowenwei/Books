#### Firstly generate the countall.txt to calculate the IDF 
#### Xin Zhou, 23-Mar-2014

#!/usr/local/bin/python 

import sys 
import string
import math
import fileinput

txtfile = 

allnames = []
allids = []
newDict = {}
newDict2 = {}

count = []
for j in range(5001):
    count.append(0)

for aline in fileinput.input(txtfile):
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
			xy = int(splitfield[0])	
			#newDict[name,ID,splitfield[0]] = splitfield[1]
			count[xy] = count[xy]+1	
			newDict2[xy]= count[xy]  	
		i = i+1			

#allnames.pop()  # pop out the \n in the end
#print(newDict)
#print(allids)
#print(newDict['TRAAABD128F429CF47','6477168','1'])
#print(newDict2)

with open ('countall.txt', 'w') as fp:
	for p in newDict2.items():
		fp.write("%s:%s\n" % p)






	
	
