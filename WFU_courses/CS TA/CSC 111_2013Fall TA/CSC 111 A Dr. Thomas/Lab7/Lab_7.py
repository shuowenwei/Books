#-------------------------------------------------------------------------------
# Name:        Lab_6
# Purpose:     Provides a framework for experimenting with image
#              processing algorithms.
#
# Author:      XXX
#
# Created:     27/09/2013
# Copyright:   XXXX
#
#-------------------------------------------------------------------------------

import cImage as image
import os

def grayscale(oldimage):
    """make a copy of oldimage in grayscale"""
    width  = oldimage.getWidth()
    height = oldimage.getHeight()

    newimage = image.EmptyImage(width, height)

    for row in range(height):
        for col in range(width):
            pixel = oldimage.getPixel(col, row)
            (r, g, b) = pixel.getColorTuple()
            gray = (r + g + b) // 3
            pixel.setRed(gray)
            pixel.setGreen(gray)
            pixel.setBlue(gray)
            newimage.setPixel(col, row, pixel)

    return newimage

def puzzle(oldimage):
    """make a copy of oldimage in grayscale"""
    width  = oldimage.getWidth()
    height = oldimage.getHeight()

    newimage = image.EmptyImage(width, height)

    for row in range(height):
        for col in range(width):
            pixel = oldimage.getPixel(col, row)
            pixel.setRed( pixel.getRed() * 10 )
            pixel.setGreen(0)
            pixel.setBlue(0)
            newimage.setPixel(col, row, pixel)

    return newimage

def bluescreen(oldimage):
    """make a copy of oldimage in grayscale"""
    width  = oldimage.getWidth()
    height = oldimage.getHeight()

    newimage = oldimage.copy()
    sourceimg = image.FileImage("leaves.gif")

    for row in range(height):
        for col in range(width):
            pixel = oldimage.getPixel(col, row)
            (r,g,b) = pixel.getColorTuple()
            avg = ( r + g + b )/3
            if r > 1.6 * avg :
                pixel = sourceimg.getPixel(col,row)
                newimage.setPixel(col, row, pixel)

    return newimage

def blackwhite(oldimage):
    """make a copy of oldimage in black and white pixels"""
    width  = oldimage.getWidth()
    height = oldimage.getHeight()

    newimage = image.EmptyImage(width, height)

    for row in range(height):
        for col in range(width):
            pixel = oldimage.getPixel(col, row)
            (r, g, b) = pixel.getColorTuple()
            total = r + g + b
            if total < 384:
                newvalue = 0
            else:
                newvalue = 255
            pixel.setRed(newvalue)
            pixel.setGreen(newvalue)
            pixel.setBlue(newvalue)
            newimage.setPixel(col, row, pixel)

    return newimage

def redFilter(oldimage):
    """set Green and Blue pixels to 0 and leave Red alone"""
    width = oldimage.getWidth()
    height = oldimage.getHeight()

    newimage = image.EmptyImage(width, height)

    for row in range(height):
        for col in range(width):
            pixel = oldimage.getPixel(col, row)
            pixel.setGreen(0)
            pixel.setBlue(0)
            newimage.setPixel(col, row, pixel)

    return newimage

def greenFilter(oldimage):
    """set Red and Blue pixels to 0 and leave Green alone"""
    width = oldimage.getWidth()
    height = oldimage.getHeight()

    newimage = image.EmptyImage(width, height)

    for row in range(height):
        for col in range(width):
            pixel = oldimage.getPixel(col, row)
            pixel.setRed(0)
            pixel.setBlue(0)
            newimage.setPixel(col, row, pixel)

    return newimage

def blueFilter(oldimage):
    """set Green and Red pixels to 0 and leave Blue alone"""
    width = oldimage.getWidth()
    height = oldimage.getHeight()

    newimage = image.EmptyImage(width, height)

    for row in range(height):
        for col in range(width):
            pixel = oldimage.getPixel(col, row)
            pixel.setRed(0)
            pixel.setGreen(0)
            newimage.setPixel(col, row, pixel)

    return newimage

def mirror(oldimage):
    """Make a mirror image copy of oldimage"""
    width = oldimage.getWidth()
    height = oldimage.getHeight()

    newimage = image.EmptyImage(width, height)
    maxCol = width-1

    for row in range(height):
        for col in range(width):
            oldpixel = oldimage.getPixel(maxCol-col, row)
            newimage.setPixel(col, row, oldpixel)

    return newimage

def flip(oldimage):
    """Make an upside down copy of oldimage"""
    width = oldimage.getWidth()
    height = oldimage.getHeight()

    newimage = image.EmptyImage(width, height)
    maxRow = height-1

    for row in range(height):
        for col in range(width):
            oldpixel = oldimage.getPixel(col, maxRow-row)
            newimage.setPixel(col, row, oldpixel)

    return newimage

def enlarge(oldimage):
    """make a copy of oldimage that is twice as large"""
    width = oldimage.getWidth()
    height = oldimage.getHeight()

    newimage = image.EmptyImage(width*2, height*2)

    for row in range(height):
        for col in range(width):
            oldpixel = oldimage.getPixel(col,row)

            newimage.setPixel(2*col, 2*row, oldpixel)
            newimage.setPixel(2*col+1, 2*row, oldpixel)
            newimage.setPixel(2*col, 2*row+1, oldpixel)
            newimage.setPixel(2*col+1, 2*row+1, oldpixel)

    return newimage

def negative(oldimage):
    """Make a negative copy of oldimage."""
    width = oldimage.getWidth()
    height = oldimage.getHeight()

    newimage = image.EmptyImage(width,height)

    for row in range(height):
        for col in range(width):
            pixel = oldimage.getPixel(col,row)
            newred   = 255 - pixel.getRed()
            newgreen = 255 - pixel.getGreen()
            newblue  = 255 - pixel.getBlue()
            newPixel = image.Pixel( newred, newgreen, newblue )
            newimage.setPixel(col,row,newPixel)

    return newimage

def sharpen(oldimage):
    """Sharpen an image by increasing pixel values relative to neighbors.
       See http://docs.gimp.org/en/plug-in-convmatrix.html for explanation."""
    width = oldimage.getWidth()
    height = oldimage.getHeight()

    # Start with a copy of the old image.  This gets first and final rows and cols
    newimage = oldimage.copy()

    # work through image, skipping first and final rows and columns
    for row in range(1, height-1):
        for col in range(1, width-1):

            # Start with the center pixel at (col, row)
            pixel = oldimage.getPixel(col, row)
            redtotal = 5 * pixel.getRed()
            greentotal = 5 * pixel.getGreen()
            bluetotal = 5 * pixel.getBlue()
     
            # Then the pixel about the center
            pixel = oldimage.getPixel(col, row-1)
            redtotal = redtotal - pixel.getRed()
            greentotal = greentotal - pixel.getGreen()
            bluetotal = bluetotal - pixel.getBlue()

            # Then same row, column to the left
            pixel = oldimage.getPixel(col-1, row)
            redtotal = redtotal - pixel.getRed()
            greentotal = greentotal - pixel.getGreen()
            bluetotal = bluetotal - pixel.getBlue()

            # Now to same row, next column
            pixel = oldimage.getPixel(col+1, row)
            redtotal = redtotal - pixel.getRed()
            greentotal = greentotal - pixel.getGreen()
            bluetotal = bluetotal - pixel.getBlue()

            # Next row, same column
            pixel = oldimage.getPixel(col, row+1)
            redtotal = redtotal - pixel.getRed()
            greentotal = greentotal - pixel.getGreen()
            bluetotal = bluetotal - pixel.getBlue()

            # Constrain values to (0..255)
            newred = min( max(0, redtotal), 255 )
            newgreen = min( max(0, greentotal), 255 )
            newblue = min( max(0, bluetotal), 255 )

            # set new pixel value
            newPixel = image.Pixel( newred, newgreen, newblue )
            newimage.setPixel(col,row,newPixel)

    return newimage

def sepia(oldimage):
    """Make a sepia tinted copy of an image."""
    width = oldimage.getWidth()
    height = oldimage.getHeight()

    newimage = image.EmptyImage(width,height)

    for row in range(height):
        for col in range(width):
            pixel = oldimage.getPixel(col,row)
            R = pixel.getRed()
            G = pixel.getGreen()
            B = pixel.getBlue()
            newR = min(255, round(R * 0.393 + G * 0.769 + B * 0.189))
            newG = min(255, round(R * 0.349 + G * 0.686 + B * 0.168))
            newB = min(255, round(R * 0.272 + G * 0.534 + B * 0.131))
            newPixel = image.Pixel( newR, newG, newB )
            newimage.setPixel(col, row, newPixel)

    return newimage

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
        print("11 - Puzzle (must use puzzle.gif for this to make sense")
        print("12 - Bluescreen (must use stop.gif as the .gif file)")
        print("13 - Sharpen")
        print("s  - save the most recently processed image")
        print("q - quit\n")
        choice = input("What image processing algorithm would you like to try? ")

        # if user types 'q' then stop looping
        if choice == 'q':
            break
        elif choice == 's':
            filename = input("Filename for saving?  Must end in .gif  ")
            after.save( filename )
            continue
        else:
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
        elif choice == '11':
            after = puzzle(before)
        elif choice == '12':
            after = bluescreen(before)
        elif choice == '13':
            after = sharpen(before)
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
