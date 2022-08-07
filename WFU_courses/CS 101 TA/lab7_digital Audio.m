clc;clear
load handel;
p = audioplayer(y,Fs);
play(p)

inv_y = y(73113:-1:1);
inv_p=audioplayer(inv_y,Fs);
play(inv_p)

%plot(y(1:200))


%{
x=randn(1,50000);
xl=length(x);
zz=audioplayer(x,xl);
play(zz)
%}

clc;clear
load snums.txt;
q = audioplayer(snums,44100);
play(q)

x=snums(551250:-1:1);
r=audioplayer(x,44100);
play(r)

t=(1:(5*8192))./8192;
z=sin(2*pi*440*t);
s=audioplayer(z,8192);
play(s)

z2=sin(2*pi*440*(5/4)*t);
s2=audioplayer(z2,8192);
play(s2);


temp=z+z2;
z3=temp./max(temp);
s3=audioplayer(z3,8192);
play(s3);

u1=[zeros(7350,1);snums];
u2=[snums;zeros(7350,1)];
u3=u1+u2;
u4=u3./max(u3);
s4=audioplayer(u4,44100);
play(s4);

play(q);




