list = [{'firstWord'}; {'secondWord'}; {'thirdWord'}];

desiredText = '_TO_BE_DEFINED';
% numel output the number of cells 
newList = [];
for i = 1:numel(list)
    newList = [newList; {[list{i} desiredText]}];
end
newList