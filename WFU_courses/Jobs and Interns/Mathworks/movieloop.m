%clc;clear

% please run the following commands in the command window:
%[map,mapaft,step,flag]=movieloop(15,15,30);


function [map,mapaft,step,flag]=movieloop(m,n,k)
clf;
%m=15;n=15;k=20;
subplot(2,2,1);[map]=generatemap(m,n,k);
title(['area=',num2str(m*n),',phemn=',num2str(k)]);
startx=randi(m);
starty=randi(n);
[enterptx,enterpty,map,path,step]=enterthemap(startx,starty,map);
[mapaft,flag,pathin,endx,endy]=findtheoriginal(enterptx,enterpty,map);
%[mapaft,flag,pathin,endx,endy,disappt]=findtheoriginal_fix(enterptx,enterpty,map);

%subplot(2,2,2);pcolor(mapaft);title(['eliminate=',num2str(length(disappt))]);
subplot(2,2,3);[mappath]=plotpath(map,path);title(['step=',num2str(step)]);
subplot(2,2,4);[mappathin]=plotpathin(map,pathin);title(['flag=',num2str(flag),', total=',num2str(step+flag)]);
end

function [map,agentx,agenty]=generatemap(m,n,k)
map=zeros(m,n);
initial_x=round(m/2);
initial_y=round(n/2);
map(initial_x,initial_y)=2;
agentx=initial_x;
agenty=initial_y;

while (sum(sum(map))~=k+1)
    resort=randperm(4);
    chois=resort(1);
    switch chois
        case 1
        [agentx,agenty,map]=moveleft(agentx,agenty,map);
        case 2
        [agentx,agenty,map]=moveup(agentx,agenty,map);
        case 3
        [agentx,agenty,map]=moveright(agentx,agenty,map);
        case 4
        [agentx,agenty,map]=movedown(agentx,agenty,map);
    end
    %%%
    map(agentx,agenty)=3;
    hold on
    pcolor(map);
    pause(0.1);
    hold off
    map(agentx,agenty)=1;
    map(initial_x,initial_y)=2;
    %%%
end
map(agentx,agenty)=3;
pcolor(map);

%m=10;n=10;k=50;
% 1 = go left
% 2 = go up
% 3 = go right
% 4= go down
end

function [mapaft,flag,pathin,endx,endy]=findtheoriginal(enterptx,enterpty,map)
[m n]=size(map);
flag=0;
mapaft=map;
a=enterptx;
b=enterpty;
pathin=[a;b];
while(mapaft(a,b)~=2)
    ppw=[];
    ppw=gettheway(a,b,mapaft);
    index=randperm(length(ppw));
    resort=ppw(index);
    chois=resort(1); 
    switch chois
        case 1
            b=mod(b-1-1,n)+1;%b=b-1;  
        case 2
            a=mod(a-1-1,m)+1;%a=a-1;    
        case 3
            b=mod(b,n)+1;%b=b+1;    
        case 4
            a=mod(a,m)+1;%a=a+1;
    end
    newpath=[a;b];
    pathin=[pathin,newpath];
    flag=flag+1;
end
endx=a;
endy=b;
end

function [mappath]=plotpath(map,path)
mappath=map;
len=size(path);
for i=1:len(2)
    %%%%%
    mappath(path(1,i),path(2,i))=3;
    hold on
    pcolor(mappath);
    pause(0.1);
    hold off
    mappath(path(1,i),path(2,i))=0.5;
    mappath(path(1,1),path(2,1))=1.7;
    %%%%%
end
mappath(path(1,i),path(2,i))=3;
pcolor(mappath);
end

function [mappathin]=plotpathin(map,pathin)
mappathin=map;
len=size(pathin);
for i=1:len(2)
    %%%%%
    mappathin(pathin(1,i),pathin(2,i))=3;
    hold on
    pcolor(mappathin);
    pause(0.1);
    hold off
    mappathin(pathin(1,i),pathin(2,i))=0.7;
    %%%%%
end
mappathin(pathin(1,i),pathin(2,i))=3;
pcolor(mappathin);
end

function [x,y,map]=movedown(a,b,map)
[m n]=size(map);
%x=a+1;
x=mod(a,m)+1;
y=b;
if map(x,y)~=2
    map(x,y)=1;
else map(x,y)=2;
end
end

function [x,y,map]=moveleft(a,b,map)
[m n]=size(map);
x=a;
%y=b-1;
y=mod(b-1-1,n)+1;
if map(x,y)~=2
    map(x,y)=1;
else map(x,y)=2;
end

end

function [x,y,map]=moveup(a,b,map)
[m n]=size(map);
%x=a-1;
x=mod(a-1-1,m)+1;
y=b;
if map(x,y)~=2
    map(x,y)=1;
else map(x,y)=2;
end
end

function [x,y,map]=moveright(a,b,map)
[m n]=size(map);
x=a;
%y=b+1;
y=mod(b,n)+1;
if map(x,y)~=2
    map(x,y)=1;
else map(x,y)=2;
end
end

function [x,y]=initial(m,n)
ip=randi(m*n);
if mod(ip,m)~=0
    x=mod(ip,m);
else x=m;
end
y=(ip-x)/m+1;
end

function ppw=gettheway(a,b,M)
bdhnone=zeros(1,4);
[m,n]=size(M);
bdhnone(1)=M(a,(mod(b-1-1,n)+1));
bdhnone(2)=M((mod(a-1-1,m)+1),b);
bdhnone(3)=M(a,(mod(b,n)+1));
bdhnone(4)=M((mod(a,m)+1),b);
ppw=find(bdhnone>=1);
end

function [enterptx,enterpty,map,path,step]=enterthemap(startx,starty,map)
[m n]=size(map);
a=startx;
b=starty;
path=[a;b];
step=0;
while(map(a,b)==0)
    nbhdway=[];
    nbhdway=seracharound(a,b,map);
    possibleway=find(nbhdway>0);
    index=randperm(length(possibleway));
    resort=possibleway(index);
    chois=resort(1); 
    switch chois
        case 1
            b=mod(b-1-1,n)+1;%b=b-1;  
        case 2
            a=mod(a-1-1,m)+1;%a=a-1;    
        case 3
            b=mod(b,n)+1;%b=b+1;    
        case 4
            a=mod(a,m)+1;%a=a+1;
    end
    newpath=[a;b];
    path=[path,newpath];
    step=step+1;
end
enterptx=a;
enterpty=b;
end

function [nbhdway]=seracharound(a,b,M)
nbhdway=[];
[m,n]=size(M);
nbhdway=zeros(1,4);
nbhdway(1)=M(a,(mod(b-1-1,n)+1));
nbhdway(2)=M((mod(a-1-1,m)+1),b);
nbhdway(3)=M(a,(mod(b,n)+1));
nbhdway(4)=M((mod(a,m)+1),b);
if find(sum(nbhdway)>=1)
    nbhdway=nbhdway;
else
    nbhdway=1:4;
end
end