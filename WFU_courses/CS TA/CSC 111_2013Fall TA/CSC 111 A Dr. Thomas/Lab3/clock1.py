#-------------------------------------------------------------------------------
# Name:        clock1
# Purpose:     Display the current time on a turtle clock.
#
# Author:      sjt
#
# Created:     10/09/2013
# Copyright:   (c) sjt 2013
#
#-------------------------------------------------------------------------------

import turtle

# Input
hours = eval(input("What is the current hour? "))
minutes = eval(input("How many minutes past the hour? "))

# Compute the rotation angle of the hour and minute hand
# This assumes that both hands point to 90 degrees at midnight
hour_angle = (hours % 12) * 30 + (minutes / 60) * 30
minute_angle = minutes * 6

# Construct a graphics window and a turtle
turtle.setup(300,300)      # control the window size
wn = turtle.Screen()       # create a window

tess = turtle.Turtle()     # create a turtle named tess
tess.speed(0)
tess.shape("turtle")
tess.color("darkgreen")

# Create a clock face
for h in range(12):
    tess.up()
    tess.fd(80)
    tess.down()
    tess.fd(10)
    tess.up()
    tess.fd(15)
    tess.stamp()
    tess.up()
    tess.goto(0,0)
    tess.left(30)

# Move the turtle to the origin.
# Turn the turtle to 90 degrees and rotate it right by hour_angle
# Then draw the hour hand
tess.down()
tess.setheading(90)
tess.right(hour_angle)
tess.pensize(4)
tess.fd(55)

# Move the turtle to the origin.
# Turn the turtle to 90 degrees and rotate it right by minute_angle
# Then draw the minute hand
tess.goto(0,0)
tess.setheading(90)
tess.right(minute_angle)
tess.pensize(3)
tess.fd(70)

# How about a black point at the origin?
tess.home()
tess.color("black")
tess.shape("circle")
tess.stamp()

# wait for the user to click on the graphics window
wn.exitonclick()
