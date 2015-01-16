function save_images( folder, val_results, val_proc_results, test_results, test_proc_results)

%Saves the inputs into the specified folder as .png images

iptsetpref('ImshowAxesVisible', 'on');
imshow(val_results);
title('Validation Results')
xlabel('Images')
ylabel('Features')
saveas(gcf,strcat(folder,'validation_results.png'));

imshow(val_proc_results);
title('Processed Validation Results')
xlabel('Images')
ylabel('Features')
saveas(gcf,strcat(folder,'validation_processed_results.png'));

imshow(test_results);
title('Test Results')
xlabel('Images')
ylabel('Features')
saveas(gcf,strcat(folder,'test_results.png'));

imshow(test_proc_results);
title('Processed Test Results')
xlabel('Images')
ylabel('Features')
saveas(gcf,strcat(folder,'test_processed_results.png'));

close all;

end

