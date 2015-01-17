

target = load('dataset/memorability/mem_maps_predicted.mat');
mem_target = target.mem_maps_predicted * 100;

%%%%%%
% Scale values to a range from 0 to 100
%%%%%%
minValue = min(mem_target);
mem_target = mem_target - minValue;
maxValue = max(mem_target);
mem_target = (100/maxValue) * mem_target; 

%%%%%%
% Apply step threshold
%%%%%%
mem_target(mem_target < 50) = 0;
mem_target(mem_target >= 50) = 1;

save('dataset/memorability/mem_target.mat', 'mem_target');

clear all;

