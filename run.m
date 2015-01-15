
%uncomment to generate new data from datasets
%prep_data;

disp('------------------------------------------');
disp('Numerical feature training and simulation');
disp('------------------------------------------');

load dataset/num_features;
load dataset/training_set;
load dataset/training_output;
net = train_feature_network(num_features, training_set, training_output);
clear training_set;
clear training_output;

load dataset/validation_set;
load dataset/validation_output;
[val_classes, val_perf, val_results] = validate_feature_network(net, validation_output, validation_set); 
save('results/validation_results.mat', 'val_classes', 'val_perf', 'val_results');

load dataset/test_input;
[test_classes, test_results] = test_feature_network(net, test_input); 
save('results/testing_results.mat', 'test_classes', 'test_results');

disp(' ');
clear all;
disp(' ');

disp('------------------------------------------');
disp('Binary feature training and simulation');
disp('------------------------------------------');

load dataset/num_features;
load dataset/training_set;
load dataset/training_output;
training_output(training_output > 0) = 1;
net = train_feature_network(num_features, training_set, training_output);
clear training_set;
clear training_output;

load dataset/validation_set;
load dataset/validation_output;
validation_output(validation_output > 0) = 1;
[binary_val_classes, binary_val_perf, binary_val_results] = validate_feature_network(net, validation_output, validation_set); 
save('results/binary_validation_results.mat', 'binary_val_classes', 'binary_val_perf', 'binary_val_results');

load dataset/test_input;
[binary_test_classes, binary_test_results] = test_feature_network(net, test_input); 
save('results/binary_testing_results.mat', 'binary_test_classes', 'binary_test_results');

disp(' ');
clear all;
disp(' ');

disp(' ');
disp('Finished!');
disp(' ');
