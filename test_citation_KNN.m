function test_label = test_citation_KNN(obj)
     if obj.citations ~= 0
           for j = 1:length(obj.neighbors)
                test_label(j) = combineinstlabels([obj.neighbors{j};obj.citations]);
           end
     else
           for j = 1:length(obj.neighbors)
                test_label(j) = combineinstlabels([obj.neighbors{j}]);
           end
     end
end
