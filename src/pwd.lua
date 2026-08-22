#!/usr/bin/env lua

local unistd = require("posix.unistd")
local arg_len = #arg
local cwd = unistd.getcwd
local readlink = unistd.readlink
local PWD_ENV = os.getenv("PWD")
local VERSION = require("src.version")
local PROGRAM_NAME = "pwd"

function help()
help_text = [[
Usage: pwd [OPTION]...
Display the current working directory.


Options: 
-L, --logical         use 
-P, --physical        a
-h, --help            Print the help message and exit
--version             Display the version information and exit
]]
print(help_text)
os.exit(0)
end 

if arg_len == 0 then
  print(cwd())
else
   for i = 1, arg_len do
      if arg[i] == "-h" or arg[i] == "--help" then
         help()
      elseif arg[i] == "-v" or arg[i] == "--version" then
          print(PROGRAM_NAME.." (lua coreutils) "..VERSION)
      elseif arg[i] == "-P" or arg[i] == "--physical" then
        local _, symlink = pcall(readlink, cwd())
        if symlink == nil then
          print(cwd())
        else
          print(symlink)
        end
      elseif arg[i] == "-L" or arg[i] == "--logical" then
          print(PWD_ENV)
      end
   end
end
