TK = require "PackageToolkit"
M = {}
me = ...
name = "io"
members = {
    "readin"
}
T = TK.module.submodules me, members
M[name] = () -> TK.test.self T
return M