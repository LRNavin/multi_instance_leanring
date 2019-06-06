function distance = get_bag_distance(bag1, bag2)

length2 = size(bag2,1);
for j = 1:length2 %iterate through bag2
    instance_B = bag2(j,:);
    distances(j,:) = vecnorm(bag1' - instance_B');
end

min_val = min(min(distances));
distance = min_val;
