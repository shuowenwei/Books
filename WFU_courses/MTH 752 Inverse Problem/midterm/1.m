%1
clc;clear
x(1)=1.5;
for i=1:100
    x(i+1)=(x(i)+1)^(1/3);
end
norm(x(100)-x(99))
x(100)