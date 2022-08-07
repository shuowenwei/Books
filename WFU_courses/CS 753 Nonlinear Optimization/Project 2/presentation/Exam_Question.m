% MTH 753 
% Discrete Optimization Problem

clear
clc

% Bipartite Matching
% The maximum weight bipartite matching problem tries to pick out elements
% from A such that each row and column get only a single non-zero but the
% sum of all the chosen elements is as large as possible.

% Construct a rectangular matrix 

A1 = [4 3 7 9 7];
A2 = [2 8 5 4 0];
A3 = [0 1 6 3 5];
A4 = [6 5 1 4 3];

A  = [A1;A2;A3;A4]

% Determine the matching 

[val mi mj] = bipartite_matching(A);

% Rearrange the matrix based on the outputs of the previous problem

A5 = A(mi,mj)

% Sum the diagonal of the new matrix

Ans = sum(diag(A5))

val

% The answer should verify that the maximum weighted matching is obtained
% when using the bipartite_matching command. 