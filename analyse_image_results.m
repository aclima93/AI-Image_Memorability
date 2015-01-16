
%%%%%%
% GrayScale results
%%%%%%

load('results/grayscale/validation_results.mat');
load('results/grayscale/testing_results.mat');
load('dataset\grayscale\validation_output.mat');
load('results/grayscale/binary_validation_results.mat');
load('results/grayscale/binary_testing_results.mat');
load('dataset\grayscale\bin_validation_output.mat');

save_images('results/grayscale/', val_results, val_proc_results,test_results, test_proc_results);
save_images('results/grayscale/binary_', bin_val_results, bin_val_proc_results, binary_test_results, binary_proc_results);

%C = intersect(validation_output, val_proc_results);
%bin_C = intersect(bin_validation_output, bin_val_proc_results);

figure ;
barh([val_proc_perf, val_perf; bin_val_proc_perf, bin_val_perf]);
title('Performance of Validation Results');
legend('Processed results','Unprocessed results');
ylabel(sprintf('Validation Results\n\nNumeric                                                  Binary'));
xlabel('Performance');
saveas(gcf,'results/grayscale/performances.png');
close all;

figure ;
correct = find(validation_output == val_results);
correct_proc = find(validation_output == val_proc_results);
correct_bin = find(bin_validation_output == bin_val_results);
correct_bin_proc = find(bin_validation_output == bin_val_proc_results);
barh([length(correct) , length(correct_bin) ; length(correct_proc), length(correct_bin_proc)]);
title('Comparison of Validation Results');
legend('Numeric results','Binary results');
ylabel(sprintf('Processed Validation Results\n\nUnprocessed                                                  Processed'));
xlabel('Number of similarities with expected output');
saveas(gcf,'results/grayscale/similarities.png');
close all;



%%%%%%
% RGB results
%%%%%%
%{

%}
