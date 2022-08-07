%2
clc;clear
format compact
[A,b] = ursell(12);
[U,S,V]=svd(A);
s=diag(S);
eta = picard(U,s,b);

