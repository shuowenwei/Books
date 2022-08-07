# -*- coding: utf-8 -*-
"""
Spyder Editor

This temporary script file is located here:
C:\Users\weis11\.spyder2\.temp.py
"""

import pylab as pl

filehandle = open("data_2.1_36.dat","rt")
time = []
numInfected = []

for aline in filehandle:
    fields = aline.split()
    time += [fields[0]]
    numInfected += [fields[1]]

pl.plot(time, numInfected)
pl.title("Attempt times setting to 36")
pl.ylabel("number of stations infected")
pl.xlabel("time")
pl.show()
