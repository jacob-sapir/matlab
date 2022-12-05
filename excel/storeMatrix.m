function storeMatrix(matrix, fileName, sheetNumber, sheetName, fullPath, offset)

versionNumber = 'v2.0';
disp(['Current version: ' versionNumber]);

if isempty(matrix)
    matrix = {''};
end

if nargin < 6
    offset.row = 0;
    offset.column = 0;
end

if nargin < 5
    fullPath = pwd;
end

if nargin < 4
    sheetName = '';
end

if nargin < 3
    sheetNumber = 1;
end

currentDir = pwd;
cd(fullPath);

% add the row and column offset to the range
cellRange = computeCellRange(matrix, offset);

% write down the data
xlswrite(fileName, matrix, sheetNumber, cellRange);

% rename the sheet if sheetName is not empty
renameXlsxSheet(fileName, sheetNumber, sheetName, fullPath);

cd(currentDir);

end

function cellRange = computeCellRange(matrix, offset)

firstRow = 1 + offset.row;
lastRow = size(matrix, 1) + firstRow - 1;
firstCol = dec2base27(1 + offset.column);
lastCol = dec2base27(base27dec(firstCol) + size(matrix, 2) - 1);
cellRange = [firstCol num2str(firstRow) ':' lastCol num2str(lastRow)];

end

function string = index_to_string(index, first_in_range, digits)

letters = 'A':'Z';
working_index = index - first_in_range;
outputs = cell(1,digits);
[outputs{1:digits}] = ind2sub(repmat(26,1,digits), working_index);
string = fliplr(letters([outputs{:}]));

end

function s = dec2base27(d)
%   DEC2BASE27(D) returns the representation of D as a string in base 27,
%   expressed as 'A'..'Z', 'AA','AB'...'AZ', and so on. Note, there is no zero
%   digit, so strictly we have hybrid base26, base27 number system.  D must be a
%   negative integer bigger than 0 and smaller than 2^52.
%
%   Examples
%       dec2base(1) returns 'A'
%       dec2base(26) returns 'Z'
%       dec2base(27) returns 'AA'
% --------------------------------------------

d = d(:);
if d ~= floor(d) || any(d(:) < 0) || any(d(:) > 1/eps)
    error(message('MATLAB:xlswrite:Dec2BaseInput'));
end
[num_digits, begin] = calculate_range(d);
s = index_to_string(d, begin, num_digits);

end 

function d = base27dec(s)
%   BASE27DEC(S) returns the decimal of string S which represents a number in
%   base 27, expressed as 'A'..'Z', 'AA','AB'...'AZ', and so on. Note, there is
%   no zero so strictly we have hybrid base26, base27 number system.
%
%   Examples
%       base27dec('A') returns 1
%       base27dec('Z') returns 26
%       base27dec('IV') returns 256
% --------------------------------------------

if length(s) == 1
   d = s(1) -'A' + 1;
else
    cumulative = 0;
    for i = 1:numel(s)-1
        cumulative = cumulative + 26.^i;
    end
    indexes_fliped = 1 + s - 'A';
    indexes = fliplr(indexes_fliped);
    indexes_in_cells = mat2cell(indexes, 1, ones(1,numel(indexes))); %#ok<MMTC>
    d = cumulative + sub2ind(repmat(26, 1,numel(s)), indexes_in_cells{:});
end

end 

function [digits, first_in_range] = calculate_range(num_to_convert)

digits = 1;
first_in_range = 0;
current_sum = 26;
while num_to_convert > current_sum
    digits = digits + 1;
    first_in_range = current_sum;
    current_sum = first_in_range + 26.^digits;
end

end

function renameXlsxSheet(fileName, sheetNumber, sheetName, fullPath)

if ~isempty(sheetName)
    % 1. open Activex server
    excelPath = fullfile(fullPath, fileName);
    excel = actxserver('Excel.Application');
    document = excel.Workbooks.Open(excelPath);
    
    % 2. process the file
    document.Worksheets.Item(sheetNumber).Name = sheetName;
    document.Save % # save to the same file
    
    % 3. close excel
    document.Close(false); % close the document
    excel.Quit; % close excel
    delete(excel); % delete server object
end

end