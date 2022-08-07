function [total_cost] = dfs(map,initial,dstn_city)

[mat,start,dstn,table]=transfer2matrix(map,initial,dstn_city);
[explored, cycle, parent] = dfs_graph(mat, start);
[path]=findthepath(mat,start,dstn,parent);

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

function [path]=findthepath(mat,start,dstn,parent)
track_back=dstn;
path=[track_back];
while track_back~=start
    track_back=parent(track_back);
    path=[path,track_back];
end
path=fliplr(path);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [explored, cycle, parent]=dfs_graph(mat, start)

mat=triu(mat);
n = length(mat);
global set_point parent
set_point = zeros(1,n);
parent = zeros(1,n);
global cycle explored
cycle = 0;
explored = [];

if ~isempty(start)
  dfs_visit(start, mat);
end
for agent=1:n
  if set_point(agent)==0
    dfs_visit(agent, mat);
  end
end

function dfs_visit(agent, mat)
global set_point parent cycle  explored
set_point(agent) = 1;
explored = [explored agent];
child=[find(mat(agent,:)) find(mat(:,agent))'];
child=setdiff(child, parent(agent));
len_child=length(child);
choice=randperm(len_child);
child=child(choice);

for i=child(:)'
  switch set_point(i)
    case 0,
     parent(i)=agent;
     dfs_visit(i, mat);
   case 1, 
    cycle = 1;
  end
end
set_point(agent) = 2;

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