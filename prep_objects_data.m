input = load('desired_output.mat');
target = load('mem_maps_predicted.mat');

limitedInput = input.desired_output(:, 1:1111); %Fix

net = train_mem_network(limitedInput, target.mem_maps_predicted(1:1111));

