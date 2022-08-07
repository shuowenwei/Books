function [W,R] = house_orginal(A)
% FUNCTION [W,R] = house(A)
% Computes implicit representation of a full
% QR factorization A = QR of an m x n matrix  
% (m >= n) using householder reflections
%  
% INPUT:  A   -- m x n matrix (m >= n)
% OUTPUT  W   -- m x n with columns specifying
%                vectors v_k of successive 
%                Householder reflections
%                (lower Triangular) 
%         R   -- upper triangular matrix

  [m,n] = size(A);
  W = zeros(m,n);
  if (m < n)
    error('matrix A has more columns than rows');
  end
      
  for k = 1:n
    v = A(k:m,k);
    v(1) = v(1) + sign(v(1))*norm(v);
    v = v/norm(v);
    A(k:m,k:n) = A(k:m,k:n) - 2*v*(v'*A(k:m,k:n));
    W(k:m,k) = v;
  end
  
  R = A;
