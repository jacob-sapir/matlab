fileToCopy = 'newExcelName.xlsx';
destination = fullfile(pwd, '..');          % .. is the folder up one level
copyfile(fileToCopy, fullfile(destination, fileToCopy))