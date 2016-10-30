package.path = package.path .. ";?/init.lua;./deps/?.lua"
parent = "test"
TK = require "PackageToolkit"
FX = require "umolflowFramework"
tests = {
    -- 'io'
    'task'
}
M = TK.module.submodules parent, tests

TK.test.self M

return M
