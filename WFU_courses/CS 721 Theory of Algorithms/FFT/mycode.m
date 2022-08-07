clc;clear
psf = read_dat( 'psf.dat' ) ;% this is the noice, h
ae = read_dat( 'ae.dat' ) ;% this is the true image, x 
%figure(1) ;
%imagesc(ae) ; colormap(gray) ; axis square ;
fae = fft2( ae ) ; %this is X
fpsf = fft2( fftshift(psf) ) ; % this is H
G = fae .* fpsf; 

g = real( ifft2( G ) ) ;

%gg = ifft2( G )  ;
%norm(gg-g)
%return ;
figure(2) ;
imagesc( g ) ;title('the blurred image');
colormap(gray) ; axis square ;


GG = fft2( g ) ;
x=real(ifft2(GG ./ fpsf));
%xx=ifft2(G ./ fae);
figure(3)
imagesc(x) ;title('without Tikhonov');
colormap(gray) ; axis square ;


alfa = 1e-7;
%alfa = 0.001 ;
X_T=(fpsf' .* GG) ./ (fpsf' .* fpsf + alfa);
x_T = real( ifft2( X_T ))  ;
figure(4)
imagesc(x_T);title('after Tikhonov');
colormap(gray) ; axis square ;

