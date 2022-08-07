function [explored, cycle, parent] = dfs_no_direction(mat, start)

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