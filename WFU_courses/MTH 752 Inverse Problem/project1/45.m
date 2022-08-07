clc;clear
format compact
n=32;
d=0.5;
[A,b,x]=gravity(n,2,0,1,d);
% question 4
xc=A\b;
rlerrxc=norm(xc-x)/norm(x)

% question 5
[U,S,V]=svd(A);
subplot(1,2,1); semilogy(diag(S),'*')
title('singular values of A')
legend('n=32')
rlerrxck=[];
for k=1:n
    xck=ktsvd(A,b,n,k);
    new=norm(xck-x)/norm(x);
    rlerrxck=[rlerrxck,new];
end
subplot(1,2,2); semilogy(rlerrxck,'o')
title('relative error of xck')
legend('k=1:32')
minvalue=min(rlerrxck')
k=find(rlerrxck==minvalue)
rlerrxck(16)
