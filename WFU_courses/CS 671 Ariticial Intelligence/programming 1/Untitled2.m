clc;clear
initial='Dobreta';
dstn_city='Fagaras';
map=importdata('map.txt');

[total_cost] = bfs(map,initial,dstn_city)

clc;clear
initial='Dobreta';
dstn_city='Fagaras';
map=importdata('map.txt');

[total_cost] = dfs(map,initial,dstn_city)

clc;clear
initial='Dobreta';
dstn_city='Fagaras';
map=importdata('map.txt');

[total_cost] = iterative_dfs(map,initial,dstn_city)