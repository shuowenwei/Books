clc;clear
%3.1
n=24;
[A b x]=shaw(n);
[U S V]=svd(A);
s=diag(S);
%3.2
semilogy(s,'*');
legend('singular value \sigma_i')
title('singular value of A')
min(find(s<10e-5));
for i=1:9
    subplot(3,3,i) 
    plot(U(:,i));
    title(['i=',num2str(i)])
    ylabel('U(:,i)')
end
xlabel('left singular vectors')
figure
for i=1:9
    subplot(3,3,i) 
    plot(U(:,i));
    title(['i=',num2str(i)])
    ylabel('V(:,i)')
end
%3.3
picard(U,s,b);
%3.4
r=rand(24,1);
a=norm(b)*(1e-10)/norm(r);
e=a*r;
bn=b+e;
picard(U,s,bn)
title('after adding noise to right hand side b')
%3.5
xk=[];
rlterror=[];
for k=1:24
    xnew=tsvd(U,s,V,bn,k);
    xk=[xk,xnew];
    errnew=norm(x-xnew)/norm(x);
    rlterror=[rlterror,errnew];
end
plot(x,'-*');title('exact solution x')
figure
semilogy(rlterror,'-o');
title('relative errors');xlabel('the solutions x_k')
figure
for i=1:12
    subplot(4,3,i) 
    plot(xk(:,i));
    title(['k=',num2str(i)])
end
figure 
for i=13:24
    subplot(4,3,i-12) 
    plot(xk(:,i));
    title(['k=',num2str(i)])
end
%3.6   3.6.4
aa=norm(b)*(1e-2)/norm(r);
ee=aa*r;
bnn=b+e;
picard(U,s,bnn)
title('after adding noise to right hand side b')
%3.6   3.6.5
xkk=[];
rlterrork=[];
for k=1:24
    xnew=tsvd(U,s,V,bnn,k);
    xkk=[xkk,xnew];
    errnew=norm(x-xnew)/norm(x);
    rlterrork=[rlterrork,errnew];
end
semilogy(rlterrork,'-o');
title('relative errors');xlabel('the solutions x_k')
figure
for i=1:12
    subplot(4,3,i) 
    plot(xkk(:,i));
    title(['k=',num2str(i)])
end
figure 
for i=13:24
    subplot(4,3,i-12) 
    plot(xkk(:,i));
    title(['k=',num2str(i)])
end

