function y = write_dat( fname, a )
%%
  fid = fopen( fname, 'wb', 'ieee-be' ) ;
  if (fid < 0) 
     printf('read_dat():  Unable to write file %s\n', fname ) ;
  end
  [ m, n ] = size(a) ;

  count = fwrite( fid, m, 'int32', 'ieee-be' ) ;
  count = fwrite( fid, n, 'int32', 'ieee-be' ) ;
  count = fwrite( fid, a, 'double', 'ieee-be' ) ;
  fclose(fid) ;
  y = count ;
