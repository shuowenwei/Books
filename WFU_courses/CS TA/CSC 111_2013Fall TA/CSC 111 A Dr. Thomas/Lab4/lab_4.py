#-------------------------------------------------------------------------------
# Name:        RPS (Rock, Paper, Scissors)
# Purpose:     Computer plays rock, paper, scissors against human.
#
# Author:      sjt
#
# Created:     16/09/2013
# Copyright:   (c) sjt 2013
#
#-------------------------------------------------------------------------------

import random

def number2string( number ):
    """Converts a number (0,1,2) to its associated value."""
    if( number == 0 ):
        result = "rock"
    if( number == 1 ):
        result = "paper"
    if( number == 2 ):
        result = "scissors"
    return result

def string2number( string ):
    """Converts a string to its associated number value."""
    if( string == "rock" ):
        result = 0
    if( string == "paper" ):
        result = 1
    if( string == "scissors" ):
        result = 2
    return result

# Get the human's play
human_string = input("Choose:  rock, paper, or scissors")
human_number = string2number( human_string )

# Have the computer play
computer_number = random.randint(0,2)      # random integer 0/1/2
computer_string = number2string( computer_number )

# Report the results
print("Human chooses", human_string )
print("Computer chooses", computer_string )

if human_number == computer_number:
    print("It's a tie.  Try again.")

elif (human_number - computer_number) % 3 == 1:
    print("Congratulations human.  You got lucky that time!")

elif (computer_number - human_number) % 3 == 1:
    print("Computers rule!")




