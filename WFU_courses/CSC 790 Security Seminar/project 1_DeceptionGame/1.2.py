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


for k in np.r_[1:500:1]:
    min_k_v = min(k,v)
    x_val += [k]
    y_val += [sum(stats.hypergeom.pmf(np.r_[1:min_k_v:1], n, v, k))]
    
pl.plot(x_val, y_val)
pl.title("static addressing")
pl.ylabel("attacker success \\beta for finding 1 vulberale computer")
pl.xlabel("the number of attacker scans k")
pl.show()
