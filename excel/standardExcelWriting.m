% first we define what to write
variable1 = 'firstWordInList';
variable2 = 'secondWordInList';
variable3 = 'thirdWordInList';
variable4 = 'fourthWordInList';
matrix = [{variable1} {variable2}; {variable3} {variable4}];

% then we write it
fileName = 'excelTestWritingFile.xlsx';  % name of the file
sheetNumber = 1;                           % number of the sheet to write to 
data = matrix;                                % data defined as a matrix
xlswrite(fileName, data, sheetNumber); % write the data