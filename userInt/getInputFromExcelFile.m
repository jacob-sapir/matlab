function [firstArgument, secondArgument] = getInputFromExcelFile(fileName)

sheetNumber = 1;
[~, txt, ~] = xlsread(fileName, sheetNumber);

refInfoColumn = txt(2:end, 1);
descriptionColumn = txt(2:end, 2);

% use the value -1 if an argument is not found
firstArgument = '-1';
secondArgument = '-1';
for i = 1:numel(descriptionColumn)
    if strcmp(descriptionColumn(i), 'First argument stored')
        firstArgument = refInfoColumn{i};
    end
    if strcmp(descriptionColumn(i), 'Second argument stored')
        secondArgument = refInfoColumn{i};
    end
end

% generate an error if an argument has not been found
argumentsFound = ~((str2num(firstArgument)==-1)||(str2num(secondArgument)==-1));
assert(argumentsFound, ['Issue in ' fileName ', an argument has not been found.']);

end