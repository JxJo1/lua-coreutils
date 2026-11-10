#!/usr/bin/env lua

local arg_len = #arg
local PROGRAM_NAME = debug.getinfo(1, "S").source:sub(6,-5)
local signal = require("posix.signal")
local unistd = require("posix.unistd")
local VERSION = require("src.version")
local stdout = unistd.STDOUT_FILENO

function help()
    help_text = ([[
    Usage: yes [STRING]...
    Repeatedly print a line with a string (or y if no string specified)


    Options: 
    -h, --help  Print the help message and exit 
    -v, --version Print the version      
    ]])
    print(help_text)
    os.exit(0)
end

--[[
SIGPIPE -> 13
SIGINT -> 2

Exit code: 128 + SIGINT = 130 

SIGPIPE is already handled by default
--]]


function handler(signum)
   os.exit(128 + signum)
end 
sigint = signal.signal(signal.SIGINT, handler)


local words = {}

local hasWords = false

for i = 1, arg_len do
        if arg[i] == "-h" or arg[i] == "--help" then
          help()
        elseif arg[i] == "-v" or arg[i] == "--version" then
          print(PROGRAM_NAME.." (lua coreutils) "..VERSION)
          os.exit(0)
        elseif arg[i] ~= nil and string.sub(arg[i], 1, 1) ~= "-" then
          text = " '%s' "
          table.insert(words, text.format(arg[i]))
          hasWords = true
        elseif string.sub(arg[i], 1, 1) == "-" and #arg[i] > 1 then
           print((PROGRAM_NAME..": invalid argument '%s'"):format(arg[i]))
           os.exit(1)
        
      end
end


output_string = nil

if arg_len < 1 and hasWords == false then
  output_string = "y"
else
  output_string = table.concat(words, " ")
end


while true do 
   print(output_string)
end 

