#!/usr/bin/env lua

do

do
local _ENV = _ENV
package.preload[ "appUmolflowFramework" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = "appUmolflowFramework"
local members = {
  "_io",
  "_task"
}
return TK.module.submodules(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "appUmolflowFramework._io" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_readin"
}
return TK.module.subfunctions(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "appUmolflowFramework._io._readin" ] = function( ... ) local arg = _G.arg;
local M = { }
local FX = require("FunctionalX")
local IO = require("ioLua")
local J = require("dkjson")
M.readin = function(arg_str, keywords)
  local args = FX.strings.split(arg_str, ",")
  local param_file = args[1]
  local optional_args = FX.lists.tail(args)
  if param_file == nil then
    print("ERROR HINT: the input file cannot be empty for umolflowFramework.io.readin()")
    print(string.format('            The input argument string is "%s"', arg_str))
    return { }, { }
  end
  local params = J.decode((IO.text.readall(param_file)), 1, { })
  if params == nil then
    print(string.format('ERROR HINT: the content of input file "%s" is invalid', param_file))
    return { }, { }
  elseif #params == 0 and #(FX.table.keys(params)) > 0 then
    print('ERROR HINT: the top level of the input file must be a list')
    print(string.format('The content of your input file "%s" is:', param_file))
    print((FX.table.str(params)))
    return { }, { }
  else
    for i = 1, #params do
      for _index_0 = 1, #keywords do
        local k = keywords[_index_0]
        if params[i][k] == nil then
          print(string.format('ERROR HINT: the "%s" field of record (%d) is invalid in input file "%s"', k, i, param_file))
          return { }, { }
        end
      end
    end
  end
  return params, optional_args
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appUmolflowFramework._task" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_run",
  "_runParallel"
}
return TK.module.subfunctions(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "appUmolflowFramework._task._run" ] = function( ... ) local arg = _G.arg;
local M = { }
local FX = require("FunctionalX")
M.run = function(fn_work, max_index, ...)
  local accum = { }
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

end
end

do
local _ENV = _ENV
package.preload[ "appUmolflowFramework._task._runParallel" ] = function( ... ) local arg = _G.arg;
local M = { }
local J = (require("lanes")).configure()
local FX = J.require("FunctionalX")
M.runParallel = function(fn_work, max_index, ...)
  local work = J.gen("os", "table", "io", "string", fn_work)
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

end
end

end

package.path = package.path..";?/init.lua;"
local M = require("appUmolflowFramework")
return M