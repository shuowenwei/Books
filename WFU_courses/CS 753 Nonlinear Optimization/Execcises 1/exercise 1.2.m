clc;clear

% Probelm 2.1
x=[-2:0.01:2];
y_1=sqrt(4-x.^2);
y_2=-sqrt(4-x.^2);
plot(x,y_1,'b',x,y_2,'b','LineWidth',3)
xlabel('x');ylabel('y');grid on;
title('x^2+y^2=4')


% Probelm 2.1
x=[-2:0.01:2];
y_1=sqrt(4-x.^2);
y_2=-sqrt(4-x.^2);
plot(x,y_1,'b',x,y_2,'b','LineWidth',3);
axis([-2.5 2.5 -2.5 2.5])
xlabel('x');ylabel('y');grid on;
title('Problem 2.1');legend('x^2+y^2=4')

%Problem 2.2
clc;clear
fplot(@(x)(11-x^2),[-10,10],'b','-.');
hold on;fplot(@(x)(sqrt(7-x)),[-7,7],'r');
hold on;fplot(@(x)(-sqrt(7-x)),[-7,7],'r');
hold off;
legend('blue: x^2+y=11','red: x+y^2=7');
xlabel('x');ylabel('y');title('Problem 2.2');

%Problem 2.3
t=[-4*pi:0.01:4*pi];
x=cos(t);y=sin(2*t);z=t.^2;
plot3(x,y,z,'b','LineWidth',3)
legend('x=cos(t), y=sin(2t), z=t^2');
xlabel('x');ylabel('y');zlabel('z');
title('Problem 2.3');

%Problem 2.4
[x,y]=meshgrid(-3:0.1:3);
z=cos(x+y)+1/2/pi*exp(-x.^2-y.^2);
mesh(x,y,z);
legend('z=cos(x+y)+1/2/pi*exp(-(x^2+y^2)');
xlabel('x');ylabel('y');zlabel('z');
title('Problem 2.4 -- mesh');

figure
surf(x,y,z,z);
legend('z=cos(x+y)+1/2/pi*exp(-(x^2+y^2)');
xlabel('x');ylabel('y');zlabel('z');
title('Problem 2.4 -- surf');

figure
contour(z)
[C,h] = contour(x,y,z);
set(h,'ShowText','on','TextStep',get(h,'LevelStep')*2)
colormap cool
legend('z=cos(x+y)+1/2/pi*exp(-(x^2+y^2)');
xlabel('x');ylabel('y');zlabel('z');
title('Problem 2.4 -- contour');


