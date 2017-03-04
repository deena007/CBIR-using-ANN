rootFolder = fullfile('F:\','BTP','dataset');
categories = {'obj_aviation', 'obj_bob','obj_bonsai','obj_bus','obj_car','obj_cards','obj_decoys','obj_dish','obj_doll','obj_door','obj_eastregg','obj_flags','obj_mask','obj_mineral','obj_moleculr','obj_orbits','obj_ship','obj_steameng','obj_train','pet_cat','pet_dog','pl_flower','pl_foliage','pl_mashroom','wl_buttrfly','wl_cat','wl_cougr','wl_deer','wl_eagle','wl_elephant','wl_fish','wl_fox','wl_goat','wl_horse','wl_lepoad','wl_lion','wl_lizard','wl_nests','wl_owls','wl_porp','wl_primates','wl_roho','wl_tiger','wl_wolf','woman'};
imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');

tbl = countEachLabel(imds)

minSetCount = min(tbl{:,2}); % determine the smallest amount of images in a category
% Use splitEachLabel method to trim the set.
imds = splitEachLabel(imds, minSetCount, 'randomize');

% Notice that each set now has exactly the same number of images.
countEachLabel(imds)

[trainingSet, validationSet] = splitEachLabel(imds, 0.3, 'randomize');

% figure

bag = bagOfFeatures(trainingSet);

img = readimage(imds, 1);   
featureVector = encode(bag, img);

% Plot the histogram of visual word occurrences
%figure
%bar(featureVector)
%title('Visual word occurrences')
%xlabel('Visual word index')
%ylabel('Frequency of occurrence')

%categoryClassifier = trainImageCategoryClassifier(trainingSet, bag);
