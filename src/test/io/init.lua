local TK = require("PackageToolkit")
local M = { }
local me = ...
local name = "io"
local members = {
  "readin",
  "parse"
}
local T = TK.module.submodules(me, members)
M[name] = function()
  return TK.test.self(T)
end
return M
