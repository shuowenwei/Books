clear;clc
t=[1900:10:2000];
b=[75.995,91.972,105.711,123.203,131.669,150.697,179.323,203.212,226.505,249.633,281.422]';
A=fliplr(vander(t));
A=A(:,1:4);
coeff=A\b;
coeff=fliplr(coeff');
x=linspace(min(t),max(t),11);
point=polyval(coeff,x)

%1
xx=[1900:0.05:2000];
yy=coeff(1).*xx.^3+coeff(2).*xx.^2+coeff(3).*xx+coeff(4);

%2
plot(t,b,'ro',x,point)
%hold on
%plot(xx,yy,'g-')

%3
y_3=coeff(1).*t.^3+coeff(2).*t.^2+coeff(3).*t+coeff(4);
residue=norm(y_3-b')

%4
tt=2010;
predict_t2010=coeff(1)*tt^3+coeff(2)*tt^2+coeff(3)*tt+coeff(4)

