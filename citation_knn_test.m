%Citation KNN

% Retrieve RAW & Navine-MIL Dataset
load apple_raw.mat
load banana_raw.mat


% Labeling Instances 
%%% Apple-Banana Dataset
bag_of_instances   = [apple_raw; banana_raw];
baglabs            = [ones(length(apple_raw),1);(-1)*ones(length(banana_raw),1)];

c = 3;
k = 50;
for i = 1:5
    % Test - 30 Train 70 Split
    test_index = randperm(length(bag_of_instances), 0.3*length(bag_of_instances));
    train_index = exclude([1:120], test_index);

    %partitioning original dataset into test dataset and train dataset
    test_bag = {bag_of_instances{[test_index]}};
    test_baglab = baglabs([test_index]);
    train_bag = {bag_of_instances{[train_index]}};
    train_baglab = baglabs([train_index]);

    cKNN_classifier = train_citation_KNN(bag_of_instances, baglabs, train_bag, train_baglab, test_bag, test_index, k, c);
    test_label      = test_citation_KNN(cKNN_classifier);

    errors = sum(test_baglab' ~= test_label);
    error_rate(i) = errors / length(test_label);
end
average_error = mean(error_rate);
disp("Average ACCURACY - " + (1-average_error))

