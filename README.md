# Lua Coreutils

Lua coreutils is a **work-in-progress** attempt of reimplementing half of GNU coreutils commands in [Lua](https://lua.org). Although most commands function similarly to the GNU coreutils commands, they might also behave differently and there may be some missing features & flags in those commands. Each command utilizes [luaposix](https://github.com/luaposix/luaposix/) and is used from these commands to access the C POSIX features and functions in Lua using those bindings. 

Below is a list of commands and the progress of each reimplementation of these following commands, more will be added soon.

| Commands | Status  | 
| ----------- | ----------- |
| ls | wip |
| cp | wip |
| rm | wip |
| mv | wip |
| echo | wip |
| yes  | wip |
| whoami  | wip |
| true  | complete |
| false | complete |
| uname | wip |
| sleep | wip |
| mkdir | wip |
| pwd | wip |

# Install

## Installing through source

### Prerequisites

You need to have the following packages installed via your distro's package manager

- lua
- luarocks 

Clone this repository
```
git clone https://github.com/JxJo1/lua-coreutils
cd lua-coreutils
```

This will create the folder and build the commands that are executables into the `env/bin` directory.
```
luarocks make lua-coreutils-0.1.2-1.rockspec --tree=env
```

After you've done one of the following, you can then run any command from this example usage of commands. 
```
env/bin/uname -a
env/bin/sleep 2s 
env/bin/whoami
```

## Installing binaries

If you simply want the executable binaries instead, you can download them through the [Releases page](https://github.com/JxJo1/lua-coreutils/releases), extract them and run those commands in the extracted folder, make sure to add `chmod +x` before each command in the terminal otherwise they won't run.

Example: `./sleep`


# FAQ

## Will this project be GPL licensed like GNU Coreutils?

It will be MIT licensed only, the same license that Lua uses. 

## Will all of the commands be cross-platform, including windows? 

Porting these commands to Windows would obviously not be possible, because since the Windows NT ecosystem that people use normally isn't fully POSIX-compliant, the POSIX-based commands & commands that utilize luaposix won't work on Windows, unless you're using something like [Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/about) as a workaround if possible. I will add macOS support in the near future, for now i'm currently focusing towards linux.

## Will this be a replacement to GNU Coreutils?

**This project is not intended to be a full on replacement of GNU coreutils** or reinventing the wheel, this is a side hobby project that i'm doing mainly for fun and for experimenting Lua and the capabilites of the programming language :)

## Are you gonna distribute lua-coreutils through the distro's repos such as the AUR, Copr, Alpine or the NixOS repositories? 

While it would be nice & convenient to have the same package on specific distros rather than just through luarocks alone, i unfortunately do not have that time to commit to it and the energy to do so, i don't know how the whole packaging process works for either of the mentioned distributions.


# License 
This project is licensed under the [MIT License](https://opensource.org/license/MIT), see the [LICENSE](https://github.com/JxJo1/lua-coreutils/blob/main/LICENSE) file for details.

GNU Coreutils is licensed under the [GPL-3.0 or later](https://www.gnu.org/licenses/gpl-3.0.en.html) license.
