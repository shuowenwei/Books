clear;clc
%input
format longeng
m=50;
n=12;
t=linspace(0,1,m)';
A=fliplr(vander(t));
A=A(1:m,1:n);
b=cos(4*t);
%(a) normal equations annd using '\'
R=chol(A'*A);
w=R'\(A'*b);
xa=R\w;

%(b) QR factorization by mgs.m
[Qmgs Rmgs]=mgs(A);
xb=Rmgs\(Qmgs'*b);

%(c) QR factorization by house
[Whouse Rhouse]=house(A);
Qhouse=formQ(Whouse);
xc=Rhouse\(Qhouse'*b);

%(d) QR factorization by qr
[Qqr Rqr]=qr(A);
xd=Rqr\(Qqr'*b);

%(e)
xe=A\b;

%(f) SVD
[U S V]=svd(A);
w=S\U'*b;
xf=V*w;

rslt=[xa,xb,xc,xd,xe,xf];
appear_error=0.000001;
normerror=[];
for i=1:6
    normerror=[normerror norm(A*rslt(:,i)-b)];
end
for j=1:6
    number=j;
    if normerror(j)>appear_error       
        str_1=sprintf('the solution %d is not right', number);
        disp(str_1);
    else 
        str_2=sprintf('the solution %d is very good and acceptable', number);        
        disp(str_2);
    end
end
disp('===== Please input "rslt" directly in the Command Window to get all the solutions if you like =====');
disp('               ');
disp('Below are the six lists of the twelve coefficients: ');
coeff=[];
for i=1:6
    rslt(:,i)=fliplr(rslt(:,i)');
    x=linspace(min(t),max(t),12);
    coeff=[coeff;polyval(rslt(:,i),x)];
end
coeff=coeff'

% 1 2 9 12 appear to be wrong





