import numpy as np

def Jaccard(a,b):
  same =0
  total= len(a) + len(b)

  for i in range(len(a)):
      if (a[i] ==b[i]):
          same +=1
    
  total = total - same
  return float(same/toal)


def permutOrders(list1,permutnum):
  
  pert = []  
  for i in range(permutnum):
    pert.append(np.random.permutation(5000))

  ordering = []
  for i in range (permutnum):
	index = pert[i]
	first_one = findFirst1(list1, index)
	ordering.append(first_one)

  return ordering


def findFirst1(list2, permute):

  table1 = np.zeros(shape = (5000,1))

  for i in range(5000):
    
    table1[permute[i]] = list2[i]
    if (table1[permute[i]]==1):
      return i
      #return the index of the first ONE in given permutation


def hashbuckets(table, bucketsnum, bucketlist, bandsnum):

  for i in range(len(table)):
    buff = table[i]
    for x in range(bucketsnum):
      value = minHash( buff[x*bandsnum:x*bandsnum+bandsnum] )  
    #grouping and hashing
      if bucetlist[x].has_key(values):
        bucketlist[x][value].append(i)
      else:
        bucketlist[x][value]=[i]
 
  return bucketlist
  #hashing to different buckets


def minHash(values):
  hashvalue = (values[0]*3 +values[1]*9 + values[2]*27 +values[3]*81) %1231
  #randomly created hash function
  
  return hashvalue

  
def findPairs(bucketnum, bucketlist, table):
#find and return similar pairs
  finallist=[]

  for i in range(bucketnum):
    for bnum, bvalue in bucketlist[i].iteritems():
      if (len(bvalue)<1):
        break #break when value is empty

      for a in range(len(bvalue)):
        for b in range(len(bvalue)):
           if (a!=b):
              jaccard = Jaccard(table[bvalue[a]], table[bvalue[b]])
              if (jaccard >=.95):
                finallist.append([table[a], table[b]])
  
  return finallist



#main
filehandle = open("mxm_dataset_train.txt","rt")

bands = 4

buckets = 5
bucketlist = [{}, {}, {}, {}, {}]

permutnum = bands*buckets
#20

table =[]
lyricList = np.zeros(shape = (5000,1))

for aline in filehandle:

  if(aline[0] in 'T'):
    asong = aline.split(",")
    i=1
    for x in asong:
      if(i>2):
         split1 = x.split(':')
         lyricList[ int(split1[0])-1] =1
         #counting rule
      i+=1             
    table.append(permutOrders(lyricList, permutnum))           	
	
filehandle.close()

bucketlist = hashbuckets(table, buckets, bucketlist, bands)

finallist1 =[]
finallist1 = findPairs(buckets, bucketlist, table)

finalnum = len(finallist1)
print finalnum
