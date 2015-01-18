
num = 30;
num_rep = 30;

%%%%%%
% Memorability - Numeric Features
%%%%%%
figure ;
plot(mem_results, 'r');
axis([0 length(mem_results) min(mem_results) max(mem_results)]);
title('Image Memorability');
ylabel('Memorability %');
xlabel('Image');
saveas(gcf,'results/memorability/memorability_results.png');
close all;

figure ;
plot(mem_proc_results, 'b');
title('Processed Image Memorability');
ylabel('Memorability %');
xlabel('Image');
axis([0 length(mem_proc_results) min(mem_proc_results) max(mem_proc_results)]);
saveas(gcf,'results/memorability/processed_memorability_results.png');
close all;

% Sort the values in descending order and get the most and least memorable images.
iptsetpref('ImshowAxesVisible', 'off');
figure ;
[memorabilities, sortIndex] = sort(mem_results, 'descend');
most_memorable = sortIndex(1:num);
least_memorable = fliplr(sortIndex(end-num:end));
for i = 1:num
    imshow(img(:,:,:,most_memorable(i)))
    title(sprintf('%.2f%% Memorability', mem_results(most_memorable(i)) ));
    saveas(gcf,sprintf('results/memorability/mm/most_memorable%d.png',i));

    imshow(img(:,:,:,least_memorable(i)))
    title(sprintf('%.2f%% Memorability', mem_results(least_memorable(i)) ));
    saveas(gcf,sprintf('results/memorability/lm/least_memorable%d.png',i));
end
close all;
iptsetpref('ImshowAxesVisible', 'on');


%%%%%%
% Show off the features that comprise the least/most memorable images
%%%%%%
figure ;
a = test_results(:, most_memorable)';
[N,M] = size(a);
y_replicated = zeros(N*num_rep, M);
j = 1;
for i = 1:num_rep:N*num_rep
   y_replicated(i:i+num_rep-1, :) = repmat(a(j, :), num_rep, 1);
   j = j+1;
end
imshow(y_replicated);
title('Most Memorable Numeric Test Results')
ylabel('Images (ordered by decreasing memorability)')
xlabel('Features')
saveas(gcf,'results/memorability/most_memorable_features.png');

a = test_proc_results(:, most_memorable)';
[N,M] = size(a);
y_replicated = zeros(N*num_rep, M);
j = 1;
for i = 1:num_rep:N*num_rep
   y_replicated(i:i+num_rep-1, :) = repmat(a(j, :), num_rep, 1);
   j = j+1;
end
imshow(y_replicated);
title('Most Memorable Numeric Processed Test Results')
ylabel('Images (ordered by decreasing memorability)')
xlabel('Features')
saveas(gcf,'results/memorability/proc_most_memorable_features.png');
close all;

figure ;
a = test_results(:, least_memorable)';
[N,M] = size(a);
y_replicated = zeros(N*num_rep, M);
j = 1;
for i = 1:num_rep:N*num_rep
   y_replicated(i:i+num_rep-1, :) = repmat(a(j, :), num_rep, 1);
   j = j+1;
end
imshow(y_replicated);
title('Least Memorable Numeric Test Results')
ylabel('Images (ordered by increasing memorability)')
xlabel('Features')
saveas(gcf,'results/memorability/least_memorable_features.png');

a = test_proc_results(:, least_memorable)';
[N,M] = size(a);
y_replicated = zeros(N*num_rep, M);
j = 1;
for i = 1:num_rep:N*num_rep
   y_replicated(i:i+num_rep-1, :) = repmat(a(j, :), num_rep, 1);
   j = j+1;
end
imshow(y_replicated);
title('Least Memorable Numeric Processed Test Results')
ylabel('Images (ordered by increasing memorability)')
xlabel('Features')
saveas(gcf,'results/memorability/proc_least_memorable_features.png');
close all;


%%%%%%
% Memorability - Binary Features
%%%%%%
figure ;
plot(bin_mem_results, 'r');
axis([0 length(bin_mem_results) min(bin_mem_results) max(bin_mem_results)]);
title('Image Memorability');
ylabel('Memorability %');
xlabel('Image');
saveas(gcf,'results/memorability/bin_memorability_results.png');
close all;

figure ;
plot(bin_mem_proc_results, 'b');
title('Processed Image Memorability');
ylabel('Memorability %');
xlabel('Image');
axis([0 length(bin_mem_proc_results) min(bin_mem_proc_results) max(bin_mem_proc_results)]);
saveas(gcf,'results/memorability/bin_processed_memorability_results.png');
close all;

% Sort the values in descending order and get the most and least memorable images.
[memorabilities, sortIndex] = sort(bin_mem_results, 'descend');
bin_most_memorable = sortIndex(1:num);
bin_least_memorable = fliplr(sortIndex(end-num:end));
iptsetpref('ImshowAxesVisible', 'off');
figure ;
for i = 1:num
    imshow(img(:,:,:,bin_most_memorable(i)))
    title(sprintf('%.2f%% Memorability', bin_mem_results(bin_most_memorable(i)) ));
    saveas(gcf,sprintf('results/memorability/mm/bin_most_memorable%d.png',i));
    
    imshow(img(:,:,:,bin_least_memorable(i)))
    title(sprintf('%.2f%% Memorability', bin_mem_results(bin_least_memorable(i)) ));
    saveas(gcf,sprintf('results/memorability/lm/bin_least_memorable%d.png',i));
end
close all;
iptsetpref('ImshowAxesVisible', 'on');


%%%%%%
% Show off the features that comprise the least/most memorable images
%%%%%%
figure ;
a = binary_test_results(:, bin_most_memorable)';
[N,M] = size(a);
y_replicated = zeros(N*num_rep, M);
j = 1;
for i = 1:num_rep:N*num_rep
   y_replicated(i:i+num_rep-1, :) = repmat(a(j, :), num_rep, 1);
   j = j+1;
end
imshow(y_replicated);
title('Most Memorable Binary Test Results')
ylabel('Images (ordered by decreasing memorability)')
xlabel('Features')
saveas(gcf,'results/memorability/bin_most_memorable_features.png');

a = binary_proc_results(:, bin_most_memorable)';
[N,M] = size(a);
y_replicated = zeros(N*num_rep, M);
j = 1;
for i = 1:num_rep:N*num_rep
   y_replicated(i:i+num_rep-1, :) = repmat(a(j, :), num_rep, 1);
   j = j+1;
end
imshow(y_replicated);
title('Most Memorable Binary Processed Test Results')
ylabel('Images (ordered by decreasing memorability)')
xlabel('Features')
saveas(gcf,'results/memorability/bin_proc_most_memorable_features.png');
close all;

figure ;
a = binary_test_results(:, bin_least_memorable)';
[N,M] = size(a);
y_replicated = zeros(N*num_rep, M);
j = 1;
for i = 1:num_rep:N*num_rep
   y_replicated(i:i+num_rep-1, :) = repmat(a(j, :), num_rep, 1);
   j = j+1;
end
imshow(y_replicated);
title('Least Memorable Binary Test Results')
ylabel('Images (ordered by increasing memorability)')
xlabel('Features')
saveas(gcf,'results/memorability/bin_least_memorable_features.png');


a = binary_proc_results(:, bin_least_memorable)';
[N,M] = size(a);
y_replicated = zeros(N*num_rep, M);
j = 1;
for i = 1:num_rep:N*num_rep
   y_replicated(i:i+num_rep-1, :) = repmat(a(j, :), num_rep, 1);
   j = j+1;
end
imshow(y_replicated);
title('Least Memorable Binary Processed Test Results')
ylabel('Images (ordered by increasing memorability)')
xlabel('Features')
saveas(gcf,'results/memorability/bin_proc_least_memorable_features.png');
close all;

