clear;clc
n=32;
m=40;
k=1:m;
noise=10.^(-k);
[A,b,x]=shaw(n); 
[U,s,V]=csvd(A);
f=[];
F=zeros(n);
I=eye(n);
S=diag(s);
x_lambda=[];
reg_error=[];
pert_error=[];
total_error=[];
S=diag(s);

lambda=(1.258).^(-k);

for i=1:m
    e=noise(3)*randn(size(b));
    b = b+e;
    x_lambda=tikhonov(U,s,V,b,lambda(i));
    %plot (1:n,x,1:n,x_lambda,'o')
    for j=1:n
        f(j)=s(j)^2/(s(j)^2+lambda(i)^2);
        F(j,j)=f(j);
    end
    reg_error(i)=norm(V*(F-I)*V'*x);
    pert_error(i)=norm(V*F*inv(S)*U'*e);
    %total_error(i)=reg_error(i)+pert_error(i);
    total_error(i)=norm(V*(F-I)*V'*x+V*F*inv(S)*U'*e);
end
lambda_best=gcv(U,s,b);
loglog(lambda,total_error,'-',lambda,reg_error,':',lambda,pert_error,'--')
best_x=tikhonov(U,s,V,b,lambda_best);
for j=1:n
    f(j)=s(j)^2/(s(j)^2+lambda_best^2);
    F(j,j)=f(j);
end
reg_error_best=norm(V*(F-I)*V'*x);
pert_error_best=norm(V*F*inv(S)*U'*e);
%total_error(i)=reg_error(i)+pert_error(i);
total_error_best=norm(V*(F-I)*V'*x+V*F*inv(S)*U'*e);
hold on
plot(lambda_best,total_error_best,'*')
legend('total','reg','pert')
hold off

figure
%reg_corner=l_curve(U,s,b)
[reg_corner,rho,eta,reg_param] = l_curve(U,s,b)

for i=length(reg_param)
    if (reg_param(i)-reg_corner)<0.000001;
        j=i
    end
end
plot(reg_corner,reg_param(j),'o')
reg_param(j)

%relative_error=norm(x-x_lambda)/norm(x)

