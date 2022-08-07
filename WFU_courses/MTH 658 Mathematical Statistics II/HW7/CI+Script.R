####################################
## Show confidence intervals have correct coverage probability

## Simulate n=10 draws from a Normal(mu=10, sigma=2)
X=rnorm(10,10,2)

## This is the quantile of a T-dist with df=9
t.val = qt(0.99,9)

## Make C.I. for mu
lower=mean(X) - t.val*sqrt(var(X))/sqrt(10)
upper=mean(X) + t.val*sqrt(var(X))/sqrt(10)

## Make 20 of them
lower=array()
upper=array()
for (i in 1:1000) {
  X=rnorm(10,10,2)
  lower[i]=mean(X) - t.val*sqrt(var(X))/sqrt(10)
  upper[i]=mean(X) + t.val*sqrt(var(X))/sqrt(10)
}

## How many missed?  Here's one way to check.  First, count the number of lower
## bounds greater than 10 (they missed):
1*(lower>10)

## Then the number of upper bounds less than 10 (they also missed):
1*(upper<10)

## Then, add then both up.
miss=sum(1*(lower>10) + 1*(upper<10))
miss



