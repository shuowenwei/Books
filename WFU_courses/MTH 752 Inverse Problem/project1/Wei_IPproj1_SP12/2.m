clc;clear
format compact
format long
n=[5:5:50]
condA=[];
rankA=[];
for i=1:length(n)
    [A,bb,x]=gravity(n(i),2,0,1,0.5);
    condA=[condA,cond(A)];
    rankA=[rankA,rank(A)];
end
condA;
rankA;
%p=plot(n,condA,'*')
[AX,H1,H2]=plotyy(n,condA,n,rankA,'plot');
xlabel('value of n')
title('relation between n and condition number of A')
set(get(AX(1),'Ylabel'),'String','condition number of A') 
set(get(AX(2),'Ylabel'),'String','rank of A') 
set(H1,'LineStyle','-','LineWidth',5)
set(H2,'LineStyle','--','LineWidth',5)
legend('condition #','rank','Location','NorthWest')
