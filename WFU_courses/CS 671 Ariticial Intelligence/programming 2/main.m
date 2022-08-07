% main
clc;clear
format long
% 1a and 1b
input_1a='[<A,f>][<B,t>]';
enumeration_exact(input_1a);
input_1b='[<A,f>][<J,t>]';
enumeration_exact(input_1b);


% 2a and 2b
input_2a='[<J,t><E,f>][<B,t>]';
enumeration_exact(input_2a);
input_2b='[<J,t><E,f>][<M,t>]';
enumeration_exact(input_2b);


% 3a and 3b
input_3a='[<J,f><M,t>][<B,t>]';
enumeration_exact(input_3a);
input_3b='[<J,f><M,t>][<E,t>]';
enumeration_exact(input_3b);


times=[10 50 100 200 500 1000 10000];
summary=[];
for i=1:length(times)
    aa=0;bb=0;cc=0;
    for j=1:10
        a=prior_sampling(input_1b,times(i)); % change the input_?a/b
        b=rejection_sampling(input_1b,times(i));% change the input_?a/b
        c=likelihood_weighting(input_1b,times(i));% change the input_?a/b
        aa=aa+a;
        bb=bb+b;
        cc=cc+c;
    end
    new=[aa/10 bb/10 cc/10];
    summary=[summary;new];
end
summary=round(summary*10000000)/10000000

