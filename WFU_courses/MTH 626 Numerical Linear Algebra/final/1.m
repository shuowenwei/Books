clear;clc
format long
A=[2 1 1; 1 3 1; 1 1 4];
m=length(A);
I=eye(m);
u=5;
v=[];
v0=(1/3)^(0.5).*[1 1 1]';
v=[v0 v];
lamda=[];
lamda=[u lamda];
for k=1:100
    w=inv(A-u*I)*v(:,k);
    v(:,k+1)=w./norm(w);
    lamda(k+1)=v(:,k+1)'*A*v(:,k+1);    
end
kk=[2 5 10 15 20 30 50 100];
lamda(kk+1)

a=lamda(2:51);