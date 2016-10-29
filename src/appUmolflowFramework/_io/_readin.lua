local M = { }
local FX = require("FunctionalX")
local IO = require("ioLua")
local J = require("dkjson")
M.readin = function(arg_str)
  local args = FX.strings.split(arg_str, ",")
  local param_file = args[1]
  local optional_args = FX.lists.tail(args)
  if param_file == nil then
    return { }, { }
  end
  local params = J.decode((IO.text.readall(param_file)), 1, { })
  if params == nil then
    return { }, { }
  end
  for _index_0 = 1, #params do
    local p = params[_index_0]
    if p['output'] == nil or p['input'] == nil or p['index'] == nil then
      return { }, { }
    end
  end
  return params, optional_args
end
return M
