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

k = int(.1*n)

x_val = []
y_val = []


for h in np.r_[1:80:5]:
    # since k > v
    x_val += [h]
    y_val += [sum(stats.hypergeom.pmf(np.r_[1:v:1], n, v, k)*stats.hypergeom.pmf(0, n, h, k))]
    

pl.plot(x_val, y_val)
pl.title("using honeypot strategy")
pl.ylabel("attacker success \\beta")
pl.xlabel("the number of honeypots h")
pl.show()



