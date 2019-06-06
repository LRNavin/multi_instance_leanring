function citers = knn_citations(dataset, dataset_lbl, test_index, k)

    for i = 1:length(dataset)
        distance = [];
        for j = 1:length(dataset)
            distance(1,j) = get_bag_distance(dataset{i}, dataset{j});
        end
        [values, indexes] = mink(distance,k);
        neighbor_ind(i,:) = indexes;
    end

    counter = 0;
    for j = 1:length(dataset)
          if ismember(test_index,neighbor_ind(j,:))
                counter = counter + 1;
                citers(counter,1) = dataset_lbl(j);
          end
    end