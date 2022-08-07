function [R] = householder(A)
[m n]=size(A);
v1=[];
e=[];
q=[];

for k=1:n
    X=A(k:m,k);
    e=eye(m-k+1,1);    
    v=sign(X(1))*norm(X)*e+X;
    v=v/norm(v);
    %l=length(v);
    %F=eye(l)-2*v*v';
    %v1=[v1;v];
    %A=F*A;
    A(k:m,k:n)=A(k:m,k:n)-2*v*(v'*A(k:m,k:n));
end
R=A;
