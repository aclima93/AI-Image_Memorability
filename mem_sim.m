

disp('-------------------------------');
disp('Preparing Memorability datasets');
disp('-------------------------------');

disp(sprintf('\nNumerical Feature Memorability'));

load('dataset/grayscale/training_output.mat');
load('results/grayscale/testing_results.mat');
load('dataset/memorability/mem_target.mat');

train_input = training_output(:,1:1111);
test_input = test_proc_results(:,1:1111);
%input = load('dataset/memorability/desired_output.mat');
%deviam ser 1200 samples para ser do mesmo tamanho que o meu output (ACL)
%train_input = input.desired_output(:,1112:2222);
%clear input;

net = train_mem_network(train_input, mem_target');

[mem_proc_results, mem_results] = test_memory_network(net, test_input);
save('results/memorability/mem_testing_results.mat', 'mem_proc_results', 'mem_results');

