% CSC 648 Computer Security
clc;clear
table='abcdefghijklmnopqrstuvwxyz';
a='ejitpspawsqlejitaiulrtwllrflrllaoatwsqqjatgackthlsiraoatwlplqjatwjufrhlhutsqataqitatsaittkstqfjcae';
v=a;%'ejitpspawsqlejitaiulrtwllrflrllaoatwsqqjatgackthlsiraoatwlplqjatwjufrhlhutsqataqitatsaittkstqfjcae';
b=zeros(1,26);
c=zeros(1,length(a));
%d=zeros(1,length(a));
for i=1:length(a)
    %c(i)=find(table==a(i));
    switch a(i)
        case {'a'}%%%%%%%%%%%%%%%%%%%%%%%%%r
            b(1)=b(1)+1;            c(i)=1;             v(i)='i';            
        case {'b'}
            b(2)=b(2)+1;            c(i)=2;             v(i)='j';
        case {'c'}
            b(3)=b(3)+1;            c(i)=3;             v(i)='g';
        case {'d'}
            b(4)=b(4)+1;            c(i)=4;             v(i)='k';
        case {'e'}
            b(5)=b(5)+1;            c(i)=5;             v(i)='c';
        case {'f'}
            b(6)=b(6)+1;            c(i)=6;             v(i)='l';
        case {'g'}
            b(7)=b(7)+1;            c(i)=7;             v(i)='m';
        case {'h'}
            b(8)=(8)+1;             c(i)=8;             v(i)='b';
        case {'i'}%%%%%%%%%%%%%%%%%%%%%%%%%%%n
            b(9)=b(9)+1;            c(i)=9;             v(i)='n';
        case {'j'}%%%%%%%%%%%%%%%%%%%%%%%%%%o
            b(10)=b(10)+1;      	c(i)=10;            v(i)='o';
        case {'k'}
            b(11)=b(11)+1;          c(i)=11;            v(i)='h';
        case {'l'}
            b(12)=b(12)+1;          c(i)=12;            v(i)='e';
        case {'m'}
            b(13)=b(13)+1;          c(i)=13;            v(i)='p';
        case {'n'}
            b(14)=b(14)+1;          c(i)=14;            v(i)='q';
        case {'o'}
            b(15)=b(15)+1;          c(i)=15;            v(i)='f';
        case {'p'}
            b(16)=b(16)+1;         	c(i)=16;            v(i)='r';
        case {'q'}%%%%%%%%%%%%%%%%%%%%%%i
            b(17)=b(17)+1;          c(i)=17;            v(i)='s';
        case {'r'}%%%%%%%%%%%%%%%%%%%%%%s
            b(18)=b(18)+1;          c(i)=18;            v(i)='d';
        case {'s'}
            b(19)=b(19)+1;          c(i)=19;            v(i)='a';
        case {'t'}
            b(20)=b(20)+1;         	c(i)=20;            v(i)='t';
        case {'u'}
            b(21)=b(21)+1;          c(i)=21;            v(i)='u';
        case {'v'}
            b(22)=b(22)+1;        	c(i)=22;            v(i)='v';
        case {'w'}
            b(23)=b(23)+1;         	c(i)=23;         	v(i)='q';
        case {'x'}
            b(24)=b(24)+1;          c(i)=24;            v(i)='x';
        case {'y'}
            b(25)=b(25)+1;          c(i)=25;            v(i)='y';
        case {'z'}
            b(26)=b(26)+1;          c(i)=26;            v(i)='z';
    end
end
a
v


for i=2:(length(a)-1)
    if(a(i)=='l')
       er__________________re=a(i-1:i+1)
    end
end
for i=1:(length(a)-2)
    if( (a(i)=='t')&&(a(i+2)=='l') )
       a(i:i+2)
    end
end

for i=2:(length(a)-2)
    if( (a(i)=='l')&&(a(i+1)=='l') )
       XeeX__________________XeeX=a(i-1:i+2)
    end
end

for i=1:(length(a)-4)
    if( (a(i)=='t')&&(a(i+3)=='p') )
       tion_____________tion=a(i:i+3)
    end
end



c=c-1;
clc
for key=0:25
    for i=1:length(c)
        d(i)=mod(c(i)-key,26);
    end
    char('a' + d)
end

% problem 4
clc;clear
table='abcdefghijklmnopqrstuvwxyz';
aa='aauancvlrerurnndltmeaeepbytusticeatnpmeyiicgogorchsrsocnntiiimihaoofpagsivttpsitlbolrotoex';
cc=zeros(1,length(aa));
dd=zeros(1,length(aa));
for i=1:length(aa)
    cc(i)=find(table==aa(i));
end
computer=[];
for i=1:(length(cc)-8)
    b=cc(i:i+7);
    if(length(unique(b))==8)
        computer=[computer i];
    end
end
candidate=[];
for i=1:length(computer) 
    candidate=[candidate;aa(computer(i):computer(i)+7)];
end
candidate=[candidate;'computer'];
candidate_matrix=[];
for i=1:size(candidate,1)
    for j=1:size(candidate,2)
        candidate_matrix(i,j)=find(table==candidate(i,j));
    end
end
dd=zeros(1,length(aa));
for i=1:length(cc)
    switch cc(i)
        case (21)
            dd(i)=3;
        case (1)
            dd(i)=15;
        case (14)
            dd(i)=13;
        case (3)
            dd(i)=16;
        case (22)
            dd(i)=21;
        case (12)
            dd(i)=20;
        case (18)
            dd(i)=5;
        case (5)
            dd(i)=18;
        otherwise
            dd(i)=0;
    end
end

char('a'+dd-1)
m=mod(n,col);

n=length(aa);
aa='aauancvlrerurnndltmeaeepbytusticeatnpmeyiicgogorchsrsocnntiiimihaoofpagsivttpsitlbolrotoex';
for i=1:6
    for j=1:15
        matrix(j,i)=aa(i*15-15+j);
    end
end
matrix



% problem 6
for y=1:200
    if(mod(3^y,719)==543)
        y
    end
end
%use command "bc" in Linux

% problem 5

p=7;q=11;
n=(p-1)*(q-1);
d=13;
gcd(d,n)
d=17;
gcd(d,n)


p=13;q=31;d=7;
n=(p-1)*(q-1);
for k=1:100
    if(mod(k*n+1,d)==0)
        k
        break;
    end
end
e=(k*n+1)/d


p=5;q=11;d=27;
n=(p-1)*(q-1);
for k=1:100
    if(mod(k*n+1,d)==0)
        k
        break;
    end
end
e=(k*n+1)/d
mod(1^e,n)
mod(2^e,n)
mod(3^e,n)

mod(2^27,n)



the=[];
for i=1:(length(a)-2)
    for j=(i+1):(length(a)-2)
        if( strcmp( a(i:i+2),a(j:j+2) )==1 )
            the=[the i];
        end
    end
end


for k=1:length(the)
    position=the(k);
    a(position:position+2)
end


tabulate(a)


    switch a(i)
        case {'a'}
            b(1)=b(1)+1;
            c(i)=1;
        case {'b'}
            b(2)=b(2)+1;    
            c(i)=2;
        case {'c'}
            b(3)=b(3)+1;        
            c(i)=3;
        case {'d'}
            b(4)=b(4)+1;     
            c(i)=4;
        case {'e'}
            b(5)=b(5)+1;
            c(i)=5;
        case {'f'}
            b(6)=b(6)+1;
            c(i)=6;
        case {'g'}
            b(7)=b(7)+1;  
            c(i)=7;
        case {'h'}
            b(8)=(8)+1;    
            c(i)=8;
        case {'i'}
            b(9)=b(9)+1;       
            c(i)=9;
        case {'j'}
            b(10)=b(10)+1;   
            c(i)=10;    
        case {'k'}
            b(11)=b(11)+1;
            c(i)=11;
        case {'l'}
            b(12)=b(12)+1;       
            c(i)=12;
        case {'m'}
            b(13)=b(13)+1;   
            c(i)=13;   
        case {'n'}
            b(14)=b(14)+1;    
            c(i)=14;  
        case {'o'}
            b(15)=b(15)+1;     
            c(i)=15;
        case {'p'}
            b(16)=b(16)+1;    
            c(i)=16;   
        case {'q'}
            b(17)=b(17)+1;  
            c(i)=17;  
        case {'r'}
            b(18)=b(18)+1;   
            c(i)=18;   
        case {'s'}
            b(19)=b(19)+1;   
            c(i)=19;   
        case {'t'}
            b(20)=b(20)+1;   
            c(i)=20;   
        case {'u'}
            b(21)=b(21)+1;    
            c(i)=21;
        case {'v'}
            b(22)=b(22)+1;    
            c(i)=22;
        case {'w'}
            b(23)=b(23)+1;    
            c(i)=23;
        case {'x'}
            b(24)=b(24)+1;   
            c(i)=24;
        case {'y'}
            b(25)=b(25)+1;    
            c(i)=25; 
        case {'z'}
            b(26)=b(26)+1;      
            c(i)=26;
    end

