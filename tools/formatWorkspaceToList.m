variable1 = 'firstWordInList';
variable2 = 'secondWordInList';
variable3 = 'thirdWordInList';
variable4 = 'fourthWordInList';

% get all parameters that start with "variable" 
list = whos('variable*');

% access the second variable in the list
list(2).name

% access the content of the second variable in the list
content = evalin('base', list(2).name)