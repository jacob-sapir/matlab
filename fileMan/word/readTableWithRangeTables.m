% 1. open Activex server
fullPath = pwd;
fileName = 'basicWordDocument.docx';
file = openWord(fullPath, fileName);

% 2. read data from the Word document
document = file.document;
word = file.application;

i = 1;
% we use a while loop because we'll jump when displaying the entire table
while i <= document.Range.Paragraphs.Count
    
    % in matlab  we use collectionName.Item(index) instead of collectionName(index)
    paragraph = word.ActiveDocument.Paragraphs.Item(i);
    
    % identify tables
    paragraphRangeIsInTable = paragraph.Range.Tables.Count > 0;
    
    % get the text in the paragraph
    if paragraphRangeIsInTable
        % get the reference to the table
        table = paragraph.Range.Tables.Item(1);
        i = displayEntireTable(table, i);
    elseif strcmp(paragraph.Style.NameLocal, 'Heading 1')
        textFormatted = paragraph.Range.Text;
        tag = 'HEADING 1';
        disp([tag ': ' textFormatted]);
    elseif strcmp(paragraph.Style.NameLocal, 'Heading 2')
        textFormatted = paragraph.Range.Text;
        tag = 'HEADING 2';
        disp([tag ': ' textFormatted]);
    elseif strcmp(paragraph.Style.NameLocal, 'Heading 3')
        textFormatted = paragraph.Range.Text;
        tag = 'HEADING 3';
        disp([tag ': ' textFormatted]);
    else
        tag = 'NO TAG';
        disp([tag ': ' textFormatted]);
    end
    i = i + 1;
end

% 3. close word
closeWord(file, true);