function [total_cost] = bfs(map,initial,dstn_city)

[mat,start,dstn,table]=transfer2matrix(map,initial,dstn_city);
[path]=getthepath(mat,start,dstn,table);

for i=1:length(path)
    s=table(path(i));
    disp(s)
end
total_cost=0;
if length(path)==2
    total_cost=mat(path(2),path(2));
else
    for i=1:(length(path)-1)
        total_cost=total_cost+mat(path(i),path(i+1));
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [path]=getthepath(mat,start,dstn,table)

n=length(table);
path=[];
agent=start;
parent=zeros(n);
frontier=find(mat(agent,:)>0);
parent(agent,1:length(frontier))=frontier;
explored=[agent];
explored=[explored,frontier];

while (agent~=dstn)
    if isempty(frontier)
        disp('Failure! the initial point is not connected to anyone!');
        break;
    end
    new_frontier=[];
    if ~isempty(find(frontier==dstn))
        agent=frontier(find(frontier==dstn));
        break;
    end
    
    for i=1:length(frontier)
        ff=frontier(i);
        ff_chide=find(mat(ff,:)>0);
        commom=intersect(explored,ff_chide);
        
        for k=1:length(commom)
            ff_chide=ff_chide(find(ff_chide~=commom(k)));
        end
        
        parent(ff,1:length(ff_chide))=ff_chide;
        
        if ~isempty(find(ff_chide==dstn))
            agent=ff_chide(find(ff_chide==dstn));
            break;
        else
            explored=[explored,ff_chide];
        end
        new_frontier=[new_frontier,ff_chide];
    end
    
    frontier=[];
    frontier=new_frontier;
end

track_back=agent;
while track_back~=start
    path=[path,track_back];
    [p q]=find(parent==track_back);
    track_back=p;
end
path=[path,track_back];
path=fliplr(path);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [mat,start,dstn,table]=transfer2matrix(map,initial,dstn_city)
%clc;clear
%initial='Arad';
%dstn_city='Bucharest';
%map=importdata('map.txt');%struct 
b=map;
bb=b.data;%double
bbb=b.textdata;%cell(string)
[m n]=size(bbb);
table=[bbb(1)];%represent all the cities with numbers
for i=2:m*2
    dec=ismember(table,char(bbb(i)));
    if (sum(dec)==0)
        table=[table;bbb(i)];
    end
end

start=find(ismember(table, initial)==1);%number for start city
dstn=find(ismember(table, dstn_city)==1);%number for destination

map=zeros(length(table));

newtable=[];%transfer struct b to pure number matrix
for i=1:m
    newtable(i,1)=find(ismember(table, bbb(i,1))==1);
    newtable(i,2)=find(ismember(table, bbb(i,2))==1);
    newtable(i,3)=bb(i);
end

mat=[];
for i=1:m
    mat(newtable(i,1),newtable(i,2))=newtable(i,3);
    mat(newtable(i,2),newtable(i,1))=newtable(i,3);
end