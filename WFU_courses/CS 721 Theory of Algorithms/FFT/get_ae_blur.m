psf = read_dat( 'psf.dat' ) ;
ae = read_dat( 'ae.dat' ) ;
fae = fft2( ae ) ;
fpsf = fft2( fftshift(psf) ) ;
ae_blur = real( ifft2( fae .* fpsf ))  ;
write_dat( 'ae_blur.dat', ae_blur )  ;
