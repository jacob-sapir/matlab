function storeColumn(filename, data, sheetNumber)

% prevent errors in case of empty data
if isempty(data)
    data = {''};
end

% select the cell range in which to store the data 
firstRow = 1;
lastRow = size(data, 1);
cellRange = ['A' num2str(firstRow) ':A' num2str(lastRow)];

% store the column in the Excel file
xlswrite(filename, data, sheetNumber, cellRange);

end