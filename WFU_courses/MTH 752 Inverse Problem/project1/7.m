clear;clc
format compact
n=32;
d=0.5;
[A,b,x]=gravity(n,2,0,1,d);
k=[5 10 12 14 16];
s=randn(32,1);
noise=eps*(10.^k);

%repeat question 4
rlerrxcn=[];
noiselevel=[];
for i=1:5
    bn=b+s.*noise(i);
    new1=norm(noise(i))/norm(b);
    noiselevel=[noiselevel,new1];
    xcn=A\bn;
    new2=norm(xcn-x)/norm(x);
    rlerrxcn=[rlerrxcn,new2];
end

%repeat question 5
[U,S,V]=svd(A);
rlerrxck=[];
positionk=[];
for i=1:5
    bn=b+s.*noise(i);
    rlerr=[];
    for k=1:32
        xckn=ktsvd(A,bn,n,k);
        new=norm(xckn-x)/norm(x);
        rlerr=[rlerr;new];
    end
    rlerrxck=[rlerrxck,rlerr];
    minvalue=min(rlerrxck(:,i));
    locate=find(rlerrxck(:,i)==minvalue);     
    positionk=[positionk,locate];
end
min(rlerrxck)
positionk
semilogy(rlerrxck,'-o')
title('relative error of xck based on different noise')
legend('noice k=5','noice k=10','noice k=12','noice k=14','noice k=16','Location','NorthWest')
xlabel('truncated SVD position i=1:32')
ylabel('value of relative error')

%repeat question 6-1
lambda=[0.0001,0.001,0.01,0.1];
rlerrxmnl=[];
positionlmd=[];
for i=1:5
    bn=b+s.*noise(i);
    rlerr=[];
    for j=1:4
        xnml=(A'*A+lambda(j)^2.*eye(n))\(A'*bn);
        new=norm(xnml-x)/norm(x);
        rlerr=[rlerr;new];
    end
    rlerrxmnl=[rlerrxmnl,rlerr];
    minvalue=min(rlerrxmnl(:,i));
    locate=find(rlerrxmnl(:,i)==minvalue);     
    positionlmd=[positionlmd,locate];
end
min(rlerrxmnl)
positionlmd
lambda(positionlmd)

%repeat question 6-2
rlerrxt=[];
positionlmd=[];
for i=1:5
    bn=b+s.*noise(i);
    rlerr=[];
    for j=1:4 
        c=[A;lambda(j)*eye(n)];
        d=[bn;zeros(n,1)];
        xt=lsqlin(c,d);
        new=norm(xt-x)/norm(x);
        rlerr=[rlerr;new];
    end
    rlerrxt=[rlerrxt,rlerr];
    minvalue=min(rlerrxt(:,i));
    locate=find(rlerrxt(:,i)==minvalue);     
    positionlmd=[positionlmd,locate];
end
min(rlerrxt)
positionlmd
lambda(positionlmd)

semilogy(rlerrxmnl,'--v','LineWidth',2)
title('relative error of xnml based on different noise')
legend('noice k=5','noice k=10','noice k=12','noice k=14','noice k=16','Location','NorthEast')
xlabel('value of lambda')
ylabel('value of relative error')
