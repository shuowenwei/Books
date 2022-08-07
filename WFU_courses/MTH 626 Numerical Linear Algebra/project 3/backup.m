clc;clear;
A=[2 1 1 0; 4 3 3 1; 8 7 9 5; 6 7 9 8];
U=A;
[m m]=size(A);
L=eye(m);
P=eye(m);
e=0;
for k=1:m-1
   [h,e]=max(abs(U(k:m,k)));
   %U(k:m,k)=v;
    U([k k+e-1], k:m) = U([k+e-1 k], k:m);
    L([k k+e-1], 1:k-1) = L([k+e-1 k], 1:k-1);
    P([k k+e-1], :) = P([k+e-1 k], :);     
          for j=k+1:m
        L(j,k)=U(j,k)/U(k,k);
        U(j,k:m)=U(j,k:m)-L(j,k).*U(k,k:m);
          end
end
U
L
P
