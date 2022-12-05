function writeWorskpaceOnexcel(file_name)
% get all variables from workspace
l = evalin('base', ['whos(' char(39) '*' char(39) ')']);

% format the variables in cells
l_excel = [];
for i = 1:numel(l)
    l_excel = [l_excel; {l(i).name}];
end

% write the list
xlswrite(file_name, l_excel);

% open the excel file
winopen(file_name);

return