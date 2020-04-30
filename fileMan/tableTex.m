function tableTex(fid, table, header, colorHeader, forcedSize, fontSize)

assert(size(table, 2)==numel(header), 'The header of the table is not the same size as the table.');
assert(size(table, 2)==numel(forcedSize), 'The forced size is not the same size as the table.');

column = [];
for i = 1:numel(forcedSize)
    column = [column 'p{' num2str(forcedSize(i)) '\textwidth}|'];
end

red = num2str(colorHeader(1));
green = num2str(colorHeader(2));
blue = num2str(colorHeader(3));
fprintf(fid, '%s', ['\definecolor{colorTblHeader}{rgb}{' red ',' green ', ' blue '}' char(10)]);
fprintf(fid, '%s', ['{\' fontSize char(10) '\begin{longtable}{|' column '}' char(10) '\hline' char(10)]);

% format the header and write the table
formattedHeader = [{['\multicolumn{1}{|c|}{\cellcolor{colorTblHeader} \textbf{' header{1} '}}']} ...
    {['\multicolumn{1}{|c|}{\cellcolor{colorTblHeader} \textbf{' header{2} '}}']}];
completeTable = [formattedHeader; table];
writeArray(fid, completeTable);

fprintf(fid, '%s', ['\end{longtable}' char(10) '}' char(10)]);

end

function writeArray(fid, array)

for i = 1:size(array, 1)
    fprintf(fid, '%s', ['   	' array{i, 1}]);
    for j = 2:size(array, 2)
        fprintf(fid, '%s', [' & ' array{i, j}]);
    end
    fprintf(fid, '%s', ['\\ \hline' char(10)]);
end

end