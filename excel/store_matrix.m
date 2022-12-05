function store_matrix(file_name, sheet_number, data, full_path, row_offset, column_offset)

currentDir = pwd;
cd(full_path);

if isempty(data)
    data = {''};
end

firstRow = 1+row_offset;
lastRow = size(data, 1)+firstRow-1;
firstCol = dec2base27(1+column_offset);
lastCol = dec2base27(base27dec(firstCol)+size(data, 2)-1);
cellRange = [firstCol num2str(firstRow) ':' lastCol num2str(lastRow)];

% write down the data
xlswrite(file_name, data, sheet_number, cellRange);

cd(currentDir);

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
%   expressed as 'A'..'Z', 'AA','AB'...'AZ', and so on. Note, there is no 
%   zero digit, so, strictly speaking, we use a hybrid base26/base27 number 
%   system.  D must be a positive integer less than 2^52.
%
%   Examples
%       dec2base(1) returns 'A'
%       dec2base(26) returns 'Z'
%       dec2base(27) returns 'AA'
% -----------------------------------------------

d = d(:);
if d ~= floor(d) || any(d(:) < 0) || any(d(:) > 1/eps)
    error(message('MATLAB:xlswrite:Dec2BaseInput'));
end
[num_digits, begin] = calculate_range(d);
s = index_to_string(d, begin, num_digits);

end

function d = base27dec(s)
%   BASE27DEC(S) returns the decimal representation of string S which 
%   represents a number in base 27, expressed as 'A'..'Z', 'AA',
%   'AB'...'AZ', and so on. Note, there is no zero digit, so, strictly 
%   speaking, we're using a hybrid base26/base27 number system.
%
%   Examples
%       base27dec('A') returns 1
%       base27dec('Z') returns 26
%       base27dec('IV') returns 256
% -----------------------------------------------

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

