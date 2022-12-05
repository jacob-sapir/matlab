m = [(1:5)' (6:10)' (11:15)' (16:20)'];

% the apostrophe is the transpose function 
column = (20:24)';
% get columns 1 and 2 
firstPart = m(:, 1:2);
% get columns 3 and 4 
secondPart = m(:, 3:4);

% insert between the second and third columns
m = [firstPart column  secondPart]
