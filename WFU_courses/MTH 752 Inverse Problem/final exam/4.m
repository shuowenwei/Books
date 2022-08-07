% #4 a
clc;clear;close all
format compact
[A b x]=gravity(30,1,0,1,0.5);
p=10^(-4);
bn=b+p*randn(30,1);
xo=bn;
k=[1 2 3 4 5 10 15 30 1000];
result=[];
relativerror=[];
for i=1:length(k)
    [xc]=conjgrad(A,bn,xo,k(i));
    result=[result,xc];
    error=norm(xc-x)/norm(x);
    relativerror=[relativerror,error];
end
loglog(k,relativerror,'*')
title('\fontsize{16}relative errors')
xlabel('\fontsize{16}the number of iterations k')
min_error=min(relativerror)
k_accurate=k(find(relativerror==min(relativerror)))
max_error=max(relativerror)
k_notaccurate=k(find(relativerror==max(relativerror)))

% change p a little bit
% change p to 10^(-2)
p1=10^(-2);
bn1=b+p1*randn(30,1);
result=[];
relativerror=[];
for i=1:length(k)
    [xc]=conjgrad(A,bn1,xo,k(i));
    result=[result,xc];
    error=norm(xc-x)/norm(x);
    relativerror=[relativerror,error];
end
figure;subplot(1,2,1)
loglog(k,relativerror,'*')
title('\fontsize{16}relative errors when p=10^{-2}')
xlabel('\fontsize{16}the number of iterations k')
min_error=min(relativerror)
k_accurate=k(find(relativerror==min(relativerror)))
max_error=max(relativerror)
k_notaccurate=k(find(relativerror==max(relativerror)))


% change p to 10^(-6)
p2=10^(-6);
bn2=b+p2*randn(30,1);
result=[];
relativerror=[];
for i=1:length(k)
    [xc]=conjgrad(A,bn2,xo,k(i));
    result=[result,xc];
    error=norm(xc-x)/norm(x);
    relativerror=[relativerror,error];
end
subplot(1,2,2)
loglog(k,relativerror,'*')
title('\fontsize{16}relative errors when p=10^{-6}')
xlabel('\fontsize{16}the number of iterations k')
min_error=min(relativerror)
k_accurate=k(find(relativerror==min(relativerror)))
max_error=max(relativerror)
k_notaccurate=k(find(relativerror==max(relativerror)))

% #4 b
clc;clear;close all
format compact
[A b x]=gravity(30,1,0,1,0.5);
p=10^(-4);
bn=b+p*randn(30,1);
xo=bn;
k=[1 2 3 4 5 10 15 30 1000];
resultfft=[];
relativerrorfft=[];
for i=1:length(k)
    [xc]=conjgradfft(A,bn,xo,k(i));
    resultfft=[resultfft,xc];
    error=norm(xc-x)/norm(x);
    relativerrorfft=[relativerrorfft,error];
end
loglog(k,relativerrorfft,'*')
title('\fontsize{16}relative errors using fft and ifft')
xlabel('\fontsize{16}the number of iterations k')
min_error=min(relativerrorfft)
k_accurate=k(find(relativerrorfft==min(relativerrorfft)))
max_error=max(relativerrorfft)
k_accurate=k(find(relativerrorfft==max(relativerrorfft)))





