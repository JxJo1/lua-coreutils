# Lua Coreutils

Lua coreutils is a **work-in-progress** attempt of reimplementing almost half of all GNU coreutils commands in [Lua](https://lua.org). Most commands work similarly to the coreutils commands, however, they might also behave differently and there may be some missing features & flags in those commands. [Luaposix](https://github.com/luaposix/luaposix/) is used from these commands to access the C POSIX features and functions in Lua using those bindings 

Below is a list of commands reimplemented and the implementation progress of these commands are shown for each command, more will be added soon

| Commands | Status  | 
| ----------- | ----------- |
| yes  | beta |
| whoami  | complete |
| true  | complete |
| false | complete |
| uname | complete |



# Install

## Prerequisites

You need to have the following packages installed via your distro's package manager

- lua
- luarocks 

## Installing through source
All you need to do is simply download the zip file from the [Releases page]() and extract them or you can simply clone the repo 

```
git clone https://github.com/JxJo1/lua-coreutils
cd lua-coreutils
```

This will create the folder and build the commands that are executables into the `env/bin` directory.
```
luarocks make lua-coreutils-0.0.1-1.rockspec --tree=env
```

After you've done one of the following, you can then run any command in the following directory such as `env/bin/uname` for example and you're basically done!

# FAQ

## Will this project be GPL licensed just like GNU Coreutils?

No, it will be MIT licensed only.

## Will all of the commands be cross-platform, including windows? 

Porting these commands to windows would obviously not be possible, because since the Windows NT ecosystem isn't POSIX-compliant natively, the POSIX-based commands & commands that utilize luaposix won't work on windows, unless you're using something like [Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/about). I will add MacOS support in the near future, for now i'm currently focusing on linux.

## Will this be a replacement to GNU Coreutils?

This project is not intended to be a full on replacement of GNU coreutils, or reinventing the "third wheel" but rather as a side hobby project that i'm doing simply for fun, and for experimenting Lua and the capabilites of the programming language :)

## Why not distribute those as executables into a zip file?
I'm still trying to figure out how to compile those source files into standalone executables and the process is quite complicated so it'll take some time for me to find workarounds or ways on how to do it.


# License 
This project is licensed under the [MIT License](https://opensource.org/license/MIT), see the [LICENSE]() file for details

GNU Coreutils is licensed under the [GPL-3.0 or later](https://www.gnu.org/licenses/gpl-3.0.en.html) license
