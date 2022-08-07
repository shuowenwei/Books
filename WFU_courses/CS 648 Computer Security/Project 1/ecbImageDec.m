% ecbImageDec
% clc;clear
image_name=input('Enter the image name to be decrypted -> ','s');
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

ecb_Image_Dec=target;
figure;subplot(1,2,1);imshow(target);
title('the original image');
n=size(ecb_Image_Dec,1);
m=size(ecb_Image_Dec,2);
if (length(size(ecb_Image_Dec))==2)
    for i=1:n
        for j=1:m
            a=uint8(ecb_Image_Dec(i,j));
            b=uint8(mod(key+i+j-2,256));
            ecb_Image_Dec(i,j)=bitxor(a,b);
        end
    end
else
    for i=1:n
        for j=1:m
            a1=uint8(ecb_Image_Dec(i,j,1));
            a2=uint8(ecb_Image_Dec(i,j,2));
            a3=uint8(ecb_Image_Dec(i,j,3));
            b=uint8(mod(key+i+j-2,256));
            ecb_Image_Dec(i,j,1)=bitxor(a1,b);
            ecb_Image_Dec(i,j,2)=bitxor(a2,b);
            ecb_Image_Dec(i,j,3)=bitxor(a3,b);
        end
    end
end
pause(2);
subplot(1,2,2);imshow(ecb_Image_Dec);
title('the image decrypted by ECB');
imwrite(ecb_Image_Dec,Output_image,'BMP');

