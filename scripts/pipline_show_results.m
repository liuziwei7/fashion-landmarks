function [  ] = pipline_show_results2( img,prediction )

    visibility_case = {'Visible','Occlude','Inexistent'};
    line_type = {'g*','bo','r^'};
    line_type = {'b.','b.','b.'};

    %% show result 
    img_show = zeros(224*2,224*2,3,'uint8');
    x = prediction.stage3.landmark(1);
    y = prediction.stage3.landmark(2);
    
    img_show(224-x+1:224*2-x,224-y:224*2-y,:) = img;
    
    imshow(img_show);hold on;
%     for c = 1:3
%         is_type = find(strcmp(prediction.stage3.visibility,visibility_case{c}));
% %         plot(prediction.stage3.landmark(is_type*2-1),prediction.stage3.landmark(is_type*2),line_type{c});
%         plot(prediction.stage3.landmark(is_type*2-1),prediction.stage3.landmark(is_type*2),'Color','b',...
%         'LineStyle','none','Marker','.','MarkerSize',15);
%     end
    hold off;pause();
    
end

