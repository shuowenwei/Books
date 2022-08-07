function [x]=my_newton_var2(x0)
x=x0;
s=2;
iterations = 0;
tol = 1e-15;
fprintf(' itn        x            f(x)   \n');
fprintf(' ---    -----------    ------------ \n');
fprintf('   0    %8.5e    %8.5e      \n', x, my_func(x));
while (iterations<100) & (abs(my_func(x))>tol)
    x = x - s*my_func(x)/fderiv(x);
    iterations = iterations + 1;
    fprintf('  %2d    %8.5e    %8.5e \n', iterations, x, my_func(x));
end
if iterations==100
    disp('No root found')
else
    disp(['Root = ' num2str(x,10) ' found in ' ...
        int2str(iterations) ' iterations.'])
end


% helper functions below
%%%%%%%%%%%%%%%%%%%%%%%%
function [f]=my_func(x)
f = x*(1-exp(x));

%%%%%%%%%%%%%%%%%%%%%%%%
function [value] = fderiv(x)
value = 1-exp(x)-x*exp(x);

