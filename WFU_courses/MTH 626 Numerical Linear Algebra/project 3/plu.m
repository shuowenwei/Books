function [P,L,U]=plu(A)

% LU factorization with pivoting for a square matrix 

[m,n]=size(A);
if m ~= n
   error('Input matrix must be square!')
end

flag=[];
U=A;
L=eye(m);
P=eye(m);
for k=1:m-1
    x=maxposition(U(k:m,k));
    [U(k,k:m),U(k+x-1,k:m)]=interchange(U(k+x-1,k:m),U(k,k:m));
    [L(k,1:k-1),L(k+x-1,1:k-1)]=interchange(L(k+x-1,1:k-1),L(k,1:k-1));
    [P(k,:),P(k+x-1,:)]=interchange(P(k+x-1,:),P(k,:));
   for i=k+1:m
      L(i,k)=U(i,k)/U(k,k);
      U(i,k:m)=U(i,k:m)-L(i,k).*U(k,k:m);
   end
end

