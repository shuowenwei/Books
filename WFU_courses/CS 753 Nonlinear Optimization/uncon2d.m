f = @(x,y) x.*exp(-x.^2-y.^2)+(x.^2+y.^2)/20;
% ezsurfc(f,[-20,20])
ezsurfc(f,[-2,2])
fun = @(x) f(x(1),x(2));
% x0 = [-10; 10];
x0 = [.5; 0];
options = optimset('LargeScale','off','Display','iter');
% options = optimset(options,'Display','iter');
[x, fval, exitflag, output] = fminunc(fun,x0,options)