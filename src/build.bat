del amalg.cache
lua -lamalg umolflowFramework.lua
lua amalg.lua -s umolflowFramework.lua -c -o ..\release\umolflowFramework.lua
copy ..\release\umolflowFramework.lua ..\..\luapower