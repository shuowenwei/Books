%5.4

A=[2 3;1 4]
A=[3 1;5 2]
I=zeros(2);
M=[I A';A I];
[a b]=eig(A)
[c dd]=eig(M)
[s v d]=svd(M)

aa=c(1:2,1:2);
bb=c(1:2,3:4);
cc=c(3:4,1:2);
dd=c(3:4,3:4);
aa,bb,cc,dd
