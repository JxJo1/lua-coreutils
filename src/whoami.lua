#!/usr/bin/env lua



local usr_env = os.getenv("USER")
local arg_len = #arg
local PROGRAM_NAME = "whoami"



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
     print(PROGRAM_NAME.." (lua coreutils) 0.0.1")
  else if string.sub(arg[i], 1, 1) == "-" and #arg[i] > 1 then
    print((PROGRAM_NAME..": invalid argument '%s'"):format(arg[i]))
    os.exit(1)
  end
    end
    end
  end
end
