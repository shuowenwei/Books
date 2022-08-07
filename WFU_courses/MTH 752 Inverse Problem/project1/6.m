clc;clear
format compact
lambda=[0.0001,0.001,0.01,0.1];
n=32;
d=0.5;
[A,b,x]=gravity(n,2,0,1,d);

% question 6-1
rlerrxmnl=[];
for i=1:length(lambda)
    xnml=(A'*A+lambda(i)^2.*eye(n))\(A'*b);
    new=norm(xnml-x)/norm(x);
    rlerrxmnl=[rlerrxmnl,new];
end

% question 6-2
rlerrxt=[];
for i=1:4
    c=[A;lambda(i)*eye(n)];
    d=[b;zeros(n,1)];
    xt=lsqlin(c,d);
    new=norm(xt-x)/norm(x);
    rlerrxt=[rlerrxt,new];
end

plot(lambda,rlerrxmnl,'b<',lambda,rlerrxt,'r>')
legend('relative error of x normal equ','relative error of x least squ','Location','NorthWest')
xlabel('value of lambda')
ylabel('relative error')