function [ prediction ] = pipline_forword( img_orig, pipline)

    %% image resize & pad

    scale = 224 / max(size(img_orig));
    s1 = round(size(img_orig,1) *scale);
    s2 = round(size(img_orig,2) *scale);
    if size(img_orig,1) == 224 && size(img_orig,2) == 224
        img_resi = img_orig;
        offset = [0,0,0];
    else
        img_resi = imresize(img_orig,[s1,s2]);

        pad = [224 224 0] - size(img_resi);
        pad(pad<0) = 0;

        offset = floor(pad./2);
        img_resi = padarray(img_resi, offset,'pre');
        img_resi = padarray(img_resi, pad-offset,'post');
    end
    
    assert(size(img_resi,1) == 224);
    assert(size(img_resi,2) == 224);
    
    
    %% image normalization
    pixel_means = reshape([102.9801, 115.9465, 122.7717], [1 1 3]);
    img_stan = single(img_resi);
    img_stan = permute(img_stan, [2, 1, 3]);
    img_stan = img_stan(:, :, [3, 2, 1]);
    img_stan = bsxfun(@minus, img_stan, pixel_means);
    
    
    
    get_orig_coordinate = @(p)((p+0.5)*224-repmat([offset(2),offset(1)]',[pipline.num_points,1]))/scale;
    visibility_case = {'Visible','Occlude','Inexistent'};
    
    %% stage 1 fp
    res_stage1 = pipline.net_stage1.forward({img_stan});
    landmark_stage1 = res_stage1{1}(1:pipline.num_points*2);
    
    [~,v1] = max(reshape(res_stage1{1}(1+pipline.num_points*2:end),3,pipline.num_points));
    visibility_stage1 = visibility_case(v1);
    
    prediction_stage1 = struct('landmark',get_orig_coordinate(landmark_stage1),...
        'visibility',{visibility_stage1});
    
    %% stage 2 fp   
    res_stage2 = pipline.net_stage2.forward({img_stan,landmark_stage1});
    landmark_stage2 = landmark_stage1-res_stage2{1}(1:pipline.num_points*2)/5;
    
    [~,v2] = max(reshape(res_stage2{1}(1+pipline.num_points*2:end),3,pipline.num_points));
    visibility_stage2 = visibility_case(v2);
    
    prediction_stage2 = struct('landmark',get_orig_coordinate(landmark_stage2),...
        'visibility',{visibility_stage2});
    
    %% stage 3 fp
    res_stage3_easy = pipline.net_stage3_easy.forward({img_stan,landmark_stage2});
    res_stage3_hard = pipline.net_stage3_hard.forward({img_stan,landmark_stage2});
    landmark_stage3 = landmark_stage2 -...
        (res_stage3_easy{1}(1:pipline.num_points*2)/5 ...
        + res_stage3_hard{1}(1:pipline.num_points*2)/5)/2;
    
    [~,v3] = max(reshape(res_stage3_easy{1}(1+pipline.num_points*2:end)+...
        res_stage3_hard{1}(1+pipline.num_points*2:end),3,pipline.num_points));
    visibility_stage3 = visibility_case(v3);
    
    prediction_stage3 = struct('landmark',get_orig_coordinate(landmark_stage3),...
        'visibility',{visibility_stage3});
    
    %% output
    
    prediction = struct('stage1',prediction_stage1,...
                        'stage2',prediction_stage2,...
                        'stage3',prediction_stage3,...
                        'num_points',pipline.num_points);
                    
                    
    
end

