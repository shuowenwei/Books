data = importdata('D:\userdata\Desktop\CS 753 Nonlinear Optimization\final exam\New folderdata.dat', ',');
data0x = data(84:size(data),1);
data0y = data(84:size(data),2);

F = importdata('C:\Userdata\MATLAB\NLO\Fn0.dat', ',');
Q = importdata('C:\Userdata\MATLAB\NLO\Qn0.dat', ',');
    
%scatter(F(:,1),F(:,2), '.')
%scatter(Q(1,:,1),Q(1,:,2), '.')

%[freq tau] = omega(F,Q,0.5,0.9)

x0 = [0.51, 15.2, 0.72, 0.94];

myf = @(x,t) modelFit(x,t,F,Q);
[x resnorm] = lsqcurvefit(myf, x0, data0x, data0y)

t=254:0.1:300;

subplot(2,1,1);
plot(data0x, data0y, '.b', t, modelFit(x,t,F,Q),'-r');
legend('data points','fit');
title('Fit with lsqcurvefit()')
xlabel('t')
ylabel('fit')

myf2 = @(x) modelFit2(x, data0x, data0y, F, Q);
[x, resnorm] = lsqnonlin(myf2, x0) 

subplot(2,1,2);
plot(data0x, data0y, '.b', t, modelFit(x,t,F,Q),'-r');
legend('data points','fit');
title('Fit with lsqnonlin()')
xlabel('t')
ylabel('fit')
