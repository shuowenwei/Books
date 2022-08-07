% #3 
clc;clear
format compact
n=30;
[A b x]=gravity(n,1,0,1,0.5);
v=A(1,2:n)';
v=flipud(v);
c = [A(1:n,1)%generatethe the first column of circulant matrix C
     0
     v];
xzero=zeros(n,1);
xx=[x;xzero];
bcfft=ifft(fft(c).*fft(xx));
bc=bcfft(1:n)
[b,bc,bc-b]
relative_error=norm(bc-b)/norm(b)



