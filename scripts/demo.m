%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% step1:
% use
%     pipline = pipline_init('upper');
% for initiating a fashion landmark detection pipline
% 
% step2:
% use
%     prediction = pipline_forword(img,pipline);
% for getting landmarks of images
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% initiate pipline
addpath(genpath('../caffe/matlab'));
pipline = pipline_init('upper');

image_path = '../data/FLD_upper/';

name_list = dir(image_path);

for i = 1:length(name_list)
    
    if name_list(i).isdir
        continue;
    end
    img_name = [image_path, name_list(i).name];
    img = imread(img_name);
    
    % forward
    prediction = pipline_forword(img, pipline);
    
    
    % show result 
    pipline_show_results(img, prediction);
    
end

% release pipline
pipline_release;
