clc;clear
x=-2.5:0.01:2.5;
y=x.^3-x-1;
z=-15:0.01:15;
z1=ones(1,length(z));
z2=2*ones(1,length(z));
plot(x,y)
hold on 
zz=zeros(length(x),1);
plot(x,zz)
plot(1.3247,0,'r*')
plot( 0.5774,-1.3205,'v')
plot(z1,z,'g')
plot(z2,z,'g')
hold off
%{
clc;clear
x=-1:0.01:1.2;
y=x.^7-x.^4+1;
plot(x,y)
hold on 
plot(x(501),y(501),'*')

z=zeros(length(x),1);
plot(x,z)
epl=0.01;
find(abs(y)<epl)
%}

clc;clear
format compact
x=[];
x(1)=1.5;
x(2)=(x(1)+1)^(1/3);
i=1;
epsilon=0.00001;
while(norm(x(i+1)-x(i))>epsilon)
    i=i+1;
    x(i+1)=(x(i)+1)^(1/3);
end
step=i
x


clc;clear
x=-1:0.01:2;
y=x+exp(x)-2;
z=-4:0.01:10;
z1=zeros(1,length(z));
z2=ones(1,length(z));
plot(x,y)
hold on 
zz=zeros(length(x),1);
plot(x,zz)
plot(0.44286,0,'r*')
plot(z1,z,'g')
plot(z2,z,'g')
hold off


clc;clear
format compact
format long
x=[];
x(1)=0.5;
x(2)=log(2-x(1));
i=1;
epsilon=0.00001;
while(norm(x(i+1)-x(i))>epsilon)
    i=i+1;
    x(i+1)=log(2-x(i));
end
step=i
x


x=-3:0.01:2;
y=log(2-x);
plot(x,y)





