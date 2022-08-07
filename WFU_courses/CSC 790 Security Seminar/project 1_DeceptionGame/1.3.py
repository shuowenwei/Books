# -*- coding: utf-8 -*-
"""
Spyder Editor

This temporary script file is located here:
C:\Users\weis11\.spyder2\.temp.py
"""

from scipy import stats
import numpy as np
import pylab as pl
import math
from mpl_toolkits.mplot3d.axes3d import Axes3D


fig = pl.figure()
pl.title("static addressing")
ax = Axes3D(fig)

n = 2**16-2
m = 2**14
v = int(0.1*m) # 4097

alpha = 1/float(v)

x_val = []
y_val = []
z_val = []

for alpha in np.r_[1/float(v):0.6:0.03]:
    #threadhold = int(alpha*v)+1
    threshold = math.ceil(alpha*v)
    for k in np.r_[threshold:35000:25]:
        min_k_v = min(k,v)
        x_val += [k]
        y_val += [alpha]        
        z_val += [sum(stats.hypergeom.pmf(np.r_[threshold:min_k_v:1], n, v, k))]


ax.scatter(x_val, y_val ,z_val)
pl.xlabel("the number of attacker scans k")
pl.ylabel("attack target \\gramma")
pl.zlabel("attacker success \\beta for finding v\\gamma vulberale computers")

ax.show()


