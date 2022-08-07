#1.3
# choose(65536,2)

n=65534
v=4097
nMv = n-v
scans = 3700
y<-1:scans

alfa <- seq(0.01, 0.1, 0.02)

b <- matrix(0, length(alfa ),scans )

for (i in 1:length(alfa)){
	for (k in round(alfa[i]*v):scans)
			{
			m <- choose(65536,k)
			for (x in round(alfa[i]*v):k) {
			b[i,k] = b[i,k] + choose(4097,x) * choose(61437,k-x) / m
			}
			if(is.nan(b[i,k])) 
			{ b[i,k] = 0}
	}
}

persp(alfa,y, b,col="red")


postscript("1.2.eps", horizontal = FALSE, height = 5, width = 5);

png(filename="1.2.png")
plot(b, xlab="k scans", ylab="attacker success")
dev.off()