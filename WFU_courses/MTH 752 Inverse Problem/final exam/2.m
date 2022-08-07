% #2
doc imnoise
doc wiener2

clc;clear;close all
x=imread('eight.tif');
imshow(x),title('\fontsize{14}the original image')
figure
y1=imnoise(x,'salt & pepper',0.02);
subplot(1,2,1),imshow(y1)
title('\fontsize{16}Image with salt & pepper noise')
y2=imnoise(x,'gaussian',0.02);
subplot(1,2,2),imshow(y2)
title('\fontsize{16}Image with Gaussian noise')

% denoise with two filters on salt and peper noise
figure
z11=wiener2(y1,[4 4]);
z12=medfilt2(y1);
subplot(1,2,1),imshow(z11)
subplot(1,2,1),imshow(y1)
title('\fontsize{16}Denoised with Wiener Filter')
subplot(1,2,2),imshow(z12)
title('\fontsize{16}Denoised with Median Filter')

% denoise with two filters on gaussian noise
figure
z21=wiener2(y2,[4 4]);
z22=medfilt2(y2);
subplot(1,2,1),imshow(z21)
subplot(1,2,1),imshow(z22)
title('\fontsize{16}Denoised with Wiener Filter')
subplot(1,2,2),imshow(z12)
title('\fontsize{16}Denoised with Median Filter')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[z1]=wiener2(I, [4 4]); % get rid of noise
imshow(JJ)

JJJ = medfilt2(In);
inshow(JJJ)

