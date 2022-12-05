function storingInExcelFile(excelFileName)
% We are using numbers as input for this function to make it a little bit
% more challenging

prompt = 'What is the first argument to store in the excel file?\n';
% char(39) is an apostrophe, it defines a string data type instead of a number
firstInputArgument = [char(39) num2str(input(prompt))];

prompt = 'What is the second argument to store in the excel file?\n';
secondInputArgument = [char(39) num2str(input(prompt))];

matrix = [...
    {['Reference Information for Inputs.']}, {['']}...
    ;{firstInputArgument}, {'First argument stored'}...
    ;{secondInputArgument}, {'Second argument stored'}...
    ];

sheetNumber = 1;
lineOffset = 0;
excelFilePath = pwd;
store_matrix(excelFileName, sheetNumber, matrix, excelFilePath, lineOffset);
winopen(excelFileName);
return 