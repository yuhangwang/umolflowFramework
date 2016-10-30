local M = { }
local name = "readin"
local U = require("umolflowFramework")
local TK = require("PackageToolkit")
local case = TK.test.case
M[name] = function()
  local fn = U.io.readin
  case(fn, {
    "input/in1.json",
    {
      "k1",
      "k2"
    }
  }, {
    {
      {
        k1 = 1,
        k2 = 2
      }
    },
    { }
  }, "io.readin case 1")
  case(fn, {
    "input/in1.json,1 2",
    {
      "k1",
      "k2"
    }
  }, {
    {
      {
        k1 = 1,
        k2 = 2
      }
    },
    {
      "1 2"
    }
  }, "io.readin case 2")
  case(fn, {
    "input/in1.json,1 2,3 4",
    {
      "k1",
      "k2"
    }
  }, {
    {
      {
        k1 = 1,
        k2 = 2
      }
    },
    {
      "1 2",
      "3 4"
    }
  }, "io.readin case 3")
  return true
end
return M
