package.path = package.path .. ";?/init.lua;./deps/?.lua"
local parent = "test"
local TK = require("PackageToolkit")
local FX = require("umolflowFramework")
local tests = {
  'task'
}
local M = TK.module.submodules(parent, tests)
TK.test.self(M)
return M
