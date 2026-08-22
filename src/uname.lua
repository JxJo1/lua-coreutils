#!/usr/bin/env lua


local utsname = require("posix.sys.utsname")
local uname = utsname.uname()
local machine  = uname.machine
local nodename = uname.nodename
local release = uname.release
local sysname = uname.sysname
local os_version = uname.version
local arg_len = #arg
local PROGRAM_NAME = "uname"
local VERSION = require("src.version")

local unameTbl = {
    uname.machine,
    uname.nodename,
    uname.release,
    uname.sysname,
    uname.version
}


function help()
help_text = [[
Usage: uname [OPTION]...
Print certain system information.  With no OPTION, same as -s. 


Options: 
-a, --all             Print all information of the system 
-s, --kernel-name     Print the name of the kernel
-n, --nodename        Print the nodename (the nodename includes the name of your computer in a network)
-r, --kernel-release  Print the kernel release
-v, --kernel-version  Print the kernel version
-m, --machine         Print the machine hardware name (processor type)
-h, --help            Print the help message and exit
--version             Display the version information and exit
]]
print(help_text)
os.exit(0)
end 



if arg_len == 0 then
   print(unameTbl[4])
else
   for i = 1, arg_len do
      if arg[i] == "-a" or arg[i] == "--all" then
        print(table.concat(unameTbl, " "))
        os.exit(0)
      elseif arg[i] == "-s" or arg[i] == "--kernel-name" then
        print(sysname)   
        os.exit(0)
      elseif arg[i] == "-n" or arg[i] == "--nodename" then
        print(nodename)
        os.exit(0)
      elseif arg[i] == "-r" or arg[i] == "--kernel-release" then
        print(release)
        os.exit(0)
      elseif arg[i] == "-v" or arg[i] == "--kernel-version" then
        print(os_version)
        os.exit(0)
      elseif arg[i] == "-m" or arg[i] == "--machine" then
        print(machine)
        os.exit(0)
      elseif arg[i] == "-h" or arg[i] == "--help" then
        help()
        os.exit(0)
      elseif arg[i] == "--version" then
        print(PROGRAM_NAME.." (lua coreutils) "..VERSION)
        os.exit(0)
    elseif string.sub(arg[i], 1, 1) == "-" and #arg[i] > 1 then
      print((PROGRAM_NAME..": invalid argument -- '%s'\nFor more information try 'uname --help"):format(arg[i]))
      os.exit(0)
    else
      print(PROGRAM_NAME..": extra operand '"..arg[i].."'\n".."Try '"..PROGRAM_NAME.." --help' for more information")
      os.exit(0)
    end
    end
end

