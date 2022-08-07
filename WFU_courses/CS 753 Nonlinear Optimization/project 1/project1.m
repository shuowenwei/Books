% project 1
% question 1 
%{
[x1,x2]=meshgrid(-5:0.05:5);
y=(x1.^2+x2-11).^2+(x1+x2.^2-7).^2;
figure;meshc(x1,x2,y)
%}
clc;clear
format short
format compact
f = @(x1,x2) (x1.^2+x2-11).^2+(x1+x2.^2-7).^2;
ezsurfc(f,[-5,5]);
fun = @(x) f(x(1),x(2));
options = optimset('LargeScale','off','Display','iter');
x0 = [3.5, 2];
[x, fval, exitflag, output, grad, hessian] = fminunc(fun,x0,options)
det(hessian)
x1 = [-3, 3];
[x, fval, exitflag, output, grad, hessian] = fminunc(fun,x1,options)
det(hessian)
x2 = [3, -2];
[x, fval, exitflag, output, grad, hessian] = fminunc(fun,x2,options)
det(hessian)
x3 = [-4, -4];
[x, fval, exitflag, output, grad, hessian] = fminunc(fun,x3,options)
det(hessian)




%[x1,x2]=solve('4*(x1^2+x2-11)*x1+2*(x1+x2^2-7)=0','2*(x1^2+x2-11)+4*(x1+x2^2-7)*x2=0')

guess=[0 4];guess=[3 3];guess=[3 3];guess=[3 3];
[result,fval,exit,output]=fsolve(@equns,guess);
result
fval
exit
output



lsqnonlin(@(x) f(x1,x2),[3;3])


help fminunc
help fsolve
help lsqnonlin


% question 2

gradient(fun)


x0 = [-3,-1,-3,-1];
test_points2 = [2,2,2,2];
options = optimset('LargeScale','off','Display','iter');
[x, fval, exitflag, output, grad, hessian] = fminunc(fun,test_points2,options)

f = @(x1,x2,x3,x4) 100*(x1.^2-x2).^2+(1-x1).^2+90*(x3.^2-x4).^2+(1-x3).^2+10.1*((1-x2).^2+(1-x4).^2)+19.8*(1-x2)*(1-x4)
fun = @(x) f(x(1),x(2),x(3),x(4));
x1=[0 0 2.5 6];
x2=[0 0 -2.5 6];
x12_mid=(x1+x2)./2;
[fun(x1)+fun(x2)]/2
fun(x12_mid)

f = @(x3,x4) 100*(0.^2-0).^2+(1-0).^2+90*(x3.^2-x4).^2+(1-x3).^2+10.1*((1-0).^2+(1-0).^2)+19.8*(1-0)*(1-x4)
ezsurfc(f,[-3,3],[3,6]);


% question 3
H=[2 0; 0 -4]
det(H)
eig(H)
