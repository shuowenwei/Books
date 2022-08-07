clear;clc
x=0:0.01:10;
y=10.^x;
z=exp(x);
a=200*exp(-x);
b=20*exp(-x);
subplot(2,2,1)
semilogy(x,y,'ro')
subplot(2,2,2)
semilogx(y,x,'b*')
subplot(2,2,3)
loglog(x,z,'-gO')
subplot(2,2,4)
plotyy(x,a,x,b)

clc;clear
t = 0:pi/50:10*pi;
plot3(sin(t),cos(t),t)
grid on

x=0:0.1:2;
y=sin(x);
plot(x,y,'*')
hold on
line(x,y)