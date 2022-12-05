function closeWord(file, save)

word = file.application;
document = file.document;

document.Close(save); % close the document
word.Quit; % close word
delete(word); % delete server object

end