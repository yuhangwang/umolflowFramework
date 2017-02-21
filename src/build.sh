rm -rf amalg.cache
lua -lamalg umolflowFramework.lua
lua amalg.lua -s umolflowFramework.lua -c -o ../release/umolflowFramework.lua \
    -i PackageToolkit \
    -i FunctionalX \
    -i ioLua \
    -i lpeg \
    -i lanes
