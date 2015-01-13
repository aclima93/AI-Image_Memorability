
%uncomment to generate new data from datasets
%prep_data(400);


disp('Loading Data')
load num_features;
load num_images;
load num_test_images;
load training_set;
load desired_output;
load test_input;


res = classify_features(num_features, num_images, num_test_images, training_set, desired_output, test_input);
sprintf('correctly classified: %d', res);
