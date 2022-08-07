## 1. First, simulate a random draw from an Exp(theta = 0.001) density
x=rexp(1,0.001)

## Now, let's repeat this 10,000 times and make a histogram:
x=array()
for (i in 1:10000) {
  x[i]=rexp(1,0.001)
}
hist(x, xlim=c(0,6000))

## Things look pretty skewed.  Not at all normal.
## We can draw 2 at a time as follows
x=rexp(2,0.001)
x
mean(x)

## Let's repeat this process 10,000 times, and make a histogram:

## attach(mtcars)
## par(mfrow=c(3,2))
 
x=array()
for (i in 1:10000) {
  x[i]=mean(rexp(500,0.001))
}
hist(x, xlim=c(0,6000), main ="n=500")

