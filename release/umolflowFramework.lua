#!/usr/bin/env lua

do

do
local _ENV = _ENV
package.preload[ "appUmolflowFramework._io._readin" ] = function( ... ) local arg = _G.arg;
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

end
end

do
local _ENV = _ENV
package.preload[ "appUmolflowFramework" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = "appUmolflowFramework"
local members = {
  "_io"
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

end

package.path = package.path..";?/init.lua;"
local M = require("appUmolflowFramework")
return M