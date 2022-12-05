sheetNumber = 1;
fileName = 'excelTestFile.xlsx';
[~, txt, ~] = xlsread(fileName, sheetNumber);
txt
