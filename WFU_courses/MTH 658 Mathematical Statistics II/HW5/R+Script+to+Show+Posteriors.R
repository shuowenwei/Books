## Example 1
## Gamma prior, Poisson model.

theta=seq(0,0.0004, by=0.000001)
y=dgamma(theta, shape=0.04, rate=0.2)
plot(theta,y, type="l", lwd=2, col="red", ylim=c(0,25000))

## Prior says most likely value is around theta=0.002, which would mean 
## laptops live around 500 days.

## Sample of 100 laptops live an average of only 200 days, much less than
## our prior would have predicted.

n=20
sum=76

## So, the posterior shifts towards larger values of theta
## (which give shorter lifetimes)


theta=seq(0,0.4, by=.000001)
posty=dgamma(theta, shape=20.04, rate=76.2)
plot(theta,posty, type="l", lwd=2, col="blue", ylim=c(0,10))


lines(theta, posty, lwd=2, col="blue")

legend("topright", legend=c("Prior","Posterior"), lwd=c(2,2), col=c("red","blue"))


## Example 2
## Let theta be the proportion of non-defective items that come off an assemby line.
## Prior knowledge is limited: theta is between 0 and 1, no paticular value
## any more or less likely.

theta=seq(0,1,by=0.000001)
y=dbeta(theta,1,1)
plot(theta,y, type="l", lwd=2, col="red", ylim=c(0,10))

## Randomly sample 10 items, 7 are OK.
n=200
sum=3

## Posterior shifts away from unlikely values (near 0) and adds probability in the
## neighborhood of 3/200.
posty=dbeta(theta, 1+sum,1+n-sum)
lines(theta, posty, lwd=2, col="blue")
legend("topright", legend=c("Prior","Posterior"), lwd=c(2,2), col=c("red","blue"))



