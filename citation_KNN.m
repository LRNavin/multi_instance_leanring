
 function obj = train_citation_KNN(total_dataset, total_labels, train_bag, train_baglab, test_bag, test_index, k, c)
     %total_dataset: training dataset + testing dataset.
     %total_labels: training dataset labels + testing
     %dataset labels.
     %train_bag: training dataset.
     %train_baglab: training dataset labels.
     %test_bag: testing dataset.
     %test_index: applicable only in the case of "leave one
     %out" cross validation, where the index implies the
     %position of the testing data in total_dataset.
     %k: hyper-parameter for k-nearest neighbors
     %c: hyper-parameter for c-nearest citers
     [neighbors, neighbor_labels] = get_neighbors(train_bag, train_baglab, test_bag, k);
                              citers = get_citers(total_dataset, total_labels, test_index, c);
     obj.nearest_citers = citers;
     obj.nearest_neighbors = neighbor_labels;
 
 
 
     
 end