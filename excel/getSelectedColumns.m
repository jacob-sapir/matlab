function columnSelected = getSelectedColumns(filename, sheetNumber, columnSelection)

% get the data in the Excel file
[~, txt, ~] = xlsread(filename, sheetNumber);

% get and format as a matrix of all the desired columns from the column selection
columnSelected = [];
for i = 1:numel(columnSelection)
    currentColumn = txt(1:end, columnSelection{i});
    columnSelected = [columnSelected currentColumn];
end

end