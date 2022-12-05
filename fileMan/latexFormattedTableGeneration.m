variable1 = 'firstWordInList_TO_BE_DEFINED';
variable2 = 'secondWordInList_TO_BE_DEFINED';
variable3 = 'thirdWordInList_TO_BE_DEFINED';
variable4 = 'fourthWordInList_TO_BE_DEFINED';
matrix = [{variable1} {variable2}; {variable3} {variable4}];

% format the content of the matrix
formattedMatrix = formatMatrixTex(matrix);

filename = 'latexFormattedTable.tex';
delete(filename);
    
fid = fopen(filename, 'at');

header = [{'Name'} {'Description'}];
fontSize = 'scriptsize';
colorHeader = [0.8 0.8 0.8];
Column1Width = 0.4;    
totalTableWidth = 0.87;
sizeColumn1 = Column1Width*totalTableWidth;
sizeColumn2 = totalTableWidth-sizeColumn1;
forcedSize = [sizeColumn1, sizeColumn2];

tableTex(fid, formattedMatrix, header, colorHeader, forcedSize, fontSize);

fclose(fid);