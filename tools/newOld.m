function [newElements removedElements] = newOld(oldList, newList)

newElements = [];
removedElements = [];
% check that no name occurs twice in the old list
for i = 1:length(oldList)
    nameLoop1 = oldList(i);
    for j = (i+1):length(oldList)
        nameLoop2 = oldList(j);
        if strcmp(nameLoop1, nameLoop2) > 0
            error('The same name occurs twice in the old list');
        end
    end
end

% check that no name occurs twice in the new list
for i = 1:length(newList)
    nameLoop1 = newList(i);
    for j = (i+1):length(newList)
        nameLoop2 = newList(j);
        if strcmp(nameLoop1, nameLoop2) > 0
            error('The same name occurs twice in the new list');
        end
    end
end

% look for new elements added to newList relative to the old list 
for i = 1:length(newList)
    notNew = 0;
    elementNewList = newList(i);
    for j = 1: length(oldList)
        elementOldList = oldList(j);
        if strcmp(elementNewList, elementOldList) > 0
            % if an element in the new list is found in the old one, it is 
            % not new
            notNew = 1;
            break
        end
    end
    if ~notNew
        % if the element is new, add it to the list
        newElements = [newElements ; elementNewList];
    end
end


% look for elements removed from newList relative to the new list
for i = 1:length(oldList)
    notRemoved = 0;
    elementOldList = oldList(i);
    for j = 1:length(newList)
        elementNewList = newList(j);
        if strcmp(elementNewList, elementOldList) > 0
            notRemoved = 1;
            break
        end
    end
    if ~notRemoved
        % if the element has been removed, add it to the list
        removedElements = [removedElements ; elementOldList];
    end
end

end