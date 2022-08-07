function [W R] = house(A)
[m n]=size(A);
v=[];
e=[];
W=zeros(m,n);

for k=1:n
    X=A(k:m,k);
    e=eye(m-k+1,1);    
    v=sign(X(1))*norm(X)*e+X;
    v=v/norm(v);
    W(k:m,k)=W(k:m,k)+v;
    A(k:m,k:n)=A(k:m,k:n)-2*v*(v'*A(k:m,k:n));
end
W;
R=A;
