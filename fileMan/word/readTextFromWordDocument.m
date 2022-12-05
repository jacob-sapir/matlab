% 1. open Activex server
fullPath = pwd;
fileName = 'basicWordDocument.docx';
file = openWord(fullPath, fileName);

% 2. read data from the Word document
document = file.document;
word = file.application;

for i = 1:document.Range.Paragraphs.Count
    
    % in matlab  we use collectionName.Item(index) instead of collectionName(index)
    paragraph = word.ActiveDocument.Paragraphs.Item(i);
    textFormatted = paragraph.Range.Text;
    
    % get the text in the paragraph
    if strcmp(paragraph.Style.NameLocal, 'Heading 1')
        tag = 'HEADING 1';
    elseif strcmp(paragraph.Style.NameLocal, 'Heading 2')
        tag = 'HEADING 2';
    elseif strcmp(paragraph.Style.NameLocal, 'Heading 3')
        tag = 'HEADING 3';
    else
        tag = 'NO TAG';
    end
    disp([tag ': ' textFormatted]);
end

% 3. close word
closeWord(file, true);