%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% step1:
% use
%     pipeline = pipeline_init('upper');
% for initiating a fashion landmark detection pipeline
% 
% step2:
% use
%     prediction = pipeline_forword(img,pipeline);
% for getting landmarks of images
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% initiate pipeline
addpath(genpath('../caffe/matlab'));
pipeline = pipeline_init('upper');

image_path = '../data/FLD_upper/';

name_list = dir(image_path);

for i = 1:length(name_list)
    
    if name_list(i).isdir
        continue;
    end
    img_name = [image_path, name_list(i).name];
    img = imread(img_name);
    
    % forward
    prediction = pipeline_forword(img, pipeline);
    
    
    % show result 
    pipeline_show_results(img, prediction);
    
end

% release pipeline
pipeline_release;
