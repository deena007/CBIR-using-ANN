theImage = imread('F:\5th sem\btp\imageDB\eat_drinks\275009.jpg');
grayimage = rgb2gray(theImage);
lbp = extractLBPFeatures(grayimage);
testimg = transpose(lbp);
net(testimg);