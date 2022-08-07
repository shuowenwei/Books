b=[1 2 3 4];
format compact
C = gallery('circul',b)
eig(C)
c=C(:,1)
fft(c) %1-dminsional, about the eigenvalue

F4 = fft(eye(4))
F4*c

