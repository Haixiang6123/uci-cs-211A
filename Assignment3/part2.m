%boardSize = [10,10];

origin = [0, 0, 0];
blue_block_bottom = [0, 0, 0; 64, 0, 0; 64, 64, 0; 0, 64, 0];
blue_block_top = [0, 0, 19; 64, 0, 19; 64, 64, 19; 0, 64, 19];
red_block_bottom = blue_block_top;
red_block_top = [0, 0, 29; 64, 0, 29; 64, 64, 29; 0, 64, 29];
center_greem_block_bottom = [16, 16, 29; 48, 16, 29; 48, 48, 29; 16, 48, 29];
center_green_block_top = [16, 16, 48; 48, 16, 48; 48, 48, 48; 16, 48, 48];
corner_greem_block_bottom = [0, 48, 29; 32, 48, 29; 32, 80, 29; 0, 80, 29];
corner_green_block_top = [0, 48, 48; 32, 48, 48; 32, 80, 48; 0, 80, 48];
yellow_block_bottom = [0, 48, 48; 32, 48, 48; 32, 80, 48; 0, 80, 48];
yellow_block_top = [0, 48, 67; 32, 48, 67; 32, 80, 67; 0, 80, 67];

I = imread('./data/DSCF4177.jpg');
imageSize = [size(I,1), size(I,2)];
[imagePoints, boardSize] = detectCheckerboardPoints('./data/DSCF4177.jpg');
squareSize = 20;
worldPoints = generateCheckerboardPoints(boardSize, squareSize);

cameraParams = estimateCameraParameters(imagePoints, worldPoints, imageSize);