function list = GUIArgumentList(argumentsDialogDescription)

prompt = [];
for i = 1:numel(argumentsDialogDescription)
    prompt = [prompt {argumentsDialogDescription{i, :}}];
end 
dlgTitle = 'Version numbers';
list = inputdlg(prompt, dlgTitle);

end