function y = read_dat( fname )
%%
  fid = fopen( fname, 'rb', 'ieee-be' ) ;
  if (fid < 0) 
     printf('read_dat():  Unable to read file %s\n', fname ) ;
     y = 0 ;
     return ;
  end
  [ v , count ] = fread( fid, 2, 'int32', 0, 'ieee-be' ) ;
  m = v(1) ;
  n = v(2) ;
  [ a, count ] = fread( fid, m*n, 'double', 0, 'ieee-be' ) ;
  fclose(fid) ;
  b = reshape( a, m, n ) ;
  y = b ;
