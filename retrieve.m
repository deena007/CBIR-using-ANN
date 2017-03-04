% Define a starting folder.
PathName = fullfile(matlabroot, 'F:\5th sem\BTPfinal\testdata3\sampletest\');
% Ask user to confirm or change.
[FileName,PathName] = uigetfile('*.jpg','Select an image');
img1 = imread(strcat(PathName,FileName));

%img1 = imread(fullfile('F:\','5th sem','BTPfinal','testdata3','sampletest','filename'));
%[labelIdx, scores] = predict(categoryClassifier, img1);

% Display the string label
%categoryClassifier.Labels(labelIdx)
%t1 = encode(bag, img1);
%test1= transpose(t1);
input_img = rgb2gray(img1);
test2 = extractLBPFeatures(input_img);
test1 = test2';
result1 = net(test1);
yind1 =1 + vec2ind(result1);

[~, Label] = max(result1);
Label = Label';
Label(Label == 10) = 0;  
%ImageId = 1:n; ImageId = ImageId'; 
%writetable(table(ImageId, Label), 'submission.csv')
%testInd = tr.result1;


allSubFolders = genpath('F:\5th sem\BTPfinal\testdata3\');
remain = allSubFolders;
listOfFolderNames = {};
ii=1;
while true
	[singleSubFolder, remain] = strtok(remain, ';');
	if isempty(singleSubFolder)
		break;
	end
	listOfFolderNames = [listOfFolderNames singleSubFolder];
end
numberOfFolders = length(listOfFolderNames)
for k = 1 : yind1
	thisFolder = listOfFolderNames{yind1};
    
    fprintf('Processing folder %s\n', thisFolder);
	filePattern = sprintf('%s/*.png', thisFolder);
	baseFileNames = dir(filePattern);
	filePattern = sprintf('%s/*.tif', thisFolder);
	baseFileNames = [baseFileNames; dir(filePattern)];
	filePattern = sprintf('%s/*.jpg', thisFolder);
	baseFileNames = [baseFileNames; dir(filePattern)];
	numberOfImageFiles = length(baseFileNames);
    if k == Label
	 if numberOfImageFiles >= 1
		for f = 1 : 9
			fullFileName = fullfile(thisFolder, baseFileNames(f).name);
			%fprintf('     Processing image file %s\n', fullFileName);
			img = imread(fullFileName);
            subplot(3, 3, f);
            imshow(img);

        end
     end
    end
end

