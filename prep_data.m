
rng(666); % seed used for random number generation
num_samples = 1200;

disp('------------------------------------------');
disp('Preparing datasets');
disp('------------------------------------------');

disp(sprintf('\tPreparing features'));
features = load('data/target_features.mat');
features = features.objectnames;
num_features = length(features);
save('dataset/num_features.mat', 'num_features');


disp(sprintf('\tPreparing training and validation sets'));
training_set = load('data/target_images.mat');
[N,M,~,num_images] = size(training_set.img);
training_images = zeros(N,M,num_images);
for i=1:num_images
   training_images(:,:,i) = rgb2gray(training_set.img(:,:,:,i));
end
random_dataset = randperm(num_images, num_samples*2);
train_half = random_dataset(1:num_samples);
validation_half = random_dataset(num_samples+1:end);
temp = reshape(training_images, num_images, [])';
training_set = temp(train_half);
validation_set = temp(validation_half);
save('dataset/training_set.mat', 'training_set', '-v7.3');
save('dataset/validation_set.mat', 'validation_set', '-v7.3');
clear training_set;
clear validation_set;
clear temp;
% matriz de 2400 colunas, cada uma resulta da concatenação vertical das
% matrizes RGB para cada imagem


disp(sprintf('\tPreparing expected training and validation outputs'));
temp = load('data/target_features.mat');
temp = struct2cell(temp.Dmemory(:));
training_output = zeros(num_features, num_samples);
for i=[1:num_samples]
    [feature, num_feature] = count_unique({temp{train_half(i)}.object.name});
    desired_output_features = zeros(size(features));
    
    %as vezes o find não encontrava as strings for some god forsaken reason
    %desired_output_features(find(ismember(features, feature'))) = num_feature';
    for j = 1:length(feature)
        desired_output_features( find( strcmp(features, feature(j)))) = num_feature(j);
    end
    
    training_output(:,i) = desired_output_features';
end
save('dataset/training_output.mat', 'training_output', '-v7.3');
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
save('dataset/validation_output.mat', 'validation_output', '-v7.3');
clear validation_output;


disp(sprintf('\tPreparing test set'));
test_input = load('data/filler_images.mat');
num_test_images = num_samples*2;
test_images = zeros(N,M,num_test_images);
for i=1:num_test_images
   test_images(:,:,i) = rgb2gray(test_input.img(:,:,:,i));
end
test_input = reshape(test_images, num_test_images, [])'; %imshow(img(:,:,:,1))
random_dataset = randperm(num_test_images, num_samples);
test_input = test_input(random_dataset);
save('dataset/test_input.mat', 'test_input', '-v7.3');
clear test_input;

clear all;

