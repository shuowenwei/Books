# -*- coding: utf-8 -*-
"""
Spyder Editor

This temporary script file is located here:
C:\Users\weis11\.spyder2\.temp.py
"""

from scipy import stats
import numpy as np
import pylab as pl
from mpl_toolkits.mplot3d.axes3d import Axes3D
import math

fig = pl.figure()
ax = Axes3D(fig)

n = 2**16-2
m = 0.25*n
v = int(.1*m)
threshold = math.ceil(0.25*v) 
x_val = []
y_val = []
z_val = []


for h in np.r_[1:25:2]:
    for k in np.r_[threshold:40000:50]: # threshold=410, v= 1639
        min_k_v = min(k,v)
        x_val += [k]
        y_val += [h]
        z_val += [sum(stats.hypergeom.pmf(np.r_[threshold:min_k_v:1],n,v,k)*stats.hypergeom.pmf(0,n,h,k))]


ax.scatter(x_val, y_val ,z_val)
pl.xlabel("the number of attacker scans k")
pl.ylabel("the number of honeypots h")
pl.zlabel("attacker success \\beta for finding v\\gamma vulberale computers")


ax.show()

