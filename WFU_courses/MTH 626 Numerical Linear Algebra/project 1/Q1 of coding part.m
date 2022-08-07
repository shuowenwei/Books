clear;clc
e=[1 0.001 0.00001 0.00000001];
error=0.00001;%the default bias we set at the beginning
error_c=[,];
error_m=[,];

for i=1:length(e)
    I=e(i)*eye(3);
    A=[1 1 1 ; I];
    [Qc Rc]=clgs(A);
    [Qm Rm]=mgs(A);
    error_c(:,i)=[
        Qc(:,1)'*Qc(:,2)
        Qc(:,1)'*Qc(:,3)
        Qc(:,2)'*Qc(:,3)];%to get the orthogonality of Qs from clgs
    error_m(:,i)=[
        Qm(:,1)'*Qm(:,2)
        Qm(:,1)'*Qm(:,3)
        Qm(:,2)'*Qm(:,3)];%to get the orthogonality of Qs from mgs
end

disp('*****to verify the unitary of Qs from clgs and msg *****')
a=0;b=0;
for j=1:3 
    a=max(a,abs(abs(norm(Qc(:,j)))-1));
    b=max(a,abs(abs(norm(Qm(:,j)))-1));
end
if abs(a)>error
    disp('--there is some vectors are not unit in Qs from clgs')
    disp('*******************************************')
else
    disp('--All of column vectors are unit in Qs from clgs')
    disp('*******************************************')
end
if abs(b)>error
    disp('--there is some vectors are not unit in Qs from mgs')
    disp('*******************************************')
else
    disp('--All of column vectors are unit in Qs from mgs')
    disp('*******************************************')
end

disp('*****to verify the orthogonality of Qs from clgs and msg *****')
%to verify the orthogonality of Qs from clgs and msg
[aa bb]=find(error_c>error);
[cc dd]=find(error_m>error);
if ([aa bb])
    disp('1.Qs from clgs are not orthogonal');
    number=e(bb);
    str_1=sprintf('  it is not orthogonal when e = %d', number);
    disp(str_1);
    result=error_c(aa,bb);
    str_2=sprintf('  the inner product of the two nonorthogonal vector is %d, which is far from 0', result);
    disp(str_2);
else
    disp('1.Qs from clgs are orthogonal')
end
if ([cc dd])
    disp('1.Qs from clgs are not orthogonal')
    number=e(dd);
    str_3=sprintf('  it is not orthogonal when e = %d', number);
    disp(str_3);
    result=error_c(cc,dd);
    str_4=sprintf('  the inner product of these two nonorthogonal is %d, which is far away from 0', result);
    disp(str_4);
else
    disp('2.Qs from mgs are orthogonal')
end


%to plot out the result of these vectors' inner product
disp('The observations are cited insides the gragh below:')
m=[1:3]'; 
for i=1:4
    subplot(2,2,i)
    plot(m,error_c(:,i),'o-',m,error_m(:,i),'*-')
    Axis square
    legend('clgs','mgs','Location','southwest')
    title(sprintf('e = %d', double(e(i))))
    ylabel('the value of inner product')
    hold on
end
