clear;clc
format long eng

m=100;
n=15;
t=(0:m-1)'/(m-1);
A=[];
for i=1:n
    A=[A t.^(i-1)];
end
b=exp(sin(4*t));
b=b/2006.787453080206;
%The idea behind above is about least square fitting 
%of the function exp(sin(4*t)) on the interval [0,1] 
%by the polynomial of degree 14.


x=A\b;
y=A*x;
kappa=cond(A)
theta=asin(norm(b-y)/norm(b))
eta=norm(A)*norm(x)/norm(y)
%below is the table
b_y=1/cos(theta)
A_y=kappa/cos(theta)
b_x=kappa/cos(theta)/eta
A_x=kappa+kappa^2*tan(theta)/eta


%Householder Triangul
[Q,R]=qr(A,0);
x=R\(Q'*b);
x_15_1=x(15)
%The x_15 has a relative error which is mainly caused by epsilon(machine) and the order
%of condition number of x with respect to perturbations in A. Thus the
%inaccuracy of x_15 can be entirely explained by ill-conditioning, no
%instability. The algorithm is backward stable. 

[Q,R]=qr([A,b],0);
Qb=R(1:n,n+1);
R=R(1:n,1:n);
x=R\Qb;
x_15_2=x(15)
%The result is the same with the last one, i.e. we have x_15_1=x_15_2

x=A\b;
x_15_3=x(15)
%because of the Matlab's operator \ makes use of QR factorization with column pivoting.
%Thus result x_15_3 is better.

%below is Gram-Schimidt Orthogonalization
[Q,R]=mgs(A);
x=R\(Q'*b);
x_15_4=x(15)
%This result x_15_4 sult is very bad, the relative error is very big, so this algorithm 
%is not stable since it produces matrices Q whose columns are nor accurately orthonormal 
%Since the algorithm above depends on that orthonormality, it suffers accordingly

[Q,R]=mgs([A b]);
Qb=R(1:n,n+1);
R=R(1:n,1:n);
x=R\Qb;
x_15_5=x(15)
%This algorithm is stable because it only needs Q to be well-conditioned


%below if the normal equation
x=(A'*A)\(A'*b);
x_15_6=x(15)
%the x_15_6 is very bad, and this algorithm is not stable for 


% below is the SVD
[U,S,V]=svd(A,0);
x=V*(S\(U'*b));
x_15_7=x(15)
%The solution of the full rank least squares problem by the SVD is backward stable.


