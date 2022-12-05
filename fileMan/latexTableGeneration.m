variable1 = 'firstWordInList';
variable2 = 'secondWordInList';
variable3 = 'thirdWordInList';
variable4 = 'fourthWordInList';
matrix = [{variable1} {variable2}; {variable3} {variable4}];

% choose the Latex file name
filename = 'latexTable.tex';
delete(filename);
fid = fopen(filename, 'at');

header = [{'Name'} {'Description'}];
fontSize = 'scriptsize';
colorHeader = [0.8 0.8 0.8];  % gray color
Column1Width = 0.4;          % width of the first column (1 is full length) 
totalTableWidth = 0.87;       % width of the full table 
% convert the size of the columns to make it a percentage of totalTableWidth
sizeColumn1 = Column1Width*totalTableWidth;
sizeColumn2 = totalTableWidth-sizeColumn1;
forcedSize = [sizeColumn1 sizeColumn2];

tableTex(fid, matrix, header, colorHeader, forcedSize, fontSize);

fclose(fid);