function filtered_image = EV_filtering (image, window_size)
  mirrored_image = mirror_image(image, window_size);
  
  image_size = size(image);
  columns = image_size(1);
  rows = image_size(2);
  
  [minimum, maximum, img_mean, standart_deviation, variance, snr] = image_statistical_analysis(image);
  epsilon_v = standart_deviation;
  
  # ap - additional pixels
  if window_size == 3
    ap = 1;
  elseif window_size == 5
    ap = 2;
  elseif window_size == 7
    ap = 3;
  else
    error("Not allowed window size. Use 3, 5 or 7.");
  endif
  
  filtered_image = [];
  
  for i=ap + 1:columns + ap
    for j=ap + 1:rows + ap
      
      pixel_of_interest = mirrored_image(i, j);
           
      variational_series = sort(reshape(mirrored_image(i-ap:i+ap, j-ap:j+ap), window_size ^ 2, 1));
      EV = variational_series(abs(pixel_of_interest - variational_series) <= epsilon_v);
      
      EV_mean = round(mean(EV));
      
      filtered_image(end+1) = EV_mean;
      
    endfor
  endfor
  
  filtered_image = uint8(reshape(filtered_image, columns, rows)');
endfunction
