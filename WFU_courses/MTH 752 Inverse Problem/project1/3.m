clc;clear
format compact
format long
condA=[];
rankA=[];
d=[0.1:0.1:1];
for i=1:length(d)
    [A,bb,x]=gravity(32,2,0,1,d(i));
    condA=[condA,cond(A)];
    rankA=[rankA,rank(A)];
end
[AX,H1,H2]=plotyy(d,rankA,d,condA,'plot');
xlabel('value of depth d')
title('relation between condition number of A and depth d  ')
set(get(AX(1),'Ylabel'),'String','rank of A') 
set(get(AX(2),'Ylabel'),'String','condition number of A') 
set(H1,'LineStyle','--','MarkerEdgeColor','b','LineWidth',5)
set(H2,'LineStyle','-','MarkerEdgeColor','r','LineWidth',5)
legend('rank(A)','condition #','Location','NorthEast')
