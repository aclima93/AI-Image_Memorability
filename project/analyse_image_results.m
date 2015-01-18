

%%%%%%
% GrayScale results
%%%%%%

load('results/grayscale/validation_results.mat');
load('results/grayscale/testing_results.mat');
load('dataset/grayscale/validation_output.mat');
load('results/memorability/mem_testing_results.mat');
load('results/grayscale/binary_validation_results.mat');
load('results/grayscale/binary_testing_results.mat');
load('dataset/grayscale/bin_validation_output.mat');
load('results/memorability/bin_mem_testing_results.mat');
load('data/filler_images.mat');
load('data/target_features.mat');


save_feature_images('results/grayscale/', val_results, val_proc_results,test_results, test_proc_results);
save_feature_images('results/grayscale/binary_', bin_val_results, bin_val_proc_results, binary_test_results, binary_proc_results);

%C = intersect(validation_output, val_proc_results);
%bin_C = intersect(bin_validation_output, bin_val_proc_results);

figure ;
barh([val_proc_perf, val_perf; bin_val_proc_perf, bin_val_perf]);
title('Performance of Validation Results');
legend('Processed results','Unprocessed results');
ylabel(sprintf('Validation Results\n\nNumeric                                                   Binary'));
xlabel('Performance');
saveas(gcf,'results/grayscale/performances.png');
close all;

figure ;
correct = length(find(validation_output == val_results));
correct_proc = length(find(validation_output == val_proc_results));
correct_bin = length(find(bin_validation_output == bin_val_results));
correct_bin_proc = length(find(bin_validation_output == bin_val_proc_results));
barh([correct , correct_bin ; correct_proc, correct_bin_proc]);
title('Comparison of Validation Results');
legend('Numeric results','Binary results');
ylabel(sprintf('Processed Validation Results\n\nUnprocessed                                                  Processed'));
xlabel('Number of similarities with expected output');
saveas(gcf,'results/grayscale/similarities.png');
close all;


save_memorability_images;


%%%%%%
% RGB results
%%%%%%
%{
% Copy&Paste above code > replace 'grayscale' with 'rgb'
% Should work fine. Mostly.
%}
