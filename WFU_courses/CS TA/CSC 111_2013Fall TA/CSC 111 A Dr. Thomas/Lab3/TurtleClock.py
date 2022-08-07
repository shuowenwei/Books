#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:     Turtle Clock
#
# Author:      weis11
#
# Created:     11/09/2013
# Copyright:   (c) weis11 2013
# Licence:     <your licence>
#-------------------------------------------------------------------------------
import turtle

hours = eval(input("what is the current hour? "))

minutes = eval(input("how many minutes past the hour? "))

hour_angle = (hours % 12) * 30 + (minutes / 60 ) *30;

minutes_angle = minutes * 6 ;

turtle


turtle.setup(300,300)

abwn = turtle.Screen()

tess = turtle.Turtle

tess.speed(0)

tess.shape("turtle")

tess.color("darkegreen")

for h in rang(12):
    turtle.setup(h%6,h%6)






