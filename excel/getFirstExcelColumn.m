function firstColumn = getFirstExcelColumn(filename, sheetNumber)

% get the data in the Excel file
[~, txt, ~] = xlsread(filename, sheetNumber);

% get all the data stored in the first column
columnNumber = 1;
firstColumn = txt(1:end, columnNumber); % 1:end means you select the rows from the first to the last

end