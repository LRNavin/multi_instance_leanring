% function - combineinstlabels
% Combiner Voting Function

function max_label = combineinstlabels(labels)

    % Majority voting for label return
    possible_label = unique(labels);

    majority_vote = -10000;
    for i = 1:length(possible_label)
        label_len = sum(labels==possible_label(i));
        if label_len > majority_vote
            max_label = possible_label(i);
            majority_vote = label_len;
        end
    end
end