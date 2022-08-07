function lamda=algorithm1(i)
format long
v=[1,1,1]'/sqrt(3);
A=[2,1,1;1,3,1;1,1,4];
miu=5;
for k=1:i
    w=inv(A-miu*eye(3))*v;
    v=w/norm(w);
    lamda=v'*A*v;
end

