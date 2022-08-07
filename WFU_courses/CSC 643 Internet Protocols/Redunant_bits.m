function [] = Redunant_bits(n)

m = 0;
r = 1; 
x = [];
y = [];
while( m+r <= n)
    r = get_r(m,r);
    y = [y; r];
    x = [x; m+r];
    m = m+1;
end
plot(x, y, '-');
xlabel('m+r');ylabel('r');
title('Problem 11, for HW 1 of CSC 643');
end

function [r_return] = get_r(m,r)
if(2^r >= m+r+1)
    r_return = r;
else
    r_return = r+1;
end
end
    
