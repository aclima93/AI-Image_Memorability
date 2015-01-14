
%uncomment to generate new data from datasets
%prep_data;

%------------------------------------------
% numerical feature training and simulation
% -----------------------------------------

load num_features;
load training_set;
load training_output;
net = train_feature_network(num_features, training_set, training_output);
clear training_set;
clear training_output;

load validation_set;
load validation_output;
[classes, perf, results] = classify_feature_network(net, validation_output, validation_set); 
save('validation_results.mat', 'classes', 'perf', 'results');

%{
load test_input;
[classes, perf, results] = classify_feature_network(desired_output, test_input); 
save('testing_results.mat', 'classes', 'perf', 'results');
%}

%------------------------------------------
% binary feature training and simulation
% -----------------------------------------
