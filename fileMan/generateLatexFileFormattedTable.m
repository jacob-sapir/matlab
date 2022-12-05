% write down the latex file
filename = 'latexFileGeneratedFormattedTable.tex';
delete(filename);

fid = fopen(filename, 'at');

fprintf(fid, '%s', ['\documentclass[10pt]{article}' char(10)]);
fprintf(fid, '%s', ['\usepackage{mathpazo}' char(10) char(10)]);

fprintf(fid, '%s', ['% below, the minimum packages needed to generate the table' char(10)]);
fprintf(fid, '%s', ['\usepackage{xcolor, colortbl}' char(10)]);
fprintf(fid, '%s', ['\usepackage{hyphenat}' char(10)]);
fprintf(fid, '%s', ['\usepackage{longtable}' char(10) char(10)]);
fprintf(fid, '%s', ['\title{Generated Latex File}' char(10)]);
fprintf(fid, '%s', ['\date{}' char(10)]);

fprintf(fid, '%s', ['\begin{document}' char(10) char(10)]);
fprintf(fid, '%s', ['\maketitle' char(10) char(10)]);
fprintf(fid, '%s', ['\section{First section of the document}' char(10)]);
fprintf(fid, '%s', ['This is the table that has been written from MATLAB:' char(10)]);
fprintf(fid, '%s', ['\input{latexFormattedTable.tex}' char(10) char(10)]);
fprintf(fid, '%s', ['\end{document}' char(10)]);

fclose(fid);