clear;clc
R=triu(randn(50));
[Q X]=qr(randn(50));
A=Q*R;
[Q2 R2]=qr(A);
norm(Q2-Q)
norm(R2-R)
norm(A-Q2*R2)/norm(A)

Q3=Q+10^4-4*randn(50);
R3=R+10^4-4*randn(50);
norm(A-Q3*R3)/norm(A)


