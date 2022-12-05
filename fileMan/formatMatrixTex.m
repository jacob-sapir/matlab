function formattedMatrix = formatMatrixTex(matrix)

formattedMatrix = [];
for i = 1:size(matrix, 1)
    currentRow = [];
    for j = 1:size(matrix, 2)
        currentCell = formatStrTex(matrix{i,j});
        currentRow = [currentRow {currentCell}];
    end
    formattedMatrix = [formattedMatrix; currentRow];
end

end