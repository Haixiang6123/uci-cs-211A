images = ["../images/CARTOON.jpg", "../images/flowergray.jpg", "../images/kitty.jpg", ...
    "../images/polarcities.jpg", "../images/text.jpg" ];

filter = [0.25,0.25; 0.25,0.25];

for image = images
    
    img = im2double(imread(image));
    [height, width] = size(img); 
 
    n = log2(height);
    
    figure;
    subplot(3, 3, 1);
    imshow(img);
    title('Original image')
    
    for i= 1:n
        img = imfilter(img, filter, 'replicate', 'same');
        [height, width] = size(img); 
        
        % Half size
        img = img(1:2:height, 1:2:width);
        
        % Produce same size of original image
        biImage = imresize(img, 2^i, 'bilinear');

        subplot(3, 3, 1+i);
        imshow(biImage);
        title(sprintf('%d times filtering', 2 ^ i));
    end
end