  %I = imread('cameraman.tif');
  A = imread('F:\BTP\dataset\obj_bus\581099.jpg');
  I = rgb2gray(A);
   corners = detectHarrisFeatures(I);
  [features, valid_corners] = extractFeatures(I, corners);
  figure; imshow(I); hold on
   plot(valid_corners);
   
 points = detectSURFFeatures(I);
    [features, valid_points] = extractFeatures(I, points);
    
    figure; imshow(I); hold on;
    plot(valid_points.selectStrongest(30),'showOrientation',true);
    
     regions = detectMSERFeatures(I);
    [features, valid_points] = extractFeatures(I,regions,'Upright',true);
    
    figure; imshow(I); hold on;
    plot(valid_points,'showOrientation',true);
    
    f = features(:);