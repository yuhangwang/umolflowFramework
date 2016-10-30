-- just a dummy file for the sake of pacifying lua amalg
local M = {}
M.require = function() return {} end
M.configure = function() return {require = M.require} end
return M