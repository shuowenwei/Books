#1.2

# choose(65536,2)

n=65534
v=4097
nMv = n-v
scans = 150
b <- rep(0, scans) 
for (k in 1:scans){
	m<-choose(65536,k)
	for (x in 1:k) {
		b[k] = b[k] + choose(4097,x) * choose(61437,k-x) / m
		}
}

postscript("1.2.eps", horizontal = FALSE, height = 5, width = 5);
dev.off()


png(filename="1.2.png", width = 480, height = 480)
plot(b, xlab="k scans", ylab="attacker success")
dev.off()


jpeg(filename="1.2.jpeg", width = 480, height = 480)
plot(b, xlab="k scans", ylab="attacker success")
dev.off()
