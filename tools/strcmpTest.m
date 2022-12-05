text1 = 'firstWord';
text2 = 'secondWord';

% if text2 and text1 are not the same, the output is 0
strcmp(text1, text2)

% give the value "firstWord" to the variable text2
text2 = text1;

% if text2 and text1 are the same, the output is 1
strcmp(text1, text2)