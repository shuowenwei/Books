f = @(x,y) x.*y + 1/x + 1/y;
ezsurfc(f,[.5, 1.5])
fun = @(x) f(x(1),x(2));
x0 = [.5, 1.5];
options = optimset('LargeScale','off');
options = optimset(options,'Display','iter');
[x, fval, exitflag, output] = fminunc(fun,x0,options)