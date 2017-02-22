local M = { }
local name = "parse"
local U = require("umolflowFramework")
local TK = require("PackageToolkit")
local case = TK.test.case
M[name] = function()
  local fn = U.io.parse
  case(fn, {
    {
      "k1",
      "k2"
    },
    '[{"k1":1,"k2":2}]'
  }, {
    {
      {
        k1 = 1,
        k2 = 2
      }
    },
    { }
  }, "io.parse case 1")
  return true
end
return M
