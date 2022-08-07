% midterm 

% 2
clc;clear
H=hilb(15);
A=H(:,1:13);
b=A*ones(13,1);
cond(H)
cond(A)

x=(A'*A)\(A'*b)
x0=ones(13,1);
norm(x-x0)/norm(x0)

relative_err=[];
for lamda=0:0.01:0.99 
    x=(A'*A+lamda*eye(13))\(A'*b);
    abs_err=norm(x-x0);
    new_rel_err=abs_err/norm(x0);
    relative_err=[relative_err new_rel_err];
end
lamda=0:0.01:0.99;
plot(lamda,relative_err,'r-*');
title('lamda-Relative Error');
xlabel('lamda');ylabel('Relative Error')
position=find(relative_err==min(relative_err))
lamda(position)
x_best=(A'*A+0.01*eye(13))\(A'*b)


format compact 
format long
index=1:15;
lamda_index=10.^(-index);
relative_err=[];
for i=1:length(lamda_index)
    lamda=lamda_index(i);
    x=(A'*A+lamda*eye(13))\(A'*b);
    abs_err=norm(x-x0);
    new_rel_err=abs_err/norm(x0);
    relative_err=[relative_err new_rel_err];
end
plot(index,relative_err,'r-*');
title('lamda-Relative Error');
xlabel('lamda=1e-index');ylabel('Relative Error')
min(relative_err)
position=find(relative_err==min(relative_err))
lamda_index(position)
x_best=(A'*A+lamda_index(position)*eye(13))\(A'*b)



% 3 a

clc;clear
f = @(x1,x2) 100.*(x2-x1.^2).^2+(1-x1).^2;
ezsurfc(f,[-3,3],[-6,10]);
fun = @(x) f(x(1),x(2));
options = optimset('LargeScale','off','Display','iter','TolFun',1e-8);
x0 = [0 2]; 
x0 = [0 1];
x0 = [3 3];
[x, fval, exitflag, output, grad, hessian] = fminunc(fun,x0,options)

% 3 b
clc;clear
x0 = [0 2]; 
x0 = [0 1];
x0 = [2 2];
options = optimset('LargeScale','off','GradObj','on','GradObj','on','Display','iter','TolFun',1e-8); 
[x, fval, exitflag, output, grad, hessian] = fminunc(@fun_3b,x0,options)


% 3 c
clc;clear
f = @(x1,x2) 100.*(x2-x1.^2).^2+(1-x1).^2;
fun = @(x) f(x(1),x(2));
x0 = [0 1]; 
options = optimset('Display','iter','TolFun',1e-8); 
[x fval,exitflag,output] = fminsearch(fun,x0,options)


% 4
clc;clear
x0=-ones(1,800);
options = optimset('LargeScale','on','GradObj','on','Display','iter','TolFun',1e-8); 
[x, fval] = fminunc(@fun_4,x0);




