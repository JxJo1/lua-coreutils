#!/usr/bin/env lua



--[[
Some notes about this:

The sleep function on line 34 is actually a block of code i borrowed from this resource: http://lua-users.org/wiki/SleepFunction 
because lua doesn't have a built in sleep function :(

posix.unistd.sleep() could technically work, but it uses integers and not floats, it wouldn't work if we put in floats or decimals, we want to have both integers and floats 

--]]


local arg_len = #arg
local PROGRAM_NAME = debug.getinfo(1, "S").source:sub(6,-5)
local signal = require("posix.signal")
local VERSION = require("src.version")



function help()
help_text = ([[
Usage: %s NUMBER[SUFFIX]...
sleep OPTION
Pause for a specific NUMBER of seconds, the SUFFIX may be 's' for seconds which is the default, 
'm' for minutes, 'h' for hours, 'd' for days or even 'ms' for milliseconds. Optionally,
two or more arguments can be specified to pause for the amount of time specified by the sum of their values. 

Options: 
-h, --help            Print the help message and exit
--version             Display the version information and exit
]])
    print(help_text.format(help_text, PROGRAM_NAME))
    os.exit(0)
end

function sleep(num, time)
   local clock = os.clock
   local endClock = clock()

   if not num and time then
      return nil
   end
   if time then
      while clock() - endClock <= num * time do end
   else
      while clock() - endClock <= num do end
   end
end


function parse_time_interval(i) 
    if not arg then
        return nil
    end
         if string.sub(arg[i], -2, -1) == "ms" then
             local s = string.gsub(arg[i], "ms", "")
             local num = tonumber(s)
            
             sleep(num, 1/1000)
         elseif string.sub(arg[i], -1, -1) == "s" then
             local s = string.gsub(arg[i], "s", "")
             local num = tonumber(s)
             
             sleep(num, 1)
         elseif string.sub(arg[i], -1, -1) == "m" then
             local s = string.gsub(arg[i], "m", "")
             local num = tonumber(s)
             
             sleep(num, 60)
         
         elseif string.sub(arg[i], -1, -1) == "h" then
             local s = string.gsub(arg[i], "h", "")
             local num = tonumber(s)
            
             sleep(num, 3600)

         elseif string.sub(arg[i], -1, -1) == "d" then
             local s = string.gsub(arg[i], "d", "")
             local num = tonumber(s)
             
             sleep(num, 86400)

         else
            print(("%s: Invalid time interval '%s'"):format(PROGRAM_NAME, arg[i]).."\nTry ".."'"..PROGRAM_NAME.." --help'".." for more information.")
            os.exit(1)
    end
end

-- Exit on Ctrl-C 
signal.signal(signal.SIGINT, function(signum)
  os.exit(128 + signum)
end)


if arg_len == 0 then
   print(PROGRAM_NAME..": missing operand\n".."Try sleep --help for more information.")
else 
   for i = 1, arg_len do
      if arg[i] == "-h" or arg[i] == "--help" then
          help()
      elseif arg[i] == "-v" or arg[i] == "--version" then
          print(PROGRAM_NAME.." (lua coreutils) "..VERSION)
          os.exit(0)
      elseif string.sub(arg[i], 1, 1) == "-" and #arg[i] > 1 then
          print((PROGRAM_NAME..": invalid argument -- '%s'\nFor more information try '"..PROGRAM_NAME.."--help'"):format(arg[i]))
          os.exit(1)
      elseif type(tonumber(arg[i])) == "number" then
         sleep(tonumber(arg[i]))

       elseif type(arg[i]) == "string" then
         parse_time_interval(i)    
         end
       end
   end
