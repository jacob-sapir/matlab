% 1. open Activex server
fullPath = pwd;
fileName = 'basicWordDocument.docx';
file = openWord(fullPath, fileName);

% 2. process the file
word = file.application;
word.Visible = true; % make it visibile on the screen

word.Selection.Style = 'Heading 1'; % enter the style (section, subsection, ...)
word.Selection.ParagraphFormat.Alignment = 1;  % center-align the title
word.Selection.Font.Size = 35; % change the font size
word.Selection.TypeText('Generated Word Document'); % enter the title here
word.Selection.TypeParagraph; % press the enter key
word.Selection.TypeParagraph; 
word.Selection.Style = 'Heading 2';
word.Selection.Font.Size = 20;
word.Selection.TypeText('This Is the First Heading');
word.Selection.TypeParagraph; 
word.Selection.Style = 'Normal';
word.Selection.TypeText('Here is some text.');
word.Selection.TypeParagraph;
word.Selection.Style = 'Heading 2';
word.Selection.Font.Size = 20;
word.Selection.TypeText('This Is the Second Heading');
word.Selection.TypeParagraph; 
word.Selection.Style = 'Heading 3';
word.Selection.Font.Size = 15;
word.Selection.TypeText('Here Is a Table');
word.Selection.TypeParagraph; 

% create a table
word.Selection.Style = 'Normal';
table = word.Selection.Tables.Add(word.Selection.Range, 3, 2, 1, 1); % insert a table
table.Rows.Alignment = 'wdAlignRowCenter'; % center the table

% define a color for the table header
R = 204;
G = 204;
B = 204;
digit = 2; % number of digits in the hexadecimal number
BGRHex = [dec2hex(B, digit) dec2hex(G, digit) dec2hex(R, digit)]; % BGR in hexadecimal 
BGRDec = hex2dec(BGRHex); % BGR in decimal format

% write the table
word.Selection.Shading.BackgroundPatternColor = BGRDec;
word.Selection.Font.Bold = true;  
word.Selection.TypeText('My');
word.Selection.MoveRight;
word.Selection.Shading.BackgroundPatternColor = BGRDec;
word.Selection.Font.Bold = true; 
word.Selection.TypeText('Table');
word.Selection.MoveRight;
word.Selection.TypeText('A');
word.Selection.MoveRight;
word.Selection.TypeText('B');
word.Selection.MoveRight;
word.Selection.TypeText('C');
word.Selection.MoveRight;
word.Selection.TypeText('D');

% 3. close word
closeWord(file, true);




