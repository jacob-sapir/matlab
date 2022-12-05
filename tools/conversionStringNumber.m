% num2str convert a number to a string
numberToConvertToStr = 1;
stringValue = num2str(numberToConvertToStr);

% str2num convert a string to a number
stringToConvertToNb = '3';
numberValue = str2num(stringToConvertToNb);

% you can check the type using the function class
class(numberValue) % (double is a type of number)
class(stringValue) % (char is a type of string)