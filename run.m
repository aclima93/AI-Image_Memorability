
%uncomment to generate new data from datasets
%prep_data;

disp('------------------------------------------');
disp('Numerical feature training and simulation');
disp('------------------------------------------');

load num_features;
load training_set;
load training_output;
net = train_feature_network(num_features, training_set, training_output);
clear training_set;
clear training_output;

load validation_set;
load validation_output;
[val_classes, val_perf, val_results] = validate_feature_network(net, validation_output, validation_set); 
save('validation_results.mat', 'val_classes', 'val_perf', 'val_results');

load test_input;
[test_classes, test_results] = test_feature_network(net, test_input); 
save('testing_results.mat', 'test_classes', 'test_results');

disp('\n\n');
clear all;
disp('\n\n');

disp('------------------------------------------');
disp('Binary feature training and simulation');
disp('------------------------------------------');

load num_features;
load training_set;
load training_output;
training_output(find(training_output > 0)) = 1;
net = train_feature_network(num_features, training_set, training_output);
clear training_set;
clear training_output;

load validation_set;
load validation_output;
validation_output(find(validation_output > 0)) = 1;
[binary_val_classes, binary_val_perf, binary_val_results] = validate_feature_network(net, validation_output, validation_set); 
save('binary_validation_results.mat', 'binary_val_classes', 'binary_val_perf', 'binary_val_results');

load test_input;
[binary_test_classes, binary_test_results] = test_feature_network(net, test_input); 
save('binary_testing_results.mat', 'binary_test_classes', 'binary_test_results');

