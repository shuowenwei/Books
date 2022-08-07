function f = modelFit(x, t, F, Q)
t0 = 220;
A = x(1);
phi = x(2);
a = x(3);
M = x(4);
[freq tau] = omega(F,Q,a,M);
f = A*exp(-(t-t0)/tau).*cos(freq*(t-t0)+phi);
end