# -*- coding: utf-8 -*-
"""
Spyder Editor

This temporary script file is located here:
C:\Users\weis11\.spyder2\.temp.py
"""


import pylab as pl
import numpy as np
from mpl_toolkits.mplot3d.axes3d import Axes3D

filehandle = open("infect_1.2.dat","rt")
MaxStation = 254
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
        #print int(fields[0])//254 + 1,int(fields[0])%254 + 1,fields[1]


print "time average:",np.mean(initialInfectTime)
print "time standard deviation:",np.std(initialInfectTime)


fig = pl.figure()
ax = Axes3D(fig)
ax.scatter(x, y ,initialInfectTime)
pl.title("initially infected time")
pl.xlabel("subnet x")
pl.ylabel("host y")
pl.zlabel("initially infected time")
ax.show()
