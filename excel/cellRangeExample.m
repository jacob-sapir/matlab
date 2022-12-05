fileName = 'excelTestFile.xlsx';
sheetNumber = 1;
firstSelectedRow = '1';
lastSelectedRow = '4';
firstSelectedColumn = 'A';
lastSelectedColumn = 'B';
cellRange = [firstSelectedColumn firstSelectedRow ':' lastSelectedColumn lastSelectedRow];
[~, txt, ~] = xlsread(fileName, sheetNumber, cellRange);   
