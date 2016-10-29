del amalg.cache
lua -lamalg umolflowFramework.lua
type amalg.cache ^
    | findstr -V PackageToolkit ^
    | findstr -V FunctionalX ^
    | findstr -V ioLua ^
    | findstr -V lpeg ^
    | findstr -V dkjson ^
    > tmp.txt
move tmp.txt amalg.cache
lua amalg.lua -s umolflowFramework.lua -c -o ..\release\umolflowFramework.lua
copy ..\release\umolflowFramework.lua ..\..\luapower