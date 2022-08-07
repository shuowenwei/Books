function [encrypt]=XOR_opertion(a,b)
% get the XOR result of two decmal inputs a b
%a=dec2bin(target(i,j));
%b=dec2bin(mod(key+i+j-2,256));
%a=dec2bin(10);
%b=dec2bin(252);
%a=fliplr(a);
%b=fliplr(b);
%aa=strcat(a,'0000000');
%bb=strcat(b,'0000000');
new='00000000';
for k=1:8
    num_ak=str2double(a(k));
    num_bk=str2double(b(k));
    if(xor(num_ak,num_bk)==1)
        new(k)='1';
    end
end
encrypt=bin2dec(new);
end