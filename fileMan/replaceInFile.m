function replaceInFile(file, oldText, newText)

[fileName, fileExtension] = strtok(file, '.');
scriptFileNew = [fileName '_new' fileExtension];

if exist(scriptFileNew) == 2
    delete(scriptFileNew);
end

fin = fopen([fileName fileExtension]);
fout = fopen(scriptFileNew, 'w');

previousTxtNotFound = true;
while ~feof(fin)
    textLineEntry = fgetl(fin);
    if ~isempty(strfind(textLineEntry, oldText))
        textLineEntry = strrep(textLineEntry, oldText, newText);
        previousTxtNotFound = false;
    end
    fprintf(fout, '%s\n', textLineEntry);
end

fclose(fin);
fclose(fout);

assert(previousTxtNotFound, ['Error occured, ' oldText ' has not been found in ' fileName ' file.']);

end
