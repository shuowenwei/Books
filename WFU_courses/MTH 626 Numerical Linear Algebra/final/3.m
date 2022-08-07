k=(1:50);
plot(k,a,'-*r',k,b,'-ob')
legend('question 1','question 2');

figure
plot(k,a-b,'-*b')
legend('lamda1-lamda2')
