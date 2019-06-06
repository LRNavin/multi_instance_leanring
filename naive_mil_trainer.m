% Exercise - 1
% Train MIL (Naive) - Use Fisher classifier

% Method
% 1. Dataset - prdataset form gendatmilsival
% 2. Just Train Fisher 
% 3. Apply (2) to each instance in bag - Classify the instances
% 4. Combine (use combineinstlabels) to predict bag label


% 1. How many apple images are misclassied to be banana? And viceversa? 
% 2. Why is this error estimate not trustworthy?
% 3. Estimate the classication error in a trustworthy way!


% Retrieve RAW & Navine-MIL Dataset
load apple_raw.mat
load banana_raw.mat
load app_ban_dataset.mat


% Labeling Instances 
%%% Apple-Banana Dataset - Only Bag from raw - With Label
bags             = [apple_raw;banana_raw];
bags_true_label  = [ones(length(apple_raw),1); (-1)*ones(length(banana_raw),1)];

% Fit Fisher Classifier on instances dataset
fishclf = fisherc(app_ban_dataset);
instance_labels = labeld(app_ban_dataset, fishclf);

% plot
n_app  = sum(app_ban_dataset.nlab==1);
n_ban = sum(app_ban_dataset.nlab==-1);

a = app_ban_dataset.data;
figure()
scatter3(a(1:n_app,1),a(1:n_app,2),a(1:n_app,3),'filled','r')
hold on
scatter3(a(n_app+1:end,1), a(n_app+1:end,2), a(n_app+1:end,3),'filled','y')
legend('Apple','Banana')
hold off

bag_start = 1;
bag_prediction = [];
for i=1:length(bags)
    %Combine for Each Bag - (Collection of instances)
    bag_size    = size(bags(i),1);
    bag_set     = instance_labels(bag_start:bag_start+bag_size-1);
    bag_start   = bag_start + bag_size;
    
    % Finally - Label for bag obtained 
    bag_label = combineinstlabels(bag_set);

    bag_prediction = [bag_prediction; bag_label];
end

% Total error for dataset
error = sum((bag_prediction ~= bags_true_label));

% Mis-Classified Apple
apple_error = sum((bag_prediction(1:60) ~= bags_true_label(1:60)));

% Mis-Classified Banana
banana_error = sum((bag_prediction(61:120) ~= bags_true_label(61:120)));

disp("Total Error - " + error)
disp("APPLE Error - " + apple_error)
disp("BANANA Error - " + banana_error)

