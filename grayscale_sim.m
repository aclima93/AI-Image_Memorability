
disp('-----------------------------------------------------');
disp('Numerical feature training, validation and simulation');
disp('-----------------------------------------------------');

load dataset/grayscale/num_features;
load dataset/grayscale/training_set;
load dataset/grayscale/training_output;
net = train_feature_network(num_features, training_set, training_output);
clear training_set;
clear training_output;

load dataset/grayscale/validation_set;
load dataset/grayscale/validation_output;
[val_proc_results, val_proc_perf, val_results, val_perf] = validate_feature_network(net, validation_output, validation_set); 
save('results/grayscale/validation_results.mat', 'val_proc_results', 'val_proc_perf', 'val_results', 'val_perf');

load dataset/grayscale/test_input;
[test_proc_results, test_results] = test_feature_network(net, test_input); 
save('results/grayscale/testing_results.mat', 'test_proc_results', 'test_results');

disp(' ');
clear all;
disp(' ');

disp('--------------------------------------------------');
disp('Binary feature training, validation and simulation');
disp('--------------------------------------------------');

load dataset/grayscale/num_features;
load dataset/grayscale/training_set;
load dataset/grayscale/bin_training_output;
net = train_feature_network(num_features, training_set, bin_training_output);
clear training_set;
clear training_output;

load dataset/grayscale/validation_set;
load dataset/grayscale/bin_validation_output;
[bin_val_proc_results, bin_val_proc_perf, bin_val_results, bin_val_perf] = validate_feature_network(net, bin_validation_output, validation_set); 
save('results/grayscale/binary_validation_results.mat', 'bin_val_proc_results', 'bin_val_proc_perf', 'bin_val_results', 'bin_val_perf');

load dataset/grayscale/test_input;
[binary_proc_results, binary_test_results] = test_feature_network(net, test_input); 
save('results/grayscale/binary_testing_results.mat', 'binary_proc_results', 'binary_test_results');

disp(' ');
clear all;
disp(' ');

