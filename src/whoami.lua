#!/usr/bin/env lua


local stdlib = require("posix.stdlib")
local USR_ENV = stdlib.getenv("USER") 
local arg_len = #arg
local PROGRAM_NAME = debug.getinfo(1, "S").source:sub(6,-5)
local VERSION = require("src.version")


function help()
help_text = [[
Usage: %s
Print the current user name


Options: 
-h, --help  Print the help message and exit 
-v, --version Print the version      
]]
    print(help_text.format(help_text, PROGRAM_NAME))
    os.exit(0)
end


if arg_len == 0 then
   print(USR_ENV)
else
   for i = 1, arg_len do
   if arg[i] == "-h" or arg[i] == "--help" then
      help()
   elseif arg[i] == "-v" or arg[i] == "--version" then
      print(PROGRAM_NAME.." (lua coreutils) "..VERSION)
      os.exit(0)
   else if string.sub(arg[i], 1, 1) == "-" and #arg[i] > 1 then
      print((PROGRAM_NAME..": invalid argument '%s'"):format(arg[i]))
      os.exit(1)
   else
         print(PROGRAM_NAME..": extra operand '"..arg[i].."'\n".."Try '"..PROGRAM_NAME.." --help' for more information")
         os.exit(1)
   end
      end
   end
end

