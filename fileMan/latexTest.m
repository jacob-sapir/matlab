clc; fclose all;

variable1 = 'firstWordInList_ADDED_TEXT';
variable2 = 'secondWordInList_ADDED_TEXT';
variable3 = 'thirdWordInList_ADDED_TEXT';
variable4 = 'fourthWordInList_ADDED_TEXT';
matrix = [{variable1} {variable2} ; {variable3} {variable4}];
% format the content of the matrix
formated_matrix = formatMatrixTex(matrix);

% write down the latex file
filename = 'latexTable.tex';
try 
    delete(filename);
end
fid = fopen(filename, 'at');

fprintf(fid, ['\\section{This is the first section of the document}' '\n']);
fprintf(fid, ['This is the table that has been written from MATLAB:' '\n']);
header = [{'Name'} {'Description'}];
fontsize = 'scriptsize';
color_header = [0.8 0.8 0.8];
Column1Width = 0.4;             % width of the first column (1 is full length) 
totalTableWidth = 0.87;         % width of the full table 
sizeColumn1 = Column1Width*totalTableWidth;
sizeColumn2 = totalTableWidth-sizeColumn1;
forced_size = [sizeColumn1, sizeColumn2];
tableTex(fid, formated_matrix, header, color_header, forced_size, fontsize);

fclose(fid);