M = {}
name = "parse"
U = require "umolflowFramework"
TK = require("PackageToolkit")

case = TK.test.case
M[name] = -> 
    fn = U.io.parse 
    case fn, {'[{"k1":1,"k2":2}]', {"k1", "k2"}}, {{{k1:1, k2:2}}, {}}, "io.parse case 1"
    return true

return M