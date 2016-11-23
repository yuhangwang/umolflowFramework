@echo off
del amalg.cache
lua -lamalg umolflowFramework.lua
rem type amalg.cache ^
rem     | findstr -V PackageToolkit ^
rem     | findstr -V FunctionalX ^
rem     | findstr -V ioLua ^
rem     | findstr -V lpeg ^
rem     | findstr -V dkjson ^
rem     | findstr -V lanes ^
rem     > tmp.txt
rem move tmp.txt amalg.cache

lua amalg.lua -s umolflowFramework.lua -c -o ..\release\umolflowFramework.lua ^
    -i PackageToolkit ^
    -i FunctionalX ^
    -i ioLua ^
    -i lpeg ^
    -i dkjson ^
    -i lanes
copy ..\release\umolflowFramework.lua ..\..\luapower