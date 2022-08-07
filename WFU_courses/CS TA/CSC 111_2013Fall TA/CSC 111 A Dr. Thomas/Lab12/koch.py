import turtle

def koch(level, length):
    if level == 0:
        t.forward(length)
    else:
        koch( level-1, length/3 )
        t.left(60)
        koch( level-1, length/3 )
        t.right(120)
        koch( level-1, length/3 )
        t.left(60)
        koch( level-1, length/3 )

def full_flake( levels, length ):
    for i in range(3):
        koch( levels, length )
        t.right(120)

t = turtle.Turtle()
wn = turtle.Screen()
t.speed(0)
t.color("red")

t.up()
t.goto(-200,100)
t.down()

# Draw the full Koch curve
#koch(3, 300)
full_flake( 3, 300 )

wn.exitonclick()

