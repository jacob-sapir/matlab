m = [(1:5)' (6:10)' (11:15)' (16:20)'];

% if we want to remove the last two columns
numberOfColumnsToRemove = 2;
m = m(:, 1:(end-numberOfColumnsToRemove))