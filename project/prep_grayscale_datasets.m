
disp('----------------------------');
disp('Preparing GrayScale datasets');
disp('----------------------------');


%%%
% Load the number of features.
%%%
disp(sprintf('\tPreparing features'));
features = load('data/target_features.mat');
features = features.objectnames;
num_features = length(features);
save('dataset/grayscale/num_features.mat', 'num_features');



%%%%%%
% The training data is comprised of 2400 images. We convert them into
% GrayScale images and select half of them for training and the other half
% for validation.
%%%%%%
disp(sprintf('\tPreparing training and validation sets'));
training_set = load('data/target_images.mat');
[N,M,~,num_images] = size(training_set.img);

num_train_images = floor(num_images*0.7);
num_val_images = floor(num_images*0.3);
num_test_images = num_images;

train_half = 1:num_train_images;
validation_half = num_train_images+1:num_images;

training_images = zeros(N,M,num_images);
for i=1:num_images
   training_images(:,:,i) = rgb2gray(training_set.img(:,:,:,i));
end

temp = reshape(training_images, num_images, [])';
training_set = temp(:, train_half);
validation_set = temp(:, validation_half);
save('dataset/grayscale/training_set.mat', 'training_set', '-v7.3');
save('dataset/grayscale/validation_set.mat', 'validation_set', '-v7.3');
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
training_output = zeros(num_features, num_train_images);

for i=[1:num_train_images]
    [feature, num_feature] = count_unique({temp{train_half(i)}.object.name});
    desired_output_features = zeros(size(features));
    
    for j = 1:length(feature)
        desired_output_features( find( strcmp(features, feature(j)))) = num_feature(j);
    end
    
    training_output(:,i) = desired_output_features';
end
save('dataset/grayscale/training_output.mat', 'training_output', '-v7.3');
clear training_output;
validation_output = zeros(num_features, num_val_images);
for i=[1:num_val_images]
    [feature, num_feature] = count_unique({temp{validation_half(i)}.object.name});
    desired_output_features = zeros(size(features));

    for j = 1:length(feature)
        desired_output_features( find( strcmp(features, feature(j)))) = num_feature(j);
    end
    
    validation_output(:,i) = desired_output_features';
end
save('dataset/grayscale/validation_output.mat', 'validation_output', '-v7.3');
clear validation_output;



%%%%%%
% Generate a training dataset from the original data. Again, the images are
% converted into their GrayScale correspondents.
%%%%%%
disp(sprintf('\tPreparing test set'));
test_input = load('data/filler_images.mat');
[~,~,~,num_test_images] = size(test_input.img(:,:,:,1:num_images));
test_images = zeros(N,M,num_test_images);

for i=1:num_test_images
   test_images(:,:,i) = rgb2gray(test_input.img(:,:,:,i));
end

test_input = reshape(test_images, num_test_images, [])';
save('dataset/grayscale/test_input.mat', 'test_input', '-v7.3');
clear test_input;


%%%%%%
% Generate the corresponding binary outputs for the validation and training
% datasets.
%%%%%%
load('dataset/grayscale/validation_output.mat')
validation_output(validation_output > 0) = 1;
bin_validation_output = validation_output;
save('dataset/grayscale/bin_validation_output.mat','bin_validation_output', '-v7.3')
load dataset/grayscale/training_output;
training_output(training_output > 0) = 1;
bin_training_output = training_output;
save('dataset/grayscale/bin_training_output.mat','bin_training_output', '-v7.3')

clear all;

