
 function classifier = train_citation_KNN(bags, bags_labels, train_bag, train_lab, test_bag, test_index, c_param, k_param)
        
     % Get Citers and Neighors for Dataset
     citations = knn_citations(bags, bags_labels, test_index, c_param);
     neighbors = knn_neighbors(train_bag, train_lab, test_bag, k_param);

     % Assign Neighbors and Citers to Classifer Obj                         
     classifier.citations    = citations;
     classifier.neighbors    = neighbors;
    
 end