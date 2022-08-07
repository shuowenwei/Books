function Q=formQ(W)
%[W R]=house(A);
[m n]=size(W);
Q=eye(m);
lnth=0;
zz=[];

for i=1:n
    v=W(i:m,i);
    lnth=length(v);
    zz=zeros(i-1,lnth);
    I=eye(lnth);
    F=I-2*v*v'/(v'*v);
    II=eye(i-1);
    if length(II)==0
        QQ=F;
    else
        QQ=[II zz;zz' F];
    end    
    Q=QQ*Q;
end
Q=Q';

