M = {}
FX = require "FunctionalX"
-- Run a task (function).
M.run = (fn_work, max_index, ...) ->
    accum = {}
    for i in *FX.numeric.indices(max_index, ...)
        accum[#accum+1] = fn_work i if i <= max_index

    return accum
return M