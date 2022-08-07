# -*- coding: utf-8 -*-
"""
Spyder Editor

This temporary script file is located here:
C:\Users\weis11\.spyder2\.temp.py
"""

from scipy import stats
import numpy as np
import pylab as pl
n = 2**16-2
m = 0.25*n
v = int(.1*m)

alpha = 1/float(v)

x_val = []
y_val = []
yy_val = []

for k in np.r_[1:300:1]:
    min_k_v = min(k,v)
    x_val += [k]
    y_val += [sum(stats.hypergeom.pmf(np.r_[1:min_k_v:1], n, v, k))]
    yy_sum = 0
    for x in np.r_[1:min_k_v:1]:
        yy_sum = yy_sum + scipy.misc.comb(k,x)*(0.025**x)*(0.975**(k-x))
        #print p**(x)*(1-p)**(k-x)

    yy_val += [yy_sum]
    
pl.plot(x_val, y_val,x_val,yy_val)
pl.legend(("static addressing","perfect shuffling"))
pl.title("static addressing v.s. perfect shuffling")
pl.ylabel("attacker success \\beta for finding 1 vulberale computer")
pl.xlabel("the number of attacker scans k")
pl.show()
