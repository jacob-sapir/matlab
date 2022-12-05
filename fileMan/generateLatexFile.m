clc; fclose all;

% write down the latex file
filename = 'latexFileGeneratedExample.tex';
try 
    delete(filename);
end

fid = fopen(filename, 'at');

fprintf(fid, ['\\documentclass{article}' '\n']);
fprintf(fid, ['\n']);
fprintf(fid, ['%% below, the minimum packages needed to include the table generated' '\n']);
fprintf(fid, ['\\usepackage{xcolor, colortbl}' '\n']);
fprintf(fid, ['\\usepackage{hyphenat}' '\n']);
fprintf(fid, ['\\usepackage{longtable}' '\n']);
fprintf(fid, ['\n']);
fprintf(fid, ['\\begin{document}' '\n']);
fprintf(fid, ['\n']);
fprintf(fid, ['\\include{latexTable}' '\n']);
fprintf(fid, ['\n']);
fprintf(fid, ['\\end{document}' '\n']);

fclose(fid);