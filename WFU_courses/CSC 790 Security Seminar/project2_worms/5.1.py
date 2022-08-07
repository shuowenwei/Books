# -*- coding: utf-8 -*-
"""
Spyder Editor

This temporary script file is located here:
C:\Users\weis11\.spyder2\.temp.py
"""

import pylab as pl

filehandle = open("data_1.1.dat","rt")
time1 = []
num1 = []
for aline in filehandle:
    fields = aline.split()
    time1 += [fields[0]]
    num1 += [fields[1]]
filehandle.close()


filehandle = open("data_2.1_36.dat","rt")
time2 = []
num2 = []
for aline in filehandle:
    fields = aline.split()
    time2 += [fields[0]]
    num2 += [fields[1]]
filehandle.close()


filehandle = open("data_3.1.dat","rt")
time3 = []
num3 = []
for aline in filehandle:
    fields = aline.split()
    time3 += [fields[0]]
    num3 += [fields[1]]
filehandle.close()

filehandle = open("data_4.1.dat","rt")
time4 = []
num4 = []
for aline in filehandle:
    fields = aline.split()
    time4 += [fields[0]]
    num4 += [fields[1]]
filehandle.close()   


pl.plot(time1,num1,'b',time2,num2,'y',time3,num3,'r',time4,num4,'g')
pl.title("Worm Comparison")
pl.legend(("Random Selection","Limited Effort","Topological Station","Hit List"),loc=4)
pl.ylabel("number of stations infected")
pl.xlabel("time")
pl.show()
