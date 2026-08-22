#!/usr/bin/env lua



local usr_env = os.getenv("USER")
local arg_len = #arg
local PROGRAM_NAME = "whoami"
local VERSION = require("src.version")


function help()
help_text = [[
Usage: whoami
Print the current user name


Options: 
-h, --help  Print the help message and exit 
-v, --version Print the version      
]]
    print(help_text)
end


if arg_len == 0 then
  print(usr_env)
else
  for i = 1, arg_len do
    if arg[i] == "-h" or arg[i] == "--help" then
      help()
  else if arg[i] == "-v" or arg[i] == "--version" then
     print(PROGRAM_NAME.." (lua coreutils) "..VERSION)
  else if string.sub(arg[i], 1, 1) == "-" and #arg[i] > 1 then
    print((PROGRAM_NAME..": invalid argument '%s'"):format(arg[i]))
    os.exit(0)
  else
      print(PROGRAM_NAME..": extra operand '"..arg[i].."'\n".."Try '"..PROGRAM_NAME.." --help' for more information")
      os.exit(0)
  end
    end
    end
  end
end
