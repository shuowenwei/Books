# -*- coding: utf-8 -*-
"""
Spyder Editor

This temporary script file is located here:
C:\Users\weis11\.spyder2\.temp.py
"""

import pylab as pl


filehandle = open("data_4.1.dat","rt")
time = []
numInfected = []

for aline in filehandle:
    fields = aline.split()
    time += [fields[0]]
    numInfected += [fields[1]]

pl.plot(time, numInfected)
pl.title("Number of Stations Infected using His list")
pl.ylabel("number of stations infected")
pl.xlabel("time")
pl.show()
