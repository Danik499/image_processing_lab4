initial_img = imread("./Boat.png");

noised_image = additive_gaussian_noise(initial_img, 0.3);
imwrite(noised_image, "./noised.png");

filtered_image = EV_filtering(noised_image, 3);

imwrite(filtered_image, "./result.png");

