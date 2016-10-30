M = {}
name = "run"
U = require "umolflowFramework"
TK = require("PackageToolkit")

case = TK.test.case
M[name] = -> 
    fn = U.task.run
    case fn, {((i)-> i), 3}, {{1,2,3}}, "task.run case 1"
    case fn, {((i)-> i), 3, "1 2"}, {{1,2}}, "task.run case 2"
    return true

return M