function storeArgumentsInExcelFile(excelFileName)
% We are using numbers as input for this function to make it more generic

prompt = 'What is the first argument to be stored?\n';
% char(39) is a single quotation mark, it defines a string data type instead of a number in Excel
firstInputArgument = [char(39) num2str(input(prompt))];

prompt = 'What is the second argument to be stored?\n';
secondInputArgument = [char(39) num2str(input(prompt))];

matrix = [...
    {['Reference Information for Inputs.']}, {['']}...
    ;{firstInputArgument}, {'First argument stored'}...
    ;{secondInputArgument}, {'Second argument stored'}...
    ];

sheetNumber = 1;
rowOffset = 0;
columnOffset = 0;
excelFilePath = pwd;
store_matrix(excelFileName, sheetNumber, matrix, excelFilePath, rowOffset, columnOffset);
winopen(excelFileName);

end