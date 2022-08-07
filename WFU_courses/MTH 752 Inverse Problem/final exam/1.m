% #1 exercise 6.5.4
clc;clear;close all
format compact
N=256;
[A b x]=blur(N);
figure
E=reshape(x,N,N);%the exact image E
imagesc(E),title('\fontsize{14}The Exact Image')
axis image,colormap gray
B=reshape(b,N,N);%the blured image B
figure
imagesc(B),title('\fontsize{14}The Blurred Image')
axis image,colormap gray

% make a animation
k=50;
[X]=cgls(A,b,k);
X_image=reshape(X,N,N,k);
figure
for i=1:k
    imagesc(X_image(:,:,i));
    axis image
    colormap gray
    pause(0.2)
end

%pick 9 pictures of different k
kk=[1,5,10,15,20,25,30,45,50];
for i=1:length(kk)
    subplot(3,3,i) 
    imagesc(X_image(:,:,kk(i)));
    title(['\fontsize{14}k=',num2str(kk(i))])
    axis image,colormap gray
end

%generate the noise 
%ee=randn(size(b));
%ee=ee/norm(ee);
%bn=b+0.1*norm(b)*ee;
noise=randn(N^2,1);
e=0.1*noise*norm(b)/norm(noise);
bn=b+e;
%norm(e)/norm(b);

%pick 9 pictures added noise of different k
[Xn]=cgls(A,bn,k);
Xn_image=reshape(Xn,N,N,k);
figure
for i=1:length(kk)
    subplot(3,3,i) 
    imagesc(Xn_image(:,:,kk(i)));
    title(['\fontsize{14}k=',num2str(kk(i))])
    axis image,colormap gray
end

%animation with noise
for i=1:k
    imagesc(Xn_image(:,:,kk(i)));
    axis image
    colormap gray
    pause(0.5)
end

