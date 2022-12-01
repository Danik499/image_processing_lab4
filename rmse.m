function rmse = rmse(I1, I2)
  img_size = size(I1);
  columns = img_size(1);
  rows = img_size(2);
  
  squaredErrorImage = (double(I1) - double(I2)) .^ 2;
  mse = sum(sum(squaredErrorImage)) / (rows * columns);
  
  rmse = sqrt(mse);
endfunction
