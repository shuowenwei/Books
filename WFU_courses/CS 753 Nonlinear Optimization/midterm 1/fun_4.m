function [f,g] = fun_4(x)
k = 200;
f = 0;
for i=1:2*k
   f = f + (x(2*i)-x(2*i-1)^2)^2+(1-x(2*i-1))^2; 
end
g = ones(2*2*k,1);
if nargout>1
    for i = 1:2*k
        g(2*i-1) = -4*x(2*i-1)*(x(2*i)-x(2*i-1)^2)+x(2*i-1)-2;
        g(2*i) = 2*(x(2*i)-x(2*i-1)^2);
    end
end