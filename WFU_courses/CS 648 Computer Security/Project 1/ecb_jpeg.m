% ecbImageEnc
% clc;clear
image_name=input('Enter the image name to be encrypted -> ','s');
target=imread(image_name);
if isempty(target)
    sprintf('The image file %s does not exit!',image_name);
    break;
end
key=input('Enter key (0 - 255) -> ');
if ~isnumeric(key)
    disp('Please input an interger key!');
    break;
end
Output_image=input('Enter output image name -> ','s');

clc;clear
target=imread('lena.bmp');
ecb_Image_Enc=target;
key=201;
%ecb_target=target;
figure;subplot(1,2,1);imshow(target);
title('the original image');
n=size(ecb_Image_Enc,1);
m=size(ecb_Image_Enc,2);
for i=1:n
    for j=1:m
        a1=uint8(ecb_Image_Enc(i,j,1));
        a2=uint8(ecb_Image_Enc(i,j,2));
        a3=uint8(ecb_Image_Enc(i,j,3));
        b=uint8(mod(key+i+j-2,256));
        ecb_Image_Enc(i,j,1)=bitxor(a1,b);
        ecb_Image_Enc(i,j,2)=bitxor(a2,b);
        ecb_Image_Enc(i,j,3)=bitxor(a3,b);
    end
end
pause(2);
subplot(1,2,2);imshow(ecb_Image_Enc);
title('the image encrypted by ECB');

imwrite(ecb_Image_Enc,Output_image,'BMP');


% A B  AxorB
% 1 1   0  
% 0 0   0
% 1 0   1
% 0 1   1