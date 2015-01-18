
disp('----------------------------------------');
disp(sprintf('\nNumerical Feature Memorability'));
disp('----------------------------------------');

load('dataset/grayscale/training_output.mat');
load('results/grayscale/testing_results.mat');
load('dataset/memorability/mem_target.mat');

train_input = training_output(:,1:1111);
test_input = test_proc_results(:,1:1111);

net = train_mem_network(train_input, mem_target');

[mem_proc_results, mem_results] = test_memory_network(net, test_input);
save('results/memorability/mem_testing_results.mat', 'mem_proc_results', 'mem_results');


clear all;

disp('-------------------------------------');
disp(sprintf('\nBinary Feature Memorability'));
disp('-------------------------------------');

load('dataset/grayscale/bin_training_output.mat');
load('results/grayscale/testing_results.mat');
load('dataset/memorability/mem_target.mat');

train_input = bin_training_output(:,1:1111);
test_input = test_proc_results(:,1:1111);

net = train_mem_network(train_input, mem_target');

[bin_mem_proc_results, bin_mem_results] = test_memory_network(net, test_input);
save('results/memorability/bin_mem_testing_results.mat', 'bin_mem_proc_results', 'bin_mem_results');


