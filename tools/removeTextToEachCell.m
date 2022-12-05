list = [{'firstWordInList_ADDED_TEXT'} ; {'secondWordInList_ADDED_TEXT'} ; {'thirdWordInList_ADDED_TEXT'}];

newList = [];
for i = 1:numel(list)
    [token, remain] = strtok(list{i}, '_');
    newList = [newList ; {token}];
end
newList