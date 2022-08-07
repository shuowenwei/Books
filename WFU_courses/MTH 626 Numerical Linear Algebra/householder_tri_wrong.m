function R  = householder_tri_wrong(A)

[m,n]= size(A);

for k =1:n
    x = A(k:m,k);
    e1= zeros(m-k+1,1);
    e1(1) = 1;
    vk = sign(x(1))*norm(x)* e1+x;%here should plus x
    vk = vk/norm(vk);
    A(k:m,k:n) =  A(k:m,k:n)-2*vk*(vk'*A(k:m,k:n));
    
end

R = A;
