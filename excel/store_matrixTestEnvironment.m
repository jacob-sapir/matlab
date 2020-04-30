% get the columns from the excel file excelTestFile.xlsx
filename = 'excelTestFile.xlsx';
sheetNumber = 1;
columnSelection = [{1} {3}];
columnSelected = getSelectedColumns(filename, sheetNumber, columnSelection);

filename = 'excelMatrixFile.xlsx';
sheetNumber = 1;
data = columnSelected;
% fullPath is the location of the Excel file
fullPath = pwd; % pwd is the path to the current folder 
% start writing on the row rowOffset+1 (rowOffset = 0 => first row of the Excel File) 
rowOffset = 3;
% start writing on the column columnOffset+1 (columnOffset = 0 => first column of the Excel File) 
columnOffset = 5;
store_matrix(filename, sheetNumber, data, fullPath, rowOffset, columnOffset);
winopen(filename)