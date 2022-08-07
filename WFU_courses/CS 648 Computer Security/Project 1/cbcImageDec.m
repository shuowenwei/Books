% cbcImageDec
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

cbc_Image_Dec=target;
%target=imread('cbc_target.bmp');
%key=33;
figure;subplot(1,2,1);imshow(target);
title('the original image');
n=size(cbc_Image_Dec,1);
m=size(cbc_Image_Dec,2);
if(length(size(cbc_Image_Dec))==2)
    for i=1:n
        for j=1:m
            a=uint8(cbc_Image_Dec(i,j));
            b=uint8(mod(key+i+j-2,256));
            if( (i==1)&&(j==1) )
                c=cbc_Image_Dec(i,j);
                cbc_Image_Dec(i,j)=bitxor(a,b);
            else
                d=bitxor(a,b);
                prior_c=cbc_Image_Dec(i,j);
                cbc_Image_Dec(i,j)=bitxor(d,c);
                c=prior_c;
            end
        end
    end
else
    for i=1:n
        for j=1:m
            a1=uint8(cbc_Image_Dec(i,j,1));
            a2=uint8(cbc_Image_Dec(i,j,2));
            a3=uint8(cbc_Image_Dec(i,j,3));
            b=uint8(mod(key+i+j-2,256));
            if( (i==1)&&(j==1) )
                c1=cbc_Image_Dec(i,j,1);
                c2=cbc_Image_Dec(i,j,2);
                c3=cbc_Image_Dec(i,j,3);
                cbc_Image_Dec(i,j,1)=bitxor(a1,b);
                cbc_Image_Dec(i,j,2)=bitxor(a2,b);
                cbc_Image_Dec(i,j,3)=bitxor(a3,b);
            else
                d1=bitxor(a1,b);
                d2=bitxor(a2,b);
                d3=bitxor(a3,b);
                prior_c1=cbc_Image_Dec(i,j,1);
                prior_c2=cbc_Image_Dec(i,j,2);
                prior_c3=cbc_Image_Dec(i,j,3);
                cbc_Image_Dec(i,j,1)=bitxor(d1,c1);
                cbc_Image_Dec(i,j,2)=bitxor(d2,c2);
                cbc_Image_Dec(i,j,3)=bitxor(d3,c3);
                c1=prior_c1;
                c2=prior_c2;
                c3=prior_c3;
            end
        end
    end
end
pause(2);
subplot(1,2,2);imshow(cbc_Image_Dec);
title('the image decrypted by CBC');
imwrite(cbc_Image_Dec,Output_image,'BMP');
