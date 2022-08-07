ae = read_dat( 'ae.dat' ) ;
figure(1) ;
imagesc( ae ) ;
colormap(gray) ; axis square ;
#
psf = read_dat( 'psf.dat' ) ;
figure(2) ;
imagesc(psf) ;
colormap(gray) ; axis square ;
#
ae_blur = read_dat( 'ae_blur.dat' ) ;
figure(3) ;
imagesc( ae_blur ) ;
colormap(gray) ; axis square ;
#
