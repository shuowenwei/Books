import turtle

# Change EDGELENGTH to make drawing larger or smaller
EDGELENGTH = 10

def hilbert(level, angle):
    """Use the global turtle t to draw a Hilbert curve;
       level represents the level of recursion;
       angle will always be +90 or -90"""
    if level == 0:
        return
    
    t.right(angle)
    hilbert(level-1, -angle)
    t.forward(EDGELENGTH)
    
    t.left(angle)
    hilbert(level-1, angle)
    t.forward(EDGELENGTH)
    
    hilbert(level-1, angle)
    t.left(angle)
    
    t.forward(EDGELENGTH)    
    hilbert(level-1, -angle)
    t.right(angle)
        
# Create a graphics window and turtle for drawing
t = turtle.Turtle()
wn = turtle.Screen()
t.color("blue")
t.speed(0)

# Move the turtle to a good starting position
t.up()
t.goto(-300,300)
t.down()

# Draw the curve
hilbert(5, 90)

wn.exitonclick()
