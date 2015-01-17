
rng(666); % seed used for random number generation
%prep_datasets; %Uncomment to generate new datasets from original data

disp('---------------------------------');
disp('GrayScale training and simulation');
disp('---------------------------------');
grayscale_sim;

%{
%%%%%%
% !!! ------- !!!
% !!! WARNING !!!
% !!! ------- !!!
%
% Disclaimer: Very resource intensive, may cause blue screens or similar.
% Minimum requierment of 16GB of RAM.
%%%%%%
disp('---------------------------------');
disp('RGB training and simulation');
disp('---------------------------------');
rgb_sim;
%}

disp('--------------------------------------------');
disp('Feature Memorability training and simulation');
disp('--------------------------------------------');
mem_sim;

disp('------------------------------------');
disp('Analysing results of all simulations');
disp('------------------------------------');
analyse_image_results;

disp(' ');
disp('Finished!');
disp(' ');

clear all;
