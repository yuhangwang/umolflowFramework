-- Read inputs and return 
M = {}
FX = require "FunctionalX"
IO = require "ioLua"
J = require "dkjson"

M.readin = (arg_str) ->
    args = FX.strings.split arg_str, ","
    param_file = args[1]
    optional_args = FX.lists.tail args

    return {}, {} if param_file == nil

    params = J.decode (IO.text.readall param_file), 1, {}

    return {}, {} if params == nil
    
    for p in *params
        return {}, {} if p['output'] == nil or 
            p['input'] == nil or p['index'] == nil
    
    return params, optional_args

return M