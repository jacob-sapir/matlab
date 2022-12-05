% 'a' is for appending data to the end of the file 
% 't' is for opening the file in text mode
fid = fopen('textFileName.txt', 'at');

fprintf(fid, '%s\n', 'Text to write in the text file');

fclose(fid);