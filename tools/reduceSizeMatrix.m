m = [(1:5)' (6:10)' (11:15)' (16:20)'];

% if we want to remove two rows and two columns
reductionNumber = 2;
for i = 1:reductionNumber
    m(end, :) = [];
    m(:, end) = [];
end
m