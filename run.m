[num_features, num_images, num_test_images, training_set, desired_output, test_input] = prep_data();

res = classify_features(num_features, num_images, num_test_images, training_set, desired_output, test_input);
sprintf('correctly classified: %d', res);


