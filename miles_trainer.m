% Exercise - 2

% Use bagembed as Dataset
% Train LIKNON
% Test on the dataset


% 1. how many errors is this classier making?
% 1. Is this classier better than the naive MIL classier trained in the previous section?
% 2. What can you do to make this MILES classifier perform better?

% Retrieve RAW & Navine-MIL Dataset
load apple_raw.mat
load banana_raw.mat
load app_ban_dataset.mat


% Labeling Instances 
%%% Apple-Banana Dataset

bags        = [apple_raw;banana_raw];

% Features & Labels
instances   = app_ban_dataset.data;
labels      = app_ban_dataset.nlab;

% MILES - Bags Embed
miles_feats   = bagembed(bags,instances, 70);
miles_label   = [ones(60,1); (2)*ones(60,1)];
dataset_miles = bags2dataset(miles_feats, miles_label);

acc_array = [];
app_array = [];
ban_array = [];
for i = 1:100 % Average Error of 10 runs
    
    [train_set, test_set, train_ind, test_ind] = gendat(dataset_miles,0.7);
    
    svm_1_classif   = liknonc(train_set);
    predict         = labeld(train_set, svm_1_classif);
    
    acc_i = sum(predict == train_set.nlab)/length(predict);
    acc_array = [acc_array acc_i];
    
    
%     % Mis-Classified Apple
%     apple_index = find(test_set.nlab == 1);
%     apple_predict = predict(apple_index);
%     apple_true    = test_set.nlab(apple_index);
%     apple_error = sum(apple_predict == apple_true)/length(apple_predict);
%     app_array = [app_array apple_error];
%     
%     % Mis-Classified Banana
%     banana_index = find(test_set.nlab == 2);
%     banana_predict = predict(banana_index);
%     banana_true    = test_set.nlab(banana_index);
%     banana_error = sum(banana_predict == banana_true)/length(banana_predict);
%     ban_array = [ban_array banana_error];
    
end

disp("MEAN ACCURACY - " + (1 - mean(acc_array)))
% disp("Apple ACCURACY - " + (1-mean(app_array)))
% disp("Banana ACCURACY - " + (1-mean(ban_array)))
