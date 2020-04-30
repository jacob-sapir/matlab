% get the columns from excelTestFile.xlsx
flNm = 'excelTestFile.xlsx';
sheetNb = 1;
colSln = [{3}];
colSel = getSelectedColumns(flNm, sheetNb, colSln);

% store the column in excelTestWritingFile.xlsx
flNm = 'excelTestWritingFile.xlsx';
sheetNb = 1;
data = colSel;
storeColumn(flNm, data, sheetNb);
winopen(flNm); % open the Excel file 