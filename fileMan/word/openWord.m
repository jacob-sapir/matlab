function file = openWord(fullPath, fileName)

wordPath = fullfile(fullPath, fileName);
word = actxserver('Word.Application');
document = word.Documents.Open(wordPath);

file.application = word;
file.document = document;

end