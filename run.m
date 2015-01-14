
%uncomment to generate new data from datasets
%prep_data;
%prep_objects_data;


load num_features;
load training_set;
load desired_output;


net = train_feature_network(num_features, training_set, desired_output);
clear training_set;

load test_input;
result_vectors = classify_feature_network(desired_output, test_input); 
save result_vectors;




