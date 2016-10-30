local M = { }
local FX = require("FunctionalX")
M.run = function(fn_work, max_index, ...)
  local accum = { }
  print('max index', max_index)
  local _list_0 = FX.numeric.indices(max_index, ...)
  for _index_0 = 1, #_list_0 do
    local i = _list_0[_index_0]
    if i <= max_index then
      accum[#accum + 1] = fn_work(i)
    end
  end
  return accum
end
return M
