## This is how you sample n=4 values from a Bernoulli with p=0.25

draw = rbinom(n=10, size=1, p=0.25)
draw
mean(draw)

## This is how you repeat the process 100 times, and save each sample average
## into a vector

output=array()
for (i in 1:1000) {
  draw = rbinom(n=4, size=1, p=0.25)
  output[i]=mean(draw)
}
output

hist(output, xlab="Sample Mean", main="1000 sample averages, each from a sample of size 4", xlim=c(0,1))
abline(v=0.25, lwd=3)



