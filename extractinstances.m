% function - extractinstances

function [data_matrix] = extractinstances(image, width_param)
    % Segment Image     
    img_seg = im_meanshift(image,width_param);
    b = max(max(img_seg));
    a = img_seg/b;
    imshow(a);
%     
    seg_num = length(unique(img_seg));
    
    %Return data - Init
    data_matrix = zeros(seg_num,3);

    r_data = image(:,:,1);
    b_data = image(:,:,2);
    g_data = image(:,:,3);

    for i=1:seg_num
        target = (img_seg==i);
        
        % Average R per segment
        red_pix = r_data(target==1);
        red_avg  = sum(red_pix)/length(red_pix);
        
        % Average R per segment
        blue_pix = b_data(target==1);
        blue_avg  = sum(blue_pix)/length(blue_pix);

        % Average G per segment
        green_pix = g_data(target==1);
        green_avg  = sum(green_pix)/length(green_pix);

        % return features for image - data_matrix
        data_matrix(i,1) = red_avg;
        data_matrix(i,2) = blue_avg;
        data_matrix(i,3) = green_avg;
    end

end
