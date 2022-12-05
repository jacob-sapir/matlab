clc
fclose all;

% update the date
fileName = 'textExample';
previous_text = 'currentDate';
new_text = '01/10/2018';
replaceInFile(fileName, previous_text, new_text)

% replace the new file with the previous one
try
    delete(fileName);
end
movefile([fileName '_new.txt'], [fileName '.txt']);

% update the title
fileName = 'textExample';
previous_text = 'currentTitle';
new_text = 'This is a Title Example';
replaceInFile(fileName, previous_text, new_text)

try
    delete(fileName);
end
movefile([fileName '_new.txt'], [fileName '.txt']);