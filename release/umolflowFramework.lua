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

do
local _ENV = _ENV
package.preload[ "PackageToolkit" ] = function( ... ) local arg = _G.arg;


do

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._test._case" ] = function( ... ) local arg = _G.arg;
local M = { }
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local dashed_line = require(root1 .. "." .. "._ui._dashed_line").dashed_line
local equal_lists = require(root1 .. "." .. "._test._equal_lists").equal_lists
local table2str = require(root1 .. "." .. "._table._str").str
M.case = function(fn, inputs, solutions, msg)
  if msg == nil then
    msg = ""
  end
  print(dashed_line(80, '-'))
  print(msg)
  local results = {
    fn(unpack(inputs))
  }
  print("Results: ", (table2str(results)))
  print("Solutions: ", (table2str(solutions)))
  assert(equal_lists(results, solutions))
  print("VERIFIED!")
  print(dashed_line(80, '-'))
  return true
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module" ] = function( ... ) local arg = _G.arg;
local parent = ...
local members = {
  "root",
  "full_name",
  "remove_prefix",
  "require",
  "subfunctions",
  "submodules",
  "import",
  "initimport",
  "ipath",
  "path"
}
local M = { }
for _index_0 = 1, #members do
  local name = members[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._initimport" ] = function( ... ) local arg = _G.arg;
local M = { }
local __ = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(__, "."))[1]
local ipath = require(root1 .. "." .. "._module._ipath")["ipath"]
M.initimport = function(this_path, module_path)
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for initimport, i.e. initimport(..., 'a/b')", (string.format("Your input is: initimport(%s, %s)", me, module_path))))
  if this_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return (require((ipath(this_path, module_path))))
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._concat" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(me, "."))[1]
local concat2 = require(root1 .. "." .. "._lists._concat2").concat2
local tail = require(root1 .. "." .. "._lists._tail").tail
M.concat = function(...)
  local args = {
    ...
  }
  local aux
  aux = function(input, accum)
    if #input == 0 then
      return accum
    end
    return aux((tail(input)), (concat2(accum, input[1])))
  end
  return aux(args, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._full_name" ] = function( ... ) local arg = _G.arg;
local M = { }
M.full_name = function(parent, name)
  return string.format("%s.%s", parent, name)
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._remove_prefix" ] = function( ... ) local arg = _G.arg;
local M = { }
M.remove_prefix = function(str, symbol)
  if symbol == nil then
    symbol = "_"
  end
  local pattern = string.format("^%s+", symbol)
  return string.gsub(str, pattern, "")
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._test._equal_lists" ] = function( ... ) local arg = _G.arg;
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
local head = require(root1 .. "." .. "._lists._head")["head"]
local M = { }
M.equal_lists = function(list1, list2)
  local condition1 = (type(list1)) == 'table'
  local condition2 = (type(list2)) == 'table'
  if condition1 and not condition2 then
    return false
  end
  if condition2 and not condition1 then
    return false
  end
  if (not condition1) and (not condition2) then
    return (list1 == list2)
  end
  if #list1 ~= #list2 then
    return false
  end
  if #list1 == 0 and #list2 == 0 then
    return true
  end
  if M.equal_lists((head(list1)), (head(list2))) then
    return M.equal_lists((tail(list1)), (tail(list2)))
  else
    return false
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._tail" ] = function( ... ) local arg = _G.arg;
local M = { }
M.tail = function(list, start_index)
  if start_index == nil then
    start_index = 1
  end
  if (type(list)) ~= "table" then
    return { }
  end
  if #list <= 1 then
    return { }
  end
  local _accum_0 = { }
  local _len_0 = 1
  for i = (start_index + 1), #list do
    _accum_0[_len_0] = list[i]
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._lists" ] = function( ... ) local arg = _G.arg;
local parent = ...
local members = {
  "head",
  "tail",
  "merge"
}
local M = { }
for _index_0 = 1, #members do
  local name = members[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._module._ipath" ] = function( ... ) local arg = _G.arg;
local M = { }
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
M.ipath = function(this_path, module_path)
  local chop
  chop = function(path)
    if (string.match(path, "[/%.]")) == nil then
      return ""
    else
      return string.match(path, "(.-)[/%.]?[^%./]+$")
    end
  end
  local aux
  aux = function(args, prefix)
    if #args == 0 then
      return prefix
    else
      if args[1] == "." then
        return aux((tail(args)), prefix)
      elseif args[1] == ".." then
        return aux((tail(args)), (chop(prefix)))
      else
        if prefix == "" then
          return aux((tail(args)), args[1])
        else
          return aux((tail(args)), (string.format("%s.%s", prefix, args[1])))
        end
      end
    end
  end
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for ipath, i.e. ipath(..., 'a/b')", (string.format("Your input is: ipath(%s, %s)", this_path, module_path))))
  if this_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return (aux((split(module_path, "/")), this_path))
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._test" ] = function( ... ) local arg = _G.arg;
local parent = ...
local members = {
  "self",
  "equal_lists",
  "case"
}
local M = { }
for _index_0 = 1, #members do
  local name = members[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit" ] = function( ... ) local arg = _G.arg;
local parent = "core_PackageToolkit"
local submodule_names = {
  "lists",
  "strings",
  "module",
  "test",
  "ui"
}
local M = { }
for _index_0 = 1, #submodule_names do
  local name = submodule_names[_index_0]
  M[name] = require(parent .. "._" .. name)
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._append" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(me, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
M.append = function(list, ...)
  local items = {
    ...
  }
  if #items == 0 then
    return list
  end
  if (type(list)) ~= "table" and #items ~= 0 then
    return items
  end
  if (type(list)) == "table" and #items == 0 then
    return table
  end
  if (type(list)) ~= "table" and #items == 0 then
    return { }
  end
  local output
  do
    local _accum_0 = { }
    local _len_0 = 1
    for _index_0 = 1, #list do
      local x = list[_index_0]
      _accum_0[_len_0] = x
      _len_0 = _len_0 + 1
    end
    output = _accum_0
  end
  for _index_0 = 1, #items do
    local item = items[_index_0]
    output[#output + 1] = item
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._head" ] = function( ... ) local arg = _G.arg;
local M = { }
M.head = function(list)
  if (type(list)) ~= "table" then
    return nil
  end
  if #list == 0 then
    return nil
  end
  return list[1]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._import" ] = function( ... ) local arg = _G.arg;
local M = { }
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail").tail
local initimport = require(root1 .. "." .. "._module._initimport").initimport
M.import = function(current_module_path, module_path)
  local chop
  chop = function(path)
    if (string.match(path, "[/%.]")) == nil then
      return ""
    else
      return string.match(path, "(.-)[/%.]?[^%./]+$")
    end
  end
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for import, i.e. import(..., 'a/b')", (string.format("Your input is: import(%s, %s)", current_module_path, module_path))))
  if current_module_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return initimport(chop(current_module_path), module_path)
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._merge" ] = function( ... ) local arg = _G.arg;
local M = { }
M.merge = function(table1, table2)
  local condition1 = (type(table1)) == "table"
  local condition2 = (type(table2)) == "table"
  if (not condition1) and (not condition2) then
    return { }
  end
  if not condition2 then
    return table1
  end
  if not condition1 then
    return table2
  end
  local output = { }
  for k, v in pairs(table1) do
    if v ~= nil then
      output[k] = v
    end
  end
  for k, v in pairs(table2) do
    if v ~= nil then
      output[k] = v
    end
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._require" ] = function( ... ) local arg = _G.arg;
local M = { }
M.require = function(module_name, function_name)
  if function_name == nil then
    return require(module_name)[module_name]
  end
  return require(module_name)[function_name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._strings" ] = function( ... ) local arg = _G.arg;
local parent = ...
local members = {
  "split"
}
local M = { }
for _index_0 = 1, #members do
  local name = members[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._test._self" ] = function( ... ) local arg = _G.arg;
local M = { }
M.self = function(target_module)
  for name, test in pairs(target_module) do
    if test[name] == nil then
      print(string.format("ERROR HINT: %s() doesn't exist", name))
    end
    local result = test[name]()
    if result == false then
      return false
    end
  end
  return true
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._path" ] = function( ... ) local arg = _G.arg;
local M = { }
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(..., "."))[1]
local ipath = require(root1 .. "." .. "._module._ipath").ipath
M.path = function(current_module_path, module_path)
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for path, i.e. path(..., 'a/b')", (string.format("Your input is: path(%s, %s)", current_module_path, module_path))))
  local chop
  chop = function(path)
    if (string.match(path, "[/%.]")) == nil then
      return ""
    else
      return string.match(path, "(.-)[/%.]?[^%./]+$")
    end
  end
  if current_module_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return ipath(chop(current_module_path), module_path)
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._submodules" ] = function( ... ) local arg = _G.arg;
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local root2 = (split(parent, "."))[2]
local module_root = root1 .. "." .. root2
local get_full_name = require(module_root .. "._full_name")["full_name"]
local remove_prefix = require(module_root .. "._remove_prefix")["remove_prefix"]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
local merge = require(root1 .. "." .. "._lists._merge")["merge"]
local M = { }
M.submodules = function(parent_name, name_list)
  if (type(name_list)) ~= 'table' then
    return { }
  end
  local aux
  aux = function(name_list, accum)
    if #name_list == 0 then
      return accum
    else
      local raw_name = name_list[1]
      local bare_name = remove_prefix(raw_name, "_")
      local full_name = get_full_name(parent_name, raw_name)
      local m = (require(full_name))
      if m == nil then
        return error("ERROR: cannot import module " .. full_name)
      elseif (type(m)) == "boolean" then
        return error(string.format("ERROR HINT: module %s doesn't reutrn a module table", full_name))
      else
        return aux((tail(name_list)), (merge(accum, {
          [bare_name] = m
        })))
      end
    end
  end
  return aux(name_list, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._strings._split" ] = function( ... ) local arg = _G.arg;
local M = { }
M.split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._lists._head" ] = function( ... ) local arg = _G.arg;
local M = { }
M.head = function(list)
  if (type(list)) ~= "table" then
    return nil
  end
  if #list == 0 then
    return nil
  end
  return list[1]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._module._initimport" ] = function( ... ) local arg = _G.arg;
local M = { }
local __ = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(__, "."))[1]
local ipath = require(root1 .. "." .. "._module._ipath")["ipath"]
M.initimport = function(this_path, module_path)
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for initimport, i.e. initimport(..., 'a/b')", (string.format("Your input is: initimport(%s, %s)", me, module_path))))
  if this_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return (require((ipath(this_path, module_path))))
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._table._keys" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(me, "."))[1]
local concat = require(root1 .. "." .. "._lists._concat").concat
M.keys = function(t)
  local strs = { }
  local numbers = { }
  local others = { }
  for k, v in pairs(t) do
    if type(k) == "number" then
      numbers[#numbers + 1] = k
    elseif type(k) == "string" then
      strs[#strs + 1] = k
    else
      others[#others + 1] = k
    end
  end
  table.sort(strs)
  return concat(numbers, strs, others)
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._root" ] = function( ... ) local arg = _G.arg;
local M = { }
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
M.root = function(full_module_name)
  return (split(full_module_name, "."))[1] or ""
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._concat2" ] = function( ... ) local arg = _G.arg;
local M = { }
M.concat2 = function(list1, list2)
  local condition1 = (type(list1)) == "table"
  local condition2 = (type(list2)) == "table"
  if (not condition1) and (not condition2) then
    return { }
  end
  if not condition2 then
    return list1
  end
  if not condition1 then
    return list2
  end
  local output
  do
    local _accum_0 = { }
    local _len_0 = 1
    for i = 1, #list1 do
      _accum_0[_len_0] = list1[i]
      _len_0 = _len_0 + 1
    end
    output = _accum_0
  end
  for _index_0 = 1, #list2 do
    local item = list2[_index_0]
    output[#output + 1] = item
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._ui._dashed_line" ] = function( ... ) local arg = _G.arg;
local M = { }
M.dashed_line = function(n, symbol)
  if symbol == nil then
    symbol = "-"
  end
  local aux
  aux = function(n, symbol, accum)
    if n == 0 then
      return accum
    else
      return aux((n - 1), symbol, accum .. symbol)
    end
  end
  return aux(n, symbol, "")
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._ui" ] = function( ... ) local arg = _G.arg;
local parent = ...
local submodule_names = {
  "dashed_line"
}
local M = { }
for _index_0 = 1, #submodule_names do
  local name = submodule_names[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._ui._dashed_line" ] = function( ... ) local arg = _G.arg;
local M = { }
M.dashed_line = function(n, symbol)
  if symbol == nil then
    symbol = "-"
  end
  local aux
  aux = function(n, symbol, accum)
    if n == 0 then
      return accum
    else
      return aux((n - 1), symbol, accum .. symbol)
    end
  end
  return aux(n, symbol, "")
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._lists._tail" ] = function( ... ) local arg = _G.arg;
local M = { }
M.tail = function(list, start_index)
  if start_index == nil then
    start_index = 1
  end
  if (type(list)) ~= "table" then
    return { }
  end
  if #list <= 1 then
    return { }
  end
  local _accum_0 = { }
  local _len_0 = 1
  for i = (start_index + 1), #list do
    _accum_0[_len_0] = list[i]
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._test._equal_lists" ] = function( ... ) local arg = _G.arg;
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
local head = require(root1 .. "." .. "._lists._head")["head"]
local M = { }
M.equal_lists = function(list1, list2)
  local condition1 = (type(list1)) == 'table'
  local condition2 = (type(list2)) == 'table'
  if condition1 and not condition2 then
    return false
  end
  if condition2 and not condition1 then
    return false
  end
  if (not condition1) and (not condition2) then
    return (list1 == list2)
  end
  if #list1 ~= #list2 then
    return false
  end
  if #list1 == 0 and #list2 == 0 then
    return true
  end
  if M.equal_lists((head(list1)), (head(list2))) then
    return M.equal_lists((tail(list1)), (tail(list2)))
  else
    return false
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._subfunctions" ] = function( ... ) local arg = _G.arg;
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local root2 = (split(parent, "."))[2]
local module_root = root1 .. "." .. root2
local get_full_name = require(module_root .. "._full_name")["full_name"]
local remove_prefix = require(module_root .. "._remove_prefix")["remove_prefix"]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
local merge = require(root1 .. "." .. "._lists._merge")["merge"]
local M = { }
M.subfunctions = function(parent_name, name_list)
  if (type(name_list)) ~= 'table' then
    return { }
  end
  local aux
  aux = function(name_list, accum)
    if #name_list == 0 then
      return accum
    else
      local raw_name = name_list[1]
      local bare_name = remove_prefix(raw_name, "_")
      local full_name = get_full_name(parent_name, raw_name)
      local m = (require(full_name))
      if m == nil then
        return error("ERROR: cannot import module " .. full_name)
      elseif (type(m)) == "boolean" then
        return error(string.format("ERROR HINT: module %s doesn't reutrn a module table", full_name))
      else
        return aux((tail(name_list)), (merge(accum, {
          [bare_name] = m[bare_name]
        })))
      end
    end
  end
  return aux(name_list, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._lists._merge" ] = function( ... ) local arg = _G.arg;
local M = { }
M.merge = function(table1, table2)
  local condition1 = (type(table1)) == "table"
  local condition2 = (type(table2)) == "table"
  if (not condition1) and (not condition2) then
    return { }
  end
  if not condition2 then
    return table1
  end
  if not condition1 then
    return table2
  end
  local output = { }
  for k, v in pairs(table1) do
    if v ~= nil then
      output[k] = v
    end
  end
  for k, v in pairs(table2) do
    if v ~= nil then
      output[k] = v
    end
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._table._str" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(me, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail").tail
local head = require(root1 .. "." .. "._lists._head").head
local append = require(root1 .. "." .. "._lists._append").append
local get_keys = require(root1 .. "." .. "._table._keys").keys
M.str = function(t, indent)
  if indent == nil then
    indent = "  "
  end
  local add_brackets
  add_brackets = function(s, prefix)
    return string.format("{\n%s%s%s\n%s}", prefix, indent, s, prefix)
  end
  local bracket
  bracket = function(obj)
    if type(obj) == "string" and string.match(obj, "%s") then
      return string.format("[%s]", obj)
    else
      return tostring(obj)
    end
  end
  local quote
  quote = function(obj)
    if type(obj) == "string" and string.match(obj, "%s") then
      return string.format("\"%s\"", obj)
    else
      return tostring(obj)
    end
  end
  local format_item
  format_item = function(k, v)
    if type(k) == "number" then
      return string.format("%s", v)
    else
      return string.format("%s = %s", (bracket((quote(k)))), v)
    end
  end
  local aux
  aux = function(dict, keys, accum, prefix)
    if #keys == 0 then
      local sep = string.format(",\n%s%s", prefix, indent)
      return add_brackets((table.concat(accum, sep)), prefix)
    else
      local k = head(keys)
      local v = ""
      if type(dict[k]) == "table" then
        v = aux(dict[k], (get_keys(dict[k])), { }, indent)
      else
        v = quote(dict[k])
      end
      local new_item = format_item(k, v)
      return aux(dict, (tail(keys)), (append(accum, new_item)), prefix)
    end
  end
  return aux(t, (get_keys(t)), { }, "")
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._ipath" ] = function( ... ) local arg = _G.arg;
local M = { }
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
M.ipath = function(this_path, module_path)
  local chop
  chop = function(path)
    if (string.match(path, "[/%.]")) == nil then
      return ""
    else
      return string.match(path, "(.-)[/%.]?[^%./]+$")
    end
  end
  local aux
  aux = function(args, prefix)
    if #args == 0 then
      return prefix
    else
      if args[1] == "." then
        return aux((tail(args)), prefix)
      elseif args[1] == ".." then
        return aux((tail(args)), (chop(prefix)))
      else
        if prefix == "" then
          return aux((tail(args)), args[1])
        else
          return aux((tail(args)), (string.format("%s.%s", prefix, args[1])))
        end
      end
    end
  end
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for ipath, i.e. ipath(..., 'a/b')", (string.format("Your input is: ipath(%s, %s)", this_path, module_path))))
  if this_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return (aux((split(module_path, "/")), this_path))
  end
end
return M

end
end

end

package.path = package.path .. ";?/init.lua"
local M = require("core_PackageToolkit")
return M

end
end

do
local _ENV = _ENV
package.preload[ "dkjson" ] = function( ... ) local arg = _G.arg;
-- Module options:
local always_try_using_lpeg = true
local register_global_module_table = false
local global_module_name = 'json'

--[==[

David Kolf's JSON module for Lua 5.1/5.2

Version 2.5


For the documentation see the corresponding readme.txt or visit
<http://dkolf.de/src/dkjson-lua.fsl/>.

You can contact the author by sending an e-mail to 'david' at the
domain 'dkolf.de'.


Copyright (C) 2010-2014 David Heiko Kolf

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

--]==]

-- global dependencies:
local pairs, type, tostring, tonumber, getmetatable, setmetatable, rawset =
      pairs, type, tostring, tonumber, getmetatable, setmetatable, rawset
local error, require, pcall, select = error, require, pcall, select
local floor, huge = math.floor, math.huge
local strrep, gsub, strsub, strbyte, strchar, strfind, strlen, strformat =
      string.rep, string.gsub, string.sub, string.byte, string.char,
      string.find, string.len, string.format
local strmatch = string.match
local concat = table.concat

local json = { version = "dkjson 2.5" }

if register_global_module_table then
  _G[global_module_name] = json
end

local _ENV = nil -- blocking globals in Lua 5.2

pcall (function()
  -- Enable access to blocked metatables.
  -- Don't worry, this module doesn't change anything in them.
  local debmeta = require "debug".getmetatable
  if debmeta then getmetatable = debmeta end
end)

json.null = setmetatable ({}, {
  __tojson = function () return "null" end
})

local function isarray (tbl)
  local max, n, arraylen = 0, 0, 0
  for k,v in pairs (tbl) do
    if k == 'n' and type(v) == 'number' then
      arraylen = v
      if v > max then
        max = v
      end
    else
      if type(k) ~= 'number' or k < 1 or floor(k) ~= k then
        return false
      end
      if k > max then
        max = k
      end
      n = n + 1
    end
  end
  if max > 10 and max > arraylen and max > n * 2 then
    return false -- don't create an array with too many holes
  end
  return true, max
end

local escapecodes = {
  ["\""] = "\\\"", ["\\"] = "\\\\", ["\b"] = "\\b", ["\f"] = "\\f",
  ["\n"] = "\\n",  ["\r"] = "\\r",  ["\t"] = "\\t"
}

local function escapeutf8 (uchar)
  local value = escapecodes[uchar]
  if value then
    return value
  end
  local a, b, c, d = strbyte (uchar, 1, 4)
  a, b, c, d = a or 0, b or 0, c or 0, d or 0
  if a <= 0x7f then
    value = a
  elseif 0xc0 <= a and a <= 0xdf and b >= 0x80 then
    value = (a - 0xc0) * 0x40 + b - 0x80
  elseif 0xe0 <= a and a <= 0xef and b >= 0x80 and c >= 0x80 then
    value = ((a - 0xe0) * 0x40 + b - 0x80) * 0x40 + c - 0x80
  elseif 0xf0 <= a and a <= 0xf7 and b >= 0x80 and c >= 0x80 and d >= 0x80 then
    value = (((a - 0xf0) * 0x40 + b - 0x80) * 0x40 + c - 0x80) * 0x40 + d - 0x80
  else
    return ""
  end
  if value <= 0xffff then
    return strformat ("\\u%.4x", value)
  elseif value <= 0x10ffff then
    -- encode as UTF-16 surrogate pair
    value = value - 0x10000
    local highsur, lowsur = 0xD800 + floor (value/0x400), 0xDC00 + (value % 0x400)
    return strformat ("\\u%.4x\\u%.4x", highsur, lowsur)
  else
    return ""
  end
end

local function fsub (str, pattern, repl)
  -- gsub always builds a new string in a buffer, even when no match
  -- exists. First using find should be more efficient when most strings
  -- don't contain the pattern.
  if strfind (str, pattern) then
    return gsub (str, pattern, repl)
  else
    return str
  end
end

local function quotestring (value)
  -- based on the regexp "escapable" in https://github.com/douglascrockford/JSON-js
  value = fsub (value, "[%z\1-\31\"\\\127]", escapeutf8)
  if strfind (value, "[\194\216\220\225\226\239]") then
    value = fsub (value, "\194[\128-\159\173]", escapeutf8)
    value = fsub (value, "\216[\128-\132]", escapeutf8)
    value = fsub (value, "\220\143", escapeutf8)
    value = fsub (value, "\225\158[\180\181]", escapeutf8)
    value = fsub (value, "\226\128[\140-\143\168-\175]", escapeutf8)
    value = fsub (value, "\226\129[\160-\175]", escapeutf8)
    value = fsub (value, "\239\187\191", escapeutf8)
    value = fsub (value, "\239\191[\176-\191]", escapeutf8)
  end
  return "\"" .. value .. "\""
end
json.quotestring = quotestring

local function replace(str, o, n)
  local i, j = strfind (str, o, 1, true)
  if i then
    return strsub(str, 1, i-1) .. n .. strsub(str, j+1, -1)
  else
    return str
  end
end

-- locale independent num2str and str2num functions
local decpoint, numfilter

local function updatedecpoint ()
  decpoint = strmatch(tostring(0.5), "([^05+])")
  -- build a filter that can be used to remove group separators
  numfilter = "[^0-9%-%+eE" .. gsub(decpoint, "[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%0") .. "]+"
end

updatedecpoint()

local function num2str (num)
  return replace(fsub(tostring(num), numfilter, ""), decpoint, ".")
end

local function str2num (str)
  local num = tonumber(replace(str, ".", decpoint))
  if not num then
    updatedecpoint()
    num = tonumber(replace(str, ".", decpoint))
  end
  return num
end

local function addnewline2 (level, buffer, buflen)
  buffer[buflen+1] = "\n"
  buffer[buflen+2] = strrep ("  ", level)
  buflen = buflen + 2
  return buflen
end

function json.addnewline (state)
  if state.indent then
    state.bufferlen = addnewline2 (state.level or 0,
                           state.buffer, state.bufferlen or #(state.buffer))
  end
end

local encode2 -- forward declaration

local function addpair (key, value, prev, indent, level, buffer, buflen, tables, globalorder, state)
  local kt = type (key)
  if kt ~= 'string' and kt ~= 'number' then
    return nil, "type '" .. kt .. "' is not supported as a key by JSON."
  end
  if prev then
    buflen = buflen + 1
    buffer[buflen] = ","
  end
  if indent then
    buflen = addnewline2 (level, buffer, buflen)
  end
  buffer[buflen+1] = quotestring (key)
  buffer[buflen+2] = ":"
  return encode2 (value, indent, level, buffer, buflen + 2, tables, globalorder, state)
end

local function appendcustom(res, buffer, state)
  local buflen = state.bufferlen
  if type (res) == 'string' then
    buflen = buflen + 1
    buffer[buflen] = res
  end
  return buflen
end

local function exception(reason, value, state, buffer, buflen, defaultmessage)
  defaultmessage = defaultmessage or reason
  local handler = state.exception
  if not handler then
    return nil, defaultmessage
  else
    state.bufferlen = buflen
    local ret, msg = handler (reason, value, state, defaultmessage)
    if not ret then return nil, msg or defaultmessage end
    return appendcustom(ret, buffer, state)
  end
end

function json.encodeexception(reason, value, state, defaultmessage)
  return quotestring("<" .. defaultmessage .. ">")
end

encode2 = function (value, indent, level, buffer, buflen, tables, globalorder, state)
  local valtype = type (value)
  local valmeta = getmetatable (value)
  valmeta = type (valmeta) == 'table' and valmeta -- only tables
  local valtojson = valmeta and valmeta.__tojson
  if valtojson then
    if tables[value] then
      return exception('reference cycle', value, state, buffer, buflen)
    end
    tables[value] = true
    state.bufferlen = buflen
    local ret, msg = valtojson (value, state)
    if not ret then return exception('custom encoder failed', value, state, buffer, buflen, msg) end
    tables[value] = nil
    buflen = appendcustom(ret, buffer, state)
  elseif value == nil then
    buflen = buflen + 1
    buffer[buflen] = "null"
  elseif valtype == 'number' then
    local s
    if value ~= value or value >= huge or -value >= huge then
      -- This is the behaviour of the original JSON implementation.
      s = "null"
    else
      s = num2str (value)
    end
    buflen = buflen + 1
    buffer[buflen] = s
  elseif valtype == 'boolean' then
    buflen = buflen + 1
    buffer[buflen] = value and "true" or "false"
  elseif valtype == 'string' then
    buflen = buflen + 1
    buffer[buflen] = quotestring (value)
  elseif valtype == 'table' then
    if tables[value] then
      return exception('reference cycle', value, state, buffer, buflen)
    end
    tables[value] = true
    level = level + 1
    local isa, n = isarray (value)
    if n == 0 and valmeta and valmeta.__jsontype == 'object' then
      isa = false
    end
    local msg
    if isa then -- JSON array
      buflen = buflen + 1
      buffer[buflen] = "["
      for i = 1, n do
        buflen, msg = encode2 (value[i], indent, level, buffer, buflen, tables, globalorder, state)
        if not buflen then return nil, msg end
        if i < n then
          buflen = buflen + 1
          buffer[buflen] = ","
        end
      end
      buflen = buflen + 1
      buffer[buflen] = "]"
    else -- JSON object
      local prev = false
      buflen = buflen + 1
      buffer[buflen] = "{"
      local order = valmeta and valmeta.__jsonorder or globalorder
      if order then
        local used = {}
        n = #order
        for i = 1, n do
          local k = order[i]
          local v = value[k]
          if v then
            used[k] = true
            buflen, msg = addpair (k, v, prev, indent, level, buffer, buflen, tables, globalorder, state)
            prev = true -- add a seperator before the next element
          end
        end
        for k,v in pairs (value) do
          if not used[k] then
            buflen, msg = addpair (k, v, prev, indent, level, buffer, buflen, tables, globalorder, state)
            if not buflen then return nil, msg end
            prev = true -- add a seperator before the next element
          end
        end
      else -- unordered
        for k,v in pairs (value) do
          buflen, msg = addpair (k, v, prev, indent, level, buffer, buflen, tables, globalorder, state)
          if not buflen then return nil, msg end
          prev = true -- add a seperator before the next element
        end
      end
      if indent then
        buflen = addnewline2 (level - 1, buffer, buflen)
      end
      buflen = buflen + 1
      buffer[buflen] = "}"
    end
    tables[value] = nil
  else
    return exception ('unsupported type', value, state, buffer, buflen,
      "type '" .. valtype .. "' is not supported by JSON.")
  end
  return buflen
end

function json.encode (value, state)
  state = state or {}
  local oldbuffer = state.buffer
  local buffer = oldbuffer or {}
  state.buffer = buffer
  updatedecpoint()
  local ret, msg = encode2 (value, state.indent, state.level or 0,
                   buffer, state.bufferlen or 0, state.tables or {}, state.keyorder, state)
  if not ret then
    error (msg, 2)
  elseif oldbuffer == buffer then
    state.bufferlen = ret
    return true
  else
    state.bufferlen = nil
    state.buffer = nil
    return concat (buffer)
  end
end

local function loc (str, where)
  local line, pos, linepos = 1, 1, 0
  while true do
    pos = strfind (str, "\n", pos, true)
    if pos and pos < where then
      line = line + 1
      linepos = pos
      pos = pos + 1
    else
      break
    end
  end
  return "line " .. line .. ", column " .. (where - linepos)
end

local function unterminated (str, what, where)
  return nil, strlen (str) + 1, "unterminated " .. what .. " at " .. loc (str, where)
end

local function scanwhite (str, pos)
  while true do
    pos = strfind (str, "%S", pos)
    if not pos then return nil end
    local sub2 = strsub (str, pos, pos + 1)
    if sub2 == "\239\187" and strsub (str, pos + 2, pos + 2) == "\191" then
      -- UTF-8 Byte Order Mark
      pos = pos + 3
    elseif sub2 == "//" then
      pos = strfind (str, "[\n\r]", pos + 2)
      if not pos then return nil end
    elseif sub2 == "/*" then
      pos = strfind (str, "*/", pos + 2)
      if not pos then return nil end
      pos = pos + 2
    else
      return pos
    end
  end
end

local escapechars = {
  ["\""] = "\"", ["\\"] = "\\", ["/"] = "/", ["b"] = "\b", ["f"] = "\f",
  ["n"] = "\n", ["r"] = "\r", ["t"] = "\t"
}

local function unichar (value)
  if value < 0 then
    return nil
  elseif value <= 0x007f then
    return strchar (value)
  elseif value <= 0x07ff then
    return strchar (0xc0 + floor(value/0x40),
                    0x80 + (floor(value) % 0x40))
  elseif value <= 0xffff then
    return strchar (0xe0 + floor(value/0x1000),
                    0x80 + (floor(value/0x40) % 0x40),
                    0x80 + (floor(value) % 0x40))
  elseif value <= 0x10ffff then
    return strchar (0xf0 + floor(value/0x40000),
                    0x80 + (floor(value/0x1000) % 0x40),
                    0x80 + (floor(value/0x40) % 0x40),
                    0x80 + (floor(value) % 0x40))
  else
    return nil
  end
end

local function scanstring (str, pos)
  local lastpos = pos + 1
  local buffer, n = {}, 0
  while true do
    local nextpos = strfind (str, "[\"\\]", lastpos)
    if not nextpos then
      return unterminated (str, "string", pos)
    end
    if nextpos > lastpos then
      n = n + 1
      buffer[n] = strsub (str, lastpos, nextpos - 1)
    end
    if strsub (str, nextpos, nextpos) == "\"" then
      lastpos = nextpos + 1
      break
    else
      local escchar = strsub (str, nextpos + 1, nextpos + 1)
      local value
      if escchar == "u" then
        value = tonumber (strsub (str, nextpos + 2, nextpos + 5), 16)
        if value then
          local value2
          if 0xD800 <= value and value <= 0xDBff then
            -- we have the high surrogate of UTF-16. Check if there is a
            -- low surrogate escaped nearby to combine them.
            if strsub (str, nextpos + 6, nextpos + 7) == "\\u" then
              value2 = tonumber (strsub (str, nextpos + 8, nextpos + 11), 16)
              if value2 and 0xDC00 <= value2 and value2 <= 0xDFFF then
                value = (value - 0xD800)  * 0x400 + (value2 - 0xDC00) + 0x10000
              else
                value2 = nil -- in case it was out of range for a low surrogate
              end
            end
          end
          value = value and unichar (value)
          if value then
            if value2 then
              lastpos = nextpos + 12
            else
              lastpos = nextpos + 6
            end
          end
        end
      end
      if not value then
        value = escapechars[escchar] or escchar
        lastpos = nextpos + 2
      end
      n = n + 1
      buffer[n] = value
    end
  end
  if n == 1 then
    return buffer[1], lastpos
  elseif n > 1 then
    return concat (buffer), lastpos
  else
    return "", lastpos
  end
end

local scanvalue -- forward declaration

local function scantable (what, closechar, str, startpos, nullval, objectmeta, arraymeta)
  local len = strlen (str)
  local tbl, n = {}, 0
  local pos = startpos + 1
  if what == 'object' then
    setmetatable (tbl, objectmeta)
  else
    setmetatable (tbl, arraymeta)
  end
  while true do
    pos = scanwhite (str, pos)
    if not pos then return unterminated (str, what, startpos) end
    local char = strsub (str, pos, pos)
    if char == closechar then
      return tbl, pos + 1
    end
    local val1, err
    val1, pos, err = scanvalue (str, pos, nullval, objectmeta, arraymeta)
    if err then return nil, pos, err end
    pos = scanwhite (str, pos)
    if not pos then return unterminated (str, what, startpos) end
    char = strsub (str, pos, pos)
    if char == ":" then
      if val1 == nil then
        return nil, pos, "cannot use nil as table index (at " .. loc (str, pos) .. ")"
      end
      pos = scanwhite (str, pos + 1)
      if not pos then return unterminated (str, what, startpos) end
      local val2
      val2, pos, err = scanvalue (str, pos, nullval, objectmeta, arraymeta)
      if err then return nil, pos, err end
      tbl[val1] = val2
      pos = scanwhite (str, pos)
      if not pos then return unterminated (str, what, startpos) end
      char = strsub (str, pos, pos)
    else
      n = n + 1
      tbl[n] = val1
    end
    if char == "," then
      pos = pos + 1
    end
  end
end

scanvalue = function (str, pos, nullval, objectmeta, arraymeta)
  pos = pos or 1
  pos = scanwhite (str, pos)
  if not pos then
    return nil, strlen (str) + 1, "no valid JSON value (reached the end)"
  end
  local char = strsub (str, pos, pos)
  if char == "{" then
    return scantable ('object', "}", str, pos, nullval, objectmeta, arraymeta)
  elseif char == "[" then
    return scantable ('array', "]", str, pos, nullval, objectmeta, arraymeta)
  elseif char == "\"" then
    return scanstring (str, pos)
  else
    local pstart, pend = strfind (str, "^%-?[%d%.]+[eE]?[%+%-]?%d*", pos)
    if pstart then
      local number = str2num (strsub (str, pstart, pend))
      if number then
        return number, pend + 1
      end
    end
    pstart, pend = strfind (str, "^%a%w*", pos)
    if pstart then
      local name = strsub (str, pstart, pend)
      if name == "true" then
        return true, pend + 1
      elseif name == "false" then
        return false, pend + 1
      elseif name == "null" then
        return nullval, pend + 1
      end
    end
    return nil, pos, "no valid JSON value at " .. loc (str, pos)
  end
end

local function optionalmetatables(...)
  if select("#", ...) > 0 then
    return ...
  else
    return {__jsontype = 'object'}, {__jsontype = 'array'}
  end
end

function json.decode (str, pos, nullval, ...)
  local objectmeta, arraymeta = optionalmetatables(...)
  return scanvalue (str, pos, nullval, objectmeta, arraymeta)
end

function json.use_lpeg ()
  local g = require ("lpeg")

  if g.version() == "0.11" then
    error "due to a bug in LPeg 0.11, it cannot be used for JSON matching"
  end

  local pegmatch = g.match
  local P, S, R = g.P, g.S, g.R

  local function ErrorCall (str, pos, msg, state)
    if not state.msg then
      state.msg = msg .. " at " .. loc (str, pos)
      state.pos = pos
    end
    return false
  end

  local function Err (msg)
    return g.Cmt (g.Cc (msg) * g.Carg (2), ErrorCall)
  end

  local SingleLineComment = P"//" * (1 - S"\n\r")^0
  local MultiLineComment = P"/*" * (1 - P"*/")^0 * P"*/"
  local Space = (S" \n\r\t" + P"\239\187\191" + SingleLineComment + MultiLineComment)^0

  local PlainChar = 1 - S"\"\\\n\r"
  local EscapeSequence = (P"\\" * g.C (S"\"\\/bfnrt" + Err "unsupported escape sequence")) / escapechars
  local HexDigit = R("09", "af", "AF")
  local function UTF16Surrogate (match, pos, high, low)
    high, low = tonumber (high, 16), tonumber (low, 16)
    if 0xD800 <= high and high <= 0xDBff and 0xDC00 <= low and low <= 0xDFFF then
      return true, unichar ((high - 0xD800)  * 0x400 + (low - 0xDC00) + 0x10000)
    else
      return false
    end
  end
  local function UTF16BMP (hex)
    return unichar (tonumber (hex, 16))
  end
  local U16Sequence = (P"\\u" * g.C (HexDigit * HexDigit * HexDigit * HexDigit))
  local UnicodeEscape = g.Cmt (U16Sequence * U16Sequence, UTF16Surrogate) + U16Sequence/UTF16BMP
  local Char = UnicodeEscape + EscapeSequence + PlainChar
  local String = P"\"" * g.Cs (Char ^ 0) * (P"\"" + Err "unterminated string")
  local Integer = P"-"^(-1) * (P"0" + (R"19" * R"09"^0))
  local Fractal = P"." * R"09"^0
  local Exponent = (S"eE") * (S"+-")^(-1) * R"09"^1
  local Number = (Integer * Fractal^(-1) * Exponent^(-1))/str2num
  local Constant = P"true" * g.Cc (true) + P"false" * g.Cc (false) + P"null" * g.Carg (1)
  local SimpleValue = Number + String + Constant
  local ArrayContent, ObjectContent

  -- The functions parsearray and parseobject parse only a single value/pair
  -- at a time and store them directly to avoid hitting the LPeg limits.
  local function parsearray (str, pos, nullval, state)
    local obj, cont
    local npos
    local t, nt = {}, 0
    repeat
      obj, cont, npos = pegmatch (ArrayContent, str, pos, nullval, state)
      if not npos then break end
      pos = npos
      nt = nt + 1
      t[nt] = obj
    until cont == 'last'
    return pos, setmetatable (t, state.arraymeta)
  end

  local function parseobject (str, pos, nullval, state)
    local obj, key, cont
    local npos
    local t = {}
    repeat
      key, obj, cont, npos = pegmatch (ObjectContent, str, pos, nullval, state)
      if not npos then break end
      pos = npos
      t[key] = obj
    until cont == 'last'
    return pos, setmetatable (t, state.objectmeta)
  end

  local Array = P"[" * g.Cmt (g.Carg(1) * g.Carg(2), parsearray) * Space * (P"]" + Err "']' expected")
  local Object = P"{" * g.Cmt (g.Carg(1) * g.Carg(2), parseobject) * Space * (P"}" + Err "'}' expected")
  local Value = Space * (Array + Object + SimpleValue)
  local ExpectedValue = Value + Space * Err "value expected"
  ArrayContent = Value * Space * (P"," * g.Cc'cont' + g.Cc'last') * g.Cp()
  local Pair = g.Cg (Space * String * Space * (P":" + Err "colon expected") * ExpectedValue)
  ObjectContent = Pair * Space * (P"," * g.Cc'cont' + g.Cc'last') * g.Cp()
  local DecodeValue = ExpectedValue * g.Cp ()

  function json.decode (str, pos, nullval, ...)
    local state = {}
    state.objectmeta, state.arraymeta = optionalmetatables(...)
    local obj, retpos = pegmatch (DecodeValue, str, pos, nullval, state)
    if state.msg then
      return nil, state.pos, state.msg
    else
      return obj, retpos
    end
  end

  -- use this function only once:
  json.use_lpeg = function () return json end

  json.using_lpeg = true

  return json -- so you can get the module using json = require "dkjson".use_lpeg()
end

if always_try_using_lpeg then
  pcall (json.use_lpeg)
end

return json


end
end

do
local _ENV = _ENV
package.preload[ "FunctionalX" ] = function( ... ) local arg = _G.arg;


do

do
local _ENV = _ENV
package.preload[ "PackageToolkit" ] = function( ... ) local arg = _G.arg;


do

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._test._case" ] = function( ... ) local arg = _G.arg;
local M = { }
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local dashed_line = require(root1 .. "." .. "._ui._dashed_line").dashed_line
local equal_lists = require(root1 .. "." .. "._test._equal_lists").equal_lists
local table2str = require(root1 .. "." .. "._table._str").str
M.case = function(fn, inputs, solutions, msg)
  if msg == nil then
    msg = ""
  end
  print(dashed_line(80, '-'))
  print(msg)
  local results = {
    fn(unpack(inputs))
  }
  print("Results: ", (table2str(results)))
  print("Solutions: ", (table2str(solutions)))
  assert(equal_lists(results, solutions))
  print("VERIFIED!")
  print(dashed_line(80, '-'))
  return true
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module" ] = function( ... ) local arg = _G.arg;
local parent = ...
local members = {
  "root",
  "full_name",
  "remove_prefix",
  "require",
  "subfunctions",
  "submodules",
  "import",
  "initimport",
  "ipath",
  "path"
}
local M = { }
for _index_0 = 1, #members do
  local name = members[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._initimport" ] = function( ... ) local arg = _G.arg;
local M = { }
local __ = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(__, "."))[1]
local ipath = require(root1 .. "." .. "._module._ipath")["ipath"]
M.initimport = function(this_path, module_path)
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for initimport, i.e. initimport(..., 'a/b')", (string.format("Your input is: initimport(%s, %s)", me, module_path))))
  if this_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return (require((ipath(this_path, module_path))))
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._concat" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(me, "."))[1]
local concat2 = require(root1 .. "." .. "._lists._concat2").concat2
local tail = require(root1 .. "." .. "._lists._tail").tail
M.concat = function(...)
  local args = {
    ...
  }
  local aux
  aux = function(input, accum)
    if #input == 0 then
      return accum
    end
    return aux((tail(input)), (concat2(accum, input[1])))
  end
  return aux(args, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._full_name" ] = function( ... ) local arg = _G.arg;
local M = { }
M.full_name = function(parent, name)
  return string.format("%s.%s", parent, name)
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._remove_prefix" ] = function( ... ) local arg = _G.arg;
local M = { }
M.remove_prefix = function(str, symbol)
  if symbol == nil then
    symbol = "_"
  end
  local pattern = string.format("^%s+", symbol)
  return string.gsub(str, pattern, "")
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._test._equal_lists" ] = function( ... ) local arg = _G.arg;
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
local head = require(root1 .. "." .. "._lists._head")["head"]
local M = { }
M.equal_lists = function(list1, list2)
  local condition1 = (type(list1)) == 'table'
  local condition2 = (type(list2)) == 'table'
  if condition1 and not condition2 then
    return false
  end
  if condition2 and not condition1 then
    return false
  end
  if (not condition1) and (not condition2) then
    return (list1 == list2)
  end
  if #list1 ~= #list2 then
    return false
  end
  if #list1 == 0 and #list2 == 0 then
    return true
  end
  if M.equal_lists((head(list1)), (head(list2))) then
    return M.equal_lists((tail(list1)), (tail(list2)))
  else
    return false
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._tail" ] = function( ... ) local arg = _G.arg;
local M = { }
M.tail = function(list, start_index)
  if start_index == nil then
    start_index = 1
  end
  if (type(list)) ~= "table" then
    return { }
  end
  if #list <= 1 then
    return { }
  end
  local _accum_0 = { }
  local _len_0 = 1
  for i = (start_index + 1), #list do
    _accum_0[_len_0] = list[i]
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._lists" ] = function( ... ) local arg = _G.arg;
local parent = ...
local members = {
  "head",
  "tail",
  "merge"
}
local M = { }
for _index_0 = 1, #members do
  local name = members[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._module._ipath" ] = function( ... ) local arg = _G.arg;
local M = { }
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
M.ipath = function(this_path, module_path)
  local chop
  chop = function(path)
    if (string.match(path, "[/%.]")) == nil then
      return ""
    else
      return string.match(path, "(.-)[/%.]?[^%./]+$")
    end
  end
  local aux
  aux = function(args, prefix)
    if #args == 0 then
      return prefix
    else
      if args[1] == "." then
        return aux((tail(args)), prefix)
      elseif args[1] == ".." then
        return aux((tail(args)), (chop(prefix)))
      else
        if prefix == "" then
          return aux((tail(args)), args[1])
        else
          return aux((tail(args)), (string.format("%s.%s", prefix, args[1])))
        end
      end
    end
  end
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for ipath, i.e. ipath(..., 'a/b')", (string.format("Your input is: ipath(%s, %s)", this_path, module_path))))
  if this_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return (aux((split(module_path, "/")), this_path))
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._test" ] = function( ... ) local arg = _G.arg;
local parent = ...
local members = {
  "self",
  "equal_lists",
  "case"
}
local M = { }
for _index_0 = 1, #members do
  local name = members[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit" ] = function( ... ) local arg = _G.arg;
local parent = "core_PackageToolkit"
local submodule_names = {
  "lists",
  "strings",
  "module",
  "test",
  "ui"
}
local M = { }
for _index_0 = 1, #submodule_names do
  local name = submodule_names[_index_0]
  M[name] = require(parent .. "._" .. name)
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._append" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(me, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
M.append = function(list, ...)
  local items = {
    ...
  }
  if #items == 0 then
    return list
  end
  if (type(list)) ~= "table" and #items ~= 0 then
    return items
  end
  if (type(list)) == "table" and #items == 0 then
    return table
  end
  if (type(list)) ~= "table" and #items == 0 then
    return { }
  end
  local output
  do
    local _accum_0 = { }
    local _len_0 = 1
    for _index_0 = 1, #list do
      local x = list[_index_0]
      _accum_0[_len_0] = x
      _len_0 = _len_0 + 1
    end
    output = _accum_0
  end
  for _index_0 = 1, #items do
    local item = items[_index_0]
    output[#output + 1] = item
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._head" ] = function( ... ) local arg = _G.arg;
local M = { }
M.head = function(list)
  if (type(list)) ~= "table" then
    return nil
  end
  if #list == 0 then
    return nil
  end
  return list[1]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._import" ] = function( ... ) local arg = _G.arg;
local M = { }
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail").tail
local initimport = require(root1 .. "." .. "._module._initimport").initimport
M.import = function(current_module_path, module_path)
  local chop
  chop = function(path)
    if (string.match(path, "[/%.]")) == nil then
      return ""
    else
      return string.match(path, "(.-)[/%.]?[^%./]+$")
    end
  end
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for import, i.e. import(..., 'a/b')", (string.format("Your input is: import(%s, %s)", current_module_path, module_path))))
  if current_module_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return initimport(chop(current_module_path), module_path)
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._merge" ] = function( ... ) local arg = _G.arg;
local M = { }
M.merge = function(table1, table2)
  local condition1 = (type(table1)) == "table"
  local condition2 = (type(table2)) == "table"
  if (not condition1) and (not condition2) then
    return { }
  end
  if not condition2 then
    return table1
  end
  if not condition1 then
    return table2
  end
  local output = { }
  for k, v in pairs(table1) do
    if v ~= nil then
      output[k] = v
    end
  end
  for k, v in pairs(table2) do
    if v ~= nil then
      output[k] = v
    end
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._require" ] = function( ... ) local arg = _G.arg;
local M = { }
M.require = function(module_name, function_name)
  if function_name == nil then
    return require(module_name)[module_name]
  end
  return require(module_name)[function_name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._strings" ] = function( ... ) local arg = _G.arg;
local parent = ...
local members = {
  "split"
}
local M = { }
for _index_0 = 1, #members do
  local name = members[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._test._self" ] = function( ... ) local arg = _G.arg;
local M = { }
M.self = function(target_module)
  for name, test in pairs(target_module) do
    if test[name] == nil then
      print(string.format("ERROR HINT: %s() doesn't exist", name))
    end
    local result = test[name]()
    if result == false then
      return false
    end
  end
  return true
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._path" ] = function( ... ) local arg = _G.arg;
local M = { }
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(..., "."))[1]
local ipath = require(root1 .. "." .. "._module._ipath").ipath
M.path = function(current_module_path, module_path)
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for path, i.e. path(..., 'a/b')", (string.format("Your input is: path(%s, %s)", current_module_path, module_path))))
  local chop
  chop = function(path)
    if (string.match(path, "[/%.]")) == nil then
      return ""
    else
      return string.match(path, "(.-)[/%.]?[^%./]+$")
    end
  end
  if current_module_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return ipath(chop(current_module_path), module_path)
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._submodules" ] = function( ... ) local arg = _G.arg;
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local root2 = (split(parent, "."))[2]
local module_root = root1 .. "." .. root2
local get_full_name = require(module_root .. "._full_name")["full_name"]
local remove_prefix = require(module_root .. "._remove_prefix")["remove_prefix"]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
local merge = require(root1 .. "." .. "._lists._merge")["merge"]
local M = { }
M.submodules = function(parent_name, name_list)
  if (type(name_list)) ~= 'table' then
    return { }
  end
  local aux
  aux = function(name_list, accum)
    if #name_list == 0 then
      return accum
    else
      local raw_name = name_list[1]
      local bare_name = remove_prefix(raw_name, "_")
      local full_name = get_full_name(parent_name, raw_name)
      local m = (require(full_name))
      if m == nil then
        return error("ERROR: cannot import module " .. full_name)
      elseif (type(m)) == "boolean" then
        return error(string.format("ERROR HINT: module %s doesn't reutrn a module table", full_name))
      else
        return aux((tail(name_list)), (merge(accum, {
          [bare_name] = m
        })))
      end
    end
  end
  return aux(name_list, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._strings._split" ] = function( ... ) local arg = _G.arg;
local M = { }
M.split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._lists._head" ] = function( ... ) local arg = _G.arg;
local M = { }
M.head = function(list)
  if (type(list)) ~= "table" then
    return nil
  end
  if #list == 0 then
    return nil
  end
  return list[1]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._module._initimport" ] = function( ... ) local arg = _G.arg;
local M = { }
local __ = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(__, "."))[1]
local ipath = require(root1 .. "." .. "._module._ipath")["ipath"]
M.initimport = function(this_path, module_path)
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for initimport, i.e. initimport(..., 'a/b')", (string.format("Your input is: initimport(%s, %s)", me, module_path))))
  if this_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return (require((ipath(this_path, module_path))))
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._table._keys" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(me, "."))[1]
local concat = require(root1 .. "." .. "._lists._concat").concat
M.keys = function(t)
  local strs = { }
  local numbers = { }
  local others = { }
  for k, v in pairs(t) do
    if type(k) == "number" then
      numbers[#numbers + 1] = k
    elseif type(k) == "string" then
      strs[#strs + 1] = k
    else
      others[#others + 1] = k
    end
  end
  table.sort(strs)
  return concat(numbers, strs, others)
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._root" ] = function( ... ) local arg = _G.arg;
local M = { }
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
M.root = function(full_module_name)
  return (split(full_module_name, "."))[1] or ""
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._concat2" ] = function( ... ) local arg = _G.arg;
local M = { }
M.concat2 = function(list1, list2)
  local condition1 = (type(list1)) == "table"
  local condition2 = (type(list2)) == "table"
  if (not condition1) and (not condition2) then
    return { }
  end
  if not condition2 then
    return list1
  end
  if not condition1 then
    return list2
  end
  local output
  do
    local _accum_0 = { }
    local _len_0 = 1
    for i = 1, #list1 do
      _accum_0[_len_0] = list1[i]
      _len_0 = _len_0 + 1
    end
    output = _accum_0
  end
  for _index_0 = 1, #list2 do
    local item = list2[_index_0]
    output[#output + 1] = item
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._ui._dashed_line" ] = function( ... ) local arg = _G.arg;
local M = { }
M.dashed_line = function(n, symbol)
  if symbol == nil then
    symbol = "-"
  end
  local aux
  aux = function(n, symbol, accum)
    if n == 0 then
      return accum
    else
      return aux((n - 1), symbol, accum .. symbol)
    end
  end
  return aux(n, symbol, "")
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._ui" ] = function( ... ) local arg = _G.arg;
local parent = ...
local submodule_names = {
  "dashed_line"
}
local M = { }
for _index_0 = 1, #submodule_names do
  local name = submodule_names[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._ui._dashed_line" ] = function( ... ) local arg = _G.arg;
local M = { }
M.dashed_line = function(n, symbol)
  if symbol == nil then
    symbol = "-"
  end
  local aux
  aux = function(n, symbol, accum)
    if n == 0 then
      return accum
    else
      return aux((n - 1), symbol, accum .. symbol)
    end
  end
  return aux(n, symbol, "")
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._lists._tail" ] = function( ... ) local arg = _G.arg;
local M = { }
M.tail = function(list, start_index)
  if start_index == nil then
    start_index = 1
  end
  if (type(list)) ~= "table" then
    return { }
  end
  if #list <= 1 then
    return { }
  end
  local _accum_0 = { }
  local _len_0 = 1
  for i = (start_index + 1), #list do
    _accum_0[_len_0] = list[i]
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._test._equal_lists" ] = function( ... ) local arg = _G.arg;
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
local head = require(root1 .. "." .. "._lists._head")["head"]
local M = { }
M.equal_lists = function(list1, list2)
  local condition1 = (type(list1)) == 'table'
  local condition2 = (type(list2)) == 'table'
  if condition1 and not condition2 then
    return false
  end
  if condition2 and not condition1 then
    return false
  end
  if (not condition1) and (not condition2) then
    return (list1 == list2)
  end
  if #list1 ~= #list2 then
    return false
  end
  if #list1 == 0 and #list2 == 0 then
    return true
  end
  if M.equal_lists((head(list1)), (head(list2))) then
    return M.equal_lists((tail(list1)), (tail(list2)))
  else
    return false
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._subfunctions" ] = function( ... ) local arg = _G.arg;
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local root2 = (split(parent, "."))[2]
local module_root = root1 .. "." .. root2
local get_full_name = require(module_root .. "._full_name")["full_name"]
local remove_prefix = require(module_root .. "._remove_prefix")["remove_prefix"]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
local merge = require(root1 .. "." .. "._lists._merge")["merge"]
local M = { }
M.subfunctions = function(parent_name, name_list)
  if (type(name_list)) ~= 'table' then
    return { }
  end
  local aux
  aux = function(name_list, accum)
    if #name_list == 0 then
      return accum
    else
      local raw_name = name_list[1]
      local bare_name = remove_prefix(raw_name, "_")
      local full_name = get_full_name(parent_name, raw_name)
      local m = (require(full_name))
      if m == nil then
        return error("ERROR: cannot import module " .. full_name)
      elseif (type(m)) == "boolean" then
        return error(string.format("ERROR HINT: module %s doesn't reutrn a module table", full_name))
      else
        return aux((tail(name_list)), (merge(accum, {
          [bare_name] = m[bare_name]
        })))
      end
    end
  end
  return aux(name_list, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._lists._merge" ] = function( ... ) local arg = _G.arg;
local M = { }
M.merge = function(table1, table2)
  local condition1 = (type(table1)) == "table"
  local condition2 = (type(table2)) == "table"
  if (not condition1) and (not condition2) then
    return { }
  end
  if not condition2 then
    return table1
  end
  if not condition1 then
    return table2
  end
  local output = { }
  for k, v in pairs(table1) do
    if v ~= nil then
      output[k] = v
    end
  end
  for k, v in pairs(table2) do
    if v ~= nil then
      output[k] = v
    end
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._table._str" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(me, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail").tail
local head = require(root1 .. "." .. "._lists._head").head
local append = require(root1 .. "." .. "._lists._append").append
local get_keys = require(root1 .. "." .. "._table._keys").keys
M.str = function(t, indent)
  if indent == nil then
    indent = "  "
  end
  local add_brackets
  add_brackets = function(s, prefix)
    return string.format("{\n%s%s%s\n%s}", prefix, indent, s, prefix)
  end
  local bracket
  bracket = function(obj)
    if type(obj) == "string" and string.match(obj, "%s") then
      return string.format("[%s]", obj)
    else
      return tostring(obj)
    end
  end
  local quote
  quote = function(obj)
    if type(obj) == "string" and string.match(obj, "%s") then
      return string.format("\"%s\"", obj)
    else
      return tostring(obj)
    end
  end
  local format_item
  format_item = function(k, v)
    if type(k) == "number" then
      return string.format("%s", v)
    else
      return string.format("%s = %s", (bracket((quote(k)))), v)
    end
  end
  local aux
  aux = function(dict, keys, accum, prefix)
    if #keys == 0 then
      local sep = string.format(",\n%s%s", prefix, indent)
      return add_brackets((table.concat(accum, sep)), prefix)
    else
      local k = head(keys)
      local v = ""
      if type(dict[k]) == "table" then
        v = aux(dict[k], (get_keys(dict[k])), { }, indent)
      else
        v = quote(dict[k])
      end
      local new_item = format_item(k, v)
      return aux(dict, (tail(keys)), (append(accum, new_item)), prefix)
    end
  end
  return aux(t, (get_keys(t)), { }, "")
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._ipath" ] = function( ... ) local arg = _G.arg;
local M = { }
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
M.ipath = function(this_path, module_path)
  local chop
  chop = function(path)
    if (string.match(path, "[/%.]")) == nil then
      return ""
    else
      return string.match(path, "(.-)[/%.]?[^%./]+$")
    end
  end
  local aux
  aux = function(args, prefix)
    if #args == 0 then
      return prefix
    else
      if args[1] == "." then
        return aux((tail(args)), prefix)
      elseif args[1] == ".." then
        return aux((tail(args)), (chop(prefix)))
      else
        if prefix == "" then
          return aux((tail(args)), args[1])
        else
          return aux((tail(args)), (string.format("%s.%s", prefix, args[1])))
        end
      end
    end
  end
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for ipath, i.e. ipath(..., 'a/b')", (string.format("Your input is: ipath(%s, %s)", this_path, module_path))))
  if this_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return (aux((split(module_path, "/")), this_path))
  end
end
return M

end
end

end

package.path = package.path .. ";?/init.lua"
local M = require("core_PackageToolkit")
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = "appFunctionalX"
local members = {
  "_lists",
  "_strings",
  "_directory",
  "_fn",
  "_table",
  "_numeric",
  "_os",
  "_module"
}
return TK.module.submodules(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._directory" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_path",
  "_cart2",
  "_cart",
  "_chop"
}
return TK.module.subfunctions(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._directory._cart" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = require("PackageToolkit").module
local cart2 = (T.import(..., "_cart2")).cart2
local tail = (T.import(..., "../_lists/_tail")).tail
M.cart = function(...)
  local aux
  aux = function(list1, other_lists)
    if #other_lists == 0 then
      return list1
    else
      if type(other_lists[1]) ~= "table" then
        return aux(list1, { })
      end
      return aux((cart2(list1, other_lists[1])), (tail(other_lists)))
    end
  end
  local args = {
    ...
  }
  if type(args) ~= "table" then
    return { }
  end
  if #args == 0 then
    return { }
  end
  if type(args[1]) ~= "table" then
    return { }
  end
  if #args <= 1 then
    return args[1]
  end
  return aux(args[1], (tail(args)))
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._directory._cart2" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = require("PackageToolkit").module
local path = (T.import(..., "_path")).path
local tail = (T.import(..., "../_lists/_tail")).tail
local append = (T.import(..., "../_lists/_append")).append
M.cart2 = function(list1, list2)
  local aux
  aux = function(list1, list2, accum)
    if #list2 == 0 or #list1 == 0 then
      return accum
    elseif #list1 == 1 then
      return aux(list1, (tail(list2)), (append(accum, (path(list1[1], list2[1])))))
    else
      return aux((tail(list1)), list2, (aux({
        list1[1]
      }, list2, accum)))
    end
  end
  if type(list1) ~= "table" then
    return { }
  end
  if type(list2) ~= "table" then
    return { }
  end
  return aux(list1, list2, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._directory._chop" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local pathsep = (TK.module.import(..., "../_os/_pathsep")).pathsep
M.chop = function(path)
  if (string.match(path, "[/\\%.]")) == nil then
    return ""
  else
    local result, _ = string.gsub((string.match(path, "(.-)[/\\%.]?[^%./\\]+$")), "%.", pathsep())
    return result
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._directory._path" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = require("PackageToolkit").module
local L = T.import(..., "../_lists")
local S = T.import(..., "../_strings")
M.path = function(...)
  local dir_separator = L.head((S.split(package.config, "%s")))
  local aux
  aux = function(subdirs, accum)
    if #subdirs == 0 then
      return accum
    else
      return aux((L.tail(subdirs)), accum .. dir_separator .. tostring(subdirs[1]))
    end
  end
  local args = {
    ...
  }
  if #args == 0 then
    return ""
  end
  if #args == 1 then
    return args[1]
  end
  return aux((L.tail(args)), (tostring(args[1])))
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._fn" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_map"
}
return TK.module.subfunctions(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._fn._map" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local M = { }
local tail = (TK.module.import(..., '../_lists/_tail')).tail
local head = (TK.module.import(..., '../_lists/_head')).head
local append = (TK.module.import(..., '../_lists/_append')).append
M.map = function(f, list)
  local aux
  aux = function(f, list, accum)
    if #list == 0 then
      return accum
    else
      return aux(f, (tail(list)), (append(accum, (f((head(list)))))))
    end
  end
  if (type(list)) ~= "table" then
    return { }
  end
  return aux(f, list, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_append",
  "_cart2",
  "_cart",
  "_concat2",
  "_concat",
  "_head",
  "_initial",
  "_merge2",
  "_merge",
  "_next",
  "_prepend",
  "_tail",
  "_take",
  "_drop",
  "_flatten",
  "_reverse",
  "_replicate"
}
return TK.module.subfunctions(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists._append" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local tail = (TK.module.import(..., '_tail')).tail
M.append = function(list, ...)
  local items = {
    ...
  }
  if #items == 0 then
    return list
  end
  if (type(list)) ~= "table" and #items ~= 0 then
    return items
  end
  if (type(list)) == "table" and #items == 0 then
    return table
  end
  if (type(list)) ~= "table" and #items == 0 then
    return { }
  end
  local output
  do
    local _accum_0 = { }
    local _len_0 = 1
    for _index_0 = 1, #list do
      local x = list[_index_0]
      _accum_0[_len_0] = x
      _len_0 = _len_0 + 1
    end
    output = _accum_0
  end
  for _index_0 = 1, #items do
    local item = items[_index_0]
    output[#output + 1] = item
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists._cart" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local root_parent = TK.module.root(...)
local cart2 = (TK.module.import(..., "_cart2")).cart2
local tail = (TK.module.import(..., "_tail")).tail
M.cart = function(...)
  local aux
  aux = function(list1, other_lists)
    if #other_lists == 0 then
      return list1
    else
      if type(other_lists[1]) ~= "table" then
        return aux(list1, { })
      end
      return aux((cart2(list1, other_lists[1], true)), (tail(other_lists)))
    end
  end
  local args = {
    ...
  }
  if type(args) ~= "table" then
    return { }
  end
  if #args == 0 then
    return { }
  end
  if type(args[1]) ~= "table" then
    return { }
  end
  if #args <= 1 then
    return args[1]
  end
  return aux(args[1], (tail(args)))
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists._cart2" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local append = (TK.module.import(..., "_append")).append
local tail = (TK.module.import(..., "_tail")).tail
local flatten = (TK.module.import(..., "_flatten")).flatten
M.cart2 = function(list1, list2, merge)
  if merge == nil then
    merge = false
  end
  local aux
  aux = function(list1, list2, accum)
    if #list2 == 0 or #list1 == 0 then
      return accum
    elseif #list1 == 1 then
      if merge then
        return aux(list1, (tail(list2)), (append(accum, (flatten(list1[1], list2[1])))))
      else
        return aux(list1, (tail(list2)), (append(accum, {
          list1[1],
          list2[1]
        })))
      end
    else
      return aux((tail(list1)), list2, (aux({
        list1[1]
      }, list2, accum)))
    end
  end
  if type(list1) ~= "table" then
    return { }
  end
  if type(list2) ~= "table" then
    return { }
  end
  return aux(list1, list2, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists._concat" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local tail = (TK.module.import(..., "_tail")).tail
local concat2 = (TK.module.import(..., "_concat2")).concat2
M.concat = function(...)
  local args = {
    ...
  }
  local aux
  aux = function(input, accum)
    if #input == 0 then
      return accum
    end
    return aux((tail(input)), (concat2(accum, input[1])))
  end
  return aux(args, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists._concat2" ] = function( ... ) local arg = _G.arg;
local M = { }
M.concat2 = function(list1, list2)
  local condition1 = (type(list1)) == "table"
  local condition2 = (type(list2)) == "table"
  if (not condition1) and (not condition2) then
    return { }
  end
  if not condition2 then
    return list1
  end
  if not condition1 then
    return list2
  end
  local output
  do
    local _accum_0 = { }
    local _len_0 = 1
    for i = 1, #list1 do
      _accum_0[_len_0] = list1[i]
      _len_0 = _len_0 + 1
    end
    output = _accum_0
  end
  for _index_0 = 1, #list2 do
    local item = list2[_index_0]
    output[#output + 1] = item
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists._drop" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local tail = (TK.module.import(..., "_tail")).tail
M.drop = function(n, list)
  if (type(list)) ~= "table" then
    return { }
  end
  local aux
  aux = function(n, list)
    if n == 0 then
      return list
    elseif #list == 0 then
      return { }
    else
      return aux((n - 1), (tail(list)))
    end
  end
  return aux(n, list, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists._flatten" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local head = (TK.module.import(..., "_head")).head
local tail = (TK.module.import(..., "_tail")).tail
local append = (TK.module.import(..., "_append")).append
M.flatten = function(...)
  local args = {
    ...
  }
  local aux
  aux = function(lists, accum)
    if #lists == 0 then
      return accum
    elseif (type(lists[1])) == "table" then
      return aux((tail(lists)), (aux(lists[1], accum)))
    else
      return aux((tail(lists)), (append(accum, lists[1])))
    end
  end
  return aux(args, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists._head" ] = function( ... ) local arg = _G.arg;
local M = { }
M.head = function(list)
  if (type(list)) ~= "table" then
    return nil
  end
  if #list == 0 then
    return nil
  end
  return list[1]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists._initial" ] = function( ... ) local arg = _G.arg;
local M = { }
M.init = function(list)
  if (type(list)) ~= "table" then
    return { }
  end
  if #list <= 1 then
    return { }
  end
  local _accum_0 = { }
  local _len_0 = 1
  for i = 1, #list - 1 do
    _accum_0[_len_0] = list[i]
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists._merge" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local tail = (TK.module.import(..., "_tail")).tail
local merge2 = (TK.module.import(..., "_merge2")).merge2
M.merge = function(...)
  local tables = {
    ...
  }
  local aux
  aux = function(tables, accum)
    if #tables == 0 then
      return accum
    else
      return (aux((tail(tables)), (merge2(accum, tables[1]))))
    end
  end
  if #tables == 0 then
    return { }
  elseif #tables == 1 then
    return tables[1]
  else
    return aux(tables, { })
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists._merge2" ] = function( ... ) local arg = _G.arg;
local M = { }
M.merge2 = function(table1, table2)
  local condition1 = (type(table1)) == "table"
  local condition2 = (type(table2)) == "table"
  if (not condition1) and (not condition2) then
    return { }
  end
  if not condition2 then
    return table1
  end
  if not condition1 then
    return table2
  end
  local output = { }
  for k, v in pairs(table1) do
    if v ~= nil then
      output[k] = v
    end
  end
  for k, v in pairs(table2) do
    if v ~= nil then
      output[k] = v
    end
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists._next" ] = function( ... ) local arg = _G.arg;
local M = { }
M.next = function(list)
  if (type(list)) ~= "table" then
    return nil
  end
  if #list >= 2 then
    return list[2]
  else
    return nil
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists._prepend" ] = function( ... ) local arg = _G.arg;
local M = { }
M.prepend = function(item, list)
  if (type(list)) ~= "table" then
    return { }
  end
  if item == nil then
    return list
  end
  local output = {
    item
  }
  for _index_0 = 1, #list do
    local x = list[_index_0]
    output[#output + 1] = x
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists._replicate" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local append = (TK.module.import(..., "_append")).append
local tail = (TK.module.import(..., "_tail")).tail
M.replicate = function(n, item)
  local aux
  aux = function(n, item, accum)
    if n <= 0 then
      return accum
    else
      return aux((n - 1), item, (append(accum, item)))
    end
  end
  return aux(n, item, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists._reverse" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local prepend = (TK.module.import(..., "_prepend")).prepend
local tail = (TK.module.import(..., "_tail")).tail
M.reverse = function(list)
  local aux
  aux = function(list, accum)
    if #list == 0 then
      return accum
    else
      return aux((tail(list)), (prepend(list[1], accum)))
    end
  end
  return aux(list, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists._tail" ] = function( ... ) local arg = _G.arg;
local M = { }
M.tail = function(list, start_index)
  if start_index == nil then
    start_index = 1
  end
  if (type(list)) ~= "table" then
    return { }
  end
  if #list <= 1 then
    return { }
  end
  local _accum_0 = { }
  local _len_0 = 1
  for i = (start_index + 1), #list do
    _accum_0[_len_0] = list[i]
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._lists._take" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local append = (TK.module.import(..., "_append")).append
local tail = (TK.module.import(..., "_tail")).tail
local head = (TK.module.import(..., "_head")).head
M.take = function(n, list)
  if (type(list)) ~= "table" then
    return { }
  end
  local aux
  aux = function(n, list, accum)
    if n == 0 then
      return accum
    elseif #list == 0 then
      return accum
    else
      return aux((n - 1), (tail(list)), (append(accum, (head(list)))))
    end
  end
  return aux(n, list, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._module" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_import",
  "_initimport",
  "_run",
  "_call",
  "_ipath",
  "_path"
}
return TK.module.subfunctions(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._module._call" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = (require("PackageToolkit")).module
local runmodule = (T.import(..., "_runmodule")).runmodule
M.call = function(modules, ...)
  return runmodule(modules, false, ...)
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._module._import" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
M.import = TK.module.import
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._module._initimport" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
M.initimport = TK.module.initimport
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._module._ipath" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
M.ipath = TK.module.ipath
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._module._path" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
M.path = TK.module.path
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._module._run" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = (require("PackageToolkit")).module
local runmodule = (T.import(..., "_runmodule")).runmodule
M.run = function(modules, ...)
  return runmodule(modules, true, ...)
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._module._runmodule" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = (require("PackageToolkit")).module
local parseFirstNumberGroup = (T.import(..., "../_strings/_parseFirstNumberGroup")).parseFirstNumberGroup
local head = (T.import(..., "../_lists/_head")).head
local tail = (T.import(..., "../_lists/_tail")).tail
local append = (T.import(..., "../_lists/_append")).append
local range = (T.import(..., "../_numeric/_range")).range
local join = (T.import(..., "../_strings/_join")).join
M.runmodule = function(modules, exe, arg_str, sep1, sep2)
  if arg_str == nil then
    arg_str = ""
  end
  if sep1 == nil then
    sep1 = ","
  end
  if sep2 == nil then
    sep2 = " "
  end
  if #{
    modules
  } == 0 then
    return { }
  end
  if arg_str == "" then
    return M.runmodule(modules, exe, (join(sep2, unpack((range(1, #modules, 1))))))
  end
  local indices, rest_str = parseFirstNumberGroup(arg_str, sep1, sep2)
  local aux
  aux = function(indices, modules, accum)
    if #indices == 0 then
      return accum
    else
      local i = head(indices)
      if i > #modules then
        print((string.format("ERROR HINT: index %s > #modules (i.e., %s)", i, #modules)))
        return accum
      else
        local result = nil
        if exe == true then
          local _
          indices, _ = parseFirstNumberGroup(rest_str, sep1, sep2)
          result = modules[i].main(unpack(indices))
        else
          result = modules[i].main(rest_str)
        end
        return aux((tail(indices)), modules, (append(accum, result)))
      end
    end
  end
  return aux(indices, modules, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._numeric" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_range",
  "_indices"
}
return TK.module.subfunctions(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._numeric._indices" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = require("PackageToolkit").module
local parseNumbers = (T.import(..., "../_strings/_parseNumbers")).parseNumbers
M.indices = function(n, ...)
  if n == nil then
    n = 1
  end
  local args = {
    ...
  }
  if #args == 0 then
    local _accum_0 = { }
    local _len_0 = 1
    for i = 1, n do
      _accum_0[_len_0] = i
      _len_0 = _len_0 + 1
    end
    return _accum_0
  else
    if type(args[1]) == "number" then
      return args
    elseif type(args[1]) == "string" then
      return parseNumbers(args[1], " ")
    else
      print("WARNING: unrecognized second argument to FX.numeric.indices(): " .. tostring(args[1]))
      return { }
    end
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._numeric._range" ] = function( ... ) local arg = _G.arg;
local M = { }
M.range = function(start, stop, step)
  if step == nil then
    step = 1
  end
  local output = { }
  for i = start, stop, step do
    output[#output + 1] = i
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._os" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_windows",
  "_path",
  "_pathsep"
}
return TK.module.subfunctions(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._os._path" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = require("PackageToolkit").module
local windows = T.import(..., "_windows").windows
M.path = function(env)
  if windows() then
    if env == "HOME" then
      return string.format("C:%s", os.getenv("HOMEPATH"))
    else
      return ""
    end
  else
    if env == "HOME" then
      return os.getenv("HOME")
    else
      return ""
    end
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._os._pathsep" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = require("PackageToolkit").module
local L = T.import(..., "../_lists")
local S = T.import(..., "../_strings")
M.pathsep = function()
  return L.head(S.split(package.config))
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._os._windows" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = require("PackageToolkit").module
local L = T.import(..., "../_lists")
local S = T.import(..., "../_strings")
M.windows = function()
  local dir_separator = L.head(S.split(package.config))
  return dir_separator == '\\'
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._strings" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_cart2",
  "_cart",
  "_split",
  "_batch_format",
  "_join",
  "_parseNumbers",
  "_parseFirstNumberGroup"
}
return TK.module.subfunctions(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._strings._batch_format" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = require("PackageToolkit").module
local L = T.import(..., "../_lists")
M.batch_format = function(format_template, variable_list)
  local aux
  aux = function(format_template, variable_list, accum)
    if #variable_list == 0 then
      return accum
    else
      local item = string.format(format_template, variable_list[1])
      return aux(format_template, (L.tail(variable_list)), (L.append(accum, item)))
    end
  end
  return aux(format_template, variable_list, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._strings._cart" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = require("PackageToolkit").module
local tail = (T.import(..., "../_lists/_tail")).tail
local cart2 = (T.import(..., "_cart2")).cart2
M.cart = function(...)
  local aux
  aux = function(list1, other_lists)
    if #other_lists == 0 then
      return list1
    else
      if type(other_lists[1]) ~= "table" then
        return aux(list1, { })
      end
      return aux((cart2(list1, other_lists[1])), (tail(other_lists)))
    end
  end
  local args = {
    ...
  }
  if type(args) ~= "table" then
    return { }
  end
  if #args == 0 then
    return { }
  end
  if type(args[1]) ~= "table" then
    return { }
  end
  if #args <= 1 then
    return args[1]
  end
  return aux(args[1], (tail(args)))
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._strings._cart2" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = require("PackageToolkit").module
local L = T.import(..., "../_lists")
local tail = L.tail
local append = L.append
M.cart2 = function(list1, list2)
  local aux
  aux = function(list1, list2, accum)
    if #list2 == 0 or #list1 == 0 then
      return accum
    elseif #list1 == 1 then
      return aux(list1, (tail(list2)), (append(accum, tostring(list1[1]) .. tostring(list2[1]))))
    else
      return aux((tail(list1)), list2, (aux({
        list1[1]
      }, list2, accum)))
    end
  end
  if type(list1) ~= "table" then
    return { }
  end
  if type(list2) ~= "table" then
    return { }
  end
  return aux(list1, list2, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._strings._join" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = require("PackageToolkit").module
local head = (T.import(..., "../_lists/_head")).head
local tail = (T.import(..., "../_lists/_tail")).tail
M.join = function(...)
  local args = {
    ...
  }
  local separator = head(args)
  local list = tail(args)
  local aux
  aux = function(list, accum)
    if #list == 0 then
      return accum
    else
      return aux((tail(list)), accum .. separator .. (tostring(head(list))))
    end
  end
  if #list == 0 then
    return ""
  end
  return aux((tail(list)), (tostring(head(list))))
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._strings._parseFirstNumberGroup" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = (require("PackageToolkit")).module
local split = (T.import(..., "_split")).split
local join = (T.import(..., "_join")).join
local tail = (T.import(..., "../_lists/_tail")).tail
local append = (T.import(..., "../_lists/_append")).append
M.parseFirstNumberGroup = function(arg_str, sep1, sep2)
  if arg_str == nil then
    arg_str = ""
  end
  if sep1 == nil then
    sep1 = ","
  end
  if sep2 == nil then
    sep2 = "%s"
  end
  local to_numbers
  to_numbers = function(xs)
    local _accum_0 = { }
    local _len_0 = 1
    for _index_0 = 1, #xs do
      local i = xs[_index_0]
      _accum_0[_len_0] = tonumber(i)
      _len_0 = _len_0 + 1
    end
    return _accum_0
  end
  if arg_str == "" then
    return { }, ""
  else
    local arg_groups = split(arg_str, sep1)
    if #arg_groups > 1 then
      return (to_numbers((split(arg_groups[1], sep2)))), join(sep1, unpack(tail(arg_groups)))
    else
      return (to_numbers((split(arg_groups[1], sep2)))), ""
    end
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._strings._parseNumbers" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = require("PackageToolkit").module
local split = (T.import(..., "_split")).split
local range = (T.import(..., "../_numeric/_range")).range
M.parseNumbers = function(arg_str, sep)
  if arg_str == nil then
    arg_str = ""
  end
  if sep == nil then
    sep = " "
  end
  local to_numbers
  to_numbers = function(xs)
    local _accum_0 = { }
    local _len_0 = 1
    for _index_0 = 1, #xs do
      local i = xs[_index_0]
      _accum_0[_len_0] = tonumber(i)
      _len_0 = _len_0 + 1
    end
    return _accum_0
  end
  return (to_numbers((split(arg_str, sep))))
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._strings._split" ] = function( ... ) local arg = _G.arg;
local M = { }
M.split = function(str, sep)
  if str == nil then
    str = ""
  end
  if sep == nil then
    sep = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. sep .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._table" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_keys",
  "_str",
  "_tcl"
}
return TK.module.subfunctions(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._table._keys" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = require("PackageToolkit").module
local concat = (T.import(..., "../_lists/_concat")).concat
M.keys = function(t)
  local strs = { }
  local numbers = { }
  local others = { }
  for k, v in pairs(t) do
    if type(k) == "number" then
      numbers[#numbers + 1] = k
    elseif type(k) == "string" then
      strs[#strs + 1] = k
    else
      others[#others + 1] = k
    end
  end
  table.sort(strs)
  return concat(numbers, strs, others)
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._table._str" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = require("PackageToolkit").module
local head = (T.import(..., "../_lists/_head")).head
local tail = (T.import(..., "../_lists/_tail")).tail
local append = (T.import(..., "../_lists/_append")).append
local get_keys = (T.import(..., "_keys")).keys
M.str = function(t, indent)
  if indent == nil then
    indent = "  "
  end
  local add_brackets
  add_brackets = function(s, prefix)
    return string.format("{\n%s%s%s\n%s}", prefix, indent, s, prefix)
  end
  local bracket
  bracket = function(obj)
    if type(obj) == "string" and string.match(obj, "%s") then
      return string.format("[%s]", obj)
    else
      return tostring(obj)
    end
  end
  local quote
  quote = function(obj)
    if type(obj) == "string" and string.match(obj, "%s") then
      return string.format("\"%s\"", obj)
    else
      return tostring(obj)
    end
  end
  local format_item
  format_item = function(k, v)
    if type(k) == "number" then
      return string.format("%s", v)
    else
      return string.format("%s = %s", (bracket((quote(k)))), v)
    end
  end
  local aux
  aux = function(dict, keys, accum, prefix)
    if #keys == 0 then
      local sep = string.format(",\n%s%s", prefix, indent)
      return add_brackets((table.concat(accum, sep)), prefix)
    else
      local k = head(keys)
      local v = ""
      if type(dict[k]) == "table" then
        v = aux(dict[k], (get_keys(dict[k])), { }, indent)
      else
        v = quote(dict[k])
      end
      local new_item = format_item(k, v)
      return aux(dict, (tail(keys)), (append(accum, new_item)), prefix)
    end
  end
  return aux(t, (get_keys(t)), { }, "")
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appFunctionalX._table._tcl" ] = function( ... ) local arg = _G.arg;
local M = { }
local T = require("PackageToolkit").module
local head = (T.import(..., "../_lists/_head")).head
local tail = (T.import(..., "../_lists/_tail")).tail
local append = (T.import(..., "../_lists/_append")).append
local get_keys = (T.import(..., "_keys")).keys
M.tcl = function(t, indent)
  if indent == nil then
    indent = "  "
  end
  local add_brackets
  add_brackets = function(s, prefix)
    return string.format("{\n%s%s%s\n%s}", prefix, indent, s, prefix)
  end
  local quote
  quote = function(obj)
    if type(obj) == "string" and string.match(obj, "%s") then
      return string.format("\"%s\"", obj)
    else
      return tostring(obj)
    end
  end
  local format_item
  format_item = function(k, v)
    if type(k) == "number" then
      return string.format("%s", v)
    else
      return string.format("%s %s", (quote(k)), v)
    end
  end
  local aux
  aux = function(dict, keys, accum, prefix)
    if #keys == 0 then
      local sep = string.format("\n%s%s", prefix, indent)
      return add_brackets((table.concat(accum, sep)), prefix)
    else
      local k = head(keys)
      local v = ""
      if type(dict[k]) == "table" then
        v = aux(dict[k], (get_keys(dict[k])), { }, indent)
      else
        v = quote(dict[k])
      end
      local new_item = format_item(k, v)
      return aux(dict, (tail(keys)), (append(accum, new_item)), prefix)
    end
  end
  return aux(t, (get_keys(t)), { }, "")
end
return M

end
end

end

package.path = package.path..";?/init.lua"
local M = require("appFunctionalX")
return M
end
end

do
local _ENV = _ENV
package.preload[ "ioLua" ] = function( ... ) local arg = _G.arg;


do

do
local _ENV = _ENV
package.preload[ "PackageToolkit" ] = function( ... ) local arg = _G.arg;


do

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._test._case" ] = function( ... ) local arg = _G.arg;
local M = { }
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local dashed_line = require(root1 .. "." .. "._ui._dashed_line").dashed_line
local equal_lists = require(root1 .. "." .. "._test._equal_lists").equal_lists
local table2str = require(root1 .. "." .. "._table._str").str
M.case = function(fn, inputs, solutions, msg)
  if msg == nil then
    msg = ""
  end
  print(dashed_line(80, '-'))
  print(msg)
  local results = {
    fn(unpack(inputs))
  }
  print("Results: ", (table2str(results)))
  print("Solutions: ", (table2str(solutions)))
  assert(equal_lists(results, solutions))
  print("VERIFIED!")
  print(dashed_line(80, '-'))
  return true
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module" ] = function( ... ) local arg = _G.arg;
local parent = ...
local members = {
  "root",
  "full_name",
  "remove_prefix",
  "require",
  "subfunctions",
  "submodules",
  "import",
  "initimport",
  "ipath",
  "path"
}
local M = { }
for _index_0 = 1, #members do
  local name = members[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._initimport" ] = function( ... ) local arg = _G.arg;
local M = { }
local __ = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(__, "."))[1]
local ipath = require(root1 .. "." .. "._module._ipath")["ipath"]
M.initimport = function(this_path, module_path)
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for initimport, i.e. initimport(..., 'a/b')", (string.format("Your input is: initimport(%s, %s)", me, module_path))))
  if this_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return (require((ipath(this_path, module_path))))
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._concat" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(me, "."))[1]
local concat2 = require(root1 .. "." .. "._lists._concat2").concat2
local tail = require(root1 .. "." .. "._lists._tail").tail
M.concat = function(...)
  local args = {
    ...
  }
  local aux
  aux = function(input, accum)
    if #input == 0 then
      return accum
    end
    return aux((tail(input)), (concat2(accum, input[1])))
  end
  return aux(args, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._full_name" ] = function( ... ) local arg = _G.arg;
local M = { }
M.full_name = function(parent, name)
  return string.format("%s.%s", parent, name)
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._remove_prefix" ] = function( ... ) local arg = _G.arg;
local M = { }
M.remove_prefix = function(str, symbol)
  if symbol == nil then
    symbol = "_"
  end
  local pattern = string.format("^%s+", symbol)
  return string.gsub(str, pattern, "")
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._test._equal_lists" ] = function( ... ) local arg = _G.arg;
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
local head = require(root1 .. "." .. "._lists._head")["head"]
local M = { }
M.equal_lists = function(list1, list2)
  local condition1 = (type(list1)) == 'table'
  local condition2 = (type(list2)) == 'table'
  if condition1 and not condition2 then
    return false
  end
  if condition2 and not condition1 then
    return false
  end
  if (not condition1) and (not condition2) then
    return (list1 == list2)
  end
  if #list1 ~= #list2 then
    return false
  end
  if #list1 == 0 and #list2 == 0 then
    return true
  end
  if M.equal_lists((head(list1)), (head(list2))) then
    return M.equal_lists((tail(list1)), (tail(list2)))
  else
    return false
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._tail" ] = function( ... ) local arg = _G.arg;
local M = { }
M.tail = function(list, start_index)
  if start_index == nil then
    start_index = 1
  end
  if (type(list)) ~= "table" then
    return { }
  end
  if #list <= 1 then
    return { }
  end
  local _accum_0 = { }
  local _len_0 = 1
  for i = (start_index + 1), #list do
    _accum_0[_len_0] = list[i]
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._lists" ] = function( ... ) local arg = _G.arg;
local parent = ...
local members = {
  "head",
  "tail",
  "merge"
}
local M = { }
for _index_0 = 1, #members do
  local name = members[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._module._ipath" ] = function( ... ) local arg = _G.arg;
local M = { }
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
M.ipath = function(this_path, module_path)
  local chop
  chop = function(path)
    if (string.match(path, "[/%.]")) == nil then
      return ""
    else
      return string.match(path, "(.-)[/%.]?[^%./]+$")
    end
  end
  local aux
  aux = function(args, prefix)
    if #args == 0 then
      return prefix
    else
      if args[1] == "." then
        return aux((tail(args)), prefix)
      elseif args[1] == ".." then
        return aux((tail(args)), (chop(prefix)))
      else
        if prefix == "" then
          return aux((tail(args)), args[1])
        else
          return aux((tail(args)), (string.format("%s.%s", prefix, args[1])))
        end
      end
    end
  end
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for ipath, i.e. ipath(..., 'a/b')", (string.format("Your input is: ipath(%s, %s)", this_path, module_path))))
  if this_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return (aux((split(module_path, "/")), this_path))
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._test" ] = function( ... ) local arg = _G.arg;
local parent = ...
local members = {
  "self",
  "equal_lists",
  "case"
}
local M = { }
for _index_0 = 1, #members do
  local name = members[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit" ] = function( ... ) local arg = _G.arg;
local parent = "core_PackageToolkit"
local submodule_names = {
  "lists",
  "strings",
  "module",
  "test",
  "ui"
}
local M = { }
for _index_0 = 1, #submodule_names do
  local name = submodule_names[_index_0]
  M[name] = require(parent .. "._" .. name)
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._append" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(me, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
M.append = function(list, ...)
  local items = {
    ...
  }
  if #items == 0 then
    return list
  end
  if (type(list)) ~= "table" and #items ~= 0 then
    return items
  end
  if (type(list)) == "table" and #items == 0 then
    return table
  end
  if (type(list)) ~= "table" and #items == 0 then
    return { }
  end
  local output
  do
    local _accum_0 = { }
    local _len_0 = 1
    for _index_0 = 1, #list do
      local x = list[_index_0]
      _accum_0[_len_0] = x
      _len_0 = _len_0 + 1
    end
    output = _accum_0
  end
  for _index_0 = 1, #items do
    local item = items[_index_0]
    output[#output + 1] = item
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._head" ] = function( ... ) local arg = _G.arg;
local M = { }
M.head = function(list)
  if (type(list)) ~= "table" then
    return nil
  end
  if #list == 0 then
    return nil
  end
  return list[1]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._import" ] = function( ... ) local arg = _G.arg;
local M = { }
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail").tail
local initimport = require(root1 .. "." .. "._module._initimport").initimport
M.import = function(current_module_path, module_path)
  local chop
  chop = function(path)
    if (string.match(path, "[/%.]")) == nil then
      return ""
    else
      return string.match(path, "(.-)[/%.]?[^%./]+$")
    end
  end
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for import, i.e. import(..., 'a/b')", (string.format("Your input is: import(%s, %s)", current_module_path, module_path))))
  if current_module_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return initimport(chop(current_module_path), module_path)
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._merge" ] = function( ... ) local arg = _G.arg;
local M = { }
M.merge = function(table1, table2)
  local condition1 = (type(table1)) == "table"
  local condition2 = (type(table2)) == "table"
  if (not condition1) and (not condition2) then
    return { }
  end
  if not condition2 then
    return table1
  end
  if not condition1 then
    return table2
  end
  local output = { }
  for k, v in pairs(table1) do
    if v ~= nil then
      output[k] = v
    end
  end
  for k, v in pairs(table2) do
    if v ~= nil then
      output[k] = v
    end
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._require" ] = function( ... ) local arg = _G.arg;
local M = { }
M.require = function(module_name, function_name)
  if function_name == nil then
    return require(module_name)[module_name]
  end
  return require(module_name)[function_name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._strings" ] = function( ... ) local arg = _G.arg;
local parent = ...
local members = {
  "split"
}
local M = { }
for _index_0 = 1, #members do
  local name = members[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._test._self" ] = function( ... ) local arg = _G.arg;
local M = { }
M.self = function(target_module)
  for name, test in pairs(target_module) do
    if test[name] == nil then
      print(string.format("ERROR HINT: %s() doesn't exist", name))
    end
    local result = test[name]()
    if result == false then
      return false
    end
  end
  return true
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._path" ] = function( ... ) local arg = _G.arg;
local M = { }
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(..., "."))[1]
local ipath = require(root1 .. "." .. "._module._ipath").ipath
M.path = function(current_module_path, module_path)
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for path, i.e. path(..., 'a/b')", (string.format("Your input is: path(%s, %s)", current_module_path, module_path))))
  local chop
  chop = function(path)
    if (string.match(path, "[/%.]")) == nil then
      return ""
    else
      return string.match(path, "(.-)[/%.]?[^%./]+$")
    end
  end
  if current_module_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return ipath(chop(current_module_path), module_path)
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._submodules" ] = function( ... ) local arg = _G.arg;
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local root2 = (split(parent, "."))[2]
local module_root = root1 .. "." .. root2
local get_full_name = require(module_root .. "._full_name")["full_name"]
local remove_prefix = require(module_root .. "._remove_prefix")["remove_prefix"]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
local merge = require(root1 .. "." .. "._lists._merge")["merge"]
local M = { }
M.submodules = function(parent_name, name_list)
  if (type(name_list)) ~= 'table' then
    return { }
  end
  local aux
  aux = function(name_list, accum)
    if #name_list == 0 then
      return accum
    else
      local raw_name = name_list[1]
      local bare_name = remove_prefix(raw_name, "_")
      local full_name = get_full_name(parent_name, raw_name)
      local m = (require(full_name))
      if m == nil then
        return error("ERROR: cannot import module " .. full_name)
      elseif (type(m)) == "boolean" then
        return error(string.format("ERROR HINT: module %s doesn't reutrn a module table", full_name))
      else
        return aux((tail(name_list)), (merge(accum, {
          [bare_name] = m
        })))
      end
    end
  end
  return aux(name_list, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._strings._split" ] = function( ... ) local arg = _G.arg;
local M = { }
M.split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._lists._head" ] = function( ... ) local arg = _G.arg;
local M = { }
M.head = function(list)
  if (type(list)) ~= "table" then
    return nil
  end
  if #list == 0 then
    return nil
  end
  return list[1]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._module._initimport" ] = function( ... ) local arg = _G.arg;
local M = { }
local __ = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(__, "."))[1]
local ipath = require(root1 .. "." .. "._module._ipath")["ipath"]
M.initimport = function(this_path, module_path)
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for initimport, i.e. initimport(..., 'a/b')", (string.format("Your input is: initimport(%s, %s)", me, module_path))))
  if this_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return (require((ipath(this_path, module_path))))
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._table._keys" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(me, "."))[1]
local concat = require(root1 .. "." .. "._lists._concat").concat
M.keys = function(t)
  local strs = { }
  local numbers = { }
  local others = { }
  for k, v in pairs(t) do
    if type(k) == "number" then
      numbers[#numbers + 1] = k
    elseif type(k) == "string" then
      strs[#strs + 1] = k
    else
      others[#others + 1] = k
    end
  end
  table.sort(strs)
  return concat(numbers, strs, others)
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._root" ] = function( ... ) local arg = _G.arg;
local M = { }
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
M.root = function(full_module_name)
  return (split(full_module_name, "."))[1] or ""
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._concat2" ] = function( ... ) local arg = _G.arg;
local M = { }
M.concat2 = function(list1, list2)
  local condition1 = (type(list1)) == "table"
  local condition2 = (type(list2)) == "table"
  if (not condition1) and (not condition2) then
    return { }
  end
  if not condition2 then
    return list1
  end
  if not condition1 then
    return list2
  end
  local output
  do
    local _accum_0 = { }
    local _len_0 = 1
    for i = 1, #list1 do
      _accum_0[_len_0] = list1[i]
      _len_0 = _len_0 + 1
    end
    output = _accum_0
  end
  for _index_0 = 1, #list2 do
    local item = list2[_index_0]
    output[#output + 1] = item
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._ui._dashed_line" ] = function( ... ) local arg = _G.arg;
local M = { }
M.dashed_line = function(n, symbol)
  if symbol == nil then
    symbol = "-"
  end
  local aux
  aux = function(n, symbol, accum)
    if n == 0 then
      return accum
    else
      return aux((n - 1), symbol, accum .. symbol)
    end
  end
  return aux(n, symbol, "")
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._ui" ] = function( ... ) local arg = _G.arg;
local parent = ...
local submodule_names = {
  "dashed_line"
}
local M = { }
for _index_0 = 1, #submodule_names do
  local name = submodule_names[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._ui._dashed_line" ] = function( ... ) local arg = _G.arg;
local M = { }
M.dashed_line = function(n, symbol)
  if symbol == nil then
    symbol = "-"
  end
  local aux
  aux = function(n, symbol, accum)
    if n == 0 then
      return accum
    else
      return aux((n - 1), symbol, accum .. symbol)
    end
  end
  return aux(n, symbol, "")
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._lists._tail" ] = function( ... ) local arg = _G.arg;
local M = { }
M.tail = function(list, start_index)
  if start_index == nil then
    start_index = 1
  end
  if (type(list)) ~= "table" then
    return { }
  end
  if #list <= 1 then
    return { }
  end
  local _accum_0 = { }
  local _len_0 = 1
  for i = (start_index + 1), #list do
    _accum_0[_len_0] = list[i]
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._test._equal_lists" ] = function( ... ) local arg = _G.arg;
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
local head = require(root1 .. "." .. "._lists._head")["head"]
local M = { }
M.equal_lists = function(list1, list2)
  local condition1 = (type(list1)) == 'table'
  local condition2 = (type(list2)) == 'table'
  if condition1 and not condition2 then
    return false
  end
  if condition2 and not condition1 then
    return false
  end
  if (not condition1) and (not condition2) then
    return (list1 == list2)
  end
  if #list1 ~= #list2 then
    return false
  end
  if #list1 == 0 and #list2 == 0 then
    return true
  end
  if M.equal_lists((head(list1)), (head(list2))) then
    return M.equal_lists((tail(list1)), (tail(list2)))
  else
    return false
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._subfunctions" ] = function( ... ) local arg = _G.arg;
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local root2 = (split(parent, "."))[2]
local module_root = root1 .. "." .. root2
local get_full_name = require(module_root .. "._full_name")["full_name"]
local remove_prefix = require(module_root .. "._remove_prefix")["remove_prefix"]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
local merge = require(root1 .. "." .. "._lists._merge")["merge"]
local M = { }
M.subfunctions = function(parent_name, name_list)
  if (type(name_list)) ~= 'table' then
    return { }
  end
  local aux
  aux = function(name_list, accum)
    if #name_list == 0 then
      return accum
    else
      local raw_name = name_list[1]
      local bare_name = remove_prefix(raw_name, "_")
      local full_name = get_full_name(parent_name, raw_name)
      local m = (require(full_name))
      if m == nil then
        return error("ERROR: cannot import module " .. full_name)
      elseif (type(m)) == "boolean" then
        return error(string.format("ERROR HINT: module %s doesn't reutrn a module table", full_name))
      else
        return aux((tail(name_list)), (merge(accum, {
          [bare_name] = m[bare_name]
        })))
      end
    end
  end
  return aux(name_list, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._lists._merge" ] = function( ... ) local arg = _G.arg;
local M = { }
M.merge = function(table1, table2)
  local condition1 = (type(table1)) == "table"
  local condition2 = (type(table2)) == "table"
  if (not condition1) and (not condition2) then
    return { }
  end
  if not condition2 then
    return table1
  end
  if not condition1 then
    return table2
  end
  local output = { }
  for k, v in pairs(table1) do
    if v ~= nil then
      output[k] = v
    end
  end
  for k, v in pairs(table2) do
    if v ~= nil then
      output[k] = v
    end
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._table._str" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(me, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail").tail
local head = require(root1 .. "." .. "._lists._head").head
local append = require(root1 .. "." .. "._lists._append").append
local get_keys = require(root1 .. "." .. "._table._keys").keys
M.str = function(t, indent)
  if indent == nil then
    indent = "  "
  end
  local add_brackets
  add_brackets = function(s, prefix)
    return string.format("{\n%s%s%s\n%s}", prefix, indent, s, prefix)
  end
  local bracket
  bracket = function(obj)
    if type(obj) == "string" and string.match(obj, "%s") then
      return string.format("[%s]", obj)
    else
      return tostring(obj)
    end
  end
  local quote
  quote = function(obj)
    if type(obj) == "string" and string.match(obj, "%s") then
      return string.format("\"%s\"", obj)
    else
      return tostring(obj)
    end
  end
  local format_item
  format_item = function(k, v)
    if type(k) == "number" then
      return string.format("%s", v)
    else
      return string.format("%s = %s", (bracket((quote(k)))), v)
    end
  end
  local aux
  aux = function(dict, keys, accum, prefix)
    if #keys == 0 then
      local sep = string.format(",\n%s%s", prefix, indent)
      return add_brackets((table.concat(accum, sep)), prefix)
    else
      local k = head(keys)
      local v = ""
      if type(dict[k]) == "table" then
        v = aux(dict[k], (get_keys(dict[k])), { }, indent)
      else
        v = quote(dict[k])
      end
      local new_item = format_item(k, v)
      return aux(dict, (tail(keys)), (append(accum, new_item)), prefix)
    end
  end
  return aux(t, (get_keys(t)), { }, "")
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._ipath" ] = function( ... ) local arg = _G.arg;
local M = { }
local parent = ...
local split
split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
local root1 = (split(parent, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
M.ipath = function(this_path, module_path)
  local chop
  chop = function(path)
    if (string.match(path, "[/%.]")) == nil then
      return ""
    else
      return string.match(path, "(.-)[/%.]?[^%./]+$")
    end
  end
  local aux
  aux = function(args, prefix)
    if #args == 0 then
      return prefix
    else
      if args[1] == "." then
        return aux((tail(args)), prefix)
      elseif args[1] == ".." then
        return aux((tail(args)), (chop(prefix)))
      else
        if prefix == "" then
          return aux((tail(args)), args[1])
        else
          return aux((tail(args)), (string.format("%s.%s", prefix, args[1])))
        end
      end
    end
  end
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for ipath, i.e. ipath(..., 'a/b')", (string.format("Your input is: ipath(%s, %s)", this_path, module_path))))
  if this_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return (aux((split(module_path, "/")), this_path))
  end
end
return M

end
end

end

package.path = package.path .. ";?/init.lua"
local M = require("core_PackageToolkit")
return M

end
end

do
local _ENV = _ENV
package.preload[ "appIoLua" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = "appIoLua"
local members = {
  "_text"
}
return TK.module.submodules(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "appIoLua._text" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_write",
  "_readall"
}
return TK.module.subfunctions(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "appIoLua._text._readall" ] = function( ... ) local arg = _G.arg;
local M = { }
M.readall = function(f_input)
  local IN = io.open(f_input, "r")
  io.input(IN)
  local content = io.read("*all")
  io.close(IN)
  return content
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "appIoLua._text._write" ] = function( ... ) local arg = _G.arg;
local M = { }
M.write = function(output, str)
  local OUT = io.open(output, "w")
  io.output(OUT)
  io.write(str)
  return io.close(OUT)
end
return M

end
end

end

package.path = package.path..";?/init.lua"
local M = require("appIoLua")
return M
end
end

end

package.path = package.path..";?/init.lua"
local M = require("appUmolflowFramework")
return M