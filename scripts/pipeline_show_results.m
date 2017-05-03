function [  ] = pipeline_show_results( img,prediction )

    visibility_case = {'Visible','Occlude','Inexistent'};
    line_type = {'g*','bo','r^'};
    line_type = {'b.','b.','b.'};

    %% show result 
    imshow(img);hold on;
    for c = 1:3
        is_type = find(strcmp(prediction.stage1.visibility,visibility_case{c}));
        plot(prediction.stage1.landmark(is_type*2-1),prediction.stage1.landmark(is_type*2),line_type{c});
    end
    hold off;pause();
    
    imshow(img);hold on;
    for c = 1:3
        is_type = find(strcmp(prediction.stage2.visibility,visibility_case{c}));
        plot(prediction.stage2.landmark(is_type*2-1),prediction.stage2.landmark(is_type*2),line_type{c});
    end
    hold off;pause();

    imshow(img);hold on;
    for c = 1:3
        is_type = find(strcmp(prediction.stage3.visibility,visibility_case{c}));
%         plot(prediction.stage3.landmark(is_type*2-1),prediction.stage3.landmark(is_type*2),line_type{c});
        plot(prediction.stage3.landmark(is_type*2-1),prediction.stage3.landmark(is_type*2),'Color','b',...
        'LineStyle','none','Marker','.','MarkerSize',15);
    end
    hold off;pause();
    
end


