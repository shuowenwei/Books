clc;clear
diary on
X=[0 1 3 4];
Y=[0 0 2 2];
x=linspace(0,4,200);
pp=spline(X,Y)

plot(x,ppval(pp,x));

pp.coefs

help spline

diary off
