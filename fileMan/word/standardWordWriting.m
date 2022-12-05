% 1. open Activex server
fullPath = pwd;
fileName = 'wordTestFile.docx';
file = openWord(fullPath, fileName);

% 2. process the file
document = file.document;
document.Content.Text = 'Test.';

% 3. close word
closeWord(file, true);