function [xc] = conjgradfft(A,b,x0,k)
% A is the symmetric positive definite (Toeplitz) matrix
% b is the right-hand-side
% x0 is the initial approximation to x
% xc is the computed approximate solution
   n=length(A);
   x = x0;
   %%
   v=A(1,2:30)';
   v=flipud(v);
   c = [A(1:30,1)
        0
        v];
   xx=[x;zeros(n,1)];
   bcfft=ifft(fft(c).*fft(xx));
   bc=bcfft(1:n);
   r = b - bc;%   r = b - A*x;
   %%
   w = -r;
   %%
   ww=[w;zeros(n,1)];
   bwfft=ifft(fft(c).*fft(ww));
   z=bwfft(1:n);%   z = A*w;
   %%
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
      %%
      ww2=[w;zeros(n,1)];
      bw2fft=ifft(fft(c).*fft(ww2));
      z=bw2fft(1:n);%   z = A*w;
      %%
      a = (r'*w)/(w'*z);
      x = x + a*w;
   end
 xc = x;
end


