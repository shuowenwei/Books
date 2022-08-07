function [probability]=likelihood_weighting(input_string,times)

[evidence,n_evi,query]=string2query(input_string);
[encouter,evid,flag_evid]=lkhd_wgt(times,evidence,n_evi);
%evid is the position of evidence   flag_evid is corresponding true/false value
[weight,num_nonevid]=get_weight(evid,n_evi,flag_evid);

[probability]=get_query(encouter,times,query,weight,num_nonevid);
probability=round(probability*10000000)/10000000;

output=num2str(probability);
fprintf('[%s] = %s \t(bylikelihood_weighting_sampling)\n',query,output);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [probability]=get_query(encouter,times,query,weight,num_nonevid)
%input_string='[<A,f>][<B,t>]'
%evidence='<A,f>'
%query='<J,t>'
weight_count=weight;
weight_count=[weight_count, zeros(num_nonevid,1)];
for i=1:num_nonevid
    for j=1:times
       a=length(find(weight_count(i,1:5)==encouter(j,:)>0));
       if(a==5)
           weight_count(i,7)=weight_count(i,7)+1;
       end
    end
end
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

count_evid=sum(weight_count(:,6).*weight_count(:,7));
count_qry=0;
for i=1:num_nonevid
    if(weight_count(i,qry)==flag_qry)
        count_qry=count_qry+weight_count(i,6)*weight_count(i,7);
    end
end

if(count_evid==0)
    probability=0;
else
    probability=count_qry / count_evid;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [weight,num_nonevid]=get_weight(evid,n_evi,flag_evid)

num_nonevid=2^(5-n_evi);
weight=zeros(num_nonevid,5);%size(weight)= 16 5
%evid    size(weight)
if(n_evi==1)
    for i=0:(num_nonevid-1)
        weight(i+1,evid)=flag_evid;
        a=dec2bin(i);
        a=fliplr(a);
        for j=1:length(a)
            position=5-j+1;
            if(position>evid)
                weight(i+1,position)=str2double(a(j));
            else
                weight(i+1,position-1)=str2double(a(j));
            end
        end
        %i+1
        %weight(i+1,:)
    end
else
    vacuum=[];
    for column=5:-1:1
        if (column~=evid(1) && column~=evid(2))
            vacuum=[vacuum column];
        end
    end
    for i=0:(num_nonevid-1)
        weight(i+1,evid(1))=flag_evid(1);
        weight(i+1,evid(2))=flag_evid(2);
        a=dec2bin(i);
        a=fliplr(a);
        for j=1:length(a)
            weight(i+1,vacuum(j))=str2double(a(j));
        end
    end
end

w=ones(num_nonevid,1); % size(weight)=16 6
weight=[weight,w];%weight
if(n_evi==1)
    for i=1:num_nonevid
        if(evid==1)
            if(flag_evid==1)
                weight(i,6)=weight(i,6)*0.001;
            else
                weight(i,6)=weight(i,6)*0.999;
            end
        end
        if(evid==2)
            if(flag_evid==1)
                weight(i,6)=weight(i,6)*0.002;
            else
                weight(i,6)=weight(i,6)*0.998;
            end
        end
        if(evid==3)
            if(flag_evid==1)
                if(weight(i,1)==1 && weight(i,2)==1)
                    weight(i,6)=weight(i,6)*0.95;
                end
                if(weight(i,1)==1 && weight(i,2)==0)
                    weight(i,6)=weight(i,6)*0.94;
                end
                if(weight(i,1)==0 && weight(i,2)==1)
                    weight(i,6)=weight(i,6)*0.29;
                end
                if(weight(i,1)==0 && weight(i,2)==0)
                    weight(i,6)=weight(i,6)*0.001;
                end
            else
                if(weight(i,1)==1 && weight(i,2)==1)
                    weight(i,6)=weight(i,6)*0.05;
                end
                if(weight(i,1)==1 && weight(i,2)==0)
                    weight(i,6)=weight(i,6)*0.06;
                end
                if(weight(i,1)==0 && weight(i,2)==1)
                    weight(i,6)=weight(i,6)*0.71;
                end
                if(weight(i,1)==0 && weight(i,2)==0)
                    weight(i,6)=weight(i,6)*0.999;
                end
            end
        end
        if(evid==4)
            if(flag_evid==1)
                if(weight(i,3)==1)
                    weight(i,6)=weight(i,6)*0.9;
                else
                    weight(i,6)=weight(i,6)*0.05;
                end
            else
                if(weight(i,3)==1)
                    weight(i,6)=weight(i,6)*0.1;
                else
                    weight(i,6)=weight(i,6)*0.95;
                end
            end
        end
        if(evid==5)
            if(flag_evid==1)
                if(weight(i,3)==1)
                    weight(i,6)=weight(i,6)*0.7;
                else
                    weight(i,6)=weight(i,6)*0.01;
                end
            else
                if(weight(i,3)==1)
                    weight(i,6)=weight(i,6)*0.3;
                else
                    weight(i,6)=weight(i,6)*0.99;
                end
            end
        end
    end
else
    for k=1:2
    for i=1:num_nonevid% the 1st evidence
        if(evid(k)==1)
            if(flag_evid(k)==1)
                weight(i,6)=weight(i,6)*0.001;
            else
                weight(i,6)=weight(i,6)*0.999;
            end
        end
        if(evid(k)==2)
            if(flag_evid(k)==1)
                weight(i,6)=weight(i,6)*0.002;
            else
                weight(i,6)=weight(i,6)*0.998;
            end
        end
        if(evid(k)==3)
            if(flag_evid(k)==1)
                if(weight(i,1)==1 && weight(i,2)==1)
                    weight(i,6)=weight(i,6)*0.95;
                end
                if(weight(i,1)==1 && weight(i,2)==0)
                    weight(i,6)=weight(i,6)*0.94;
                end
                if(weight(i,1)==0 && weight(i,2)==1)
                    weight(i,6)=weight(i,6)*0.29;
                end
                if(weight(i,1)==0 && weight(i,2)==0)
                    weight(i,6)=weight(i,6)*0.001;
                end
            else
                if(weight(i,1)==1 && weight(i,2)==1)
                    weight(i,6)=weight(i,6)*0.05;
                end
                if(weight(i,1)==1 && weight(i,2)==0)
                    weight(i,6)=weight(i,6)*0.06;
                end
                if(weight(i,1)==0 && weight(i,2)==1)
                    weight(i,6)=weight(i,6)*0.71;
                end
                if(weight(i,1)==0 && weight(i,2)==0)
                    weight(i,6)=weight(i,6)*0.999;
                end
            end
        end
        if(evid(k)==4)
            if(flag_evid(k)==1)
                if(weight(i,3)==1)
                    weight(i,6)=weight(i,6)*0.9;
                else
                    weight(i,6)=weight(i,6)*0.05;
                end
            else
                if(weight(i,3)==1)
                    weight(i,6)=weight(i,6)*0.1;
                else
                    weight(i,6)=weight(i,6)*0.95;
                end
            end
        end
        if(evid(k)==5)
            if(flag_evid(k)==1)
                if(weight(i,3)==1)
                    weight(i,6)=weight(i,6)*0.7;
                else
                    weight(i,6)=weight(i,6)*0.01;
                end
            else
                if(weight(i,3)==1)
                    weight(i,6)=weight(i,6)*0.3;
                else
                    weight(i,6)=weight(i,6)*0.99;
                end
            end
        end
    end
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [encouter,evid,flag_evid]=lkhd_wgt(times,evidence,n_evi)
%times=1000;
encouter=zeros(times,5);%two dimension matrix, and 1=ture  0=false
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
if(n_evi==1)
    for i=1:times
        rdnum=rand(1,5);
        encouter(i,evid_1)=flag_evid_1;
        if(rdnum(1)<0.001 && evid_1~=1)   % encouter(:,1) is Burglary
            encouter(i,1)=1;
        end
        if(rdnum(2)<0.002 && evid_1~=2)    % encouter(:,2) is Earthquake
        encouter(i,2)=1;
        end
        if(encouter(i,1)==1 && encouter(i,2)==1 && evid_1~=3)    % encouter(:,3) is Alarm
            if(rdnum(3)<0.95)
                encouter(i,3)=1;
            end
        end
        if(encouter(i,1)==1 && encouter(i,2)==0 && evid_1~=3)
            if(rdnum(3)<0.94)
                encouter(i,3)=1;
            end
        end
        if(encouter(i,1)==0 && encouter(i,2)==1 && evid_1~=3)
            if(rdnum(3)<0.29)
                encouter(i,3)=1;
            end
        end
        if(encouter(i,1)==0 && encouter(i,2)==0 && evid_1~=3)
            if(rdnum(3)<0.001)
                encouter(i,3)=1;
            end
        end
        if(encouter(i,3)==1  && evid_1~=4)    % encouter(:,4) is JohnCalls
            if(rdnum(4)<0.9)
                encouter(i,4)=1;
            end
        else
            if(rdnum(4)<0.05)
                encouter(i,4)=1;
            end
        end
        if(encouter(i,3)==1 && evid_1~=5)    % encouter(:,5) is MaryCalls
            if(rdnum(5)<0.7)
                encouter(i,5)=1;
            end
        else
            if(rdnum(5)<0.01)
                encouter(i,5)=1;
            end
        end
    end% end of 'for i=1:times'
else
    for i=1:times
        rdnum=rand(1,5);
        encouter(i,evid_1)=flag_evid_1;
        encouter(i,evid_2)=flag_evid_2;
        if(rdnum(1)<0.001 && evid_1~=1 && evid_2~=1)   % encouter(:,1) is Burglary
            encouter(i,1)=1;
        end
        if(rdnum(2)<0.002 && evid_1~=2 && evid_2~=2)    % encouter(:,2) is Earthquake
        encouter(i,2)=1;
        end
        if(encouter(i,1)==1 && encouter(i,2)==1 && evid_1~=3 && evid_2~=3)    % encouter(:,3) is Alarm
            if(rdnum(3)<0.95)
                encouter(i,3)=1;
            end
        end
        if(encouter(i,1)==1 && encouter(i,2)==0 && evid_1~=3 && evid_2~=3)
            if(rdnum(3)<0.94)
                encouter(i,3)=1;
            end
        end
        if(encouter(i,1)==0 && encouter(i,2)==1 && evid_1~=3 && evid_2~=3)
            if(rdnum(3)<0.29)
                encouter(i,3)=1;
            end
        end
        if(encouter(i,1)==0 && encouter(i,2)==0 && evid_1~=3 && evid_2~=3)
            if(rdnum(3)<0.001)
                encouter(i,3)=1;
            end
        end
        if(encouter(i,3)==1  && evid_1~=4 && evid_2~=4)    % encouter(:,4) is JohnCalls
            if(rdnum(4)<0.9)
                encouter(i,4)=1;
            end
        else
            if(rdnum(4)<0.05)
                encouter(i,4)=1;
            end
        end
        if(encouter(i,3)==1 && evid_1~=5 && evid_2~=5)    % encouter(:,5) is MaryCalls
            if(rdnum(5)<0.7)
                encouter(i,5)=1;
            end
        else
            if(rdnum(5)<0.01)
                encouter(i,5)=1;
            end
        end
    end% end of 'for i=1:times'
end


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
