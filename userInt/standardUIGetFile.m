extensions = {'*.xlsx';'*.xls'};
dialogBoxTitle = 'Choose an Excel file';
defaultFile = 'defaultExcelFileName';
[fileName, pathName, ~] = uigetfile(extensions, dialogBoxTitle, defaultFile);
