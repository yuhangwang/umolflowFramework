M = {}
name = "test_run"
U = require "umolflowFramework"
TK = require("PackageToolkit")

case = TK.test.case
M[name] = -> 
    fn = U.io.readin 
    case fn, {"input/in1.json"}, {{{k1:1, k2:2}}}, "io.readin case 1"
    return true

return M