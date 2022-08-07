function [freq tau] = omega(F,Q,a,M)
    
    Fa = spline(F(:,1),F(:,2), a );
    Qa = spline(Q(:,1),Q(:,2), a );
    
    freq = Fa/M;
    tau = 2*Qa/freq;

end