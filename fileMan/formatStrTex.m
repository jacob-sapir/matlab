function strFormatted = formatStrTex(str)

% get rid of '\', replace them with '\textbackslash'
oldText = '\';
newText = '\textbackslash ';
strFormatted = strrep(str, oldText, newText);

% use the new text to apply the next replacement
str = strFormatted;

% get rid of '_', replace them with '\_'
oldText = '_';
newText = '\_';
strFormatted = strrep(str, oldText, newText);

end