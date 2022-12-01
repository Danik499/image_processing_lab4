function image_with_noise = additive_gaussian_noise(img, std_fraction) 
  pkg load communications;
  
  image_arr_length = length(img(:));
  
  columns = length(img);
  rows = image_arr_length / columns;

  image_arr = [];
  for i=1:image_arr_length
    image_arr(i) = img(i);
  endfor
  
  img = image_arr;
  
  [minimum, maximum, mean, standart_deviation, variance, snr] = image_statistical_analysis(img);
  
  standart_deviation *= std_fraction;
  
  noise = [];
  for i=1:image_arr_length
    r = rand(1);
    fi = rand(1) * 2;
    z = sqrt(-2 * log(r)) * sin(2 * pi * fi);
    noise(i) = mean + z * standart_deviation;
  endfor

  image_with_noise = [];
  for i=1:image_arr_length
    image_with_noise(i) = img(i) + noise(i) - mean;
  endfor
  
  image_with_noise = uint8(reshape(image_with_noise, columns, rows));
endfunction
