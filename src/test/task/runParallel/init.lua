local M = { }
local name = "runParallel"
local U = require("umolflowFramework")
local TK = require("PackageToolkit")
local case = TK.test.case
M[name] = function()
  local fn = U.task.runParallel
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
  }, "task.runParallel case 1")
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
  }, "task.runParallel case 2")
  return true
end
return M
