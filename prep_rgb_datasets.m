
disp('------------------------------------------');
disp('Preparing RGB datasets');
disp('------------------------------------------');

num_samples = 1200;

%%%
% Load the number of features.
%%%
disp(sprintf('\tPreparing features'));
features = load('data/target_features.mat');
features = features.objectnames;
num_features = length(features);
save('dataset/rgb/num_features.mat', 'num_features');



%%%%%%
% The training data is comprised of 2400 images. We select half of them for
% training and the other half for validation.
%%%%%%
disp(sprintf('\tPreparing training and validation sets'));
training_set = load('data/target_images.mat');
[~,~,~,num_images] = size(training_set.img);
temp = reshape(training_set.img, num_images, [])';
train_half = 1:num_samples;
validation_half = num_samples+1:num_samples*2;
training_set = temp(:, train_half);
validation_set = temp(:, validation_half);
save('dataset/rgb/training_set.mat', 'training_set', '-v7.3');
save('dataset/rgb/validation_set.mat', 'validation_set', '-v7.3');
clear training_set;
clear validation_set;
clear temp;



%%%%%%
% Generate the appropriate expected outputs for the training and validation
% datasets with the information in the original data.
%%%%%%
disp(sprintf('\tPreparing expected training and validation outputs'));
temp = load('data/target_features.mat');
temp = struct2cell(temp.Dmemory(:));
training_output = zeros(num_features, num_samples);

for i=[1:num_samples]
    [feature, num_feature] = count_unique({temp{train_half(i)}.object.name});
    desired_output_features = zeros(size(features));
    
    for j = 1:length(feature)
        desired_output_features( find( strcmp(features, feature(j)))) = num_feature(j);
    end
    
    training_output(:,i) = desired_output_features';
end
save('dataset/rgb/training_output.mat', 'training_output', '-v7.3');
clear training_output;
validation_output = zeros(num_features, num_samples);
for i=[1:num_samples]
    [feature, num_feature] = count_unique({temp{validation_half(i)}.object.name});
    desired_output_features = zeros(size(features));

    for j = 1:length(feature)
        desired_output_features( find( strcmp(features, feature(j)))) = num_feature(j);
    end
    
    validation_output(:,i) = desired_output_features';
end
save('dataset/rgb/validation_output.mat', 'validation_output', '-v7.3');
clear validation_output;



%%%%%%
% Generate a training dataset from the original data.
%%%%%%
disp(sprintf('\tPreparing test set'));
test_input = load('data/filler_images.mat');
%num_test_images = num_samples*2;
[~,~,~,num_test_images] = size(test_input.img(:,:,:,1:num_images));
test_input = reshape(test_input.img(:,:,:,1:num_images), num_test_images, [])'; %imshow(img(:,:,:,1))
test_input = test_input(:, 1:num_samples);
save('dataset/rgb/test_input.mat', 'test_input', '-v7.3');
clear test_input;

clear all;

