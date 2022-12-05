function [Old_dico, pathname_Old_dico, New_dico, pathname_New_dico, ...
    deliveryNumber] = GetInfoFromReference(systemName)
New_dico = ['DataDictionary_swc' systemName '.xlsx'];
Old_dico = New_dico;
pathname_New_dico = '../../0000_Documentation';

currentDir = pwd;
cd('doc_generated');
filename = 'delivery_reference_information.xlsx';
sheet = 1;

[~, txt, ~] = xlsread(filename, sheet);

refInfoColumn = txt(2:end, 1);
descriptionColumn = txt(2:end, 2);

deliveryNumber = '-1';
previousDeliveryNumber = '-1';
for i = 1:length(descriptionColumn)
    if strcmpi(descriptionColumn(i), 'Delivery number')
        deliveryNumber = refInfoColumn{i};
    end
    if strcmpi(descriptionColumn(i), 'Previous delivery number')
        previousDeliveryNumber = refInfoColumn{i};
    end
end

if (str2num(deliveryNumber) == -1)||(str2num(previousDeliveryNumber) == -1)
    error(['Issue in ' filename ', a reference information has not been found.']);
end

cd(currentDir);

pathname_Old_dico = ['../../../../Deliveries/AS' previousDeliveryNumber '/AS' previousDeliveryNumber '/Software/' systemName '/0000_Documentation'];
try
    cd(pathname_Old_dico);
    cd(currentDir);
catch
    pathname_Old_dico = ['../../../../Deliveries/AS' previousDeliveryNumber '/Software/' systemName '/0000_Documentation'];
end
return