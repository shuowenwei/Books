function [Q,R]=clgs(A)
% classical Gram-Schmidt
m=0;
n=0;
[m,n]=size(A); 
R=zeros(n,n);
Q=A;

for j=1:n
    % v(j)=a(j)=A(:,j), where v(j) can be omitted in the coding
    for i=1:j-1,
        R(i,j)=Q(:,i)'*A(:,j);  % A(:,j)=Q(:,j)
        Q(:,j)=Q(:,j)-R(i,j)*Q(:,i);
    end
    R(j,j)=norm(Q(:,j)); 
    Q(:,j)=Q(:,j)/R(j,j);
end
