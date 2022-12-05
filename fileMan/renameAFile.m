fileName = 'excelTestFile.xlsx';
newFileName = 'newExcelName.xlsx';
% keep the file at its existing location but with a different name
movefile(fileName, newFileName);