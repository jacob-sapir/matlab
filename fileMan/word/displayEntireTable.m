function indexUpdated = displayEntireTable(table, index)

numberOfRows = table.Rows.Count;
numberOfColumns = table.Columns.Count;
for i = 1:numberOfRows
    for j = 1:numberOfColumns
        textFormatted = table.Cell(i, j).Range.Text;
        % Word uses two characters as a sepearator in a table
        textFormatted = textFormatted(1:end-2);
        disp(['C(' num2str(i) ', ' num2str(j) ') ' textFormatted]);
    end
end

indexUpdated = index + numberOfRows*numberOfColumns + numberOfRows;

end