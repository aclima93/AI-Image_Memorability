function save_images( folder, val_perf , val_proc_perf, val_results, val_proc_results, test_results, test_proc_results)

%Saves the inputs into the specified folder as .png images

data = [val_proc_perf,0; 0,val_perf; val_proc_perf,val_perf];
hDataSeries = barh(data ,'stacked');
set(gca, 'xlim',[0,val_proc_perf+val_perf+5], 'box','off');

%{
sumTotals = sum(data,2);
sumTotals = sumTotals(~isnan(sumTotals));
labels = arrayfun(@num2str,sumTotals,'uniform',false);
hText = text(1:size(data,1), sumTotals, labels);
set(hText, 'VerticalAlignment','bottom', 'FontSize',8, 'Color','b');
hPatches = get(hDataSeries,'Children');
try hPatches = cell2mat(hPatches); catch, end  % no need in case of single patch
xData = get(hPatches(1),'XData');
xPos = xData(end,:) + 0.01;
yData = get(hPatches,'YData');
try yData = cell2mat(yData); catch, end
barYs = yData(2:4:end,:);
barValues = diff([zeros(1,size(barYs,2)); barYs]);
barValues(bsxfun(@minus,barValues,sum(barValues))==0) = 0;  % no sub-total for bars having only a single sub-total
yPos = yData(1:4:end,:) + barValues/2;
xPos = xPos(ones(1,size(yPos,1)),:);
xPos(barValues==0)      = [];  % remove entries for empty bars patches
yPos(barValues==0)      = [];  % remove entries for empty bars patches
barValues(barValues==0) = [];  % remove entries for empty bars patches
labels = strcat(' ', arrayfun(@num2str,barValues(:),'uniform',false));
hText = text(xPos(:), yPos(:), labels);
set(hText, 'FontSize',8);
%}
hLegend = legend(hDataSeries, {'performance of processed results','performance of unprocessed results'});
set(hLegend, 'FontSize',8);

saveas(gcf,strcat(folder,'performances.png'));

%[num_features, num_images] = size(val_results);
iptsetpref('ImshowAxesVisible', 'on');
%'Images', [0 num_images], 'Features', [0 num_features]
imshow(val_results);
title('Validation Results')
xlabel('Images')
ylabel('Features')
%set(gca,'XTick',[0:num_images] );
%set(gca,'XTick',[0:num_features] );
saveas(gcf,strcat(folder,'validation_results.png'));

%[num_features, num_images] = size(val_proc_results);
imshow(val_proc_results);
title('Processed Validation Results')
xlabel('Images')
ylabel('Features')
saveas(gcf,strcat(folder,'validation_processed_results.png'));

%[num_features, num_images] = size(test_results);
imshow(test_results);
title('Test Results')
xlabel('Images')
ylabel('Features')
saveas(gcf,strcat(folder,'test_results.png'));

%[num_features, num_images] = size(test_proc_results);
imshow(test_proc_results);
title('Processed Test Results')
xlabel('Images')
ylabel('Features')
saveas(gcf,strcat(folder,'test_processed_results.png'));

close all;

end

