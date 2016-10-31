local M = { }
local FX = require("FunctionalX")
local IO = require("ioLua")
local J = require("dkjson")
M.readin = function(arg_str, keywords)
  local args = FX.strings.split(arg_str, ",")
  local param_file = args[1]
  local optional_args = FX.lists.tail(args)
  if param_file == nil then
    print("ERROR HINT: the input file %s is invalid", param_file)
    return { }, { }
  end
  local params = J.decode((IO.text.readall(param_file)), 1, { })
  if params == nil then
    print("ERROR HINT: the content of input file %s is invalid", param_file)
    return { }, { }
  end
  for i = 1, #params do
    for _index_0 = 1, #keywords do
      local k = keywords[_index_0]
      if params[i][k] == nil then
        print(string.format('ERROR HINT: the "%s" field of record (%d) is invalid in input file "%s"', k, i, param_file))
        return { }, { }
      end
    end
  end
  return params, optional_args
end
return M
