%4
clc;clear
n=24;
[A,b,x]=wing(n);
[U S V]=svd(A);
s=diag(S);
plot(x,'-*')
legend('the exact solution')
% By TSVD
xk=[];
rlterror=[];
y=[1:n];
for k=1:n
    xnew=tsvd(U,s,V,b,k);
    xk=[xk,xnew];
    errnew=norm(x-xnew)/norm(x);
    rlterror=[rlterror,errnew];
end
figure
semilogy(rlterror,'-o');
title('relative errors');xlabel('the solutions x_k')
figure
bestk=find(rlterror==min(rlterror));
rlterror(bestk);
plot(y,x,'-*',y,xk(:,bestk),'-o')
legend('the exact solution','the best solution x_k')

% By Tikhonov
lambda=[1e-15,1e-13,1e-11,1e-9,1e-7,1e-5,1e-3,0.1,1];
xl=[];
rlterror2=[];
for i=1:length(lambda)
    [x_lambda,rho,eta]=tikhonov(U,s,V,b,lambda(i));
    xl=[xl,x_lambda];
    errnew=norm(x-x_lambda)/norm(x);
    rlterror2=[rlterror2,errnew];
end
bestlmd=find(rlterror2==min(rlterror2))
rlterror2(bestlmd)
figure
plot(y,x,'-*',y,xl(:,bestlmd),'-o')
legend('the exact solution','the best solution for \lambda =1e-13')

