function [xc] = conjgrad(A,b,x0,k)
% A is the symmetric positive definite (Toeplitz) matrix
% b is the right-hand-side
% x0 is the initial approximation to x
% xc is the computed approximate solution
   x = x0;
   r = b - A*x;
   w = -r;
   z = A*w;
   a = (r'*w)/(w'*z);
   x = x + a*w;
   t = 0;
 
   for i = 1:k
      r = r - a*z;
  %   if( norm(r) < 1e-6 )
   %      break;
   %   end
      t = (r'*z)/(w'*z);
      w = -r + t*w;
      z = A*w;
      a = (r'*w)/(w'*z);
      x = x + a*w;
   end
 xc = x;
end
