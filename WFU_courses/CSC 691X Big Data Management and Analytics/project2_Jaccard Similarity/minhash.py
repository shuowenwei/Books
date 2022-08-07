import os
import sys

def hash_func_demo1(x):
    return x % 5

def hash_func_demo2(x):
    return (2 * x  + 1) % 5

def hash_func_demo3(x):
    return (3* x  + 2) % 5

### data:[C1, C2, C3, ... CM]; C1:[a1, a2, a3 ... an]. thus D: n * m
### hash_funcs;[h1, h2, ..., hr]
### return: r * m matrix

def min_hash(data, hash_funcs):
    MAX = 100000000
    M, N, R = len(data), len(data[0]), len(hash_funcs)
    #print M,N,R
    rt = []
    for i in range(0,M):
	rt.append([10000000] * R)
    #print rt   
    for r in range(0, N):  
        hashes = map(lambda x : x(r + 1), hash_funcs)
	#import pdb
        #pdb.set_trace()
        for col in range(0, M):   
            if data[col][r] == 0:
                continue            
            for k in range(0, R):   
                rt[col][k] = min(rt[col][k], hashes[k])

    return rt


if __name__ == "__main__":
    data = [[1, 1, 0, 1,1,0],
            [0, 0, 0, 1,1,1]]

    hash_funcs = [hash_func_demo1]
    rt =  min_hash(data, hash_funcs)
    print rt
