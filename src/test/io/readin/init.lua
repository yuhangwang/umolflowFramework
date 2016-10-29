local M = { }
local name = "test_run"
local U = require("umolflowFramework")
local TK = require("PackageToolkit")
local case = TK.test.case
M[name] = function()
  local fn = U.io.readin
  case(fn, {
    "input/in1.json"
  }, {
    {
      {
        k1 = 1,
        k2 = 2
      }
    }
  }, "io.readin case 1")
  return true
end
return M
