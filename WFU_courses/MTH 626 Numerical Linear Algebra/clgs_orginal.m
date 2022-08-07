function [Q,R] = clgs_orginal(A)
% CLGS classical Gram-Schmidt orthogonalization
[m,n] = size(A); R = zeros(n);
Q=A;
for k = 1:n,
    for i = 1:k-1,
        R(i,k) = Q(:,i)'*Q(:,k);
    end
    % remove for
    for i = 1:k-1,
        % modified-Gram-Schmidt
        Q(:,k) = Q(:,k)-R(i,k)*Q(:,i);
    end
    R(k,k) = norm(Q(:,k)); Q(:,k) = Q(:,k)/R(k,k);
end