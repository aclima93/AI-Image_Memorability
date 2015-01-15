
%uncomment to generate new data from datasets
%prep_data;

disp('------------------------------------------');
disp('Numerical feature training and simulation');
disp('------------------------------------------');

load num_features;
load training_set;
load training_output;
net = train_feature_network(num_features, training_set(:,1), training_output(:,1));
clear training_set;
clear training_output;

load validation_set;
load validation_output;
[classes, perf, results] = validate_feature_network(net, validation_output, validation_set); 
save('validation_results.mat', 'classes', 'perf', 'results');

load test_input;
[classes, results] = test_feature_network(net, test_input); 
save('testing_results.mat', 'classes', 'results');

clear all;

disp('------------------------------------------');
disp('Binary feature training and simulation');
disp('------------------------------------------');

load num_features;
load training_set;
load training_output;
training_output(find(training_output > 0)) = 1;
net = train_feature_network(num_features, training_set(:,1), training_output(:,1));
clear training_set;
clear training_output;

load validation_set;
load validation_output;
validation_output(find(validation_output > 0)) = 1;
[classes, perf, results] = validate_feature_network(net, validation_output, validation_set); 
save('binary_validation_results.mat', 'classes', 'perf', 'results');

load test_input;
[classes, results] = test_feature_network(net, test_input); 
save('binary_testing_results.mat', 'classes', 'results');

