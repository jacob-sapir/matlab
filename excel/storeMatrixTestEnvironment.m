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
% start writing on the row rowOffset+1 (offset.row = 0 => first row of the Excel File) 
offset.row = 3;
% start writing on the column columnOffset+1 (offset.column = 0 => first column) 
offset.column = 5;
% sheetName is the name of the sheet you want to give 
sheetName = ''; 
storeMatrix(data, filename, sheetNumber, sheetName, fullPath, offset);
winopen(filename)