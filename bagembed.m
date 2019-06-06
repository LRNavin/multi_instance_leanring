% function - bagembed

function m_B = bagembed(bags, instance, sigma)

% m(Bi) - implement equation from paper mentioned
% Store m(Bi) <-> y_i as PRDataset
% Choose sigma sensibly - not all number become 0 or 1

%     sigma = 25;
    distance_f = 0;
    m_i = [];
    m_B = cell(length(bags),1);
    for i=1:length(bags)
        bag_ins = bags{i}; 
        for j=1:size(instance,1)
            for z=1:size(bag_ins,1)
                % Measure of Similarity
                distance_z = exp(-sum((instance(j,:)-bag_ins(z,:)).^2)/sigma^2);
                if(distance_z>distance_f) % Track best similar
                    distance_f = distance_z;
                end
            end
            m_i = [m_i distance_f];
            distance_f = 0;
        end
        m_B{i,1} = m_i;
        m_i = [];
    end

end