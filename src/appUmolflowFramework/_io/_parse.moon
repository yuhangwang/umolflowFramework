-- Read inputs and return 
M = {}
FX = require "FunctionalX"
J  = require "dkjson"

M.parse = (json_str, keywords) ->

    if json_str == nil
        print "ERROR HINT: the input JSON argument string cannot be empty for umolflowFramework.io.parse()"
        print string.format '            The input argument string is "%s"', arg_str
        return {}, {}

    params = J.decode json_str, 1, {}

    -- Input error checking
    if params == nil
        print string.format 'ERROR HINT: the content of the input JSON string "%s" is invalid', json_str
        return {}, {} 
    elseif #params == 0 and #(FX.table.keys(params)) > 0
        print 'ERROR HINT: the top level of the input file must be a list'
        print "            i.e., everything must be inside top-level [] not {}"
        print string.format 'The content of your JSON string "%s" is:', json_str
        print (IO.text.readall json_str)
        return {}, {}
    else
        for i = 1, #params
            for k in *keywords
                if params[i][k] == nil
                    print string.format 'ERROR HINT: the "%s" field of record (%d) is invalid in input JSON string "%s"', 
                        k, i, json_str
                    return {}, {} 
    
    return params, {}

return M