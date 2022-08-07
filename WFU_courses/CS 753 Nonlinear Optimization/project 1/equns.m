function fcns=equns(y)
x1=y(1);
x2=y(2);
fcns(1)=4*(x1^2+x2-11)*x1+2*(x1+x2^2-7);
fcns(2)=2*(x1^2+x2-11)+4*(x1+x2^2-7)*x2;
end
