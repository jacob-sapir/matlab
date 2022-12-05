% extract the data 
fileName = 'excelTestOffsetRow.xlsx';                   
sheetNumber = 1;                                 
[num, txt, raw] = xlsread(fileName, sheetNumber);

% write the data
fileName = 'excelOffsetData.xlsx';
sheetNumber = 1;                         
data = txt;                     
xlswrite(fileName, data, sheetNumber); 