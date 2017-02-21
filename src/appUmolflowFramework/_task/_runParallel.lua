local M = { }
local J = (require("lanes")).configure()
local IO = J.require("ioLua")
local FX = J.require("FunctionalX")
local JSON = J.require("dkjson")
M.runParallel = function(fn_work, max_index, ...)
  local work = J.gen("os", "table", "io", "string", {
    ["required"] = {
      "dkjson"
    }
  }, fn_work)
  local accum = { }
  local _list_0 = FX.numeric.indices(max_index, ...)
  for _index_0 = 1, #_list_0 do
    local i = _list_0[_index_0]
    if i <= max_index then
      accum[#accum + 1] = work(i)
    end
  end
  local _accum_0 = { }
  local _len_0 = 1
  for _index_0 = 1, #accum do
    local a = accum[_index_0]
    _accum_0[_len_0] = a[1]
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
return M
