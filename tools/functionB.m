function valueOfTheString = functionB(string)

valueOfTheString = evalin('caller', string);
  
end
