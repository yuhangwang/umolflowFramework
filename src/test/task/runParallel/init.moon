M = {}
name = "runParallel"
U = require "umolflowFramework"
TK = require("PackageToolkit")

case = TK.test.case
M[name] = -> 
    fn = U.task.runParallel
    case fn, {((i)-> i), 3}, {{1,2,3}}, "task.runParallel case 1"
    case fn, {((i)-> i), 3, "1 2"}, {{1,2}}, "task.runParallel case 2"
    return true

return M