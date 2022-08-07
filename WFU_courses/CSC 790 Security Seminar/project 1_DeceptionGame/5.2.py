


import scipy
import numpy as np
import pylab as pl

n = 254
v = 20
p = 20.0/254.0
k=50
min_k_v = 20 
threshold = 5


a= sum(stats.hypergeom.pmf(np.r_[5:21:1], n, v, k))
a  


p
y_sum = 0

for x in np.r_[5:21:1]:
    print x
    y_sum = y_sum + scipy.misc.comb(k,x)*(p**x)*((1-p)**(k-x))
    
y_sum

    
h=5
hb= sum(stats.hypergeom.pmf(np.r_[5:21:1], n, v, k)*stats.hypergeom.pmf(0, n, h, k))
    
hb