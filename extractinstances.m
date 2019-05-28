% function - extractinstances

function data_matrix = extractinstances(image, width_param)

% Segment Image 
% Average RGB per segment
% return features for image

data_matrix = image * width_param;
