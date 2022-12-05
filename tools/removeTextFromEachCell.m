list = [{'firstWord_TO_BE_DEFINED'}; ...
    {'secondWord_TO_BE_DEFINED'}; ...
    {'thirdWord_TO_BE_DEFINED'}];

newList = [];
for i = 1:numel(list)
    % every word is split in two words
    [token, remain] = strtok(list{i}, '_');
    % the first part is added to a new list
    newList = [newList; {token}];
end
newList