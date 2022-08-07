clc;clear
format long
diary a
n=[6,10,14,16];
for i=1:4
    H=hilb(n(i));
    x=ones(n(i),1);
    b=sum(H)';
    str1=sprintf('******************Below are results when n = %d ', n(i));
    disp(str1);
    xinv=inv(H)*b; % here changes 
    r=b-H*xinv
    ans=norm(r)/norm(b);
    str2=sprintf('||r||/||b|| = %d ', ans);
    disp(str2); 
    ans2=norm(x-xinv)/norm(x);
    str3=sprintf('||x-xc||/||x|| = %d ', ans2);
    disp(str3);    
end
diary off


diary b
for i=1:4
    H=hilb(n(i));
    x=ones(n(i),1);
    b=sum(H)';
    str1=sprintf('******************Below are results when n = %d ', n(i));
    disp(str1);
    xslash=H\b;; % here changes 
    r=b-H*xslash
    ans=norm(r)/norm(b);
    str2=sprintf('||r||/||b|| = %d ', ans);
    disp(str2); 
    ans2=norm(x-xslash)/norm(x);
    str3=sprintf('||x-xc||/||x|| = %d ', ans2);
    disp(str3);    
end
diary off

diary c
for i=1:4
    H=hilb(n(i));
    x=ones(n(i),1);
    b=sum(H)';
    str1=sprintf('******************Below are results when n = %d ', n(i));
    disp(str1);
    [U S V]=svd(H); % here changes 
    xcvd=V*inv(S)*U'*b; 
    r=b-H*xcvd
    ans=norm(r)/norm(b);
    str2=sprintf('||r||/||b|| = %d ', ans);
    disp(str2); 
    ans2=norm(x-xcvd)/norm(x);
    str3=sprintf('||x-xc||/||x|| = %d ', ans2);
    disp(str3);    
end
diary off

diary d
for i=1:4
    H=hilb(n(i));
    cond(H)
end
diary off

