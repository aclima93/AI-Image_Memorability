function prep_data( N )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

disp('Preparing features');
features = load('target_features.mat');
features = features.objectnames;
num_features = length(features);

disp('Preparing test set');
test_input = load('filler_images.mat');
[~,~,~,num_test_images] = size(test_input.img(:,:,:,1:N));
test_input = reshape(test_input.img(:,:,:,1:N), num_test_images, [])'; %imshow(img(:,:,:,1))

disp('Preparing training set');
training_set = load('target_images.mat');
[~,~,~,num_images] = size(training_set.img(:,:,:,1:N));
training_set = reshape(training_set.img(:,:,:,1:N), num_images, [])';
% matriz de 2400 colunas, cada uma resulta da concatenação vertical das
% matrizes RGB para cada imagem

disp('Preparing expected training set outputs');
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

%desired_output = uint16(desired_output);
training_set = double(training_set);
test_input = double(test_input);

save num_features;
save num_images;
save num_test_images;
save training_set;
save desired_output;
save test_input;

end

