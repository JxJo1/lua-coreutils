#!/bin/bash



LUA_VERSION=5.4.8
VERSION=0.1.1-1

mkdir -p prerequisites/ && cd prerequisites/

echo "Downloading lua 5.4.8 .."
wget https://lua.org/ftp/lua-${LUA_VERSION}.tar.gz || exit 1
tar -zxf lua-${LUA_VERSION}.tar.gz && cd lua-${LUA_VERSION}
make posix CC=musl-gcc
cd .. || exit 1
git clone https://github.com/luaposix/luaposix.git 


echo "Compiling..."
musl-gcc -O2 -c luaposix/ext/posix/posix.c \
-include net/if.h \
-Iluaposix/ext/include \
-Iluaposix/ext/posix \
-Ilua-5.4.8/src \
-D_XOPEN_SOURCE=700 \
-D_BSD_SOURCE \
-D_DEFAULT_SOURCE \
-DPACKAGE='"luaposix"' \
-DVERSION='"37.3"'

echo "Creating archives.."
ar rcs libluaposix.a posix.o


cd .. || exit 1
echo "Compiling lua files into executables"


SOURCE_FILES=$(find src/*.lua -type f -not -name 'version.lua')
for main in $SOURCE_FILES; do
    CC=musl-gcc luastatic "$main" src/version.lua \
    prerequisites/lua-${LUA_VERSION}/src/liblua.a \
    prerequisites/libluaposix.a \
    -Iprerequisites/lua-${LUA_VERSION}/src\;
done

if [[ $(file sleep | grep executable) ]]; then
   mkdir -p bin/
   mv false bin/
   mv true bin/
   mv pwd bin/
   mv sleep bin/
   mv uname bin/
   mv whoami bin/
   mv yes bin/
   rm -rf *.luastatic.c
fi

tar -czvf lua-coreutils-${VERSION}.tar.gz bin/


echo "Exit status: $?"
