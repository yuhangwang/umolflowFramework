-- Read inputs and return 
M = {}
FX = require "FunctionalX"
IO = require "ioLua"
J  = require "dkjson"

M.readin = (arg_str, keywords) ->
    args = FX.strings.split arg_str, ","
    param_file = args[1]
    optional_args = FX.lists.tail args

    if param_file == nil
        print "ERROR HINT: the input file cannot be empty for umolflowFramework.io.readin()"
        print string.format '            The input argument string is "%s"', arg_str
        return {}, {}

    params = J.decode (IO.text.readall param_file), 1, {}

    -- Input error checking
    if params == nil
        print string.format 'ERROR HINT: the content of input file "%s" is invalid', param_file
        return {}, {} 
    elseif #params == 0 and FX.table.keys(params) != 0
        print 'ERROR HINT: the top level of the input file must be a list'
        print string.format 'The content of your input file "%s" is:', param_file
        print (FX.table.str params)
        return {}, {}
    else
        for i = 1, #params
            for k in *keywords
                if params[i][k] == nil
                    print string.format 'ERROR HINT: the "%s" field of record (%d) is invalid in input file "%s"', 
                        k, i, param_file
                    return {}, {} 
    
    return params, optional_args

return M