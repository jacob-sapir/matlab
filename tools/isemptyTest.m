% if we define an empty variable, isempty outputs 1
variable = [];
isempty(variable)

% otherwise, isempty outputs 0
variable = 1;
isempty(variable)