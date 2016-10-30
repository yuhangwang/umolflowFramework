local M = { }
local name = "run"
local U = require("umolflowFramework")
local TK = require("PackageToolkit")
local case = TK.test.case
M[name] = function()
  local fn = U.task.run
  case(fn, {
    (function(i)
      return i
    end),
    3
  }, {
    {
      1,
      2,
      3
    }
  }, "task.run case 1")
  case(fn, {
    (function(i)
      return i
    end),
    3,
    "1 2"
  }, {
    {
      1,
      2
    }
  }, "task.run case 2")
  return true
end
return M
