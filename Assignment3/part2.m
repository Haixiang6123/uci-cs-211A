%boardSize = [10,10];
I = imread('./data/DSCF4177.jpg');
imageSize = [size(I,1), size(I,2)];
[imagePoints, boardSize] = detectCheckerboardPoints('./data/DSCF4177.jpg');
squareSize = 20;
worldPoints = generateCheckerboardPoints(boardSize, squareSize);

cameraParams = estimateCameraParameters(imagePoints, worldPoints, imageSize);