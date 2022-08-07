### for the project3: PageRank
### 04-2014,Xin Zhou

from numpy import *
## exact the link URL info
BETA = 0.9     # for magic transport
txtfile = open("UCB_URLs.txt","rt") 
newDict = {}  
for aline in txtfile.readlines(): 
	try:
		line=aline.split(":") 
		newDict[int(line[0])] = line[1]+line[2]	
	except:
		pass
txtfile.close()	
num = len(newDict)


## exact the link matrix info
txtfile = open("UCB_links.txt","rt") 
M1= zeros((num,num))
for aline in txtfile.readlines(): 	        
	link=aline.split(":") 
	M1[int(link[1])-1][int(link[0])-1]=1

rows = M1.shape[0]
M1=M1.transpose()

M2= zeros((num,num))
for i in range(rows):
	if sum(M1[i])>0:
		M2[i] = M1[i]*(1.0/sum(M1[i]))
	
M2=M2.transpose()
	
v = array([[1.0/rows for i in range(rows)]]).transpose()  # need column vector

n = v.size     

# calculat the pagerank
for i in range(50):
	print i
	v = dot(M2, v)    # for simplified PageRank 
	#v = BETA * dot(M2, v) + array([(1 - BETA) * 1.0/n for i in range(n)]).reshape(n,1) 
 
#v2 = sorted(v)
indx = [i[0] for i in sorted(enumerate(v), key=lambda x:x[1])]
maxindx = indx[-10:]

print "highest 10 link index:"
print maxindx
print "highest 10 pagerank:"
for i in range(len(maxindx)):
	print v[maxindx[i]]
#print v2[-10:]

txtfile.close()	

print "Highest 10 link URL:"
for i in range(len(maxindx)):
	print newDict[maxindx[i]+1]
txtfile.close()	







## calulate the trusted pagerank
trustednum = 9
v3 = array([[0.0 for i in range(n)]]).transpose()  # need column vector
for i in range(len(maxindx)-1):
	v3[maxindx[i]]=1.0/trustednum


N = array([0.0 for i in range(n)]).reshape(n,1)
for i in range(len(maxindx)-1):
	N[maxindx[i]]=(1 - BETA) * 1.0/trustednum 
  

for i in range(50):
	print i
	v3 = BETA * dot(M2, v3) + N 


for i in range(len(maxindx)):
	print v3[maxindx[i]]


## calculate the spam mass
print "Highest 10 links' spam mass:"
for i in range(len(maxindx)):
	print (v[maxindx[i]]-v3[maxindx[i]])/v[maxindx[i]]





