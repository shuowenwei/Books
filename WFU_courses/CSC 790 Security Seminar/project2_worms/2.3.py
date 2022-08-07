# -*- coding: utf-8 -*-
"""
Spyder Editor

This temporary script file is located here:
C:\Users\weis11\.spyder2\.temp.py
"""


import pylab as pl
import numpy as np
from mpl_toolkits.mplot3d.axes3d import Axes3D

filehandle = open("infect_2.1_36.dat","rt")
x = []
y = []
initialInfectTime = []
otherAttempt = []

for aline in filehandle:
    fields = aline.split()
    if fields[1] != '0':
        x += [int(fields[0])//254 + 1]
        y += [int(fields[0])%254 + 1]
        initialInfectTime += [eval(fields[1])]
        
print "time average:",np.mean(initialInfectTime)
print "time standard deviation:",np.std(initialInfectTime)

fig = pl.figure()
pl.title("Setting attempts = 36, the initial infected time")
ax = Axes3D(fig)
ax.scatter(x, y ,initialInfectTime)
pl.xlabel("subnet x")
pl.ylabel("host y")
pl.zlabel("initially infected time")

ax.show()


