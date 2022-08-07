clear;clc
format long eng

m=100;n=15;
t=(0:m-1)'/(m-1);
A=[];
for i=1:n
    A=[A t.^(i-1)];
end
b=exp(sin(4*t));
b=b/2006.787453080206;
%Above is about least square fitting of the function
%exp(sin(4*t)) on the interval [0,1] by the polynomial of degree 14.
x=A\b;
y=A*x;
kappa=cond(A);
theta=asin(norm(b-y)/norm(b));
eta=norm(A)*norm(x)/norm(y);
%The result shows that
%1. the condition number of A is about 10^10 which means the monomials form a highly ill-conditioned basis. 
%2. the angle between b and range A is small, so exp(sin(4*t)) can be fitted very closed by a polynomial of degree 14.
%3. eata is a measure of how much the norm of y falls short of its maximum possible value.
Yb=1/cos(theta);
YA=kappa/cos(theta);
Xb=kappa/eta*cos(theta);
XA=kappa+(kappa^2*tan(theta))/eta;
%it is about the sensitivities of y and x to pertubation in b and A. The
%resublt shows that  the sensitivities of y to pertubation in b is
%relatively small.

%% Householder Triangularization
[Q R]=qr(A,0);
x=R\(Q'*b);
x15a=x(15);
%The standard algorithm for solving least squares problem is QR factorizition by Householder Triangularization. Since the normalization,
%the correct answer would x15 = 1. The x15a which we get has a relative error. The relative error is contributed by epsilon machine and the order
%of condition number of x with respect to perturbations in A.
[Q R]=qr([A b], 0);
Qb=R(1:n,n+1);
R=R(1:n,1:n);
x=R\Qb;
x15b=x(15);
%Forming Q hat explicitly is not necessary, this is a cheaper way to do it.
%And comparing x15a and x15b, the result is same.
x=A\b;
x15c=x(15);
%This result is more accurate for the reason that \ operator makes use of QR factorization with column pivoting.
%%Gram-Schimidt Orthogonalization.
[Q R]=mgs(A);
x=R\(Q'*b);
x15d=x(15);
%This result (x15d=0.997300157013995) is poor, we have a relative error
%about 3*10^-3, so rounding error have been amplified by a factor on the order of 10^13.
%This algorithm is not stable since the columns of Q hat are not accurately orthonormal and this algorithm depends on the orthonormality.
[Q R]=mgs([A b]);
Qb=R(1:n,n+1);
R=R(1:n,1:n);
x=R\Qb;
x15e=x(15);
%The algorithm above which is a reformulation of Gram-Schimidt is stable since it only needs Q hat is well-conditioned,
%but it should not be used in practice for the unnecessary work for the extra necessary work.
%% Normal Equations
x=(A'*A)\(A'*b);
x15f=x(15);
%The result is unstable. But stablity can be achieved by restriction to a
%class of problems in which the condition number is uniformly bounded above
%or tan(theta)/eta is uniformly bounded below.
%% SVD
[U,S,V] = svd(A,0); 
x = V*(S\(U'*b)); 
x15g=x(15);
%This algorithm for the full rank least squares problem is backward stable.