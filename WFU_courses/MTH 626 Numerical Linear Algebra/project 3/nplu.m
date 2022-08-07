function [L,U] = nplu(A)

% LU factorization without pivoting for a square matrix 

[m,n]=size(A);
if m ~= n
   error('Input matrix must be square!')
end

U=A;
L=eye(m);
for k=1:m-1
   for i=k+1:m
      L(i,k)=U(i,k)/U(k,k);
      U(i,k:m)=U(i,k:m)-L(i,k).*U(k,k:m);
   end
end


