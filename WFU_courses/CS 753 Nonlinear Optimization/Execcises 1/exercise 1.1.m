clc;clear
% figure 1
t=0:0.01:10;
x=sin(2*t)-cos(t)/2;
y=sin(t);
subplot(2,2,1),plot(t,x,'b','LineWidth',3);grid on
title('plot');
subplot(2,2,2),plot3(t,x,y,'r','LineWidth',2);grid on
title('plot3');
subplot(2,2,3),fplot(@(x)(sin(x)+cos(x*x)), [-2 2]);grid on
title('fplot');
subplot(2,2,4),plot3(t,x,y,'r','LineWidth',2);grid on;view(180,90)
title('view of plot3 in above figure');

% figure 2
[X,Y]=meshgrid(-10:0.05:10);
R=X+Y;
Z=cos(R).*R;
mesh(X,Y,Z)

% figure 3
[X,Y]=meshgrid(-10:0.05:10);
R=sqrt(X.^2+Y.^2);
Z=cos(R).*R;
contour(X,Y,Z);colorbar;












