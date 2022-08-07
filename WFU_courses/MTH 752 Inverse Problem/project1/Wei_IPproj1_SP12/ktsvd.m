function xck = ktsvd(A,b,n,k)
xck=zeros(n,1);
[U,S,V] = svd(A);
for i=1:k
   xck=xck+(U(:,i)'*b/S(i,i))*V(:,i);
end