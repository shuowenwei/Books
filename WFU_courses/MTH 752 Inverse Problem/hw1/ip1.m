function [xinv,xslash,xsvd,condH,rinv,pinv,qinv,rslash,pslash,qslash,rsvd,psvd,qsvd] = ip1(n)
H=hilb(n);
%b=zeros(n,1);
%for i=1:n
%b(i,1)=sum(H(i,1:n));
%end
b=sum(H)';

tic;
xinv=inv(H)*b;
toc;

tic;
xslash=H\b;
toc;

tic;
[U,S,V]= svd(H);
xsvd=V*inv(S)*U'*b;
toc;


condH=cond(H,2);

rinv=b-H*xinv;
pinv=norm(rinv,2)/norm(b,2);
x=ones(n,1);
qinv=norm(x-xinv,2)/norm(x,2);

rslash=b-H*xslash;
pslash=norm(rslash,2)/norm(b,2);
x=ones(n,1);
qslash=norm(x-xslash,2)/norm(x,2);

rsvd=b-H*xsvd;
psvd=norm(rsvd,2)/norm(b,2);
x=ones(n,1);
qsvd=norm(x-xsvd,2)/norm(x,2);
