%% Choose a 64x64 image and find the Discrete Fourier Transform for the image
image64 = imresize(imread("../images/CARTOON.jpg"), [64,64]);

figure;

subplot(121)
imshow(image64)

subplot(122)
imshow(log(abs(fftshift(fft2(image64)))), []);


%% Add 64 columns and rows of zeros to the right and bottom side of the original image
[rows, cols] = size(image64);

image128 = zeros(2 * rows, 2 * cols);
image128(1:rows,1:cols) = image64;

figure;

subplot(121)
imshow(image128);

subplot(122)
imshow(log(abs(fftshift(fft2(image128)))), []);

%%  Repeat this process 2
[rows, cols] = size(image128);

image256 = zeros(2 * rows, 2 * cols);
image256(1:rows,1:cols) = image128;

figure;

subplot(121)
imshow(image256);

subplot(122)
imshow(log(abs(fftshift(fft2(image256)))), []);

%% Repeat this process 2
[rows, cols] = size(image256);

image512 = zeros(2 * rows, 2 * cols);
image512(1:rows,1:cols) = image256;

figure;

subplot(121)
imshow(image512);

subplot(122)
imshow(log(abs(fftshift(fft2(image512)))), []);