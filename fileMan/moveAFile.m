fileName = 'excelTestFile.xlsx';
destination = fullfile(pwd, 'newFolder'); % pwd is the current folder location
movefile(fileName, fullfile(destination, fileName));