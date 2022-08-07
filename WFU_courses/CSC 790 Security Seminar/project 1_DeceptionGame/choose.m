function a = choose(n,k)
set(0,'RecursionLimit',70000)
if n==k
    a=1;
    return 
end
if k==0
    a=1;
    return
end

a = choose(n-1,k-1)+choose(n-1,k);
return 

end