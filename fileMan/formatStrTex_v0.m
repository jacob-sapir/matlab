function strFormatted = formatStrTex(str)

% get rid of '\', replace them with '\textbackslash'
[C, matches] = strsplit(str, '\');
strFormatted = [];
for i = 1:numel(matches)
    strFormatted = [strFormatted C{i} '\textbackslash '];
end
% if numel(matches) = 0 (no '\'), then i is empty
if isempty(i)
    strFormatted = C{:};
else
    strFormatted = [strFormatted C{i+1}];
end

% use the new text to apply the next replacement
str = strFormatted;

% get rid of '_', replace them with '\_'
[C, matches] = strsplit(str, '_');
strFormatted = [];
for i = 1:numel(matches)
    strFormatted = [strFormatted C{i} '\_'];
end
% if numel(matches) = 0 (no '_'), then i is empty
if isempty(i)
    strFormatted = C{:};
else
    strFormatted = [strFormatted C{i+1}];
end

end