TK = require "PackageToolkit"
M = {}
me = ...
name = "task"
members = {
    "run"
}
T = TK.module.submodules me, members
M[name] = () -> TK.test.self T
return M