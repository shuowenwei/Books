[U,S,V]=svd(A);
S=diag(S);
tol=max(size(A))*S(1)*eps;
r=sum(S>tol);
S=diag(ones(r,1)./S(1:r));
X=V(:,1:r)*S*U(:,1:r)';

%the output matrix X is the Pseudoinverse of A with the dimensions of n-m
%when A's dimensions is m-n. 
%because some singular values of A (by the SVD of A) might be small, which 
%will make the computation unstableso, so all the singular values 
%less than tol are treated as zero

