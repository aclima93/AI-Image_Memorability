

input = load('dataset/memorability/desired_output.mat');
target = load('dataset/memorability/mem_maps_predicted.mat');

target = target.mem_maps_predicted * 100;

%Scaling
minValue = min(target);
target = target - minValue;
maxValue = max(target);
target = (100/maxValue) * target; 

target(target < 50) = 0;
target(target >= 50) = 1;

limitedInput = input.desired_output(:,1112:2222); %Fix
clear input;

disp('Training...');
net = train_mem_network(limitedInput, target');
disp('Trained!');

[result] = classify_mem_network(net, limitedInput);

%remove negative values and over positive values
result(result < 0) = 0;
result(result > 1) = 1;

plot(result)