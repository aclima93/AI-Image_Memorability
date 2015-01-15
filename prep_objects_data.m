input = load('desired_output.mat');
target = load('mem_maps_predicted.mat');

limitedInput = input.desired_output(:,1112:2222); %Fix

net = train_mem_network(limitedInput, target.mem_maps_predicted');

result = classify_mem_network(net, limitedInput);