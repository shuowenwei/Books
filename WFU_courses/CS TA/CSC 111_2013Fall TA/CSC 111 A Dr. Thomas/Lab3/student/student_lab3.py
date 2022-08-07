#-------------------------------------------------------------------------------
# Name:        Lab 3 Problem 3
# Purpose:
#
# Author:      yingrc13
#
# Created:     11/09/2013
# Copyright:   (c) yingrc13 2013
# Class:       CSC 111
#-------------------------------------------------------------------------------

import turtle

# Input
hours = eval(input("What is the current hour? "))
minutes = eval(input("How many minutes past the hour? "))

# Compute the rotation angle of the hour and minute hand
# This assumes that both hands point to 90 degrees at midnight
hour_angle = (hours % 12) * 30 + (minutes / 60) * 30
minute_angle = minutes * 6

# Make a graphics window and a turtle
turtle.setup(300,300)      # control the window size
wn = turtle.Screen()       # create a window

tess = turtle.Turtle()     # create a turtle named tess
tess.speed(0)
tess.shape("turtle")
tess.color("darkgreen")

# CLOCK FACE
for h in range(12):
    tess.up()
    tess.home()
    tess.left(90)
    tess.right((h % 12) * 30 + (m / 60) * 30)
    tess.forward(100)
    tess.down()
    tess.forward(10)
    tess.up()
    tess.forward(10)
    tess.down()
    tess.stamp()

# HOUR
tess.pensize(5)
tess.pencolor("black")
tess.up()
tess.home()
tess.left(90)
tess.right(hour_angle)
tess.down()
tess.forward(65)

# MINUTES
tess.pensize(4)
tess.up()
tess.home()
tess.left(90)
tess.right(minute_angle)
tess.down()
tess.forward(95)

# CENTER
tess.home()
tess.color("black")
tess.shape("circle")
tess.stamp()

# EXIT
wn.exitonclick()