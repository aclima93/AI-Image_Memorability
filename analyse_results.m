disp('------------------------------------');
disp('Analysing results of all simulations');
disp('------------------------------------');

%%%%%%
% GrayScale results
%%%%%%

load('results/grayscale/validation_results.mat');
load('results/grayscale/testing_results.mat');
load('results/grayscale/binary_validation_results.mat');
load('results/grayscale/binary_testing_results.mat');

save_images('results/grayscale/', val_perf , val_proc_perf, val_results, val_proc_results,test_results, test_proc_results);
save_images('results/grayscale/binary_', bin_val_perf , bin_val_proc_perf, bin_val_results, bin_val_proc_results, binary_test_results, binary_proc_results);

%%%%%%
% RGB results
%%%%%%
%{
load('results/rgb/validation_results.mat');
load('results/rgb/testing_results.mat');
load('results/rgb/binary_validation_results.mat');
load('results/rgb/binary_testing_results.mat');

save_images('results/rgb/', val_perf , val_proc_perf, val_results, val_proc_results,test_results, test_proc_results);
save_images('results/rgb/binary_', bin_val_perf , bin_val_proc_perf, bin_val_results, bin_val_proc_results, binary_test_results, binary_proc_results);
%}
