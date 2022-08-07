####################################
## Show confidence intervals have correct coverage probability

## Simulate n=20 draws from a Normal(mu=10, sigma=1)
X=rnorm(20,10,1)

## This is the quantile of a T-dist with df=19
t.val = qt(0.975,19)

## Make C.I. for mu
lower=mean(X) - t.val*sqrt(var(X))/sqrt(20)
upper=mean(X) + t.val*sqrt(var(X))/sqrt(20)

## Make 1000 of them
lower=array()
upper=array()
for (i in 1:1000) {
  X=rnorm(20,10,1)
  lower[i]=mean(X) - t.val*sqrt(var(X))/sqrt(20)
  upper[i]=mean(X) + t.val*sqrt(var(X))/sqrt(20)
}

## How many missed?  Here's one way to check.  First, count the number of lower
## bounds greater than 10 (they missed):
# 1*(lower>10)

## Then the number of upper bounds less than 10 (they also missed):
# 1*(upper<10)

## Then, add then both up.
miss=sum(1*(lower>10) + 1*(upper<10))
miss



