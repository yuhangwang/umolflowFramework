local M = { }
local FX = require("FunctionalX")
local J = require("dkjson")
M.parse = function(json_str, keywords)
  if json_str == nil then
    print("ERROR HINT: the input JSON argument string cannot be empty for umolflowFramework.io.parse()")
    print(string.format('            The input argument string is "%s"', arg_str))
    return { }, { }
  end
  local params = J.decode(json_str, 1, { })
  if params == nil then
    print(string.format('ERROR HINT: the content of the input JSON string "%s" is invalid', json_str))
    return { }, { }
  elseif #params == 0 and #(FX.table.keys(params)) > 0 then
    print('ERROR HINT: the top level of the input file must be a list')
    print("            i.e., everything must be inside top-level [] not {}")
    print(string.format('The content of your JSON string "%s" is:', json_str))
    print((IO.text.readall(json_str)))
    return { }, { }
  else
    for i = 1, #params do
      for _index_0 = 1, #keywords do
        local k = keywords[_index_0]
        if params[i][k] == nil then
          print(string.format('ERROR HINT: the "%s" field of record (%d) is invalid in input JSON string "%s"', k, i, json_str))
          return { }, { }
        end
      end
    end
  end
  return params, { }
end
return M
