% 5.3
clear;clc
A=[-2 11;-10 5];
U=[-0.7071 0.7071; -0.7071 -0.7071];
V=[0.6 0.8; -0.8 0.6];
S=[200^0.5 0; 0 50^0.5];
inv_S=[1/200^0.5 0; 0 1/50^0.5];
inv_A=V*inv_S*U';

% 5.3 b
t=[0:0.0001:2*pi];
subplot(1,2,1),plot(sin(t),cos(t));
title('Unit Ball')
Axis square
new=A*[cos(t);sin(t)];
subplot(1,2,2),plot(new(1,:),new(2,:))
Axis square
title('Image of Unit Ball Under A')

