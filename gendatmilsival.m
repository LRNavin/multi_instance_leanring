% function - gendatmilsival

function mil_dataset = gendatmilsival(image)

% Go through all sival images
% Extract instances per image
% Store as PRDataset - use bags2dataset
% create class labels, bad identif & store in prdataset - use bagid = getident(a,'milbag')

% How many bags did you obtain? 
% How many features do the instances have?
% How many instances are there per bag?
% Make a scatterplot to see if the instances from the two classes are a bit separable.

mil_dataset = image;
