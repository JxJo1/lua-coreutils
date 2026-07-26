# Lua Coreutils

Lua coreutils is a **work-in-progress** attempt of reimplementing almost half of all GNU coreutils commands in [Lua](https://lua.org). While most commands work similarly to the coreutils commands, however, they might also behave differently and there may be some missing features & flags in those commands. [Luaposix](https://github.com/luaposix/luaposix/) is used for these commands to access the C POSIX features in Lua using those bindings 

Right now there isn't anything here in the repository yet, the files are still wip and i didn't want to commit them here because they're still messy, i simply updated the README just to give an explanation about what this project will be



# FAQ

## Will this project be GPL licesned just like GNU Coreutils?

No, it will be MIT licesned

## Will all of the commands be cross-platform (Windows, macOS)? 

That will be for later, right now i'm currently focusing towards linux. 

## Will this be a replacement to GNU Coreutils?

This project is not intended to be a full on replacement of GNU coreutils, or reinventing the "third wheel" but rather as a side hobby project that i'm doing simply for fun!

# License 
This project is licensed under the [MIT License](https://opensource.org/license/MIT), see the [LICENSE]() file for details

GNU Coreutils is licensed under the [GPL-3.0 or later](https://www.gnu.org/licenses/gpl-3.0.en.html) license
