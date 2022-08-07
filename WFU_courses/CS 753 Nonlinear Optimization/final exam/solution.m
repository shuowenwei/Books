% 1 fminimax
clc;clear
x=(-2:0.15:2);
y1 = x.^2.+x+1;
y2 = 3*x./x; 
y3 = x.^4 + 5;
y4 = -x.^2+1;
y5 = sin(x) + cos(x);

figure(1)
plot(x,y1,x,y2,x,y3,x,y4,x,y5)
legend('y=x^2+x+1','y=3','y=x^4+5','x^2+1','sin(x)+cos(x)') 

x0=1;
[x,fval] = fminimax(@Q1_myfun,x0)


% 2 fmincon
clc;clear
f = @(x1,x2) sin(x1.*x2)
ezsurfc(f,[0,2],[-2,0]);
x0 = [1, -1];
lb = [0 -2];
ub = [2 0];
%[x, fval] = fmincon(@Q2_myfun,x0,[],[],[],[],lb,ub)
options = optimset('Algorithm','interior-point');
[x, fval] = fmincon(@Q2_myfun,x0,[],[],[],[],lb,ub,[],options)


% 5
clc;clear
f = [5; 10; 4; 15];
A = [1 1 0 0
    0 0 1 1
    -1 0 0 -1
    0 -1 -1 0];
b = [700; 800; -600; -400];
lb=zeros(4,1);
[x, fval, exitflag, output, lambda] = linprog(f,A,b,[],[],lb)

% 6
clc;clear
x = [-3 -2.5 -2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3];
y = [26 18 14 9 5 4 5 7 10 15 20 29 36];
myfun = @(a,x) a(1)*x.^3 + a(2)*x.^2 + a(3)*x + a(4);
a0 = [0, 1, 2, 3];
[a_para res_norm] = lsqcurvefit(myfun, a0, x, y) 

xx = -3.5:0.05:3.5; 
plot(x, y, 'o', xx, myfun(a_para, xx), '-') 
legend('data points','fit function'); 
title('cubic fit function');

% 9
clc;clear
x = [0 1 2 3 4];
q = [0.1 0.25 0.45 0.15 0.05];

p1 =[0 0.3 0.6 0.1 0];
p2 =[0 1 0 0 0];
p3 =[0.2 0.5 0.15 0.09 0.06];
p4 =[0.2 0.2 0.2 0.2 0.2];

KL1 = kldiv(x,q,p1)
KL2 = kldiv(x,q,p2)
KL3 = kldiv(x,q,p3)
KL4 = kldiv(x,q,p4)

KL2 = kldiv(x,p2,q)
KL3 = kldiv(x,p3,q)
KL4 = kldiv(x,p4,q)

test = kldiv(x,q,q)
KL1 = kldiv(x,p1,q)



