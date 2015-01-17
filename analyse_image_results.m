
%%%%%%
% GrayScale results
%%%%%%

load('results/grayscale/validation_results.mat');
load('results/grayscale/testing_results.mat');
load('dataset/grayscale/validation_output.mat');
load('results/grayscale/binary_validation_results.mat');
load('results/grayscale/binary_testing_results.mat');
load('dataset/grayscale/bin_validation_output.mat');
load('results/memorability/mem_testing_results.mat');

save_images('results/grayscale/', val_results, val_proc_results,test_results, test_proc_results);
save_images('results/grayscale/binary_', bin_val_results, bin_val_proc_results, binary_test_results, binary_proc_results);

%C = intersect(validation_output, val_proc_results);
%bin_C = intersect(bin_validation_output, bin_val_proc_results);

figure ;
barh([val_proc_perf, val_perf; bin_val_proc_perf, bin_val_perf]);
title('Performance of Validation Results');
legend('Processed results','Unprocessed results');
ylabel(sprintf('Validation Results\n\nNumeric Binary'));
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
ylabel(sprintf('Processed Validation Results\n\nUnprocessed                                                  Processed'));
xlabel('Number of similarities with expected output');
saveas(gcf,'results/grayscale/similarities.png');
close all;



figure ;
plot(mem_results, 'r');
axis([0 length(mem_results) min(mem_results) max(mem_results)]);
title('Image Memorability');
ylabel('Memorability');
xlabel('Image');
saveas(gcf,'results/memorability/memorability_results.png');
close all;

figure ;
plot(mem_proc_results, 'b');
title('Processed Image Memorability');
ylabel('Memorability');
xlabel('Image');
axis([0 length(mem_results) -0.1 1.1]);
saveas(gcf,'results/memorability/processed_memorability_results.png');
close all;


%%%%%%
% Sort the values in descending order and get 
% the most and least memorable images.
%%%%%%
load('data/filler_images.mat');
num = 6;
[sortedValues,sortIndex] = sort(mem_proc_results, 'descend');
most_memorable = sortIndex(1:num);
least_memorable = sortIndex(end-num:end);
figure ;
for i = 1:num
    imshow(img(:,:,:,most_memorable(i)), 'Border', 'tight')
    saveas(gcf,sprintf('results/memorability/most_memorable%d.png',i));
    imshow(img(:,:,:,least_memorable(i)), 'Border', 'tight')
    saveas(gcf,sprintf('results/memorability/least_memorable%d.png',i));
end
close all;


%%%%%%
% RGB results
%%%%%%
%{

%}
