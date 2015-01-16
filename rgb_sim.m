
disp('-----------------------------------------------------');
disp('Numerical feature training, validation and simulation');
disp('-----------------------------------------------------');

load dataset/rgb/num_features;
load dataset/rgb/training_set;
load dataset/rgb/training_output;
net = train_feature_network(num_features, training_set, training_output);
clear training_set;
clear training_output;

load dataset/rgb/validation_set;
load dataset/rgb/validation_output;
[val_proc_results, val_proc_perf, val_results, val_perf] = validate_feature_network(net, validation_output, validation_set); 
save('results/rgb/validation_results.mat', 'val_proc_results', 'val_proc_perf', 'val_results', 'val_perf');

load dataset/rgb/test_input;
[test_classes, test_results] = test_feature_network(net, test_input); 
save('results/rgb/testing_results.mat', 'test_classes', 'test_results');

disp(' ');
clear all;
disp(' ');

disp('-----------------------------------------------------');
disp('Binary feature training, validation and simulation');
disp('-----------------------------------------------------');

load dataset/rgb/num_features;
load dataset/rgb/training_set;
load dataset/rgb/bin_training_output;
net = train_feature_network(num_features, training_set, bin_training_output);
clear training_set;
clear training_output;

load dataset/rgb/validation_set;
load dataset/rgb/bin_validation_output;
[bin_val_proc_results, bin_val_proc_perf, bin_val_results, bin_val_perf] = validate_feature_network(net, bin_validation_output, validation_set); 
save('results/rgb/binary_validation_results.mat', 'bin_val_proc_results', 'bin_val_proc_perf', 'bin_val_results', 'bin_val_perf');

load dataset/rgb/test_input;
[binary_test_classes, binary_test_results] = test_feature_network(net, test_input); 
save('results/rgb/binary_testing_results.mat', 'binary_test_classes', 'binary_test_results');

disp(' ');
clear all;
disp(' ');

