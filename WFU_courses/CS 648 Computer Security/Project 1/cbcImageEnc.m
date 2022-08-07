% cbcImageEnc
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

%target=imread('lena512.bmp');
%key=33;
cbc_Image_Enc=target;
figure;subplot(1,2,1);imshow(target);
title('the original image');
n=size(cbc_Image_Enc,1);
m=size(cbc_Image_Enc,2);
if(length(size(cbc_Image_Enc))==2)
    for i=1:n
        for j=1:m
            a=uint8(cbc_Image_Enc(i,j));
            b=uint8(mod(key+i+j-2,256));
            if( (i==1)&&(j==1) )
                cbc_Image_Enc(i,j)=bitxor(a,b);
                c=cbc_Image_Enc(i,j);
            else
                d=bitxor(a,b);
                cbc_Image_Enc(i,j)=bitxor(d,c);
                c=cbc_Image_Enc(i,j);
            end
        end
    end
else
    for i=1:n
        for j=1:m
            a1=uint8(cbc_Image_Enc(i,j,1));
            a2=uint8(cbc_Image_Enc(i,j,2));
            a3=uint8(cbc_Image_Enc(i,j,3));
            b=uint8(mod(key+i+j-2,256));
            if( (i==1)&&(j==1) )
                cbc_Image_Enc(i,j,1)=bitxor(a1,b);
                cbc_Image_Enc(i,j,2)=bitxor(a2,b);
                cbc_Image_Enc(i,j,3)=bitxor(a3,b);
                c1=cbc_Image_Enc(i,j,1);
                c2=cbc_Image_Enc(i,j,2);
                c3=cbc_Image_Enc(i,j,3);
            else
                d1=bitxor(a1,b);
                d2=bitxor(a2,b);
                d3=bitxor(a3,b);
                cbc_Image_Enc(i,j,1)=bitxor(d1,c1);
                cbc_Image_Enc(i,j,2)=bitxor(d2,c2);
                cbc_Image_Enc(i,j,3)=bitxor(d3,c3);
                c1=cbc_Image_Enc(i,j,1);
                c2=cbc_Image_Enc(i,j,2);
                c3=cbc_Image_Enc(i,j,3);
            end
        end
    end
end
pause(2);
subplot(1,2,2);imshow(cbc_Image_Enc);
title('the image encrypted by CBC');
imwrite(cbc_Image_Enc,Output_image,'BMP');
