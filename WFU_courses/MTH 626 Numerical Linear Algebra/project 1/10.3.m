clear;clc
Z=[1 2 3; 4 5 6; 7 8 7; 4 2 3; 4 2 2];
[Q1 R1]=mgs(Z)
disp('***************************************')
[W R2]=house(Z)
[Q2]=formQ(W)
disp('***************************************')
[Q3 R3]=qr(Z,0)