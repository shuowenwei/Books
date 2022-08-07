function [Q,R] = mgs_orginal(A);
% MGS computes QR factors

twoeps = 2*eps;
[m n] = size(A);
R = zeros(n,n);
scal = max(max(abs(A)));
if scal == 0
    Q = eye(m,n);
    return, 
end
Q = A;
for i = 1:n
    r = norm(Q(:,i),2);
    R(i,i) = r;
    if abs(r)/scal < twoeps
        'error:nearly zero col'; 
    end
    w = Q(:,i)/r;
    Q(:,i) = w;
    for j = i+1:n
        r = w'*Q(:,j);
        R(i,j) = r;
        Q(:,j) = Q(:,j)-r*w;
    end
end



