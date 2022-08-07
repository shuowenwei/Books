function f = modelFit2(x, datax, datay, F, Q)
t0 = 220;
A = x(1);
phi = x(2);
a = x(3);
M = x(4);
[freq tau] = omega(F,Q,a,M);
f = datay - A*exp(-(datax-t0)/tau).*cos(freq*(datax-t0)+phi);
end