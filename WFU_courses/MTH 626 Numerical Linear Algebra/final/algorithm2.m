function lamda=algorithm2(i)
v=[1,1,1]'/sqrt(3);
A=[2,1,1;1,3,1;1,1,4];
lamda=v'*A*v;


for k=1:i
    w=(A-lamda*eye(3))\v;
    v=w/norm(w);
    lamda=v'*A*v
end


