# -*- coding: utf-8 -*-
"""
Spyder Editor

This temporary script file is located here:
C:\Users\weis11\.spyder2\.temp.py
"""

import pylab as pl
filehandle = open("data_Norecordlist.dat","rt")
time1 = []
num1 = []
for aline in filehandle:
    fields = aline.split()
    time1 += [fields[0]]
    num1 += [fields[1]]

filehandle.close()


filehandle = open("data_recordlist.dat","rt")
time2 = []
num2 = []
for aline in filehandle:
    fields = aline.split()
    time2 += [fields[0]]
    num2 += [fields[1]]

filehandle.close()


()

pl.plot(time1,num1,'b',time2,num2,'r')
pl.title("Worm Fight Club")
pl.legend(("Without History Hit List","With History Hit List"),loc=4)
pl.ylabel("number of stations infected")
pl.xlabel("time")
pl.show()
