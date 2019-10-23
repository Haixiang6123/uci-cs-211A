img = double(imread('../images/flowergray.jpg'));
A = imresize(img,[100,100]);
%% a
x = sort(A(:));
figure("Name", "Vector x");
plot(x)

%% b
figure("Name", "Histogram of A?s intensities");
histogram(A,32);

%% c
t = 100;
binaryImage = imbinarize(A, t);
figure("Name", "Binary image A");
imshow(binaryImage)

%% d
meanIntensity = mean(mean(A));
Aprime = A - meanIntensity;
Aprime(Aprime < 0) = 0;

%% e
y = x(1:8);
newY = reshape(y,[4,2]);

%% f
indexs = (1:2:99);
downImage = A(indexs,indexs);

%% g

filter1 = fspecial('gaussian',[3,3], 1);
image1 =  imfilter(A, filter1);
filter2 = fspecial('gaussian',[3,4], 10);
image2 =  imfilter(A, filter2);
filter3 = fspecial('gaussian',[4,3], 10);
image3 =  imfilter(A, filter3);

figure("Name", "Gaussian filter");

subplot(131)
imshow(image1,[])
title("Filter size [3,3], sigma 1");

subplot(132)
imshow(image2,[])
title("Filter size [3,4], sigma 5");

subplot(133)
imshow(image3,[])
title("Filter size [4,3], sigma 10");

%% h
% No changes, they are same
figure("Name", "Conv vs imfilter");

subplot(121)
imshow(image1,[])
title("Using imfilter");

subplot(122)
imshow(conImage1,[])
title("Using conv2");