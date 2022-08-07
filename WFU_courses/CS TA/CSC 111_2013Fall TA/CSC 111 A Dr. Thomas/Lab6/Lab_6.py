#-------------------------------------------------------------------------------
# Name:        Lab_6
# Purpose:     Provides a framework for experimenting with image
#              processing algorithms.
#
# Author:      sjt
#
# Created:     27/09/2013
# Copyright:   (c) sjt 2013
#
#-------------------------------------------------------------------------------

import cImage as image
import os

def negative(oldimage):
    """Make a negative copy of oldimage."""
    width = oldimage.getWidth()
    height = oldimage.getHeight()

    # create a new image the same size as oldimage
    newimage = image.EmptyImage(width,height)

    # loop through every row and column
    for row in range(height):
        for col in range(width):
            pixel = oldimage.getPixel(col,row)  # grab a pixel
            (R, G, B) = pixel.getColorTuple()   # extract RGB values
            pixel.setRed(   255 - R )           # subtract R from 255
            pixel.setGreen( 255 - G )
            pixel.setBlue(  255 - B )
            newimage.setPixel(col,row,pixel)    # store the new pixel in the new image
    # return the newly modified image
    return newimage

def sepia(oldimage):
    """Make a sepia tinted copy of an image."""
    width = oldimage.getWidth()
    height = oldimage.getHeight()

    # create a new image the same size as oldimage
    newimage = image.EmptyImage(width,height)

    # loop through every row and column
    for row in range(height):
        for col in range(width):
            pixel = oldimage.getPixel(col,row)  # grab a pixel
            (R, G, B) = pixel.getColorTuple()   # extract RGB values
            # the modified pixel values have to be less than 256
            pixel.setRed(   min(255, round(R * 0.393 + G * 0.769 + B * 0.189)) )
            pixel.setGreen( min(255, round(R * 0.349 + G * 0.686 + B * 0.168)) )
            pixel.setBlue(  min(255, round(R * 0.272 + G * 0.534 + B * 0.131)))
            newimage.setPixel(col, row, pixel)  # store the new pixel in the new image
    # return the newly modified image
    return newimage

# STUDENTS - Do not make changes below this line.
def main():
    while True:             # Show a menu and read user's choice
        print("Options:")
        print("1 - Negative")
        print("2 - Sepia")
        print("3 - Grayscale")
        print("4 - Mirror")
        print("5 - Flip")
        print("6 - Enlarge")
        print("7 - Red filter")
        print("8 - Green filter")
        print("9 - Blue filter")
        print("10 - Black and White")
        print("q - quit\n")
        choice = input("What image processing algorithm would you like to try? ")

        # if user types 'q' then stop looping
        if choice == 'q':
            break

        # ask the user for the file name; make sure the file exists
        filename = input("Enter the name of a .gif file in the current folder: ")
        if not os.path.exists(filename):
            print("\n>>>File does not exist.  Try again.<<<\n")
            continue      # jump back to the beginning of the loop

        # load the original image under the name "before"
        before = image.FileImage(filename)

        # process the user's choice by calling the correct function and saving result
        if choice == '1':
            after = negative(before)
        elif choice == '2':
            after = sepia(before)
        elif choice == '3':
            after = grayscale(before)
        elif choice == '4':
            after = mirror(before)
        elif choice == '5':
            after = flip(before)
        elif choice == '6':
            after = enlarge(before)
        elif choice == '7':
            after = redfilter(before)
        elif choice == '8':
            after = greenfilter(before)
        elif choice == '9':
            after = bluefilter(before)
        elif choice == '10':
            after = blackwhite(before)
        else:
            print("Unrecognized choice.  Try again.")
            continue

        # Create two graphics windows and display the before and after images
        window1 = image.ImageWin("Before", before.getWidth(), before.getHeight())
        before.draw(window1)
        window2 = image.ImageWin("After",  after.getWidth(),  after.getHeight())
        after.draw(window2)

        print("Click on graphics windows to continue.")
        window1.exitOnClick()
        window2.exitOnClick()

# Now this is a short program!!!
main()
