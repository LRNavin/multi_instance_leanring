function references = knn_references(train_data, train_label, test_data, k)

for i = 1:length(test_data)
    bag_test = test_data{i};
    distance = [];
    for j = 1:length(train_data)
        bag_train = train_data{j};
        distance(1,j) = get_bag_distance(bag_train, bag_test);
    end
    [k_min_values, k_ind] = mink(distance,k); 
    references{i} = train_label(k_ind);
end

