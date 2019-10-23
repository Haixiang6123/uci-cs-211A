images = ["../images/CARTOON.jpg", "../images/flowergray.jpg", "../images/kitty.jpg", ...
    "../images/polarcities.jpg", "../images/text.jpg" ];

filter = [0.25,0.25; 0.25,0.25];

for image = images
    
    img = imread(image);
    [height, width] = size(img); 
    side = log2(height);
    
    figure;
    
    for i= 1:side
        filteredImg = imfilter(img, filter, 'replicate', 'same');
        [height, width] = size(filteredImg); 
        
        % Half size
        filteredImg = filteredImg(1:2:height, 1:2:width);
        
        % Produce same size of original image
        biImage = imresize(filteredImg, 2, 'bilinear');
        
        % Laplacian pyramid
        pyramid = biImage - img;
        
        img = filteredImg;
        subplot(4, 2, i);
        imshow(pyramid);
        title(sprintf('Laplacian Pyramid %d', i));
    end
end