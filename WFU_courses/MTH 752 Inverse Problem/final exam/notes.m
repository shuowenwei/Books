% notes
% #3
clc;clear
n=4;
[A b x]=gravity(n,1,0,1,.5);
A
b
x
A*x
A\b
v=A(1,2:n)'
v=flipud(v)
c=[A(1:n,1)
    0
    v];
xe=[x;zeros(n,1)];
d=ifft(fft(c).*fft(xe));
bc=d(1:n);


%#4
% r=b-A*x
xe=..
axl=ifft..
ax=axl(1:n)
r=b-ax
%
