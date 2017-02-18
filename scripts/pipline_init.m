function [ pipline ] = pipline_init( model_type )

if strcmp(model_type,'upper')
    num_points = 6;
    
    model_stage1 = '../models/FLD_upper/stage1.prototxt';
    weights_stage1 = '../models/FLD_upper/stage1.caffemodel';

    model_stage2 = '../models/FLD_upper/cascade.prototxt';
    weights_stage2 = '../models/FLD_upper/stage2.caffemodel';

    model_stage3 = '../models/FLD_upper/cascade.prototxt';
    weights_stage3_easy = '../models/FLD_upper/stage3_easy.caffemodel';
    weights_stage3_hard = '../models/FLD_upper/stage3_hard.caffemodel';
    
elseif strcmp(model_type,'lower')
    num_points = 4;
    
    model_stage1 = '../models/FLD_lower/stage1.prototxt';
    weights_stage1 = '../models/FLD_lower/stage1.caffemodel';

    model_stage2 = '../models/FLD_lower/cascade.prototxt';
    weights_stage2 = '../models/FLD_lower/stage2.caffemodel';

    model_stage3 = '../models/FLD_lower/cascade.prototxt';
    weights_stage3_easy = '../models/FLD_lower/stage3_easy.caffemodel';
    weights_stage3_hard = '../models/FLD_lower/stage3_hard.caffemodel';  
    
elseif strcmp(model_type,'full')
    num_points = 8;
    
    model_stage1 = '../models/FLD_full/stage1.prototxt';
    weights_stage1 = '../models/FLD_full/stage1.caffemodel';

    model_stage2 = '../models/FLD_full/cascade.prototxt';
    weights_stage2 = '../models/FLD_full/stage2.caffemodel';

    model_stage3 = '../models/FLD_full/cascade.prototxt';
    weights_stage3_easy = '../models/FLD_full/stage3_easy.caffemodel';
    weights_stage3_hard = '../models/FLD_full/stage3_hard.caffemodel'; 
    
else
    error('Undefiened Model Type');
end

caffe.reset_all();
caffe.set_mode_gpu();
caffe.set_device(0);

% create net and load weights
net_stage1 = caffe.Net(model_stage1, weights_stage1, 'test'); 
net_stage2 = caffe.Net(model_stage2, weights_stage2, 'test');
net_stage3_easy = caffe.Net(model_stage3, weights_stage3_easy, 'test');
net_stage3_hard = caffe.Net(model_stage3, weights_stage3_hard, 'test');

pipline = struct('num_points',num_points,'net_stage1',net_stage1,'net_stage2',net_stage2,...
'net_stage3_easy',net_stage3_easy,'net_stage3_hard',net_stage3_hard);

end

