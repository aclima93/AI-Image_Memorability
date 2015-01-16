
%Uncomment to generate new datasets from original data
%prep_datasets;

disp('---------------------------------');
disp('GrayScale training and simulation');
disp('---------------------------------');
grayscale_sim;

%{
%%%%%%
% WARNING !!!
% Very resource intensive, may cause blue screens or similar.
% Minimum requierment of at least 16GB of RAM.
%%%%%%
disp('---------------------------------');
disp('RGB training and simulation');
disp('---------------------------------');
rgb_sim;
%}

disp('------------------------------------');
disp('Analysing results of all simulations');
disp('------------------------------------');
analyse_image_results;


disp('--------------------------------------------');
disp('Feature Memorability training and simulation');
disp('--------------------------------------------');
prep_objects_data;


disp(' ');
disp('Finished!');
disp(' ');

clear all;
