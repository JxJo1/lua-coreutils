#!/usr/bin/env lua

local arg_len = #arg
local PROGRAM_NAME = "yes"

function help()
    help_text = [[
    Usage: yes [STRING]...
    Repeatedly print a line with a string (or y if no string specified)


    Options: 
    -h, --help  Print the help message and exit 
    -v, --version Print the version      
    ]]
    print(help_text)
end



local words = {}

local hasWords = false
if arg_len == 0 then
  while true do
     print("y")
  end
else
    for i = 1, arg_len do
        if arg[i] == "-h" or arg[i] == "--help" then
          help()
        elseif arg[i] == "-v" or arg[i] == "--version" then
          print(PROGRAM_NAME.." (lua coreutils) 0.0.1")
        elseif arg[i] ~= nil and string.sub(arg[i], 1, 1) ~= "-" then
          text = " '%s' "
          table.insert(words, text.format(arg[i]))
          hasWords = true
        elseif string.sub(arg[i], 1, 1) == "-" and #arg[i] > 1 then
           print((PROGRAM_NAME..": invalid argument '%s'"):format(arg[i]))
           os.exit(0)
        
        end
    end
end


if hasWords == true then
  while true do 
      print(table.concat(words, " "))
  end 
end
