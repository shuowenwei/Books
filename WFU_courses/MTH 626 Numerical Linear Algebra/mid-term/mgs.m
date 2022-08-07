function [Q,R]=mgs(A)
% modified Gram-Schmidt
m=0;
n=0;
[m n]=size(A);
R=zeros(n,n);
Q=A;

for i=1:n
    % v(j)=a(j)=A(:,j), where v(j) can be also omitted in the coding
    R(i,i)=norm(Q(:,i),2);
    Q(:,i)=Q(:,i)/R(i,i);
    for j=i+1:n
        R(i,j)=Q(:,i)'*Q(:,j);
        Q(:,j)=Q(:,j)-R(i,j)*Q(:,i);
    end
end

