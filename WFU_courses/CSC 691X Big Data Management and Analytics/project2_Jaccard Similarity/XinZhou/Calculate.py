#!/usr/local/bin/python 

import sys 
import string
import math

txtfile=open(sys.argv[1],'r')
row=[] 
allnames = []
allids = []
newDict = {}
newDict2 = {}
newDict3 = {}
newDict4 = {}
for aline in txtfile.readlines(): 
	column=[]
	line=aline.split(",") 
	i = 1
	for field in line:
		#print field
		column.append(field) 
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
	row.append(column)

allnames.pop()  # pop out the \n in the end

#print(allnames)
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
			allf.append(value)
		except:
			pass
	jj = jj+1	
        maxf = max(allf)
	allmaxf.append(maxf)
 
			
# calculate the f/maxf (TF) for each word of each song
jj = 0
count = []
for j in range(5000):
    count.append(0)

for name in allnames:
	for k in range(5000):
		try:
			ID = allids[jj]
			maxf = allmaxf[jj]
			value = newDict[name,ID,str(k+1)]                
			newDict2[name,ID,str(k+1)]= float(value)/float(maxf)

			count[k] = count[k]+1
			newDict3[k+1]= count[k]  
		except:
			pass
	jj = jj+1


#print(newDict2) 
#print(newDict3)


# calculate the TF*IDF for each word of each song
jj = 0
for name in allnames:
	for k in range(5000):
		try:
			ID = allids[jj]
			value = newDict2[name,ID,str(k+1)] 
			countnum = newDict3[k+1]  
                        #import pdb
                        #pdb.set_trace()            
			newDict4[name,ID,str(k+1)]= (210519/float(countnum))*float(value)
		except:
			pass
	jj = jj+1


print(newDict4)


# find the one with the max TF*IDF
print(sorted(newDict4.values()))



	
	
