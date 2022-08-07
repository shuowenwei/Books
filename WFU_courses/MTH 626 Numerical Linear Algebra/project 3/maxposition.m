function x=maxposition(vector)

%get the position of the number with the max absolute value in a vector

n=length(vector);
target=max(abs(vector));
for i=1:n
    if abs(vector(i))==target;
    x=i;
    end
end
