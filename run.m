
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

analyse_results;

disp(' ');
disp('Finished!');
disp(' ');

clear all;
