
%%%%%%%%Data Reader File%%%%%%%%%%%

% 1. Read images
% 2. 4 directories - Banana, Apple, Medal, Box
% 3. Image to Segments - MeanShift (additional code) [Use made fn.extractinstances()]
% 4. Segments to cell-array of bags ? - use gendatmilsival
% 5. Bags to Prtools dataset

% WIDTH PARAMETER FOR "Segmentation"

READ_DATA_IMG = 1;

if READ_DATA_IMG
    
    width_param = 30;

    data1_apple_path  = dir(fullfile('dataset','sival_apple_banana','apple','*.jpg'));
    data1_banana_path = dir(fullfile('dataset','sival_apple_banana','banana','*.jpg'));

    data2_medal_path  = dir(fullfile('dataset','sival_medal_tea','goldmedal','*.jpg'));
    data2_tbox_path   = dir(fullfile('dataset','sival_medal_tea','greenteabox','*.jpg'));

    dataset_pointers = [data1_apple_path, data1_banana_path];%, data2_medal_path, data2_tbox_path];

    apple_raw   = cell(length(data1_apple_path),1);
    banana_raw  = cell(length(data1_banana_path),1);
    medal_raw   = cell(length(data2_medal_path),1);
    tbox_raw    = cell(length(data2_tbox_path),1);


    for i=1:size(dataset_pointers,2)
        disp("Folder_Index = " + (i))
        dataset = dataset_pointers(:,i);

        for j=1:length(dataset)
            disp("Image_Index = " + (j))
            % Read Data Images from dataset
            img     = imread(fullfile(dataset(j).folder, 'tung6_Apple_122.jpg'));
            % Extract Instances - Using Mean shift and color average
            img_seg = extractinstances(img, width_param);
            break
            if i== 1
                apple_raw{j,1} = img_seg;
            elseif i == 2
                banana_raw{j,1} = img_seg;
            elseif i == 3
                medal_raw{j,1} = img_seg;
            else
                tbox_raw{j,1} = img_seg;
            end
        end
        break
    end
else
    load app_ban_dataset.mat
    load apple_raw.mat
end

% Labeling Instances 
%%% Apple-Banana Dataset
apple_label  = ones(length(data1_apple_path),1);
banana_label = (-1)*ones(length(data1_banana_path),1);
%%% Medal-Box Dataset
medal_label  = ones(length(data2_medal_path),1);
tbox_label   = (-1)*ones(length(data2_tbox_path),1);

% MIL - Dataset Creation
%%% Apple - Banana Dataset
bags_appl_bana   =   [apple_raw; banana_raw];
baglab_appl_bana =   [apple_label; banana_label];

app_ban_dataset = bags2dataset(bags_appl_bana, baglab_appl_bana);

%%% Medal - Tea Box Dataset
% bags_medal_tbox     =   [raw_data_array(:,3); raw_data_array(:,4)];
% baglab_medal_tbox   =   [medal_label; tbox_label];
% 
% medal_tbox_dataset  = bags2dataset(bags_medal_tbox, baglab_medal_tbox);

