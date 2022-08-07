clc;clear
format compact
format short
b=[];
d=[0.2:0.1:0.8];
for i=1:length(d)
    [A,bb,x]=gravity(32,2,0,1,d(i));
    b=[b,bb];   
end
plot(b,'-o')
legend('d=0.2','d=0.3','d=0.4','d=0.5','d=0.6','d=0.7','d=0.8')
ylabel('value of b')
title('relation between d and b')
max_b=max(b);
min_b=min(b);