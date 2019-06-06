
function mil_dataset = gendatmilsival()

    data1_apple_path  = dir(fullfile('dataset','sival_apple_banana','apple','*.jpg'));
    data1_banana_path = dir(fullfile('dataset','sival_apple_banana','banana','*.jpg'));
    dataset_pointers = [data1_apple_path, data1_banana_path];
    apple_raw   = cell(length(data1_apple_path),1);
    banana_raw  = cell(length(data1_banana_path),1);

    width_param = 20; % Width Parameter for Mean Shift
    
    for i=1:size(dataset_pointers,2)
        dataset = dataset_pointers(:,i);
        for j=1:length(dataset)
            img     = imread(fullfile(dataset(j).folder, dataset(j).name)); % Read Data Images from dataset
            img_seg = extractinstances(img, width_param); % Extract Instances - Using Mean shift and color average
            if i== 1
                apple_raw{j,1} = img_seg;
            elseif i == 2
                banana_raw{j,1} = img_seg;
            end
        end
    end
    
    % Dataset creation
    apple_label  = ones(length(data1_apple_path),1);
    banana_label = (-1)*ones(length(data1_banana_path),1);
    bags_appl_bana   =   [apple_raw; banana_raw];
    baglab_appl_bana =   [apple_label; banana_label];

    mil_dataset = bags2dataset(bags_appl_bana, baglab_appl_bana); % MIL - Dataset Creation

end
