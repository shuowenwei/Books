function [probability]=prior_sampling(input_string,times)

[evidence,n_evi,query]=string2query(input_string);
[encouter]=generate_sample(times);
[probability]=pr_spl(encouter,times,evidence,n_evi,query);
probability=round(probability*10000000)/10000000;

output=num2str(probability);
fprintf('[%s] = %s \t(by prior_sampling)\n',query,output);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [probability]=pr_spl(encouter,times,evidence,n_evi,query)

%input_string='[<A,f>][<B,t>]'
%evidence='<A,f>'
%query='<J,t>'
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

count_evid=0;
count_qry=0;
if(n_evi==1)
    for i=1:times
        if(encouter(i,evid_1)==flag_evid_1)
            count_evid=count_evid+1;
            if(encouter(i,qry)==flag_qry)
                count_qry=count_qry+1;
            end
        end
    end
else
    for i=1:times
        if(encouter(i,evid_1)==flag_evid_1 && encouter(i,evid_2)==flag_evid_2)
            count_evid=count_evid+1;
            if(encouter(i,qry)==flag_qry)
                count_qry=count_qry+1;
            end
        end
    end
end
if(count_evid==0)
    probability=0;
else
    probability=count_qry / count_evid;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [encouter]=generate_sample(times)
%times=1000;
encouter=zeros(times,5);%two dimension matrix, and 1=ture  0=false
for i=1:times
    rdnum=rand(1,5);
    if(rdnum(1)<0.001)    % encouter(:,1) is Burglary
        encouter(i,1)=1;
    end
    if(rdnum(2)<0.002)    % encouter(:,2) is Earthquake
        encouter(i,2)=1;
    end
    if(encouter(i,1)==1 && encouter(i,2)==1)    % encouter(:,3) is Alarm
        if(rdnum(3)<0.95)
            encouter(i,3)=1;
        end
    end
    if(encouter(i,1)==1 && encouter(i,2)==0)
        if(rdnum(3)<0.94)
            encouter(i,3)=1;
        end
    end
    if(encouter(i,1)==0 && encouter(i,2)==1)
        if(rdnum(3)<0.29)
            encouter(i,3)=1;
        end
    end
    if(encouter(i,1)==0 && encouter(i,2)==0)
        if(rdnum(3)<0.001)
            encouter(i,3)=1;
        end
    end    
    if(encouter(i,3)==1)    % encouter(:,4) is JohnCalls
        if(rdnum(4)<0.9)
            encouter(i,4)=1;
        end
    else
        if(rdnum(4)<0.05)
            encouter(i,4)=1;
        end
    end
    if(encouter(i,3)==1)    % encouter(:,5) is MaryCalls   
        if(rdnum(5)<0.7)
            encouter(i,5)=1;
        end
    else
        if(rdnum(5)<0.01)
            encouter(i,5)=1;
        end
    end
end% end of 'for i=1:times'

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
