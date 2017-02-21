M = {}
J = (require "lanes").configure()
IO = J.require "ioLua"
FX = J.require "FunctionalX"
JSON = J.require "dkjson"

-- Run a task (function).
M.runParallel = (fn_work, max_index, ...) ->
    work = J.gen("os", "table", "io", "string", {"required":{"dkjson"}}, fn_work)
    accum = {}
    for i in *FX.numeric.indices(max_index, ...)
        accum[#accum+1] = work i if i <= max_index

    return [a[1] for a in *accum]
return M