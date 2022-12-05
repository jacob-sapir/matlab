% choose the Latex file name
filename = 'basicLatexFileGenerated.tex';
delete(filename);
fid = fopen(filename, 'at');

fprintf(fid, '%s', ['\documentclass[10pt]{article}' char(10)]);
% choose a font for your document
fprintf(fid, '%s', ['\usepackage{mathpazo}' char(10) char(10)]);
% I will explain the packages below in the next section
fprintf(fid, '%s', ['% below, the minimum packages needed to generate the table' char(10)]);
fprintf(fid, '%s', ['\usepackage{xcolor, colortbl}' char(10)]);
fprintf(fid, '%s', ['\usepackage{hyphenat}' char(10)]);
fprintf(fid, '%s', ['\usepackage{longtable}' char(10) char(10)]);
% write the title of your document
fprintf(fid, '%s', ['\title{Generated Latex File}' char(10)]);
% remove the date from the title generated with the command \maketitle
fprintf(fid, '%s', ['\date{}' char(10)]);

% begining of your document
fprintf(fid, '%s', ['\begin{document}' char(10) char(10)]);
% write the title and the table of contents
fprintf(fid, '%s', ['\maketitle' char(10)]);
fprintf(fid, '%s', ['\tableofcontents' char(10) char(10)]);
% write the content of your document
fprintf(fid, '%s', ['\section{First section of the document}' char(10)]);
fprintf(fid, '%s', ['\subsection{First subsection of the document}' char(10)]);
fprintf(fid, '%s', ['\subsubsection{First subsubsection of the document}' char(10)]);
fprintf(fid, '%s', ['Here is a list of bullet points generated from MATLAB:' char(10)]);
fprintf(fid, '%s', ['\begin{itemize}' char(10)]);
fprintf(fid, '%s', ['\item First bullet point' char(10)]);
fprintf(fid, '%s', ['\item Second bullet point' char(10)]);
fprintf(fid, '%s', ['\end{itemize}' char(10) char(10)]);

fprintf(fid, '%s', ['\end{document}' char(10)]);

fclose(fid);