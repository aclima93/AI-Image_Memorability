
rng(666); % seed used for random number generation
num_samples = 750;


disp('Preparing features');
features = load('target_features.mat');
features = features.objectnames;
num_features = length(features);
save('num_features.mat', 'num_features');


disp('Preparing training and validation sets');
training_set = load('target_images.mat');
[~,~,~,num_images] = size(training_set.img);
random_dataset = randperm(num_images, num_samples*2);
train_half = random_dataset(1:num_samples);
validation_half = random_dataset(num_samples:end);
temp = reshape(training_set.img, num_images, [])';
training_set = double(temp(train_half));
validation_set = double(temp(validation_half));
save('training_set.mat', 'training_set', '-v7.3');
save('validation_set.mat', 'validation_set', '-v7.3');
clear training_set;
clear validation_set;
clear temp;
% matriz de 2400 colunas, cada uma resulta da concatenação vertical das
% matrizes RGB para cada imagem


disp('Preparing expected training and validation outputs');
temp = load('target_features.mat');
temp = struct2cell(temp.Dmemory(:));
training_output = zeros(num_features, num_samples);
for i=[1:num_samples]
    [feature, num_feature] = count_unique({temp{train_half(i)}.object.name});
    desired_output_features = zeros(size(features));
    
    %as vezes o find não encontrava as strings for some god forsaken reason
    %desired_output_features(find(ismember(features, feature'))) = num_feature';
    for j = 1:length(feature)
        desired_output_features( find( strcmp(features, feature(j)))) = (num_feature(j) > 0);
    end
    features_class = bi2de(desired_output_features);
    training_output(features_class, i) = 1;
end
save('training_output.mat', 'training_output', '-v7.3');
clear training_output;
validation_output = zeros(num_features, num_samples);
for i=[1:num_samples]
    [feature, num_feature] = count_unique({temp{validation_half(i)}.object.name});
    desired_output_features = zeros(size(features));

    for j = 1:length(feature)
        desired_output_features( find( strcmp(features, feature(j)))) = (num_feature(j) > 0);
    end
    
    features_class = bi2de(desired_output_features);
    validation_output(features_class, i) = 1;
end
save('validation_output.mat', 'validation_output', '-v7.3');
clear validation_output;


disp('Preparing test set');
test_input = load('filler_images.mat');
[~,~,~,num_test_images] = size(test_input.img(:,:,:,1:num_images));
test_input = reshape(test_input.img(:,:,:,1:num_images), num_test_images, [])'; %imshow(img(:,:,:,1))
random_dataset = randperm(num_test_images, num_samples);
test_input = double(test_input(random_dataset));
save('test_input.mat', 'test_input', '-v7.3');
clear test_input;

clear all;

