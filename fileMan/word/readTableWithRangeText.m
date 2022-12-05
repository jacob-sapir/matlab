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
    textFormatted = paragraph.Range.Text;
    
    % get the text in the paragraph
    if paragraphRangeIsInTable
        % get the reference to the table
        table = paragraph.Range.Tables.Item(1);
        numberOfRows = table.Rows.Count;
        numberOfColumns = table.Columns.Count;
        tag = ['[' num2str(numberOfRows) 'x' num2str(numberOfColumns) '] TABLE'];

        % Word uses two characters as a sepearator in a table
        textFormatted = textFormatted(1:end-2);

    elseif strcmp(paragraph.Style.NameLocal, 'Heading 1')
        tag = 'HEADING 1';
    elseif strcmp(paragraph.Style.NameLocal, 'Heading 2')
        tag = 'HEADING 2';
    elseif strcmp(paragraph.Style.NameLocal, 'Heading 3')
        tag = 'HEADING 3';
    else
        tag = 'NO TAG';
    end
    disp([tag ': ' textFormatted]);
    i = i + 1;
end

% 3. close word
closeWord(file, true);