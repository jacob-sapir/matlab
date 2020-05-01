function [newElements removedElements] = newOld(oldList, newList)

% check that no name occurs twice in the old and new lists 
checkElementRedundancy(oldList);
checkElementRedundancy(newList);
referenceList = oldList; % look for elements added to the new list relative to the old one
newElements = getAddedElements(referenceList, newList);
referenceList = newList; % look for elements added to the old list relative to the new one
removedElements = getAddedElements(referenceList, oldList);

end

function addedElements = getAddedElements(referenceList, list)

addedElements = [];
for i = 1:numel(list)
    notAdded = 0;
    elementCandidate = list(i);
    for j = 1:numel(referenceList)
        elementReferenceList = referenceList(j);
        if strcmp(elementCandidate, elementReferenceList)
            notAdded = 1; % if an element in the list is found in the reference one, it is not new
            break
        end
    end
    if ~notAdded
        addedElements = [addedElements; elementCandidate];
    end
end

end

function checkElementRedundancy(list)

for i = 1:numel(list)
    nameLoop1 = list(i);
    for j = (i+1):numel(list)
        nameLoop2 = list(j);
        notARedundancy = ~strcmp(nameLoop1, nameLoop2);
        assert(notARedundancy, 'The same name occurs twice in a list');
    end
end

end