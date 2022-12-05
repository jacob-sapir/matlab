m = [(1:5)' (6:10)' (11:15)' (16:20)'];

% if we want to delete the fourth column
columnToRemove = 4;
m(:, columnToRemove) = []