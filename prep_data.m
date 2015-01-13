function [num_features, num_images, num_test_images, training_set, desired_output, test_input] = prep_data( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

disp('Loading features');
features = load('target_features.mat');
features = features.objectnames;
num_features = length(features);

disp('Loading test set');
test_input = load('filler_images.mat');
[~,~,~,num_test_images] = size(test_input.img(:,:,:,1:400));
test_input = reshape(test_input.img(:,:,:,1:400), num_test_images, [])'; %imshow(img(:,:,:,1))

disp('Loading training set');
training_set = load('target_images.mat');
[~,~,~,num_images] = size(training_set.img(:,:,:,1:400));
training_set = reshape(training_set.img(:,:,:,1:400), num_images, [])';
% matriz de 2400 colunas, cada uma resulta da concatenação vertical das
% matrizes RGB para cada imagem

disp('Loading expected training set outputs');
temp = load('target_features.mat');
temp = struct2cell(temp.Dmemory(:));
desired_output = zeros(num_features, num_images);
for i=[1:num_images]
    [feature, num_feature] = count_unique({temp{i}.object.name});
    desired_output_features = zeros(size(features));
    
    %as vezes o find não encontrava as strings for some god forsaken reason
    %desired_output_features(find(ismember(features, feature'))) = num_feature';
    for j = 1:length(feature)
        desired_output_features( find( strcmp(features, feature(j)))) = num_feature(j);
    end
    
    desired_output(:,i) = desired_output_features';
end

end

