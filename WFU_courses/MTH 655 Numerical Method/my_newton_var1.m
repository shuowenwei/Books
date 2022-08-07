function [x]=my_newton_var1(x0)
x=x0;
iterations = 0;
tol = 1e-8;
fprintf(' itn        x            f(x)   \n');
fprintf(' ---    -----------    ------------ \n');
fprintf('   0    %8.5e    %8.5e      \n', x, my_func(x));
while (iterations<100) & (abs(my_func(x))>tol)
    x = x - my_func(x)/fderiv(x);
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
f = (x*(1-exp(x)))/(1-exp(x)-x*exp(x));

%%%%%%%%%%%%%%%%%%%%%%%%
function [value] = fderiv(x)
%value = ((x^2+2*x-2)*exp(x)+(1-2*x)*exp(2*x))/(1-exp(x)-x*exp(x))^2;
value = 1+x*(1-exp(x))*(2+x)*exp(x)/(1-exp(x)-x*exp(x))^2;

