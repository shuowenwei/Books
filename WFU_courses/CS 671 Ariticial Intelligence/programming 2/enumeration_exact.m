function []=enumeration_exact(input_string)

format compact;
[evidence,n_evi,query]=string2query(input_string);
[evid,flag_evid,qry,flag_qry]=get_member(evidence,n_evi,query);
n_var=5;
[table]=get_table(n_var);

[p_down]=adjoint_probalility(table,evid,flag_evid);
all_member=[evid qry];
flag=[flag_evid flag_qry];
[p_up]=adjoint_probalility(table,all_member,flag);

probability = p_up / p_down;
probability=round(probability*10000000)/10000000;

output=num2str(probability);

fprintf('[%s] = %s \t(the exact value)\n',query,output);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [probability]=adjoint_probalility(table,member,flag)

probability=0;
n=length(flag);
if(n==1)    
    for k=1:32
        if(table(k,member(1))==flag(1))
            probability=probability+table(k,6);
        end
    end
end
if(n==2)    
    for k=1:32
        if(table(k,member(1))==flag(1) && table(k,member(2))==flag(2))
            probability=probability+table(k,6);
        end
    end
end
if(n==3)
    for k=1:32
        if(table(k,member(1))==flag(1) && table(k,member(2))==flag(2) && table(k,member(3))==flag(3))
            probability=probability+table(k,6);
        end
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [table]=get_table(n_var)

n=2^n_var;
adjoint=zeros(n,5);
%{
B=[0.001 0.999];
E=[0.002 0.998];
A=[ 0.950 0.050 
    0.940 0.060
    0.290 0.710
    0.001 0.999];
J=[ 0.90 0.10
    0.05 0.95];
M=[ 0.70 0.30
    0.01 0.99];
%}
for i=0:(n-1)
    a=dec2bin(i);
    a=fliplr(a);
    b=length(a);
    for j=1:b
        position=5-j+1;
        adjoint(i+1,position)=str2double(a(j));
    end
end
table=[adjoint, ones(32,1)];
for i=1:n
    if(table(i,3)==1) % for P(A=t|B,E)
        if(table(i,1)==1 && table(i,2)==1)
            table(i,6)=table(i,6)*0.001*0.002*0.95;
        end
        if(table(i,1)==1 && table(i,2)==0)
            table(i,6)=table(i,6)*0.001*0.998*0.94;
        end
        if(table(i,1)==0 && table(i,2)==1)
            table(i,6)=table(i,6)*0.999*0.002*0.29;
        end
        if(table(i,1)==0 && table(i,2)==0)
            table(i,6)=table(i,6)*0.999*0.998*0.001;
        end
        if(table(i,4)==1)% for P(J|A=t) P(M|A=t)
            table(i,6)=table(i,6)*0.9;
        else
            table(i,6)=table(i,6)*0.1;
        end
        if(table(i,5)==1)
            table(i,6)=table(i,6)*0.7;
        else
            table(i,6)=table(i,6)*0.3;
        end
    else
        if(table(i,1)==1 && table(i,2)==1)% for P(A=f|B,E)
            table(i,6)=table(i,6)*0.001*0.002*0.05;
        end
        if(table(i,1)==1 && table(i,2)==0)
            table(i,6)=table(i,6)*0.001*0.998*0.06;
        end
        if(table(i,1)==0 && table(i,2)==1)
            table(i,6)=table(i,6)*0.999*0.002*0.71;
        end
        if(table(i,1)==0 && table(i,2)==0)
            table(i,6)=table(i,6)*0.999*0.998*0.999;
        end
        if(table(i,4)==1)% for P(J|A=f) P(M|A=f)
            table(i,6)=table(i,6)*0.05;
        else
            table(i,6)=table(i,6)*0.95;
        end
        if(table(i,5)==1)
            table(i,6)=table(i,6)*0.01;
        else
            table(i,6)=table(i,6)*0.99;
        end
    end
end
%find(table(:,6)>0.5)
%sitth=sum(table(:,6));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [evid,flag_evid,qry,flag_qry]=get_member(evidence,n_evi,query)

switch query(2)% for the query
    case {'B'}
        qry=1;
    case {'E'}
        qry=2;
    case {'A'}
        qry=3;
    case {'J'}
        qry=4; 
    otherwise
        qry=5;
end
if(query(4)=='t')
    flag_qry=1;
else
    flag_qry=0;
end

switch evidence(2)% for the evidence
    case {'B'}
        evid_1=1;
    case {'E'}
        evid_1=2;
    case {'A'}
        evid_1=3;
    case {'J'}
        evid_1=4; 
    otherwise
        evid_1=5;
end
if(evidence(4)=='t')
    flag_evid_1=1;
else
    flag_evid_1=0;
end
if (n_evi==2)% if there are two evidence
    switch evidence(7)
        case {'B'}
            evid_2=1;
        case {'E'}
            evid_2=2;
        case {'A'}
            evid_2=3;
        case {'J'}
            evid_2=4; 
        otherwise
            evid_2=5;
    end
    if(evidence(9)=='t')
        flag_evid_2=1;
    else
        flag_evid_2=0;
    end
else
   evid_2=[];
   flag_evid_2=[];
end
evid=[evid_1,evid_2];
flag_evid=[flag_evid_1 flag_evid_2];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [evidence,n_evi,query]=string2query(input_string)

%input_string='[<A,f>][<J,f>]'
ips=input_string;
n=length(input_string);
split=0;n_evi=0;
if(~isempty(find(ips==' ')))
    fprintf('Error!! There are spaces in the input string!\n\n');
    return
end
for i=1:(n-1)
    if(ips(i)==']')
        split=i;
        continue;
    end
    if(ips(i)=='>')
        if(split==0)
            n_evi=n_evi+1;
        end
    end
end
evidence=ips(2:split-1);
query=ips(split+2:n-1);
